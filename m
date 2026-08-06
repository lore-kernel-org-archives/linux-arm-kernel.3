Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C31C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft8YWyAEcHJga5I+LsUcuaU713xF64BhZTxjt+6yxwU=; b=2zfjFnW5w6jMclwpI5lW2hb49u
	j5YPsYFoupT1LycdvZQtFZxsVujpxs99oad8bKjz00+p3rB7UQ3e4oJRiviwGrHomGHLoT/qyeOhp
	dearGB32iuIKbHky9wclMgZLzy381nh0RNo9YnMbpwKY6pjApcB/JjLT1Ql/q+kdR1soMYLoKF/UV
	egJ5PR1zMq1TONBwdXKACElGQ30uszidV1RR5Ir9S5NeD6lWbeiL+w28CnMcsRPWzHjcW2C2xxtVO
	2UeSeeghWX/M/c8Pdv+GmwqXL8k8jXlaa7llSbdrRH7tY6QKUuJqgtMwGc4ObyrJ+fpUyxIPWFl+C
	SA06ZyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtmt-00000005Ibi-0Tdz;
	Thu, 06 Aug 2026 08:49:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtmq-00000005IaP-1knm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786006155; x=1817542155;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ytkQl2qucpM7xa0UdkODTCkBUd467sNXQVdKVB1xcag=;
  b=btFXYNKN//zcy3NjhYIyNdRNguOTvRAwuB5bWNyExTYie+ozErb+5P/E
   tUoM25U+n7QGK00OLhnsSoDdunP2Hqe1PSIs3reEptEaCvdEIvOR5XTdF
   0QYJ1TkxwxF+XQuecdtrf6P5YX1pRJtV/ZmJvXbovsMA+0Ciw9YfIkVsu
   s2dhbf9T3MKTGdrD2sZz+cZQ1rXxEmoCPLhW7bUB9N60o7ofjVgx+zpcx
   DYMWYyeRyvJ5K+TrU6T2+GU+qjkuB4YTT/gM73WZg5CEhsdJ6ZRnsC1j+
   0pdz52sX+70YJ3ffH+ZmL0EepRwthLqerNN2flVS2dp7jGQ/BI/OI3RH5
   g==;
X-CSE-ConnectionGUID: YydEj9LITdaDMnTonKM7Qg==
X-CSE-MsgGUID: NU0hnE9bRCWtZMFFZo4V6Q==
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="71343352"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:49:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 6 Aug 2026 01:49:11 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 6 Aug 2026 01:49:02 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
	<Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
	<mazziesaccount@gmail.com>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 15/17] ARM: dts: microchip: sama7d65: add cells for temperature calibration
Date: Thu, 6 Aug 2026 13:10:22 +0530
Message-ID: <20260806074024.531259-16-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806074024.531259-1-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014912_470594_63561A41 
X-CRM114-Status: UNSURE (   8.94  )
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

Add nvmem-cells for temperature calibration data to the ADC node.
The calibration data is read from the OTPC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index aac2e22d96cb..a8b18ad0ef7f 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -318,6 +318,8 @@ adc: adc@e1000000 {
 			dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>;
 			dma-names = "rx";
 			#io-channel-cells = <1>;
+			nvmem-cells = <&temperature_calib>;
+			nvmem-cell-names = "temperature_calib";
 			atmel,min-sample-rate-hz = <200000>;
 			atmel,max-sample-rate-hz = <20000000>;
 			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


