Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A09E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U2SOJQLcDZvguGBZ+sVf/NpgZjc112j07HdKfFHqwPY=; b=FCGQijbm/WJfvyHGFeUzB3/nUS
	15MaWZ/3/NctH54c55IK1EAmAc4zPXZuwUEK5RV8s7dHv01x9JBlxreZveHn/gk3dwsWQoxU6Ncat
	NTWm3mcX5+mRVsH8ySIDrDVyxZ/nxA/LcCRktblAh3xnBUxTpCBHhCAyWwsBV9lsTx4u6QqDD9Rmz
	qwpUPcmG1lWh27i8XS/cKLZ41ygMs1A+M5YnsIZQz4ruAQsU7mMEXXplBd2xQlzNfywybgovq8/19
	BoeU/SGT2ztGDotrVuGYQPsOy5EX13PFT8M6qKBdpICfQvnnXO73M1/ddBhHANBWias4bupM2KSYC
	fi1In6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhQ-0000000GLMi-2wh6;
	Wed, 18 Dec 2024 10:54:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrgK-0000000GL4C-36EZ;
	Wed, 18 Dec 2024 10:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519211;
	bh=EzGXzrdmDmG67qz3B2zS16R/SVMfvEfnxeN+QoREF1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=YeRR4CJbxmqjOkjfozvf80dO+A/rwi1qILbZQfVMY8wTFsgh2k7Hcrtot6Bzqi1Ue
	 8oB5QytCMIHNofLQjKExy1MXduovXTmjlBcyb2fZyjvg0mJwCTTM+IiZsVcaLlm2ql
	 07O/snuC3nJg5BcO8Xn/lq8aUEWJgDHOlNH/8KczLO6qoSzwxoKMslKa0U5kY/yrkV
	 lLBRUfnzzV4Z4Go032UD1BWh3XZF7C1dc1zCzhcl4e8gMIVtKXGrqhGeu9ogivJVav
	 +QrLyzcTLX9qf5xUavQPnXxZqsbIdeGOgmyGxEDyQqbdIspNMNQLiU/2bgbaZCOhtt
	 /5zdJdZYI/Zyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA2A317E3610;
	Wed, 18 Dec 2024 11:53:29 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Date: Wed, 18 Dec 2024 11:53:17 +0100
Message-ID: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025332_940775_3DF8182D 
X-CRM114-Status: UNSURE (   6.74  )
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

This series adds the necessary bindings and devicetree nodes to enable
the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
MT8188 SoC.

This was tested on a MediaTek Genio 700 EVK board.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
  dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
  arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes

 .../display/mediatek/mediatek,aal.yaml        |   4 +
 .../display/mediatek/mediatek,color.yaml      |   4 +
 .../display/mediatek/mediatek,merge.yaml      |   4 +
 .../display/mediatek/mediatek,padding.yaml    |  10 +-
 .../bindings/media/mediatek,mdp3-fg.yaml      |   8 +-
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   1 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   8 +-
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   8 +-
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   8 +-
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 313 ++++++++++++++++++
 12 files changed, 364 insertions(+), 13 deletions(-)

-- 
2.46.1


