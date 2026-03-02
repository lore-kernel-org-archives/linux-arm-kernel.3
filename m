Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A670EA4E25
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK7gLmqPiKwjdVOHHM7gb1wfzAy/UX/o8DeHLhkj7p8=; b=VqB4R5sDvOK9J2x/iOuJB72ZWl
	uwgwwhYUYRkOzxWah5N3b92jzpher/NFN5Zulw+tjASFToELQt7MagizNV5xKLNTdh7PjT2ywE5NA
	NtTqqlWQfS7oJWT2ExEtKvFjUmO/T+VV1qG71oQln/iAxcFwOCvVQEcBI0yhW2Y2qr9GzJPEFKShY
	/jLoc+gIY41iVjnE7ewvrslx6c/aM2su37bhKqJ4HF0LKUlsHisvOGYsNCelorvdWQU4ZrvAwfNSF
	OhfekvGVNviNc0SXdh55AwKZsMU/sUt3RXNLmnJ8fkAjYeJJjHJU3ZBL9iKpWud9zmyCh1ZkpMD13
	OMaO3m5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JY-0000000DNKS-0xyb;
	Mon, 02 Mar 2026 15:36:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JV-0000000DNJK-08HM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0C1D4454E;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E77C2BCB8;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465764;
	bh=ZFP8AgDDMVfbo9xqlz0itL+nVBZ/DmygRhjGTRlxnaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUKUPOKSEw2QrjbLIUX5PdGoJl6Zt1RtTXw7ts9d3g/Q4ztW1uVASry/JZs+9lrn8
	 pQLFpsH3zBYKShW98dRSGnO/LxiOjMfmeJGp7T/IdWo31nDEIvKHYeUHpVblXQlWtW
	 OlwAcqJPgV8N1yQu1bbB9fc8fcxq6npDvA8FMJEt+KFyyayk9m5rK8dtQHfG83zl+7
	 DjMAYir0Ib2AENMNigw7POnXcKvQA2yJMxQ92tzGppUp67Z007auvaMqGetfhyAiFi
	 Bq6v3VNnaEjtc8WfRX3VnenZyvhKpRHnjVvl75hXzsrVN9VKsiDaaAHXyp20ei7gAb
	 0Q/d9sW1TOxTQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 210375FF08; Mon, 02 Mar 2026 23:36:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
Date: Mon,  2 Mar 2026 23:35:57 +0800
Message-ID: <20260302153559.3199783-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302153559.3199783-1-wens@kernel.org>
References: <20260302153559.3199783-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_073605_130744_21585EDA 
X-CRM114-Status: GOOD (  10.70  )
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

The Avaota A1 board uses spi0 on the PJ pins to connect a SPI NAND
chip.

Add the full set of pins. Even though this board doesn't use CS1, other
boards may do so in the future.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 92aecb90d4e1..da85cecb66c0 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -228,6 +228,13 @@ spi0_pc_pins: spi0-pc-pins {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_pj_pins: spi0-pj-pins {
+				pins = "PJ21", "PJ22", "PJ23";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
 				pins = "PC3";
@@ -235,6 +242,13 @@ spi0_cs0_pc_pin: spi0-cs0-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_cs0_pj_pin: spi0-cs0-pj-pin {
+				pins = "PJ20";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_cs1_pc_pin: spi0-cs1-pc-pin {
 				pins = "PC7";
@@ -242,6 +256,13 @@ spi0_cs1_pc_pin: spi0-cs1-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_cs1_pj_pin: spi0-cs1-pj-pin {
+				pins = "PJ24";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_hold_pc_pin: spi0-hold-pc-pin {
 				/* conflicts with eMMC D7 */
@@ -250,6 +271,13 @@ spi0_hold_pc_pin: spi0-hold-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_hold_pj_pin: spi0-hold-pj-pin {
+				pins = "PJ26";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_wp_pc_pin: spi0-wp-pc-pin {
 				/* conflicts with eMMC D2 */
@@ -258,6 +286,13 @@ spi0_wp_pc_pin: spi0-wp-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_wp_pj_pin: spi0-wp-pj-pin {
+				pins = "PJ25";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.47.3


