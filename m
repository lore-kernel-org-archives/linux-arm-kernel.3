Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D165C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWBLvh1vOG9Vtk8E5TaMoqin30xQfKHJVa4bPl7KdC4=; b=fspVKbIXC7KntVxSWCmmwyFR0w
	bgEWZStwRrYOExFPGq/BmVkL9ojD92//ZFS5sgEeuA4LIWH93V+QGjhQwPCjzY8/uGpCUyJp9jmtB
	a0Sv3RXgX/7HNsu8xS7jwAJsZuG0b1YlDZRbIRAbUNRCff0v8CQpH9AHzrKVbetWomeMcAOP++io/
	jZ/fhc6duWE8Q9E+hwbIT8CxAI2/PnVyuWq5WtKd/6SLQ8Eob6HxcQTEj8mKSkH0F4qzQx0JSPyYo
	pzYn6avSkxiGMTeIugTjqX/P9V08ZIkZxLxUPpmWnWh5Ra6SKjCymCYfT5DNO/imk91VBkO6VlH5j
	gJ2Mluwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thW7X-00000000OKT-3EMG;
	Mon, 10 Feb 2025 15:54:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW2s-00000000NIB-32Sn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWBLvh1vOG9Vtk8E5TaMoqin30xQfKHJVa4bPl7KdC4=;
	b=N8VFcHRU+9EQWrkqJqSJfOwCIURtOl5BEwEtl83UZMYflqrNUk064ijl2FCoG9yM3hu/yD
	1M/iH8jiczqFgqY/17iF7tkhQojYaLHAFE8CuQkgl2eER3/GqWrddQ9qwUE3tJJIVGvsSo
	vAuvCdWmU/ebPp/32EzglhRol17TN3I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-vyuLFJINP8uDFA1S19yHRg-1; Mon, 10 Feb 2025 10:49:57 -0500
X-MC-Unique: vyuLFJINP8uDFA1S19yHRg-1
X-Mimecast-MFC-AGG-ID: vyuLFJINP8uDFA1S19yHRg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dd5031ee7so909812f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 07:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202596; x=1739807396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWBLvh1vOG9Vtk8E5TaMoqin30xQfKHJVa4bPl7KdC4=;
        b=UGGAyrGJ9tpbchSIx9sFw/H/7cxWe/Kn5wmaIgyKast2biCa7MkGM6UZNxVDAzjTAn
         xOE8AJCg+X9S1lHrKn+hydUtFstFf+zQmg4Ep5WuBfuLD5/Lz93D2df7pOyXY09y2Sm4
         bYIGCibxowSi2OMkDLRyFa/fn6U411N2Ykm4USjt4dxKHg8pykSWNuoZe9NwvXQp/EA8
         0Ozl1FDb1SBOUHB0kaDRhjzxQiZNGpKq3Dq22UjFOUH5JzboZEQj3tvx4/i+fgY20zhb
         5ypWNW0TzthPzD8oc+gF5DW2Tbuyeb4yobhgbZDQ490zVeTL5ozJfabiLZnxIecY4Squ
         O1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXA8obu6OsRSYAVTBo/dnTjCgvAnzHqJo3HdmJblHtsAQjfNMGomzobr5uPk8lPZCVncJBEGiQ/e3hlj8hsP9Gs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk8PLeRBDfIdBLCsLheLQApBPJrhfv+tgqQUfC75Awzhd5QPrp
	uhQo9axPVc8lgD6/1XQ+3z4f/H/qJL3d3XM1+FIo3jWgLAFnI2iHVaKrHz4eM/0Fj9TSxX4W8qa
	trY0hJkpwS7gpl3lDuC6htdV+BL+11IOBMg8bYBU4kb0T89zFEfjKb+fu5PESWDB0ThWp9ToR
X-Gm-Gg: ASbGncsZ8NwOE+lped/8SwX54rYw42CEMp9xh3BQrNbAwkXFdZW8f47HNG01vYqIJ4p
	AJqmqdEs4qGyygqZ+JgkDbtk6AiIwzYwjoAXqkJ4T/6xRW+Wzc/6I7/0Hz3v/QA+X/ArR8m5YWl
	syPsBH3NZPAggdomG3BytEKWIoB+6o043Mr4Opqzp06pORy8dFQjTl2l17ZEBNnx0vAHvBtEiuI
	mg+EhA+WQxkSzZthfHDbnJKQq3HSKkN4OONPIIpdrKQj6VOzBR8H+wTMlXrR1RzDyVd8kMQPG5c
	Tfri6dgenYxWrcpxIluv40pAl1wj8ePqQ7TG5N+0VJQj8SXvCBWzd47I7EXBU65qRC0=
X-Received: by 2002:a05:6000:85:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38dc8ddefdbmr7961781f8f.18.1739202596610;
        Mon, 10 Feb 2025 07:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZeSIDhxVmXxw+MQqPx65Y2wGmkBfy9SY3c8qH880FDgrCYi3TbT7Nr9ofzZrqiORl2xfyQ==
X-Received: by 2002:a05:6000:85:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38dc8ddefdbmr7961764f8f.18.1739202596251;
        Mon, 10 Feb 2025 07:49:56 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:55 -0800 (PST)
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
Subject: [PATCH 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
Date: Mon, 10 Feb 2025 16:49:50 +0100
Message-ID: <20250210154953.27002-2-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L37x8ZmooWIViKLke_PUUcEAKGH5leGgWooPIYJKooY_1739202597
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075002_837952_A13041D7 
X-CRM114-Status: GOOD (  18.67  )
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

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 37 +++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

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
index 82430c1e1dd0..cc94bed7299d 100644
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
@@ -1999,6 +1999,22 @@ static int get_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 	return 0;
 }
 
+static bool skip_feature_check(u32 reg)
+{
+	return (reg == SYS_MIDR_EL1);
+}
+
+/*
+ * For non ftr regs do a limited test against the writable mask only.
+ */
+static int arm64_check_mask(const struct sys_reg_desc *rd, u64 val)
+{
+	if ((rd->val & val) != val)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		      u64 val)
 {
@@ -2021,7 +2037,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
 		return ret;
 	}
 
-	ret = arm64_check_features(vcpu, rd, val);
+	if (skip_feature_check(id))
+		ret = arm64_check_mask(rd, val);
+	else
+		ret = arm64_check_features(vcpu, rd, val);
+
 	if (!ret)
 		kvm_set_vm_id_reg(vcpu->kvm, id, val);
 
@@ -2493,6 +2513,15 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
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
@@ -2542,6 +2571,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
 
+	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
+	  .reset = reset_midr_el1, .val = (u32)-1 },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
 
 	/*
@@ -4594,13 +4625,11 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
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


