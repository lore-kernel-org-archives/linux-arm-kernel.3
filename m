Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FEACA5FE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knU7HBR//UE+exQHnyDsw2440UI1lI4Gy/ELvUYzqBM=; b=nK0LBILl6WCBjDPQVTBL2OkIBU
	gB2ajXd6IsHNsHzwEKG/IzYYw1L+3045OhWoSjys0t59+7lmh3pELC1BqPCVji2D4suZFMiDhqSu5
	1Y5G+sHZIzT8vO6wX4v2g1s+uZVyQucs8dFsbBXnrSZ0yOL24ptcOLO+hGje3BpsB13nBnb1Nz1rV
	3fWd+2pDzkG7zped3Qv3sZGba7cl+5cxVd3eqGKaccf4DUrx9fNUb21gyEXPuvQsaYLcKg7xEQqyQ
	QC5LhtBdW2Nql7UtqQRPR7i6fvS7TwvO2JNboHZwTy6Ene5wmJCNgLEDsWnDungyAf+piVr8pzrl4
	Aw0Tni1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHh-0000000CZIe-3Uwa;
	Fri, 02 Oct 2026 21:59:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHO-0000000CZ9A-07Nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 21:59:00 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 898BB20B7171;
	Fri,  2 Oct 2026 14:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 898BB20B7171
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790978282;
	bh=knU7HBR//UE+exQHnyDsw2440UI1lI4Gy/ELvUYzqBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8GuxQfXtUVxPGeqyqXV+oOsZpejIW4HXgIolDCTya42+pnD48yXjrcyYwuo+lNU7
	 ddp3GKzk3DLhRzZjBfL1qNXMwtzaKqO6akeJP+K7UPfnsxayl9F7yHLx6nqH3QiV5w
	 ASFIYy47Wd8o7eR2hDNutBHL8ft1wr39+nn3NtHI=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	mhklinux@outlook.com
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
	linux-arch@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
Date: Fri,  2 Oct 2026 14:57:24 -0700
Message-ID: <20261002215725.2015959-6-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_145858_176529_3C47F64E 
X-CRM114-Status: GOOD (  17.39  )
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

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_core.c | 155 ++++++++++++++++++++++++++++--------
 1 file changed, 121 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
index e33a9e3..2f6fc14 100644
--- a/arch/arm64/hyperv/hv_core.c
+++ b/arch/arm64/hyperv/hv_core.c
@@ -12,11 +12,43 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/arm-smccc.h>
+#include <linux/arm-rsi-cmds.h>
 #include <linux/module.h>
+#include <linux/smp.h>
 #include <asm-generic/bug.h>
 #include <hyperv/hvhdk.h>
 #include <asm/mshyperv.h>
 
+/*
+ * hv_do_rsi_hypercall - Helper function to invoke a hypercall from a
+ * Realm world using the RSI interface.
+ */
+static u64 hv_do_rsi_hypercall(u64 control, u64 input1, u64 input2)
+{
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 ret;
+
+	if (!hv_hostcall_array)
+		return HV_STATUS_INVALID_HYPERCALL_INPUT;
+
+	local_irq_save(flags);
+	hostcall = &hv_hostcall_array[smp_processor_id()];
+	memset(hostcall, 0, sizeof(*hostcall));
+	hostcall->gprs[0] = HV_FUNC_ID;
+	hostcall->gprs[1] = control;
+	hostcall->gprs[2] = input1;
+	hostcall->gprs[3] = input2;
+
+	if (rsi_host_call(virt_to_phys(hostcall)) == RSI_SUCCESS)
+		ret = hostcall->gprs[0];
+	else
+		ret = HV_STATUS_INVALID_HYPERCALL_INPUT;
+
+	local_irq_restore(flags);
+	return ret;
+}
+
 /*
  * hv_do_hypercall- Invoke the specified hypercall
  */
@@ -29,8 +61,11 @@ u64 hv_do_hypercall(u64 control, void *input, void *output)
 	input_address = input ? virt_to_phys(input) : 0;
 	output_address = output ? virt_to_phys(output) : 0;
 
-	arm_smccc_1_1_hvc(HV_FUNC_ID, control,
-			  input_address, output_address, &res);
+	if (is_realm_world())
+		return hv_do_rsi_hypercall(control, input_address, output_address);
+
+	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input_address,
+			  output_address, &res);
 	return res.a0;
 }
 EXPORT_SYMBOL_GPL(hv_do_hypercall);
@@ -48,6 +83,9 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
 
 	control = (u64)code | HV_HYPERCALL_FAST_BIT;
 
+	if (is_realm_world())
+		return hv_do_rsi_hypercall(control, input, 0);
+
 	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
 	return res.a0;
 }
@@ -65,6 +103,9 @@ u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
 
 	control = (u64)code | HV_HYPERCALL_FAST_BIT;
 
+	if (is_realm_world())
+		return hv_do_rsi_hypercall(control, input1, input2);
+
 	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
 	return res.a0;
 }
@@ -76,24 +117,44 @@ EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
 void hv_set_vpreg(u32 msr, u64 value)
 {
 	struct arm_smccc_res res;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 status;
 
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
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = &hv_hostcall_array[smp_processor_id()];
+		memset(hostcall, 0, sizeof(*hostcall));
+		hostcall->gprs[0] = HV_FUNC_ID;
+		hostcall->gprs[1] = HVCALL_SET_VP_REGISTERS |
+				    HV_HYPERCALL_FAST_BIT |
+				    HV_HYPERCALL_REP_COMP_1;
+		hostcall->gprs[2] = HV_PARTITION_ID_SELF;
+		hostcall->gprs[3] = HV_VP_INDEX_SELF;
+		hostcall->gprs[4] = msr;
+		hostcall->gprs[6] = value;
+
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
 
@@ -108,29 +169,55 @@ void hv_get_vpreg_128(u32 msr, struct hv_get_vp_registers_output *result)
 {
 	struct arm_smccc_1_2_regs args;
 	struct arm_smccc_1_2_regs res;
+	struct rsi_host_call *hostcall;
+	unsigned long flags;
+	u64 status;
 
-	args.a0 = HV_FUNC_ID;
-	args.a1 = HVCALL_GET_VP_REGISTERS | HV_HYPERCALL_FAST_BIT |
-			HV_HYPERCALL_REP_COMP_1;
-	args.a2 = HV_PARTITION_ID_SELF;
-	args.a3 = HV_VP_INDEX_SELF;
-	args.a4 = msr;
+	if (is_realm_world()) {
+		local_irq_save(flags);
+		hostcall = &hv_hostcall_array[smp_processor_id()];
+		memset(hostcall, 0, sizeof(*hostcall));
 
-	/*
-	 * Use the SMCCC 1.2 interface because the results are in registers
-	 * beyond X0-X3.
-	 */
-	arm_smccc_1_2_hvc(&args, &res);
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


