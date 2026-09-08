Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BB7C79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWN1S1aR/SL8gM+eidiWKqzRizJ1TYpZGVJia38C4KQ=; b=d8SMM0dEv+pJ10
	i3+KHtm9GLVxg17TeN96Z806Og2iFN46/xnKcq2v3oChzWflwWaN6podpHqitikCTQhjdybcX08FY
	yDv79jPPiiA1S3Ch1vkhFvK15DNjJ/Rxa9BsF0NaZmQXJO2rRToN0tlUzDwwkSeJSoI1OMHwR9DfE
	zvArudAafb5sz9PTbCgoepv2JvHPOSKZpPXpwyq5lzi/1olwNeeOhVlZEW/1RyBYj5m41Z+BgImpO
	fG33pikZfcCmm21d7nKKFfCV4zSVs6cq2lWs85SxcXM7V7I/MEHtyLl5xB3l1S5kBNvWbNbg9z+j2
	kX27JeLgU7ym23cUT8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGH-00000009Bce-22Be;
	Tue, 08 Sep 2026 13:53:21 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGA-00000009BZw-0hvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SWN1S1aR/SL8gM+eidiWKqzRizJ1TYpZGVJia38C4KQ=;
	b=ZekgHt6qZvc3TbotMpRzzcDvHOV7WjRhllv75UJy7QBiUUTcVY7zbaCa+98sAxSJfWB0ub
	I5v+nZ298lwRQHuVzYHR+dbG52A/hSmh9OrFobJifezgem/a70At5ibmZg++2LPFX7YqRC
	jtem+JbDREb0+WH6WuQllXPoGViSuWdIEUn9qG+4bTFMZuCN0yAAL7sjTEwAgqk/AYi4sh
	dnwFTrGNpLOQVnBIHEKZz+TqJZuOo4Agbk1hx5Pdel6guHQYSFmjD37vSk2emzO9GK+g3A
	fUfBByixo/oA25QAZ8vRjOzLJ3UDVGiWRFxHP7o1E1oY/ez1IlbIGfhaS3IlJw==
Subject: [PATCH 0/9] Misc Kontron i.MX DT improvements
Date: Tue, 08 Sep 2026 15:51:47 +0200
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrDIBBFrxJm3QFrQGuvUrpI4iSdgkYcI4GQu
 9e2q8+Dz3sHCGUmgXt3QKbKwmtscL10ML2GuBCybwxaaaOcuuGWpGQaAscFq0WNHHb0pU3Ka6V
 AsQi2nzZobD9r76wj00MTpkwz77/Y4/ln2cY3TeVbgPP8AHoUlUSOAAAA
X-Change-ID: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=1yrsw7EfCCl5e0HroSc21jsyrFqJNPeX7I/G6E+OrzI=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsO7vu4oNW63DXy/67W93M58n64aWubWMBuuV2+nHj
 2zL3TW5o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJHoxgZblu9TatQu8Ao8Tkz
 MLanL2V3/pQVyq+L3m1ke7yH/+6MPYwM+52m2zu/EDtzdN36gqP7Q6dbLZhRv6tzR6Lwr6fqzw5
 LcAIA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_065314_665301_5A9F4CE9 
X-CRM114-Status: UNSURE (   6.01  )
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

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs

Frieder Schrempf (2):
      arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
      arm64: dts: imx8mm-kontron: Describe the ethernet PHY LEDs

Oualid Derouiche (6):
      ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration
      arm64: dts: imx93-kontron: Make USB-C connector "device-only"
      arm64: dts: imx8mm-kontron: Add GPIO labels and comments
      arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
      arm64: dts: imx8mp-kontron: Fix LVDS clock frequency for DL device

 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  38 +++++---
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 107 ++++++++++++++++-----
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |  11 +++
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |   6 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  32 +-----
 5 files changed, 117 insertions(+), 77 deletions(-)
---
base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
change-id: 20260908-upstreaming-v7-2-imx-dt-improvements-08-26-673f2d979e63

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


