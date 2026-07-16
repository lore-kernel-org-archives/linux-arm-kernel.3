Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F8C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mw4IKlTLDLTYJ/8UMvJLk4PX5CzB7qqlfRmpSquJq4M=; b=EY6R7IXsaqCjReLqcwvOTeMNum
	Q8aKFjPu36OahNe3sAvNGpDD9R+JEVuTlWwGzz213CmrSVJbKIV7418MJg5z2h4bP1WPtrOo0+zVF
	/32r8oyV4W/wHwdxGn5JKLlmr5rAVqvQTI9mk41a40WKZAK4145eAJWGlOivpdGe5DrEjz5xmpVtF
	aI87C5eo/sPdq2V123yC/l7BdJ7UIUo8uEAfnHOqwAbl/IWXklWQzoWfW2TvXrNIkj6bs+9gJrZax
	Q9BBhDwTbHtoQelvnpvenIDSDF9Ydz8wXHuqzld9uRl+Q2M0We7ZeH2V4cL2W7NUDO8ZIV0q6SV3R
	XbARnPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNmS-000000000mw-00l4;
	Thu, 16 Jul 2026 15:13:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNmN-000000000kn-2UFC;
	Thu, 16 Jul 2026 15:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784214816;
	bh=WCsEdz3e/tDXo5idZqflDrn9zYtlEy5a7rslTNiT7aQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QR/UOqfEaPJqDP1UJPvVWwBnnFFGKG+kkqtMpnj2El9OXIdqrdcT/wVAKtTaVL2pb
	 0ygekyKOqalX8HszyBp9AXNI+gI1M0xOaRK0bMUKK3TW7V1x43FZwcWLfRxHvXjMas
	 b7+UVWK3D8JV/RhNY5pzkceN3tS8mX8e7jEl9U6YBvMuNUedznJwMBHqDpnqUuEh1p
	 PtwK0bDf8O0BDT3tvFS9FalwsyYu5nzde6tBy2+9izb1FDIz1eQF7Uw0/sXNi5cEvo
	 OF3eS2pU4Xd4CCym8YSIgRoVF9cNVY3Ac9dUuBvuu2ZvkXp4soU+XxV6WQoshDGDzL
	 +N+Cb+0tpHN0Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1259B17E0E08;
	Thu, 16 Jul 2026 17:13:36 +0200 (CEST)
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
Subject: [PATCH 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Thu, 16 Jul 2026 17:13:31 +0200
Message-ID: <20260716151333.77254-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_081339_784732_2BA501CB 
X-CRM114-Status: UNSURE (   8.82  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  91 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 560 ++++++++++++++++++
 4 files changed, 661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.54.0


