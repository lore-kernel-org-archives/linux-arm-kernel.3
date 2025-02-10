Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF99C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ5boF1+ov+a1CrxZW4hTB/OazVKXnCvFj7KGC76W04=; b=LyygH9y1z6RqStEkv06FEUSW1G
	B1AJE1GXWDgDxUU9bML1fm0JkWo66zeKEhTKruyYkIE3T3lhlk4UM+QlyO3d7lcx3vOT9AvhyAk7l
	gPRPkW8DARy8oNXZoZMEIFzcRrPlHqhGKSefEdHBKJsxixACc1iTrwLwms2P/OSFhvO0j90FSCmQ8
	XFKTTcHQlOoane8OZN0mQ1SNji/U8/w6cuHC0fnHNKi4z30NkLgyYHL3smmk0ZJhlDjP/dgTeexDt
	OkkwIg5lru9PLT80ACSBkBkGTK12NhQP2SdzxzXPlW+bhExk4F5YdIYyleeRRIjUGQ9Dvok3eNSbg
	q2w08x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWAH-00000000Ot1-0VFg;
	Mon, 10 Feb 2025 15:57:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW2u-00000000NJ3-2IJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZ5boF1+ov+a1CrxZW4hTB/OazVKXnCvFj7KGC76W04=;
	b=gJ8h8NyibTlAD/dzAiVc6IwW0cfYg6akEKR0YFmCejo3N+cB8dBUVm+namwPAHAvRlNC58
	3Xhmk2d+zQcldgv/4sS/knzPPOOv1Ja8HOgQLhZKOefJ2ggEyaMI8pWM/TLoO2uNC0XqQB
	3mEasrXLXXZNuORURPb2JkAzPcUO8Zo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-pJFwmE8JORyIa8_1MrNOVg-1; Mon, 10 Feb 2025 10:50:00 -0500
X-MC-Unique: pJFwmE8JORyIa8_1MrNOVg-1
X-Mimecast-MFC-AGG-ID: pJFwmE8JORyIa8_1MrNOVg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393e89e910so8392915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 07:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202599; x=1739807399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ5boF1+ov+a1CrxZW4hTB/OazVKXnCvFj7KGC76W04=;
        b=ChEG+pgmT6gRCKcD0lX3s7uTAjnHomorj1Gx4+O99BJirazzUILoRx6N0LJ8gGoBEP
         H/97VrxlHGfwMIlnMkbddx46+kOxIu4JQlyAqppZPNL5nFq1/pQbCSECVgTmcS5PyF3s
         Y0JmGVtmB+Mt8eEgIae7Aexa4etl/qauc6MTjfH+vMyZCqMFOA1HnX5WMsM5hRpsuwHo
         W7Xv5znb9sP/ZagTN28JCANOYnWc3PnBtFsOSFUa3LKGKdKaBB/LqGd6C+oeqIjA0eEF
         GzP3StcmjdsRCd6OiO+AsRjlyM7xETgD31HlREDZI99DBmZRVxIQ1FR+jJRUIYfNIPut
         Vw6A==
X-Forwarded-Encrypted: i=1; AJvYcCVj5XvBxWfWWiFiWiFLltKG4WEGx8u+7oUCMV4F9EfsM1vRJVgh1BxdZ7kU7Yl8OegMz5LxwOGi0yc+VFA4+CEm@lists.infradead.org
X-Gm-Message-State: AOJu0YzNVzmKRP8XhLoHA/ixZ2ERVTyQB3gSOU/ABnKy6bt1w5TiWWai
	yLiHzEmIBIMRkEoRaRWETFFlzX+WUuyk7QxEEXwiVb6n+ZLQUtWajJXhXDdvyyoCexIWqNGocjk
	lwOo9F9NOQc7sxR5rNjnR91LunAMyFPAjrfZBbLV5tjE7q5WVUT475BW3fB9XW9NvN9qFMt7S
X-Gm-Gg: ASbGnct5c+/CPwlR60lEtBc1GD6yOlO3PKbGxItsQb8cqutsHjCw8iDt8krIRG6/NLB
	fmO4nIHld1bXiiE3mNJbQAydeNA0odaMAPKPe46iHESOIRACemRyiX0k2KLW41+T0+lcI0j9cyx
	dYeo7A66mXR0wgB4nPvTfTQSL2VjnENHzXSk06BK/L8fsuB+Uk6zJVrjwN2EF5q+dheZsIjdIlI
	Gh+RO5KUg9YI/vRp4wiNuVMIyCbDr3WDjGBcKVXiKx8i9E6d09ueZQX/FF9qS9mx2yG15Wut4hl
	h39IKf+q7h3ZzdAdMUfCRsXoFaRucgrVEGAJy1oyKYRg9shISwDYDjOw8/+5qgdrkiY=
X-Received: by 2002:a05:600c:3b24:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-439249b04c5mr95485755e9.21.1739202599133;
        Mon, 10 Feb 2025 07:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy/hyTiJKOd5suOwHBU4YT0xl861inY+oh4hEO7p/dxFuxz5WWlSrwdmZ+NX1+MRBiiH1H4Q==
X-Received: by 2002:a05:600c:3b24:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-439249b04c5mr95485475e9.21.1739202598710;
        Mon, 10 Feb 2025 07:49:58 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:58 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] KVM: arm64: Allow userspace to change AIDR_EL1
Date: Mon, 10 Feb 2025 16:49:52 +0100
Message-ID: <20250210154953.27002-4-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YHtXpI7_UKZqABmHU1K3yrfmQHH7Q_BCssydvg4Yyvc_1739202599
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075004_660289_D8C2F649 
X-CRM114-Status: GOOD (  21.25  )
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

Enable VMMs to write AIDR_EL1 by treating it as a VM ID register.
Since this was the last invariant register remove all the stuff
that was needed to handle these.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/sys_regs.c         | 90 +++----------------------------
 2 files changed, 10 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c8fba4111b77..de735e2ad9ce 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -375,6 +375,7 @@ struct kvm_arch {
 
 	u64 midr_el1;
 	u64 revidr_el1;
+	u64 aidr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1475,6 +1476,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 		return &ka->midr_el1;
 	case SYS_REVIDR_EL1:
 		return &ka->revidr_el1;
+	case SYS_AIDR_EL1:
+		return &ka->aidr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 0ab2b2c79881..7d588fedb50a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1667,7 +1667,7 @@ static bool is_feature_id_reg(u32 encoding)
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
 	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1 ||
-	    id == SYS_REVIDR_EL1)
+	    id == SYS_REVIDR_EL1 || id == SYS_AIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -2003,7 +2003,8 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 static bool skip_feature_check(u32 reg)
 {
 	return (reg == SYS_MIDR_EL1) ||
-	       (reg == SYS_REVIDR_EL1);
+	       (reg == SYS_REVIDR_EL1) ||
+	       (reg == SYS_AIDR_EL1);
 }
 
 /*
@@ -2524,6 +2525,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 
 FUNCTION_RESET(midr_el1)
 FUNCTION_RESET(revidr_el1)
+FUNCTION_RESET(aidr_el1)
 
 
 /*
@@ -2850,6 +2852,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ ID_DESC(AIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
+	  .reset = reset_aidr_el1, .val = -1ULL },
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
 		    CTR_EL0_DIC_MASK |
@@ -4614,61 +4618,6 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 	return r;
 }
 
-/*
- * These are the invariant sys_reg registers: we let the guest see the
- * host versions of these, so they're part of the guest state.
- *
- * A future CPU may provide a mechanism to present different values to
- * the guest, or a future kvm may trap them.
- */
-
-#define FUNCTION_INVARIANT(reg)						\
-	static u64 reset_##reg(struct kvm_vcpu *v,			\
-			       const struct sys_reg_desc *r)		\
-	{								\
-		((struct sys_reg_desc *)r)->val = read_sysreg(reg);	\
-		return ((struct sys_reg_desc *)r)->val;			\
-	}
-
-FUNCTION_INVARIANT(aidr_el1)
-
-/* ->val is filled in by kvm_sys_reg_table_init() */
-static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
-};
-
-static int get_invariant_sys_reg(u64 id, u64 __user *uaddr)
-{
-	const struct sys_reg_desc *r;
-
-	r = get_reg_by_id(id, invariant_sys_regs,
-			  ARRAY_SIZE(invariant_sys_regs));
-	if (!r)
-		return -ENOENT;
-
-	return put_user(r->val, uaddr);
-}
-
-static int set_invariant_sys_reg(u64 id, u64 __user *uaddr)
-{
-	const struct sys_reg_desc *r;
-	u64 val;
-
-	r = get_reg_by_id(id, invariant_sys_regs,
-			  ARRAY_SIZE(invariant_sys_regs));
-	if (!r)
-		return -ENOENT;
-
-	if (get_user(val, uaddr))
-		return -EFAULT;
-
-	/* This is what we mean by invariant: you can't change it. */
-	if (r->val != val)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int demux_c15_get(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
 {
 	u32 val;
@@ -4750,15 +4699,10 @@ int kvm_sys_reg_get_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 int kvm_arm_sys_reg_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	void __user *uaddr = (void __user *)(unsigned long)reg->addr;
-	int err;
 
 	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
 		return demux_c15_get(vcpu, reg->id, uaddr);
 
-	err = get_invariant_sys_reg(reg->id, uaddr);
-	if (err != -ENOENT)
-		return err;
-
 	return kvm_sys_reg_get_user(vcpu, reg,
 				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
 }
@@ -4794,15 +4738,10 @@ int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
 int kvm_arm_sys_reg_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	void __user *uaddr = (void __user *)(unsigned long)reg->addr;
-	int err;
 
 	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
 		return demux_c15_set(vcpu, reg->id, uaddr);
 
-	err = set_invariant_sys_reg(reg->id, uaddr);
-	if (err != -ENOENT)
-		return err;
-
 	return kvm_sys_reg_set_user(vcpu, reg,
 				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
 }
@@ -4891,23 +4830,13 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
 
 unsigned long kvm_arm_num_sys_reg_descs(struct kvm_vcpu *vcpu)
 {
-	return ARRAY_SIZE(invariant_sys_regs)
-		+ num_demux_regs()
-		+ walk_sys_regs(vcpu, (u64 __user *)NULL);
+	return num_demux_regs()	+ walk_sys_regs(vcpu, (u64 __user *)NULL);
 }
 
 int kvm_arm_copy_sys_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 {
-	unsigned int i;
 	int err;
 
-	/* Then give them all the invariant registers' indices. */
-	for (i = 0; i < ARRAY_SIZE(invariant_sys_regs); i++) {
-		if (put_user(sys_reg_to_index(&invariant_sys_regs[i]), uindices))
-			return -EFAULT;
-		uindices++;
-	}
-
 	err = walk_sys_regs(vcpu, uindices);
 	if (err < 0)
 		return err;
@@ -5133,16 +5062,11 @@ int __init kvm_sys_reg_table_init(void)
 	valid &= check_sysreg_table(cp14_64_regs, ARRAY_SIZE(cp14_64_regs), true);
 	valid &= check_sysreg_table(cp15_regs, ARRAY_SIZE(cp15_regs), true);
 	valid &= check_sysreg_table(cp15_64_regs, ARRAY_SIZE(cp15_64_regs), true);
-	valid &= check_sysreg_table(invariant_sys_regs, ARRAY_SIZE(invariant_sys_regs), false);
 	valid &= check_sysreg_table(sys_insn_descs, ARRAY_SIZE(sys_insn_descs), false);
 
 	if (!valid)
 		return -EINVAL;
 
-	/* We abuse the reset function to overwrite the table itself. */
-	for (i = 0; i < ARRAY_SIZE(invariant_sys_regs); i++)
-		invariant_sys_regs[i].reset(NULL, &invariant_sys_regs[i]);
-
 	ret = populate_nv_trap_config();
 
 	for (i = 0; !ret && i < ARRAY_SIZE(sys_reg_descs); i++)
-- 
2.42.0


