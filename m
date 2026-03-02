Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B4E9B370
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRm0sY3g0eiO8x3rom+7UoUOQeAV2m4TfT7+tI+G9h0=; b=i5ym6i5TAoIxwdi7xBlN97KnOm
	yw3NQL5WC0SjCw+4GMFUfXk7T0+2utZZQ4KDGr/0ec+FdfGF6B+DeLqJoqE4Dy61EguFNiD0NAVni
	yA1jvPlp4/w7+PwEYwM23d5Nkq6+kIzJnMl0VpIWlkG754NTEvUcufdHOtTpsz14LKFVu31Vs0FHR
	NUBM6CtGQGiB09FkDOMt5u1WHlxaHexPs3KV6XL3j75SghiTZ6o3D6ZPxt73n9oZ2JonEXbaWlLf0
	t97JjmMkhQaG7mpyApVgbBxtwtIo8uqPLVcrn5/Ux6lhp03VdyTQFuI/tbgff4xf60FOpRt4kGsCF
	BVik2jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tp-0000000CsOp-0x3H;
	Mon, 02 Mar 2026 11:57:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tk-0000000CsIT-2IxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C46C84456C;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DE4C2BC87;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452635;
	bh=4BWIaove3Gt4mRqnBRiYa4EXad2vYRKWzbMoXG6iXAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJbhqqyfTq1lGiOpt+5xwRuFRwuOP+KYqJW0B7rNaeDXYsikHo1t5k1Gt1sUvx2be
	 /Hf8OUXrcqmPC0rYJRIMKvLdZNc7UD8B0TYq6CJ8T2a4b5Tk+LRTWu5Q+fMN4ry8aN
	 /PEyBn7K8pl3tB/bq73Cuo9ko3YQmTVGL98SPb8yI2R1YwhImAbDaJ9CJoKWVDQqvP
	 +lF+hWhXyKFT3RqboXtSA40ChLBqljXsdpSbNtBIoV+t6kRHw29QqY9G/IbHT08E8y
	 lWQVOD9sEZarwqFhFEp02VT8mC3U0njsl5s6Hf/YBKUH16k/IwoKS66VlxiCRNGeUh
	 Mi20pw8ruRN+A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1th-0000000FDFJ-2CmD;
	Mon, 02 Mar 2026 11:57:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 03/11] arm64: Add logic to fully remove features from sanitised id registers
Date: Mon,  2 Mar 2026 11:56:44 +0000
Message-ID: <20260302115653.1517326-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
References: <20260302115653.1517326-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035716_650970_8E9CB8F2 
X-CRM114-Status: GOOD (  21.37  )
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

We currently make support for some features such as Pointer Auth,
SVE or S1POE a compile time decision.

However, while we hide that feature from userspace when such support
is disabled, we still leave the value provided by the HW visible to
the rest of the kernel, including KVM.

This has the potential to result in ugly state leakage, as half of
the kernel knows about the feature, and the other doesn't.

Short of completely banning such compilation options and restore
universal knowledge, introduce the possibility to fully remove such
knowledge from the sanitised id registers.

This has more or less the same effect as the idreg override that
a user can pass on the command-line, only defined at build-time.

For that purpose, we provide a new macro (FTR_CONFIG()) that defines
the behaviour of a feature, both when enabled and disabled.

At this stage, nothing is making use of this anti-feature.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/cpufeature.h | 17 +++++++++------
 arch/arm64/kernel/cpufeature.c      | 32 ++++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cba..e853a0ac7db38 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -53,17 +53,22 @@ enum ftr_type {
 #define FTR_SIGNED	true	/* Value should be treated as signed */
 #define FTR_UNSIGNED	false	/* Value should be treated as unsigned */
 
-#define FTR_VISIBLE	true	/* Feature visible to the user space */
-#define FTR_HIDDEN	false	/* Feature is hidden from the user */
+enum ftr_visibility {
+	FTR_HIDDEN,		/* Feature hidden from the user */
+	FTR_ALL_HIDDEN,		/* Feature hidden from kernel, user and KVM */
+	FTR_VISIBLE,		/* Feature visible to all observers */
+};
+
+#define FTR_CONFIG(c, e, d)				\
+	(IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
 
-#define FTR_VISIBLE_IF_IS_ENABLED(config)		\
-	(IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
+#define FTR_VISIBLE_IF_IS_ENABLED(c)	FTR_CONFIG(c, VISIBLE, HIDDEN)
 
 struct arm64_ftr_bits {
 	bool		sign;	/* Value is signed ? */
-	bool		visible;
+	enum ftr_visibility visibility:8;
 	bool		strict;	/* CPU Sanity check: strict matching required ? */
-	enum ftr_type	type;
+	enum ftr_type	type:8;
 	u8		shift;
 	u8		width;
 	s64		safe_val; /* safe value for FTR_EXACT features */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 102c5bac4d502..965dd2acf0640 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -192,7 +192,7 @@ void dump_cpu_features(void)
 #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
 	{						\
 		.sign = SIGNED,				\
-		.visible = VISIBLE,			\
+		.visibility = VISIBLE,			\
 		.strict = STRICT,			\
 		.type = TYPE,				\
 		.shift = SHIFT,				\
@@ -1063,16 +1063,33 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
 				ftrp->shift);
 		}
 
-		val = arm64_ftr_set_value(ftrp, val, ftr_new);
-
 		valid_mask |= ftr_mask;
 		if (!ftrp->strict)
 			strict_mask &= ~ftr_mask;
-		if (ftrp->visible)
+
+		switch (ftrp->visibility) {
+		case FTR_VISIBLE:
+			val = arm64_ftr_set_value(ftrp, val, ftr_new);
 			user_mask |= ftr_mask;
-		else
+			break;
+		case FTR_ALL_HIDDEN:
+			/*
+			 * ALL_HIDDEN and HIGHER_SAFE are incompatible.
+			 * Only hide from userspace, and log the oddity.
+			 */
+			if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))
+				val = arm64_ftr_set_value(ftrp, val, ftr_new);
+			else
+				val = arm64_ftr_set_safe_value(ftrp, val);
 			reg->user_val = arm64_ftr_set_safe_value(ftrp,
 								 reg->user_val);
+			break;
+		case FTR_HIDDEN:
+			val = arm64_ftr_set_value(ftrp, val, ftr_new);
+			reg->user_val = arm64_ftr_set_safe_value(ftrp,
+								 reg->user_val);
+			break;
+		}
 	}
 
 	val &= valid_mask;
@@ -1230,9 +1247,10 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
 
 		/*
 		 * Don't alter the initial value that has been forced
-		 * by an override.
+		 * by an override or a disabled feature.
 		 */
-		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
+		if (ftrp->visibility == FTR_ALL_HIDDEN ||
+		    (reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
 			continue;
 
 		if (ftr_cur == ftr_new)
-- 
2.47.3


