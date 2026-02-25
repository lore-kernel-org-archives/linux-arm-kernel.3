Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF95EEFD20D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thg6xL06ns/uFokGp6geeDBdgpcCESS5DFuOGvrQOSM=; b=1UjKu9+kUcsJW8KHK3lHHTHyJF
	Zsy1G2rbvInh/i/bG5LauzcjvdJPCBcpgWaZ3XK5UDubDOckIXM0Vzt0Z8DSxWu6BTDAdJbhhz/UG
	xAZ1zcgoa6MnmPgorcmzpbwFMPE6GIyQ2manjt1G8Iwgar/fGx6cqgL2AkQTRQvkbs6p3tR/qjlmL
	Lgx8caDOJZmO5+HkfJApEh4Z/d3ZJKH444phjLt3TlihUKGYpdvqUgJthwU20M1zyP0T+2YxNgRCY
	bIy6A8E9eHBNVXZPpbqpUzWPhSThs5zrmoNa6n0IEJn3BB0fVbkYYqjtoaPMbOLPYxLxpPYnh8/x6
	W0reWK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh6-00000003atw-32bF;
	Wed, 25 Feb 2026 08:56:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh5-00000003atY-1Qnk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=thg6xL06ns/uFokGp6geeDBdgpcCESS5DFuOGvrQOSM=; b=Tvo2EQhdqKnCz6h4yERWjp4jeO
	WFczovK+4R8+uMOSHR3rZx4bNiPwm5H1uUy/HvPgXsvY422HJbT4zugePBFNV6r9KhdFj52EHCTF5
	17x9aXH6/CE4fYrL3ks2wz8dQWSw1WxG8xVTjQgWB6d0x00zpH2mlZ9HnSymV5vDYcIyho504Qmsk
	hqWBJRDLMrpm5CPv+jNAUIqU9bGPOPxAjb4piVFGctFWXoae84VRZlEmsyISmDtyj5z36IA/LOA8A
	pC35ODvPn0trVntwDLH1eiZ7MUAC2RaQsiJwIiybEn2MUGYd5T+2ejFfvCFY00XiD1I+gLiQWnoHj
	+EqVy2mw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAh1-00000008bmd-2Tpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772009787; x=1803545787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VAvPNBcS6K1A7dVEFNuDOkfGtWQ/7kbOPXG77uNI0+g=;
  b=SJFbnhs2iqLKS1afbtV2YMugP/koEfiik6M3B5v36iqtqxi1a6KoSxYo
   JCYeAB0Ce5KBpVBCsJhlZnNMrimg448ZxwaAN5NBfVQmLGeB2M3FtsnJO
   J/Vq3KzDGZsxYs+jqkx+FTnY77CKmX8ZqnqtJjnRfq+S4sAWmgGcDoXts
   sAYuy459+C4J170uVj4JvPdTzSEVQyTeDWE3502EXGFAG11A4817y4CWP
   sF9wIXeZrBZphGZVIKM9fGUkQvhuHeqsTIV84a5WaefJgmtLWwGit9svB
   OO5LGV/HgWfEoWHuUrRxGdX3yPfs28Erxtm7mvJWUSRPBsbulQ/XmhOJR
   A==;
X-CSE-ConnectionGUID: CuTHRctdSuOo+CeX/pVyrg==
X-CSE-MsgGUID: l01JtG8PRkGjfh2LIX/aCQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61258794"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:56:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 01:55:50 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 01:55:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <ebiggers@google.com>, <martin.petersen@oracle.com>,
	<ardb@kernel.org>, <tytso@mit.edu>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH 1/6] ARM: dts: microchip: sama7d65: add LCD controller
Date: Wed, 25 Feb 2026 14:24:25 +0530
Message-ID: <20260225085430.480052-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085430.480052-1-manikandan.m@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085628_150322_86D3E38C 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add support for LCD controller node

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e21556f46384..b2fe76115aec 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -278,6 +278,32 @@ sdmmc1: mmc@e1208000 {
 			status = "disabled";
 		};
 
+		xlcdc: lcd-controller@e1400000{
+			compatible = "microchip,sama7d65-xlcdc";
+			reg = <0xe1400000 0x2000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>, <&pmc PMC_TYPE_GCK 56>, <&clk32k 1>;
+			clock-names = "periph_clk", "sys_clk", "slow_clk";
+			status = "disabled";
+
+			display-controller {
+				compatible = "atmel,hlcdc-display-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+
+			pwm {
+				compatible = "atmel,hlcdc-pwm";
+				#pwm-cells = <3>;
+			};
+		};
+
 		aes: crypto@e1600000 {
 			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
 			reg = <0xe1600000 0x100>;
-- 
2.25.1


