Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF906C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHQ/Pe7Y00pAmsP6/IDee4ImT/neh3NNZt5eWfUFulM=; b=e+C2wFYBtR171cl0Wtm+KKUKuy
	nh4KV9Dqog4tBnBXh+w1aC6k4Wo5Mv5+4gbN1wN9gVZvvjodgs/jG6qrXkg5U+0xH582PZ3wqkKj1
	jN7RJsqWOsNlBLnLBlGpOrBRFbcggLwatT7QEIAThE9100u8JwNWPN3ccit1ZDNdtnEY3oq51awKQ
	z9+4kXNaq8Ufpx3ijTj0S+9RbHO+4QRnLFISbELRAtpgVcxtbbR/5OGAharEFaZ1lRRE+XQYmtssg
	IGdrOK6DU4iAslKH2JC2N0VpkUSlebamqbQRUc0W0/RC1QhmI2+JUwu2O2SxNd2zqBdaTDcUZ9aZC
	1A2Xvj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsy8-0000000HBrA-16Ch;
	Mon, 03 Aug 2026 13:44:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsy5-0000000HBpj-2nGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:44:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE762143D;
	Mon,  3 Aug 2026 06:44:32 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9965A3F66F;
	Mon,  3 Aug 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764676; bh=a87dBoIo+abuHgtTSNKpMeJOicdZeUlF8rukrl520eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pMyjQBeBYwoZSI0DbSR2aZTg1nQpOqpGBko74lcraMj2do/JBVxlHmi9zICxzM7de
	 iZEcEpqEky0c+AANwK9eXvydVOl2QjP1Ndgt52P0yU90vYc0XiNtTXKBLkf/sijbYw
	 qQ/ALa0hCmvxwZtXPBgCjnL7vQDdrWON0zgltEN8=
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
Subject: [PATCH v16 04/45] firmware: arm_rmm: Configure the RMM with the host's page size
Date: Mon,  3 Aug 2026 14:43:20 +0100
Message-ID: <20260803134403.80630-5-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064437_781857_23BED0E9 
X-CRM114-Status: GOOD (  15.20  )
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Actually check the feature register for the host's page-size support.
Changes since v14:
 * Move the implementation into drivers/firmware/arm_rmm.
Changes since v13:
 * Moved out of KVM.
---
 drivers/firmware/arm_rmm/rmi.c | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 008a783407b4..ff9f76cc199a 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -77,6 +77,63 @@ static int rmi_read_features(void)
 	return 0;
 }
 
+static int rmi_configure(void)
+{
+	unsigned long granule_feature;
+	unsigned long granule_size;
+	long rmi_ret;
+	int ret = 0;
+	struct rmm_config *config;
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
+	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
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
+	rmi_ret = rmi_rmm_config_set(virt_to_phys(config));
+	if (rmi_ret) {
+		pr_err("RMM config set failed\n");
+		ret = -EINVAL;
+		goto out_free_config;
+	}
+
+out_free_config:
+	free_page((unsigned long)config);
+	return ret;
+}
+
 static int __init arm64_init_rmi(void)
 {
 	int ret;
@@ -90,6 +147,10 @@ static int __init arm64_init_rmi(void)
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


