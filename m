Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8212EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L8V7UFfcXq8HYSbpBkWg3inWbmmakUYkNKjFwAOhSrY=; b=gH6AxGyVeCUfUSr78g+UYyYOIc
	mQ8sRTn1w41m3u8Lg1rj1aq9d83DhXMAbX5gehxKWDFVQJziR2tFKVcB7mF0HHfQ6hwmayL7fdG+Z
	8eGjf09jVbWEYo9yh+9QGUwvANkRHeDNXCSuNdgNABt1Zy0HetnJlANk7NV0mZVwz9I03uXPI0VjK
	djlldlEu/rvtYJqifcU13p03a00CfBjkVTL2PlQ87LQxx73oUmg+BUiESVX2Iy/T4Q5WOZ08zw5RC
	i22j2vE2DAu7Ve5zTR5+Peou+FIydg7q9aUZanlE8h4f83XB0uGB2oGqQsVDRz9jbnVNQ+WPssYYG
	UPQhkS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNroy-0000000GNfi-1qxe;
	Wed, 18 Dec 2024 11:02:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrh7-0000000GLGd-2kv4;
	Wed, 18 Dec 2024 10:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519260;
	bh=9WRshbK6Lw5Z+qnOnvzcmUvJhTEZXWxHgVCSXR4loeI=;
	h=From:To:Cc:Subject:Date:From;
	b=Uj3XC4yU/HUaZ0jqKXbnmLOVlW0KmxRDlfwxgL0Fp8gs0HjxayTvGISg/ftoRTLyj
	 UB2Q9aY3xHGadZBKYc4yyFmbt/7F2Ypa8y+aDOoY6nwkhPGi95tR8Apt+TUxpd1Fef
	 YKMWC6BAFbqLiyxFBdIJk7+svZpERUUB+XWWxeHr+hswiOAJgPaRryZlBqyUZOHFCU
	 dEklZEGR+Gh+MESNHp0mCU0VuioHWJujz7gChrm/0vLSSqG8E8f4KquHXDZssNU0Jo
	 LfE6way5P05TU0MeWuFwiglYWJ1TZaL4h9W+p6dn3oHUciAnQdeODmKjiixSSxxi+z
	 XE5aGhEydoOVQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5738717E3612;
	Wed, 18 Dec 2024 11:54:19 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 0/2] clk: mediatek: Add missing clock for MT8188 HDMITX
Date: Wed, 18 Dec 2024 11:54:13 +0100
Message-ID: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025421_840261_0C6D9E95 
X-CRM114-Status: UNSURE (   6.13  )
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

This adds a missing clock for MT8188's HDMI TX block.

AngeloGioacchino Del Regno (2):
  dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
  clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx

 drivers/clk/mediatek/clk-mt8188-vdo1.c          | 11 +++++++++++
 include/dt-bindings/clock/mediatek,mt8188-clk.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.46.1


