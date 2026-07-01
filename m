Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1815C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzU5geEAdlGdzp5rSJKP+9OB0IsgaotJw1U5Q6pxjvc=; b=VUaO2kfP8vmX1TTDNocyVOCJBV
	FOAwYJynhjjA+z8vewM59nts1n0eCaF+ICBrSJ0uoyliLjGAjenRIEPeV4romp/rNyBT4+wPRVYhv
	MnPPyjKD5mBYx5qbhHbHYYzh2v3VlWe7jIN0SES2vMsEo39IbSvlq3mTjdh935Xkg7fDrzA0Te+me
	2Xc3YjXt7hG29JNnoFLFW2kVRFp57/+VRL08e0HqQ0YxW3ptInVjT9xCwwUhcfM0eUaKICmFQgRLy
	9he4R9LKS77wdfLTcwRgZyswUkn3ntk5/HVbSaMu5q9NqGxblDHZlfob341mGsVxyrcGYEwerxuI/
	PNsTZdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mg-00000002zHX-1zgJ;
	Wed, 01 Jul 2026 20:43:50 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mc-00000002zEx-3E3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:48 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-4909b046dabso1659244b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938625; x=1783543425; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzU5geEAdlGdzp5rSJKP+9OB0IsgaotJw1U5Q6pxjvc=;
        b=oE2Ab22b4d7sk6XVVI8e4IgRNGvV7H9zG+b1s7yuY97eABrkqNs+ivyuRkOuXlAMRM
         pd3ICpYOWrfmMWrAsgiCqg50Ub16yQ+qr3iSFraYsrGhACw4Z4ItPh2wiMRCZKO099J1
         84ZTwZM1vX5PIF/8s1VO3RaZuhBAzzEBxAwlEzgHECZYf5S1BLUNT3s+pJvCTLtFh/Zl
         HKEp0SKcKeGr4Y6Rsss1U1R9/zP4+td9eFCcX4XuO1/DVVpFFwOTllw/FuDs9RZpXQRg
         /rxkFToyFyDDzwqiYYnvUp3G5n5+WCP82dkAt47zvQd/V53eLnVN6bFmL8/49jHxTjc8
         FULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938625; x=1783543425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzU5geEAdlGdzp5rSJKP+9OB0IsgaotJw1U5Q6pxjvc=;
        b=Wr2sW1uttqxfOTfOor9FtJG4f1nyYJiBAYNBRRJCkkIiJVqAHvQs1gclYP3NT5UawZ
         ocJizfo5Prjkbm9w7VkekVpWr1rJNPiFqHRgdC312vdhVAMC7kFoEMXenjHMwfuzRaQQ
         tKnCjJB/mFU6AHj3gNuw3aCV5USBPiZ5yTiYFEXidgmkB4rBjh0IYGSidbjO9xoGa7pu
         CWiqxPLAWT/dd5Xte9Cl4zjtQiakmJoRHPkypR3q7g/t5bHGjGx//sVzREKNfLRLiw+x
         lBlN62Rx2zNSuMcz/jvzgdmFz4dqKFweQ1zNVv0FdDRMRmFcPvinSYoaTx9kwt1MCCXY
         JvPg==
X-Forwarded-Encrypted: i=1; AFNElJ+wezrhcWkmd1iK9qiU6TSOf+suRo5ZMyGLKa1jYA3aj1XjvnU0xsoMs1hwb1x0UNsV15cypByG227h3kxC5reJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1v2Vd6ItRpxzxepDD9YsdgNVr3e7IGBNG+LlnKTDoxPis1Sfx
	3+MvEWb8JyUHkbIz+/Rl8G81jDYAQf0gOuaGiTECP4iDAYFORB81MAMsmKYNR9WcFWAMWuiktk1
	6howKMbpqh9d4mR8TEz44kJuKSg==
X-Received: from iodr16-n1.prod.google.com ([2002:a05:6602:6c90:10b0:993:783e:f2bb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5088:b0:487:6930:d50 with SMTP id 5614622812f47-4960efba909mr1932765b6e.35.1782938625160;
 Wed, 01 Jul 2026 13:43:45 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:39 +0000
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260701204342.2654385-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-3-coltonlewis@google.com>
Subject: [PATCH 2/5] arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0
 is negative
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
X-CRM114-CacheID: sfid-20260701_134346_812812_FF63CEE1 
X-CRM114-Status: GOOD (  13.25  )
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

[ Upstream commit 3944382fa6f22b54bc3624c9657b98ec34b5ba59 ]

For CPUs that have ID_AA64MMFR4_EL1.E2H0 as negative, it is important
to avoid the boot path that sets HCR_EL2.E2H=0. Fortunately, we
already have this path to cope with fruity CPUs.

Tweak init_el2 to look at ID_AA64MMFR4_EL1.E2H0 first.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/20240122181344.258974-8-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kernel/head.S | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 6517bf2644a08..e32c8dd0b17a7 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -589,25 +589,32 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	mov_q	x1, INIT_SCTLR_EL1_MMU_OFF
 
 	/*
-	 * Fruity CPUs seem to have HCR_EL2.E2H set to RES1,
-	 * making it impossible to start in nVHE mode. Is that
-	 * compliant with the architecture? Absolutely not!
+	 * Compliant CPUs advertise their VHE-onlyness with
+	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
+	 * RES1 in that case.
+	 *
+	 * Fruity CPUs seem to have HCR_EL2.E2H set to RES1, but
+	 * don't advertise it (they predate this relaxation).
 	 */
+	mrs_s	x0, SYS_ID_AA64MMFR4_EL1
+	ubfx	x0, x0, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
+	tbnz	x0, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
+
 	mrs	x0, hcr_el2
 	and	x0, x0, #HCR_E2H
-	cbz	x0, 1f
-
+	cbz	x0, 2f
+1:
 	/* Set a sane SCTLR_EL1, the VHE way */
 	pre_disable_mmu_workaround
 	msr_s	SYS_SCTLR_EL12, x1
 	mov	x2, #BOOT_CPU_FLAG_E2H
-	b	2f
+	b	3f
 
-1:
+2:
 	pre_disable_mmu_workaround
 	msr	sctlr_el1, x1
 	mov	x2, xzr
-2:
+3:
 	__init_el2_nvhe_prepare_eret
 
 	mov	w0, #BOOT_CPU_MODE_EL2
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


