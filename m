Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8168C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGmY6QlBMQ2SHa5L+lxqX371JcTBS0qRTbNtw3modBQ=; b=R7yw+QFRFm6fSCnh3e0St5D2DQ
	GqrXqlJ5CFU8YnM1pCSgjT9f5t3R8Z04uYiFaBegcMvj/EVyyisOe4kBo4TA6LIcNYvCtozswiO2D
	iIiIgm1BNWtuBZHqsuTPARIDoZK0PA03viXmcpBq7w4/vecZmLg87nVioCIlCrNgk1xYTv8Vzn7n0
	fHy2gNRvWElcHx4T82KXzH72OZn+ijU3jybVYyF1Ls/gtDu5hChgey6+gmjQPFZ3G5rwGCpKZ2UjE
	RA6ofEkwysVNjwuq3tVy0GEaHr7rSRD/WnV0oqC+73I6h5ib1hF94N1dVou78gtl9CrvtQDaX118V
	e8sc0wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGw-00000001gpz-0tSp;
	Fri, 04 Sep 2026 10:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGu-00000001goW-2L5a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 064496020C;
	Fri,  4 Sep 2026 10:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8701F00A3D;
	Fri,  4 Sep 2026 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518147;
	bh=ZGmY6QlBMQ2SHa5L+lxqX371JcTBS0qRTbNtw3modBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afAcEPt7t2fdenCPFl8yuDLqP8SmdEH9gpHntfCODggDHUt2jjg5qreIkzdmOXlYA
	 x4ews9cAZJ9O6CjUnfOam1vQY8XW1bLQoMaElEYjJfzdeQwdVPo57aMaQ+MYlChkb/
	 jncSj7jtk42gDhf5YfbIGQoKcLXDMu//IB+ZnaE6FdCfUulrbI7zRbsNHkkNJHD+WN
	 tEzMjDkLTHrxH477gaEEWmumqlAOVuF7yPiFMW93YQOQ7KzLNllD7yjHdOLglOkK7q
	 waPxaRvuNvR1faxdAgrGT1UZ63WzM64kCzi8pg8+2UjETDcJ5i1i+0lJGOoibAt5rf
	 1EUc3qohWpZBA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 8/9] arm64: realm: Add RHI helper to query IPA state change alignment
Date: Fri,  4 Sep 2026 16:04:51 +0530
Message-ID: <20260904103452.1197239-9-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Arm CCA guests need to know the granularity at which the host expects IPA
state changes to be performed. This can be larger than the guest page size
and is needed when deciding the alignment for memory shared with the host.

Add the Realm Host Interface host configuration definitions and an
get_ipa_state_change_alignment() helper. The helper uses RSI_HOST_CALL to
query the supported HostConf version and features, reads the IPA change
alignment when available, and falls back to PAGE_SIZE if the interface is
unavailable or returns an invalid value.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/arm_rmm/rsi.c | 46 ++++++++++++++++++++++++++++++++++
 include/linux/arm-rsi-cmds.h   | 10 ++++++++
 include/linux/arm-smccc-rhi.h  | 25 ++++++++++++++++++
 include/linux/arm-smccc-rsi.h  |  7 ++++++
 4 files changed, 88 insertions(+)
 create mode 100644 include/linux/arm-smccc-rhi.h

diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 52f40256bd78..2cd53f82432f 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -9,6 +9,7 @@
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/arm-smccc-rhi.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 
@@ -164,6 +165,51 @@ static int realm_register_memory_enc_ops(void)
 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
 }
 
+/* we need an aligned struct for rsi_host_call. slab is not yet ready */
+static struct rsi_host_call hostconf_call __initdata;
+static unsigned long __maybe_unused __init get_ipa_state_change_alignment(void)
+{
+	long ret;
+	unsigned long shared_granule_size;
+
+	hostconf_call.imm = 0;
+	hostconf_call.gprs[0] = RHI_HOSTCONF_VERSION;
+	ret = rsi_host_call(lm_alias(&hostconf_call));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	if (hostconf_call.gprs[0] != RHI_HOSTCONF_VER_1_0)
+		goto err_out;
+
+	hostconf_call.imm = 0;
+	hostconf_call.gprs[0] = RHI_HOSTCONF_FEATURES;
+	ret = rsi_host_call(lm_alias(&hostconf_call));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	if (!(hostconf_call.gprs[0] & __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT))
+		goto err_out;
+
+	hostconf_call.imm = 0;
+	hostconf_call.gprs[0] = RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT;
+	ret = rsi_host_call(lm_alias(&hostconf_call));
+	if (ret != RSI_SUCCESS)
+		goto err_out;
+
+	shared_granule_size = hostconf_call.gprs[0];
+	if (shared_granule_size & (SZ_4K - 1) ||
+	    !is_power_of_2(shared_granule_size))
+		goto err_out;
+
+	return max(PAGE_SIZE, shared_granule_size);
+err_out:
+	/*
+	 * For failure condition assume host is built with 4K page size
+	 * and hence IPA state change alignment can be guest PAGE_SIZE.
+	 */
+	return PAGE_SIZE;
+}
+
 void __init arm64_rsi_init(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 3f7a6a833993..996f1621b996 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -236,4 +236,14 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
+static inline unsigned long rsi_host_call(struct rsi_host_call *rhi_call)
+{
+	phys_addr_t addr = virt_to_phys(rhi_call);
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RSI_HOST_CALL, addr, &res);
+
+	return res.a0;
+}
+
 #endif /* __LINUX_ARM_RSI_CMDS_H_ */
diff --git a/include/linux/arm-smccc-rhi.h b/include/linux/arm-smccc-rhi.h
new file mode 100644
index 000000000000..91a29996d72d
--- /dev/null
+++ b/include/linux/arm-smccc-rhi.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#ifndef __LINUX_ARM_SMCCC_RHI_H_
+#define __LINUX_ARM_SMCCC_RHI_H_
+
+#include <linux/arm-smccc.h>
+
+#define SMC_RHI_CALL(func)				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+			   ARM_SMCCC_SMC_64,		\
+			   ARM_SMCCC_OWNER_STANDARD_HYP,\
+			   (func))
+
+#define RHI_HOSTCONF_VER_1_0		0x10000
+#define RHI_HOSTCONF_VERSION		SMC_RHI_CALL(0x004E)
+
+#define __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT BIT(0)
+#define RHI_HOSTCONF_FEATURES		SMC_RHI_CALL(0x004F)
+
+#define RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT	SMC_RHI_CALL(0x0050)
+
+#endif /* __LINUX_ARM_SMCCC_RHI_H_ */
diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..3532a3f08f4e 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -182,6 +182,13 @@ struct realm_config {
  */
 #define SMC_RSI_IPA_STATE_GET			SMC_RSI_FID(0x198)
 
+struct rsi_host_call {
+	union {
+		u16 imm;
+		u64 padding0;
+	};
+	u64 gprs[31];
+} __aligned(0x100);
 /*
  * Make a Host call.
  *
-- 
2.43.0


