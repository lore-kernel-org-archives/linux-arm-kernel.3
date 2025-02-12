Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E2DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A/ER2JPZYlK8vZ9W719ySPxqYHhDePzYDbKD4D6Lvk0=; b=JLpeWIZWYbY1A0s4VYNFJizmjY
	gFbgnqfxy/k1VzH0GEjlp9mE9EWI9MGJp82aIGDgPFugbxM5UlBjV7YsO2xwZldfmIs7FwRdKSGUv
	Ku7S8UsavzOTTdIemzqAm0V7SRar4pWPJdFg8fDspE22OOwRq3/7DIj/1peu6bxGoC2ivL7bIEeqh
	xkRVHHb8DgW0oHfpmsSuDzYxWsJAa370vDk5DEy8pwVtCDJg8Xu0yoYBSvYY+CWaczSMk6bBIuj1S
	egQgviLXffJ95GRGyrwtSw1Jpj5uastSvxQvWfRNnPvi99xKuw3MopXZ9IFLWCH0cjifSJFN+vRJq
	WKVlyNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9nP-00000006x9k-2T4f;
	Wed, 12 Feb 2025 10:16:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9XY-00000006tfQ-0IXk;
	Wed, 12 Feb 2025 10:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354418;
	bh=aSxtnqMqCweFDRTEVAHslns1++X/x1STVDRpwl2IRds=;
	h=From:To:Cc:Subject:Date:From;
	b=SHFSoU8SH2wWtWhxlxt5uJpTSl37cEDO3r0gvX3/OvZ/zXPoXp08cwMQQGVDgSqvO
	 dQaKFU/lRMhCMvLSIL7nEtptEJqgD7yg1c/TAewXQl3TMN+4X2Xjm6xPIIOfs5bIOh
	 STlCxT4xUeVUp+fWiXMJPuclRV58Pbfl3oDz+h5Hkwx5vjHJRdf3sw9y78m4dsGrb4
	 cU/dnnde0UzE3TS6jNR9LCxXUbAl1JgG2uUatYopAW/H0BqoeUu3XcvnH/q26ZI/t9
	 qh9D3Cjsb8wGsozW3uuTG+idJ5wYRulAg9IQHromyWkyQs/PKD2UUoszwzQCBpd1iT
	 rX6x2Vx3pGoNw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 839AB17E0C9D;
	Wed, 12 Feb 2025 11:00:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	fparent@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pablo.sun@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v1 0/8] MediaTek mmsys/mutex fixes and improvements
Date: Wed, 12 Feb 2025 11:00:04 +0100
Message-ID: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020020_263863_7E9AD039 
X-CRM114-Status: GOOD (  11.43  )
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

This series adds the missing DPI1 SOF/EOF to the MT8188 mutex tables,
required to support output through DPI1->HDMI Transmitter, and also
adds a few fixes and improvements to the mtk-mmsys driver and tables
for all SoCs.
For MT8188, in MMSYS, this adds the DSC path for the display
controller, and fixes the current DPI1 one to actually do something
meaningful... and speaking of mmsys....

In particular, since I've found multiple basic mistakes in the mmsys
tables for more than one SoC, I've identified a strong need to do
something to prevent that from happening again in the future.

That was done by adding a macro that performs a compile time check
to make sure that the in/out selection bits do actually fit in the
register mask, and converting all of the current mmsys drivers to
use it (because pre-existing code is usually taken as reference to
write new one... hopefully!!!!!).

Of course, the fixes that I performed to the MT8167/MT8365 are
relative to issues found while converting their mmsys tables to
the new macro... :-)

AngeloGioacchino Del Regno (8):
  soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
  soc: mediatek: mtk-mmsys: Fix MT8188 VDO1 DPI1 output selection
  soc: mediatek: mtk-mmsys: Add compile time check for mmsys routes
  soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro
  soc: mediatek: mt8167-mmsys: Fix missing regval in all entries
  soc: mediatek: mt8365-mmsys: Fix routing table masks and values
  soc: mediatek: mmsys: Migrate all tables to MMSYS_ROUTE() macro
  soc: mediatek: mt8188-mmsys: Add support for DSC on VDO0

 drivers/soc/mediatek/mt8167-mmsys.h |  31 +-
 drivers/soc/mediatek/mt8173-mmsys.h |  99 ++---
 drivers/soc/mediatek/mt8183-mmsys.h |  50 +--
 drivers/soc/mediatek/mt8186-mmsys.h |  88 ++--
 drivers/soc/mediatek/mt8188-mmsys.h | 266 +++++-------
 drivers/soc/mediatek/mt8192-mmsys.h |  71 ++--
 drivers/soc/mediatek/mt8195-mmsys.h | 632 ++++++++++++----------------
 drivers/soc/mediatek/mt8365-mmsys.h |  84 ++--
 drivers/soc/mediatek/mtk-mmsys.h    |  14 +
 drivers/soc/mediatek/mtk-mutex.c    |   6 +
 10 files changed, 581 insertions(+), 760 deletions(-)

-- 
2.48.1


