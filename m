Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B16CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Oqg2jmWRBjAh2WV6AjhblY7Vav6d+MBwoslphpK4mU=; b=ELwg1N5izsL8/tWp0CZT1/Wtq0
	MgcidsK0Jb05QHTqY2Lch9euCHgxsd8J5qDg311ZI/lkIc5mDc0AUXb9di5U1hwp2i7x1V0gMkbuj
	u4jdAK9O4obI1bfu4XWSMLMwS6mMEisKpe9Nmt3XCe4szs4mo/AgrN58drjzRGuGmeKiy9q9H7q6F
	mFzxjaf7fTiy+MH4tbz/E/2gLCJHEi7o3knUIaqn0+/+KwpvtUYxKl8Ar5u37c2ha17Evi9cRW4Av
	Rb2V1DBHm2tP7fLJ2TmSB8tf0NEjQ3kFgH12Msv2NfH0+VXdAboSZTcpu14LM8Pwe4XPqVKQYhdqc
	bHbvV79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunr-00000007jA1-42Rt;
	Tue, 11 Nov 2025 20:17:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunl-00000007j8i-1sb7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DDAF43D09;
	Tue, 11 Nov 2025 20:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F2C113D0;
	Tue, 11 Nov 2025 20:17:15 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Ensure PGD_SIZE is aligned to 64 bytes when PA_BITS = 52
Date: Tue, 11 Nov 2025 20:17:08 +0000
Message-ID: <176289222848.1642362.6364140142931460168.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251031071255.3335501-1-anshuman.khandual@arm.com>
References: <20251031071255.3335501-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121717_511547_13DF8D6C 
X-CRM114-Status: UNSURE (   6.04  )
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

On Fri, 31 Oct 2025 07:12:55 +0000, Anshuman Khandual wrote:
> Although the comment clearly states about PGD table's alignment requirement
> (when PA_BITS = 52) but the subsequent BUILD_BUG_ON() tests size comparison
> to 64 bytes instead. So change it as an actual alignment test.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Ensure PGD_SIZE is aligned to 64 bytes when PA_BITS = 52
      https://git.kernel.org/arm64/c/e2e21a9757b9

-- 
Catalin


