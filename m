Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4859C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erbWLFzguWC5h/HOWJNB8D81QDIsuPVj0c0A6+NSYaI=; b=GOk9uNZ1gGrI6qR1vFTSsoTA3P
	60Wi8xGuO7j94yVC8j23+W46MbZ6yiRW8Gepzegaw5xzpDyKIK84sz5yT+9k8nwDIbbkdx59bHf03
	3gDPzhW/GQRHsyAobz1WJzujT0vrG69oaT3OvuIUbm/QSgb9qMdlogUkfQA6Ab9yscMNa7DXr/wVs
	blxO9yO/9EsTF1zGdZ6ajrEAoN6tazmiP2vFuCZ/ou3ozsHiVL6v/Z5fFGSTRgdHV8rs63jWUfdV5
	IvSxI3UyoYJ5xpOwMIm3R9x0KsNQvezbFBv6FV4J8INcpEg/f1dmEFOOAhMy8HKrMQyQtofths8nz
	2efxIdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloRq-00000006sjp-3rgp;
	Mon, 20 Jul 2026 13:54:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloRn-00000006siB-3Zbd;
	Mon, 20 Jul 2026 13:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784555656;
	bh=ib28vJDYiKmHcDyK/UpURzcfp8BRW36RPjln12pow78=;
	h=From:To:Cc:Subject:Date:From;
	b=J/Em3Klb1iVFK4yuQPbJePEhaSge583cobLXXAxfGmeoq4x26911sIgTnVLecHUy8
	 6y2Iu1cMOsp3qyanETBz3oyBw0+DH9YUpmCycAidxJnyxzJ+DKAM/XW0ozaWnf+2mI
	 ZxgFJfpjIYZqPCpwNkHis8/I/kJylvE0ljCbg/ZmeC8JNFIsbFAWdUpi7bev2YwoCy
	 BU3yCpBqJsHelJtEFGaGhf/GEGKIo0ggnGvRsoBxHlOOh0sphuMIAvRYsClig6P2W4
	 nR3Tdj87qLYPfyyhuNkdTNRh4CG7oQ4w1fli9KLE0Fzx8L2noxbOpAW4yIaI1bwNam
	 cvOn2wEJzhCaQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A82417E0910;
	Mon, 20 Jul 2026 15:54:15 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Mon, 20 Jul 2026 15:53:42 +0200
Message-ID: <20260720135344.84183-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_065420_041288_72CB7F12 
X-CRM114-Status: GOOD (  11.32  )
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

Changes in v2:
 - Added items/description to reg in binding
 - Added missing pm_runtime.h inclusion
 - Moved pm_runtime_enable call to before registering PHY
 - Fixed pmos/nmos variable size for 5 bits calibration values
 - Fixed calibration for single-lane PCIe, as in, the ln1 rswn
   calibration nvmem value is ignored in code if it's single
   lane and will not return an error; this is due to the fact
   that, effectively, single-lane may have a zero calibration
   in tx-ln1-rswn which is fine, as that'd be anyway unused
 - Changed calibration data errors to dev_err_probe and changed
   the "no calibration for ..." message to dev_info instead

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  93 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 561 ++++++++++++++++++
 4 files changed, 664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0


