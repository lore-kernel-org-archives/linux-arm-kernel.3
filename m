Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23399F55449
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWK2ofi54zMcLAjgob+INTbuXamQKlF7srcKYgpzrAM=; b=e0gLKDEB0WwG13dZAX3aP947ac
	kgHNX+WJXpCyVtYz0XUrDvbjlPPmyW4nRCzy7kI8FshcIWy91bC9xEIg9prtcmcko5wx0XDS4BVuC
	GtaJpkwYV7Ia1Xy9q++cyEoUq68gD71Y+DaV/s42MC6dJRw2o0PHiLQXN7oTrtb6G4vct9lPRsAox
	br1CZ92gcp9n8Bq1NsqnKlSQT8UyG3J0F3T22oqucbkm0u+Q/IdCEe4vY2imNXISJivynKNuNTotT
	XaekZyIVzf77GosMA/jund6f5etqJ72syLWANMw4d8lJisHwMNfTfbY5zpYpGR7Dqo38nTn7M89ZR
	5yjogTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68o-00000003Awc-0yVu;
	Wed, 25 Feb 2026 04:04:50 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68b-00000003Ane-2wdN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:04:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oWK2ofi54zMcLAjgob+INTbuXamQKlF7srcKYgpzrAM=;
	b=CW0Bug7uYrdqez3aI6HNfhMUOFoKDbhN07lqNEnUGbSz1jezWHCduIHeGNP6uqeQMYwSbD8oE
	1+lrZAeQfW2D8yUgkV5mHnwUbxQuAtuT+vmNFW8gXGzFihC+43J0GsIiJhoFSfnJnY3ZqGpvPTX
	qLoV8jz80msWR8XZ4t4+0Gk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fLLSn5TSmzmV6k;
	Wed, 25 Feb 2026 11:59:37 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 65C1F4055B;
	Wed, 25 Feb 2026 12:04:25 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Feb
 2026 12:04:24 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<liuyonglong@huawei.com>, <Jonathan.Cameron@huawei.com>,
	<yezhenyu2@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v3 3/5] KVM: arm64: Add support for FEAT_HDBSS
Date: Wed, 25 Feb 2026 12:04:19 +0800
Message-ID: <20260225040421.2683931-4-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200438_093492_178D5324 
X-CRM114-Status: GOOD (  13.56  )
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

From: eillon <yezhenyu2@huawei.com>

Armv9.5 introduces the Hardware Dirty Bit State Structure (HDBSS) feature,
indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100. A CPU capability is added
to notify the user of the feature.

Add KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl and basic framework for
ARM64 HDBSS support. Since the HDBSS buffer size is configurable and
cannot be determined at KVM initialization, an IOCTL interface is
required.

Actually exposing the new capability to user space happens in a later
patch.

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 include/uapi/linux/kvm.h            |  1 +
 tools/include/uapi/linux/kvm.h      |  1 +
 5 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..dcc2e2cad5ad 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
 	return cpus_have_final_cap(ARM64_HAFT);
 }

+static inline bool system_supports_hdbss(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_HDBSS);
+}
+
 static __always_inline bool system_supports_mpam(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MPAM);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c31f8e17732a..348b0afffc3e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2124,6 +2124,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }

+static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int cope)
+{
+	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, cope);
+}
+
 bool cpu_supports_bbml2_noabort(void)
 {
 	/*
@@ -2759,6 +2764,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
 	},
 #endif
+	{
+		.desc = "Hardware Dirty state tracking structure (HDBSS)",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HDBSS,
+		.matches = has_vhe_hdbss,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
+	},
 	{
 		.desc = "CRC32 instructions",
 		.capability = ARM64_HAS_CRC32,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 7261553b644b..f6ece5b85532 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -68,6 +68,7 @@ HAS_VA52
 HAS_VIRT_HOST_EXTN
 HAS_WFXT
 HAS_XNX
+HAS_HDBSS
 HAFT
 HW_DBM
 KVM_HVHE
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 65500f5db379..15ee42cdbd51 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -985,6 +985,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_SEA_TO_USER 245
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
+#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248

 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index dddb781b0507..93e0a1e14dc7 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -974,6 +974,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
 #define KVM_CAP_ARM_SEA_TO_USER 245
 #define KVM_CAP_S390_USER_OPEREXEC 246
+#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248

 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
--
2.33.0


