Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB445C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AjvuVF8fyTwbv6oztE1/KAVJWgMQ859sjHa58KoYHI=; b=g2QFdMLXUERuaphuhFOdETf7M5
	AmAN+8n/ajemKAPt6t9DZuYc8z+2gU5pIC7GloMok8cx/Km1NihhNH7pB3maIPLEJgnP5axUPmt1H
	XiAgNnJo8xz3CVFoJiMjGeIfHYE5JPEmf1881LF2drbtbx1JErEw+Hjq9930meeu/rDUGvNbdWjpH
	iNO2PMGftFmOTH2tBKi6pdXThyvbuX7JHrK1SfC8ILYqA/+m77B7sGlH4dbwV7axhKtFqg2L97VMV
	A5jIuwu2sE0D06HYOts6iSKALLyuHYDKdmuHV2I55CfgEFAS2ffhMH9JFXNB3vZMWbkd3lkQrm9bP
	Jii456iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPti-000000053xJ-25GC;
	Fri, 21 Feb 2025 10:04:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPaf-00000004zf3-0Hnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:45:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C594F1007;
	Fri, 21 Feb 2025 01:45:15 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02D033F59E;
	Fri, 21 Feb 2025 01:44:54 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64/mm/hotplug: Drop some redundant WARN_ON()
Date: Fri, 21 Feb 2025 15:14:47 +0530
Message-Id: <20250221094449.1188427-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014501_154913_0BCB315F 
X-CRM114-Status: UNSURE (   5.89  )
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

This series drops some redundant WARN_ON() tests which are not required any
more while unmapping and freeing up kernel page table pages during a memory
hot remove operation.

This series applies on v6.14-rc3

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
  arm64/mm/hotplug: Replace pxx_present() with pxx_valid()

 arch/arm64/mm/mmu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.30.2


