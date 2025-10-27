Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D3CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg+ZNjsGVSDTf7BTdBTSNcAolOGDJPQyeXbU6yzwtTI=; b=TmWgJQj/eyqF41n+S9Mceggn/R
	JTDcL+ZAr7m1g1Q93sM43Sltx1Srwwr/2bKh6jCM4ihK/JxRiHm3ST2n9OByD943e2tAttKJW/Zto
	0sFBXMT7pbUFbdIhRMUyn+DeVDEyjDORpJU+dvQ+I1Iq2GtnwEU2J4o7BhuUprYSF+VtWQBGQW1ld
	a16nR64oTHE8FrStBwXjj8SQLWHBtkm4MkpdsqLPV+eSGAxPQEzps9fjFCOUBBWKIfN6dv/iUDOsq
	ePSmNl5eUgW61Ip0mMdBNMKSGE+1zaqpzM9fIqSVBKDzNxlI8QCud2mWUN462zyD2NOyjGF+l8yQu
	turBzWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmW-0000000DwxE-1l3E;
	Mon, 27 Oct 2025 12:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmV-0000000Dwww-0ohf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77B8960333;
	Mon, 27 Oct 2025 12:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE238C2BCAF;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569822;
	bh=ojezu/Uo+J/jAdJIMpppL/LYPdk+yEgDql0KTa8tpLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qg0MZF86i4vHoRckQjlkDFV5bPrs3QDJSL2A9/3OY1IGg5jIiM9/gdlkeXeNcL3Rl
	 mQOl8sNE44ENaSnQYXf7Z2OLHb21+6XH7Y3Gnb73lPdKC5Ls18135AKkstxdUh2wjZ
	 FBX9vwtDrO5bCWnFOqhoekD4k2PIgQjENgtiSpFlnUQHqJ78L8sOeoZwryi2jiAbLX
	 iwCaLAPPKT7jTzkv/Xa0cygTc3lAQ8FHPMCcwD4R3k0NXJxw7igG9OVoJ3MS3Pqs0h
	 fk6EBlAhndWAy0Ug3f11LupepS9nQFX9S0tsq9PrObIKXrjVq8idNusltjb4xnwrUN
	 xtgNDCwMI/FKw==
Received: by wens.tw (Postfix, from userid 1000)
	id BBDE85FFCF; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins
Date: Mon, 27 Oct 2025 20:56:50 +0800
Message-ID: <20251027125655.793277-10-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SPDIF TX (called OWA OUT in the datasheet) is available on three
pins. Of those, the PH pin is unlikely to be used since it conflicts
with the first Ethernet controller.

The Radxa Cubie A5E exposes SPDIF TX through the PI pin group on the
40-pin GPIO header.

The Orange Pi 4A exposes SPDIF TX through both the PB and PI pin
groups on the 40-pin GPIO header. The PB pin alternatively would be
used for I2S0 though.

Add pinmux settings for both options so potential users can directly
reference either one.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
Changes since v1:
- New patch; missing from v1 causing dts to not compile
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index cebd8e16e845..42dab01e3f56 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -200,6 +200,20 @@ rgmii1_pins: rgmii1-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			spdif_out_pb_pin: spdif-pb-pin {
+				pins = "PB8";
+				function = "spdif";
+				allwinner,pinmux = <2>;
+			};
+
+			/omit-if-no-ref/
+			spdif_out_pi_pin: spdif-pi-pin {
+				pins = "PI10";
+				function = "spdif";
+				allwinner,pinmux = <2>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.47.3


