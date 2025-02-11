Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F6C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxQC5OSA8UNrYi2FsJ8qImpmh+po7bw6P6uEsaW3lFQ=; b=4QAsry1guDAXtoq74cJNUOyZLt
	MiagFkAs3P00VVe+wPlatBYi1rWpAU3tK4XmBblWcoaW1iHB1ig7KsqyeOVz4BdAswBVwPgrx8sgA
	JCwbecXaVXzLzRhj/YRKK5dV/CscrRXF6yLJCNAr0kSRXp+9zCDjAFPhX82Jbz/cO2jRQXFe1t2Kn
	4hKKAD8wNcNm9FooaeUk+abvW860re0AosOgyNt8YuEGebkXkSZ68qxwAKljqJJw1y1V5Q0HE72JY
	kh5OMYjxMfNGPazl/Y9qSayqM1FsKXHOoXzsG2NDnN4w8TP3NmXAYog8XFkUr4FKup1I8FhpluiXA
	TWvQIEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrTb-00000004AKU-1zUb;
	Tue, 11 Feb 2025 14:43:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrPz-000000049Y2-3YOJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxQC5OSA8UNrYi2FsJ8qImpmh+po7bw6P6uEsaW3lFQ=;
	b=bVvhfLt1f49pd1hMGsaMLnGmJtcRY25hYihVCNhthfNHK2DymbgcrMcRvlO3phVpz/kWWQ
	enXE4yc3jfDRV/grvOPV72i2GNjhGuJ/eZRbHIjqr+FlsPzU/5IJi4/UeyOZ1ZDcX7V4wL
	YLO5L6qXBXAaXxUwMnlfauFRvH+5ZQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-P5u2FNiwPS6lv553iqgmUA-1; Tue, 11 Feb 2025 09:39:16 -0500
X-MC-Unique: P5u2FNiwPS6lv553iqgmUA-1
X-Mimecast-MFC-AGG-ID: P5u2FNiwPS6lv553iqgmUA_1739284754
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43933b8d9b1so17443095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284754; x=1739889554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxQC5OSA8UNrYi2FsJ8qImpmh+po7bw6P6uEsaW3lFQ=;
        b=MtmS0Os1B6b6KECMFdh7nso+FT/jU7fIqRaO19u5mSpxTqPSc/WArC6A1GnAJjDTPY
         75yEPxkeseWFEzzuCQzmUoQHIJn61CazrlVAVYyLqGmIFVzacLmIXZ2yI6jkqTO5PHE6
         wydxLZBLQxhOlWWIAAEFHNE9k9dZyGnH+mR6Bkn7OuqS5IH+iyM9JfuDgvaXRdmBhI2g
         4wvuN0+X/N7oeDzqDCQMffcCcgu3BSHyqQUOkb9K+LHHsFB8gaQo5Px2o4k7yegO1HQh
         OcRivTiPN3OxR+4zXVn5OtoUF34CYBJKgek/AOtPhlHE4d1myux8v+9clSgHa2om4ZDb
         wkCA==
X-Forwarded-Encrypted: i=1; AJvYcCXxklAWF94LirrjtxC0Ndp/jwlkuV5Shw1cFMeRtraHeEKDsc3p7QeRwhc7CpjwfEtlsqCByvO078J3/vhTz5D/@lists.infradead.org
X-Gm-Message-State: AOJu0YxmY+BXbsWRucp71lduS5DS3p2vSuXjgqmb89SpQG05tyrjn191
	7xSg60XOc2077Y9VdH48flsIiAGgQCPtF5MtZcAm/mf/P1QA18AKqjwsYVpGf4IjRYKMwbg15yi
	u1CH5XFCMM40LYV6yiIFGc2w1UdS3dUkvRImfO+11SC+geDEmRI4N8lHBvx9u5EJKvp6p/Eny0C
	nQnoOZ
X-Gm-Gg: ASbGncslcyCOt1DE50adN4fkcFIrlGSGyNDs7OyqRfJ0pnUAuAg/MltlKRWEC3cQAmt
	ggAWAXIRdVMLRDjBP+XSrPmlxPlREs5YVcp2AzttKP6wf3lmJHO65CbmPpk98eSZwiIURysvWI3
	Qzk049OTbuH2hEQRtoxxnGPLuHyzIyk1sPz6I0tomlmRUkz01WExlwSgos+fZ90pUUoHhQCZB+f
	eYSvxRNm2609BRY6yUZLc5TIDfjszUXwy5vloEswOmjDYd9L0JcGzw0iZnd8/QQFszarCHkr0yX
	E5MbM9LJZ4yUeLa1gqqOnuZ+ey45lux9xj4q7RNsHDj4uVIuKxW9UNDJqF+QJjTsWJw=
X-Received: by 2002:a05:600c:190c:b0:439:42c6:f11f with SMTP id 5b1f17b1804b1-43942c6f5eemr83106995e9.4.1739284753677;
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDvsaYgzTa5RWn9BkqT6d0zbIYe+dTe5ziVPY8IeCNWz/AYeRHaPoW5P6jv6YFeryIf9I1Lg==
X-Received: by 2002:a05:600c:190c:b0:439:42c6:f11f with SMTP id 5b1f17b1804b1-43942c6f5eemr83106725e9.4.1739284753304;
        Tue, 11 Feb 2025 06:39:13 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
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
Subject: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
Date: Tue, 11 Feb 2025 15:39:07 +0100
Message-ID: <20250211143910.16775-2-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143910.16775-1-sebott@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fzP2ghBQFvWGmqRRVhJxBlF7tUxx3DVDZdOuF3zcKW0_1739284754
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063919_958566_E657AE35 
X-CRM114-Status: GOOD (  21.58  )
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

Enable VMMs to write MIDR_EL1 by treating it as a VM ID register.
Since MIDR_EL1 is not handled as a proper arm64_ftr_reg apply only
a sanity check against the writable mask to ensure the reserved
bits are 0.

Set up VPIDR_EL2 to hold the MIDR_EL1 value for the guest.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/sys_regs.c         | 56 +++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..3db8c773339e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -373,6 +373,7 @@ struct kvm_arch {
 #define KVM_ARM_ID_REG_NUM	(IDREG_IDX(sys_reg(3, 0, 0, 7, 7)) + 1)
 	u64 id_regs[KVM_ARM_ID_REG_NUM];
 
+	u64 midr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1469,6 +1470,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 	switch (reg) {
 	case sys_reg(3, 0, 0, 1, 0) ... sys_reg(3, 0, 0, 7, 7):
 		return &ka->id_regs[IDREG_IDX(reg)];
+	case SYS_MIDR_EL1:
+		return &ka->midr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..7e1c9884f62a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1666,7 +1666,7 @@ static bool is_feature_id_reg(u32 encoding)
  */
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
-	if (id == SYS_CTR_EL0)
+	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -1999,6 +1999,47 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 	return 0;
 }
 
+static int set_id_reg_non_ftr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+			      u64 val)
+{
+	u32 id = reg_to_encoding(rd);
+	int ret;
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	/*
+	 * Once the VM has started the ID registers are immutable. Reject any
+	 * write that does not match the final register value.
+	 */
+	if (kvm_vm_has_ran_once(vcpu->kvm)) {
+		if (val != read_id_reg(vcpu, rd))
+			ret = -EBUSY;
+		else
+			ret = 0;
+
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
+		return ret;
+	}
+
+	/*
+	 * For non ftr regs do a limited test against the writable mask only.
+	 */
+	if ((rd->val & val) != val) {
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
+		return -EINVAL;
+	}
+
+	kvm_set_vm_id_reg(vcpu->kvm, id, val);
+	/*
+	 * Since guest access to MIDR_EL1 is not trapped
+	 * set up VPIDR_EL2 to hold the MIDR_EL1 value.
+	 */
+	if (id == SYS_MIDR_EL1)
+		write_sysreg(val, vpidr_el2);
+
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
+	return 0;
+}
+
 static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		      u64 val)
 {
@@ -2493,6 +2534,15 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+#define FUNCTION_RESET(reg)						\
+	static u64 reset_##reg(struct kvm_vcpu *v,			\
+			       const struct sys_reg_desc *r)		\
+	{								\
+		return read_sysreg(reg);				\
+	}
+
+FUNCTION_RESET(midr_el1)
+
 
 /*
  * Architected system registers.
@@ -2542,6 +2592,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
 
+	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_midr_el1, .val = GENMASK_ULL(31, 0) },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
 
 	/*
@@ -4594,13 +4646,11 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 		return ((struct sys_reg_desc *)r)->val;			\
 	}
 
-FUNCTION_INVARIANT(midr_el1)
 FUNCTION_INVARIANT(revidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
 static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_MIDR_EL1), NULL, reset_midr_el1 },
 	{ SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
 	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
 };
-- 
2.42.0


