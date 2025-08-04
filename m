Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47533C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3aOdYUexBGbOJykOZL7lgQJYbiSOshNG7yZBggHwiU=; b=t/2jBKqk1QEyUK1uP4r84npi4c
	LCiDQxjHZPdbqaWQMacw8zN4l1fkqscbcbXAfXz6nSVolpwh9/ysIXLR/kqJJsRYLi9HWtHY1rPMm
	Hl5LJxJOQA2pB0wFS6p2OXOY10fg99uwkpYdQs1TOBvC5py+v08KHLt+GPA1cG5Z1EWjZJKeZ0c8K
	U2Unbs29PF1GF5lFkyxMJsXSEVdqtvfx/JTtwQq27AJfK3whIt4kLO4DjzAgzQ0LBEoOtZDg6JO+T
	mUrZbSUh+NOjiPGX0PKOfTiwpZfrRlUD3UI6W5F/nx0gTyIJRxNhdNMfDYzzlumAHq7LF4qsR5D0R
	iSiQ+nNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisbO-0000000ACXW-2LWO;
	Mon, 04 Aug 2025 10:39:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis34-0000000A921-3PBF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301846; x=1785837846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mijv1aZVie6s80Qf3VFPYS2QkPCgAnCI/m/Zfv+EXmE=;
  b=fIEOAiO0FRBXzRINd4UF590WWzuE6abHUwm64sP+6cb3+Pt9wVv6z3q/
   qEEKaPEKgf3aylprsppiilaCb7LJTXGK99e1GWCVQWgOBRzUtFtGEnbY+
   KnF/SuxA9ULDKgwrz/3tvZccBK9RB507xIgLv04E7oDMnNfmo4okZbht7
   WZoN35jRt/5hh7Qv9HnzXmlsJ9l8Cp55w43lIIZduCNsieLhXJaYMcgyL
   QE0ULlSbg8t5VwtOKwKOsbic/dmPsWgVwOI1TMf6zKVrtQN8KJMzDcP82
   K9X9QKhCDwed2TJKg+/VmVfPiUI+Boo3Jyj62KLDUi78lCjLzA8ukzv4o
   g==;
X-CSE-ConnectionGUID: +866aF0tQ+SVcfcIeqWRcg==
X-CSE-MsgGUID: tLRJaqVOQH28qBNXOUi4Lg==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245552"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:04:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:51 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:45 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 13/15] ARM: dts: microchip: sama7d65: add cells for temperature calibration
Date: Mon, 4 Aug 2025 15:32:17 +0530
Message-ID: <20250804100219.63325-14-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030406_921244_AD521C70 
X-CRM114-Status: UNSURE (   9.33  )
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

Add NVMEM cell to ADC for temperature calibration data.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 1d3708c76202..5d1f6684f64f 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -226,6 +226,8 @@ adc: adc@e1000000 {
 			atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
 			atmel,startup-time-ms = <4>;
 			#io-channel-cells = <1>;
+			nvmem-cells = <&temperature_calib>;
+			nvmem-cell-names = "temperature_calib";
 			status = "disabled";
 		};
 
-- 
2.34.1


