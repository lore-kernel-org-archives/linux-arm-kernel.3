Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A4DC44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVcT/XbiQLVXOFsg2iWKEGLEgGzJkv14kL5pzrUYsoQ=; b=zY/Uta1xwBen5M2ke3Hcr+VKPP
	QkDL54BUB0zjfke49dGyoKAPuYTrfwB3QRDmGWhL3AaBu/f4nTkkw5D4C0+prcmW9OtsWh0ZviPfq
	+cahmj7gwU7qtHg5lGh10n2j9FVGkM9HfGpFlB0ko/VqNQg9+ozQngemw+pMLyGT+YgmAGyMP8wax
	ud4Cp5c1kiZVQEBpuHpn7W7nRxMnFbMweA3fMWwe5eiAFYGlDOPFMnH4TxM+GTaaoyCzC5Xlztxxi
	8uYnDod7QBi+uR7CIdIV3Cd3L+k0lVl9hiXTZ3OTtDQQY9mGr4monCsqD1/8Eyi4xet5mOa4rBQ1O
	QcMBn6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7n-00000000Yeg-3lUp;
	Wed, 08 Jul 2026 22:52:15 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whb7k-00000000Ybv-1gFt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:52:13 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6a372a5be46so506726eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783551131; x=1784155931; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVcT/XbiQLVXOFsg2iWKEGLEgGzJkv14kL5pzrUYsoQ=;
        b=RobudH3NYcAZvPlGtUByxKupmiKFi0eRX7l8fe3JkiEjPR0OeQhRnjTcUvknn21nwC
         n0kNBeM10soKM1ORU/CdulCgpXUV0Qq5YS9/F9BCpft7BmQvs8UsAdQPcXghkI9t5ReO
         pVE7++lFsYi8qBiX/hgSAdHWK91NILv8lySpVdDuzuwpOQnF6BT8VjhVdb9LQqPguj9X
         22Bk9EiVU/ej8AVE5ZFmqqJx+dFzZhfe04WieRLPsIOwQs9aOBxLxizeGL0INJYjEdsc
         4+3Z/OQnHsp5ENEXn4GpNjoIwvd2D/uOP8rEg6iyB2B572yRSf5t329OnA8tojGTdcIa
         NWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551131; x=1784155931;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVcT/XbiQLVXOFsg2iWKEGLEgGzJkv14kL5pzrUYsoQ=;
        b=L1Rykm9MooLrtU5vvjRaJjROuIF+f8VGiSVEGgfXy3+eZ0kXl4aTvww/YyZmMizZUw
         uIVsoOME9P0q8s3b3zxE2vf43Tl+HDGkbvWxQwJE1Hmcq2ylYrjYqAZ81/6XyMwcbowu
         xoqXU0yG3H/JQq4k7mn4Zt02v6Z/t/EUWXqRvfBRmjAi+8nGz/csu4gYG995Y2K8Hxja
         Y7OtHcnQsH+iT0UD5GM7TOmfwsW4zWpdrHomz4MvO0jPWR+p8xR7ZZjINLUO4T7HwR9t
         +KKkbYAYA4bKR4vHvUwa7stkYQc6Wx98q1nv0zAXEXLX0VsgT+xTgHB66sI8hTM8wDGj
         u/eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m9nNQe4vCW29UOW2aBo6EkWHo4YM9tOuW8RC04/+7ZQn5+ooWNC/X4Zy3m7TeFFotd1Ngx8gCSHavdgS5Ze4Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx20Xh/tWGQ+BbfyJi+6VTBzZGKvEuVh9Tr8xgldFhpkag5oyUv
	RlTyuWUIWflIDNissC4n3LtYc7HTJx1zEaaTBTyou5J5vHOWr9s4HLxtBJjDhd3i2Z+uy88Y4E1
	ugeRpyBLPjvK3zGkGGj8o3Kabew==
X-Received: from ilov7.prod.google.com ([2002:a05:6e02:f87:b0:503:921d:b167])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:8c5:b0:69e:34f1:9690 with SMTP id 006d021491bc7-6a36da60d5emr3142261eaf.35.1783551130514;
 Wed, 08 Jul 2026 15:52:10 -0700 (PDT)
Date: Wed,  8 Jul 2026 22:51:21 +0000
In-Reply-To: <20260708225124.4130846-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260708225124.4130846-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708225124.4130846-4-coltonlewis@google.com>
Subject: [PATCH 6.6 v2 3/6] arm64: Fix early handling of FEAT_E2H0 not being implemented
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
X-CRM114-CacheID: sfid-20260708_155212_444755_D47A96B9 
X-CRM114-Status: GOOD (  15.96  )
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


