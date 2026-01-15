Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA9BD3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJURGzCJykN5dc=; b=2S1GDsBKk6KC2qHVH6fLGd8OIF
	JZMUIlCpFS1TlDw6VDWV9YabuJLwYwjuFioAy+OsDxbhme2V4xUPe29A0x98NZGNa4Y4E5/ahPu1r
	KFU4p9vSp/KCUPvtQdGMOM7887Oqc+YJebcx6TTTZ/dKFCVBRerLZAmxJYLD+yASyjVRlTC1Ex+3P
	kRktdF/amkvbbpS6orWeRmx7jILfLNqKKQQ67/BaMlEfrXYQWhzauRuivCltiLC+ts9PwGhZlv+qL
	nfaRVp2SUsaBJSdzYju9mlkt3jNZ6BHFZIWJN27AhIE3ODUsviuJcRQ6q0QxT8hjGzWrnbOomHrsx
	b/Z39jJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpt-0000000BqzF-3bhA;
	Thu, 15 Jan 2026 06:28:01 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpo-0000000BqxP-49vn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:27:58 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 9C1F71D000AB;
	Thu, 15 Jan 2026 01:27:54 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 15 Jan 2026 01:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1768458474; x=1768544874; bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJU
	RGzCJykN5dc=; b=h16TMbWGJG/66Uhg5xW7NjkHSAafIjoMQAbrljBGfTtR/JrE
	zN6UxeklvfsJ74DQ78cSdCCTEUTsFNO4ruKDYozVhTTcLcyzIDo+fbXsCgpruYYR
	KZ6fp8nuJ53fOpjjH+VfplD5OYStnRzxnsMZaBue8NRPGp0KBjsrK70heAG8WvLe
	vGNqjU/SvJPHMfbscEI8w/YRCYIWcJ6kIcxjWoiEt4zUlCYPDLZ8DqjYBksF+YMe
	FvrK23/6Oubhfd+XaL1KOgf7UrqTk4ek472qIQpl9sax6qKObaDqY2rA7Bs344Tz
	/csK/kerhsNBnkrg+TsPVOX3qNtG14WONJxmBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768458474; x=
	1768544874; bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJURGzCJykN5dc=; b=t
	0mmohV5PgBdYV5z0c7LD2fVpTpemuAdhrUJZIH5mceaKeJZjre0Np6H6/huvV+tJ
	Pa2bu55CZEfMgUP/9vrRWGLIlIatgwKXcau0tusWvGuVC4LyfagEpqgEf4on6Ke/
	L9CEN7WGGF/to2qBRK4hM+Le1UczD9ClRMgCtJ3OFkvyVLHfZzmRS9ZlKyRC3UWz
	QG824YzYg6M3VrIVJL9jaaNSL2ELn4brbIEWSwers+KY476+XaxcVWLIbiRGthRR
	X09YFVsRTiorsa/81Ud165/GEtWxoaxlcm3feu58ut8rf2cyC1ny2K3oHBleyrRL
	YbOcQ/yeV12s4A05c8YEQ==
X-ME-Sender: <xms:6ohoabTmtCt2LFGbyBNz1scTpAVkELqqStr99XaJajRZJwsFsVj6jA>
    <xme:6ohoafXS7xvy6e4gENelSD45Va5ia58UImuDeLJQFTMg4JvjbXjtxRp2O6l0QOd6n
    s5Hgzmgqpo6QvGJyOI2TJs54H1tgEjPEwV-poVxNtCDOrgeJs26TKR5>
X-ME-Received: <xmr:6ohoaUfFntOOhPhKIE2geBWnWYjha-COaFnlQOc_0c_t5amA9g87SIrxZYegfzZLiS5ieOLuVg6bgh_oTUIjCr6FTSX-uiwGOlziv7E2ZwP-_4ZtrdI-q1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdehfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepffdvtdfhkeelffffgfejkeefteeuhefhiefgfffgkeduueejheff
    teffleetgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvih
    gtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdprhgtphhtthhopehroh
    gshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6ohoabJ-2DwYHiPlZAeqdeMxIsptErpKIy_aAdd0hOCbnDA9F9z9Ag>
    <xmx:6ohoaZwNmhNCULHiAUVVwnft9F4fLcK3WlefRnIoRH6RNi0CC7dL6w>
    <xmx:6ohoaZupQ6bXpdpF2uDqR-RnNFcXAuO_gI2BS8xqbDkAXhgs_E6ryg>
    <xmx:6ohoaUB1GyMXiuL8xTDlsxlsJBbVK98w2ucQUG70TQq09WQGe9J57Q>
    <xmx:6ohoaRHin23NZfWYhSrNYBs6FeJVQuaRlHdGYr_y8DCsuoiKDJOmXuuR>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 01:27:51 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Thu, 15 Jan 2026 17:26:43 +1100
Subject: [PATCH 1/3] arm64: dts: ten64: add emc2301 fan controller and
 thermal set points
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-ten64-dts-updates-2025-12-v1-1-a56380bbb2ac@traverse.com.au>
References: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
In-Reply-To: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768458468; l=2279;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=EhEafYcR5G6YrM9Al28I4jrc6wnuvl/PvTiP7j00trE=;
 b=q4a03P7rNHi32jigs4vHoKe96Z2Jwn4PK7j706Ce36wMum9/FRzICJabdpz9Drq5/D91pDlaV
 YsXLflHMm8AD9NzJVIGEsrLavp5GjVeSpQmO2knJRpbDr49Gf9YEiTN
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_222757_095874_F5839924 
X-CRM114-Status: GOOD (  12.40  )
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

Add support for using the on-board EMC2301 fan controller as
a cooling device for the main SoC.

This functionality only became available in the mainline
kernel recently, so the fan controller has been absent from the
mainline DTS copy until now.

The thermal set points are intended for the Ten64
Desktop appliance, it is anticipated that users of the board
in other installations will be able to override these through
their own FDT overlay or by a fixup function in the system firmware.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 71765ec91745..35470c0a928f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -68,6 +68,42 @@ led-2 {
 		};
 	};
 
+	thermal-zones {
+		soc-thermal {
+			trips {
+				fanlow0: fanlow0 {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+				fanmid0: fanmid0 {
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+				fanmax0: fanmax0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+			cooling-maps {
+				map2 {
+					trip = <&fanlow0>;
+					cooling-device = <&casefan 0 3>;
+				};
+				map3 {
+					trip = <&fanmid0>;
+					cooling-device = <&casefan 4 7>;
+				};
+				map4 {
+					trip = <&fanmax0>;
+					cooling-device = <&casefan 8 THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	sfp_xg0: dpmac2-sfp {
 		compatible = "sff,sfp";
 		i2c-bus = <&sfplower_i2c>;
@@ -253,6 +289,20 @@ usbhub: usb-hub@2d {
 		reg = <0x2d>;
 	};
 
+	fan_controller: emc2301@2f {
+		compatible = "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		casefan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 26000 0 1>;
+			#cooling-cells = <2>;
+		};
+	};
+
 	uc: board-controller@7e {
 		compatible = "traverse,ten64-controller";
 		reg = <0x7e>;

-- 
2.51.2


