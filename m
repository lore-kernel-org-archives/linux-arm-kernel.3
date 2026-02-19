Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DE1C531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+I69E5IhZGiMGupjzpfzzAbiO3h/EQc8Tpfs/R7HAE=; b=MaD6rPojGQ21WDIAp2Go1Dwhsy
	PhaEEyoqz/2lENg7k7RQ9d7lMkmLYfTlw5mPseXsIXODwbWT2AKUbb+rzliZPbtQ056sGLDzeIrNr
	CsE8SDIQl4C8jSX2asqWoWqi8cT9tTVQujlwXHaXg7Hg8L2jNJYKOVFEZXEh3s5M25rBMRc0YNXPx
	UJU1V1aNMGFDJNDPVTYUUslSWiUPcFlgPVDzAwWp6V1SfwvdLhTyblLWLJkT9y9TLcal1hQXBGby8
	7zAeF5aYWue4XkcaeS6qsbLh2JhMRBWHLFcwlAi/57XXQXnFgfo6ZYEknRCQZJ22rww/7L+2qRE+Z
	LoJ6uVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7w-0000000BtGc-1QhK;
	Thu, 19 Feb 2026 19:55:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7o-0000000BtCC-3uQ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7854F44527;
	Thu, 19 Feb 2026 19:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3A1C4CEF7;
	Thu, 19 Feb 2026 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530948;
	bh=B/4MfKsHXqUtL+fq2XHySry95IjfcX/fGLKxwEHXGX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MCfQGXLVR5iE1NEpxF+q+9EBEF4Aps8IRGjF8KhBux0x+C9VyoPwG1IDtcObuS3CC
	 9ecMVjjc8qGJNJmnibSIayKrtWdyaGRkdxOoviLa/FOmrduudeN9Zqfkb6m2vFDIYN
	 ydifopW7+JhuvvhckFflvOnFT++6Pz5JaAo6e6uvA3mBMPNwm0Baecb9TzUZaK3KiD
	 o4kavT9ZpCyymZeO8gaxXLHX0CHoze3xU7xvhJkKGvLCUBPCg5xOqs3mYjWJSwaW+B
	 pdhAHnusaqIovGhQZnb8MchH3qqTpTz42cBwL0+F7ABT7DTzhSR8oZcm1n2Ipwe4aK
	 pE8yG8YyjkOgw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7l-0000000CGHL-25VV;
	Thu, 19 Feb 2026 19:55:45 +0000
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
Subject: [PATCH 1/9] arm64: Add logic to fully remove features from sanitised id registers
Date: Thu, 19 Feb 2026 19:55:24 +0000
Message-ID: <20260219195533.2455736-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219195533.2455736-1-maz@kernel.org>
References: <20260219195533.2455736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_115549_039926_7C8BDEEF 
X-CRM114-Status: GOOD (  18.94  )
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
 arch/arm64/include/asm/cpufeature.h | 15 ++++++++++-----
 arch/arm64/kernel/cpufeature.c      | 21 ++++++++++++++++-----
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cba..2731ea13c2c86 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -53,15 +53,20 @@ enum ftr_type {
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
+	enum ftr_visibility visibility;
 	bool		strict;	/* CPU Sanity check: strict matching required ? */
 	enum ftr_type	type;
 	u8		shift;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef95..b34a39967d111 100644
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
@@ -1057,17 +1057,28 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
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
+			val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
+			reg->user_val = arm64_ftr_set_value(ftrp,
+							    reg->user_val,
+							    ftrp->safe_val);
+			break;
+		case FTR_HIDDEN:
+			val = arm64_ftr_set_value(ftrp, val, ftr_new);
 			reg->user_val = arm64_ftr_set_value(ftrp,
 							    reg->user_val,
 							    ftrp->safe_val);
+			break;
+		}
 	}
 
 	val &= valid_mask;
-- 
2.47.3


