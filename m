Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE8C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 03:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPH5x3OkyPZV5JxMQZ1zGZ5oaQgdw1gt8lYnvIM/Z/8=; b=eN8xChsOKRytvEzqcCgb8VpvJD
	Zip3b30Cc3xF2WX11Yq8j885BrQx1uhKqp6lAfjB5MaNXA/p3TI1bWfk7rVuPMbBhLVjlBhffTH5O
	y0rnZFnYim8ub4WGy6M/Bnb1Wpp/WklaxeWvOB+oqrDtCcAJHgYG5TUeMNezt8JcoxgQUgL0pR0Mq
	YYQw4aNkQu1lhqssGQ9ZtJGzeLrVH6mQzjdKf7yOxZ3pY1SCf4jZiIM12vdJGSVGMs4BYizsX8Qdj
	MrJRjFCXjSLaL6f0xpE+bm2BgjjcPe3mDJ3rBfiHOR9cvQTDqJLiCkFSGy3GA8sZSGXWFsJfBOLJs
	bVWqSTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhXM-00000000iwN-16id;
	Fri, 02 May 2025 03:58:08 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhTo-00000000ieY-3jWL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 03:54:30 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6064207317eso858339eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746158068; x=1746762868; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPH5x3OkyPZV5JxMQZ1zGZ5oaQgdw1gt8lYnvIM/Z/8=;
        b=ldyvMGdUw8IYZ1KFtd8bQqHfMzVf81xIDLd8dtnmHIWK4klF3fRNmsOovo6mSbrjyu
         Ju6dJJfN695SbNUeG9Li2FNZVxXMFaILmggum6GAX/CLoh4Q7h7B7/YohW0zqqJoOSMm
         BbsnobjbXL0PSeMlHkQ9IROltoUkvHE5EMLScEB3DDypsvSmR9IIgq/l82859EqrtqIn
         RbPp6zL8xClXLsT/DqwKGE73KFobh/nPX39uPp9C5vlG4X5lFOZMazsgVxmqX24YjtmE
         GPos9qwfXqKln7SVvzM928vSF2t/5tK6/0wyNC/Clexmob54t8wmgPWX6EACy+HtOItv
         /WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746158068; x=1746762868;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPH5x3OkyPZV5JxMQZ1zGZ5oaQgdw1gt8lYnvIM/Z/8=;
        b=uIsrWBBmc7YroESKR6TM80BPss/9NRILmxYJX2R4uBvaQQSqXnxFYcw2FsRp5rqGV9
         FwNYaGr9GOrl4u7ONLiAuVFVGibd5AwyzjnrdpJPU+ZBbbJbY0IXSHzKzLHcudU9OyZz
         mIcUrQ9aBytEXdycN7jj31BI0D8rxAMKpd4b9lg22WI5yYpLQHU4+7t7NYiWKsSKT38c
         XOrbxWTsRhZ1Bal0whNh7BtD019Gc57MBXdp0hswjLyMYBxYzqcJ3mh98ELi6FTjxZpe
         Btljsc4McFC5WGUFWAQip6iv3XsdgtM/D0Cq7RGi+r8SbDUE7G/4wg7771mEZjLcIxv4
         aLLw==
X-Forwarded-Encrypted: i=1; AJvYcCXU1KnJo4cxUbu9xD8zbjUHADnyeUeiDzWUDHqG5EbB8axqaVQhV0rl1bSPJ5P+GjWwKkPN4fZjnkuf4+Tp5/4l@lists.infradead.org
X-Gm-Message-State: AOJu0YwNOPnUH6AY64PRJqAId62s2BUeoL+Gtg2quw0AOrYdxzkIxt/m
	Tw8z0RHUKs8iqSzifiZahPRA20cw9p27/IOW+1dM6XiZlC70EN3/gx//4F+wkPaqzvWjotSxnE3
	qL97vjVlQqvcnWpuPDYe/hwIqZLLvK7p0iOi8cw==
X-Gm-Gg: ASbGnctirdiP60oIKtYJunBf9doeVcHqE4iP02twSdwO2TWjbXISrKQU/8WIcz8doCN
	k/h7Vhq+7nhY+8xLIRL3MkxMNb0Pl7WqxEPNGvcm3JNKMVvTDoqZKKb5xBGmB715EFV0FVYeL9A
	90DZFG1sazSC6yspHhNA==
X-Google-Smtp-Source: AGHT+IH27De/KlkUS225DL+1jgi7Bd45jH2QB+ILdykfKHFbVgyIbVq309EIhsVL+dp7LgArF4VChK/YVgS1o4ebkzs=
X-Received: by 2002:a05:6820:1a07:b0:603:f973:1b6 with SMTP id
 006d021491bc7-607ee83e61dmr822909eaf.5.1746158067878; Thu, 01 May 2025
 20:54:27 -0700 (PDT)
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:53:51 -0700
X-Gm-Features: ATxdqUH-IuiVkS5CcFJu2VXAk3UFa8dz8SV54Ue9gA4hiVXVNFX6PW6OPRnevKk
Message-ID: <CA+AY4XfcDKiSpN-UbrfGdqshQvw+LhY59SSuUmB6XQRYh9m0sw@mail.gmail.com>
Subject: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_205428_934102_D2D48FCF 
X-CRM114-Status: GOOD (  17.40  )
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

FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
preferred by the hypervisor as a precursor to implementing the 1.2-only
FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.

We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.

Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
interfaces added in FF-A 1.2 as unsupported lest they get forwarded.

Signed-off-by: Ayrton Munoz <ayrton@google.com>
Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
 arch/arm64/kvm/hyp/nvhe/ffa.c    | 109 ++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..95404ff16dac 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o
switch.o tlb.o hyp-init.o host.o
  cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
  ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
+hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-y += $(lib-objs)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 10e88207b78e..8102dd6a19f7 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res
*res, int ret)
  ffa_to_smccc_res_prop(res, ret, 0);
 }

-static void ffa_set_retval(struct kvm_cpu_context *ctxt,
+static void ffa_set_retval(u64 func_id,
+    struct kvm_cpu_context *ctxt,
     struct arm_smccc_res *res)
 {
  cpu_reg(ctxt, 0) = res->a0;
  cpu_reg(ctxt, 1) = res->a1;
  cpu_reg(ctxt, 2) = res->a2;
  cpu_reg(ctxt, 3) = res->a3;
+
+ /*
+ * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
+ * preserve x8-x30 per DEN0028.
+ */
+ cpu_reg(ctxt, 4) = 0;
+ cpu_reg(ctxt, 5) = 0;
+ cpu_reg(ctxt, 6) = 0;
+ cpu_reg(ctxt, 7) = 0;
+
+ /* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
+ if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+ cpu_reg(ctxt, 8) = 0;
+ cpu_reg(ctxt, 9) = 0;
+ cpu_reg(ctxt, 10) = 0;
+ cpu_reg(ctxt, 11) = 0;
+ cpu_reg(ctxt, 12) = 0;
+ cpu_reg(ctxt, 13) = 0;
+ cpu_reg(ctxt, 14) = 0;
+ cpu_reg(ctxt, 15) = 0;
+ cpu_reg(ctxt, 16) = 0;
+ cpu_reg(ctxt, 17) = 0;
+ }
+}
+
+/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
+static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
+        u64 a4, u64 a5, u64 a6, u64 a7,
+        struct arm_smccc_res *res)
+{
+ struct arm_smccc_1_2_regs args, regs;
+
+ /* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
+ if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+ args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
+      a5, a6, a7 };
+ arm_smccc_1_2_smc(&args, &regs);
+ *res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
+ .a2 = regs.a2, .a3 = regs.a3 };
+ return;
+ }
+
+ arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
 }

 static bool is_ffa_call(u64 func_id)
@@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
 {
  struct arm_smccc_res res;

- arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
-   hyp_virt_to_phys(hyp_buffers.tx),
-   hyp_virt_to_phys(hyp_buffers.rx),
-   ffa_page_count,
-   0, 0, 0, 0,
-   &res);
+ arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
+    hyp_virt_to_phys(hyp_buffers.tx),
+    hyp_virt_to_phys(hyp_buffers.rx),
+    ffa_page_count,
+    0, 0, 0, 0,
+    &res);

  return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
 }
@@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res
*res, u32 handle_lo,

 static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
 {
- arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
-   len, len,
-   0, 0, 0, 0, 0,
-   res);
+ arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
+    len, len,
+    0, 0, 0, 0, 0,
+    res);
 }

 static void ffa_rx_release(struct arm_smccc_res *res)
@@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
  case FFA_RXTX_MAP:
  case FFA_MEM_DONATE:
  case FFA_MEM_RETRIEVE_REQ:
+ /* Optional notification interfaces added in FF-A 1.1 */
+ case FFA_NOTIFICATION_BITMAP_CREATE:
+ case FFA_NOTIFICATION_BITMAP_DESTROY:
+ case FFA_NOTIFICATION_BIND:
+ case FFA_NOTIFICATION_UNBIND:
+ case FFA_NOTIFICATION_SET:
+ case FFA_NOTIFICATION_GET:
+ case FFA_NOTIFICATION_INFO_GET:
+ /* Unimplemented interfaces added in FF-A 1.2 */
+ case FFA_MSG_SEND_DIRECT_REQ2:
+
+ /*
+ * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
+ * a guest VM because pkvm does not support communication between VMs
+ * via FF-A. Direct messages can only be sent from a non-secure sender
+ * endpoint to a secure receiver endpoint. Only receiver endpoints are
+ * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
+ */
+ case FFA_MSG_SEND_DIRECT_RESP2:
+
+ /* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */
+ case FFA_CONSOLE_LOG:
+
+ /*
+ * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
+ * optional for non-secure endpoints according to Table 13.38.
+ */
+ case FFA_PARTITION_INFO_GET_REGS:
+
+ /* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
+ case FFA_EL3_INTR_HANDLE:
  return false;
  }

@@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
  if (res.a0 != FFA_SUCCESS)
  return -EOPNOTSUPP;

- switch (res.a2) {
+ /* Bit[0:1] holds minimum buffer size and alignment boundary */
+ switch (res.a2 & 0x3) {
  case FFA_FEAT_RXTX_MIN_SZ_4K:
  min_rxtx_sz = SZ_4K;
  break;
@@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context
*host_ctxt, u32 func_id)

  ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
- ffa_set_retval(host_ctxt, &res);
+ ffa_set_retval(func_id, host_ctxt, &res);
  return true;
 }

@@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
  if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
  return 0;

- arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
+ arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
  if (res.a0 == FFA_RET_NOT_SUPPORTED)
  return 0;

@@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
  if (FFA_MAJOR_VERSION(res.a0) != 1)
  return -EOPNOTSUPP;

- if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
+ /* See do_ffa_guest_version before bumping maximum supported version. */
+ if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
  hyp_ffa_version = res.a0;
  else
- hyp_ffa_version = FFA_VERSION_1_1;
+ hyp_ffa_version = FFA_VERSION_1_2;

  tx = pages;
  pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
-- 
2.49.0.906.g1f30a19c02-goog

