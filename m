Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454B7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 01:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOb78p74bkOmvufOcc/1bh+dA535Pa9k7i52m7AyAII=; b=VuQXWY9LGk5Cl3
	zrkVltaqGk2psRrSO/aihm6selqj9uHkUhtCpyrfXvXO1kMRU7UvBWEfDiJqo/Rosv4UWWheCeS0I
	je/TdZ0X70FMFQny2B/DkjJbtDyQ6UIrNrr/lKeezkiXfO9+YEYo8NAhHfdSkmY8lnFg24WaXgfzI
	QCtV+S33OfaAjxNFwyhYDuzKEboYxJHBaaktoaPxMoVtrRCVN0L3MwkVo8PWbM7R1BYehoxY905Mf
	qVXiViVTNt9rLXs4RZuXvLIS5TDQYl9pxNPxG8WhLq57s020ykpu2D4NyQkpxkBkGUnpgAVYUtYtg
	6doYC142avQDzQSj6E8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaV-00000004CLl-0wTk;
	Tue, 28 Jul 2026 01:26:31 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaS-00000004CJY-2vWU;
	Tue, 28 Jul 2026 01:26:30 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h8HqQ237Dz8v9m;
	Tue, 28 Jul 2026 03:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOb78p74bkOmvufOcc/1bh+dA535Pa9k7i52m7AyAII=;
	b=r/EzyGH3gq0jSjzH6u+ZswyOUvyFz3jBfnRyF/1noE+2NZlS74okB3Hd4eEFnRSENgEhCU
	CF/Icl+CJzCSC9ce8uSnQCg6kbdKERYgbQ61RyHUAN0FYM+qdF9cdkMJ65SIM3BZuf8rLV
	pQrV/3ukfBlb82d//8bNoT3foQHMm6CHFz72nUGC/380OYDpBqbQfpTJKbbO9x7fmBXK/X
	Sfh1VQ6EpENZSAIxyQIcFpagiqFoIsKEI3zfRqDAibY+qzLTnbbNlrM+jy+CZqcsFsxcDW
	c0ZEqhDhvqprVa1zJMGCS0fv6RbPMp6vbWtS+nF1KWih17X9OkYRx1eIBJNfqQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sqNUGCHC;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOb78p74bkOmvufOcc/1bh+dA535Pa9k7i52m7AyAII=;
	b=sqNUGCHCwjzf00FtL5kcEQRgPIzyTFjIKf2F7BE9KNUbk5/TUqJas6eZ87Z/L6jak1NWTb
	Wo1+t44CYWQyHTb1o7LuIcQGivMjxi2X/lXD5FXo9vhH2aauOWu0GroyjMuyGrzzxI8Rl2
	qCQJNIux80uWKS6huYvmxMT82bfqORC/Y9+aYor5VhUKeGu6gq4EQPZQ/OXGqhX+88vARB
	odg2KM+Zw3YO1eDeugMhDIUkv0ANPzt/AECWKcjlD0/iOvIxj7ZlxjGgBaOmvq6SnFZAGV
	f8eD5hFLtXgXde4oHGbFfMjVK+ghKJhOz2UYiMwjz5LQM0ezx1+9CNmCUq3HuA==
To: linux-pci@vger.kernel.org
Subject: [PATCH 2/2] PCI: dwc: Handle return value from endpoint .pre_init callback
Date: Tue, 28 Jul 2026 03:24:25 +0200
Message-ID: <20260728012548.465139-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
References: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3530f36967d57e20065
X-MBO-RS-META: bmr6zbzz4m7u37imjwni6gtkry6uugwh
X-Rspamd-Queue-Id: 4h8HqQ237Dz8v9m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_182628_888316_690787E5 
X-CRM114-Status: GOOD (  13.57  )
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

Add return value handling for struct dw_pcie_ep_ops .pre_init callback.

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
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 +++++--
 drivers/pci/controller/dwc/pcie-designware.h    | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d78fb845582b2..b00239097d893 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1524,8 +1524,11 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret)
 		return ret;
 
-	if (ep->ops->pre_init)
-		ep->ops->pre_init(ep);
+	if (ep->ops->pre_init) {
+		ret = ep->ops->pre_init(ep);
+		if (ret)
+			return ret;
+	}
 
 	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 			       ep->page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 004b433f17135..6546dc3aa2075 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -474,7 +474,7 @@ struct dw_pcie_rp {
 };
 
 struct dw_pcie_ep_ops {
-	void	(*pre_init)(struct dw_pcie_ep *ep);
+	int	(*pre_init)(struct dw_pcie_ep *ep);
 	int	(*init)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 5f7211b91ee5b..fbe465a29068f 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -481,7 +481,7 @@ static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
 }
 
 /* Endpoint mode */
-static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
+static int rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
@@ -489,9 +489,11 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 
 	ret = rcar_gen4_pcie_common_init(rcar);
 	if (ret)
-		return;
+		return ret;
 
 	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
+
+	return 0;
 }
 
 static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
-- 
2.53.0


