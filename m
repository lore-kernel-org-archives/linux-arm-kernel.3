Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05B7C531FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVNtYA9QYyCyxJhprnVzLPW9iVvkaqf7WAZnQ/Wheq4=; b=BEtzFfuJuTu+//i1s0otBMzFxq
	bN3SgHYOm0XCcg3MRuMQyq6Bzf1joZpLaPt0QROpC0y62cfDFPO5Zc/Xg4mlGQ8PGXRddp02EQ6c8
	ieWbolJj425F5l4CuX7xmdYceSfDPko6xMT6/OFEbjCb5lc4aKpjG91AhZB5nez6cyq0YZLaiOsGr
	xO+r2uWBszn8jEnGamYai/s81IOJGbPqW21obXf0VTFAB82qMndDZA2twZwjrV/cgNe8rvOe7VGS1
	EzmM21Aox/pf2fzuZn1FMhJARTGETSarssMxeLRxRthYSQA++6a5ohnUhou/ffMU5rPpkpnURMiNa
	JMVRSieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsW-0000000E5nC-16hp;
	Fri, 20 Feb 2026 10:36:56 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsS-0000000E5hs-13t8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:36:53 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVNtYA9QYyCyxJhprnVzLPW9iVvkaqf7WAZnQ/Wheq4=;
	b=sAsj1GdNA83T0bXSX7w/pf3Twi+bsk9hg1RhyEdAnGn9c1QhX5bTxY6Tl4wrFPOMQRbra5
	MHrQFY4BI2HV4aguAQESQ9jGPA/7z5h7/ElqzXAtQZ/UOzfU2ImPeTSAOX7viYuLYsO3OF
	pOFH/205YOoFN6xO+8jfOB6/oSNSjubfY9PJUlVJGD5z41lQEg4NKL1gJGd+ehOsgugX23
	hKc7ju6ZuXcvD85TXmxoNh/UbEs3dPsxVDry+zZXAK+wQoU9sk9kfT1d4mCbTEXz+5leYP
	DCPGAo1866nXojAJcmI6xLuaiaZzKTq4m+J6r9lWn0+CfaTulQD3eKMfqxR5xQ==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
Date: Fri, 20 Feb 2026 11:36:19 +0100
Message-ID: <20260220103636.9697-5-frieder@fris.de>
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_023652_441515_10EFDEAF 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To make the code more readable, use the macros for the GPIO and IRQ
settings.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 7131e9a499ae1..41a2bb74f1565 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -7,6 +7,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "imx8mp-pinfunc.h"
 
 &{/} {
@@ -80,11 +81,11 @@ touchscreen@5d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <6 8>;
-		irq-gpios = <&gpio1 6 0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&reg_vcc_panel>;
 		VDDIO-supply = <&reg_vcc_panel>;
-		reset-gpios = <&gpio1 7 0>;
+		reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.52.0


