Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB98C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wOFWLUHNqn4wZjqW5pJgN+3/+yB5LNJEVAYb0g7jyeA=; b=Sr78Rh37dYwX39
	zg82hFZ4hu30d9FnDPlYZREk1ux5rwFgJtgSw+nFVvt2Tg9e+m8GJJ27Mza/OMGItaDcA8BIPCTZM
	TaqLDZBPiQ37MFMifYWiW/mWV+WvQxY99i10Ehv9SWXPybQRnBhT5hS62vptqJUKYRfisO3+leFcH
	Q8Vvjaj9DTr4aH7qHpmQbN+4qvPzRyeDQJdOpLTWqbL6YLEjjMyDhQZNh1FJFuUFF63ZFZgubQrSy
	Bhgu6C+YlAcwoQ2f+x2m841Wa7qiYmCZHBAvC+pAqmJcjya6efnkoGVWz1c3I7G3pX0kUZdmF9rlV
	T386QqSdrbXjP+RF3T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13m-0000000ERyL-27Qw;
	Tue, 07 Jul 2026 08:21:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13j-0000000ERv8-1eQ3;
	Tue, 07 Jul 2026 08:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783412494;
	bh=1dCg8pFc9XqfKgUTzqT+2O3mSfD/gWA0nsp+ocjIwUU=;
	h=From:Subject:Date:To:Cc:From;
	b=Us4Uf9yTiKcVl9JfEZkqFaSNyWi63G1uipwB5nA3fNX+oYiTM9JC5IowXgbkvmXAB
	 NG1bLgiEBUUQi/CZon5JujEsS+dwsR32GvH4G6KmXc/e9WwvJC6F4pkqfIuLdn1lKY
	 Asc5WU/uPTjddUkq+vTy/1QEhbnm4vpbskwB7cwR6hX7pnfsRLZGOB0jZb68NWsRlg
	 IxCT02c8T+WgadqZ9wwSghvWk7Ua/PcV5W6y5St5Xf/Uqdl7uG0padpVG+S/E8zY8j
	 wGgGROyP3+SxnzbqRBYhFS0DS0SPrRhPJPyzTADUNeKEBi6Wpu12Lq+4RIeDdtTp9Q
	 xad7J7XLd83Pw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A42917E05E8;
	Tue, 07 Jul 2026 10:21:33 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH net-next 0/6] net/stmmac: Add Mediatek MT8189 support
Date: Tue, 07 Jul 2026 10:21:18 +0200
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr9LM2klKiy30KqYLhEEnBqqA2qTp3
 SXq8uXlv79BpsSUYWo2SPTizEusIA4N2KuJF0J2laFru6Ed2x7dOxiLgRybQjcMRQmlUTvjqdd
 K6qOAur0n8rx+uyeIVDDSWmD+mUSPZz0qf302mdAuIXCZGjlK6/2gBiU6mPf9A80RGkahAAAA
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
 kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=1609;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1dCg8pFc9XqfKgUTzqT+2O3mSfD/gWA0nsp+ocjIwUU=;
 b=e+32C+4XJDUfsZQY8e2rwjSW7HdSP714dRnVts/EQlC0dhvkhtffDhKEGVIPwRCzuPu8Ve+DC
 lzuzHJT50qZAQRqt8QF2yvd4f/ZQ/ftgWzF4lmhl2XqGfqKuIhk/fiX
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012139_591722_AE9FD1D1 
X-CRM114-Status: UNSURE (   8.19  )
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

This series adds the Ethernet support for Mediatek MT8189 SoC and its
variants (MT8371, MT8391). These SoC integrate a Gigabit Ethernet MAC
with RGMII/RMII/MII interface, with a similar design than previous SoCs
such MT8188 or MT8195.

This series is based on net-next tree (sha1: 474cff686812).
It has been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK
(MT8391) boards, integrating an Airoha AN8801R Ethernet PHY, with
hardware enablement series ([1]) and additional devicetrees patches
for enabling the Ethernet interface.

[1]: https://lore.kernel.org/linux-mediatek/20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (6):
      dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC
      net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data
      net: stmmac: mediatek: rename MT2712 and MT8195 variant methods
      net: stmmac: mediatek: add support for TX clock output enable feature
      net: stmmac: mediatek: add support for TX deallocation adjustment feature
      net: stmmac: mediatek: add support for MT8189 SoC

 .../devicetree/bindings/net/mediatek-dwmac.yaml    |  77 ++++++++++-----
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 109 +++++++++++++++------
 2 files changed, 135 insertions(+), 51 deletions(-)
---
base-commit: 474cff6868129755cf889edf40d7f491729fc588
change-id: 20260703-dwmac-mediatek-mt8189-9dafe3984951

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


