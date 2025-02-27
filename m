Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A230AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MirMbyM3aXHzPK2CYXEbEn5zMxz9DqDC+efHc2AzaB0=; b=zOOEQksT5pDTmn7N2iRz/eb4hx
	ipc3uYB91hGVEejwn8zdnDnt6/tppqOgY5yV1BrFBZjJ/F8hXqVJlh/mrhr1/1cSE9nVaDTEayP0u
	/+FzWHTWzmyiqM/MqR7xRe01+UbPagDm93S3jRkOEdhFsjhgzw9RTlgmL1UreTy6llmOGVL3SYPHi
	dQYthCt5fTRteT4AQaQpGvYe7HkhsHF71fz+xYOWhrnpwAEgBAWqAmNXhnOqOr1zXdH+cGuudLm6C
	XyitxBojUFAnulDlu9SCbpNt5Ks0gDH18vWlS2S6/qgaHZHKGrV1vU1i5Sds3v9+jqjCaAK++aiSj
	xJ1B4Cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjih-00000008Wji-3dTD;
	Thu, 27 Feb 2025 19:38:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC7-00000007xuB-312v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671583; x=1772207583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CSqowWllSWs/9jg8yYeeMjHbutTuRtta9NocLFIFSDA=;
  b=hrrmSL/Ew2wR1nqBeHJ8lnmO9pF2Apa2BhHNtKLgHdE77WUQn+YGWcFo
   vdRIcmXxobB4MkzsCRio0HWoKLRaT/pqQqohfaxXw3nFuIlg0M1GIzmhY
   b7wwv8Wz6bGq5P9NVwoBIIJRhbbDNYo7u1i0e6TTUIUpUOGr6s8Tb6Jnp
   ge7KoCMeuDTgC21EXggbqap7qj1+qrdQ2Aeh0AobdFcx1Kk5CGqUly0iM
   4RiuY1Y+QTWClCzXsNRpLulXRvHxB6QnaGz0fXh396aKIJW6qlQFHOuot
   8KjokFtwmlNTr7fEEPnV73i4xDAlnUfFyxiQZ+B6E2Gqi5R+H/YQxDODf
   Q==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: GjahxtAfR1ecHef6+c7Dig==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638181"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 16/21] ARM: dts: microchip: sama7d65: Add Shutdown controller support
Date: Thu, 27 Feb 2025 08:52:03 -0700
Message-ID: <ffc76b757cd1ba4ca38947f8b30525b848aa8ad7.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075303_833085_DE509DA5 
X-CRM114-Status: UNSURE (   8.58  )
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

Add shutdown controller support for SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 5165259fb926..b0a676623100 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -109,6 +109,17 @@ reset_controller: reset-controller@e001d100 {
 			clocks = <&clk32k 0>;
 		};
 
+		shdwc: poweroff@e001d200 {
+			compatible = "microchip,sama7d65-shdwc", "microchip,sama7g5-shdwc", "syscon";
+			reg = <0xe001d200 0x20>;
+			clocks = <&clk32k 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			atmel,wakeup-rtc-timer;
+			atmel,wakeup-rtt-timer;
+			status = "disabled";
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
-- 
2.43.0


