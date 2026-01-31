Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B256AD7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwAokIjvjP4GaY69UfG//QG/8WpwXMR+YpVP6jfcixQ=; b=M1relSFuUrav8j4YDpwyIk2dCd
	JWYSWTA46050ocmGotJpK9z6kzm0tVwt+PHcwqgyTKZl2qAOoVpRsAPreHYyMrrzD6eO0UJMaygKu
	PV+V5czk7ls0GCe8eCd25qwwzdaejGy7YBsZ4WrHEVzgL5vD0s7xQ523WriDgtVCu3zEu0TFToLa2
	lrMsRyvx3ehF2aSt320w67qAsJtrkDEaiuydBdmwpXj8/XrQ/U9RIjAD/iJp0NqvnN5yaypwi7pWl
	bVATLCPg0IIC6tcIgOUadnjTTSWjnngMdKivPDLMX5L+Z+3dghexAKHoAopi7rniu+hIGRI8asCoK
	KqlNWEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB4B-00000002d81-2cId;
	Sat, 31 Jan 2026 13:31:17 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2t-00000002c7S-0HAq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:55 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b871e14de77so474319266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866188; x=1770470988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwAokIjvjP4GaY69UfG//QG/8WpwXMR+YpVP6jfcixQ=;
        b=vwpS+WzNoNymQ0j5yzOrdiTtAb9aqHlkfHBB9/Gv8vrEw3GvXiLy37px4CQSoAmhJR
         0kfa37OeZz9gOe5lXE3lXegsb9l8MfR1KKYw2YUaMdG1kpFbswafVffmaZym+1aLCwNt
         Z+7J6/bOs+WpJP1BRxbN8cX3QGbDNzg2tdP3bE4GXWI6+1xzJ4YfedL86uLWWFQ1stwt
         NHkrbMJXjPXTXphKIxXMC79gzypoF8Ja6tw7ewdjHDgWTKj8sTzEuXn0LteXRBAqQff/
         cqBtp529obPSQTv/G5rTj8TErF4jYse54MF0vv3dwdQEgT+FediWzDLSUVmUISB/tELy
         mKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866188; x=1770470988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwAokIjvjP4GaY69UfG//QG/8WpwXMR+YpVP6jfcixQ=;
        b=K7IDqwqgMkVbYsH92QmMgUJzh7V6kA8n0s5jZSWUN/k92awuwFwqQKH4v3eaysXgiK
         E67unw1BA8sOnvUXFuy3JA3BNay5JkiAMglgQOF2qC8hTBVbsBFmJJwEeLA5nUzR8uPH
         D0bN9Z4YKkfsiksLT6PgRxiq3qeNmEFPThr+VI/B58ySy9o8XbJevECt486tiYkaK4FE
         8+VY5mpmc/Gqwq4q+ZE/oLA3+Ueg+VO0uRE5ibx5oVtgPMpiwTyzh6xeYlg7roUzr+HO
         UEoEYjUdrtnZCkuRojH7LsXpELx5tzPQrFPYhDL/uMhL9/eTLDGSQJl0bwaw6tWGVBSf
         L5qw==
X-Forwarded-Encrypted: i=1; AJvYcCVnDdmJgP7Qi2aqmeINDjEZnISAXefOn50g0OVqZZdyY5XSCmkvKWTSx+GcT2ZdPwqFdL8i0n+TVbujuKFoHGT/@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxWsURRug/hdC/4JGsKz6TGFT2aIRI5lPbmF/I2h5wBHWwU6H
	d45hKXqkQkwSwlfUB13zWqHznMoSoeKthoQX7vFIaqe1TS5xDk9nzwwQ18c7SCSfVJpDR8hM86r
	lSN11tX5Y7eidou4n3ePX2g==
X-Received: from ejboy27.prod.google.com ([2002:a17:907:105b:b0:b88:4858:17c6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:eecb:b0:b88:31f9:1d9a with SMTP id a640c23a62f3a-b8dff71fbbcmr400020566b.62.1769866188334;
 Sat, 31 Jan 2026 05:29:48 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:46 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-29-vdonnefort@google.com>
Subject: [PATCH v11 28/30] KVM: arm64: Add hyp_enter/hyp_exit events to
 nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_052954_268034_831C790C 
X-CRM114-Status: GOOD (  18.56  )
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

The hyp_enter and hyp_exit events are logged by the hypervisor any time
it is entered and exited.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c7883..58f7fe685150 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -896,6 +896,9 @@ struct kvm_vcpu_arch {
 
 	/* Per-vcpu TLB for VNCR_EL2 -- NULL when !NV */
 	struct vncr_tlb	*vncr_tlb;
+
+	/* Hyp-readable copy of kvm_vcpu::pid */
+	pid_t pid;
 };
 
 /*
diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index d6e033c96c52..221a1dacb2f0 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -7,4 +7,43 @@
 #include <nvhe/trace.h>
 #endif
 
+#ifndef __HYP_ENTER_EXIT_REASON
+#define __HYP_ENTER_EXIT_REASON
+enum hyp_enter_exit_reason {
+	HYP_REASON_SMC,
+	HYP_REASON_HVC,
+	HYP_REASON_PSCI,
+	HYP_REASON_HOST_ABORT,
+	HYP_REASON_GUEST_EXIT,
+	HYP_REASON_ERET_HOST,
+	HYP_REASON_ERET_GUEST,
+	HYP_REASON_UNKNOWN	/* Must be last */
+};
+#endif
+
+HYP_EVENT(hyp_enter,
+	HE_PROTO(struct kvm_cpu_context *host_ctxt, u8 reason),
+	HE_STRUCT(
+		he_field(u8, reason)
+		he_field(pid_t, vcpu)
+	),
+	HE_ASSIGN(
+		__entry->reason = reason;
+		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
+	),
+	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+);
+
+HYP_EVENT(hyp_exit,
+	HE_PROTO(struct kvm_cpu_context *host_ctxt, u8 reason),
+	HE_STRUCT(
+		he_field(u8, reason)
+		he_field(pid_t, vcpu)
+	),
+	HE_ASSIGN(
+		__entry->reason = reason;
+		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
+	),
+	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+);
 #endif
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f7f222ecaf88..5b7c728c69ca 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -662,6 +662,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
+
+	vcpu->arch.pid = pid_nr(vcpu->pid);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
new file mode 100644
index 000000000000..1258bc84477f
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KVM_HYP_NVHE_ARM_SMCCC_H__
+#define __ARM64_KVM_HYP_NVHE_ARM_SMCCC_H__
+
+#include <asm/kvm_hypevents.h>
+
+#include <linux/arm-smccc.h>
+
+#define hyp_smccc_1_1_smc(...)					\
+	do {							\
+		trace_hyp_exit(NULL, HYP_REASON_SMC);		\
+		arm_smccc_1_1_smc(__VA_ARGS__);			\
+		trace_hyp_enter(NULL, HYP_REASON_SMC);		\
+	} while (0)
+
+#define hyp_smccc_1_2_smc(...)					\
+	do {							\
+		trace_hyp_exit(NULL, HYP_REASON_SMC);		\
+		arm_smccc_1_2_smc(__VA_ARGS__);			\
+		trace_hyp_enter(NULL, HYP_REASON_SMC);		\
+	} while (0)
+
+#endif /* __ARM64_KVM_HYP_NVHE_ARM_SMCCC_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
index 802a18b77c56..8813ff250f8e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
@@ -6,6 +6,18 @@
 
 #include <asm/kvm_hyptrace.h>
 
+static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!host_ctxt)
+		host_ctxt = host_data_ptr(host_ctxt);
+
+	vcpu = host_ctxt->__hyp_running_vcpu;
+
+	return vcpu ? vcpu->arch.pid : 0;
+}
+
 #define HE_PROTO(__args...)	__args
 #define HE_ASSIGN(__args...)	__args
 #define HE_STRUCT		RE_STRUCT
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index f731cc4c3f28..ee5d49e733c0 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -26,10 +26,10 @@
  * the duration and are therefore serialised.
  */
 
-#include <linux/arm-smccc.h>
 #include <linux/arm_ffa.h>
 #include <asm/kvm_pkvm.h>
 
+#include <nvhe/arm-smccc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/memory.h>
@@ -147,7 +147,7 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
 {
 	struct arm_smccc_1_2_regs res;
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_FN64_RXTX_MAP,
 		.a1 = hyp_virt_to_phys(hyp_buffers.tx),
 		.a2 = hyp_virt_to_phys(hyp_buffers.rx),
@@ -161,7 +161,7 @@ static int ffa_unmap_hyp_buffers(void)
 {
 	struct arm_smccc_1_2_regs res;
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_RXTX_UNMAP,
 		.a1 = HOST_FFA_ID,
 	}, &res);
@@ -172,7 +172,7 @@ static int ffa_unmap_hyp_buffers(void)
 static void ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 			     u32 handle_hi, u32 fraglen, u32 endpoint_id)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_MEM_FRAG_TX,
 		.a1 = handle_lo,
 		.a2 = handle_hi,
@@ -184,7 +184,7 @@ static void ffa_mem_frag_tx(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 static void ffa_mem_frag_rx(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 			     u32 handle_hi, u32 fragoff)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_MEM_FRAG_RX,
 		.a1 = handle_lo,
 		.a2 = handle_hi,
@@ -196,7 +196,7 @@ static void ffa_mem_frag_rx(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 static void ffa_mem_xfer(struct arm_smccc_1_2_regs *res, u64 func_id, u32 len,
 			  u32 fraglen)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = func_id,
 		.a1 = len,
 		.a2 = fraglen,
@@ -206,7 +206,7 @@ static void ffa_mem_xfer(struct arm_smccc_1_2_regs *res, u64 func_id, u32 len,
 static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 			     u32 handle_hi, u32 flags)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_MEM_RECLAIM,
 		.a1 = handle_lo,
 		.a2 = handle_hi,
@@ -216,7 +216,7 @@ static void ffa_mem_reclaim(struct arm_smccc_1_2_regs *res, u32 handle_lo,
 
 static void ffa_retrieve_req(struct arm_smccc_1_2_regs *res, u32 len)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_FN64_MEM_RETRIEVE_REQ,
 		.a1 = len,
 		.a2 = len,
@@ -225,7 +225,7 @@ static void ffa_retrieve_req(struct arm_smccc_1_2_regs *res, u32 len)
 
 static void ffa_rx_release(struct arm_smccc_1_2_regs *res)
 {
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_RX_RELEASE,
 	}, res);
 }
@@ -728,7 +728,7 @@ static int hyp_ffa_post_init(void)
 	size_t min_rxtx_sz;
 	struct arm_smccc_1_2_regs res;
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
 		.a0 = FFA_ID_GET,
 	}, &res);
 	if (res.a0 != FFA_SUCCESS)
@@ -737,7 +737,7 @@ static int hyp_ffa_post_init(void)
 	if (res.a2 != HOST_FFA_ID)
 		return -EINVAL;
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
 		.a0 = FFA_FEATURES,
 		.a1 = FFA_FN64_RXTX_MAP,
 	}, &res);
@@ -788,7 +788,7 @@ static void do_ffa_version(struct arm_smccc_1_2_regs *res,
 	 * first if TEE supports it.
 	 */
 	if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version)) {
-		arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+		hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 			.a0 = FFA_VERSION,
 			.a1 = ffa_req_version,
 		}, res);
@@ -824,7 +824,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 		goto out_unlock;
 	}
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_PARTITION_INFO_GET,
 		.a1 = uuid0,
 		.a2 = uuid1,
@@ -939,7 +939,7 @@ int hyp_ffa_init(void *pages)
 	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
 		return 0;
 
-	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
+	hyp_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
 		.a0 = FFA_VERSION,
 		.a1 = FFA_VERSION_1_2,
 	}, &res);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 7f5b9807c42d..e1d4a53260ff 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -12,6 +12,7 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
 #include <nvhe/ffa.h>
@@ -137,6 +138,8 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 
 	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
+
+	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
 
 static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
@@ -728,7 +731,9 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 
 static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
 {
+	trace_hyp_exit(host_ctxt, HYP_REASON_SMC);
 	__kvm_hyp_host_forward_smc(host_ctxt);
+	trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
 }
 
 static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
@@ -752,18 +757,24 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
+
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
+		trace_hyp_enter(host_ctxt, HYP_REASON_HVC);
 		handle_host_hcall(host_ctxt);
 		break;
 	case ESR_ELx_EC_SMC64:
+		trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
 		handle_host_smc(host_ctxt);
 		break;
 	case ESR_ELx_EC_IABT_LOW:
 	case ESR_ELx_EC_DABT_LOW:
+		trace_hyp_enter(host_ctxt, HYP_REASON_HOST_ABORT);
 		handle_host_mem_abort(host_ctxt);
 		break;
 	default:
 		BUG();
 	}
+
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET_HOST);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18..ab4c7bddb163 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -6,11 +6,12 @@
 
 #include <asm/kvm_asm.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
-#include <linux/arm-smccc.h>
 #include <linux/kvm_host.h>
 #include <uapi/linux/psci.h>
 
+#include <nvhe/arm-smccc.h>
 #include <nvhe/memory.h>
 #include <nvhe/trap_handler.h>
 
@@ -65,7 +66,7 @@ static unsigned long psci_call(unsigned long fn, unsigned long arg0,
 {
 	struct arm_smccc_res res;
 
-	arm_smccc_1_1_smc(fn, arg0, arg1, arg2, &res);
+	hyp_smccc_1_1_smc(fn, arg0, arg1, arg2, &res);
 	return res.a0;
 }
 
@@ -206,6 +207,7 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	struct kvm_cpu_context *host_ctxt;
 
 	host_ctxt = host_data_ptr(host_ctxt);
+	trace_hyp_enter(host_ctxt, HYP_REASON_PSCI);
 
 	if (is_cpu_on)
 		boot_args = this_cpu_ptr(&cpu_on_args);
@@ -221,6 +223,7 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
+	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
 	__host_enter(host_ctxt);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 779089e42681..ca60721501d1 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -7,7 +7,6 @@
 #include <hyp/switch.h>
 #include <hyp/sysreg-sr.h>
 
-#include <linux/arm-smccc.h>
 #include <linux/kvm_host.h>
 #include <linux/types.h>
 #include <linux/jump_label.h>
@@ -21,6 +20,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 #include <asm/fpsimd.h>
 #include <asm/debug-monitors.h>
@@ -308,10 +308,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__debug_switch_to_guest(vcpu);
 
 	do {
+		trace_hyp_exit(host_ctxt, HYP_REASON_ERET_GUEST);
+
 		/* Jump in the fire! */
 		exit_code = __guest_enter(vcpu);
 
 		/* And we're baaack! */
+		trace_hyp_enter(host_ctxt, HYP_REASON_GUEST_EXIT);
 	} while (fixup_guest_exit(vcpu, &exit_code));
 
 	__sysreg_save_state_nvhe(guest_ctxt);
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 0144cd26703e..1ad6a55ba95c 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -364,8 +364,26 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 	.enable_event		= hyp_trace_enable_event,
 };
 
+static const char *__hyp_enter_exit_reason_str(u8 reason);
+
 #include <asm/kvm_define_hypevents.h>
 
+static const char *__hyp_enter_exit_reason_str(u8 reason)
+{
+	static const char strs[][12] = {
+		"smc",
+		"hvc",
+		"psci",
+		"host_abort",
+		"guest_exit",
+		"eret_host",
+		"eret_guest",
+		"unknown",
+	};
+
+	return strs[min(reason, HYP_REASON_UNKNOWN)];
+}
+
 static void __init hyp_trace_init_events(void)
 {
 	struct hyp_event_id *hyp_event_id = __hyp_event_ids_start;
-- 
2.53.0.rc1.225.gd81095ad13-goog


