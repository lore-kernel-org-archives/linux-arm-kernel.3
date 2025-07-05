Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2929FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OF9j3V3Vyi4SgSh1FVLBT13zIeJ9KlZP/ukjomymbIk=; b=dSsvsumtfZh1AdtjiiV3dq2/2b
	iLa9Y9k2O3O3DUwF5yUtVcxtQXVC4RqwYyq1cM7+HOxY4nSNrmI6/4xzv49YGVPe2pChvgI8gHxFQ
	FZB9qwSn578Xq0VY9/LZSttCMiVGx6qH/tiQ0PD/0VT03rtWwog8iX8crkaxOwdilBGvNA4O/USt5
	k6QmqmOXKBwDipYb2YFJJiaZcZ/Hv4qTwb9M6/Rf+YW2eyoAX//z5E1+FqOaPU3dvMDz9o8fVn2Sb
	Co+22LphH8rawJg0pYnLTrEi7NEmdDWYGzX3hbLOLfC/NrC0ernkn+aevF4gC7cUrNNGUpw6JHpAj
	90jM+OLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAs2-0000000H4WU-2eKX;
	Sat, 05 Jul 2025 21:56:30 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAcF-0000000H2mr-3jD8;
	Sat, 05 Jul 2025 21:40:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=OF9j3V3Vyi4SgSh1FVLBT13zIeJ9KlZP/ukjomymbIk=;
	b=duBT6fFaCILMt0LbO3DTnyHuHB3RavvnXBa9ArTaeAfJBbTsfXx2wy/30YR4GfmWLRxNWy71NbAirk5s0tAeWmaPzEm+8c2wTfG1DTLOu4kWRTfezgFakdquFzEMAxLDdi291izokgtQQ8XKu2tle7syuTQtBzdNtjOtqsbkUmQ=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:39 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/7] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Sat,  5 Jul 2025 23:38:51 +0200
Message-Id: <20250705213900.3614963-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_144012_239021_2E44F228 
X-CRM114-Status: UNSURE (   8.57  )
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

This series adds support for the NetCube Systems Nagami SoM and its
associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
Carrier.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (7):
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami Basic Carrier
    Board
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad Carrier
    Board
  riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
    Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
  ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 .../devicetree/bindings/arm/sunxi.yaml        |  17 ++
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts |  84 +++++++
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 165 +++++++++++++
 .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 227 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  36 +++
 6 files changed, 532 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi

-- 
2.39.5



