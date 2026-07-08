Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C571C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91/kfvMItbzWVK/DAFZhdWsgWZENE5O8NFb3fp/lN2Q=; b=Ow+r/2aXtg+kTfR3Wj0aEgiqoI
	mLwgtaw9QbxkQsbRB6jPKRTJPj+9NUA5ZH6wNBr8MHyQyIe/R/yVpknJSaC8+tO2V0QfLJq8iCAcN
	Yq0kaSsTAU2XT/Z+r+CjnVO1bYGy2efntbYQ2vWjnzBrJnhorU0/E8MiCSlyF20JajboglwmiZSSt
	GHCa4picLjhCgbk4XBDs44drU6Rx3vkQegy1wD8tGEFomRxPdtZtmfV5xnNT4LqOY37FbVxjfRO+F
	pHWx2qUxEkBdYLLOHuP6yi5MRAcJqO4dKIJFVUiWDMsH0nkKZJm72Dbh+1+tm/IW7tz48Nnm4uRNw
	wbvRGj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVa-0000000HNT0-1arN;
	Wed, 08 Jul 2026 14:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTVY-0000000HNRQ-0Bvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:44:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EE921CDD;
	Wed,  8 Jul 2026 07:44:10 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B75E3F7B4;
	Wed,  8 Jul 2026 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783521854; bh=hs/KT2Dmc859Gy+ccolk+2FJrdrfEunyTJEUFd36scM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t6so7CUlRotG4uuo5MemBPFunfXW7pEjn0FqwMJFlTBW1T9xunSDcYSXKHixtcM6r
	 6B08+bCDKjEFVmfRSZQvkDjbgOXm6oZ0m9uot2xhAVV7is6odhd5OOb7DiE/HAw5sJ
	 /LOgUfh73xcSvG3z/MSGB6bQnXBMb9gdyBebdGS4=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v2 4/6] arm64: sysreg: Add BBM_3
Date: Wed,  8 Jul 2026 20:13:29 +0530
Message-ID: <20260708144331.679816-5-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708144331.679816-1-linu.cherian@arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074416_129808_19C0B073 
X-CRM114-Status: UNSURE (   7.86  )
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

Add BBM_3 definition for ID_AA64MMFR1_EL1 register.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bc1788b1662b..082256ec3bf9 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
 	0b0000	0
 	0b0001	1
 	0b0010	2
+	0b0011	3
 EndEnum
 UnsignedEnum	51:48	TTL
 	0b0000	NI
-- 
2.43.0


