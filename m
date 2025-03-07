Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB30C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+7O13uHulZbXdhe36Q5BR5+IY9+h/5KwXoJ3LLSuIE=; b=pwIfabfvHl+j6bnycWSwp8VkmW
	Fnf8YFYz+JRBnFYEKhNtsV5HEZjpVw3CvRYKE9d9GjIOrJqGx2J8VdzCwAwi2KfXuxdpeeehz1BA3
	L2BE0YGijC1ow646PH4tuiXQuFIZxU5Hc5NT1wdJNtD1IWKUUyBFE0f+yJJhpSQvK5aIDhuoXaNki
	llZB9YPHAAYKFX3OCj4iS+J/XJZeWmJwc/pPby3+gXshxUwSLUSsiTUlEOXs35dLMX1Imxn+vP69u
	CrRcwKh6/Y2t2alIoPB24nc/TzU7e4MSDlI/BS7a0XoVhuC6mrnUrS+mEufyhAgRptwZ4i4mKrU2z
	IrO3k6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXAQ-0000000EEEz-1OJT;
	Fri, 07 Mar 2025 12:51:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqX7J-0000000EDee-0cpT;
	Fri, 07 Mar 2025 12:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86801A45776;
	Fri,  7 Mar 2025 12:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02946C4CED1;
	Fri,  7 Mar 2025 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741351671;
	bh=yMoYyGKM6FbagclOTpM00d2Qgsis276wrIoNJyyP4ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBJ1kRJym+MLwffziarp2SQHYX9pyoStle3jVRUQBNdBy3oDTq4dDapuJPRmxunJI
	 w09KYtz1P+421K4elybUlI8X05IOOYpOZqmovKrBpZlIvc346m7Ci7balOmeQn7gh4
	 48RPPPEeNBPlAXbIp29J89DRDMtZacL1bbuSjm7Dbak7nM7/+A2Mj9j5VWlkE/dApe
	 ey0VWv7kjjmylm40OXOcVQkFzoefoRSj6rKBMZ7McpOtFbi9jrlEhv8OfATBNEOJNQ
	 Aqkc4sqmjA1mdA9Di9IgxHvN4xsL2OE7CoEUwZQBsJfLAH/rydd2OlsTLSS9ZoAzEz
	 Z3hguMCot8d1A==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/2] PCI: dw-rockchip: Hide broken ATS capability
Date: Fri,  7 Mar 2025 13:47:35 +0100
Message-ID: <20250307124732.704375-6-cassel@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307124732.704375-4-cassel@kernel.org>
References: <20250307124732.704375-4-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114; i=cassel@kernel.org; h=from:subject; bh=yMoYyGKM6FbagclOTpM00d2Qgsis276wrIoNJyyP4ys=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJPvXq6heN+eXtTh3Nz7VpNf+O8nt0i97p2qMsq3tJcz yKwftvDjlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAExk1WyG/4VC5o0b+TZrSTI8 c2G0+L/5Cvfiiv25Eq4xz0ILbq6ZqMjw359lfYihXWdqwdfrhueelSuudWreHn436bgJ+wVufe2 97AA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_044753_352073_9C0EF391 
X-CRM114-Status: GOOD (  18.35  )
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

When running the rk3588 in endpoint mode, with an Intel host with IOMMU
enabled, the host side prints:

  DMAR: VT-d detected Invalidation Time-out Error: SID 0

When running the rk3588 in endpoint mode, with an AMD host with IOMMU
enabled, the host side prints:

  iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]

Rockchip has confirmed that the ATS support for rk3588 only works when
running the PCIe controller in RC mode [0].

Usually, to handle these issues, we add a quirk for the PCI vendor and
device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
we cannot usually modify the capabilities on the EP side.

In this case, we can modify the capabilities on the EP side. Thus, hide the
broken ATS capability on rk3588 when running in EP mode. That way,
we don't need any quirk on the host side, and we see no errors on the host
side, and we can run pci_endpoint_test successfully, with the IOMMU
enabled on the host side.

[0] https://lore.kernel.org/linux-pci/93cdce39-1ae6-4939-a3fc-db10be7564e5@rock-chips.com/

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 836ea10eafbb..bc4339252a03 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -242,6 +242,32 @@ static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
 };
 
+/*
+ * ATS does not work on rk3588 when running in EP mode.
+ * After a host has enabled ATS on the EP side, it will send an IOTLB
+ * invalidation request to the EP side. The rk3588 will never send a completion
+ * back and eventually the host will print an IOTLB_INV_TIMEOUT error, and the
+ * EP will not be operational. If we hide the ATS cap, things work as expected.
+ */
+static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+
+	/* Only hide the ATS cap for rk3588 running in EP mode */
+	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
+		return;
+
+	if (dw_pcie_ep_hide_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI,
+					   PCI_EXT_CAP_ID_ATS))
+		dev_err(dev, "failed to hide ATS cap\n");
+}
+
+static void rockchip_pcie_ep_pre_init(struct dw_pcie_ep *ep)
+{
+	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
+}
+
 static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -314,6 +340,7 @@ rockchip_pcie_get_features(struct dw_pcie_ep *ep)
 
 static const struct dw_pcie_ep_ops rockchip_pcie_ep_ops = {
 	.init = rockchip_pcie_ep_init,
+	.pre_init = rockchip_pcie_ep_pre_init,
 	.raise_irq = rockchip_pcie_raise_irq,
 	.get_features = rockchip_pcie_get_features,
 };
-- 
2.48.1


