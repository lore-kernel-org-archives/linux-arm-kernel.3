Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F42C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78osRNk8qRzph/366BzOmfMhZhXhz27WDl9JWZTx3ao=; b=0Rcnmgd3neF1KUT2TWrfOCRYjv
	p6wr4F4Xx6MNPpeh+pD+0GgiHOg2iCEWXvr3bG4PRU2IaqGR+uIqfslcGxthf4r2iJ7l4RfdJJC54
	QBLDlHgDDPPlFobN3l5+3XG1LlWz8kaZpCDUV66jacmmeqrPGlIWvb6io68td1BrMqGUmqBZHHiON
	h2NsEa5aSU5bWVlbkT/KBnfU66i7yoOjmzHutJSyGLhYzIjyIYR9HLTKRkXsLQDTRPvy6My1pzUTd
	jQRJlipfXNc+eoC+WZjn3go2xTSfS9tLm+YQbhEjycC9gTXrv1KvlPQgQJ0NSmaLeqib5Ih6dKveE
	i0GdcT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMw-00000003nzt-1xNJ;
	Thu, 09 Jul 2026 22:37:22 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMs-00000003nwY-2D17
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:20 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-487059fb570so484545b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636637; x=1784241437; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78osRNk8qRzph/366BzOmfMhZhXhz27WDl9JWZTx3ao=;
        b=KjjbM9xv2kyJ+1D2pR6kxOnZ3TiA8cw+OuQZDzOTc6e8mxn/iszvdW+wuYp/iUPT0d
         Y3sgsYi7w2Le9wduGbZ16quTxHQ23SiBLRmCq549zcWor+q3MWxSbC9fuE/T0j/gd5JJ
         uQFIqThCJhZOvmgzaVdBekLGR+1iMzaJS6QBJpn4uYnDGYCqJDyOahX7wh6Hr93EHN7I
         RsE5fjvQsDQTfhLXKi997qmiITmIh5bma9PSUNmiySC4ZzG69ESzF0wZefGp4pYHIYc2
         Ykxdl4wKiTEhdanfhRNzOqDKs6EJEEXRmaHkGaLv4TWnxXDgkXWDtoRd6bF/Blh26wDy
         7edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636637; x=1784241437;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78osRNk8qRzph/366BzOmfMhZhXhz27WDl9JWZTx3ao=;
        b=Rpv85380yY93fsxfwYeO28EBxf4LhXHYY9nO3k+jFokx4sGxKFA1sbfEo9ZrNQCs9f
         9bbS8GJ4I5S7DLxDHV1m6uH4tjq7LH5DHnKBOqtwTxfwj8427fX/yWokT5F+NOEtazaW
         L1uSsHu8yHOtIUQYjBunOEnF776xrIul/14JObCxJgA5PfAm+TjYUbjfv085ONCjqlq+
         mIx6vEFI3bsLSAGx5++xTL+FjmOAZnBl3FyuqhbP/zBXUKf4m5IO2NK8F36pTvqdCDB6
         dwy5zkkCnuM2DcnUF5NC97/x92Y6D6mhhGkceqjxEX4JvQeVoaYOH0QviFLuXwXiJj3n
         Ormg==
X-Forwarded-Encrypted: i=1; AFNElJ9CccTtmzGx8Lc5Zc4jEM85ukjA246Qku/3/8kuEoT18u402aYEs/nn3iyfhd1wEnQYfYJW5UR4r0WENgU77Y14@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqgqo+E1H/5GCn4HMh8nbhkLm1a3PcqadCwpzz9GE4UKE0XqYp
	jhOUGT2xi1LsPE2/PJ8EHKYlz3vAzaiBavVA91cnROxpKWtXtA1lLdiLpl7afrDLNW0UoBwA2t/
	z3PM9hprHkXIOnp4USRMNpoaAhw==
X-Received: from ilbcl1.prod.google.com ([2002:a05:6e02:3781:b0:503:6571:319a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:250c:b0:495:f74a:5bed with SMTP id 5614622812f47-4a203fc3ef9mr7510176b6e.28.1783636636840;
 Thu, 09 Jul 2026 15:37:16 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:36:00 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-4-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 3/6] arm64: Fix early handling of FEAT_E2H0 not being implemented
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_153718_598181_0CC56D3D 
X-CRM114-Status: GOOD (  14.84  )
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

[ Upstream commit b3320142f3db9b3f2a23460abd3e22292e1530a5 ]

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
Signed-off-by: Colton Lewis <coltonlewis@google.com>
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
2.55.0.795.g602f6c329a-goog


