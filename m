Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71858D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+7bFtcEb2+lTGlDFKESTq1he0ygR8MVr8w399BwZss=; b=WKLET7IXDKaE5eJOHbVTWYGm1/
	EN6QP7BMUMShNE7BydoDpw7vaqfIEoKPLKCpi/a3EOkMlFgj1a9TM569VjTV8pGR3PDCEGCIYNOcb
	ARnRvdlO3APYavG+THioBhRORALcw/2PS4kLm1axkC5fDeJ7YL1aeh4M88yvu8ho+sSEH6xYr+ry6
	qj6tWID5wlslf2YHKYGbPtt/IjSz73Yus8lX34zgedRs48xZoFXFs6Efu/JaHKFs2mNlZh8fAsFoZ
	UwVRvx3C6+UPz2vxp6e7ZZvBKMkYn5N48EHa1LzsqSf58KniL6UDWBV2zmtz9yxgLHDIhX5fwwW0q
	4/O8zYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7tk-00000006YPt-1v18;
	Mon, 02 Dec 2024 14:59:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7ro-00000006Y0U-23J2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0519D5C65BB;
	Mon,  2 Dec 2024 14:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1123EC4CED2;
	Mon,  2 Dec 2024 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733151459;
	bh=/q9qg/7umb9fsixRbVDAjS3WEvnkbejQvtUF9pOBZgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oS3x906Xs6avfaeoX93340gMScSzMtJej4rxJkotCvHBZjTl9m0pfG54weeiYq+jv
	 cQbstGy/2JkyfS223da225O9zyn2rTfKxVXEFC04JrQm0e4QNqH3kXdZ79nHbtvRJn
	 eK/qNcZfmko0Mu8RqRFPBpX3VDRCH/Fgio2Kb54NIxcE+1/8pmKIBkUUPxGRF5HEru
	 yyhpHTBxzviuDQUuQ77b5e6LmMGtYUy0vSvcIsUnK9Jp4iv73gPsXNMSJzFUZXd/bQ
	 s3Y9t1Jl/WLvbR0RG3RK04QYOw16PGeiFqnOFuUkvSIr6uZmOfurwJPHKY9/BZcRo1
	 sCSZ9fuo3tsJg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Keir Fraser <keirf@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 1/2] drivers/virt: pkvm: Don't fail ioremap() call if MMIO_GUARD fails
Date: Mon,  2 Dec 2024 14:57:29 +0000
Message-Id: <20241202145731.6422-2-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202145731.6422-1-will@kernel.org>
References: <20241202145731.6422-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_065740_566842_FC7C7A90 
X-CRM114-Status: GOOD (  10.79  )
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

Calling the MMIO_GUARD hypercall from guests which have not been
enrolled (e.g. because they are running without pvmfw) results in
-EINVAL being returned. In this case, MMIO_GUARD is not active
and so we can simply proceed with the normal ioremap() routine.

Don't fail ioremap() if MMIO_GUARD fails; instead WARN_ON_ONCE()
to highlight that the pvm environment is slightly wonky.

Fixes: 0f1269495800 ("drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercal")
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 56a3859dda8a..4230b817a80b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -87,12 +87,8 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
-		int err;
-
-		err = arm_smccc_do_one_page(func_id, phys);
-		if (err)
-			return err;
 
+		WARN_ON_ONCE(arm_smccc_do_one_page(func_id, phys));
 		phys += PAGE_SIZE;
 	}
 
-- 
2.47.0.338.g60cca15819-goog


