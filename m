Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E72DCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIHYskvP8VSvRHENjIMEdQwjTB317CBpXTXbYN9IRW0=; b=w1yh40p8lHYAfyazR18lOfQvBn
	4pSLLTCXXdBcMeLKWpfxukWDNHxgXH1QY9vPhbuc2o4K/TZSp+982fXe7tdS4WVhBM3z271OvNeBC
	WTNel3Se6L008AJIFnFgpVANcPvSTPbjccR5syB2Jrf5nPUOPKQJOcOgEPH9j7UGXqFeqPPnyBFsG
	bypkxtrIOAe6T7WW9Gd+wEDkccm2xE5fZcBX5vcz7DCb6E+DoW2R587UC8p4/gJ/9ob9h4wFkGx4D
	zb9bCRuerNaTBtXcME7Qb4UqI7FKyYqsJ6DNMr68BBLV51QxmRWewvWy7QY9zvcotbke5j3skexZS
	ZxssMrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9z4-0000000FNDv-3pYq;
	Tue, 05 May 2026 07:14:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9z0-0000000FNBM-3iVS;
	Tue, 05 May 2026 07:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965259; x=1809501259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+KadcvScSKGv3ThZbpA/Nsde6IP5qiJ0PzpEgUw6lcE=;
  b=K/wyimw20fY0fhHVnL0RN5LXpxHg+Toqn9bA4DoxrfhdW5qeZq17E84D
   G8Ay0elE4jQBt4l2sy4Utq57t8+nTWHYmPFId6l6fdrI/8JLJ3OQSvKwY
   PxzjXAyab41B96FJMsUlXoG0M1j6JaklOKLPREfaMYrjd5lBuv8Zx4J3B
   5h80SolA4vtSEsDAe3XNfilEpzLWq+wf/az6p0HcwPXZHvtci+l0EyHk1
   BS9jCJO26VkYLyWO5xccKAGg77FfpX26Ks189cvUsOUzrvxx4ST1Z0gD2
   2QnphRb6NKkJ+6nrPh/oj/nyqOaCkIVRwF/ml/BrCnEygz+L8HuDstEyy
   Q==;
X-CSE-ConnectionGUID: d4U2RWaYRAOYXRxYhCYvWw==
X-CSE-MsgGUID: l1sYbEcAQ5aMr6rmAZ0ZVw==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="57457017"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 May 2026 00:14:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 5 May 2026 00:14:17 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:14:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v5 4/5] ARM: dts: microchip: add I3C controller
Date: Tue, 5 May 2026 12:43:26 +0530
Message-ID: <20260505071327.125787-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505071327.125787-1-manikandan.m@microchip.com>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_001419_033236_28920C75 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Remove clock-names property as driver enables the clk in bulk
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 67253bbc08df..ec200848c153 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1


