Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D18AC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dp+pNiPhTeOHjkfNB6nT6XDy6mBXNEkfHasNIXjlCTk=; b=hGdTGG3p6aDwLpHl1LE8GaIKJt
	z09bfc9YeivAAf36e3XzXih5s9//CMjJqrRRvanYtLMcW6WWY72mDmAjwnCkVJ0YDLA0eTyi1ZNRr
	u1VdbxtSbrwdskGJbX0SGirMXjShuAtJ6yhiVRzuP4jZJRj3vABRh9dS2NiolMlX9v8ndGeeKjRdr
	+Nv3mkpkMmLDMqJD6fPTluQ0REdc9sI7YaQ2Xf5WW9BhPZl/vTD+sBzxuZETkRkC5X7LYxxMmwM5Y
	khNn//+UxCHnGd5f/hzc0IYCVHZsK4hISN+qNJN/4ZzgqjLke4Aj+LpoEFGDr/2s9h24too+Etn62
	Srfg6dhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsxz-0000000HBlo-2XaT;
	Mon, 03 Aug 2026 13:44:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsxw-0000000HBko-1uVm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:44:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7BA1595;
	Mon,  3 Aug 2026 06:44:23 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D43D3F66F;
	Mon,  3 Aug 2026 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764667; bh=tlsaj4m26Ey7o2A3mqrYe7pOBLDgXjDPJ5uCPqwZu6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bfwe9ljphKHnk02i2bUdQNUSpa2cKpcBdHPsSm41T1SgYcGZl5gWJDf56A4T70vTx
	 EjzpIsRCe1Yh4BZ6usPyGGOjKvwuzw4aVTweIk5KwWN4O6U5Fw5PD9h8JCYHvra8Be
	 jy8oHnoSsJ+WNNB9DnDJoo9uZ3Qd1Z9c1vYM5DT4=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 02/45] firmware: arm_rmm: Add wrappers for direct RMI calls
Date: Mon,  3 Aug 2026 14:43:18 +0100
Message-ID: <20260803134403.80630-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064428_576145_220487D8 
X-CRM114-Status: GOOD (  17.11  )
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

The wrappers make the call sites easier to read and deal with the
boilerplate of handling the error codes from the RMM.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes from v15:
 * Split out wrappers for realms to a separate commit.
 * Wrappers that have output arguments now only write the output when
   the command completes successfully.
Changes from v14:
 * Update to RMM v2.0-bet2 spec.
 * Move SRO related wrappers to a later patch due to dependencies.
 * Common wrappers are split into include/linux/arm-rmi-cmds.h.
Changes from v13:
 * Update to RMM v2.0-bet1 spec including some SRO support (there still
   some FIXMEs where SRO support is incomplete).
Changes from v12:
 * Update to RMM v2.0 specification
Changes from v8:
 * Switch from arm_smccc_1_2_smc() to arm_smccc_1_2_invoke() in
   rmi_rtt_read_entry() for consistency.
Changes from v7:
 * Minor renaming of parameters and updated comments
Changes from v5:
 * Further improve comments
Changes from v4:
 * Improve comments
Changes from v2:
 * Make output arguments optional.
 * Mask RIPAS value rmi_rtt_read_entry()
 * Drop unused rmi_rtt_get_phys()
---
 include/linux/arm-rmi-cmds.h | 83 ++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 include/linux/arm-rmi-cmds.h

diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
new file mode 100644
index 000000000000..5ee94da96e4a
--- /dev/null
+++ b/include/linux/arm-rmi-cmds.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 ARM Ltd.
+ */
+
+#ifndef __LINUX_ARM_RMI_CMDS_H_
+#define __LINUX_ARM_RMI_CMDS_H_
+
+#include <linux/arm-smccc-rmi.h>
+#include <linux/bug.h>
+#include <linux/types.h>
+
+#include <asm/page.h>
+
+/**
+ * rmi_rmm_config_set() - Configure the RMM
+ * @cfg_ptr: PA of a struct rmm_config
+ *
+ * Sets configuration options on the RMM.
+ *
+ * Return: RMI return code
+ */
+static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
+
+	return res.a0;
+}
+
+/**
+ * rmi_granule_tracking_get() - Get configuration of a Granule tracking region
+ * @start: Base PA of the tracking region
+ * @end: End of the PA region
+ * @out_category: Memory category
+ * @out_state: Tracking region state
+ * @out_top: Top of the memory region
+ *
+ * Return: RMI return code
+ */
+static inline int rmi_granule_tracking_get(unsigned long start,
+					   unsigned long end,
+					   unsigned long *out_category,
+					   unsigned long *out_state,
+					   unsigned long *out_top)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_GRANULE_TRACKING_GET, start, end, &res);
+
+	if (res.a0 == RMI_SUCCESS) {
+		if (out_category)
+			*out_category = res.a1;
+		if (out_state)
+			*out_state = res.a2;
+		if (out_top)
+			*out_top = res.a3;
+	}
+
+	return res.a0;
+}
+
+/**
+ * rmi_features() - Read feature register
+ * @index: Feature register index
+ * @out: Feature register value is written to this pointer
+ *
+ * Return: RMI return code
+ */
+static inline int rmi_features(unsigned long index, unsigned long *out)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_FEATURES, index, &res);
+
+	if (res.a0 == RMI_SUCCESS && out)
+		*out = res.a1;
+
+	return res.a0;
+}
+
+#endif
-- 
2.43.0


