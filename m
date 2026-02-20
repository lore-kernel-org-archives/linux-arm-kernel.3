Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720B5C56202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99ZE7SYGvViA3Bdc/s5b6uYab0kctnMzOeoylTWBVgU=; b=A3H9e4rbi99Vnnk8yQEfq5Rj7i
	yR3rzw9fExCYnGVNMxL/MOqzY9QG73NX+VNK+Kmcg43wNskwz+y1Qwc+HGa3Xy/Jl2NRWflJpl6Ta
	PrgBo/CzocZRFPpzMIxqjl0pSTNvedWYPg8ua/C6ftVXGe6SLQDVnqkjPYr+V1aoaCmwgq8IlS4po
	+nROeYrj/xRjjdbb9vMDf+h2cgaVEcHcOy2QS7Ebv/MmUqWrRTTkWmyXajHGzlLPpk8bJxVGyxPWO
	WlHZHxgJuAzNWqOXIWNnVi48TG/xlt6A9cChsLDShgzIOQYsha7Q4sgpJr0znLCD0G1kbFHb9a5Fh
	I/DClRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXk-0000000Ep89-3pm7;
	Fri, 20 Feb 2026 14:31:44 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXe-0000000Ep0U-0YJ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:39 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=99ZE7SYGvViA3Bdc/s5b6uYab0kctnMzOeoylTWBVgU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597887;
 b=SmxclgK2qSpIUoPX5R49uRg2hbiXAsHPGZ3gSBopeGr/F7aCvrcND+4soHLsLRiL9W/OsAtt
 SQAuTsSfyhvkaGnhKRuWygpuw3qnARV6Hd0gjzBGvUf1ve2SMa/iu8elsWSJba0LZdFwg0wcZqY
 tQctoRjmgKkjJiiOrz1hn4GEwYo8VDUJAr04IJ8Kd1zQZ3Qp027ntzHi8jnnZembiaSbMRznyDf
 WnLNIAs01mKDNprOQSV5VSPmDVA1w8bdW6Gebpkb1/k9TmVxBUwZ3yiuRCPy00uCkka24gGF9HL
 G7b37468tY9JllphTeXx9SWlOUonbhNRCTPh8ypEYTiEw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597887;
 b=l1oIkyThFfF9kuFEq/Xil+iKzxT7yBKJihGAROTz/1V+MLA45ao3g6c0XonRBvZU2qCmzVVA
 e8qL0qfPZgU4ygBaj+aV0cLFYGa2qGZMljfJdWq6gAwstq9XjV1KCf0qvoA0Ra2SUw5SqX56nbi
 o1HaFanvYUblaXZILNrRC/BXFeeyGVD63AoTUUJccDVTzRD7xryY/4aKtz4urJ3pGRN7WMWUqB/
 +gwRjL5S0k4E+A6V+PwU7HdIFsaB/xRWfo0JwNES+S7P0H5QP3fI6d41TIqn49HpOd5z4vz5gql
 lVnMVfPfGiog8FbRIFMui/x8KKNGNbeavKQevFBYvK3dw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:27 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AFE04220DAE;
	Fri, 20 Feb 2026 15:31:11 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: mba6ulx: add boot phase properties
Date: Fri, 20 Feb 2026 15:31:04 +0100
Message-ID: <20260220143107.186956-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHXjr2Yjjz1kNt3v
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 783503c191e8dbba864f0297b7a7db60
X-cloud-security: scantime:1.857
DKIM-Signature: a=rsa-sha256;
 bh=99ZE7SYGvViA3Bdc/s5b6uYab0kctnMzOeoylTWBVgU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597887; v=1;
 b=m38Ye0PLcNdmePhhec0CcQ0htyO0C+BKLxpdjpXzfRypcYqPX9SpawLfvoiA1cY4IQkLu4Fa
 jKPjURAf/f2F5OavMvrIXijOnmk0MUy4tqhYkJSaaikwtaW/STW5JKnVFM/phISKy1Y8cgiMM7W
 OoOR+zDKN9BUsqr2ZiaKe6eYFpNwKzX/xtg95HyP5IDzV+V36JeI1YPGIX/pUdQQNYuTfQrYazJ
 GZccRDOU0KF+jO4V9hBaPHv0Uo6B4MpRzKIimDBVLFzsGJ4jC8MloqKru5mAcLZ4+iWWQOGG2LF
 yvhSvsaoTS8zLBpin/yF/7LtnfMH8DBZeAtTIl7uTUmug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063138_320924_F2D4C954 
X-CRM114-Status: GOOD (  10.55  )
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

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

MBa6ULx need regulator, SD-Card, UART and watchdog access during
boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 65fde4f52587..1fda60d62ffe 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -95,6 +95,7 @@ reg_mba6ul_3v3: regulator-mba6ul-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-pre-ram;
 	};
 
 	reg_mba6ul_5v0: regulator-mba6ul-5v0 {
@@ -336,6 +337,7 @@ &sai1 {
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -392,6 +394,7 @@ &usdhc1 {
 	no-1-8-v;
 	no-mmc;
 	no-sdio;
+	bootph-all;
 	status = "okay";
 };
 
@@ -399,6 +402,7 @@ &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog1>;
 	fsl,ext-reset-output;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -494,6 +498,7 @@ pinctrl_uart1: uart1grp {
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -542,6 +547,7 @@ MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x0001b099
 			/* CD */
 			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x0001b099
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhz-grp {
-- 
2.43.0


