Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B09BC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Voi1Fzc5rMEYO4WvoQDQTZIpM4gpYLEdpDjYw/a8q2U=; b=g0RBNRKNVW5fGFQE5zFIXTMnXY
	Dc/dLaYpzR2S9sC/uUu01X47GD8pkATraG5xSPjr+cILXGt3rWBrr+e4xhOrQlTZ5LBFL98Fo+qNX
	/q8NuO7E8TdBFCJXSpQBRr3E1l9CYnVHmJbsQBTvPIYGxPN1k4g1waT/CmS6QTTztluwdeaCjFLVf
	jCNLRWz0XaUxJjIAJPkbWGdvrhB0IQj88Xro86/hfFQ600/jm8B00k4dGfITqn7sIHeum+13kUf4T
	DXhog9q65mWcKRfLeil8WxrYVWgVlEllzUJeirPVmZYtmYSsLEVCGH3ftF5sCGYrcJ2fQXwbov70B
	458TgaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQb0-00000005fjP-1FfZ;
	Wed, 26 Feb 2025 23:13:42 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWS-00000005evI-30St
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:09:02 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id CD77A210EAC7;
	Wed, 26 Feb 2025 15:08:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD77A210EAC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740611338;
	bh=Voi1Fzc5rMEYO4WvoQDQTZIpM4gpYLEdpDjYw/a8q2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UNghjiUyavrXy563jYLe842b99uvQooFQW3whJDmeHqz+uUE/kk7kLLUvpLpl0jnM
	 2ACKsoqMJy4B0cWZ7rrEyUOdtFsToxL7rQoGBTsj69Ll0CcbT87SUyXypUjLWewF+Q
	 kieJUrEFEjuO3bqWI5Mc2rN9rtRkHdWoTiP/mAP0=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com,
	stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	muislam@microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 03/10] arm64/hyperv: Add some missing functions to arm64
Date: Wed, 26 Feb 2025 15:07:57 -0800
Message-Id: <1740611284-27506-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_150900_807234_6A1CD5F6 
X-CRM114-Status: GOOD (  11.72  )
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

These non-nested msr and fast hypercall functions are present in x86,
but they must be available in both architetures for the root partition
driver code.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
 arch/arm64/include/asm/mshyperv.h | 12 ++++++++++++
 include/asm-generic/mshyperv.h    |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
index 69004f619c57..e33a9e3c366a 100644
--- a/arch/arm64/hyperv/hv_core.c
+++ b/arch/arm64/hyperv/hv_core.c
@@ -53,6 +53,23 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
 }
 EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
 
+/*
+ * hv_do_fast_hypercall16 -- Invoke the specified hypercall
+ * with arguments in registers instead of physical memory.
+ * Avoids the overhead of virt_to_phys for simple hypercalls.
+ */
+u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
+{
+	struct arm_smccc_res	res;
+	u64			control;
+
+	control = (u64)code | HV_HYPERCALL_FAST_BIT;
+
+	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
+
 /*
  * Set a single VP register to a 64-bit value.
  */
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index 2e2f83bafcfb..2a900ba00622 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -40,6 +40,18 @@ static inline u64 hv_get_msr(unsigned int reg)
 	return hv_get_vpreg(reg);
 }
 
+/*
+ * Nested is not supported on arm64
+ */
+static inline void hv_set_non_nested_msr(unsigned int reg, u64 value)
+{
+	hv_set_msr(reg, value);
+}
+static inline u64 hv_get_non_nested_msr(unsigned int reg)
+{
+	return hv_get_msr(reg);
+}
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index c020d5d0ec2a..258034dfd829 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -72,6 +72,8 @@ extern void * __percpu *hyperv_pcpu_output_arg;
 
 extern u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
 extern u64 hv_do_fast_hypercall8(u16 control, u64 input8);
+extern u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
+
 bool hv_isolation_type_snp(void);
 bool hv_isolation_type_tdx(void);
 
-- 
2.34.1


