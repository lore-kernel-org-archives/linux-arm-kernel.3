Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSV9zPyI4IkPrEBlHh8/lsdjGfzW/kI3YQ0bFTr6LNk=; b=pzwsqBz9sK4Suw2wL4lZZMae9K
	8dhiEnP3qYKFEPdhi58hhvdFbobsTaZLpF5Le7A3pYpNLGuW0+g/rcZc2DHK+H1UefGbrtNA6Wr8s
	T6Dww/MhF7GidW2Gsv4tgM+EkRQyNL/8vs5mW1naQCfTIeZoa/1aefN8ysI14SEyEO07IkwI4ALjA
	nO+xQGMzVzrhcgAX0Q4EgUsC4BD+ABz8O5JKYLCe1AvYqpYiUgrQoBqyIHpwZsISNTm9opw0+/UsG
	4BdmbWXvnwB7G1siVNMcXZHNYcZ9NfgxYr1aRVd2AfVHZP/PSCpdlChCKOdW+pOJV9bqCYdY3S5BS
	cBVt2l1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBL2-0000000AYwh-2hmG;
	Tue, 06 May 2025 05:59:32 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9EV-0000000A3O3-095a;
	Tue, 06 May 2025 03:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746503056;
	bh=iSV9zPyI4IkPrEBlHh8/lsdjGfzW/kI3YQ0bFTr6LNk=;
	h=From:To:Subject:Date:Message-Id;
	b=EXLmGtfNhOrQ4/ebNCpXlF49e3nE2sMEC2dKgDNToEMI3/nW2HW6fcI/asVg6uWus
	 9d2bkge0hi9Kwp3N0XBsr/3wtvV1gM74DUE+EDb5Gi/XGM8Bc969qKJYDUfCaLGsUK
	 Pa2xv3j+N3wjlt0KPkOb5YA8BmgdDNhyLsH9OQPk=
X-QQ-mid: esmtpgz12t1746503047t1a967a6c
X-QQ-Originating-IP: JFOkyO3w+3+6x0M55PWmhESZ37RR/YYYMEb/KXeiPrQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 May 2025 11:44:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5505055036827260230
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for rk3399 industry evaluation board
Date: Tue,  6 May 2025 11:43:45 +0800
Message-Id: <20250506034347.57-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NSEFX6u+4l+KtlGV1F31MMgTIaGm4RVavQGZLMVgjdA2EIvBeC5k1ycy
	DkPNX6zs8ImkUXOUnlAHHl0+e0ErdQRgi9fBN8xcFUaNBNNMhTucxQWOXgycgLkAs4PXJ0V
	fcs55EYqiKED3Sk5mwd7yXuQXG8wvwugG9MP1Ik0WHoNmI4LGA7DiBfive8aoVdHSaKJvDg
	U8kSlFUJ8n424uXjAjLo0MedUz0RSsx3W2vWOQEJDXBWMx8J1jniLZJTAMT7OKeETSyxYjK
	ww2h3m+AYfZE6OKN4/fYGjz2Jy8llXDqwb53aUqNSVZQEqqsWQEBHWZcKRDkiko9WFjPGTW
	cZfOVTGVDKQttioB9AKZ3i9abuMIpe9lXpGKrU6G3EHiXFmgkwRC2vhQxHvWSnTZqLCW1ea
	d7FohT6vNU09cl24cIRK5jukdYy7xWT0+weeye2u+awc9yjhGrwcbPZDqgyzu8q6JdDx175
	hWvWJ4CTAyKSoZFiq1/kjboYbXVxmu3F2rkO2WOnVjdOfIvFzUiTl2kMVWPS1aBzd7JqkWE
	cdcDKwdnDZi9lQvrc+Kd629zKXir4mxqWWKlpyursFIpy+YhjuPk+ttGu351SV1x6Q5ItYn
	WLj4wRKalR83dh/FUtSj3hsvfxtHLzgoUfM7GxI5QmnGNK+PQYi1qKpfq2pMcuSS18m/5WG
	+iYywRm7EZ3FFn2Yd83UN4KYBrtbyKLWNx8RAw1+LbxIJq4phLy21+GC4djooSEF5JpTf66
	ju50A4muaAnFun4HpVJl/vpvmv//lB9GCE9wTA+WCqg0Dv/92X7arI0JsPcZuthhDh+uW3s
	J1IovLkXT/KxBTBdGIgk46GYX3CxXMlpO3ePhisdu9F4qprCmpIon5rGqCElYi+GicPKK15
	OmVIe9fUNwaNxTuxBN/HM8OgNEMuozzX0XOE1/aSoVNa9drroDVpWdp/i36FILyR0UAUYtZ
	mVox8hfImqBx9vHYKtOnuOC8cA0ICatJ/oNWFxT9oY2QfaHc9t/Xyyzri2Tie9gfvu0Y=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_204439_464661_8BE31428 
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General feature for rk3399 industry evaluation board:
- Rockchip RK3399
- 4GB LPDDR4
- emmc5.1
- SDIO3.0 compatible TF card
- 1x HDMI2.0a TX
- 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
- 1x type-c DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- 1x Ethernet / USB3.0 to Ethernet

Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250430074848.539-1-kernel@airkyi.com/
- Add i2s
- Add tsadc
- Fix devicetree coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250427094211.246-1-kernel@airkyi.com/
- Remove gmac
- Add rk809 PMIC
- Add CPU supply
- Fix io-domain for sdmmc
- Enable vopl

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
  arm64: dts: rockchip: Add rk3399-evb-ind board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 496 ++++++++++++++++++
 3 files changed, 502 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

--
2.49.0


