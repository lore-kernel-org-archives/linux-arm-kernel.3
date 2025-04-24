Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6724BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbjrAsGjkzHb8tCUfbOmumB9MeDC4bmSUl/RmrD2cWk=; b=IwXSd9DjATk1WO1Gw9/skDEYGx
	pFLPf5Hr5LZ7ltHcvDInAlwjpdWyVf4MAS7mp3fUPslld8Vr+dBE95AWPPqyo7fp+BufNMM36iHi/
	Mr7qAOxgblIgeoOm72HF2DhzqlF5TARXLy9NmIlVVF3mTd68vqtCy57NLog0iFL3x0QvryYLv5VZS
	gEVcCUj/b9+eticGIkVB16/gAI2nex8dOrUSX1085iPVqX7yQjQuLu3HTipPUtwKe4aRtR3aUbejV
	bTYN/tY5WJ1Eo0GyzjbQ3pf6c3r4HemEc2zeitMSTRQ89wC0xkEF4ARuCnY4aTrLzL9xcfe3d7UxT
	SaiiAebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5i-0000000Edp3-2vjC;
	Thu, 24 Apr 2025 16:06:22 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLD-0000000EKnQ-0dXW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:16 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1efc457bso759559f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504053; x=1746108853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbjrAsGjkzHb8tCUfbOmumB9MeDC4bmSUl/RmrD2cWk=;
        b=axdq4aIU1SMW6l1/opmLtxeA6oyRm1rtrwPvUuwneajMcHHy3A/fYHDF8wR8GbVeek
         zHDnjlhOuyyYjV+bfEh++ZYoDmV9IAzFyUoQvb+ibhnZ8qWTfDQwFoufbAY9kMNLyMWg
         gMhXyhXaP/JTqfgN4+Nt9SdO/Du2o1ijUEiP4FiLAXc1G5rHPwDUqPYWpX9CL3OG+jh1
         jrfcLLb2yPkOzKz4FH1VGwFpeFceuLQnBsZkpTnIqAyxpUHOGUIqv+4br4egKKQBQe3I
         LrExzJ3fFVpAxm4/LWpm36D7/rLJ9pKJPuia0fLnfOAlIJdiVWKtlEtZHQOLZSoZ579B
         f0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504053; x=1746108853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbjrAsGjkzHb8tCUfbOmumB9MeDC4bmSUl/RmrD2cWk=;
        b=GpaDoNtaLfjAlaBNEu0nmKy6Ce+aULC6yi8qX8ikz3ZaaVbJ2Rqrbkzp20c5MsuzR1
         SC8WFK2rEnU/MjVFYPRwMizF6+P4kB9dAaAP/Vb4Fwjtv1RrJXNdqJ7ZFKv78cjOeXRQ
         p2RsdyxtH3z7Ew0XOXjo5l5+BHYrBwoFBmuaoaJp+2AnTdXpfjvnyB3IptNcw0rIlHqE
         oo0OWAmVsaGGseHQugnQDSmeLIj3Ei8cbwkNMseQj+SkRrF469fN23RGVUgVQ4X6jZ4g
         7s1Gvhg1fNaLv1LJX1smFwHZ4ngLmRDv3QNJpyUK302aT23o7/b1HjX0arEK7aXGFWI6
         EYHg==
X-Forwarded-Encrypted: i=1; AJvYcCVL3JSSQqV20g9na2gUrjYWKegVM13byWVxPZDoOn3wIZDVqMzIa/a3OB37oT9ZROXZWG430xktK6M5Jqfevcbj@lists.infradead.org
X-Gm-Message-State: AOJu0YxQCzQ8TGnxyKNiiGwjNlMbMitH3tv5HQYsbeGhTdMzlWo7mhRk
	mnZlpV07ecqBO8Gfcpmur56pvJUQVDAAU6RGD//NixtpJ1I0iwi4fK497l9xBjA=
X-Gm-Gg: ASbGnctSYkW76Y1PY8cAW3+xoINrY6V5T100WQa4hlmdOgM/AnLgZMwIfyT9zdnqnVv
	y1kRduXLa64xxvsQIA/EZJR0/8NK2qbBM34sBcfC2SyLB1g6nh5/GchRZPShMLrm7WHkwdnY2xS
	PNbuctVD2QMIqde62+sGkiwHu2Ct+3T9/2kqNX+DH+1MpZhC+NJxbEVQfPHGkIdMUY7H0LYcgDK
	eQGNp+LfvpQCDgxoeyTfk+8WxMYZflJnsKPWYr0ZBVyeyr6g+wUXH/eFB5VgjfgvQYOjD7yD/G+
	98ZztOBuMBB+sJEV5jX9W34GXHTSExtcPlrKhwIrc+E2BkrCtcNVEhuw0fWbZ2c87ozjh9ovkwr
	ws+H08SAdjyb1n9JY
X-Google-Smtp-Source: AGHT+IGxrh9LsxSTvY+9a9cBpLnjZelejrN6GQ8nRlvgc6+sGPLvZ+HV3GV5bjEoSe2VS8MsJ3m6Aw==
X-Received: by 2002:a05:6000:4202:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-3a06cf5c719mr2302063f8f.22.1745504053364;
        Thu, 24 Apr 2025 07:14:13 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:12 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagiri@quicinc.com>
Subject: [RFC PATCH 21/34] gunyah: Add hypercalls for demand paging
Date: Thu, 24 Apr 2025 15:13:28 +0100
Message-Id: <20250424141341.841734-22-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071415_190224_43927721 
X-CRM114-Status: GOOD (  17.58  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Three hypercalls are needed to support demand paging.
In create page mappings for a virtual machine's address space, memory
must be moved to a memory extent that is allowed to be mapped into that
address space. Memory extents are Gunyah's implementation of access
control. Once the memory is moved to the proper memory extent, the
memory can be mapped into the VM's address space. Implement the
bindings to perform those hypercalls.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagiri@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 87 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/gunyah.h      | 22 +++++++
 include/linux/gunyah.h               | 56 ++++++++++++++++++
 3 files changed, 165 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index fee21df42c17..38403dc28c66 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -39,6 +39,9 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
+#define GUNYAH_HYPERCALL_ADDRSPACE_MAP		GUNYAH_HYPERCALL(0x802B)
+#define GUNYAH_HYPERCALL_ADDRSPACE_UNMAP	GUNYAH_HYPERCALL(0x802C)
+#define GUNYAH_HYPERCALL_MEMEXTENT_DONATE	GUNYAH_HYPERCALL(0x8061)
 #define GUNYAH_HYPERCALL_VCPU_RUN		GUNYAH_HYPERCALL(0x8065)
 /* clang-format on */
 
@@ -114,6 +117,90 @@ enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
 
+/**
+ * gunyah_hypercall_addrspace_map() - Add memory to an address space from a memory extent
+ * @capid: Address space capability ID
+ * @extent_capid: Memory extent capability ID
+ * @vbase: location in address space
+ * @extent_attrs: Attributes for the memory
+ * @flags: Flags for address space mapping
+ * @offset: Offset into memory extent (physical address of memory)
+ * @size: Size of memory to map; must be page-aligned
+ */
+enum gunyah_error gunyah_hypercall_addrspace_map(u64 capid, u64 extent_capid, u64 vbase,
+					u32 extent_attrs, u32 flags, u64 offset, u64 size)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = GUNYAH_HYPERCALL_ADDRSPACE_MAP,
+		.a1 = capid,
+		.a2 = extent_capid,
+		.a3 = vbase,
+		.a4 = extent_attrs,
+		.a5 = flags,
+		.a6 = offset,
+		.a7 = size,
+		/* C language says this will be implictly zero. Gunyah requires 0, so be explicit */
+		.a8 = 0,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	arm_smccc_1_2_hvc(&args, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_addrspace_map);
+
+/**
+ * gunyah_hypercall_addrspace_unmap() - Remove memory from an address space
+ * @capid: Address space capability ID
+ * @extent_capid: Memory extent capability ID
+ * @vbase: location in address space
+ * @flags: Flags for address space mapping
+ * @offset: Offset into memory extent (physical address of memory)
+ * @size: Size of memory to map; must be page-aligned
+ */
+enum gunyah_error gunyah_hypercall_addrspace_unmap(u64 capid, u64 extent_capid, u64 vbase,
+					u32 flags, u64 offset, u64 size)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = GUNYAH_HYPERCALL_ADDRSPACE_UNMAP,
+		.a1 = capid,
+		.a2 = extent_capid,
+		.a3 = vbase,
+		.a4 = flags,
+		.a5 = offset,
+		.a6 = size,
+		/* C language says this will be implictly zero. Gunyah requires 0, so be explicit */
+		.a7 = 0,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	arm_smccc_1_2_hvc(&args, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_addrspace_unmap);
+
+/**
+ * gunyah_hypercall_memextent_donate() - Donate memory from one memory extent to another
+ * @options: donate options
+ * @from_capid: Memory extent capability ID to donate from
+ * @to_capid: Memory extent capability ID to donate to
+ * @offset: Offset into memory extent (physical address of memory)
+ * @size: Size of memory to donate; must be page-aligned
+ */
+enum gunyah_error gunyah_hypercall_memextent_donate(u32 options, u64 from_capid, u64 to_capid,
+					    u64 offset, u64 size)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MEMEXTENT_DONATE, options, from_capid, to_capid,
+				offset, size, 0, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_memextent_donate);
+
 /**
  * gunyah_hypercall_vcpu_run() - Donate CPU time to a vcpu
  * @capid: capability ID of the vCPU to run
diff --git a/arch/arm64/include/asm/gunyah.h b/arch/arm64/include/asm/gunyah.h
index 29079d1a4df2..4adf24977fd1 100644
--- a/arch/arm64/include/asm/gunyah.h
+++ b/arch/arm64/include/asm/gunyah.h
@@ -32,4 +32,26 @@ static inline int arch_gunyah_fill_irq_fwspec_params(u32 virq,
 	}
 	return 0;
 }
+
+enum arch_gunyah_memtype {
+	/* clang-format off */
+	GUNYAH_MEMTYPE_DEVICE_nGnRnE	= 0,
+	GUNYAH_DEVICE_nGnRE		= 1,
+	GUNYAH_DEVICE_nGRE		= 2,
+	GUNYAH_DEVICE_GRE		= 3,
+
+	GUNYAH_NORMAL_NC	= 0b0101,
+	GUNYAH_NORMAL_ONC_IWT	= 0b0110,
+	GUNYAH_NORMAL_ONC_IWB	= 0b0111,
+	GUNYAH_NORMAL_OWT_INC	= 0b1001,
+	GUNYAH_NORMAL_WT	= 0b1010,
+	GUNYAH_NORMAL_OWT_IWB	= 0b1011,
+	GUNYAH_NORMAL_OWB_INC	= 0b1101,
+	GUNYAH_NORMAL_OWB_IWT	= 0b1110,
+	GUNYAH_NORMAL_WB	= 0b1111,
+	/* clang-format on */
+};
+
+#define ARCH_GUNYAH_DEFAULT_MEMTYPE	GUNYAH_NORMAL_WB
+
 #endif
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index fa6e3fd4bee1..2648d3a623de 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -270,6 +270,62 @@ enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
 enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 					     size_t *recv_size, bool *ready);
 
+#define GUNYAH_ADDRSPACE_SELF_CAP 0
+
+enum gunyah_pagetable_access {
+	/* clang-format off */
+	GUNYAH_PAGETABLE_ACCESS_NONE		= 0,
+	GUNYAH_PAGETABLE_ACCESS_X		= 1,
+	GUNYAH_PAGETABLE_ACCESS_W		= 2,
+	GUNYAH_PAGETABLE_ACCESS_R		= 4,
+	GUNYAH_PAGETABLE_ACCESS_RX		= 5,
+	GUNYAH_PAGETABLE_ACCESS_RW		= 6,
+	GUNYAH_PAGETABLE_ACCESS_RWX		= 7,
+	/* clang-format on */
+};
+
+/* clang-format off */
+#define GUNYAH_MEMEXTENT_MAPPING_USER_ACCESS		GENMASK_ULL(2, 0)
+#define GUNYAH_MEMEXTENT_MAPPING_KERNEL_ACCESS		GENMASK_ULL(6, 4)
+#define GUNYAH_MEMEXTENT_MAPPING_TYPE			GENMASK_ULL(23, 16)
+/* clang-format on */
+
+enum gunyah_memextent_donate_type {
+	/* clang-format off */
+	GUNYAH_MEMEXTENT_DONATE_TO_CHILD		= 0,
+	GUNYAH_MEMEXTENT_DONATE_TO_PARENT		= 1,
+	GUNYAH_MEMEXTENT_DONATE_TO_SIBLING		= 2,
+	GUNYAH_MEMEXTENT_DONATE_TO_PROTECTED		= 3,
+	GUNYAH_MEMEXTENT_DONATE_FROM_PROTECTED		= 4,
+	/* clang-format on */
+};
+
+enum gunyah_addrspace_map_flag_bits {
+	/* clang-format off */
+	GUNYAH_ADDRSPACE_MAP_FLAG_PARTIAL	= 0,
+	GUNYAH_ADDRSPACE_MAP_FLAG_PRIVATE	= 1,
+	GUNYAH_ADDRSPACE_MAP_FLAG_VMMIO		= 2,
+	GUNYAH_ADDRSPACE_MAP_FLAG_NOSYNC	= 31,
+	/* clang-format on */
+};
+
+enum gunyah_error gunyah_hypercall_addrspace_map(u64 capid, u64 extent_capid,
+						 u64 vbase, u32 extent_attrs,
+						 u32 flags, u64 offset,
+						 u64 size);
+enum gunyah_error gunyah_hypercall_addrspace_unmap(u64 capid, u64 extent_capid,
+						   u64 vbase, u32 flags,
+						   u64 offset, u64 size);
+
+/* clang-format off */
+#define GUNYAH_MEMEXTENT_OPTION_TYPE_MASK	GENMASK_ULL(7, 0)
+#define GUNYAH_MEMEXTENT_OPTION_NOSYNC		BIT(31)
+/* clang-format on */
+
+enum gunyah_error gunyah_hypercall_memextent_donate(u32 options, u64 from_capid,
+						    u64 to_capid, u64 offset,
+						    u64 size);
+
 struct gunyah_hypercall_vcpu_run_resp {
 	union {
 		enum {
-- 
2.39.5


