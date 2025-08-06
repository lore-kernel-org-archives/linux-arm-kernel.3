Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A259DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Cc:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qllMq6a+4UroKtCBqNM+nHONT/F7Y/ZyN5Zu7LPEXos=; b=sZsHKKygOV/XGN
	8fToN7FuwDuGB4ruCGbpqNKZgi9to15xBPnRes/PgJJzAJbcFRX8quJaC2WwtHcHIQMNJJ0BIBEzv
	UBdHf02GMI9X50xF6xAFJryG+pzR70vjg+B45PsDUBc75LgDX8mNHsRDhnjolIXMN9t3wCzGIRR/h
	I6UiLF6DiIzkivZ5I6CtXAKemH1SUZVXGk80/Top2ib/MFzFetksApV0X2rEK3BmP+z+W8eDCuNsq
	IlfiT6Rsx8vSn/68qzon8vNvCJIGQT2sh0yywQ5/JRpOTwHfosmqQ2eyETTgoXlJiRGrcXVSZIf2d
	kn1dB801makyA11oapTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmYO-0000000Gich-2yTs;
	Wed, 06 Aug 2025 22:24:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlWn-0000000GYFL-0MeW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 21:18:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23fc5aedaf0so1919045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754515108; x=1755119908; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=qllMq6a+4UroKtCBqNM+nHONT/F7Y/ZyN5Zu7LPEXos=;
        b=OOei6Th43r+I06trfYUkZ8U62SvUtzWhmLUeVuUAOBmb+PjKUOMOc7r71jzXplBSGr
         wCb/uRbxObaDZGkae8De9+fTUINrHL+NvECicm63l8AObR15m4wIL0mJfhP7Pz9gVELY
         hwF5qJJu8hjo3/4w6IozqSl4ONzy5mLAWV7gteDztddMGK0lOmlTuWt7XOtu+fK/aEZH
         VCTmFxNk+3qnkxm9/Qk4J8bq31hC/JpScyhMzxvQAOtKyk6foW3c8OWKJOHSmyC1yhMJ
         VwgxnQwUHeinDe9rdnR6oXeB3oZIrYeCRc4Xzj64zqdKtcpmuIbSTOGxB6sJ/UAsKa/s
         pkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754515108; x=1755119908;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qllMq6a+4UroKtCBqNM+nHONT/F7Y/ZyN5Zu7LPEXos=;
        b=G/pCZT4AzSzErLXZXPxA0YG8NPVu1wGLhEsN0Chb47m4hHjSnHdkzDY7VP6n+2x11p
         3mu5SRJfE1lTWvD0P6q2tFQE48ku3zUyj9rlN7CGb/Dk15LELjcAcOuZOspPsKw9Ng+o
         rYpjcr7+/6HzkglyLmNoua3XdtK3GcuQnbOAOPWLjYlvEm/vC+eDYNN37S/ghrijsa1/
         f0h0C/7HY4+13x2VGsPo4G7MQoGcJw3IoY2Y4A+gSB668j+XHDcqf5J28KtIya5Kem8K
         R9d4R2qcPgO0jTuqaU2tsrwGUe5aGiM3U4hrQPv7nZAvtKqG2eXPqfxMcYd1MMpij3da
         PGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWj6Z7C1lKRFb69vgeeIhO+ulpBzYNFt5ENfrmLId5YOYO4UzRcGWGQ/5TO0COR1gDyJdK5SPTCpnyP3Ap2lGT6@lists.infradead.org
X-Gm-Message-State: AOJu0YxEkS/rowbzj+sGLkpIBMewbGKsYVsnUefTP0T9gGyrG+4SRIBJ
	u3xEM4mjswKxm2cb1X/elV0JMow6OgE6LFqJ+tAKDpnmO463NZ4owxvXRBFpeHsU3WY=
X-Gm-Gg: ASbGncs4JbwEIoWkUBoL+pwSPqWws0Hm3QpqgcBa6HxgNUmaUaQ7KO14yuklqsr41D5
	vKwI1DG+w8c43K5ihKXJjNJlbpn0Yyk21rEfWIjuUgvcODuSID1T+tPJTIyH8BP0NnkOgA/CM4F
	6VDTTB3551RfowNHLiL6nJ6GNnmIcEGnp1f95/xUekaIS/Ehzv6eZZkexe8K5nLwYjeAhy2SK28
	iZVwuGSdW2sxpKepLan9AIlG5aPgB4VTpHPwT/p6Gp57zy2yub7jC6oyr9diRXKOxPETdua8MVM
	PuaG6uO/FoyultgNCOOyFus66ABMRvPs2SQP9e29oomFhSc3a4u5ugKgZ9+q35Ib6VX5ln/pDa3
	9uSx+J6RbOvFtcFnD2r5NaIDr6vwUQxA=
X-Google-Smtp-Source: AGHT+IH6eAVpMeVC+Rjhp8U4mXlTXHCMv6IDU7tKLDUuq4M7/P4/hygLIS41ljtgxoX6HRfFdQSz3g==
X-Received: by 2002:a17:902:e752:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-2429f582334mr58356865ad.23.1754515107657;
        Wed, 06 Aug 2025 14:18:27 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:c42f])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31f63ee49fbsm20468958a91.18.2025.08.06.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 14:18:27 -0700 (PDT)
Subject: [PATCH] arm64: Expose CPUECTLR{,2}_EL1 via sysfs
Date: Wed,  6 Aug 2025 12:48:13 -0700
Message-ID: <20250806194812.46598-2-palmer@dabbelt.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Will Deacon <will@kernel.org>, oliver.upton@linux.dev, james.morse@arm.com,
  cohuck@redhat.com, anshuman.khandual@arm.com, palmerdabbelt@meta.com,
  Marc Zyngier <maz@kernel.org>, lpieralisi@kernel.org, kevin.brodsky@arm.com, scott@os.amperecomputing.com,
  broonie@kernel.org, james.clark@linaro.org, yeoreum.yun@arm.com, joey.gouly@arm.com,
  huangxiaojia2@huawei.com, yebin10@huawei.com, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_141829_371942_C5969DEA 
X-CRM114-Status: GOOD (  30.46  )
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

From: Palmer Dabbelt <palmerdabbelt@meta.com>

We've found that some of our workloads run faster when some of these
fields are set to non-default values on some of the systems we're trying
to run those workloads on.  This allows us to set those values via
sysfs, so we can do workload/system-specific tuning.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@meta.com>
---
I've only really smoke tested this, but I figured I'd send it along because I'm
not sure if this is even a sane thing to be doing -- these extended control
registers have some wacky stuff in them, so maybe they're not exposed to
userspace on purpose.  IIUC firmware can gate these writes, though, so it
should be possible for vendors to forbid the really scary values.

That said, we do see some performance improvements here on real workloads.  So
we're hoping to roll some of this tuning work out more widely, but we also
don't want to adopt some internal interface.  Thus it'd make our lives easier
if we could twiddle these bits in a standard way.

Nobody's wed to sysfs, I just went with it because some of the other system
registers are exposed there.
---
 arch/arm64/include/asm/cpu.h    |   2 +
 arch/arm64/include/asm/sysreg.h |   3 +
 arch/arm64/kernel/cpuinfo.c     | 192 +++++++++++++++++++++++++++++++-
 3 files changed, 194 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index 71493b760b83..275d24da962b 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -39,6 +39,8 @@ struct cpuinfo_32bit {
 
 struct cpuinfo_arm64 {
 	struct kobject	kobj;
+	unsigned int cpu;
+
 	u64		reg_ctr;
 	u64		reg_cntfrq;
 	u64		reg_dczid;
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index d5b5f2ae1afa..17dfbf640a2a 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -412,6 +412,9 @@
 
 #define SYS_AIDR_EL1			sys_reg(3, 1, 0, 0, 7)
 
+#define SYS_CPUECTRL_EL1		sys_reg(3, 0, 15, 1, 4)
+#define SYS_CPUECTRL2_EL1		sys_reg(3, 0, 15, 1, 5)
+
 #define SYS_RNDR_EL0			sys_reg(3, 3, 2, 4, 0)
 #define SYS_RNDRRS_EL0			sys_reg(3, 3, 2, 4, 1)
 
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index ba834909a28b..beaabde5b8e3 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -339,7 +339,7 @@ static struct attribute *cpuregs_id_attrs[] = {
 	NULL
 };
 
-static const struct attribute_group cpuregs_attr_group = {
+static const struct attribute_group id_cpuregs_attr_group = {
 	.attrs = cpuregs_id_attrs,
 	.name = "identification"
 };
@@ -354,12 +354,191 @@ static const struct attribute_group sme_cpuregs_attr_group = {
 	.name = "identification"
 };
 
+/*
+ * sysfs has per-file locking, but each of the extended control register fields
+ * are in their own file.  So here we just have a single shared lock for all of
+ * them -- we could have per-CPU locking, but seems overkill.
+ */
+static DEFINE_MUTEX(extended_lock);
+struct cpuectrl_op {
+	unsigned long long before;
+	unsigned long long mask;
+	unsigned long long val;
+	unsigned long long after;
+};
+
+#define CPUREGS_ECTRL_ACCESS(_name, _reg)						\
+	static void access_##_name(void *op_uncast)					\
+	{										\
+		struct cpuectrl_op *op = op_uncast;					\
+											\
+		mutex_lock(&extended_lock);						\
+											\
+		op->before = read_cpuid(_reg);						\
+		if (op->mask) {								\
+			unsigned long long new = (op->before & ~op->mask) | op->val;	\
+			write_sysreg_s(new, SYS_##_reg);				\
+			op->after = read_cpuid(_reg);					\
+		}									\
+											\
+		mutex_unlock(&extended_lock);						\
+	}
+
+CPUREGS_ECTRL_ACCESS(cpuectrl_el1, CPUECTRL_EL1)
+CPUREGS_ECTRL_ACCESS(cpuectrl2_el1, CPUECTRL2_EL1)
+
+#define CPUREGS_ECTRL_ATTR__RW(_reg, _field, _bit_hi, _bit_lo)				\
+	static ssize_t _reg##_field##_show(struct kobject *kobj,			\
+			struct kobj_attribute *attr, char *buf)				\
+	{										\
+		struct cpuinfo_arm64 *info = kobj_to_cpuinfo(kobj); 			\
+		struct cpuectrl_op op;							\
+											\
+		op.mask = 0;								\
+		smp_call_function_single(info->cpu, access_##_reg, &op, 1);		\
+		op.val = op.before & GENMASK(_bit_hi, _bit_lo);				\
+		return sprintf(buf, "0x%llx\n", op.val >> _bit_lo);			\
+	}										\
+											\
+	static ssize_t _reg##_field##_store(struct kobject *kobj,			\
+			struct kobj_attribute *attr, const char *buf,			\
+			size_t bytes)							\
+	{										\
+		struct cpuinfo_arm64 *info = kobj_to_cpuinfo(kobj); 			\
+		struct cpuectrl_op op;							\
+											\
+		if (sscanf(buf, "0x%llx", &op.val) != 1)					\
+			return -EINVAL;							\
+		op.mask = GENMASK(_bit_hi, _bit_lo);					\
+		op.val <<= _bit_lo;						\
+		if ((op.val & op.mask) != op.val)					\
+			return -EINVAL;							\
+											\
+		smp_call_function_single(info->cpu, access_##_reg, &op, 1);		\
+											\
+		if ((op.after & op.mask) != op.val)					\
+			return -ENOTSUPP;						\
+		return strlen(buf);							\
+	}										\
+											\
+	static struct kobj_attribute cpuregs_attr_##_reg##_##_field = 			\
+		__ATTR(_field, S_IWUSR | S_IRUGO, _reg##_field##_show, _reg##_field##_store)
+
+
+/*
+ * The names for these match the names in the arm Arm ARM, which is a bit
+ * terse.  It seems somewhat reasonable to leave them as-is, though, as users
+ * probably shouldn't just be poking at them unless they know what they're
+ * doing and the fancy-looking names will hopefully hint at that.
+ */
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, cmc_min_ways, 63, 61);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, l2_inst_part, 60, 58);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, l2_data_part, 57, 55);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_vmid_thr, 54, 54);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_asp_en, 53, 53);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_ch_dis, 52, 52);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_tlbpf_dis, 51, 51);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_hpa_l1_dis, 47, 47);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, mm_hpa_dis, 46, 46);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, l2_flush, 43, 43);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pft_mm, 41, 40);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pft_ls, 39, 38);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pft_if, 37, 36);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ca_uclean_evict_en, 35, 35);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ca_evict_dis, 34, 34);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, atomic_ld_force_near, 33, 33);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, atomic_acq_near, 32, 32);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, atomic_st_near, 31, 31);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, atomic_rel_near, 30, 30);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, atomic_ld_near, 29, 29);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, tlb_pred_dis, 28, 28);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, tlb_pred_aggr, 27, 27);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, tlb_cabt_en, 26, 26);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ws_thr_l2, 25, 24);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ws_thr_l3, 23, 22);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ws_thr_l4, 21, 20);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ws_thr_dram, 19, 18);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pf_dis, 15, 15);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pf_ss_l2_dis, 13, 12);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pf_sts_dis, 9, 9);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pf_sti_dis, 8, 8);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, pf_mode, 7, 6);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, rpf_mode, 5, 4);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, rpf_lo_conf, 3, 3);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ras_raz, 1, 1);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl_el1, ext_llc, 0, 0);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, txreq_min, 16, 15);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, cbusy_filter_window, 10, 9);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, cbusy_filter_threshold, 8, 7);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, txreq_limit_dec, 6, 5);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, txreq_limit_inc, 4, 3);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, txreq_limit_dynamic, 2, 2);
+CPUREGS_ECTRL_ATTR__RW(cpuectrl2_el1, txreq_max, 1, 0);
+
+static struct attribute *cpuregs_cpuectrl_attrs[] = {
+	&cpuregs_attr_cpuectrl_el1_cmc_min_ways.attr,
+	&cpuregs_attr_cpuectrl_el1_l2_inst_part.attr,
+	&cpuregs_attr_cpuectrl_el1_l2_data_part.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_vmid_thr.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_asp_en.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_ch_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_tlbpf_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_hpa_l1_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_mm_hpa_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_l2_flush.attr,
+	&cpuregs_attr_cpuectrl_el1_pft_mm.attr,
+	&cpuregs_attr_cpuectrl_el1_pft_ls.attr,
+	&cpuregs_attr_cpuectrl_el1_pft_if.attr,
+	&cpuregs_attr_cpuectrl_el1_ca_uclean_evict_en.attr,
+	&cpuregs_attr_cpuectrl_el1_ca_evict_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_atomic_ld_force_near.attr,
+	&cpuregs_attr_cpuectrl_el1_atomic_acq_near.attr,
+	&cpuregs_attr_cpuectrl_el1_atomic_st_near.attr,
+	&cpuregs_attr_cpuectrl_el1_atomic_rel_near.attr,
+	&cpuregs_attr_cpuectrl_el1_atomic_ld_near.attr,
+	&cpuregs_attr_cpuectrl_el1_tlb_pred_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_tlb_pred_aggr.attr,
+	&cpuregs_attr_cpuectrl_el1_tlb_cabt_en.attr,
+	&cpuregs_attr_cpuectrl_el1_ws_thr_l2.attr,
+	&cpuregs_attr_cpuectrl_el1_ws_thr_l3.attr,
+	&cpuregs_attr_cpuectrl_el1_ws_thr_l4.attr,
+	&cpuregs_attr_cpuectrl_el1_ws_thr_dram.attr,
+	&cpuregs_attr_cpuectrl_el1_pf_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_pf_ss_l2_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_pf_sts_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_pf_sti_dis.attr,
+	&cpuregs_attr_cpuectrl_el1_pf_mode.attr,
+	&cpuregs_attr_cpuectrl_el1_rpf_mode.attr,
+	&cpuregs_attr_cpuectrl_el1_rpf_lo_conf.attr,
+	&cpuregs_attr_cpuectrl_el1_ras_raz.attr,
+	&cpuregs_attr_cpuectrl_el1_ext_llc.attr,
+	&cpuregs_attr_cpuectrl2_el1_txreq_min.attr,
+	&cpuregs_attr_cpuectrl2_el1_cbusy_filter_window.attr,
+	&cpuregs_attr_cpuectrl2_el1_cbusy_filter_threshold.attr,
+	&cpuregs_attr_cpuectrl2_el1_txreq_limit_dec.attr,
+	&cpuregs_attr_cpuectrl2_el1_txreq_limit_inc.attr,
+	&cpuregs_attr_cpuectrl2_el1_txreq_limit_dynamic.attr,
+	&cpuregs_attr_cpuectrl2_el1_txreq_max.attr,
+	NULL
+};
+
+static const struct attribute_group ectrl_cpuregs_attr_group = {
+	.attrs = cpuregs_cpuectrl_attrs,
+	.name = "extended_control"
+};
+
 static int cpuid_cpu_online(unsigned int cpu)
 {
 	int rc;
 	struct device *dev;
 	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, cpu);
 
+	/*
+	 * FIXME: There must be some better way to go from a per_cpu pointer to
+	 * the CPU ID...
+	 */
+	info->cpu = cpu;
+
 	dev = get_cpu_device(cpu);
 	if (!dev) {
 		rc = -ENODEV;
@@ -368,11 +547,17 @@ static int cpuid_cpu_online(unsigned int cpu)
 	rc = kobject_add(&info->kobj, &dev->kobj, "regs");
 	if (rc)
 		goto out;
-	rc = sysfs_create_group(&info->kobj, &cpuregs_attr_group);
+	rc = sysfs_create_group(&info->kobj, &id_cpuregs_attr_group);
 	if (rc)
 		kobject_del(&info->kobj);
 	if (system_supports_sme())
 		rc = sysfs_merge_group(&info->kobj, &sme_cpuregs_attr_group);
+
+	rc = sysfs_create_group(&info->kobj, &ectrl_cpuregs_attr_group);
+	if (rc) {
+		sysfs_remove_group(&info->kobj, &id_cpuregs_attr_group);
+		kobject_del(&info->kobj);
+	}
 out:
 	return rc;
 }
@@ -386,7 +571,8 @@ static int cpuid_cpu_offline(unsigned int cpu)
 	if (!dev)
 		return -ENODEV;
 	if (info->kobj.parent) {
-		sysfs_remove_group(&info->kobj, &cpuregs_attr_group);
+		sysfs_remove_group(&info->kobj, &id_cpuregs_attr_group);
+		sysfs_remove_group(&info->kobj, &ectrl_cpuregs_attr_group);
 		kobject_del(&info->kobj);
 	}
 
-- 
2.50.1


