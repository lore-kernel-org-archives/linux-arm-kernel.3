Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2E2CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzqLMjW+lenkO1KxhaLhUJAxVixUoIHwAJfNyGmEuH0=; b=JYqrzP4AMvy2O9KFaoSWqL5dBX
	B7PFV9YIRHW7Rl7wVjx85lQ6VhDW2VcZhlWssbZ5DV3QCWUhLgzmpY17ZvxdZB8fCP09RN0kDJPjQ
	sOGaD1jewm36hZkffpcjDUnIBqODHSUX40aLpnWD3mU5GYaP9UOSzASOV0YWuphUyF7FxqHivHAZ6
	V0ont8H9jzPn+7Wl33/Ngqs8N368rq+1sfWM/Z7R9uCphrnn9svZztXq3nELWpMTMWj4eVZ5Swmww
	oiRIQBl79DygJ62i1etqXiJ4TVrtTEM4cFFqS0E13sjnT6JeYSN1Px80S6YB6h2BQLPYNvAwmaXSt
	UboUGRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYl-0000000AhKo-1KI5;
	Fri, 02 Oct 2026 06:15:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYc-0000000AhHh-1VJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:15:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E7F1476;
	Thu,  1 Oct 2026 23:15:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1C83F763;
	Thu,  1 Oct 2026 23:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790921745; bh=+6Xths1JI4IeqE2FNY99YGeItpeMTy1U/N3c+004VWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RjGJJGAKagdYSdvvJGR1d94i7Hjoe2GlRl+og/wDIaAbhXJeaXIYNyEi8DC9UgSKH
	 EvUeNwSohef50RmQb9gsjWx2uQRH3s75XWQqpovAwgV4kfr8AsDo8L6lwibqqFC1lp
	 jRouxA6UJF7qbm8GTyTF+fc794nWM6N0G4WPgQnM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 03/10] firmware: arm_rmm: Configure the RMM with the host's page size
Date: Fri,  2 Oct 2026 07:14:59 +0100
Message-ID: <20261002061507.1600269-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002061507.1600269-1-suzuki.poulose@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_231552_846408_C695D901 
X-CRM114-Status: GOOD (  16.06  )
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

From: Steven Price <steven.price@arm.com>

RMM v2.0 brings the ability to set the RMM's granule size. Check the
feature registers and configure the RMM so that it matches the host's
page size. This means that operations can be done with a granularity
equal to PAGE_SIZE.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Changes since v19:
  * Don't initialize 'ret' in rmi_configure, add explicit return 0/-EINVAL
 Changes since v18:
  * Move the rmi_config_set closer to rmi_configure, drop the comment
  * Use __free() magic for rmm_config object
 Changes since v17:
  * Move rmi_config_set() out of the header file.
  * Print the error message for rmi_config_set if it fails
 Changes since v15:
  * Actually check the feature register for the host's page-size support.
 Changes since v14:
  * Move the implementation into drivers/firmware/arm_rmm.
 Changes since v13:
  * Moved out of KVM.
---
 drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 06f5392c982d2..eeb61b453b83d 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -87,6 +87,72 @@ unsigned long rmi_feat_reg(unsigned int index)
 }
 EXPORT_SYMBOL_GPL(rmi_feat_reg);
 
+static int rmi_rmm_config_set(unsigned long cfg_ptr)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RMM_CONFIG_SET, cfg_ptr,
+	};
+
+	rmi_smccc_invoke(&regs);
+
+	return regs.a0;
+}
+
+static int rmi_configure(void)
+{
+	unsigned long granule_feature;
+	unsigned long granule_size;
+	int ret;
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		granule_size = RMI_GRANULE_SIZE_4KB;
+		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
+		break;
+	case SZ_16K:
+		granule_size = RMI_GRANULE_SIZE_16KB;
+		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
+		break;
+	case SZ_64K:
+		granule_size = RMI_GRANULE_SIZE_64KB;
+		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
+		break;
+	default:
+		BUILD_BUG();
+	}
+
+	if (!(rmi_feat_reg(1) & granule_feature)) {
+		pr_err("RMM does not support %luKB granules\n",
+		       PAGE_SIZE >> 10);
+		return -ENXIO;
+	}
+
+	struct rmm_config *config __free(free_page) =
+		(struct rmm_config *)get_zeroed_page(GFP_KERNEL);
+
+	if (!config) {
+		pr_err("Unable to allocate memory for RMM config\n");
+		return -ENOMEM;
+	}
+
+	config->rmi_granule_size = granule_size;
+
+	/*
+	 * For now we set the tracking_region_size to 0 which is the only option
+	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
+	 * TODO: Support other tracking sizes via Kconfig option for other
+	 * PAGE_SIZES
+	 */
+	config->tracking_region_size = 0;
+
+	ret = rmi_rmm_config_set(virt_to_phys(config));
+	if (ret) {
+		pr_err("RMM config set failed (%d)\n", ret);
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static int __init arm64_init_rmi(void)
 {
@@ -101,6 +167,10 @@ static int __init arm64_init_rmi(void)
 	if (ret)
 		return ret;
 
+	ret = rmi_configure();
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.43.0


