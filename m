Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3372BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+7O13uHulZbXdhe36Q5BR5+IY9+h/5KwXoJ3LLSuIE=; b=1vAeOPpGzivyTqDbKeGK8f48EF
	aIpEKQY41vZgoF04bzjWW12hBls88gEQVIB6iO32mcNwL50kxL+JRP1zkvhiox9wkDqkaoqi57Obv
	OsfxO864TMPwNxxDtES+1HJ34znb6L3QCnQ1a5rp1GRzj49lFJRm4vrnFI9dMe/A/0MXeI3R9yfdp
	1GD2p77LYwdXPUXHRlkGBoXzi6dsawJSfdrr7cvfDojb6VmVvb4463/TTXUCXbzoYLgKS217DtZ10
	tgHV4LNOUHZR9IY/i4/c02rwqTLCy8wBTCYFh24XfZz1I8yyxY0Nu4CP+luNQyI8PJ3cKEC9/WoC1
	mPUGQF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZw4-00000002BOU-3Bwu;
	Mon, 10 Mar 2025 10:00:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZl3-0000000292Y-0fBp;
	Mon, 10 Mar 2025 09:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B83035C5BB7;
	Mon, 10 Mar 2025 09:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD25BC4CEE5;
	Mon, 10 Mar 2025 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741600152;
	bh=yMoYyGKM6FbagclOTpM00d2Qgsis276wrIoNJyyP4ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIfzMIhKDL7LfJT3bKcGj2WL0jUzprjjHhKjEwU2xOEMcAigwlaGpKOFeUNPGdvuD
	 9ZiBSfhUSDKywYn9NuOPBHSe6dvRBoIl5Z1KWgAnYMbV6zmyN/e1SJaAT1/Wv9SBuF
	 JyCSulHZAMRJedhmtO7/tSSAt3p7w45ao9gsuJfJL8SmtlASsKlJld371Nia/gfSnv
	 ZDzPHW/f/4P7d8t380scWsRJTrM22d++II1UYMGZgnfNZ+WTFMIuVzMhSWNc3clSWJ
	 KzIzAYaOYRxcxVzc4Y8WfsZS0W1S6A/vFCBP2aQjmk+7BLVo68anX1r1Ld50Bq64jw
	 XpRg0bOf9GvtQ==
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
Subject: [PATCH v3 2/2] PCI: dw-rockchip: Hide broken ATS capability
Date: Mon, 10 Mar 2025 10:48:28 +0100
Message-ID: <20250310094826.842681-6-cassel@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310094826.842681-4-cassel@kernel.org>
References: <20250310094826.842681-4-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114; i=cassel@kernel.org; h=from:subject; bh=yMoYyGKM6FbagclOTpM00d2Qgsis276wrIoNJyyP4ys=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNLPbS3YwnG/vL2pw7m5dq2mv3Fez26Re1071GUVb2muZ xFYv+1hRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACbSk8nwP84vaFcDb8O6DvuX 6oUFeTZza05pnb5qZhaglGc76+pSb4b/+dZbS5c+8Des59rp2aX77OOWn8tvuXFta+Fdv9Jj0y8 HZgA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_024913_301233_3DB69264 
X-CRM114-Status: GOOD (  18.33  )
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


