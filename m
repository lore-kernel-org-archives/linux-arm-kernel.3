Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pSVQvuA6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcnNS8Tm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WrnBH/yj5xL+KVHbii79LvyK9OxW7IAvQMQuf3gi2zE=; b=pSVQvuA6316vPjP1NkVvys72T1
	2W9zIT1Pa01GjFkFdwsRw0Dp2H1ZPh6cbeCG4Sy4DMQr10pt1uCUYxgPpHos8A/7PoeNhJgAemf/u
	A/sC3k7qixnxCMSwF53Rjgp01kA3DcCKG61FuuXe54Nnma/dCX61bzYvc5NoqIiy85HMJPM0SVvQW
	JGmkhzZP8U+mK9qzb9FX/wYHJwcKNB80xhxyQfiIbbUYqpB0innbfPogNRtewJUzSc0AE/INiRYc/
	/jUqccoSoF8v/LBcVVllNpC3lgLiXsjhaqnWOsTo5hUPrYWsbwxxUUOLClr5Mc+pfS7nncTd2pPNq
	gQSId0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKk19-00000000aHs-2m46;
	Sat, 24 Oct 2026 22:15:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKk17-00000000aHi-3nYr;
	Sat, 24 Oct 2026 22:15:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE087600D4;
	Sat, 24 Oct 2026 22:15:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792880108;
	b=TDnFzVEcvMWSZvffwloJwn0y6puG5QuzCfO2KhljkH0/r8P1tWaqjYmlk6pNuZWgSkr+
	 gF0z3+SDj46Ntwj6iOrHrreWsXyFdWiPZGxdeNWgm+e/j0MGKX1wt2LIW/8uzaBWlK0cd
	 G+xRRrdlMoaBeKpy2JaGfzr0hakzFogcZAUD0kEGki29SkKaP6/Hst1LXF3SItCP274bW
	 o2KVfXUdft6OntHrad44Ic8kLc3QiOWNS/8nggoAHsLFrKzAY9/BABZoyZNuMUd/BtjDk
	 4W8lqtpNPOZUBitKQ49vYF40bUqLt48LFVMZQsL55hmtzN7CtkW3Pdfe5BlhYrKjV5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792880108;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=WrnBH/yj5xL+KVHbii79LvyK9OxW7IAvQMQuf3gi2zE=;
	b=Nyz1muwitGrHqzS7D4q+U7Rsi1hNEHMMq444nVjnlKdlw4tq/BWBztiKGwA2hRlUSTn0
	 BbwhtEJW0K4+1GC/sxUzVF1nQnYFGdVxdvyd33ZCG8FPNk4HL9HlhVMMSTzBQTxSLvWk7
	 KC1BdnfLUIzbdpl5t273uc/9462DYmnI2hJ4fXT7+3X0kET4odMPgZfct5qeJ7Mgj8Dql
	 p/FMQq5xqWD/KsMbJpQ0kH+g5cBHWRj+zsTe4xvwduIvV6+0ZCHZ+ZtfAbooew1NY6IQ0
	 FJj3vxzQGh9bhIYB+etfjv92Wf0WAmKkr92wvuub6/qa7oa0Hh02WkGoZ2/4e81cPxA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31A281F01825;
	Sat, 24 Oct 2026 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792880108;
	bh=WrnBH/yj5xL+KVHbii79LvyK9OxW7IAvQMQuf3gi2zE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kcnNS8Tm3AaWdbwd4g+/0FXMBQHsyLeyhcO2rD36X/osf3HBJFWp6SqhgdyDvuNYo
	 eSMKbzS0yM5Ck7t0ZhS4PpYhIgK3Di1R1pTEDXQ+jfw4O+V92bJezPfImzEeE0NGtC
	 E/Rqa7k0u8MTmsrSl0/GDLavcg9JzJOXkYKNNzy19i5tR+sXCnx1Qn9BEGqwuuaZGf
	 47pxiVT5pwPHXWvWnxYPYoDG4ZxaqlIlU5Nb2/hA9m0Pe3yjT7FoYHAP8J6e28GjZh
	 bdHaMBi+Cdia9XAi5V4gkIdp4FtZkOLYQH7usBa+W0H9Lb0ZIJjbVX7d8J/WMMKO6l
	 Jx2Vt7BX68K0A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAA63448CC;
	Sat, 24 Oct 2026 22:15:07 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 24 Oct 2026 22:15:04 +0000
Subject: [PATCH v2] arm64: dts: rockchip: Add the GPIO expander to Kobol
 Helios64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-helios64-pca9655-v2-1-97210e9aafb1@iav.lv>
X-B4-Tracking: v=1; b=H4sIAOgt3WoC/32NSwrCMBRFt1Le2Ej+EkfuQzoI6at5UJqSlKCU7
 N3YBTg8B+65BxTMhAXuwwEZKxVKawd5GSBEv76Q0dQZJJdWcO5YxIVSsZptwTtrDFPOahWkD7O
 eoM+2jDO9z+Rz7Byp7Cl/zocqfvZPrArGmb0pRK2VtIY/yNfrUmFsrX0BjMhYFK0AAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=NxG+xHVeylkpzOnvEZLanDkLJTXNZz8dgrlgIaGTkKw=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl3dV/d6TAQm7Npl2PW069avwLfBltsv2fFzcbnUztpR
 deDGd8COkpZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBEbi1gZFgQbsmwMNKU9xyb
 bXLOMam4R1xHNzAl2y5cxxRXeUSqRIPhv3dFqTFXxhdWJSkTB/uIMt35/0uYZoWKbPqZlW43474
 aGwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

Helios64 has an ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
on I2C2, powered from VCC3V3_SYS_S3. Its 16 lines go to pins 4-19 of
the P5 GPIO header, one line per pin in order, so name them after the
pins. Its INT# output goes to GPIO0_B1 with an external pull-up (R59
to 1V8_S3), so the pin has no internal bias. Schematic, sheets 34 and
35:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
The node is the one tested on the board in v1; the line names are
checked with dt-validate only.
---
Changes in v2:
- Drop the binding patch, applied by Bartosz as 356cab616b6f.
- Name the lines after the P5 header pins, label the node p5_gpio.
- Rebase on for-next.
- Link to v1: https://lore.kernel.org/r/20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..df993cbb17c8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -461,6 +461,25 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <30>;
 	status = "okay";
 
+	p5_gpio: gpio@20 {
+		compatible = "onnn,pca9655", "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		/* All 16 lines go to pins 4-19 of the P5 GPIO header */
+		gpio-line-names = "PIN_4", "PIN_5", "PIN_6", "PIN_7",
+				  "PIN_8", "PIN_9", "PIN_10", "PIN_11",
+				  "PIN_12", "PIN_13", "PIN_14", "PIN_15",
+				  "PIN_16", "PIN_17", "PIN_18", "PIN_19";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&exp16_int_l>;
+		vcc-supply = <&vcc3v3_sys_s3>;
+	};
+
 	temp@4c {
 		compatible = "national,lm75";
 		reg = <0x4c>;
@@ -501,6 +520,12 @@ user1_btn: user1-btn {
 		};
 	};
 
+	expander {
+		exp16_int_l: exp16-int-l {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	fan {
 		fan1_sense: fan1-sense {
 			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261009-helios64-pca9655-39643c2acf4d

Best regards,
-- 
Igor Velkov <iav@iav.lv>



