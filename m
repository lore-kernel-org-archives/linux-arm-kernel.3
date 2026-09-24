Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5219C98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dk9SdPgHADQz2DgzCbod4bQfzPUpVapkXxif35lT8y4=; b=TkP9TjBim4yYBX
	JpGhYnrRYnZed38TdAxpQDhei5tVQlApZjwzwLXQGr4NNCyyL+ilwT5NLlB5lEuhF0i43go7nSFmx
	olU5xH7dLl3/vIUZOLje2H36vzp/0gWqey0M34h9oAU7lJ68JvISV5VPrlSl9hI+Vnd7P6wBiKP5D
	JTdsHQzvdQxsVHSECcZgz18EXcnx404DZ/9SKznwyBNePudqBpAdIc0pA2MfIS796pgq//b5d2EJt
	Az2sgX9TKXMCA8WkjJgyaprimcqcu3wGh6rG2uXlsbD5pUFtcO7drszR71cFJz1jeQP1bpgWVtO1d
	20k2cNc8os7WyDjEjDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doZ-0000000AGz2-0oiU;
	Thu, 24 Sep 2026 07:24:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doW-0000000AGxa-23Qd;
	Thu, 24 Sep 2026 07:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790234653;
	bh=1y3x23f34J6dSnPAWBv03m8McFVIedvOuJSGLlwRbQE=;
	h=From:Subject:Date:To:Cc:From;
	b=BpNLuSlu/iJ5dfrdnB1uOkNGfRZDvhvd00IPSn54rSz/MNJo2+kWnx7XywiAiCyuX
	 poEEoou0GyVE0SAkxsWxSS+uW0G8zugq6ZmBvqIAWsSXFxJQvz6CtGrQvdv1md3eTv
	 VJJ8Uu5XRacd1LIrhhJqv8LiRcrVmMOC4xWJM1jZSHbTM79QkFQYxI1c4qJKSOTKcd
	 HVEsbggL9m7p74SE9HGNDAgaZgshGh9brrTwGCV0ZM5gpP6iKWz6JVs9a3BmCpW9HC
	 hFp8903hZmGgOv36sV1DtmkjkBXATb/qZXVvToAYk4TRsZdx+yq6Lq77KuFVHjhbBs
	 s2Q2bvs1ZkRoQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CA3217E0074;
	Thu, 24 Sep 2026 09:24:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH net-next v2 0/7] net/stmmac: Add Mediatek MT8189 support
Date: Thu, 24 Sep 2026 09:23:23 +0200
Message-Id: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOTW7CMBCFrxLNuoNiOyEOK+6BWEzsSbGK49Y2A
 RTl7liBbZdP7+9bIHF0nOBQLRB5dsmFqQj5VYG50PTN6GzRIGu5r7taob17MujZOsr8gz5roXv
 sLY2set30rYDS/Y08use2e4KJM078yHB+O5H/buUof+yBEqMJ3rt8qFqpLe+1koMUW/7iUg7xu
 QHOYit8WLp/WGaBNYpuVE3LRIbU0YTrlYYQaVdu4Lyu6wsistfe+AAAAA==
X-Change-ID: 20260703-dwmac-mediatek-mt8189-9dafe3984951
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790234653; l=3138;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1y3x23f34J6dSnPAWBv03m8McFVIedvOuJSGLlwRbQE=;
 b=dc/cU9HL5r6uNwpt2Qd66PMiC15uiDrPEMbq1iDLDwS8j9vlOUPlMa+CSYxibMAx5kX0VBTwt
 ltUELoSJ/qhCfOdGEzwstse+2zQkZc3X6TYNsThAes8GRMOmmKoVRGs
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_002416_691788_F3060F42 
X-CRM114-Status: GOOD (  11.91  )
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

This series adds the Ethernet support for Mediatek MT8189 SoC and its
variants (MT8371, MT8391). These SoC integrate a Gigabit Ethernet MAC
with RGMII/RMII/MII interface, with a similar design than previous SoCs
such MT8188 or MT8195.

This series is based on net-next tree (sha1: 528de6832b21).
It has been tested on Mediatek Genio 520-EVK (MT8371) and
720-EVK(MT8391) boards, which both integrate an Airoha AN8801R Ethernet
PHY, with hardware enablement series ([1]) and additional devicetrees
patches for enabling their Ethernet interface.
It has been also tested on Mediatek Genio 510-EVK (MT8370, variant of
MT8188) and 1200-EVK (MT8395, variant of MT8195).

[1]: https://lore.kernel.org/linux-mediatek/20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com/

---
Changes in v2:
- Rebased on net-next (sha1: 528de6832b21)
- Dropped "net: stmmac: mediatek: rename MT2712 and MT8195 variant
  methods" and "net: stmmac: mediatek: add support for TX deallocation
   adjustment feature" patches, present in v1 (M. Chevallier)
- Patch 1:
  - Removed rmii_internal clock from required clock list (A. Lunn)
  - Added MT8189 stage delay divider values in "mediatek,rx-delay-ps" and
    "mediatek,rx-delay-ps" property description (Sashiko)
  - Updated commit description
- Added patch 2 to simplify TX/RX delay handling in mt8195_set_delay
- Added patch 3 to add RX/TX delay stage divider in platform data
- Patch 4:
  - Replace MT8195_PERI_ETH_CTRL_BASE by MT8195_PERI_ETH_CTRL_OFFSET to
    harmonize the variable and definition naming (A. Lunn)
  - Added Reviewed-By tag
- Added patch 5 to add the TX Clock phase shift use in
  RGMII and in 1G speed
- Patch 6:
  - Reworded flag and define names to explicit a bit more what the
    feature does
  - Updated commit description
- Patch 7:
  - Added the new definitions and needed fields in platform data
  - Updated commit description to add the info about MT8189 RX/TX delay
    stage divider and maximum values, and remove reference about 
    stage fine feature 
- Link to v1: https://lore.kernel.org/r/20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com

---
Louis-Alexis Eyraud (7):
      dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC
      net: stmmac: mediatek: simplify TX/RX delay handling in mt8195_set_delay
      net: stmmac: mediatek: add RX/TX delay stage divider in platform data
      net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data
      net: stmmac: mediatek: use TX clock phase shift in RGMII mode with 1Gbps speed
      net: stmmac: mediatek: add support for TX clock output enable feature
      net: stmmac: mediatek: add support for MT8189 SoC

 .../devicetree/bindings/net/mediatek-dwmac.yaml    |  87 ++++++---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 211 ++++++++++++++++-----
 2 files changed, 224 insertions(+), 74 deletions(-)
---
base-commit: 528de6832b2194ae0b1d62b0925e0ac6cad1087c
change-id: 20260703-dwmac-mediatek-mt8189-9dafe3984951

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


