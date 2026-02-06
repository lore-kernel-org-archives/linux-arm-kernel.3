Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF33EB28C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T9h53TRd+k/J4OMGYAk6XqyMyR1awSNuQc4fSdBTOU=; b=wsYgJPyOp35DR1i66D/E7iem7D
	7VUcJb2Y8/DZSUri6l+YXX9x6MsTb+ImFHPpP7VJXKS6tupXk2mmOJWjgcbmXDpn9EsEbL1VSsNyn
	24wK+VuOeluox5yxnVVRxSYN5h6c/a4Ot6e5bgydJUHCp9wDDHvZd+YVVnjS1XELPCQPKT6o2ilto
	hMvi2XyuWHHAbUmeoJzQJ7An75pYW9bpDldjv/FFfh/dPhpREJvjDOvNSr85C1uULtmGKRnN9S+u6
	cmG6dqG9L8ToR2pWPEKUJZtBlrH1MhNiIWqoEBQTIA0vcoCnLw3kTWdwXuXgDrMIBmnyBv47nEsiy
	yYjSAZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMS-0000000AtVq-1GA5;
	Fri, 06 Feb 2026 05:26:32 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMP-0000000AtU3-2Jzh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:26:30 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D823FEC05A7;
	Fri,  6 Feb 2026 00:26:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Feb 2026 00:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1770355588; x=1770441988; bh=5T9h53TRd+k/J4OMGYAk6XqyMyR1awSN
	uQc4fSdBTOU=; b=uJlZ3Hhwlyy0qfrNMzFyHbzjt2vxvGFUBYjIaQSnUYN6lYss
	fND7xdq2tvaE7f1kG9dj2cnD4UUE5baX2P/fwDpxivL43Mec2yI3fIIClONGAedf
	7O0TgkxaOPZHdCzOvXX0Bl63bXHBkVmsn5kxng2yIJunMbykEH39uyJl2qnCw8qp
	2T31OLW5kFTzqHM0ctLFSXE1CA8fOT66axTEsXkgBOrmizz6OMnLlznMyx6j8nEg
	CwVFIhL8fs5w9251onWXPFd81eXvf56+JBvD7FgZ0fPZh420GtJO2yGZUBlq4+rZ
	DGIS6ND7gFqYCN55VabZE+6R9CfeertTvi2cfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770355588; x=
	1770441988; bh=5T9h53TRd+k/J4OMGYAk6XqyMyR1awSNuQc4fSdBTOU=; b=s
	a2Fg1Or0przrsGSNcRCw0v3NyRFLVzLXKjhXaB/c501YLEfrct6ftlGdejzzza+8
	IAI0I1eLr+WjxZ42yLqY2DKQE7lu0f83Ac4HMzq7ao6KoOgBKC95mQhH4Dp1+nAi
	fu0ESWHaptHJ8nl5fDzjRTDZRSY+oWtsfEQ428CaOgSEmo2eKHyc51Nnj7RiEF1W
	Y2013+7XHS8EezoyDFFdAJSL4YgX53S/kgw7zZYiWt2uW+QxNoUHjCxpCKth50qV
	4uaFQoQFdas/uqC5ejnJs5jBOmE1Cn2RKdgRdqaYELIxSM7nYD7MqcEvpjlQWpw3
	COSyck6XYCTMftJho2jTA==
X-ME-Sender: <xms:hHuFacpYZVGYVQgXgIfe4MWqbmyIevURE-gtvd_Yaco7z2I7NzOing>
    <xme:hHuFaVMq2O5Kg5sQWFTRJUDTEEONrlMUQoMioCwrZVdQc8i81547ZsAGW1H_knZJV
    eefDp-Vcf89eHVNs2kfSgvrb8R3XRC_OAJGZIYu4N-kFHvo8Cz3P_I>
X-ME-Received: <xmr:hHuFaU1ssm0Zk4Syajb8v8mjsUQS0Jhr8735DrjeuhP2nhQAXIJ_zQjXNqaaTLQydialAiDHcGzKmkFR6anGggukNwfIaI_7vXAm0W0nCF5YNKOIAC_qQ_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepiedtheeivdfhiedvffdttefhffeltdelfeejgeekvdeikedtffdu
    keeffffhteegnecuffhomhgrihhnpehtrhgrvhgvrhhsvgdrtghomhdrrghunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrthhtsehtrhgr
    vhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdprhgtphht
    thhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrrghnkhdrlhhise
    hngihprdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hHuFaUAAzqyeSX4nCLA6uLD4sK_MectmYsNvD_KzuZ_NPP-rT0lenw>
    <xmx:hHuFaRLLb-RboRLoogjKSCMgi2dQTEIZgMnuM1zGV2P-Z5uUlb3odA>
    <xmx:hHuFadlYRZbWlxyAitpj-MrWdtNDPUKfTGdGE-sUWVLB0unNlz2xCA>
    <xmx:hHuFaabGbCiuqOGB6V8MT0l6jEA1W8t_-MgIZSZ52aF1zdCfNIZEfA>
    <xmx:hHuFafpqsUUpxdNKelnQRGWogoQn8yckZJxbbmafKv-pxztDbEX4VLRS>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 00:26:26 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Fri, 06 Feb 2026 16:26:14 +1100
Subject: [PATCH v2 3/3] arm64: dts: freescale: ten64: provide
 gpio-line-names for all system gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-ten64-dts-updates-2025-12-v2-3-2d77f47a89e7@traverse.com.au>
References: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
In-Reply-To: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770355576; l=2513;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=X69ThDAaM039EdkcSvJ72b+OxBCNOIx2jmb5SqNRGJY=;
 b=zxt/KTGM2tSAixuJXM0tyWGfHGPyruaD4dv6eXGqMTIFf1xemAyIcIL940NaFn7Y1tkeAZ1eX
 AuDLKMFamqCAXsyphR3pBC26HFBoB1Urkz82XWrThda3lGXbImcmr7V
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_212629_660744_0DB72727 
X-CRM114-Status: GOOD (  10.53  )
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

There are GPIOs on the Ten64 board which are intended to be
user controlled, as well as some that are used for system functions
(such as SFP control lines and associated LEDs).

Providing the gpio-line-names will be useful to users of the board,
for example, in the /sys/kernel/debug/gpio listing.

The master GPIO list for the board can be viewed here:
https://ten64doc.traverse.com.au/hardware/gpio/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 0a460eebd636..bb59a3e17fde 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -264,6 +264,48 @@ &esdhc {
 	max-frequency = <25000000>;
 };
 
+&gpio1 {
+	/* Only GPIO 17 is utilised on this controller */
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"",
+		"EXT_PWR_DWN",
+		"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio2 {
+	/* Only GPIO 27,28,29 are utilised on this controller */
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "",
+		"P6_GPIO_A",
+		"P6_GPIO_B",
+		"P6_GPIO_C",
+		"", "";
+};
+
+&gpio3 {
+	/* Only GPIO4-9, 11-13 are utilised on this controller */
+	gpio-line-names =
+		"", "", "", "",
+		"P6_GPIO_D",
+		"P6_GPIO_E",
+		"P6_GPIO_F",
+		"P6_GPIO_G",
+		"P6_GPIO_H_ADMIN_BTN",
+		"",
+		"TCA9539_INT",
+		"SFP_XG0_ACT_LED",
+		"SFP_XG1_ACT_LED",
+		"SIM_SD_TRAY_STATUS",
+		"", "", "", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -273,6 +315,24 @@ sfpgpio: gpio@76 {
 		#gpio-cells = <2>;
 		gpio-controller;
 
+		gpio-line-names =
+			"XG0_TX_FAULT", /* Lower SFP+ signals */
+			"XG0_TX_DISABLE",
+			"XG0_PRESENT",
+			"XG0_LOS",
+			"XG1_TX_FAULT", /* Upper SFP+ signals */
+			"XG1_TX_DISABLE",
+			"XG1_PRESENT",
+			"XG1_LOS",
+			"CELLULAR_RESET",
+			"CELLULAR_POWER_OFF",
+			"CELLULAR_DISABLE",
+			"CELLULAR_GNSS_DISABLE",
+			"ADMIN_LED_P",
+			"ADMIN_LED_N",
+			"USER_SWITCH",
+			"ATX_HD_ACT_LED";
+
 		admin-led-lower-hog {
 			gpio-hog;
 			gpios = <13 GPIO_ACTIVE_HIGH>;

-- 
2.51.2


