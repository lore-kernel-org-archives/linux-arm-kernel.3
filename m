Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8A1C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyHCon4vU91wPH4dyinNdOyq5hW82Gz0ZN1lgTbU0wg=; b=ZHbpFexJbbnSw8Gwb4AsRDN1HW
	H4Xsz2UdxM9Rpiz5mDDtSt1NTp73jGtALWwxiKNBxcMdTqNFF3OEtoVNHK7AgjaWkB35vVZVYDY60
	u2PDjPJJA9D2RoaRcYbj6rMZg1Z1QIY0bAPEeGyTDVpu3gCDV2HM60603WR5P4dICfVXfMLMVvoD7
	iUR9cw5gDk/Wya+zARrknmrZXMHdGdonzbbsDR79smAXDwlfpWib7Tgss4+t4GSizr8mxfaaYixLZ
	a0ZWDpYi6GIpRH7ud6jJKCMOpCXOrdqa3jKWFH8yG4EwTvYE1vwn4xJHLONs1MhXy+UeJjC+VfQnT
	OO1Mk4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmm2-00000001MQi-43hH;
	Fri, 02 May 2025 09:33:38 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAma7-00000001KUk-35v3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:21:20 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e75608f582aso870172276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177678; x=1746782478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyHCon4vU91wPH4dyinNdOyq5hW82Gz0ZN1lgTbU0wg=;
        b=0yvvbcF8aU1VGwMbyQRWzTe5FyRhUxWvFUkuabb3ju1ErQjB5c4bNQlNiPSzQjQLga
         e77UVpgDYkM3Rh6LIMIkJz6tSQDl0jpakPD74ifev092AqIBUcJnl1aYD/nHhgmAM4fC
         LUNZVqJcSeN59BngDKZTPqJiswmjs51b9uc22dsYz/cHDzcwmhebJ8JrzyJzOhFoSUxO
         Njz4sP7YGm4WRqKJzLeZrw7ZpPjYrcodZTeZnyCkFanBCgvxzcq5x2JUhTY7LnNg1NqL
         MeAfLeC4SBFI6N89GMajBRiUYbemjqX6/BiSZFrMqAAuF1XG7xKb04IvFEoDO/tBTxr4
         h27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177678; x=1746782478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyHCon4vU91wPH4dyinNdOyq5hW82Gz0ZN1lgTbU0wg=;
        b=HkPSRVt/392hqZjZP5H2rnWBTYJw2rstPqWpuGmPp1CZlXKO8brGqyknBA8WjAHuvB
         nw+474G8YQ3hlfovl4f57K4EtmAoSgMRrRAKFcDJN3IN2AW1RS0RUxG/VBIyrPrqDMeV
         o6ohFjGwNpcIr0eqDwuP3ZAfN5LfNK/pjLmHz0lgX2kI5TxLTZo8wALDjXkfL2jUtI72
         lJBnxU8ngFQnoGvdFwXZIUn2KDiM8NOCuWx+DDcUQbxCeCogyaJjfgd1FPodV8LyxXYa
         MWTjZ3a5hBCN3I0xVX2+kzB1MYoFv2yLenMEXdBK1O9Yk8eh6QNnsMkaXJMX6GTJvC0P
         58Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWvBAx/O/uqT5t5Jvdr/WWG4NKy/7+zH5LZEw3Q0FV4xsE2aFaCgFMXTx5dY0mk+MQE/jh07+2+mOfGLc18Z/nQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwAQXcfOk1liDN1H4Y5H6JYzS2pukw+aM//ABQdB6BgwBwdkmBD
	NSjRdu4g3KohMZ7ZR/LAN6bxwDLQN4qFqiYh/a06WHzbLnNIUBrH5i3u+65hZsk=
X-Gm-Gg: ASbGnctfKa9Cbl2CfqVFQ9+W8CnUGgRCAoRsv6JHbf7OGPdw2IZWEeUZt3Yp1Xn8xlX
	9PguXuV7lk3c/tusiW87f6Whh8U+YVhsBTctys/yp1o+lgjKZpBFRkX0LpIS67+F8A+ajEkEci9
	h12KznxVkJpQICp6aPBCKCYDVhWSFx1WS9TeAxzJXQ3uM3PKGhjctoVmCKwF0IMMCQLzg8fBh1n
	5zRLPwVSq+5wuXdw1XQRx/SGn9o3bDvEQrsvEAbfP/ZtO7+lOMhCxnnd99e2ihERJ3Oi1xxSNS4
	XtfHqGgbZYdBSKgrBsEPvdkB2x8zaq1pV0WChDQ1/w==
X-Google-Smtp-Source: AGHT+IGp+ETgvJSd9lvf2Hm0u8cGNqnSHJMy0WS2lG3WhWOOaG2gaDXYIeZ4OWRo041mgp+lOQesMg==
X-Received: by 2002:a05:6902:1885:b0:e72:a584:bea0 with SMTP id 3f1490d57ef6-e756556fef7mr2617975276.21.1746177678568;
        Fri, 02 May 2025 02:21:18 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:18 -0700 (PDT)
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
	Per Larsen <perl@immunant.com>
Subject: [PATCH 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
Date: Fri,  2 May 2025 02:21:08 -0700
Message-ID: <20250502092108.3224341-4-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
References: <20250502092108.3224341-1-perl@immunant.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_022119_778990_E780353E 
X-CRM114-Status: GOOD (  20.47  )
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
@@ -79,6 +79,14 @@ static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
 	};
 }
 
+static void ffa_to_smccc_1_2_error(struct arm_smccc_1_2_regs *regs, u64 ffa_errno)
+{
+	*regs = (struct arm_smccc_1_2_regs) {
+		.a0	= FFA_ERROR,
+		.a2	= ffa_errno,
+	};
+}
+
 static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
 {
 	if (ret == FFA_RET_SUCCESS) {
@@ -89,11 +97,26 @@ static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
 	}
 }
 
+static void ffa_to_smccc_1_2_regs_prop(struct arm_smccc_1_2_regs *regs, int ret, u64 prop)
+{
+	if (ret == FFA_RET_SUCCESS) {
+		*regs = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
+						.a2 = prop };
+	} else {
+		ffa_to_smccc_1_2_error(regs, ret);
+	}
+}
+
 static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
 {
 	ffa_to_smccc_res_prop(res, ret, 0);
 }
 
+static void ffa_to_smccc_1_2_regs(struct arm_smccc_1_2_regs *regs, int ret)
+{
+	ffa_to_smccc_1_2_regs_prop(regs, ret, 0);
+}
+
 static void ffa_set_retval(u64 func_id,
 			   struct kvm_cpu_context *ctxt,
 			   struct arm_smccc_res *res)
@@ -127,6 +150,29 @@ static void ffa_set_retval(u64 func_id,
 	}
 }
 
+static void ffa_set_retval_smccc_1_2(struct kvm_cpu_context *ctxt,
+			   struct arm_smccc_1_2_regs *regs)
+{
+	cpu_reg(ctxt, 0) = regs->a0;
+	cpu_reg(ctxt, 1) = regs->a1;
+	cpu_reg(ctxt, 2) = regs->a2;
+	cpu_reg(ctxt, 3) = regs->a3;
+	cpu_reg(ctxt, 4) = regs->a4;
+	cpu_reg(ctxt, 5) = regs->a5;
+	cpu_reg(ctxt, 6) = regs->a6;
+	cpu_reg(ctxt, 7) = regs->a7;
+	cpu_reg(ctxt, 8) = regs->a8;
+	cpu_reg(ctxt, 9) = regs->a9;
+	cpu_reg(ctxt, 10) = regs->a10;
+	cpu_reg(ctxt, 11) = regs->a11;
+	cpu_reg(ctxt, 12) = regs->a12;
+	cpu_reg(ctxt, 13) = regs->a13;
+	cpu_reg(ctxt, 14) = regs->a14;
+	cpu_reg(ctxt, 15) = regs->a15;
+	cpu_reg(ctxt, 16) = regs->a16;
+	cpu_reg(ctxt, 17) = regs->a17;
+}
+
 /* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
 static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,
 				       u64 a4, u64 a5, u64 a6, u64 a7,
@@ -681,7 +727,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Unimplemented interfaces added in FF-A 1.2 */
-	case FFA_MSG_SEND_DIRECT_REQ2:
 
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
+	switch (func_id) {
+	case FFA_MSG_SEND_DIRECT_REQ2:
+	case FFA_MSG_SEND_DIRECT_RESP2:
+		return true;
+	}
+
+	return false;
+}
+
 static bool do_ffa_features(struct arm_smccc_res *res,
 			    struct kvm_cpu_context *ctxt)
 {
@@ -882,9 +941,47 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
+			      struct kvm_cpu_context *ctxt,
+			      u64 vm_handle)
+{
+	DECLARE_REG(u32, func_id, ctxt, 0);
+	DECLARE_REG(u32, endp, ctxt, 1);
+	DECLARE_REG(u64, uuid_lo, ctxt, 2);
+	DECLARE_REG(u64, uuid_hi, ctxt, 3);
+	DECLARE_REG(u64, x4, ctxt, 4);
+	DECLARE_REG(u64, x5, ctxt, 5);
+	DECLARE_REG(u64, x6, ctxt, 6);
+	DECLARE_REG(u64, x7, ctxt, 7);
+	DECLARE_REG(u64, x8, ctxt, 8);
+	DECLARE_REG(u64, x9, ctxt, 9);
+	DECLARE_REG(u64, x10, ctxt, 10);
+	DECLARE_REG(u64, x11, ctxt, 11);
+	DECLARE_REG(u64, x12, ctxt, 12);
+	DECLARE_REG(u64, x13, ctxt, 13);
+	DECLARE_REG(u64, x14, ctxt, 14);
+	DECLARE_REG(u64, x15, ctxt, 15);
+	DECLARE_REG(u64, x16, ctxt, 16);
+	DECLARE_REG(u64, x17, ctxt, 17);
+
+	if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != vm_handle) {
+		ffa_to_smccc_1_2_regs(regs, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	struct arm_smccc_1_2_regs args = {
+		func_id, endp, uuid_lo, uuid_hi,
+		 x4,  x5,  x6,  x7,  x8,  x9, x10,
+		x11, x12, x13, x14, x15, x16, x17
+	};
+
+	arm_smccc_1_2_smc(&args, regs);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_res res;
+	struct arm_smccc_1_2_regs regs;
 
 	/*
 	 * There's no way we can tell what a non-standard SMC call might
@@ -940,14 +1037,24 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_MSG_SEND_DIRECT_REQ2:
+		if (hyp_ffa_version >= FFA_VERSION_1_2) {
+			do_ffa_direct_msg2(&regs, host_ctxt, HOST_FFA_ID);
+			goto out_handled;
+		}
+		goto out_not_supported;
 	}
 
 	if (ffa_call_supported(func_id))
 		return false; /* Pass through */
 
+out_not_supported:
 	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
 out_handled:
-	ffa_set_retval(func_id, host_ctxt, &res);
+	if (ffa_call_needs_smccc_1_2(func_id))
+		ffa_set_retval_smccc_1_2(host_ctxt, &regs);
+	else
+		ffa_set_retval(func_id, host_ctxt, &res);
 	return true;
 }
 
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 5bded24dc24f..4d541cf12ceb 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -268,6 +268,8 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
 	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
 	 !dev->mode_32bit)
 
+#define FFA_SRC_ENDPOINT_MASK	GENMASK(31, 16)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
 	unsigned long data0; /* w3/x3 */
-- 
2.49.0


