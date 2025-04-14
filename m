Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6F1C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQvs5PM1gpfyo8zFdbVtMefzo4Lv3nxL51EfMSsyelE=; b=M318NFevqOqn35lX1jjZgMCDKP
	qDvS5VGfXaUjq31nJAPPWrtHPRkr7PsVZlf78h/YDcY8mME65Om8XwcBPYbYx/tHvisvMGfs6mBQb
	3GKLWGS0NM7R8FPcWvTRQQDlsYyweGx8UMYAgev21N1ERZ3vmy/YSeWvgAsU/IMfxYYisHJMGiheV
	v6zrcNFWn9fJX9A6XVYVL57wgt5dfoU8248MqFRL7Rmpfs74EzJgm199rqCH2nW3WerbVXrz/5ywn
	lZlGQ3D19OrypTmbR99HqZwZhIQUpuUEqU18UusG7MtSrUcChPL5VKx0krmiz1tatdKOJwFbxS1qg
	FdiDoK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SkG-00000003nFC-4BBm;
	Mon, 14 Apr 2025 22:57:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SaD-00000003l2v-3vY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 22:47:20 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.159.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6207A210C430;
	Mon, 14 Apr 2025 15:47:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6207A210C430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744670836;
	bh=aQvs5PM1gpfyo8zFdbVtMefzo4Lv3nxL51EfMSsyelE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPYJHBICx+xH9LX2e3L4VV6CztOOvCz2OniMVE+PJWs35ooH19S+NwW7BrXhUwBf1
	 l0AX7Rsc8NxQtA2cMZZTk4wAevrEilkuiQaLqc7gorC7bmEUqE0oSMHRS5dHNvbyp7
	 Oj/IU9067SiAY7hbQvR2Ayi8El6yQIf5eMWhh/h0=
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
	rafael.j.wysocki@intel.com,
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
Subject: [PATCH hyperv-next v8 04/11] Drivers: hv: Provide arch-neutral implementation of get_vtl()
Date: Mon, 14 Apr 2025 15:47:06 -0700
Message-ID: <20250414224713.1866095-5-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414224713.1866095-1-romank@linux.microsoft.com>
References: <20250414224713.1866095-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_154718_027212_277450AD 
X-CRM114-Status: GOOD (  17.36  )
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
index b3b11be11650..1ece6721c486 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -317,6 +317,37 @@ void __init hv_get_partition_id(void)
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
index ccccb1cbf7df..6c51a25ed7b5 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -378,4 +378,10 @@ static inline int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u3
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
index abf0bd76e370..cf0923dc727d 100644
--- a/include/hyperv/hvgdk_mini.h
+++ b/include/hyperv/hvgdk_mini.h
@@ -1228,7 +1228,7 @@ struct hv_send_ipi {	 /* HV_INPUT_SEND_SYNTHETIC_CLUSTER_IPI */
 	u64 cpu_mask;
 } __packed;
 
-#define	HV_X64_VTL_MASK			GENMASK(3, 0)
+#define	HV_VTL_MASK			GENMASK(3, 0)
 
 /* Hyper-V memory host visibility */
 enum hv_mem_host_visibility {
-- 
2.43.0


