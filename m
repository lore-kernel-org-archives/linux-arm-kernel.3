Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592BAC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Im2wn77ObSMGvD0IVWpoY+rJ8u2j14mJFBlYt2WH2+o=; b=DBpC8EQ2b+Xx/soTvCGwWoZIGT
	KwDzppswKdH7+I7iwED6y9/CoAwAwskMmA+tYqxu7xMlBMxm546sqU83ZBLEVyDL+NhJPCKyXO0nv
	q7imnVGtnb8PKG3dRze3abGsEOyVpwXkvVLVxu5vDoRERRap380EMlZk+eAmqY0CRebGEiQEWs24r
	LiXISd+bwF2Ia7K25isjM0X+lcpTdwkqSAMK8ntoYwJZ7s5bmdtg6mMSH5oM3+4KMKMMQrQ0MSM0Y
	cgEmEIOpXnA9Snkgg+GzFcU+Vc9jmUJsKEIkbrB16F2/jLlsAirYDPRgJFpRgw+Tub6L91ftdvEPP
	uu/YXuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhZH-00000000j5s-1Axh;
	Fri, 02 May 2025 04:00:07 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhUw-00000000ilN-3PZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 03:55:39 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so1135637b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746158137; x=1746762937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Im2wn77ObSMGvD0IVWpoY+rJ8u2j14mJFBlYt2WH2+o=;
        b=n5zwHMwvH/7b1sSTF9mgYAWlk7jELZbCGJ/67fehvRulhtVbQZ0eKUP52wNENgCm0W
         hqmL9kA2aHAvP3US5XqIQY6lkI25x6aRZqdQlLliEnoIuNvcJxAu4Yjw8Ys3ay9Ulz9l
         WO73G7+slELFuz1sIxhQ6dFiK4Ww2hXZJhwuAkEQPy0j6AtXR1fl8VfmCkjfwdYQX5DK
         uTXZzGi5NjX/zXrsx0Ag6FRZPjcsWp80kyvYbmMZRbS0h5ujEgo5crsHs41wmAzjrCEy
         HLBpt89bO0xXN+zPOwRl/B5ezpXzUrc+De/4qV3eqOflMFnDepdJ4PHNe1V0cJv7LSeY
         0JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746158137; x=1746762937;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Im2wn77ObSMGvD0IVWpoY+rJ8u2j14mJFBlYt2WH2+o=;
        b=UczEIOWXO/FMeADAvmd7UWn7OeumuRkRE/im9Um+TWULi6Kab1E6gDfiCv65BWvB4U
         IZ0WiPEoZEqLpWtvVNPYdHdB+qSUOb+M9sHdkQmWUKqJRa1zllHayhppShcOsmmDNWWL
         B/vqgouM/ZGO46t+X9u7d72JiZqMWsxiD5JfIsYihKZoz5ojBU8vYA9pyyYkPEqzit0o
         cocOATYVYzu/d918w5+KZwEfex/2IaJCbdcAPHibIrBO9Vz7ke71kmdSCHKTL7VFK3Cs
         7lRBDBbvws2CBxvmnFoOOhHXdwvXqkec34c9xPQKbe7O7MLFaqfJ40oouyHq1dUye5yH
         OMEg==
X-Forwarded-Encrypted: i=1; AJvYcCVUXCZ/hiw1w0UN6oa06HmU9mOYa3DkLLfo0x1Oygq+0P3VmWm0J9huLwHu1uKElrV2oRUo7m2nL2Zq5eFtYVf8@lists.infradead.org
X-Gm-Message-State: AOJu0YzrfqrLlh5yD4vtmiNKcWowe6BWGYe3Ov/6fcQS5vEpKyqoulj0
	eG9IseGAdOEkw5fLhRXHhe0EwV99I46oF+nJ1aYlWIFp4J03zHaoK/rZl59W1bP1p5UFCgpFoZs
	0Fm9hDQQrHUoCByD3m/Yv6Lb9pTCbQKGERsW2qA==
X-Gm-Gg: ASbGncuaSXwAblMZd4oHZDj3sCN+WjO2I+UlRc0kHY0+GOi2xhO+ViTLoxPv7CIvWhq
	NZLonwsrSdThJlWliwF/HhZpNBHppXbz7i6djOnrffs5q6Ci0BGYDEEf5sMgrKUCWRPPiNAG+In
	lwj1xeh+J1apTYQwODgA==
X-Google-Smtp-Source: AGHT+IFXJBMRQbIPo5upk/R/ynSAAL3AnaaJ66tAq0jNpRLvOIklKis2IE27LIZ/YWgQwFB71nAgw3pr/a9+o43Ab5A=
X-Received: by 2002:a05:6808:398d:b0:403:31f8:44c6 with SMTP id
 5614622812f47-4034146849amr923236b6e.26.1746158137659; Thu, 01 May 2025
 20:55:37 -0700 (PDT)
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:55:01 -0700
X-Gm-Features: ATxdqUETGCaB026jgU5kFDUTuyNNtcaXNdvxmW6ZQm2ObrvQa8lUVjqiXD5HINw
Message-ID: <CA+AY4Xd64AuJvfFujtm-MSDNFoHo77Co5+kzzV-fb928J6QaLg@mail.gmail.com>
Subject: [PATCH 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_205538_857259_41AF2A61 
X-CRM114-Status: GOOD (  19.16  )
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

FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
uses the SMC calling convention v1.2 which allows calls to use x4-x17 as
argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
in the host ffa handler.

Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 111 +++++++++++++++++++++++++++++++++-
 include/linux/arm_ffa.h       |   2 +
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 8102dd6a19f7..d8c066f3c5c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -79,6 +79,14 @@ static void ffa_to_smccc_error(struct arm_smccc_res
*res, u64 ffa_errno)
  };
 }

+static void ffa_to_smccc_1_2_error(struct arm_smccc_1_2_regs *regs,
u64 ffa_errno)
+{
+ *regs = (struct arm_smccc_1_2_regs) {
+ .a0 = FFA_ERROR,
+ .a2 = ffa_errno,
+ };
+}
+
 static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
 {
  if (ret == FFA_RET_SUCCESS) {
@@ -89,11 +97,26 @@ static void ffa_to_smccc_res_prop(struct
arm_smccc_res *res, int ret, u64 prop)
  }
 }

+static void ffa_to_smccc_1_2_regs_prop(struct arm_smccc_1_2_regs
*regs, int ret, u64 prop)
+{
+ if (ret == FFA_RET_SUCCESS) {
+ *regs = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
+ .a2 = prop };
+ } else {
+ ffa_to_smccc_1_2_error(regs, ret);
+ }
+}
+
 static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
 {
  ffa_to_smccc_res_prop(res, ret, 0);
 }

+static void ffa_to_smccc_1_2_regs(struct arm_smccc_1_2_regs *regs, int ret)
+{
+ ffa_to_smccc_1_2_regs_prop(regs, ret, 0);
+}
+
 static void ffa_set_retval(u64 func_id,
     struct kvm_cpu_context *ctxt,
     struct arm_smccc_res *res)
@@ -127,6 +150,29 @@ static void ffa_set_retval(u64 func_id,
  }
 }

+static void ffa_set_retval_smccc_1_2(struct kvm_cpu_context *ctxt,
+    struct arm_smccc_1_2_regs *regs)
+{
+ cpu_reg(ctxt, 0) = regs->a0;
+ cpu_reg(ctxt, 1) = regs->a1;
+ cpu_reg(ctxt, 2) = regs->a2;
+ cpu_reg(ctxt, 3) = regs->a3;
+ cpu_reg(ctxt, 4) = regs->a4;
+ cpu_reg(ctxt, 5) = regs->a5;
+ cpu_reg(ctxt, 6) = regs->a6;
+ cpu_reg(ctxt, 7) = regs->a7;
+ cpu_reg(ctxt, 8) = regs->a8;
+ cpu_reg(ctxt, 9) = regs->a9;
+ cpu_reg(ctxt, 10) = regs->a10;
+ cpu_reg(ctxt, 11) = regs->a11;
+ cpu_reg(ctxt, 12) = regs->a12;
+ cpu_reg(ctxt, 13) = regs->a13;
+ cpu_reg(ctxt, 14) = regs->a14;
+ cpu_reg(ctxt, 15) = regs->a15;
+ cpu_reg(ctxt, 16) = regs->a16;
+ cpu_reg(ctxt, 17) = regs->a17;
+}
+
 /* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
 static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
         u64 a4, u64 a5, u64 a6, u64 a7,
@@ -681,7 +727,6 @@ static bool ffa_call_supported(u64 func_id)
  case FFA_NOTIFICATION_GET:
  case FFA_NOTIFICATION_INFO_GET:
  /* Unimplemented interfaces added in FF-A 1.2 */
- case FFA_MSG_SEND_DIRECT_REQ2:

  /*
  * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
@@ -709,6 +754,20 @@ static bool ffa_call_supported(u64 func_id)
  return true;
 }

+/*
+ * Must a given FFA function use the SMC calling convention v1.2?
+ */
+static bool ffa_call_needs_smccc_1_2(u64 func_id)
+{
+ switch (func_id) {
+ case FFA_MSG_SEND_DIRECT_REQ2:
+ case FFA_MSG_SEND_DIRECT_RESP2:
+ return true;
+ }
+
+ return false;
+}
+
 static bool do_ffa_features(struct arm_smccc_res *res,
      struct kvm_cpu_context *ctxt)
 {
@@ -882,9 +941,47 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
  hyp_spin_unlock(&host_buffers.lock);
 }

+static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
+       struct kvm_cpu_context *ctxt,
+       u64 vm_handle)
+{
+ DECLARE_REG(u32, func_id, ctxt, 0);
+ DECLARE_REG(u32, endp, ctxt, 1);
+ DECLARE_REG(u64, uuid_lo, ctxt, 2);
+ DECLARE_REG(u64, uuid_hi, ctxt, 3);
+ DECLARE_REG(u64, x4, ctxt, 4);
+ DECLARE_REG(u64, x5, ctxt, 5);
+ DECLARE_REG(u64, x6, ctxt, 6);
+ DECLARE_REG(u64, x7, ctxt, 7);
+ DECLARE_REG(u64, x8, ctxt, 8);
+ DECLARE_REG(u64, x9, ctxt, 9);
+ DECLARE_REG(u64, x10, ctxt, 10);
+ DECLARE_REG(u64, x11, ctxt, 11);
+ DECLARE_REG(u64, x12, ctxt, 12);
+ DECLARE_REG(u64, x13, ctxt, 13);
+ DECLARE_REG(u64, x14, ctxt, 14);
+ DECLARE_REG(u64, x15, ctxt, 15);
+ DECLARE_REG(u64, x16, ctxt, 16);
+ DECLARE_REG(u64, x17, ctxt, 17);
+
+ if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
+ ffa_to_smccc_1_2_regs(regs, FFA_RET_INVALID_PARAMETERS);
+ return;
+ }
+
+ struct arm_smccc_1_2_regs args = {
+ func_id, endp, uuid_lo, uuid_hi,
+ x4,  x5,  x6,  x7,  x8,  x9, x10,
+ x11, x12, x13, x14, x15, x16, x17
+ };
+
+ arm_smccc_1_2_smc(&args, regs);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
  struct arm_smccc_res res;
+ struct arm_smccc_1_2_regs regs;

  /*
  * There's no way we can tell what a non-standard SMC call might
@@ -940,14 +1037,24 @@ bool kvm_host_ffa_handler(struct
kvm_cpu_context *host_ctxt, u32 func_id)
  case FFA_PARTITION_INFO_GET:
  do_ffa_part_get(&res, host_ctxt);
  goto out_handled;
+ case FFA_MSG_SEND_DIRECT_REQ2:
+ if (hyp_ffa_version >= FFA_VERSION_1_2) {
+ do_ffa_direct_msg2(&regs, host_ctxt, HOST_FFA_ID);
+ goto out_handled;
+ }
+ goto out_not_supported;
  }

  if (ffa_call_supported(func_id))
  return false; /* Pass through */

+out_not_supported:
  ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
- ffa_set_retval(func_id, host_ctxt, &res);
+ if (ffa_call_needs_smccc_1_2(func_id))
+ ffa_set_retval_smccc_1_2(host_ctxt, &regs);
+ else
+ ffa_set_retval(func_id, host_ctxt, &res);
  return true;
 }

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 5bded24dc24f..4d541cf12ceb 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -268,6 +268,8 @@ bool ffa_partition_check_property(struct
ffa_device *dev, u32 property)
  (ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
  !dev->mode_32bit)

+#define FFA_SRC_ENDPOINT_MASK GENMASK(31, 16)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
  unsigned long data0; /* w3/x3 */
-- 
2.49.0.906.g1f30a19c02-goog

