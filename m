Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A08E81BD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3g5o+E0WFL3obDzGGRCqcl1rSO7KKl3sh7z8nGhRozg=; b=Qi/Sq04VKqgP3SQnctPIT7BD3u
	SaKVJRjoIU6GyI2dTwu5f4xjj5GEx7bjtZGRlEy03qke4Pv5UgSqwquOKGtKFsx1yYWGIIviOC2vK
	crgSn7YnCvUIIfpdq+V1iVsEKUwTrZd22UMkOYM5pGjOI6e0MOG3bcvCZ78wpkQMWQbrXXVCoOLcf
	zuFfR0GTB8gTaI/dCtKzxyrujsa/oah5UujXXsgQNlB3CYiXCeMafMngxS3LkEteBm+14RAbR0ELP
	50u5Q9Y3H2L0tAx63PaH0mXO+Y9FRpbp3og3Xd84IK8+pWvNBLGVk51hVyu6bDnzY26WyQCauUNPz
	/H7eX3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTXY-0000000Fdm9-07Dx;
	Mon, 09 Feb 2026 15:51:08 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTXS-0000000Fdkh-2Opt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:51:06 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3g5o+E0WFL3obDzGGRCqcl1rSO7KKl3sh7z8nGhRozg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770652245;
 b=Fhz+x16lB6m/oUT59Qt4mf4/W3CapBN2vhxWMn5pUj2pNgQW3tNXknID/ODS8FwQhQJYE4qU
 pRsvvMW/NBS6waxWotpfQZUI/++s44z9An4Za3sqFNB2LniAxXLBkB2qmW+VitrX4igwy2gax9X
 X2fiJF0+Wrv/hE3mUqLt5pmec92yQNw8gAgdzJt68iLFrc5dLqRr6uIrqFCYiKMQIOLG2HPyKBy
 bVyInURwGj37MKASbtAzIU3L1H6FZU0Eu1sqpv/OSUcgkNJDUewvFOjUaNpyIdWk0Cx6oCakZu/
 uPNM7385wkxkKssRaK3OSTrxO63Wx0jzDmYPbg1QGfvPg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770652245;
 b=dSsWYWw9jfJMSzLlrvsNCVYA1InIBLWtfz5F5a4QzzNh/rL/RGwM+iRBxy86gvlbMJuv9RzL
 wRnyjttVxFeTRuH4ARtC0oxK5nN9DYa3o2WhFy1YXL8eiAUIf77PCNNbGnOkaus51/h2lDUMR5o
 Hn0yk1zWCeNl66qyfP5WB3CWK1uxLCXn/P9eXIQTEe+wWQDeu2XfleViK7oh+JicnlNQUCCDt9P
 rqDbPxiAp43XGXt17R8KWsNby/Ijl9Qivpi2czbBhNBQEBD0VonXWcyFtFoMN47f7lvInWbb5EV
 O7fIsurTDrAkr7UPrU1+6+TWCBHZitJakaQihQkg/FDhA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 09 Feb 2026 16:50:44 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ECFAFCC0D37;
	Mon,  9 Feb 2026 16:50:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx91-tqma9131: improve eMMC pad configuration
Date: Mon,  9 Feb 2026 16:50:13 +0100
Message-ID: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f8q0M5Frgz2nJ5t
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 71fe5ffff8ee5df7b92405f7a7f4c441
X-cloud-security: scantime:1.844
DKIM-Signature: a=rsa-sha256;
 bh=3g5o+E0WFL3obDzGGRCqcl1rSO7KKl3sh7z8nGhRozg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770652244; v=1;
 b=lMv28HASLbyD9LcaJVEC4CZ/ox/UHUR04G84wuC4vHXZWOKoUPJs+hyXpJvFhyDu+72txXeJ
 c20twh4cCtIFcd+KxI06Pw3CT9oMJHX7u9aUFN4ojbtM/CQ1YQzEyog9YZ9xbVucKxVoUREWrGt
 ns1hHyXlz50RwIUySpoJZlyAGi0QDNL9JrikJI2v4cSYFuRpbMAu+RqlXIK0G0xyOtEQ4vrJJ6p
 St77sDrR4fZgrVoWosxcaGB01qTAmGa1opB9uBYCa72uf5bCp//nVimhncDVDhKcEIisPsYZBeW
 4BOChPMSigtmTrHZMeYj7aZVJrkE4pbwtckfuGVZ0Btww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_075103_118705_8DD95B0A 
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
This improves stability and detection at low temperatures under -25°C.

Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx91-tqma9131.dtsi    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
index 5792952b7a8e1..c99d7bc168483 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
@@ -272,20 +272,20 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 	/* enable SION for data and cmd pad due to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = /* PD | FSEL 3 | DSE X5 */
-			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x5be>,
+			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x59e>,
 			   /* HYS | FSEL 0 | no drive */
 			   <MX91_PAD_SD1_STROBE__USDHC1_STROBE		0x1000>,
 			   /* HYS | FSEL 3 | X5 */
-			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x400011be>,
+			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x4000139e>,
 			   /* HYS | FSEL 3 | X4 */
-			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000119e>,
-			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000119e>,
-			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000119e>,
-			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000119e>,
-			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000119e>,
-			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000119e>,
-			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000119e>,
-			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000119e>;
+			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000139e>,
+			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000139e>,
+			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000139e>,
+			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000139e>,
+			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000139e>,
+			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000139e>,
+			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000139e>,
+			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000139e>;
 	};
 
 	pinctrl_wdog: wdoggrp {
-- 
2.43.0


