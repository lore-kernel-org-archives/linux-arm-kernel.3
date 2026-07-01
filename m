Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045BDC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wg29pCUTpKczjE5e4X1UMhkcqHVRIiR57OKtS+T144E=; b=PtTcpCzqrAK2OHSm59hELfLbyH
	bfu4Q48erc1f05DMpplfPSpnRKbMXvTBymMeB/9cwMdvtL22ccI1+6kVsA3bDDLINL/5gJA4Y+DiZ
	ECCo+zonRPRwaPmFgpQm4LSQFal2SeQZ9V0UiKhiXBE9e6MsSigqntdEc/f2UeMFgQcAgxnUre0l9
	mbyORYi3V9U+aRuq1xFNfi9g1i1RNXdbSJluJJ9CZXc7WxYB7lkNMsJCnon6Q0MuetiO3oAkpwVHT
	apjDrNk77Z3WHW99ljEEJspaPAtU1XEsqOYL/kz7ekE99uaNioyN1z8ESfBSNJyQDeF3Z/zzM43+9
	xQ3v1ieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mg-00000002zHo-2cHu;
	Wed, 01 Jul 2026 20:43:50 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1md-00000002zFR-3VlO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:49 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-48f0e5e664aso1535786b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938626; x=1783543426; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg29pCUTpKczjE5e4X1UMhkcqHVRIiR57OKtS+T144E=;
        b=K9xRRxRyOQClyExgdMmZ5QO7y9Q/T3WCjon4tyAztEa30eUiFEzBByU95au6DZsHkh
         mSV+8tVlH7rncVEDxNdvZQV/59hfdpwbZpGvMzBNfQzbJSBB5az/fdmVoUwKa6DHNgL6
         NjcA3ROy0Q78wt/3EqLBqwUoTZmMxNzQtjnCC8thE4cOX54FT8x7fv4CTozDnFflJBXH
         mUJv0+7GNZ5/Bu425EqUJ82egZqkul5D6xCyxmrmApQZwHCeIoRyGJ9g+GZAXZE2Udym
         Cigcfes4thjtEEK9/kqfRATTkvJjqtmmg2g7KPEJJzzOJQEtenwaF8oqERy45LhpTysp
         PNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938626; x=1783543426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg29pCUTpKczjE5e4X1UMhkcqHVRIiR57OKtS+T144E=;
        b=icTlzSDWbf41qs9COLdPeQGWeJEkkVJcfbZOlJs938XOyMCq8hoM0LYSg7DmFJflR1
         GbjqjF00RbvzuE1tA7WppEz0Xu9upkv1k35kWMlMOcc32zbkLR3IYs7bc3rbj1PUzff9
         +rzUSNWA+wb7jIjaHxomsSHuLZGw/2/5tRJVE360Cgg97Y1tmoFoljkNiWg4uXPLOnJw
         Xm2LKW8NknFum5m37pjZ6kpdAEWHN6cS1U9XaXDuEc6b7MG+9ZXBp3nk7XCJsEdyR7w2
         nwtX/oUxGe9A5Totbi+M4g6tatb3MibiEzzQ/PgmqgC2IJ5TdK8h4+Nv3ja6IR20HYX6
         s0DQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uqd6HEZRGa6U5Et+Ty0lEB4njQSxc6yB8sXjVf5l8v/gMiOb7T7W7baZ2AlbSTleTJcSPbaiZADHyj1Q0f8el@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1nIA3hgycZP+SquRhImFr8eo7AQEJF7y7KGieCBvtLOoSEJwX
	xIrJMPZke22dDAHINn8kKsZqTrKXcSUh7dbEkgK5XGcQt8umF6pLhRIVoKp7W1Ax236sRwRnw17
	4Ipl1JBa4gWHMtjpO1HCGEd+Vhg==
X-Received: from illu13.prod.google.com ([2002:a05:6e02:170d:b0:503:4fb5:5493])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:15a4:b0:48b:1e49:24a8 with SMTP id 5614622812f47-4962d75e616mr1411593b6e.11.1782938626032;
 Wed, 01 Jul 2026 13:43:46 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:40 +0000
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260701204342.2654385-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-4-coltonlewis@google.com>
Subject: [PATCH 3/5] arm64: Fix early handling of FEAT_E2H0 not being implemented
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134347_903132_6002E900 
X-CRM114-Status: GOOD (  16.01  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit b3320142f3db9b3f36a59bd9769ba249f06155b4 ]

Commit 3944382fa6f2 introduced checks for the FEAT_E2H0 not being
implemented. However, the check is absolutely wrong and makes a
point it testing a bit that is guaranteed to be zero.

On top of that, the detection happens way too late, after the
init_el2_state has done its job.

This went undetected because the HW this was tested on has E2H being
RAO/WI, and not RES1. However, the bug shows up when run as a nested
guest, where HCR_EL2.E2H is not necessarily set to 1. As a result,
booting the kernel in hVHE mode fails with timer accesses being
cought in a trap loop (which was fun to debug).

Fix the check for ID_AA64MMFR4_EL1.E2H0, and set the HCR_EL2.E2H bit
early so that it can be checked by the rest of the init sequence.

With this, hVHE works again in a NV environment that doesn't have
FEAT_E2H0.

Fixes: 3944382fa6f2 ("arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/20240321115414.3169115-1-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kernel/head.S | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index e32c8dd0b17a7..e0e710b36da37 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -576,6 +576,21 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	isb
 0:
 	mov_q	x0, HCR_HOST_NVHE_FLAGS
+
+	/*
+	 * Compliant CPUs advertise their VHE-onlyness with
+	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
+	 * RES1 in that case. Publish the E2H bit early so that
+	 * it can be picked up by the init_el2_state macro.
+	 *
+	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
+	 * don't advertise it (they predate this relaxation).
+	 */
+	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
+	tbz	x1, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
+
+	orr	x0, x0, #HCR_E2H
+1:
 	msr	hcr_el2, x0
 	isb
 
@@ -588,22 +603,10 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 
 	mov_q	x1, INIT_SCTLR_EL1_MMU_OFF
 
-	/*
-	 * Compliant CPUs advertise their VHE-onlyness with
-	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
-	 * RES1 in that case.
-	 *
-	 * Fruity CPUs seem to have HCR_EL2.E2H set to RES1, but
-	 * don't advertise it (they predate this relaxation).
-	 */
-	mrs_s	x0, SYS_ID_AA64MMFR4_EL1
-	ubfx	x0, x0, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
-	tbnz	x0, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
-
 	mrs	x0, hcr_el2
 	and	x0, x0, #HCR_E2H
 	cbz	x0, 2f
-1:
+
 	/* Set a sane SCTLR_EL1, the VHE way */
 	pre_disable_mmu_workaround
 	msr_s	SYS_SCTLR_EL12, x1
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


