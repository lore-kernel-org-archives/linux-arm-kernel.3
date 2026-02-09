Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D2E78D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ezsiAn/c7bEL/IVvfCIchsQ+x7INEITk5XV/w+FXJs=; b=bgfUtEO0hpadn4x6kYHZeRdcTz
	GNHWF5H1ioRkRkj7xcfAT/+D4d3tFU9MzlHmnTdW8XPhgfPOIlbQfO8xWOQUUwUd+Kn39t4wPB1X5
	ldtNi6hcffs5FB8g3wrZpuxR/9nG9dMJh4Hb62d5azDWkDSoRQIn86CyHzs6P2qJXsy2FkRTbOlNK
	hl3p5Al0DjWL5sSKeDONtbX60UbTp0LUVGvo/MHRHaDUKGlK8ONKtrLvtkxKDioULoCcQ99dVPhd8
	6izIkiniHz5PIU9buABD2OxEC80D9QF9OgAsr2e9Gidoq+xo21+Tzflt66mPk4+eczUWC/bwC2g4s
	veb3ZI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNFl-0000000F5cI-2j9a;
	Mon, 09 Feb 2026 09:08:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNFj-0000000F5bc-1TTm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770628097; x=1802164097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tJorA0fNCKm3BvR9HVxFu7GfXmHBPROs/lhg5ksDUYw=;
  b=jbEdpwJKnp1s4VMnr3yajxmFMMNJlUO/qA7AFSdixy/FqwW/nNvx0orq
   Fv+FgIcA9ppVd3Ct7Syz8U8zl61lzJ/69YMTW8e+2P8q7wm0tIrZEGbPi
   pGtGOCAQX5i/IkMLxDT50HghYEzHmS15A5LUErkQr3kbVZADXskeRrcsY
   wiTk59UIDYBr895/p/VGVWy3PEDF++C8kTtemwwmY8bZtMuFPuTiPJT8f
   Gv/Yl1GNgT2RzTTkH2k07qGqZHva+2Hna0b1zqOKfKpCf6/fxivCDaUOe
   G+PAStE5yG2PctplqKW8ZQds0Rtc5nq2UZYBN+YTQruJW5mQ5Q5oc/GYZ
   w==;
X-CSE-ConnectionGUID: 81ZPVNkQSz6nV3HsOCpGbA==
X-CSE-MsgGUID: 2cvv8S72RxCXiX09dmrrTA==
X-IronPort-AV: E=Sophos;i="6.21,281,1763449200"; 
   d="scan'208";a="284507848"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Feb 2026 02:08:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Feb 2026 02:07:47 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Feb 2026 02:07:44 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <varshini.rajendran@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB
Date: Mon, 9 Feb 2026 11:07:35 +0200
Message-ID: <20260209090735.2016-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_010819_504253_B8CDB3EE 
X-CRM114-Status: GOOD (  10.69  )
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

The pioB controller on the SAM9X7 SoC actually supports 27 GPIO lines.
The previous value of 26 was incorrect, leading to the last pin being
unavailable for use by the GPIO subsystem.
Update the #gpio-lines property to reflect
the correct hardware specification.

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201d..d242d7a934d0 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -1226,7 +1226,7 @@ pioB: gpio@fffff600 {
 				interrupt-controller;
 				#gpio-cells = <2>;
 				gpio-controller;
-				#gpio-lines = <26>;
+				#gpio-lines = <27>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 3>;
 			};
 

base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
-- 
2.53.0


