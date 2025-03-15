Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB52C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia718RA/ZkBkSuI2P9xg0SvLu7OKhbBAqnVb29di5Sc=; b=glHfOECVHRu5V9WW4K5CuuXPQ6
	jhm7oTg7JsLQK2VK+qeNXEYZ1gx9VutDb8F+kitR3xCGOPOBECWyirCqdw4akRamyRKNGHuHfOgXa
	fHxMn4oYUk7abM4LkfdqlXlGrQgL/ngYn3RJ8AEanLNtErgLo7xlyvZT+o7UeOUfvcW841vuuCJEk
	1RScp51K+++JxE7Qu1CWpCgsWpJEf0BG7Hr+01+P86x9BozhBI+La9fUt+HeY5rm7SUqKQ7EZ1Iu0
	9XPPp+eMBBeFp8OXyqqzQcSdvsju84HOSEhiyo66BFfkH9LLXP6IZimNE1h/D7qjbNVzNkTFXj+96
	Q/939TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttGRe-0000000FfEe-0KHA;
	Sat, 15 Mar 2025 01:36:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFFY-0000000FZRM-0J3Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:37 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6C627203345C;
	Fri, 14 Mar 2025 17:19:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C627203345C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741997974;
	bh=ia718RA/ZkBkSuI2P9xg0SvLu7OKhbBAqnVb29di5Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eYNdIcdduH9s5OWxVGADQiwPXSSkJ0LldfV0hWzyeATTS4TnhOQUWsOJPCeHlhLsK
	 FjWyPLzxBLlbB8vZUA1CjiGPlyCH6eQMTmhvCvTD9W6mrtnIbL8wQMUtQEBqE//dMy
	 SAzGvr8sBz6jF/RxejsJVvXbHQd12x0EwOWDRFGs=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v6 04/11] Drivers: hv: Provide arch-neutral implementation of get_vtl()
Date: Fri, 14 Mar 2025 17:19:24 -0700
Message-ID: <20250315001931.631210-5-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315001931.631210-1-romank@linux.microsoft.com>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_171936_162565_D0AC7B35 
X-CRM114-Status: GOOD (  17.38  )
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

To run in the VTL mode, Hyper-V drivers have to know what
VTL the system boots in, and the arm64/hyperv code does not
have the means to compute that.

Refactor the code to hoist the function that detects VTL,
make it arch-neutral to be able to employ it to get the VTL
on arm64.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
---
 arch/x86/hyperv/hv_init.c      | 34 ----------------------------------
 drivers/hv/hv_common.c         | 31 +++++++++++++++++++++++++++++++
 include/asm-generic/mshyperv.h |  6 ++++++
 include/hyperv/hvgdk_mini.h    |  2 +-
 4 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index ddeb40930bc8..3b569291dfed 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -390,40 +390,6 @@ static void __init hv_stimer_setup_percpu_clockev(void)
 		old_setup_percpu_clockev();
 }
 
-#if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
-static u8 __init get_vtl(void)
-{
-	u64 control = HV_HYPERCALL_REP_COMP_1 | HVCALL_GET_VP_REGISTERS;
-	struct hv_input_get_vp_registers *input;
-	struct hv_output_get_vp_registers *output;
-	unsigned long flags;
-	u64 ret;
-
-	local_irq_save(flags);
-	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
-	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
-
-	memset(input, 0, struct_size(input, names, 1));
-	input->partition_id = HV_PARTITION_ID_SELF;
-	input->vp_index = HV_VP_INDEX_SELF;
-	input->input_vtl.as_uint8 = 0;
-	input->names[0] = HV_REGISTER_VSM_VP_STATUS;
-
-	ret = hv_do_hypercall(control, input, output);
-	if (hv_result_success(ret)) {
-		ret = output->values[0].reg8 & HV_X64_VTL_MASK;
-	} else {
-		pr_err("Failed to get VTL(error: %lld) exiting...\n", ret);
-		BUG();
-	}
-
-	local_irq_restore(flags);
-	return ret;
-}
-#else
-static inline u8 get_vtl(void) { return 0; }
-#endif
-
 /*
  * This function is to be invoked early in the boot sequence after the
  * hypervisor has been detected.
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 9804adb4cc56..dce4b34e293b 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -304,6 +304,37 @@ void __init hv_get_partition_id(void)
 		pr_err("Hyper-V: failed to get partition ID: %#x\n",
 		       hv_result(status));
 }
+#if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
+u8 __init get_vtl(void)
+{
+	u64 control = HV_HYPERCALL_REP_COMP_1 | HVCALL_GET_VP_REGISTERS;
+	struct hv_input_get_vp_registers *input;
+	struct hv_output_get_vp_registers *output;
+	unsigned long flags;
+	u64 ret;
+
+	local_irq_save(flags);
+	input = *this_cpu_ptr(hyperv_pcpu_input_arg);
+	output = *this_cpu_ptr(hyperv_pcpu_output_arg);
+
+	memset(input, 0, struct_size(input, names, 1));
+	input->partition_id = HV_PARTITION_ID_SELF;
+	input->vp_index = HV_VP_INDEX_SELF;
+	input->input_vtl.as_uint8 = 0;
+	input->names[0] = HV_REGISTER_VSM_VP_STATUS;
+
+	ret = hv_do_hypercall(control, input, output);
+	if (hv_result_success(ret)) {
+		ret = output->values[0].reg8 & HV_VTL_MASK;
+	} else {
+		pr_err("Failed to get VTL(error: %lld) exiting...\n", ret);
+		BUG();
+	}
+
+	local_irq_restore(flags);
+	return ret;
+}
+#endif
 
 int __init hv_common_init(void)
 {
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index b13b0cda4ac8..c5150a2b12d6 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -348,4 +348,10 @@ static inline int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u3
 }
 #endif /* CONFIG_MSHV_ROOT */
 
+#if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
+u8 __init get_vtl(void);
+#else
+static inline u8 get_vtl(void) { return 0; }
+#endif
+
 #endif
diff --git a/include/hyperv/hvgdk_mini.h b/include/hyperv/hvgdk_mini.h
index 58895883f636..98aa64e8844c 100644
--- a/include/hyperv/hvgdk_mini.h
+++ b/include/hyperv/hvgdk_mini.h
@@ -1202,7 +1202,7 @@ struct hv_send_ipi {	 /* HV_INPUT_SEND_SYNTHETIC_CLUSTER_IPI */
 	u64 cpu_mask;
 } __packed;
 
-#define	HV_X64_VTL_MASK			GENMASK(3, 0)
+#define	HV_VTL_MASK			GENMASK(3, 0)
 
 /* Hyper-V memory host visibility */
 enum hv_mem_host_visibility {
-- 
2.43.0


