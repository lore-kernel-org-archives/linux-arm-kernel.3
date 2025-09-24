Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ABDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cAHGF8NPACDOV/8Ynuw7kqNcAMPlFhs2QNdw+CC9zx4=; b=Q1KCGUkg2gii28Ajh1ABD11Ai3
	MFpTQKOkpfnDpZFBOFRf1TgwHuTQs4R1OsACZqt9Mfvoon6d5vjSQnSGFaxb7zprebSuPflwwMW5n
	3tbGOAcwG1ANzK5z+iAJ29kvBHLYAhDflBml25lVXlHnu8qGDEUmf89EhNfLpYwFyCDd/RLekPphO
	wL7VJNbCz6jybRM1D0z6qVXgkSL7mXahghZZj430zkcZTevpo6O9qjTu/feXh8oACYGb4hJUPorrO
	ElQbOeHzt4yNcsjpGpK1hpAMNoC+tiS5GvBmIGaQMtQkXwwblm9HK6IVCEL5rB5Y++Ab37StDRopN
	yJL3BSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsE-0000000GYbU-3kVf;
	Wed, 24 Sep 2025 10:37:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsB-0000000GYXU-2yGB;
	Wed, 24 Sep 2025 10:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758710237;
	bh=VRbbyb2TqGZ2vmUel9UTJU8dUoPtOcrO+Q97F0QNAUo=;
	h=From:To:Cc:Subject:Date:From;
	b=AFSWeblmyZTvXqZuH6q9hrkH5s0gfXBar4a01bue57y1fGC/DaGtkp/t/DXQ9oinq
	 unWnG4od1U54jaWI3EeirUBKNi+I4dUDE7u0niGG/l8I6CRA4A6mWKwSj3L9R5qap0
	 sD6RjFW+xn0yj0IiVFV4IcRpro3VIqSa2XHkXviZcQ66byosgCmREcICEqwSwoV2DB
	 EzaTUPnyY9yFhiZpLsq2FpKkU+kIXqwjrDpyVMAPZjQx0kMV5Yy4AiHYUu4DopJAEo
	 9b37lkEqfLiYRvF6AEcOicEISkQcZmgLpYSkTTHqvsxa8Rymty8bR0XVP+yEGD7naX
	 H4s655fSBrd8A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F0EA17E068C;
	Wed, 24 Sep 2025 12:37:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmitry.osipenko@collabora.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/3] drm/mediatek: Fixes: Stale pointer usage and device leak
Date: Wed, 24 Sep 2025 12:37:05 +0200
Message-ID: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_033720_060611_6210A510 
X-CRM114-Status: UNSURE (   8.63  )
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

A while ago I've found some issues in drm/mediatek and fixed those
but then forgot to send all of the fixes as I was progressing on more.

For whatever reason, I couldn't continue with more fixes and eventually
forgot to send what I had.
Recent series reminded me about those, which we're carrying in the
Collabora MediaTek integration kernel since .. forever, and are tested
on all of the MTK boards that we have in the lab, including MT8173,
MT8183, MT8192, MT8195, MT8188, MT8186 Chromebooks and Genio boards.

The mtk_dp fix was sent months ago, but got ignored - it's included
in this series again anyway.

AngeloGioacchino Del Regno (3):
  drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
  drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
  drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 20 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_dp.c        | 30 ++++++++++++++++++---
 3 files changed, 59 insertions(+), 25 deletions(-)

-- 
2.51.0


