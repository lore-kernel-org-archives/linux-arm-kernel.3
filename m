Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD12E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ0sxb8pwA+FQS5pilDVHb1VPzHkkV3YHeXeQ6QgCVE=; b=PYmEA0d//NipM60KlCoeD15G+b
	KSbExhBbfDxbKHyPh08QjeNYTxZxstHRPnnVY8tp3Dii3OoPX6saPXhALsUCn01aScZ7tzZCPrZ8H
	V2bT4sI75rPCKNtZoy97bJdyQha/0EBGTIdGVOWCRGGzDTbCJhc8rJhyLCugYKX8mu3bKLh9/eCSQ
	+kVdquBcawzJFyTO78sDRXrzBvbubEwp/CG4Y6JR/lvrjL+9MIHbO3rz0zziXCdoCFetJRTfJfapY
	HbxOj4U1sl0u9ZeCOFjr7Hv4pRdmkxIAWC4rCIo87MDDPjo7YI5cRosVnbBipimrpjSmW9saa00+5
	aShg7yvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTXa-0000000Fdmo-0Mxu;
	Mon, 09 Feb 2026 15:51:10 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTXV-0000000Fdl4-4AEk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:51:07 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fZ0sxb8pwA+FQS5pilDVHb1VPzHkkV3YHeXeQ6QgCVE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770652247;
 b=MmKW0bE9fC2skAsR7kHP3YYtEmL6zCvcxyjZ7tXoXWgT5Sb2ZU9TrbuAOkc+QqWTsL5IkWFx
 TEA5RQMRTTdBRf74dHG6FNjcZVXJLw51N/DCSeg/4PrwSIrrDMtI+3IQ+bgUmOmwSF9/DS2SeNk
 8nAWivQJrtHdvaAnJ35KrKrV8bjNosrUPFKJezLZmW/FtMY6WqRT2RE4KXNN0bTlwHTx/NTOa07
 ulzNqwb41/ehIcR8LkqE4/SV5IjaV+7xzr0tHn9Ht/YwrOQ6EjdSUMmoa1m4MwKJ0PYiUZXM8nB
 hbxBQkO0fcHDpyKxKQAF83Bam8I6Dw1ZjxQo9MoIqceaA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770652247;
 b=Wq1vZjzzIQw4VqyAftrMsYGetWPj71AI55Vs3mRyIGg1c6x9phh67OvcQM6GcA/39DbgJPRY
 h8N4+a9vnFMB8BrB700U63WRZKEOiAMDWk1OYIdgKYgp9+HGQl2CV8myTa132mz6MhbT3aBXCr/
 N2ZuKhxUHRlyNiKqms9c8eL7VwdGkRoagbKLmDihf76dATZbtUQkDOua890f7XNO1Jkea7pGZos
 79+Jbjf5xq7meldmzPOKPvQoybNu9Wbc0VvvZNEUEheXAgM+JlQq9AiUDJ4KqnXvlSPoOhwej5j
 cdHaZVNGcHY8vF4UqEb2ISZUUYPQPGvgQMVXKbhH3TGgQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 09 Feb 2026 16:50:47 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8DCB6CC0CC4;
	Mon,  9 Feb 2026 16:50:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
Date: Mon,  9 Feb 2026 16:50:14 +0100
Message-ID: <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f8q0Q2HBTz2nJ8q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 69b280b034afb543f25d360d41efbc2e
X-cloud-security: scantime:1.821
DKIM-Signature: a=rsa-sha256;
 bh=fZ0sxb8pwA+FQS5pilDVHb1VPzHkkV3YHeXeQ6QgCVE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770652246; v=1;
 b=Y3ttuj1RwvbLYYnwS1uhSLqp8uHwHc69aSJatyZcPMMLYERQtQq42HYWdWT5nbn/LWH0bvpz
 sLwP8l7Tg/U+VV49xzZtLSOrMi43HilLtcYbtBBJwmv1Gmg2hbRyB3BoS22C0Q1agFHBL975HLr
 yHa5ZWf30MEfZ1XlWnp+7PRtr5pxGjUhfGdhlonPyBmQQl9NuVwRiUn15DQfiwOzzSY1OuCYAvt
 H+VhognzX2Iw8ATyiWM++MOow/wcvf8gfrYOEzyEJSqJad2A5qusR51NuyuNX/Qu3poOeKwIZRk
 fZtrvnM+8tBh9xa64kiPkIk3GeoHdI9K4Z5j2k1ncds8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_075106_330906_11B6E3FF 
X-CRM114-Status: GOOD (  11.38  )
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

Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad of USDHC")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 3a23e2eb9febe..ce34a296495c4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -271,21 +271,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
 	/* enable SION for data and cmd pad due to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			/* PD | FSEL 3 | DSE X5 */
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
+			/* PD | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
 			/* HYS | FSEL 0 | no drive */
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
-			/* HYS | FSEL 3 | X5 */
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
-			/* HYS | FSEL 3 | X4 */
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
 		>;
 	};
 
-- 
2.43.0


