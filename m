Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F352CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7KZ3RxjtxRaqqE0zq/SU9yX3QFbzaDziBNMuFDjQsOI=; b=XlSzJXSymhsj59exoMSLC2npH3
	DO6+ySYNpGzkIAKhkwboT4x1LSNjoNx1dx3M7wNLEupBjixv9FQEirXHHkrbha6Q1BbC+aa6zvgrU
	iI12dsex2kwhOKfCbB+fCS1FRJErtBw6PhAeItD9s8hYGfc4Ik+wQUbR0Skv18yAer7SkXpIAzHtN
	ZQueAhWIRWM1IZe/kXuzaShvF0jOIakj1URS3cIdKMF8/Y5OHKqeztGP7Z/Ida0pXSP5P8pl2YUkD
	Lm18SbSvQDh1pNp5ao16aYfc8APXuwTwPHH4fBQPDixvpDCpEaA9U3YjDM3rIOKB8/MXYkEk5mHB1
	n3VOBuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KM-00000008C6b-0CLN;
	Wed, 12 Nov 2025 06:27:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KJ-00000008C6F-3t3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 06:27:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECAC51515;
	Tue, 11 Nov 2025 22:27:22 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E4473F5A1;
	Tue, 11 Nov 2025 22:27:27 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ryan.roberts@arm.com,
	rppt@kernel.org,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 0/2] arm64/mm: A fix and a documentation bit for change_memory_common()
Date: Wed, 12 Nov 2025 11:57:14 +0530
Message-Id: <20251112062716.64801-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_222732_004031_9F0D65CF 
X-CRM114-Status: UNSURE (   5.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The first patch is a fix to prevent suppression of error encountered during
linear map alias permission change. This is needed because the rodata=on
security measure requires us to proceed only if we first do the linear map
alias protection change.

The second patch documents why linear map split failure during the vfreeing
path isn't problematic.

Dev Jain (2):
  arm64/pageattr: Propagate return value from __change_memory_common
  arm64/mm: Document why linear map split failure upon vm_reset_perms is
    not problematic

 arch/arm64/mm/pageattr.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.30.2


