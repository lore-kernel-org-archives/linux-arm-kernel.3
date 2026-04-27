Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E3FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBhR+VMSApqnVLtcX1lDKgGxByVA+JUSoS902W+VVIk=; b=dhwFiLR4R4n+ZcQrlra1/kIHN+
	274xKCotmIO2+rvKyZ67fTNe/bRRrQc24XA4GtXLVyIIq6IO2aRPBJf8A8XwR6Pm52RdZOhNfwTNl
	Myw/ifOXl2sVp9+lXXlUiPRFauEpppQMRszYQ+6mLOF8p/JFyOaXj107ND+PpVjoqIupYVNbOIOR1
	3wMqSVEdk8as85L+NFwdXb5Q0H0TByv/WfWkokR0VGESes6pBqt2PrLwxYBJ41V1fYoyXLKwGIJrY
	E4738hOrCTUmj0+8GEtFrjZD3Y4zWHrgAaOqiTFJuRl/d9xljFF+j4K6fxA2315pELHrrYIDTEioz
	hANi4XSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFq3-0000000GIz6-1cLl;
	Mon, 27 Apr 2026 06:53:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpt-0000000GIoi-2J4W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39AD143788;
	Mon, 27 Apr 2026 06:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D30BC4AF0B;
	Mon, 27 Apr 2026 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272773;
	bh=TKihfP1sVP9MoGos7O6yEjkbJNsJ70AjwacVZf82tOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jb1GNe7oJiWmum8eE+T3ZUHoLT6j/OA0ZwpbjHuWebCbYAIuZ5FoqY15tUhTJx2LK
	 WrPejaCgrTcjFQhm1tLf1LCclzLc98EreGo2TbtiXili1SBXxQKmvUbddoIW3dgwg0
	 ZZBY37PV8tL/nS/NnKgMmneG9MNHBfsGz14rTMiNTL6zxzXQV9twoTmkVFytCTfGlt
	 m8piyK1TPe0UrBE8Bq8wUHvsKD9mB9ZU32UlrJu7lGedIKeN2n7IF6XW9dHuCtOfvl
	 OhV2qrdcw2+V+TDF7OfyqUv4VT1Rztktxc2ez54IHSTLpZRIb1uXMnFyhKLLsW+ej8
	 V32UcleUrrZHA==
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
Subject: [RFC PATCH v4 14/14] coco: host: arm64: Add NCOH_SYS stream support for RC endpoints
Date: Mon, 27 Apr 2026 12:21:21 +0530
Message-ID: <20260427065121.916615-15-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_235253_702435_544ABD0E 
X-CRM114-Status: GOOD (  14.12  )
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
 drivers/virt/coco/arm-cca-host/arm-cca.c | 28 ++++++++++++++++++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 10 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 265aa0cb612a..8b1182620872 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -277,11 +277,39 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
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
+	params->type = RMI_PDEV_STREAM_NCOH_SYS;
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
index a10ac6ff03d1..33a2551fd09f 100644
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


