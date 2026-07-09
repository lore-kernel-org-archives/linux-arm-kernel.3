Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLsOz0Axj25l+wvraALNIMv5XA28LGDsXUMLwaYR1e8=; b=oKIX+I8QwH2Y/AiNShHjPSXbHu
	Fj398bQPYQaXcHinWPHAWhClvK5OkdwdohD5RWT18+L29r5arhvLZdP9wPOYVrJhjJlZYGD9MfZdB
	fzPJZpICqffT/HH78liirBhwMQ+KzKsggC3bw5B9zHNcbxd0wQke+YB9PjUXqyQvXgfEGLdj1gXQh
	DuHyh56GKzW5DWyGekDojfasm+qCYmtzmFf+YcXZQkjrPL96hjstKzGP4KgyXMwqRg254RL3gLBFi
	RifHASZLzT+sDmfURo6GS5MFQzEOViCc218uGBkHobIItWfcIo9bJ7G85azZlHM60YO2UChWH6WoW
	tY4XwjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMw-00000003nzB-0RD8;
	Thu, 09 Jul 2026 22:37:22 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMr-00000003nwM-2IwN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:18 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6a0c02365c7so629524eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636636; x=1784241436; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLsOz0Axj25l+wvraALNIMv5XA28LGDsXUMLwaYR1e8=;
        b=G0J8Xx2Cc+I1x6U2M5OwDjRW3bIB/DPDPg61CRDbOnFuaYYEqJYNrWinb8Re7TE1aw
         BMK4v5aCmG/FLs+Dgvm7cwBHh61I1YJ2eFSAKScjbxuY82M71SCUMQNEEGCmZlD8slWY
         Vn9bLTpBIhYzrX7eVDx/Jlbezxf/cIgzE7hdwjlzBaIQYxi4qMgSACFwMgFf+6FW04TC
         /5KATsn++i+ff/HCfo6t/xFrFXF58qdL6tUMCeMWpqANKHlfLd+Jb9OQipkgpTnrNJcP
         3Vv9VA0ICSuFNIfAk8N7FblFGX4Pd8fOGmBLoLLR21ZquXiOqogal8Xr8mKXFbVGl+1v
         jrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636636; x=1784241436;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLsOz0Axj25l+wvraALNIMv5XA28LGDsXUMLwaYR1e8=;
        b=KlqMNED3nAb+4Jdm2cZDrtcZlPYmEjIAVKyqzPK1zdEkXmtqeysipoUFL/uFyi73Bl
         viRU7BO3+yBs6sFBx/spBB9F8+h9RpODBVpZVmCPSvxhFbHJCijOkvIMDxg3GA9JodUB
         XmHLpxpfmmvc8RVgXFoUtMC8VxrmnQc2mAdsgLiaM/KsHs5AjNTAnMoATWiKIdNmZPjk
         +eTXwiToK3DlzGKUeoJ6JSrq0h1tbZnkAikwUsdI5zp0eeohz0UtB9KgVyiZjBMBYTmf
         JAVQzbhOO7YInfwUekuzHA++apTwWtFyTR1pCIkjmMaQZyjscDaj+u2srNA7JIwLKB8r
         2JWA==
X-Forwarded-Encrypted: i=1; AFNElJ+7YM8MFhoVP0laB52beI0He16WeUsUXuXPKlx6v3mxOcdbwbq7vqfFa1N058Ji59qnxkeUYRamFNGSVgRHTZWe@lists.infradead.org
X-Gm-Message-State: AOJu0YwfqT0K1QibXyc79xp4de2g2xCJ/Nx67zT0sELPlPDPZG3f++UO
	+kHwKAKVPgBfuTyP2dIjH3ReUYZ36APU1C4Nb5GLfVGUNp2KTcojixpKucPfJ7vuC4/lqRNnmaA
	afe2n3LDl2W3yl8DjiG7NkVbSSg==
X-Received: from iobfq12.prod.google.com ([2002:a05:6602:66c:b0:9a4:e1b0:4d23])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:612:b0:6a1:3e91:dca6 with SMTP id 006d021491bc7-6a36d899d80mr6402785eaf.22.1783636635779;
 Thu, 09 Jul 2026 15:37:15 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:35:59 +0000
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260709223604.12934-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-3-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 2/6] arm64: Treat HCR_EL2.E2H as RES1 when
 ID_AA64MMFR4_EL1.E2H0 is negative
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
X-CRM114-CacheID: sfid-20260709_153717_599047_A1CAE53B 
X-CRM114-Status: GOOD (  12.42  )
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

[ Upstream commit 3944382fa6f22b54fd399632b1af92c28123979b ]

For CPUs that have ID_AA64MMFR4_EL1.E2H0 as negative, it is important
to avoid the boot path that sets HCR_EL2.E2H=0. Fortunately, we
already have this path to cope with fruity CPUs.

Tweak init_el2 to look at ID_AA64MMFR4_EL1.E2H0 first.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/20240122181344.258974-8-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
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
2.55.0.795.g602f6c329a-goog


