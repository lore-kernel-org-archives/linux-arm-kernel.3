Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CE8105A598
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkTGkmqzikfNaSbExFmva/vvpfA5O4wv5NIuhANKd+s=; b=oKoq9kpkpJbV9jUyvZW9NwzQ2I
	sr8nn8nmHSws6RRZDgLIsmPNX9+ya+n/sRs493eDsgBUQT7SyPER82YaI1iyUWpr++hpdsaLz7F+b
	SMsYRxXT+0xl8Yd1gLfmPppoL+aPj0mSG926agnYAndnbFVZ91X+nJvTp4O7HhW8P6dQk0AznIJfP
	e5hm9MltBGxqNz1IRx5G+bkLzUX+G2DILSMgJy3iaIBafM1XfCqUT36h8lP0hs+XnCi+5yqnJyib8
	yfbXCF6RM0CUyyOF+WC8sFpokkPhBqbQ5NUrZph1BS4sGaRc005DvmHepD6yfnBbaQVW33t182LhA
	RJQzUfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fh3-0000000E6Kv-3qC2;
	Thu, 12 Mar 2026 13:03:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fh1-0000000E6JJ-4Bdr;
	Thu, 12 Mar 2026 13:03:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 324054187B;
	Thu, 12 Mar 2026 13:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324ABC4CEF7;
	Thu, 12 Mar 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320591;
	bh=cEWEtVNxn7YA4HCPF4joB80toxgCA1BCz1lWZNuQ6rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTjvjjpiibuQ2rlWJcLLx8nGT/ksAGWZMYUCLVX72eNtj1Rmwo/kl7RB5JFuTEGoj
	 iYamGA0aXcvHoLY1KyNIf2ZLj/iUWJJ420hLYGEoEmfX96yZPIE8vYrIW7BBMCzLNT
	 elfcyow5Ql2m3n7gb3xX5d2MeyfvElRvrJVoaSIaqm5KP9+zqggTr6W0IkRmGfYQ2m
	 mUoYZ7PHoPDlCtYFi7w6TI9HBudWKai2QKxPVLiYwYWV4hA7g4tE/L2RoJ5Vw7EeKE
	 nWANYUVv9AhZHxvfQdCFB62aGs+QZD3SZgSv3+AFpbc8u3xhNehfA1HNeZjAlKEX6a
	 vlGtm2Bka3btw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 04/10] PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
Date: Thu, 12 Mar 2026 14:02:32 +0100
Message-ID: <20260312130229.2282001-16-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312130229.2282001-12-cassel@kernel.org>
References: <20260312130229.2282001-12-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154; i=cassel@kernel.org; h=from:subject; bh=f1LYtE3q/j0+VWpsNcU5CJsbxfsJPELN/5WncWLOpCY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI37cxZ2er2uvFMyu051nzC3TFxarNEApatEnD+GnzQ5 6qBG5dcRykLgxgXg6yYIovvD5f9xd3uU44r3rGBmcPKBDKEgYtTACbiG8/wvz7wnZzTt7itIq/X l8/eNlduGXvE56RZecYGjqcWCb9boMzwv6RByfP34QnXZv/467Prkr/CVIv47X0rrmk/3OtiPS1 zFgcA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_060312_087730_9CF9B84A 
X-CRM114-Status: GOOD (  12.43  )
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

From: Koichiro Den <den@valinux.co.jp>

On RK3588 PCIe3_4L in EP mode, the integrated DMA controller registers
are permanently mapped to BAR4 and must not be repurposed by EPF
drivers.

When the remote peer needs to access these registers, it must use the
fixed BAR4 window instead of creating another inbound mapping in a
different BAR. Mixing the fixed window with an additional mapping can
lead to incorrect behavior.

Advertise the DMA controller MMIO window as a reserved BAR subregion so
EPF drivers can reuse it safely.

Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..ecc28093c589 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -403,6 +403,15 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
+static const struct pci_epc_bar_rsvd_region rk3588_bar4_rsvd[] = {
+	{
+		/* DMA_CAP (BAR4: DMA Port Logic Structure) */
+		.type = PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO,
+		.offset = 0x0,
+		.size = 0x2000,
+	},
+};
+
 /*
  * BAR4 on rk3588 exposes the ATU Port Logic Structure to the host regardless of
  * iATU settings for BAR4. This means that BAR4 cannot be used by an EPF driver,
@@ -420,7 +429,11 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
-	.bar[BAR_4] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = {
+		.type = BAR_RESERVED,
+		.nr_rsvd_regions = ARRAY_SIZE(rk3588_bar4_rsvd),
+		.rsvd_regions = rk3588_bar4_rsvd,
+	},
 	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
-- 
2.53.0


