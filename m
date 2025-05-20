Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1215FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mydkjm08QIvLWA/4BcOB1dXEsbYKaUwIYfeH9kPQgNs=; b=MJCTEeBEqUb8jecS0vj5+Qjify
	zKygji+evczHL2UDrS7aKHZc5hHxyZHquIyVSnmzNLH1R6JZimVwP74v9EkVmQ3FBstth7HwC0hoV
	snMZidXDTlRUXZSMOiD4wURAnDKu9k3S7IOkYVVHdBsix3upz7/YxhrGWxNn3TISBWPz4UmtihxQz
	F0XV6wA1PjiUiIiQBVybC11mKkrj78bznBVTr0gF+w4YUuOvB5r7fCR3itafdckjr1CzUlbdzmFG9
	x6+/7lCVH/N+Pa4nB+/w/YE2wunK/xQJJ0IsHAlPmPLWH5V51nnnSS0ke5XcWWekCgL+ap3ynwfk/
	U4naNVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLnw-0000000ConJ-2Lu7;
	Tue, 20 May 2025 12:10:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLlo-0000000CoPW-3Rbo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747742912; x=1779278912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mydkjm08QIvLWA/4BcOB1dXEsbYKaUwIYfeH9kPQgNs=;
  b=Hk1xfnUCGSbDrpVCHXg1h2kv3n1u+wXTKMp5LBoeRXu3Jnf64hVIzNQB
   pcCspzyugR8r0QAVfgAatQub4K/+DBlVAWffAh9uaf4iCe/xNlXhlnF2V
   mPf1p+FhVATlY/7aqky8g8TcpVYVrRPhEIRzGPukgyMjZCAupP0kH7ygM
   2am53hOhYmFeeXYNuSoXhSM9xopcuD41M60RuBP0ykzdxm4x9lJtsg8gr
   QtTV+kZyyKGBj3NwgiwjPEz93b1uLNenFUQTFbyNqYm8f+HSFTLyoFTiD
   9PEC4Qiy32Y26LuaMvKgFlMggRVyoC9apreAI/FaCsJ2rRnds37BpYTKO
   g==;
X-CSE-ConnectionGUID: WGbEe5mISL6y4FTUK6hA/A==
X-CSE-MsgGUID: wNbZQtggSh+ST2W74UFkow==
X-IronPort-AV: E=Sophos;i="6.15,302,1739833200"; 
   d="scan'208";a="44182551"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 May 2025 14:08:28 +0200
X-CheckPoint: {682C70BC-7-DF3E87D0-C74668F0}
X-MAIL-CPID: E98BEE298717E5CE9BA43ED74D55136E_0
X-Control-Analysis: str=0001.0A00639F.682C70C3.0032,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AC9B160A8F;
	Tue, 20 May 2025 14:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747742903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mydkjm08QIvLWA/4BcOB1dXEsbYKaUwIYfeH9kPQgNs=;
	b=sRWml8PKLS2gK0dDH+njNPfwX5dX8uBb4x78wNwmI8THAjaUaxNIy0E8nNNOZTWVSPlGQl
	arvXW+bEXegh5G+J2k4pX85rcpKWy58VMgcIgx/g8ZKxbBrwWqz3f0zdEyJU+jyxIJW5LI
	1tf7o811/HyX+ke4jpKxmCqluVPK7Gbj3eU04I+YpaqaWkSuUOPDf7dVehlrisH2k32W4O
	v2ZBUQDPf2KHfJFWxMvj7Jg6PK72UmDsBT/ogFVb/UEQdw/GqRU9/VTrjJkIc965k4Orjv
	ZjG3j/QiKeB161PgIJUdrLi80srNDlysDrNuZnNJgJ5t/vYoABXH5S1UK5KHPw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: tqma8mnql: Add EASRC support
Date: Tue, 20 May 2025 14:08:18 +0200
Message-ID: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_050833_338269_F8420CE5 
X-CRM114-Status: GOOD (  10.20  )
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

Enable EASRC support in tlv320aic32x4 sound card.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Note that the firmware file /lib/firmware/imx/easrc/easrc-imx8mn.bin
is needed.

Changes in v2:
* Rebase to next-20250516

 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                 | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index dc94d73f7106c..d7f7f9aafb7d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -79,6 +79,10 @@ &sai3 {
 		 <&clk IMX8MN_AUDIO_PLL2_OUT>;
 };
 
+&sound {
+	audio-asrc = <&easrc>;
+};
+
 &tlv320aic3x04 {
 	clock-names = "mclk";
 	clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 640c41b51af98..1d23814e11cd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -52,6 +52,10 @@ &A53_0 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&easrc {
+	status = "okay";
+};
+
 &flexspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 7ee1228a50f4f..79daba930ad64 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -136,7 +136,7 @@ reg_vcc_3v3: regulator-3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	sound {
+	sound: sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
-- 
2.43.0


