Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F162E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBfi6nrpA1yiNxlW1XzcPEAvwphmJZY9mRYoq67HWaM=; b=Kixr3fzMCZE2QIGg7VEyr8Vh92
	En9StkOglLpbKdRnQdou/xwnr4k8ShDsAxbhnATzMFv4cVbYbC8a9JuERX8INxOs5CwaM1m1S4RrR
	eWlyIbe5gN2/RuJVVT1zCXLo86raKW+VD3lgFQDoF04X/I9Rsi0e8W8wzMRBECLIwOhflHO9NuMt/
	fk8qrfom2tcUJXuFo2VDoO+5Ss0g1ttycU4IbFs7d23imK+yCWAAoxzL7ioeZC5MGYdRE8CgzpPWw
	3hXKzMZ37Jv1LCC8A7eEA2Q3fk4alSzQSDDWK7ivp3ExZ/labmy1a+iqB/zNrh+E1Jzjqrl8l55Ky
	Fjjn05Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVARk-00000005AV0-0kXJ;
	Tue, 07 Jan 2025 14:20:40 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAJ0-000000057zu-2iXj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259098; x=1767795098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NBfi6nrpA1yiNxlW1XzcPEAvwphmJZY9mRYoq67HWaM=;
  b=KP2yyj5MO1jh2xDVMLE9DUsJwqMu92EL4Z+kzGCKv0ktoonZOJV7Ni3T
   K+mJ6lgtjSk/+EyuZEyHU0lpU7uYGZDsSQBjyhWtdURug2W3mVDFVHsBi
   PwOKzUjh3FDZfP0nOzkg4AMrnRryfGFYbkSuBSha1zHHg6cTd+ViUto2J
   J/1inN0ml2YrsKOkXayl2akEVo9+0yLMIzZ2lSm3FyCRr6P952j74acQM
   fakikm72u44kPLBsM2S5Po/texHgkLoOsY6B0gOKzo9+w37UUJuI/b4R5
   QW8qONxEdCZIqpaAb8jWt+kNnnM32KTHcsJ8eUiZWvZ/XseP5nZXYT+sY
   A==;
X-CSE-ConnectionGUID: fnW025m9SOKxylZKA12b6A==
X-CSE-MsgGUID: aPb+SQZ6QYmf9P5Sl7cikg==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896503"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:38 +0100
X-CheckPoint: {677D361A-0-1D00F64B-E6C57517}
X-MAIL-CPID: E308D1528F3988BC39AF5B8E3116FC19_3
X-Control-Analysis: str=0001.0A682F1A.677D361A.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39FCA164D53;
	Tue,  7 Jan 2025 15:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NBfi6nrpA1yiNxlW1XzcPEAvwphmJZY9mRYoq67HWaM=;
	b=BHFpyrnkOHJ36F2uH3q3AHY7fhrPDB77ME2iay/1WZv55yua3zRrj+/dZB071xFx+oYY7k
	MOtaJTgTfaeSsxlAW+esronyOGVzTx7xQ+YIQ7qrSUmMpOrIMJgOd0YP4VRykfZRQC/Uzp
	oHiViB0IQJS3gSnIk4OZDH956uWlDZILfyut7Rz6H7REqGJRvUmyrpQZsqO2IlJFwfBdon
	2e5ENYnTZtlEP5+gSdP/ppbF3fK42QeyIjBrmyLgfKQXQzn3kT2cGk+QRbMrBN+bS9rM1m
	wNkaQOuMTJtscCGS7NJTljN5eArgabxhYpTYh2b2dWlqQf4Dpe6yYLPojNZ4Qw==
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
Subject: [PATCH 2/3] arm64: dts: mba93xxca: Do not assert power-down pins
Date: Tue,  7 Jan 2025 15:11:16 +0100
Message-Id: <20250107141117.984652-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061138_988897_5530EE5B 
X-CRM114-Status: GOOD (  12.00  )
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

Change the output to inactive (output-low) for active-low pins, resulting
in high-voltage of power-down pins. Thus this enables the attached
devices.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 861a028a1b165..b8ccc946c62d7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -448,38 +448,38 @@ expander1: gpio@71 {
 				  "WLAN_PERST#", "12V_EN";
 
 		/*
-		 * Controls the WiFi card PD pin which is low active
-		 * as power down signal. The output-high states, the signal
-		 * is active, e.g. card is powered down
+		 * Controls the WiFi card's low-active power down pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-pd-hog {
 			gpio-hog;
 			gpios = <4 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_PD#";
 		};
 
 		/*
-		 * Controls the WiFi card disable pin which is low active
-		 * as disable signal. The output-high states, the signal
-		 * is active, e.g. card is disabled
+		 * Controls the WiFi card's low-active disable pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-wdisable-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_W_DISABLE#";
 		};
 
 		/*
-		 * Controls the WiFi card reset pin which is low active
-		 * as reset signal. The output-high states, the signal
-		 * is active, e.g. card in reset
+		 * Controls the WiFi card's reset pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-perst-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_PERST#";
 		};
 	};
-- 
2.34.1


