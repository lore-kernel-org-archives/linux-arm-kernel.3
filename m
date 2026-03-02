Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE52D58E7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8KixDfsRAE0QkCkrj6ecFMAb3wezNZ0IVq81F5Gw8I=; b=S+1LRJh35+6vO/IPVYa/Pc2aO3
	+R77s7TJ3lyIxf2kXxmE4pcE1Y1WCMErcOd17zYbXwBljyX8ItEsY05bEy0ddyGEj/nG9aVLYmJSq
	FA+I1TPcK/gASnoYpz8VJi4mZamY2ONKA6nesfhyxD4cEOp+H9JYilH65S1P07v5qKdo962pglYwN
	RcJDPqbFmWABq9MhX1fd5I/6N7TbFF8xC6duO5N+vRk9yZD1JjDXwvYWFMrLpzM9haYd1lDVxEWmq
	zVNhogwKPFiF0OlrM/JxAKwmi6ToB20YUWXTMvGWS9XskKwZI89I0IVOjM3l8A2a2Rov2mPH/oqjG
	dcwSCCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyvZ-0000000CXqR-39bq;
	Mon, 02 Mar 2026 08:46:57 +0000
Received: from mx-relay10-hz2.antispameurope.com ([83.246.65.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyvV-0000000CXpq-1may
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:46:56 +0000
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=S8KixDfsRAE0QkCkrj6ecFMAb3wezNZ0IVq81F5Gw8I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772441197;
 b=Fbdu0uTbfXrfcipCfRJ0csGDywdrZYbKxthIXGJLobj4zFZZNlM15jF4wDH3ACX/udBe4l20
 u5ZNyXFjTBa020wAqkkp9ZXLC3ZQyds/Q8FfWeOowJhFdA+cSTarw7RkeJTKi8hTaVpxdRWYWBj
 9IWtFyqPUfL32DqiaKzLUmM++08M/PylbUzMxVhC9CajSIBl91aAvrvXlgSfZIaJQho69sowU/2
 M0LBRcTEUAxHTpyNdVrmyu8uGbRRu9GAZgCRd0mpBSJhsZZBnpLA0bfoFg9MFz6IvbXn3sHeKa1
 e7X1FFIONSWvuRezntG6PvF3iFSzlHdImvs9Kd2CwBpKg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772441197;
 b=eXmsVk6y3NZN0adNG6NbeReNmkySBANkrEK8+sW47WRieXLKpCDmwD/5RX/qLAxOlv41J2hR
 UZMVmXaE94uh6tZaGvPj/xK1qftyXn8Yr8OBApM2jxF38kUE9efu6sOz3fBDq+byRMjo3KgPKaG
 7SYYdcN2J/j/nd+abN7XMsOSm6TjrnBszrPB9fFaXwCwYELZP6IWwg/T7fUcNRqsmCpKfqMWnsn
 SjXDKZeKF/a5P4ckOZ+g6y7xTN3riqM8HEJC3HiZzgr2Qa/MNoSSpUlj1G8tN7QnNntp3l+sdky
 5fR66Bl5UaWMLiTzlkbivAV7ucBruGKeVeV7iDhUw2UfA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Mon, 02 Mar 2026 09:46:37 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4311E220F0C;
	Mon,  2 Mar 2026 09:46:09 +0100 (CET)
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
Date: Mon,  2 Mar 2026 09:45:48 +0100
Message-ID: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: nora.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fPXb60bzBz4FL03
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 9d7a5410827e20c72befa8843b80a097
X-cloud-security: scantime:3.725
DKIM-Signature: a=rsa-sha256;
 bh=S8KixDfsRAE0QkCkrj6ecFMAb3wezNZ0IVq81F5Gw8I=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772441196; v=1;
 b=a55+2sfqLJoiAevN8RmzdY/SrWHrDRaAfHsVgr59vd+2BE7Ic53B+eWvj5Mm/ajcvhpfFZCI
 Q2+2FX9hdQroJ6TQTmbTkwmRBxNI2K2eCrUtB25Btv71Gz2v6O1xQzOXGQH/SaZKvEg80jirwAf
 hxHvPgrmNPCJsbuqZDCsbhLLQLkcCP5SNYMQsWQ6bebMe0wGCmfbf6N4MXczj/JN1D5Nbd9VlNF
 X8NTEWEkJlraU1S7fvPB9sN9V4VuzWD5PSCMHjBIDJfSaepCa65+bchLJcMwIRLvlCet75nayYm
 MANCLWwTuT+zh/uY81+P48IMxk0rAinNDyMQUYvkSyvlA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004653_724293_54D2A1ED 
X-CRM114-Status: GOOD (  12.80  )
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

UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
configured using the DTE pinmux setting.

Correct the pinmux to match DCE mode. Switching the RTS and CTS signals
is fine for this board, as UART1 is routed to a pin header. Existing
functionality is unaffected, as RTS/CTS could never have worked with
the incorrect pinmux.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: updated commit message based on suggestion by Frank Li


 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index b7f69c92b7748..1665a5030b993 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
 			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
-			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
-			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
+			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
+			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
 	};
 
 	pinctrl_uart1_gpio: uart1gpiogrp {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


