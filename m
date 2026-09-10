Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E8C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfACVSTqqZWVHHMsfW9j7D8zjVuyoIFAMlGVkuERVwY=; b=lJTkC73m0KSReAG7doxywzhLtC
	zwNy7cEvVbD/YzEFtAhjSVrcwiVS743VodFSJL03A2bnV/iPgGb69SurYen/9c1Vpz9XcXwCpVhob
	YKMh4YVkfegq+hOFvQMfUX25P+YzvIJ17GubEgLQ4z2c/02mh0rcetG/GmDy82xzyKw//4pVTMy8h
	2twzbu15NOI/oj2Uu+8kbbC+53hd38pfUJR1FqZsHJ3/rymuhC+afKy6BHQiR06LNpMd3Wk+P34pU
	HFyiU66XvahelV+qbyzDr/6RsVHqQx1PyCI7RlXTTn2SwsRv7iJjPL25zm91fYeh/TSkcegVMK9zg
	insS/IZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQY-0000000EZT7-3GlU;
	Thu, 10 Sep 2026 14:06:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQV-0000000EZOP-0b3K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E129A416F3;
	Thu, 10 Sep 2026 14:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039471F00898;
	Thu, 10 Sep 2026 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049214;
	bh=HfACVSTqqZWVHHMsfW9j7D8zjVuyoIFAMlGVkuERVwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g16gXhhxkVq5S5oxzfWsaWCw3urd025JZW1sxsu9eBUu1CdJDqpISr68hktAo/CHr
	 2F2O/QCunWoL+37JccgSRDvuhWzbmLGW4J0X2PhPFNGRVwApRS5XmPH5Lf0Ylg4PPa
	 YbhNeDsiLtUHHK83QQtbLdaJ3I9v5IhzjCI5tAM3J049vv7Atw+WEUIhjtbQvwAAf4
	 dDzmBw1Y1FPRD6I1J8/MaZjYuBAMNfvOZl1N2XddNvNnW4w4BWdXCZSt6NfMABdXqd
	 KBVRcFCrHkdq0LMLI22NTuK2daML6fj7B3HFs5psQJtkawQQmgXk/MYUp4/fhuY4nP
	 mtTkAoj8KrYTA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [PATCH v5 14/15] coco: host: arm64: Add NCOH_SYS stream support for RC endpoints
Date: Thu, 10 Sep 2026 19:35:07 +0530
Message-ID: <20260910140509.868402-15-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910140509.868402-1-aneesh.kumar@kernel.org>
References: <20260910140509.868402-1-aneesh.kumar@kernel.org>
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

Teach the host CCA pdev setup to handle PCI_EXP_TYPE_RC_END devices.

Classify RC integrated endpoints as RMI_PDEV_FLAGS_CATEGORY_ON_CHIP_EP when
building the RMM pdev parameters, and only advertise SPDM support when a
DOE mailbox is present.

Also add the stream setup path for these devices by creating an
RMI_PDEV_STREAM_NCOH_SYS stream using the endpoint pdev and its bridge
address windows. This allows RC endpoints to participate in the TDISP flow
without requiring a separate root-port pdev.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-host/main.c   | 28 +++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c | 10 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/virt/coco/arm-cca-host/main.c b/drivers/virt/coco/arm-cca-host/main.c
index 70cbff181561..b7b0cc0a016c 100644
--- a/drivers/virt/coco/arm-cca-host/main.c
+++ b/drivers/virt/coco/arm-cca-host/main.c
@@ -252,11 +252,39 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
 	return ret;
 }
 
+static int cca_pdev_create_ncoh_sys_stream(struct pci_dev *pdev)
+{
+	int ret;
+	long stream_handle;
+	struct rmi_pdev_stream_params *params;
+	struct cca_host_pf0_ep_dsc *pf0_ep_dsc = to_cca_pf0_ep_dsc(pdev);
+
+	params = (struct rmi_pdev_stream_params *)get_zeroed_page(GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
+
+	params->flags = 0;
+	params->stream_type = RMI_PDEV_STREAM_NCOH_SYS;
+	params->pdev_1 = virt_to_phys(pf0_ep_dsc->pdev.rmm_pdev);
+	params->pdev_2 = 0; /* ignored */
+	params->ide_sid = 0; /* ignored */
+	params->num_addr_range = pci_dev_addr_range(pdev, params->addr_range);
+
+	ret = cca_pdev_stream_connect(pdev, NULL, params, &stream_handle);
+	if (!ret)
+		pf0_ep_dsc->stream_handle = stream_handle;
+
+	free_page((unsigned long)params);
+	return ret;
+}
+
 static int cca_pdev_create_streams(struct pci_dev *pdev, unsigned long stream_id)
 {
 	switch (pci_pcie_type(pdev)) {
 	case PCI_EXP_TYPE_ENDPOINT:
 		return cca_pdev_create_ncoh_stream(pdev, stream_id);
+	case PCI_EXP_TYPE_RC_END:
+		return cca_pdev_create_ncoh_sys_stream(pdev);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index fcca9f73b5fb..794385f818ce 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -66,6 +66,16 @@ static int init_pdev_params(struct pci_dev *pdev, struct rmi_pdev_params *params
 		category = RMI_PDEV_FLAGS_CATEGORY_ROOT_PORT;
 		break;
 	}
+	case PCI_EXP_TYPE_RC_END: {
+		struct cca_host_pf0_ep_dsc *pf0_ep_dsc = to_cca_pf0_ep_dsc(pdev);
+
+		/* Use SPDM if present */
+		if (pf0_ep_dsc->pci.doe_mb)
+			params->flags = RMI_PDEV_FLAGS_SPDM;
+
+		category = RMI_PDEV_FLAGS_CATEGORY_ON_CHIP_EP;
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.43.0


