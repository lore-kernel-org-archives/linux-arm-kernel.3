Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C4CCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYr9ToSIAsPSkOov0+iVDFxBzCa8JK5EE8bbWfn4nRI=; b=jOwkMLj2b0eQTT+PkW4xD4dEod
	BqqhYCSyUECIVIU61AuFPmyqO7padP4eDO7VpclT0GDn5/ToQZyMRTeX1KnxaZ1WP+hOCckCrh+zH
	pmv3zcvNWQhSI2GFy2DPe5NGULamZ0PyPZ5rFxxl6OwhcAeF1SUs+ettN5HNCZuURq3mpQbDj3mVs
	Ui5uqP3Red+Kz5YhsKoJvJdW+uaTL5Uk/wjWFxii7ftRd8Svf6aIpkaqjPcxDKQpkjCrNTRk1Y8am
	BQQJyxlSqqgmc7ge8zeciRiYiebvb0RDD/p3W3AFsqea7tSOpTNgKe4gSbKYKKAWAHt8fW4yQWXvt
	IpvYVE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0ug-00000006Air-0kLU;
	Tue, 09 Jun 2026 18:10:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0ub-00000006Afu-3Tjo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:10:55 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4C60920B716D;
	Tue,  9 Jun 2026 11:10:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4C60920B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781028633;
	bh=jYr9ToSIAsPSkOov0+iVDFxBzCa8JK5EE8bbWfn4nRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHZlDGp+HB/iPgBD0iYEENY7VB5p6pAvvGGo/sAu6yibWCLUndRxOz1zNoMKTQ1eB
	 YO6fXVh4F5HHgt93WjApW58xY/mElUnkpNkI1fQ36xOS9pvpQxxjM2QS2k9eva5Ip0
	 LH4GCos2hUWoaN8VZnYZoX/DnW5Lh3KWPJoRR+98=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [RFC PATCH 5/6] arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
Date: Tue,  9 Jun 2026 11:10:29 -0700
Message-ID: <20260609181030.2378391-6-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_111053_901998_7ECBF7A1 
X-CRM114-Status: GOOD (  16.19  )
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

Modify the five hypercall wrapper functions to check is_realm_world()
and use the per-CPU rsi_host_call structure when inside a Realm.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_core.c | 175 +++++++++++++++++++++++++++++-------
 1 file changed, 141 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
index e33a9e3c366a1..1759998ef2667 100644
--- a/arch/arm64/hyperv/hv_core.c
+++ b/arch/arm64/hyperv/hv_core.c
@@ -16,6 +16,7 @@
 #include <asm-generic/bug.h>
 #include <hyperv/hvhdk.h>
 #include <asm/mshyperv.h>
+#include <asm/rsi.h>
 
 /*
  * hv_do_hypercall- Invoke the specified hypercall
@@ -25,12 +26,32 @@ u64 hv_do_hypercall(u64 control, void *input, void *output)
 	struct arm_smccc_res	res;
 	u64			input_address;
 	u64			output_address;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 ret;
 
 	input_address = input ? virt_to_phys(input) : 0;
 	output_address = output ? virt_to_phys(output) : 0;
 
-	arm_smccc_1_1_hvc(HV_FUNC_ID, control,
-			  input_address, output_address, &res);
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = *this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		memset(hostcall, 0, sizeof(*hostcall));
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = control;
+		hostcall->gprs[2] = input_address;
+		hostcall->gprs[3] = output_address;
+
+		if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS)
+			ret = hostcall->gprs[0];
+		else
+			ret = HV_STATUS_INVALID_HYPERCALL_INPUT;
+		local_irq_restore(flags);
+		return ret;
+	}
+
+	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input_address,
+			  output_address, &res);
 	return res.a0;
 }
 EXPORT_SYMBOL_GPL(hv_do_hypercall);
@@ -45,9 +66,28 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
 {
 	struct arm_smccc_res	res;
 	u64			control;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 ret;
 
 	control = (u64)code | HV_HYPERCALL_FAST_BIT;
 
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = *this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		memset(hostcall, 0, sizeof(*hostcall));
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = control;
+		hostcall->gprs[2] = input;
+
+		if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS)
+			ret = hostcall->gprs[0];
+		else
+			ret = HV_STATUS_INVALID_HYPERCALL_INPUT;
+		local_irq_restore(flags);
+		return ret;
+	}
+
 	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
 	return res.a0;
 }
@@ -62,9 +102,29 @@ u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
 {
 	struct arm_smccc_res	res;
 	u64			control;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 ret;
 
 	control = (u64)code | HV_HYPERCALL_FAST_BIT;
 
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = *this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		memset(hostcall, 0, sizeof(*hostcall));
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = control;
+		hostcall->gprs[2] = input1;
+		hostcall->gprs[3] = input2;
+
+		if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS)
+			ret = hostcall->gprs[0];
+		else
+			ret = HV_STATUS_INVALID_HYPERCALL_INPUT;
+		local_irq_restore(flags);
+		return ret;
+	}
+
 	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
 	return res.a0;
 }
@@ -76,24 +136,44 @@ EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
 void hv_set_vpreg(u32 msr, u64 value)
 {
 	struct arm_smccc_res res;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 status;
+
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = *this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		memset(hostcall, 0, sizeof(*hostcall));
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = HVCALL_SET_VP_REGISTERS |
+				    HV_HYPERCALL_FAST_BIT |
+				    HV_HYPERCALL_REP_COMP_1;
+		hostcall->gprs[2] = HV_PARTITION_ID_SELF;
+		hostcall->gprs[3] = HV_VP_INDEX_SELF;
+		hostcall->gprs[4] = msr;
+		hostcall->gprs[6] = value;
 
-	arm_smccc_1_1_hvc(HV_FUNC_ID,
-		HVCALL_SET_VP_REGISTERS | HV_HYPERCALL_FAST_BIT |
-			HV_HYPERCALL_REP_COMP_1,
-		HV_PARTITION_ID_SELF,
-		HV_VP_INDEX_SELF,
-		msr,
-		0,
-		value,
-		0,
-		&res);
+		if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS)
+			status = hostcall->gprs[0];
+		else
+			status = HV_STATUS_INVALID_HYPERCALL_INPUT;
+		local_irq_restore(flags);
+	} else {
+		arm_smccc_1_1_hvc(HV_FUNC_ID,
+				  HVCALL_SET_VP_REGISTERS |
+					  HV_HYPERCALL_FAST_BIT |
+					  HV_HYPERCALL_REP_COMP_1,
+				  HV_PARTITION_ID_SELF, HV_VP_INDEX_SELF, msr,
+				  0, value, 0, &res);
+		status = res.a0;
+	}
 
 	/*
-	 * Something is fundamentally broken in the hypervisor if
-	 * setting a VP register fails. There's really no way to
-	 * continue as a guest VM, so panic.
+	 * Something is fundamentally broken in the hypervisor (or, in a
+	 * Realm, the RMM denied the host call) if setting a VP register
+	 * fails. There's really no way to continue as a guest VM, so panic.
 	 */
-	BUG_ON(!hv_result_success(res.a0));
+	BUG_ON(!hv_result_success(status));
 }
 EXPORT_SYMBOL_GPL(hv_set_vpreg);
 
@@ -108,29 +188,56 @@ void hv_get_vpreg_128(u32 msr, struct hv_get_vp_registers_output *result)
 {
 	struct arm_smccc_1_2_regs args;
 	struct arm_smccc_1_2_regs res;
+	struct rsi_host_call *hostcall;
+	u64 status;
 
-	args.a0 = HV_FUNC_ID;
-	args.a1 = HVCALL_GET_VP_REGISTERS | HV_HYPERCALL_FAST_BIT |
-			HV_HYPERCALL_REP_COMP_1;
-	args.a2 = HV_PARTITION_ID_SELF;
-	args.a3 = HV_VP_INDEX_SELF;
-	args.a4 = msr;
+	if (is_realm_world()) {
+		unsigned long flags;
 
-	/*
-	 * Use the SMCCC 1.2 interface because the results are in registers
-	 * beyond X0-X3.
-	 */
-	arm_smccc_1_2_hvc(&args, &res);
+		local_irq_save(flags);
+		hostcall = *this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		memset(hostcall, 0, sizeof(*hostcall));
+
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = HVCALL_GET_VP_REGISTERS |
+				    HV_HYPERCALL_FAST_BIT |
+				    HV_HYPERCALL_REP_COMP_1;
+		hostcall->gprs[2] = HV_PARTITION_ID_SELF;
+		hostcall->gprs[3] = HV_VP_INDEX_SELF;
+		hostcall->gprs[4] = msr;
+
+		if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS) {
+			status = hostcall->gprs[0];
+			result->as64.low = hostcall->gprs[6];
+			result->as64.high = hostcall->gprs[7];
+		} else {
+			status = HV_STATUS_INVALID_HYPERCALL_INPUT;
+		}
+		local_irq_restore(flags);
+	} else {
+		args.a0 = HV_FUNC_ID;
+		args.a1 = HVCALL_GET_VP_REGISTERS | HV_HYPERCALL_FAST_BIT |
+			  HV_HYPERCALL_REP_COMP_1;
+		args.a2 = HV_PARTITION_ID_SELF;
+		args.a3 = HV_VP_INDEX_SELF;
+		args.a4 = msr;
+
+		/*
+		 * Use the SMCCC 1.2 interface because the results are in
+		 * registers beyond X0-X3.
+		 */
+		arm_smccc_1_2_hvc(&args, &res);
+		status = res.a0;
+		result->as64.low = res.a6;
+		result->as64.high = res.a7;
+	}
 
 	/*
-	 * Something is fundamentally broken in the hypervisor if
-	 * getting a VP register fails. There's really no way to
-	 * continue as a guest VM, so panic.
+	 * Something is fundamentally broken in the hypervisor (or, in a
+	 * Realm, the RMM denied the host call) if getting a VP register
+	 * fails. There's really no way to continue as a guest VM, so panic.
 	 */
-	BUG_ON(!hv_result_success(res.a0));
-
-	result->as64.low = res.a6;
-	result->as64.high = res.a7;
+	BUG_ON(!hv_result_success(status));
 }
 EXPORT_SYMBOL_GPL(hv_get_vpreg_128);
 
-- 
2.45.4


