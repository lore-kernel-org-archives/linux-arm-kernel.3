Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE37C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPSpGPhYj+nCWbyX4YSYp8uqE5DTFDcur5HhjhyAr24=; b=08BBRE0z2tuyW/S7qKHrz/ON//
	X3n6/3kAJzzlxQO/oTHrhLQlm5SAMSz+C3FWvzrD/oX1Lyw7rSC2RvdHx5IdYaq2p7TfflQkZrkjT
	mNo+cQ3F0ZhcDCc46MPE1Li7yBhjhbuvqEc/o1SWaEck9MzgzDr1Q9X1ir4tYAYopic7ImH1805Pb
	/WKUXblDHJvF9X3DGkSjEUOjLl7XA8f1HasmGTs6U7tYKXE4WxvpFBBoo6CKUq0UJDSbdeGxtE2dK
	pFLiLKq5zqPDwz9Vi96WR05qXM8OKdXRwpSO1+nxYmWjgqqPRWbjIh54Anu7rgCwsJJ9G+PQiOsD3
	rW+5eouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7n-00000000YeP-33Aw;
	Wed, 08 Jul 2026 22:52:15 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7j-00000000Ybb-3iQO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:13 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6a313ec13ceso211710eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551130; x=1784155930; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPSpGPhYj+nCWbyX4YSYp8uqE5DTFDcur5HhjhyAr24=;
        b=XicBO+vnKzt6y4RKy07tmK0aQVgQpkSg1nORnqILdeYtTspzPNVX5Mz++X2A2Vyvny
         e+D8q4wJxxh2SE7HZVlutCGlD8b8P1VZv1D6DUo8K0N2tuCp5xfYhuMiUA36XnxUOsLq
         Ss/hFq8J4L8h8lEOLmKjA9dqjHEInlnW+QUOuaawmlW+inlb40Kumb83vSsE8+Tx5m0w
         08+IujE12iwD76ue9G92EdTp7Qxjq+iCC2aJesiTKQfInm0fgHbOiffKJXC0YB8Hrjef
         XF5ZV7TQAwsJTwwhaBqAmLfkvuw7HD90L8o9D9AE70dLrfAae0dkO6MA8E3vq3n/cpUt
         soSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551130; x=1784155930;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPSpGPhYj+nCWbyX4YSYp8uqE5DTFDcur5HhjhyAr24=;
        b=LVsH+fFa7ixQHm6UalC6yUHkHZQnZ7W7fIMl7gEv2VuGFzBrb+8XeLPDzCGbeRtQ7J
         t8uMkjM15xbaKu+0J0GTsbWZE+h083394MWf91hvDAux31nKrRqBSZ31C0MAVtt/AZPm
         6rxdBiHMU5oMoQJl46s2n1UYJUmpoBpmEAcDneFJfo0ek/kOyTTGWSbhEKx1D2AFuFIe
         3P/FkPsUWfRt71fQlk0QRXUi+IVePgtLjuXnEegIEdUr8vBs/rhjvOhRugEvZLO0Ijyd
         +6NGYv8QnG0dOOUPNPT7EjwSt27NAbEH1BZ8GMjK5duSf7ouynarsBNJ9crPB7VcClyx
         DuOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oYz6CDZRBAHjN4p80hK/baU0AdKxnSwdy9QtP/fMygGXAbB2qOlNAybQGIILNH9I+0BNqnfLHrvBma8RdASQU@lists.infradead.org
X-Gm-Message-State: AOJu0YydrY6uzI6C7GMWEMDO9OTQiAsLeNWj0SKM2pTeaEkDYwLEXqAW
	meq25x9Uszb/0QEo8bzlf/dfUjTdiBKHB68amDwfsd/WBUmEHCehMxukQhb3dG4WnpMM6ZCJjDh
	QKyf2ipEU5u7hW6cxNncCvu3RVg==
X-Received: from iobp6-n1.prod.google.com ([2002:a05:6602:8686:10b0:9a8:30d:4dd8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:202:b0:6a1:5acb:e954 with SMTP id 006d021491bc7-6a36d972ba9mr3178365eaf.19.1783551129511;
 Wed, 08 Jul 2026 15:52:09 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:20 +0000
In-Reply-To: <20260708225124.4130846-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260708225124.4130846-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-3-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 2/6] arm64: Treat HCR_EL2.E2H as RES1 when
 ID_AA64MMFR4_EL1.E2H0 is negative
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, dbrazdil@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_155211_932461_9056F49B 
X-CRM114-Status: GOOD (  13.52  )
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


