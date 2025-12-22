Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70113E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmZCNE4hWf1YvQ9Nc+exmjFUaLNsEO1ivjvN2871RWk=; b=poNqas3jKGt8MhFuhUNS9TBFDR
	bK1DEhb/e9GO7AYZqdSJpeNQsS55+px2Y6sJg7foxYIgoRvgj9+5dwqbAo2KPNB+eXafXuK80RRih
	c0JiGRTreRv81OZKdI6Jfe4C1G9YcchXNuvSkvTGoUpntEL6OsnNrExWOZ76lmBoGmYdKKa1ZQzNO
	tbiRHIu2XmxQxveKCimq5yhrBi7VifdgwkDM+bbhj//iHKPzF2TfnXMfwcv6mV8pT+/senCns/5dd
	ul7fRGkduEEm18yjcH/sGg28vDCAaLcJejuYxSMKDxOnft2gusuJ2fxbe+IO7NjS5e6XJoSzYdt1T
	g51BwzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZcn-0000000DJy7-1m40;
	Mon, 22 Dec 2025 06:42:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZcl-0000000DJwn-0a1m;
	Mon, 22 Dec 2025 06:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1AB160052;
	Mon, 22 Dec 2025 06:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A335C4CEF1;
	Mon, 22 Dec 2025 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385748;
	bh=wyHpVuZ3UXRhGMRjUk0u+zZlgkSvVwbR2SDPLaVFwd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PvjQGLNWX52sgezlN/5qx6d+FYaeEQJNh5UH8WbMF6L8iNhC8c9X1rR+b/HI4L0Q5
	 EFv0LKPY2r14uwYgfl60cxrKNuAdLx2Qzh1NezzZWnInDvtITEubIenC8Ia4xDeWAu
	 pDHlcv04AvvtF4Uw7/9pis9PCXpRf9EV+KH816LpTgDgUfJbHgdMW5ZkZurddH2RjN
	 lOVYHAMrDQspXFToKtvfaolD2FnPyGGxSpXR+0KWadcMFjDfnP6P7p/Ig4zqgf7s7u
	 MtMIANcY0HSwFIZbc8ePpwCNV0iVoR10kS0UT6wUPqQQ203J6mpntq4PoB0zPpFaGI
	 2lH4G3G6jRkRA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	stable@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/6] Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
Date: Mon, 22 Dec 2025 07:42:08 +0100
Message-ID: <20251222064207.3246632-9-cassel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222064207.3246632-8-cassel@kernel.org>
References: <20251222064207.3246632-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620; i=cassel@kernel.org; h=from:subject; bh=wyHpVuZ3UXRhGMRjUk0u+zZlgkSvVwbR2SDPLaVFwd8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI9XrgFnu2oFnrxzWFGb0DBjOXOla07t7iU+cje77AIz eJ7l3+jo5SFQYyLQVZMkcX3h8v+4m73KccV79jAzGFlAhnCwMUpABM52M/wz7LgdfDu67Ud8/Zx Xbvrv+/n18kX7NOdtQzPJF+8vsT/Kx8jw/+/27Mlgm7JVCZuevNqy809m9nuOVjwFypxT4na+PK 0JCsA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
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

This reverts commit ec9fd499b9c60a187ac8d6414c3c343c77d32e42.

While this fake hotplugging was a nice idea, it has shown that this feature
does not handle PCIe switches correctly:
pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46

During the initial scan, PCI core doesn't see the switch and since the Root
Port is not hot plug capable, the secondary bus number gets assigned as the
subordinate bus number. This means, the PCI core assumes that only one bus
will appear behind the Root Port since the Root Port is not hot plug
capable.

This works perfectly fine for PCIe endpoints connected to the Root Port,
since they don't extend the bus. However, if a PCIe switch is connected,
then there is a problem when the downstream busses starts showing up and
the PCI core doesn't extend the subordinate bus number after initial scan
during boot.

The long term plan is to migrate this driver to the pwrctrl framework,
once it adds proper support for powering up and enumerating PCIe switches.

Cc: stable@vger.kernel.org
Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 8c1c92208802..ca808d8f7975 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -601,7 +601,6 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 
 	pp = &rockchip->pci.pp;
 	pp->ops = &rockchip_pcie_host_ops;
-	pp->use_linkup_irq = true;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
-- 
2.52.0


