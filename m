Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0180ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSkO+SAblxo65xQY7HUYugCLYQ6GKYpvPpD8mR1I6BI=; b=WTVIfXFPyriT3jsuCR3ZLbig/R
	riif6JPhT6Zhxd/dQHB+euKkNN3s1oFwN0FtSrFIJsa0DrUeXiahUmCA4WsT2tSJQu1bNKA40PVMe
	DLdL6W3YXquNh7h/fvlijke5RdbdNdo35V1qp4i+wvKhBo9Z5DXDtEiEhBdo6MsWAyWrtjruLcd/5
	Pg0nyhZVpeWNRKfU3TeuMojXbmOJPC5QFLD5D1WeMPSsrxWDueGPDrQ4lbP5jiG1ODtI//g3AYld1
	QTDRR21b/le2h+oLDpEbkF3P/nokfG6woK0KsGUam/Jo6sqryDwLMK7j96cSOC2ChfXx0dedvWmIK
	wj7HwYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6r-000000049B2-3iRd;
	Thu, 30 Oct 2025 12:50:33 +0000
Received: from mx-relay112-hz1.antispameurope.com ([94.100.132.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6i-0000000494K-0sMA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:25 +0000
ARC-Authentication-Results: i=1; mx-gate112-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=vSkO+SAblxo65xQY7HUYugCLYQ6GKYpvPpD8mR1I6BI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=Ddg5Kd5TMWKQ1UwoTPAQZ1tcjEU7aOXA4B1cFaSSQSJ6TD6OGtjnrxiz+WtLdOp0mCiRXBX4
 vsci20N+GZj84g9gEYPVlp306aH4R3pRjm5u1w/1Wco0vue9HqVOEGoJw+dMCDneW2VVSQ0GIRF
 BAhfxQH81SGbKxhUgjUjdvifoADsfOqJBCGJfRceM2JBZNaxXKWyRiFUtpBcL8cngo8oUUlJhTn
 oooQHnW7xB0sBfW0EungIjr0rXU7IfrtyotV7uFmQOuZ4jo0Gssj+fyFjVJbGvagLOMGsqgfklU
 o8u0ptqnJV5YwJMyk8kP4lKPYMAD5kIQ5ILESvW43wf0A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=CjL+c0qAYF+td9kepogzMpH4o2XSC4HVj4Fms9nQoYh7EVz0y8lW8WtkR68X10SKtWKM2PCN
 WqrCefJcLHmNENXAe5Y9oq/Hv/f99/Wt8C+MNG8a+v/SMPJDyWof0QZMjTaJnpNSepSr3ZE+Wft
 GHXas6zejVAc7kJYX/eVceCZvd/XDytAY2J3vz80VubRaDeV4t65res0ejtluxDR+NABlf2jBdZ
 A3YewhQhCD0tG+hknJHXBF/rqBC8QaocSFEPplkD/+LjF8HGMi2rIr6TwxV2GfB6gqihp0jdO4/
 wRzjr2dL6h7n9w69rSCLDFVtG75c2RTeyQ/xhxYOm5sSw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay112-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:11 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AEA39220D31;
	Thu, 30 Oct 2025 13:49:53 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/19] arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
Date: Thu, 30 Oct 2025 13:49:10 +0100
Message-ID: <20251030124936.1408152-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay112-hz1.antispameurope.com with 4cy3q62w4KzwRkZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 17f1ace8efd12130408b4857dfad62cb
X-cloud-security: scantime:2.238
DKIM-Signature: a=rsa-sha256;
 bh=vSkO+SAblxo65xQY7HUYugCLYQ6GKYpvPpD8mR1I6BI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828610; v=1;
 b=IXQ8OTXwar3TTb1bXhCCBG2jpJVDWaxxkUGS4/+QuFYy4taM2FUDp2PXuDtUwK+WtMb/4HRq
 a67QkR8EWRKCk5S+Wvu7me4N0GLNSschvZzlgx++epimEa1q8NECtctlqkDD5zY0Lxlj8q6nfNR
 Ycp7NkGquBLISij34afiT6feeITiVY2y3HzT6rg/uRUMkavvbKNe+sTXt+RNb6sBzD4/ekp/1HM
 FfZ7IU/MM8mhZyz8O/woC8wJbmk2N1aSmmCIBp2O4xOvYBr0MgCwT/c+8529x0EzNMnv7ayOGb7
 H4FDBFBKEdUbRRBv92e4p8Z3VyPsslGQqRlI65j2nVl/Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055024_385766_5CFE2E56 
X-CRM114-Status: GOOD (  11.28  )
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

Switch to fast slew rate.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 16c40d11d3b5d..52355a65a62da 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -497,12 +497,12 @@ pinctrl_flexcan3: flexcan3grp {
 	};
 
 	pinctrl_flexspi1: flexspi1grp {
-		fsl,pins = <IMX95_PAD_SD3_CLK__FLEXSPI1_A_SCLK		0x11e>,
-			   <IMX95_PAD_SD3_CMD__FLEXSPI1_A_SS0_B		0x11e>,
-			   <IMX95_PAD_SD3_DATA0__FLEXSPI1_A_DATA_BIT0	0x11e>,
-			   <IMX95_PAD_SD3_DATA1__FLEXSPI1_A_DATA_BIT1	0x11e>,
-			   <IMX95_PAD_SD3_DATA2__FLEXSPI1_A_DATA_BIT2	0x11e>,
-			   <IMX95_PAD_SD3_DATA3__FLEXSPI1_A_DATA_BIT3	0x11e>;
+		fsl,pins = <IMX95_PAD_SD3_CLK__FLEXSPI1_A_SCLK		0x19e>,
+			   <IMX95_PAD_SD3_CMD__FLEXSPI1_A_SS0_B		0x19e>,
+			   <IMX95_PAD_SD3_DATA0__FLEXSPI1_A_DATA_BIT0	0x19e>,
+			   <IMX95_PAD_SD3_DATA1__FLEXSPI1_A_DATA_BIT1	0x19e>,
+			   <IMX95_PAD_SD3_DATA2__FLEXSPI1_A_DATA_BIT2	0x19e>,
+			   <IMX95_PAD_SD3_DATA3__FLEXSPI1_A_DATA_BIT3	0x19e>;
 	};
 
 	pinctrl_gpio1: gpio1grp {
-- 
2.43.0


