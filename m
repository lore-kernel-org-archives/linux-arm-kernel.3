Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADEFC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhS5InhyNvEYpLy7RMHRFMnBqOjSv/US6a8s2oGGkoY=; b=YIKxg+Ro2DCtcpDPtAjea2vYNg
	e6kcZieGlbRAceoGWhLJ9S+WQV4IkVd/00to847Q3fPLy0p0iJ3pnN8At7XrZrYsySdKoCT7rifmA
	h90OYxgPtWFL+ih6fWBOcUgVdxGqP4SeTcPtrX3F7UmSpNpU8ydggsiu39ssdeoIx7cP0Zgr8Vmm8
	6fywY/ILtUtUmejgJyluRFTcgXkiHSi7nFZ1vGZua1hvh+j8m4zlA27RPF8/lKBkHlpM2lAWQcEEi
	jxlemNu+KefdpKNbfZQLlWKLDSXCW0K1sR9F/pzRg1FXARQ8eO0pZttSSH56cdgnHGRuzf4jbte7v
	YewkLxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vsW-0000000G2vn-3y6S;
	Fri, 11 Sep 2026 07:40:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vsT-0000000G2uG-2ubT;
	Fri, 11 Sep 2026 07:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112450;
	bh=gE/jHP8gTYltHtoq9vjJf5UmZ3FyBmWyEI0DU0Oipdg=;
	h=From:To:Cc:Subject:Date:From;
	b=IPvibgt5syh3io60FRSLggF3IfOY+RTY1kaEhmIJ2kFJYD1XTxnRzUw70IKMIOIvE
	 HN6GXoRnzB+M5ksMQgeg0bPaC+yRyIFWvm8JjCJCRgQF4xFrAZpcagbSYp5s2RxbwW
	 6J9WP6WArQyX7EWu/YGDijCy5eR1wa6DigP+4+pH3nnzwz330gQesNCmDc+2LEqM7c
	 VN2ksnKCRZuIQfwdw0K0kzHmDSEyA90NYZzj7LULnSUnSbBgICRfZVfEOj2crc3uRz
	 FoPzPJO/VCnIyRGvZimLW2FjpEi27gX9uFDZ+GvJvEr5AR6KUIgQnlWxTnyEQMWlxS
	 Q0cPu1PWP7XIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27C0317E080A;
	Fri, 11 Sep 2026 09:40:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: vkoul@kernel.org
Cc: chunfeng.yun@mediatek.com,
	p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org,
	neil.armstrong@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	justin.yeh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] MediaTek MT8195 HDMI PHY Fixes
Date: Fri, 11 Sep 2026 09:40:13 +0200
Message-ID: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_004053_882544_6161A1AA 
X-CRM114-Status: UNSURE (   8.90  )
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

Changes in v2:
 - Fixed commit description of patch [2/2] (Mani)

This series adds two fixes for the MT8195-class HDMI PHY, found in
MT8195, MT8188 and Genio variants.

This is fixing PLL calculation, and TMDS clock dividers, to achieve
all of the modes requiring data rates higher than 3.4Gbps, with the
successfully tested target being 3840x2160@60Hz.

This was tested on MT8395 MediaTek Genio 1200, Radxa NIO-12L and on
MT8390 MediaTek Genio 700, with 3 different HDMI displays (two TVs
and a 4k LG workstation display).

AngeloGioacchino Del Regno (2):
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.55.0


