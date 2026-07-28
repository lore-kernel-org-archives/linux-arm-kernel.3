Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7B3C53209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 01:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DYj3Gwonno5tuigqL6BvnWApaq+2uBwSe5vHZ9bElX0=; b=cuPIdsDdsQm4X6
	tnvSAix9X87mKHlAO1eACd4UVKZH5iV0mWEPGdPacLVc04n7OnMxyTcqXkWTIJFxLRIAziB1oFcXD
	t3fo6cHA0UWDZLrLKPowjWeS8yg9VHdmK29stX2lzFKWz2I2yRx6zIBSEVzVl3ruvPcNysSCG9piy
	vN/OGxvRFPNUjhtUCUfjRyLcqwsA3kaSZeRWpJ5yz7JdR0SmuzKMSSEcBJzsPzuUbt/uU4+t3sk7q
	tQmqIPejaugaVftkl6fthPl2I1J7tN2X0NpzayMKwCOm4XYeiYkuLgrC8t21WeAFZgHvKVdzHvx0s
	x/DdstA/tBa/aKKQZHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaM-00000004CIb-3Zh0;
	Tue, 28 Jul 2026 01:26:22 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWaI-00000004CHo-3oQP;
	Tue, 28 Jul 2026 01:26:21 +0000
Received: from smtp202.mailbox.org (unknown [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h8Hq80jt3zMlGQ;
	Tue, 28 Jul 2026 03:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DYj3Gwonno5tuigqL6BvnWApaq+2uBwSe5vHZ9bElX0=;
	b=ckTmdxs9OkhWuPopV5aVBYLdi56OHydKkzRRtbTY8T4A3Ptc0tuBM2m9hxcis6VT3HqRBj
	lhW/s8J892kWxhIECWC5npbZTxko9UerUFAkWIgLWjT0u5AenX6OBaO44m+sxkoeaJgAh9
	Lt9YfrIYi5lifDN85sk+xK03/xyP9yHMIFEvqlB1rEVogpsHtroWwvBVXabEE00vD2EYRv
	7L4aD8PeOTBeAv3EVR0bmyTGE8Vd1jOH9PLybGEmOBM+YjAOvvf+/xVlyV0a+O4fdlNp+u
	BbwtUFXgtvrAXIbvmmNYk3tGT4sa0QwwjgzdQMh3DEOShsiy3ouT03g0eKQLoQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DYj3Gwonno5tuigqL6BvnWApaq+2uBwSe5vHZ9bElX0=;
	b=hErtWioxNzYcuQSR6cgc6HhLaPgVsgNE/fEjbEgRpLqlojUzXglToYGEZBvNc74x+5aFvB
	stnAQBGxcLHP5s8ICl817uqN+RatiCaXAaY0KQbo0kDJJEm7h0FYpwm5Dxkts7tEoK1994
	ycpKjNEdH40z2Aa048E8GKhxQkcidD5WFIugELy7BXuJT5o6Tb7HFvToF8GqUmxf5PZ7sh
	4L3Wdi/9c+jOYh17SfoZ976Qrrc/O4wjlGGtdDh4BmuH1MtZ33Ygx/wH/8PtJxZhbTzDn0
	VYPhfLnDrLh+Fzw8j+wqIJ8YYoUSyTLkeYepQJ1KQZub1czTVr5PBWJ8CUvbLg==
To: linux-pci@vger.kernel.org
Subject: [PATCH 0/2] PCI: dwc: Handle return value from endpoint .init/.preinit callbacks
Date: Tue, 28 Jul 2026 03:24:23 +0200
Message-ID: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 50191466ca9f8db85b8
X-MBO-RS-META: hmi6jyzzt1u6jydo7geudygbdrddrpon
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_182619_111612_E60F62D9 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

This is a trivial preparatory change which allows checking
the struct dw_pcie_ep_ops .init/.pre_init return values.

Currently only the Layerscape PCIe controller benefits from this as
its ls_pcie_ep_init() may fail in dw_pcie_ep_get_func_from_ep() call,
but the Renesas R-Car Gen5 will benefit from this next.

Since this affects many controller glues and has a huge CC list,
I am sending this separately from the R-Car Gen5 patches.

Marek Vasut (2):
  PCI: dwc: Handle return value from endpoint .init callback
  PCI: dwc: Handle return value from endpoint .pre_init callback

 drivers/pci/controller/dwc/pci-dra7xx.c         |  4 +++-
 drivers/pci/controller/dwc/pci-keystone.c       |  4 +++-
 drivers/pci/controller/dwc/pci-layerscape-ep.c  |  6 ++++--
 drivers/pci/controller/dwc/pcie-artpec6.c       |  4 +++-
 drivers/pci/controller/dwc/pcie-designware-ep.c | 14 ++++++++++----
 drivers/pci/controller/dwc/pcie-designware.h    |  4 ++--
 drivers/pci/controller/dwc/pcie-dw-rockchip.c   |  4 +++-
 drivers/pci/controller/dwc/pcie-keembay.c       |  4 +++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     |  6 ++++--
 9 files changed, 35 insertions(+), 15 deletions(-)

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

-- 
2.53.0


