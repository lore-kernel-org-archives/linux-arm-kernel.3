Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXTVqSuS6Nru86md+gL/FG45+whJF/sIYExDwh5sAUg=; b=dBo8alFugPj+NiRJzAcQPw8FvI
	RwRhakNXcuQpA17p0i3mix8PviRtnvF0ak6w4MN3z/vbgwWpaJTnZn4q93cgeO6FWOKNvWdQoBFhB
	ZsUMKmxtBWmp04ybnKO5Oxqhu+UrIExp7DXUQa2gMyTEwHAG7RoBGFDyhpqd07ap//cghyxEPyQOd
	6aRx3koq1eArNIEspTOpPYEok4oifNnaIEiWddNSK1odOEwWCssIAjzk0MAnhaUGH8ChoHth/XdYv
	kSh4pnWP91F3GicHLGQEqWVljkO3P4RZZYdHVQrOu7hO2Z3WoWfzUdIEwkSP38ycxbvpp4Z1uyn3i
	u9uCbM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmk7-00000001MAz-0T55;
	Fri, 02 May 2025 09:31:39 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAma5-00000001KU5-0kfw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:21:18 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e7329792c6eso1541192276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177676; x=1746782476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXTVqSuS6Nru86md+gL/FG45+whJF/sIYExDwh5sAUg=;
        b=W+JZVum4TFYc1s/YTZmBfdg/+KsGwqrFszRnRJh1saVtLKV9+X8WAUlGNxuebcdbq2
         99vdRvOZRZD7wPKmj0QhTXGmcmAFhnc4rp3sURI0vtlk9L9pYw/Jhye6Ycetwcss3hGR
         w2/7J3+QBf1Cm8wnMHXxBgCnwhYz+hOHvWhHa8Fs9KwervEu0jivlStYC1ixvF+T6cD1
         irluBJobJ1nYhTr/tZhBkQ5eEvbmXkG0oKeJWzY8tO8ElEf0M7mgFNoFlSzpgutg2wOZ
         FS4Fj8VQ2e+wVxrUGb+CVxY+IH+Vuc1ogVLI1zRXG3rXXVVFitDEUdcNg4j/fYKACQkx
         ie+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177676; x=1746782476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXTVqSuS6Nru86md+gL/FG45+whJF/sIYExDwh5sAUg=;
        b=pn1WOab2epgL6eGAjdr7ttIh8/hOQTBYcxHxAHgNamRyRw2Aa6x1qV25e0cpuh3vjU
         mnjTMwYLeSDlLbscGb2Q5vCmCNujCwwXZ5phNA0lVnWDAJSUvuSEw/61DAqZFAFvEpKk
         ltbo4B49oV6tQZm/qctCkEVuewgkyRaO8Kz5bDYO+9lnM66kADrquNuDwgS+sHUKO1L5
         QhHjs1ZbfVz7Q9dYOZ7ccXxXp/xFPN4mq/dqnmEqu7+IMbloz/qh9lnvh9dHo89Z/u9r
         0AAIeMUuhE13a/q72kKZIguEPsMFgnN9Tlnno6Vr4RFFfq8eMAf+RC0LSjWsxbQj/wvf
         yS3A==
X-Forwarded-Encrypted: i=1; AJvYcCWyvl/XMaw3ZWxZ0AgoMm6Y7PP9M0q9+AsMsubUiSOIiW1y+F4U68AU8i3cIM/8wAV7bG6+RuYRX3cVGe4ogw5A@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ/gKgzMKslDqu7yoVrOhOwpLi7M+8xEkBHY6vo+Pz+1cgKO68
	oRzAl6tUQBZir9jwqI1XubG+Fu31W+Kekgc7E+b/jzMKOaDKneV+dsBZdg1zm8uDjDAjo1Fbqnc
	qSu0=
X-Gm-Gg: ASbGnctx8tvhSwMoYy69Gn/hJbBUu0UEyXSwqTS8dsasB/xAcz2L9EJumQg6jc97h9q
	sOYNCc24ob0/hbEhDIonV89y0kZbrHZmCkWOIuFII//oocrE7ksBBnyzDOlv2/agLx2FPYLH75Z
	OZKBj8p19NGwYAbMeHRTw0yZA29YLDggm4XWG2a7hVK+dG7SCMH+D0/pnJYPhRE5JwcIZW2xSyZ
	Zh7CVPAI/6La8owutxPhmWeEdbm3ijYPbmuUDPYuLAHQ0R7Dxrwi2xr5s1kqOEDPkhktNtKXGRV
	Urm56pVlVf5+8U5YOKBk/ZTPx53zFtUYPNL34IDmcyMUPyiwYIDH
X-Google-Smtp-Source: AGHT+IGmUl1GdZxfwSb42zKFXUWo6QU+Vhl5qRPmA2BrlGjiHY8SxNw5HgzfPvnfGkzAQOdEnTenqg==
X-Received: by 2002:a05:6902:240c:b0:e75:608f:4da9 with SMTP id 3f1490d57ef6-e756562a337mr2991253276.44.1746177676023;
        Fri, 02 May 2025 02:21:16 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:15 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perlarsen@google.com>,
	Ayrton Munoz <ayrton@google.com>,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
Date: Fri,  2 May 2025 02:21:07 -0700
Message-ID: <20250502092108.3224341-3-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
References: <20250502092108.3224341-1-perl@immunant.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_022117_222360_8D54738F 
X-CRM114-Status: GOOD (  18.61  )
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

From: Per Larsen <perlarsen@google.com>

FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
preferred by the hypervisor as a precursor to implementing the 1.2-only
FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.

We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.

Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
interfaces added in FF-A 1.2 as unsupported lest they get forwarded.

Co-Developed-by: Ayrton Munoz <ayrton@google.com>
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
@@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
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
@@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
 	ffa_to_smccc_res_prop(res, ret, 0);
 }
 
-static void ffa_set_retval(struct kvm_cpu_context *ctxt,
+static void ffa_set_retval(u64 func_id,
+			   struct kvm_cpu_context *ctxt,
 			   struct arm_smccc_res *res)
 {
 	cpu_reg(ctxt, 0) = res->a0;
 	cpu_reg(ctxt, 1) = res->a1;
 	cpu_reg(ctxt, 2) = res->a2;
 	cpu_reg(ctxt, 3) = res->a3;
+
+	/*
+	 * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
+	 * preserve x8-x30 per DEN0028.
+	 */
+	cpu_reg(ctxt, 4) = 0;
+	cpu_reg(ctxt, 5) = 0;
+	cpu_reg(ctxt, 6) = 0;
+	cpu_reg(ctxt, 7) = 0;
+
+	/* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
+	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+		cpu_reg(ctxt, 8) = 0;
+		cpu_reg(ctxt, 9) = 0;
+		cpu_reg(ctxt, 10) = 0;
+		cpu_reg(ctxt, 11) = 0;
+		cpu_reg(ctxt, 12) = 0;
+		cpu_reg(ctxt, 13) = 0;
+		cpu_reg(ctxt, 14) = 0;
+		cpu_reg(ctxt, 15) = 0;
+		cpu_reg(ctxt, 16) = 0;
+		cpu_reg(ctxt, 17) = 0;
+	}
+}
+
+/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
+static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
+				       u64 a4, u64 a5, u64 a6, u64 a7,
+				       struct arm_smccc_res *res)
+{
+	struct arm_smccc_1_2_regs args, regs;
+
+	/* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
+	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
+		args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
+						     a5, a6, a7 };
+		arm_smccc_1_2_smc(&args, &regs);
+		*res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
+						.a2 = regs.a2, .a3 = regs.a3 };
+		return;
+	}
+
+	arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
 }
 
 static bool is_ffa_call(u64 func_id)
@@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
 {
 	struct arm_smccc_res res;
 
-	arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
-			  hyp_virt_to_phys(hyp_buffers.tx),
-			  hyp_virt_to_phys(hyp_buffers.rx),
-			  ffa_page_count,
-			  0, 0, 0, 0,
-			  &res);
+	arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
+				   hyp_virt_to_phys(hyp_buffers.tx),
+				   hyp_virt_to_phys(hyp_buffers.rx),
+				   ffa_page_count,
+				   0, 0, 0, 0,
+				   &res);
 
 	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
 }
@@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res *res, u32 handle_lo,
 
 static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
 {
-	arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
-			  len, len,
-			  0, 0, 0, 0, 0,
-			  res);
+	arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
+				   len, len,
+				   0, 0, 0, 0, 0,
+				   res);
 }
 
 static void ffa_rx_release(struct arm_smccc_res *res)
@@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
+	/* Optional notification interfaces added in FF-A 1.1 */
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+	case FFA_NOTIFICATION_BIND:
+	case FFA_NOTIFICATION_UNBIND:
+	case FFA_NOTIFICATION_SET:
+	case FFA_NOTIFICATION_GET:
+	case FFA_NOTIFICATION_INFO_GET:
+	/* Unimplemented interfaces added in FF-A 1.2 */
+	case FFA_MSG_SEND_DIRECT_REQ2:
+
+	/*
+	 * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
+	 * a guest VM because pkvm does not support communication between VMs
+	 * via FF-A. Direct messages can only be sent from a non-secure sender
+	 * endpoint to a secure receiver endpoint. Only receiver endpoints are
+	 * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
+	 */
+	case FFA_MSG_SEND_DIRECT_RESP2:
+
+	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */
+	case FFA_CONSOLE_LOG:
+
+	/*
+	 * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
+	 * optional for non-secure endpoints according to Table 13.38.
+	 */
+	case FFA_PARTITION_INFO_GET_REGS:
+
+	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
+	case FFA_EL3_INTR_HANDLE:
 		return false;
 	}
 
@@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
 	if (res.a0 != FFA_SUCCESS)
 		return -EOPNOTSUPP;
 
-	switch (res.a2) {
+	/* Bit[0:1] holds minimum buffer size and alignment boundary */
+	switch (res.a2 & 0x3) {
 	case FFA_FEAT_RXTX_MIN_SZ_4K:
 		min_rxtx_sz = SZ_4K;
 		break;
@@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
-	ffa_set_retval(host_ctxt, &res);
+	ffa_set_retval(func_id, host_ctxt, &res);
 	return true;
 }
 
@@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
 	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
 		return 0;
 
-	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
 	if (res.a0 == FFA_RET_NOT_SUPPORTED)
 		return 0;
 
@@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
 	if (FFA_MAJOR_VERSION(res.a0) != 1)
 		return -EOPNOTSUPP;
 
-	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
+	/* See do_ffa_guest_version before bumping maximum supported version. */
+	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
 		hyp_ffa_version = res.a0;
 	else
-		hyp_ffa_version = FFA_VERSION_1_1;
+		hyp_ffa_version = FFA_VERSION_1_2;
 
 	tx = pages;
 	pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
-- 
2.49.0


