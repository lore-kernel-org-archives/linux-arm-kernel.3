Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049C3EFD238
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ANOrIzf22DYFST/OGsWrBLVKkhNoHDH6p+6DszzjdIE=; b=fQ8rurCrD2G6kSDHSI7aNSZrBO
	mpHyIV1KWOPExc06Fn21laJXYp8ZfjtQDTuPDa8bNdul93asDt9UDHezQMr+FaxZ1Zf49tGmE/c9K
	ufOrOpCKP4Nu61L6dPUemP1gmtSah0/0kasXsndA+gMksyx1GjxDfXsgelDeBVHBvJ5JyCvKAiPNW
	2wNzKLooVZqS1IkRIWqelNBpXT7Aj61X9pDKdnYtDXGQL8EPE6/6ps35RXAfbsxAKcge7gM4VmhMj
	JM3ZYGIKJqomCIGeUxCixD/WbpfeCZbLyFJ6GgnPn9XYr2uMy1hR7We0b2jLT6MQTHgyZUcSWfXeL
	3mHCd6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBWG-00000003iu3-3bH6;
	Wed, 25 Feb 2026 09:49:24 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBWC-00000003itf-430r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:49:24 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ANOrIzf22DYFST/OGsWrBLVKkhNoHDH6p+6DszzjdIE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772008520;
 b=HllywRJVnXgcxWW/thrScn30qrka7ankUro8LbTUKln4qgaVBTmC8DxQC21ncLngZ9r+pijd
 nZxxLbWlaC3O/+y8KOHSkcdrer5NY77P2GAeXzDuCWWaf0MOlAcRSed9y8GJpmOJxSFfbxUyIO3
 usoTTiwUYPiPEH1QRJT3YIAzfImylFTntYcAn8EYk0vrWaMWBtkOd+H/7Yg0ld4/Ik3PwSGH2eL
 zkhsYTBa5o4q4fSxZIuQt2oi2bOl77gSBk9l6sS9cQaqwhd7H3LWW4TMDPMwFsfFqUPKHDqzJ1A
 P33xYxteibLDWjPVp7gS6OlGjXJ7ruHJ2gTAyceJZmElQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772008520;
 b=CTKBjgh9c36lUI+KD1vMiq4KzAdq6J2OVI7+TRw2iRkWpQX3U/KsWNjpvMCd5aAYdxwHLVyO
 MIVBZth9SODfjrSW73+hUe/Vza0D2/OEYkvoe4BZohhgjBFpcMFFWpHzbVAkHDyU2N1J27JJh1q
 DEszvBy1UINVVw3GXR3Sj0KdruvjIkfZ/im/O/13zgT7FmBVRL4P0ICoKTEqga1nZAItzfVleXZ
 UcBfdObUltNwy/+Rwax9/c9n7yHn/8Ss6iSR2sK/A9b3Q99J7wMLOXxfiwmfUa/XNqEaLSA8FM9
 hYAI2bvHZx/+GjkB5+/3Ea5oEYlXVrYHEU7ce90/4HXmQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Wed, 25 Feb 2026 09:35:19 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 59917CC0D25;
	Wed, 25 Feb 2026 09:35:04 +0100 (CET)
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
Subject: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
Date: Wed, 25 Feb 2026 09:34:18 +0100
Message-ID: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fLSZd0gYQzWygV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1e9880415023cc401d11ce049b439fb1
X-cloud-security: scantime:1.897
DKIM-Signature: a=rsa-sha256;
 bh=ANOrIzf22DYFST/OGsWrBLVKkhNoHDH6p+6DszzjdIE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772008519; v=1;
 b=KEXGlZ3pE3iEJJmwiBKK2jAe+ICd6eAleaEZZ7d3l9M647HBvqHPNSTCv5iETchLt6j2SsM6
 k6SmnEdxC9HmlYwZkNYVdsLfQ2TvYlRPqOHo4fCcE1ZwmeaBtLoJj8ACNR8Ji3Q/OfZymyIfEcF
 QwKM6b5cby/NHx3rmzyH7lBbzbo4K9qNVjeOOC7sErU15P1/guuCgmkiMvz4tMtuViU09YZunu0
 +r8/84VEc3nB1wunPfcDOCzsjWhkyYygtJa+on2g738Wyol6YEFjRJqxxljr4ueV9md+D5FzgUW
 oYutdfqwNxwtwuU112q4jhof53ge4Pvyoi2oPePnoyz/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_014921_259860_808964A8 
X-CRM114-Status: GOOD (  12.22  )
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

The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work.
Consistently use DCE mode.

This switches the RTS and CTS pins, which is fine for this board, as
UART1 is routed to a pin header.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
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


