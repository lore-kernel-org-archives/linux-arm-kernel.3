Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995B8C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft8YWyAEcHJga5I+LsUcuaU713xF64BhZTxjt+6yxwU=; b=wQQs/dxbMMD13RqftpbPKzAhAm
	Q/gpTyuM6gLv9fXI9Z/NCe3DzEWrrf7IdM95/p1y//va3n5g2XOd8uIDk4C/QVbqsrN0zz+3JuIvq
	YEAzXwUVdVadxymM9nJd1UhySTUGVfaL+qYEUzbHj97I8s4Sm4KS0QKpStIouJfyRDUboSj+8Ohdh
	kcg+mYMrsKWXE4JzFxHotZu9Ti+2p2eBRIzaIq7t2JOHHEqZe82+79tii+VkikR4VR6VpoM2Q4mUe
	cHqzckWCsZN1/a0BiZUoZ8ZTDop5ISFLRhJO+QnRNe/DmbGhRk9ThZru7iNZeaSrK6z70yJfiag0b
	cvnoby3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDRl-00000001j2l-3m6g;
	Tue, 04 Aug 2026 11:36:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDRj-00000001j1h-2dS9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785843395; x=1817379395;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ytkQl2qucpM7xa0UdkODTCkBUd467sNXQVdKVB1xcag=;
  b=konyeQfSWd4MNsMXlfoq/t2vfsVRja9FTOJjhf/85od8PW2Az3aTXVeG
   N8fTgK5mDAaExPABxiE47WpfFCpfCxVEh0FoeGTcpr5wys5QNdJdySRiW
   +O2L9vwNk3tL+Myh5yfIV7Ssr93gkWyVH9OexvQESX9mGo1LaZKuG2xCL
   8GVFeevP8bg+lG6O+F1xOVMe6KY1nrzJRS98DMXiHZqApB0qVBGarulA3
   6rw1Mo6UWH9jvKD3TGeWoOhuQBmgvy1uMQMrpmBkkT5Mbm9SMgSONL+Gc
   SmRJJYXmCyh3/4dBi7ojE5ackK4MYs52WJdTn0oj3jVECcM2VTpAEGm73
   w==;
X-CSE-ConnectionGUID: +Eg+lPfRSQmGrmY2j3vnew==
X-CSE-MsgGUID: UOGQzfCSQkGMApPuGdpeaQ==
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="61934900"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:36:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 4 Aug 2026 04:36:34 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 4 Aug 2026 04:36:23 -0700
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
Subject: [PATCH v5 15/17] ARM: dts: microchip: sama7d65: add cells for temperature calibration
Date: Tue, 4 Aug 2026 17:03:36 +0530
Message-ID: <20260804113338.261782-16-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804113338.261782-1-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043635_723837_D27FD6AD 
X-CRM114-Status: UNSURE (   9.59  )
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


