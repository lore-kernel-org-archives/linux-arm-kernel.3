Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2B5CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCs2UXJ4jd3dNAIeM69DufOO4FHbdzRsBJjIgc1DCNU=; b=uBrIglgHObsff/yTKg68vpuski
	PAMxZ14Lod05nrV1/ER+A4nV1Pn5WtxnVU7aByafKPT7XURjyf6ekD4+86QFog94rCozAv13Hx7mG
	ayaslCM/OAorRgdQIg52H/pUNJrwV5Tq47RyX5VCce6dPTR2UpguRxcoWiV+nC5swM1ussQJTnyY7
	JJekPHDgI52u6YAukECmVxLgnlRDzsLBff6436BSxJ3q5p8lmRx73EqKw4uMgGuu/gU/v23dgcCD8
	eZM0m+5y1iPylB5w7hEQb74y4fKiImEr/q5ne27p3Plt1IcnXDDznHsdEt/MtgGkoMCbw+G1GjIWr
	42KOTbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLj-0000000ARfu-2U4f;
	Thu, 13 Nov 2025 12:22:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLb-0000000ARZI-1XiJ;
	Thu, 13 Nov 2025 12:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036558;
	bh=gSetVXNwTu3ErxPtff5STPeDGtcsAkwzq3hIlW9FP2g=;
	h=From:To:Cc:Subject:Date:From;
	b=XwrrrDvMb7wF5kwZug7cwna6/PxLeDa1QDMIKCdVXoSLNvh5LbhSVD+vUj7JdiiIN
	 jhnJduU6liMaI23kxV8K4cThDEimm4wIQ+o6r+sSHwx/2cGcxWvjMD+ZZ7ckzj9J0C
	 DZ1wiFVOqLjBRjAFuEy1rI6sjeWTnPNwencmE4p7+eLh3/EgRCOHYdZ71EAchK98Dk
	 csZKS5L/PqgjpGq5+jO1tLeekwsPZ7I3JoppYbuaa3mTE1odVzOTj+i26QcUscRzq8
	 kg8dp6wVXtaXxYNpHwk7vBIweXhgVLyroOaZZajijIjQUJeWVPpy8pfs6Ffi2XevaV
	 CDqlQLS2Xa68g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E593217E0364;
	Thu, 13 Nov 2025 13:22:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/8] MediaTek UART DMA: Fixes, improvements and new SoCs
Date: Thu, 13 Nov 2025 13:22:21 +0100
Message-ID: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042243_583117_4C843FC0 
X-CRM114-Status: UNSURE (   9.92  )
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

This series performs fixes the MediaTek UART DMA driver to be able
to correctly program AP_DMA controllers that support extended
addressing, performs some cleanups to improve code readability
and adds support for *all* of the SoCs generations that are upstream.

This includes MT6795, MT7988, MT8173, MT8183, MT8186, MT8188, MT8195,
other than all of their Genio variants (where applicable), all of
their Smartphone variants (where applicable), and also some newer
generation SoCs that are in the process of being upstreamed, like
MT8196 and MT8189.

Devicetrees are also already done, but not included here, and will be
sent in a different series (probably after this one gets upstreamed,
as I have to decide what to do with MT8196 - integrate it in the first
devicetree submission/commit or add it later - depends on whether this
one gets upstreamed first or not).

AngeloGioacchino Del Regno (8):
  dt-bindings: dma: mediatek,uart-dma: Allow MT6795 single compatible
  dt-bindings: dma: mediatek,uart-dma: Deprecate mediatek,dma-33bits
  dt-bindings: dma: mediatek,uart-dma: Support all SoC generations
  dmaengine: mediatek: uart-apdma: Get addressing bits from match data
  dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
  dmaengine: mediatek: mtk-uart-apdma: Rename support_33bits to
    support_ext_addr
  dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 6300
  dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 9200

 .../bindings/dma/mediatek,uart-dma.yaml       | 20 +++++++++++
 drivers/dma/mediatek/mtk-uart-apdma.c         | 35 ++++++++++---------
 2 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.51.1


