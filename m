Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BDDCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ozzRAdvZp4aTU6VJQz375fyyvpAYZ+n17H++cGS5mc=; b=NDOH1HONrpndgCrcwdjB8kw+dT
	aEesBiQGX9xW/gO+/hYEGGZk7QP0saeDZQvgxeQdrNdWjc4iNwJTpRbwODmrenZMJd0GcBtYwbTOB
	E6mYDgDEvXY9nQIZDNEQgoEysP4EPQMTRsTXq4C36NcxAhGpzYs29gz1Z5s0zLsgyUApIrV/Y+QHu
	WNUM1t5NXapqF2m2+Lp9pBdLl5c78TBuRJyaLOt4K3x399dJ8+Fbb1u4rlv32jXvKYzZd4AMHiIJ1
	crIzyPO5KL/0ptRDiKx1z5xKLEVYQbnTwKD5O+DS12V6cLxOAkfMzW27bYGk/jNA1McVrIIgILAJr
	fU1onaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZt-0000000Dn7j-1tCT;
	Mon, 27 Oct 2025 11:39:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZk-0000000Dn28-1gek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:39:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so16598625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761565186; x=1762169986; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ozzRAdvZp4aTU6VJQz375fyyvpAYZ+n17H++cGS5mc=;
        b=yOfU4rUo3L6hJOMmCMVw5530TeOesuLrn7xz0RnXHIYxmDR2nfrbdxVnvv76ZwOalH
         dElNzrZd2b//E32a5BXRKtmfVFW4aaI1pplSzd2znHCCIZ5yMAoM/fvrEiXlevGFL8Jd
         zm33azg+6+QHo4hCGy0Aqixa1bx2YO6tzCKWo2+PNSCJTZX/FA7eHuMgAISuZVxm3Ja4
         U85+pAPqRYH/g9Pbp37TvPQPCQAjNP4yQnRzyujC3Mez17YNW8AGXGJyR+QQiM5fkKbz
         rotQS4hoEFBPC5FdC9M2KrASvheTOu/dTiIPFcPpt68hZRXnQUMT9+HrzdjhJYBl6yqN
         Vuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565186; x=1762169986;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ozzRAdvZp4aTU6VJQz375fyyvpAYZ+n17H++cGS5mc=;
        b=a7ljxuCYPWMTda3k2Y0v6X3asbaJ8PkHjvZ2QlQi5aL4Q5ndW8HavkzB7vBfzkjLV7
         pQlbANAjzYJuA6BBuhMIO12g4SV1905qIhe6GFeoZO/hDbeTZcGY24+kRp2fEx2iDvWh
         r7x+veOflcXewDM0lhkBUSl8nFENquMRMhRbcgo2/ZlX0f72OdZyiw418S+W4diGce6+
         MRZjOEwUZk7kumy1poYXpOVpAbHSZT5AuGKV+qqAGWpF7J/cOGTUfgAGjgEND0x0kXHC
         QaAzNE/Y+xhz0z6TdpDWwanfM35zfrUCvTWloMYet7enXe8e8mt7Zpl4acfolpVbN04g
         9SDA==
X-Forwarded-Encrypted: i=1; AJvYcCUJFA5FSgt3+E1b3ZLYvLUL09e58xmL7D9rGCQ5IN+LEgvvBjXr8BXvNlf91cTzVRhPoIVbteYTwpDi/yB0vtLq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1y/lIVWw/r3s1glPcFVGeDsNTClLWSMHZJoRx1XCHkEnY4P3L
	6H7cRlOBJ2k/SRJTY4FoTsyRcT6oIKv65iNYJHoH6nARbm0Fqlbr2K0FVZ5TtD4+iog4xb1sV6x
	Zbg==
X-Google-Smtp-Source: AGHT+IF5QHgUQNJTKSQK9WbcSKrTjNjq/NfGqYHOtYzl4gUqkfeIRIWhUH4rgAEh4vdNAHpfjVISCm2K/A==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:475:de6a:c2eb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:41ee:b0:476:84e9:b55a
 with SMTP id 5b1f17b1804b1-47684e9bfbdmr45223985e9.12.1761565186463; Mon, 27
 Oct 2025 04:39:46 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:39:41 +0000
In-Reply-To: <20251027113943.1282568-1-tabba@google.com>
Mime-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027113943.1282568-3-tabba@google.com>
Subject: [PATCH v1 2/4] KVM: arm64: Add compile-time type check for register
 in __vcpu_assign_sys_reg()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043948_470241_880221D9 
X-CRM114-Status: GOOD (  16.56  )
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

The 'r' (register) and 'val' (value) parameters in
__vcpu_assign_sys_reg() can be easily transposed. The register ID is an
enum, whereas the value is a u64. This has led to bugs in the past, and
the risk was increased by the historically inconsistent parameter
ordering of the vcpu_write_sys_reg() function.

To prevent this class of bugs, add a compile-time type compatibility check
to prevent the 'r' parameter from having a 'u64' type.

This directly catches the erroneous transposition (passing the 'u64'
value as 'r') while remaining flexible, as it does not force 'r' to
be a specific enum type.

This patch also updates several local variables in
arch/arm64/kvm/pmu-emul.c from 'u64' to 'enum vcpu_sysreg' to fix
build failures caused by the new check.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
NOTE: In practice, 'enum vcpu_sysreg' cannot grow to become compatabile
with u64 since we are limited by the size of arrays that index sysregs.
If it does grow, other compile-time issues show up before this check
becomes an issue.

I verified that this would catch the bug that commit 798eb5978700
("KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef
exception") introduced, which was fixed later.
---
 arch/arm64/include/asm/kvm_host.h | 17 +++++++++--------
 arch/arm64/kvm/pmu-emul.c         |  7 ++++---
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1b8a420f9add..2c33ea5fdb1c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1136,14 +1136,15 @@ static inline u64 *___ctxt_sys_reg(const struct kvm_cpu_context *ctxt, int r)
 
 u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 
-#define __vcpu_assign_sys_reg(v, r, val)				\
-	do {								\
-		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 __v = (val);					\
-		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
-									\
-		ctxt_sys_reg(ctxt, (r)) = __v;				\
+#define __vcpu_assign_sys_reg(v, r, val)					\
+	do {									\
+		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;		\
+		u64 __v = (val);						\
+		BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(r), u64));\
+		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)		\
+			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);		\
+										\
+		ctxt_sys_reg(ctxt, (r)) = __v;					\
 	} while (0)
 
 #define __vcpu_rmw_sys_reg(v, r, op, val)				\
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index b03dbda7f1ab..c7e2d9be77ae 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -160,7 +160,7 @@ u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx)
 static void kvm_pmu_set_pmc_value(struct kvm_pmc *pmc, u64 val, bool force)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	u64 reg;
+	enum vcpu_sysreg reg;
 
 	kvm_pmu_release_perf_event(pmc);
 
@@ -230,7 +230,8 @@ static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc)
 static void kvm_pmu_stop_counter(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	u64 reg, val;
+	enum vcpu_sysreg reg;
+	u64 val;
 
 	if (!pmc->perf_event)
 		return;
@@ -776,7 +777,7 @@ void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx)
 {
 	struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, select_idx);
-	u64 reg;
+	enum vcpu_sysreg reg;
 
 	reg = counter_index_to_evtreg(pmc->idx);
 	__vcpu_assign_sys_reg(vcpu, reg, (data & kvm_pmu_evtyper_mask(vcpu->kvm)));
-- 
2.51.1.838.g19442a804e-goog


