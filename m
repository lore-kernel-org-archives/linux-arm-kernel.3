Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BF2C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPf5dvcDVGeFg4rp8rzaEx8TRiTLHtjfNYmtCjoBL30=; b=ScI9/fx3BxIbNa22hs26I2aZpf
	5jqok4Sc3LyqssTOSsUZ/0PnbGfmPyj/yNAKEAYulWM868MGMu8J0YSL5nuNcEB49kqneTVUHyyRM
	/tBhJyYllHU4y3GIMbV1DBZfgggmJPRb1lqXj5qEkypFS5V4N6Xw48acVM1AWg3MZmOQqXQ12KYfH
	543icxH6VaXrMc/+stB3JhC6lzMBqdXzllHYhR5X5KE3C7GxKlGi+1Aw4oPQe+2L9/Gw784GoxcUR
	mG+fjBn9OMNwuZGxWmYEpcMVacnEjv4jaduiRR5e5obxCNRww26kSrCdSt0Ksnx2TzFr8b4Q1F1t2
	h+ZvItrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrUz-00000004Aed-0V4G;
	Tue, 11 Feb 2025 14:44:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrQ0-000000049Ya-34S5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPf5dvcDVGeFg4rp8rzaEx8TRiTLHtjfNYmtCjoBL30=;
	b=VN5ArUzI9a0/QpTpLfI+Cw4xV42esUIhvx4RmrLSh7VdCaBUTr++5bocdmArAyQzPtluZA
	K0FvFxdNBpqEJtx/N1PgW1HU1T31w4G/bT1+JROZ5NzURX9Fm67lbht8dqB4AN7GJPGqly
	w6k0UtIh/eC/WEUEY7y3/D5y635y+9k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-laJbqrLLMGiT0AgnJ5oUdg-1; Tue, 11 Feb 2025 09:39:17 -0500
X-MC-Unique: laJbqrLLMGiT0AgnJ5oUdg-1
X-Mimecast-MFC-AGG-ID: laJbqrLLMGiT0AgnJ5oUdg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dd8d11139so117176f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284756; x=1739889556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPf5dvcDVGeFg4rp8rzaEx8TRiTLHtjfNYmtCjoBL30=;
        b=kkLTbti99ydeFQQ9vYYX6GOZvnSfEqIn+Tdf73MD/c8nCuNvYPu4gGwew2bcYWtIzl
         z22Wg0i7JER8WxIOB6AtmMgOXreBg5ovGHOtZFicDd1MiTDYJMxKCOSJ3yC5Vj41jkb0
         391rsSIeGMnbBkEaj6lepvRh8v+4An3hWnYboXuSsNl+guE+7vE/KjZrp7b1ZcSOKy99
         6cC86nDpeW+tiaa05ZSpqN7e38w95aF5L+tSpugcpisLDf4bEaepO8f85n4lLnI+aqs4
         QJlLmI9+Epca+DVUG9LyfthSAv8aDThE+xs1WlGQMvC9zMMeBIVX/+VK/O6vRrp7NnII
         FD/w==
X-Forwarded-Encrypted: i=1; AJvYcCXYc9Em1K6reZEut/s7pqntfH39bG606zyE4L19dgQ+rVMOpxGIURu/GwBtk2RFxcnoxJv2+JycLwRFHZQHz/YQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxImGQNu+d2YHsGOijP4G6lnadWFPffMpB8uu8U5Z4Ea7T2s4/x
	zbN6sVgIN81hbv7IcFs18oSbB7XTfLEVXrzOmDZza4WksRtM4u61l0DOmO+V/eNjwBCXggUnEW/
	GF2FWO5kJiHSt7yspdMjtzCD5WsUTc7UdwuWzLTMe29inxJ3EFox5bBzy16vlsTBmXlnEzjkr
X-Gm-Gg: ASbGnct3hFGUHu7gYMjh0A8Xk+neyRmvfWpmp9inF2zBU8CfliSrUOdpR2gb/lAvdkF
	+SxNTLVvQpEB3FVEytW8nMbrdCBsjuL4fhFEJ36iQxC8/+pk/1TQf2W+MMIJt6b/UM17q9/Z0zH
	MgDs8SywMv+eImQ9jb+N9DxreUavGMokhuT7coDFBd2Mc7xY9uOZU/wslZDZ19HX91hRvbBJ2jy
	d0Uk25eraPHzTPUL7yfANwHOjYz7jaCdGmi7y8tAUswA/s36/y9LvfS7CrusPtukqtnyBt9eOxf
	sKpcTowzOlGAIr/ocPZYXlQf3XZcxnjtR7cwU+tRTz6m6z84mn+YYmkT1ch5+NVpnMs=
X-Received: by 2002:a05:6000:1548:b0:38d:d3e2:db40 with SMTP id ffacd0b85a97d-38dd3e2dc3amr7819783f8f.17.1739284756327;
        Tue, 11 Feb 2025 06:39:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI48MsBZ0xT8yThrymEFgbe5pw/LDZFV6jmWuDquHS5367gme0u5rb2EuyuSeXzwWC2tE8KA==
X-Received: by 2002:a05:6000:1548:b0:38d:d3e2:db40 with SMTP id ffacd0b85a97d-38dd3e2dc3amr7819754f8f.17.1739284755919;
        Tue, 11 Feb 2025 06:39:15 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:15 -0800 (PST)
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
Subject: [PATCH v2 3/4] KVM: arm64: Allow userspace to change AIDR_EL1
Date: Tue, 11 Feb 2025 15:39:09 +0100
Message-ID: <20250211143910.16775-4-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143910.16775-1-sebott@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xce9vaDhiUfrTzKDWn7PXSlhXQFWlQI8MN7g07Kv7Gg_1739284756
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063920_844428_884F1073 
X-CRM114-Status: GOOD (  21.70  )
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
Trap guest access of AIDR_EL1 when the VMs value differs from hardware.

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
index 646c0a04e58a..d388594d7b28 100644
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
@@ -2544,6 +2544,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 
 FUNCTION_RESET(midr_el1)
 FUNCTION_RESET(revidr_el1)
+FUNCTION_RESET(aidr_el1)
 
 
 /*
@@ -2870,6 +2871,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ ID_DESC(AIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_aidr_el1, .val = -1ULL },
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
 		    CTR_EL0_DIC_MASK |
@@ -4634,61 +4637,6 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
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
@@ -4770,15 +4718,10 @@ int kvm_sys_reg_get_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
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
@@ -4814,15 +4757,10 @@ int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
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
@@ -4911,23 +4849,13 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
 
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
@@ -5001,7 +4929,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
-	if (kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1))
+	if ((kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1)) ||
+	    (kvm_read_vm_id_reg(kvm, SYS_AIDR_EL1) != read_sysreg(AIDR_EL1)))
 		vcpu->arch.hcr_el2 |= HCR_TID1;
 
 	if (vcpu_el1_is_32bit(vcpu))
@@ -5156,16 +5085,11 @@ int __init kvm_sys_reg_table_init(void)
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


