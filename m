Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86FCC53209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBzV1lf+wWhkWox6lmJXhVRdhmqkrNh7e32sFKBnJMY=; b=aXgNdyu4T6DFiD
	u19IQx5JjLL4M94v7EPc5wLU/weovhhrDq/q6OaQcnJa6AS10hT0hSy1hAO9zdV+6OZVbQzkklOnL
	xNolZCyu0yeAKvO9VxBLRJIMzHCDrZhQ624PPOGtPOVJVftcFVYoNOxobFgsk9eGd/beDjqjzuRHG
	CPC+LrdP+whv77hZEBYFFfkGhwpUxiRFmLOSVfZT4YQpiqMBXk/SjY+ZE2kYpfKqn7pJ0ydZxTTkp
	bx0VzIa62i1dax/pMivqjgWTcLfq8DEGubgrA/4HDy1Ms/I0HPiM/pjQYATdQPuvxVpcdOvELsP0F
	+HSN159YuDlfBTiNYH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaV-00000004CLF-09JC;
	Tue, 28 Jul 2026 01:26:31 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaK-00000004CI3-3qnc;
	Tue, 28 Jul 2026 01:26:22 +0000
Received: from smtp202.mailbox.org (unknown [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h8HqG6z8dzMlGh;
	Tue, 28 Jul 2026 03:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBzV1lf+wWhkWox6lmJXhVRdhmqkrNh7e32sFKBnJMY=;
	b=wxbTctv2S8uMTsGQMxB6AdKVo5y22DLDXhga6BQHl8QmG3yg8yFJU7ommcUHzw23/7l7aU
	MFhD5f1/GSb/FUQJHTX5JuLBXaaEhwZwotWFYxWTzg5pGTLke/y9LQAlQ51CfEKJqlBEpw
	nCAE4arox5UIS0pu6LEwYO7r92lI1N3FAzCZX9fTInfKd8VtRLIAq1VJiYwwIW4ugLE/SS
	0IqS2KMzZ2nq/ZrD+R6miPcy2tT838w6GaPfR6OXIz7+2vhPCB5Do6WBUrpf76e8fthfG/
	7Cy/xm/0JJcvXt2PzsbOW9hYtrAIS8kpp5wCdEvJtPbDpTXRp0pd1n4//yQu5w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBzV1lf+wWhkWox6lmJXhVRdhmqkrNh7e32sFKBnJMY=;
	b=k8BIYT8L6wvZRgZ7PTKcpItxNb9H+D2iCUVUcnU7l4LP/0fYp68ZU5/hvNYTfMfaAPgpLy
	MB7y7u0QbzSrjxvNkvqFiPUSKT4Y4GJK9eDNgjDO7RW4agkliXYETeNoY0OWIgo5Baixho
	3K0KPWEwQGbIAxUjE2heSQjePyCMZkFHkJVuCa3Qvz2g8PkvXSndQuEH4Iun7ijPE1FxSy
	V39Oz55nliFbv3943X5JimqVbfVXWjb2s0ObPlyVLkleeMk2XGLtEjxk98msOVmJ8Zk8Fc
	eqL3+FVOPhYJTMZTCqugqbMsHQ0IGE1UA2m2EV1dQPJGcrWxiNvjpVswVPLV3g==
To: linux-pci@vger.kernel.org
Subject: [PATCH 1/2] PCI: dwc: Handle return value from endpoint .init callback
Date: Tue, 28 Jul 2026 03:24:24 +0200
Message-ID: <20260728012548.465139-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
References: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9ee81b2ab274dca8480
X-MBO-RS-META: anhh3sfa4xeoxsnpwmmr7xnmgpum9nz5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_182621_129132_059862FF 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, Koichiro Den <den@valinux.co.jp>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Magnus Damm <magnus.damm@gmail.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Shawn Lin <shawn.lin@rock-chips.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, Manivannan Sadhasivam <mani@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Qianfeng Rong <rongqianfeng@vivo.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Yuho Choi <dbgh9129@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add return value handling for struct dw_pcie_ep_ops .init callback.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Koichiro Den <den@valinux.co.jp>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Niklas Cassel <cassel@kernel.org>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Srikanth Thokala <srikanth.thokala@intel.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Yuho Choi <dbgh9129@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/pci/controller/dwc/pci-dra7xx.c         | 4 +++-
 drivers/pci/controller/dwc/pci-keystone.c       | 4 +++-
 drivers/pci/controller/dwc/pci-layerscape-ep.c  | 6 ++++--
 drivers/pci/controller/dwc/pcie-artpec6.c       | 4 +++-
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 +++++--
 drivers/pci/controller/dwc/pcie-designware.h    | 2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c   | 4 +++-
 drivers/pci/controller/dwc/pcie-keembay.c       | 4 +++-
 8 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 3fc889944f021..6ae5b27e27b32 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -373,12 +373,14 @@ static const struct dw_pcie_host_ops dra7xx_pcie_host_ops = {
 	.init = dra7xx_pcie_host_init,
 };
 
-static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
+static int dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 
 	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
+
+	return 0;
 }
 
 static void dra7xx_pcie_raise_intx_irq(struct dra7xx_pcie *dra7xx)
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f1b27aed488de..602516239a573 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -876,7 +876,7 @@ static const struct dw_pcie_ops ks_pcie_dw_pcie_ops = {
 	.write_dbi2 = ks_pcie_am654_write_dbi2,
 };
 
-static void ks_pcie_am654_ep_init(struct dw_pcie_ep *ep)
+static int ks_pcie_am654_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	int flags;
@@ -885,6 +885,8 @@ static void ks_pcie_am654_ep_init(struct dw_pcie_ep *ep)
 	flags = PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_32;
 	dw_pcie_writel_dbi2(pci, PCI_BASE_ADDRESS_0, APP_ADDR_SPACE_0 - 1);
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, flags);
+
+	return 0;
 }
 
 static void ks_pcie_am654_raise_intx_irq(struct keystone_pcie *ks_pcie)
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 8936975ff104e..527c57114dcfe 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -147,7 +147,7 @@ ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 	return pcie->ls_epc;
 }
 
-static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
+static int ls_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
@@ -155,10 +155,12 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
 	if (!ep_func)
-		return;
+		return -ENODEV;
 
 	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
 	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
+
+	return 0;
 }
 
 static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 5cd227dda9a10..7f0ba506dd1cf 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -335,7 +335,7 @@ static const struct dw_pcie_host_ops artpec6_pcie_host_ops = {
 	.init = artpec6_pcie_host_init,
 };
 
-static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
+static int artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
@@ -344,6 +344,8 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
+
+	return 0;
 }
 
 static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 7d2794945704e..d78fb845582b2 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1367,8 +1367,11 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 		list_add_tail(&ep_func->list, &ep->func_list);
 	}
 
-	if (ep->ops->init)
-		ep->ops->init(ep);
+	if (ep->ops->init) {
+		ret = ep->ops->init(ep);
+		if (ret)
+			goto err_remove_edma;
+	}
 
 	dw_pcie_ep_disable_bars(ep);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index de4b245b1758c..004b433f17135 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -475,7 +475,7 @@ struct dw_pcie_rp {
 
 struct dw_pcie_ep_ops {
 	void	(*pre_init)(struct dw_pcie_ep *ep);
-	void	(*init)(struct dw_pcie_ep *ep);
+	int	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
 	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 731d93663ccae..bd5d1a2472a40 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -469,12 +469,14 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
 	dw_pcie_remove_ext_capability(pci, PCI_EXT_CAP_ID_ATS);
 }
 
-static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
+static int rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
+
+	return 0;
 };
 
 static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 42fb5f24a2230..b11e66c10fffa 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -278,12 +278,14 @@ static int keembay_pcie_setup_msi_irq(struct keembay_pcie *pcie)
 	return 0;
 }
 
-static void keembay_pcie_ep_init(struct dw_pcie_ep *ep)
+static int keembay_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct keembay_pcie *pcie = dev_get_drvdata(pci->dev);
 
 	writel(EDMA_INT_EN, pcie->apb_base + PCIE_REGS_INTERRUPT_ENABLE);
+
+	return 0;
 }
 
 static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
-- 
2.53.0


