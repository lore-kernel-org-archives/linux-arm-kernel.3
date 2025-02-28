Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A867C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BBIs8NkJoffl42SoJLG5pPaO19rihcoiyN30/+HNeFU=; b=lu9N+oQykCtXZXt1JiQ47M5QYR
	/75iQKy6SAXkh1/yvHI6id1fOENrW6003/xpZztbvMZsvy0VZGzUVt0QynarYm+Q0J0d0q2bBrvV1
	C5N+Eq6D9Ec9TriTTSX7z983usxXYyf2qzANA4WBOJPNw4WtM2Tdat5x/owvT/0sdMd1TALAlBedi
	tTPArLYiNcYInJv2Y9jmVj6p1nxYU5Mj8tvI/pl3mY7JG31j4QTe4/vgGiy453fEQYE6MKWTriVWz
	r+LRkqkrBsuQ8c0/ff2f+6GnM2wx7SS//kFkMVRAcLlWXZ/J1lDrFg/L/UsfnhaFbCa4BZ8Nb3uhC
	T5W7Ye9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu69-00000009tWd-3xmP;
	Fri, 28 Feb 2025 06:43:49 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu34-00000009sva-0iT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1740724836;
 bh=BBIs8NkJoffl42SoJLG5pPaO19rihcoiyN30/+HNeFU=;
 b=fYGG8F93OpKrL1X/BGsWAlOwRyM1N63qnSqHK/vvoxgHXwmPz/18THr7fU4t9fx4c6jtFgxrg
 YCsjp/9SuSVB6IMPrj1V+22DkDm2MWXARYiDi+3nklCKAmXhiTxDL8FR0sJ1nuAOhzyA7tdJH3m
 SLZ8L44B1tBhwbzoCfDEreY4z9AykZ6WCu1/mJTJVa3/SR1zrqrfB5YhplUfv0VPbdtPdBapIPu
 ZY9mW2aDUYOY6cilRu7aK88pUSOmEI9J0/Jj4kpnNZBOcALCgcP4FIA/fI0cb5Mtx1Ehe5vL6rd
 C7CAFo/xER0qEiYq/PhQproNFspD+0+LOgtkYteN1xMg==
X-Forward-Email-ID: 67c15a5ebcf1d1bd23db0191
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/7] rockchip: Add support for leds and user button on Radxa E20C
Date: Fri, 28 Feb 2025 06:40:06 +0000
Message-ID: <20250228064024.3200000-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224038_601592_8114F7E7 
X-CRM114-Status: GOOD (  11.46  )
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

The Radxa E20C has three gpio leds and one gpio button.

This series adds dt-binding, driver support, DT node in SoC .dtsi and
gpio-keys and gpio-leds nodes in board DT to support the leds and user
button.

This series builds on top of the "rockchip: Add support for maskrom
button on Radxa E20C" series [1].

Board schematics for Radxa E20C can be found at [2].

[1] https://lore.kernel.org/r/20250227184058.2964204-1-jonas@kwiboo.se
[2] https://dl.radxa.com/e/e20c/v1.10/radxa_e20c_v1100_schematic.pdf

Jonas Karlman (6):
  dt-bindings: soc: rockchip: Add RK3528 ioc-grf syscon
  dt-bindings: pinctrl: Add pinctrl support for RK3528
  arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
  arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
  arm64: dts: rockchip: Add user button to Radxa E20C
  arm64: dts: rockchip: Add gpio-leds node to Radxa E20C

Steven Liu (1):
  pinctrl: rockchip: Add support for RK3528

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    1 +
 .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |   68 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
 drivers/pinctrl/pinctrl-rockchip.c            |  160 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    1 +
 7 files changed, 1709 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi

-- 
2.48.1


