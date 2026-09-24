Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142AFC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lxt9gZRHSs1foD+tuClpy2jYqZ24hVUihxnLxiNKWo=; b=YPdrmiPzYw9b6s/xtCabNvbMoJ
	fIyNfhGIA+wkpBm0T6jURRjmmDH5ZPa+SYj+N9X98QJmHAm6H9rL0hFhgYTP9EyxGBQLAJqh5yoFH
	NdVP7veOm5EtzHVzKMjg4J8FXEVDnjR0KMMIC8z2c+I5ftZTylnct6w49d2Ia5PHJ4z7GqKpu/V9w
	hB7gzOpVyhw+PsjOaFvwYO01Mh1DRHWsDk952oIgcimkE6PNJuy5cv4NGndSCQ8pB9s+v72GxNLjE
	BZL3AWNbrST1HJwl1b9Dcr5s4wP7/YaGVWR88qJqn0eV0s1kbdyamikf/SdAAsMNQ91belG8TsWIb
	Y78TOd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jsT-0000000B94w-2TtT;
	Thu, 24 Sep 2026 13:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jsE-0000000B8ww-35t3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:52:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B100F1570;
	Thu, 24 Sep 2026 06:52:25 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D91B23F86F;
	Thu, 24 Sep 2026 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790257949; bh=qa9TZc+aTVWQg28XUDat98BhOFmHoCXzzZDDjNuWdBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sPJUmP8g1+AefzPlXHz6cLm6+/mYNdV+uq+2qdC0sPnNVCcJbFLzRteCy+uMp9x4x
	 NlHQZjBOzK2wHXffBADSFoG/1sNvYEeWztkfjTl5EXKqBySWVzlEawzmKyJDqwtIzg
	 Qsjwgq0ix/WPIXWS1eL/pfDaJcUlc+ReHMMkx1bM=
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
Subject: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the host's page size
Date: Thu, 24 Sep 2026 14:51:57 +0100
Message-ID: <20260924135201.850038-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924135201.850038-1-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065230_889252_94767355 
X-CRM114-Status: GOOD (  16.50  )
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

RMM v2.0 brings the ability to set the RMM's granule size. Check the
feature registers and configure the RMM so that it matches the host's
page size. This means that operations can be done with a granularity
equal to PAGE_SIZE.

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
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
index 3baba931f92e4..c9ea964fd9081 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -84,6 +84,72 @@ unsigned long rmi_feat_reg(unsigned long index)
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
+	int ret = 0;
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
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
 
 static int __init arm64_init_rmi(void)
 {
@@ -98,6 +164,10 @@ static int __init arm64_init_rmi(void)
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


