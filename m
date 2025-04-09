Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC2C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBERTAzMF1XMaZHW215z2KUxBI7SZn/haMOaonYzOkc=; b=CiXR7ccs2V057H7CDrY2Z17hnH
	jO40j1h3cBnZxyaxsUVLXw+xwyzEZRji92Twe+HopYmPG6bEk7kRfxLIO0Q02P/fpOdkmYk8sQW+T
	IN0YlVshcSiX+t8fFJzztCB8e21FKoL01eHxGzv8i7L9j5uB6uYGAu63DfE5YGzW2amikKGMjMQ2r
	/htv+aa7djax8u6kthTq+q5KeZldfeEOh2vin8X8YGrIrL6M7sbr/GP7PHDs4D8YtWJ3WrWIJtxmr
	ZVL+jrUrTdph84xa3jAFdU5+ioAu04vohAD9kFv3mP1ghCUb964J+BXDju6NCXZlzqLaRI7X16+HY
	MUa9DeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VIW-00000007GJn-1qtR;
	Wed, 09 Apr 2025 13:16:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEx-00000007F0X-3cf7;
	Wed, 09 Apr 2025 13:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204392;
	bh=os6fwx/KmcGx48eeTShCfonZ2h/wBxh0gQYferMBJH4=;
	h=From:To:Cc:Subject:Date:From;
	b=pKLRkHXIRT0xA7HFsZp7jFX2hYyn8nVI/Rq44+AxaqOnEcaqH/LlPJVL9CLHXa2OP
	 +BAZsZ05lFd00wBuXehVrRL+Je/JKjglL8pvNafdrvjuvyBeSqlr742WhJPSam9NH9
	 cZrkbD8EXFDdPj48lOjWsCnRUuFcxkvsh/wV97F+U9eBISMrKLV9X/I2Lk2rWnVqgj
	 KxxNwcmVALF5DMPIsLyC9APpO3beWJNYlkbOz6o/hJ93Ps37PaXwZTwpy3xw/SFJTP
	 /Lal0LLdsCxoHgokw8z+jy1EBGLLFeqwDQfOOyvVvlvC81taR10sTnUiYFCjbTs91P
	 hCH0Cm03ZDcBg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0B8E17E07F2;
	Wed,  9 Apr 2025 15:13:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
Date: Wed,  9 Apr 2025 15:13:01 +0200
Message-ID: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061316_071132_CE7B5037 
X-CRM114-Status: UNSURE (   7.59  )
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

This series adds support to configure the MediaTek DPI IP to output
more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
and RGB 10 bits, and also performs some cleanups that improve the code
readability when those are added.

Even though some of those formats are also supported by MT8173, MT8183,
MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
are the only two that I was able to test.

This was tested on:
 - MT8195 Tomato Chromebook
 - MT8395 Radxa NIO-12L
 - MT8390 MediaTek Genio 700 EVK

AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
  drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
  drm/mediatek: mtk_dpi: Add support for additional output formats
  drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
  drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF

 drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 15 deletions(-)

-- 
2.49.0


