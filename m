Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C751106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SD4ZfFc0U+ovNnLE79zYUzNXYPxhrEIHLwjX9URyuj4=; b=pZ3OghzvRV/ZaS0FqTOBsulGFp
	mny/aIv4+dVKdi/NutBNBkxZcQZuYJrtBtKr3mDY/Ys/OstS/omudLPyz0TRHlkfBRFqFnHcLgEEt
	dyhQsyDNWUHlvcJjF4QS55LYhE2HyclKXdwR8X1+2hIf8OizEKDvPULmbSIy/aLvRIrFiRTkYImha
	s047fqtTug7EWagCcjmBcaUeSk47T7/M2kkFJPELBKVpltAZ0EoRZHyqsiCFWAE6QsaXayYDcA9+W
	RsIErT1yNpOO6qxW3Vd+QtmpcoyvF7NyG6F/JxdnJihDdzU4uzFUWwM/AQcCWWXTv5/FLwzP9BDsa
	T/RSXUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXm-0000000GwzF-21FN;
	Fri, 13 Mar 2026 07:02:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXh-0000000GwwE-2Vvn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SD4ZfFc0U+ovNnLE79zYUzNXYPxhrEIHLwjX9URyuj4=; b=VnuYFHUEqMdfMbzOvSWsGVY/NZ
	L4OgpLBJOMS7uZd9rX3OY3vN3v5GOUncp4X3lOTTUlWalDfIN1TJ+YfGQrGVeEdPqE+7UdBcdy4xI
	SYl/OuQbvaRtCncqAkfVVYlTuWshljWboEuZCcG4RlMKX8OA0U9KPZqMMyiUZUvXRlvK6Vi79fdz5
	nMuTXu5mv4ON1hRCe1SAlWdpjtRE+GXP5dnrDLVuBcMiLws+PUPdBOCapGfj8e6hgHirKTP2Xy/Mu
	aNeFCicaBEl12T4ujAQ85k8Cuj3H3rCxjXBr6mQMVwxQ4xU6//rderUQznrZ1ClgesoO/ehAonLWp
	ZuO0zD4Q==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wXd-00000002iP1-0Pvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SD4ZfFc0U+ovNnLE79zYUzNXYPxhrEIHLwjX9URyuj4=; b=mjwnRb6MatU1gTeXn9qPggNb4e
	SWpP7IJnVyhkm3gr71/bBBVgsQRvTTlF5qxlkYPsACo66t+4+tKtbfav/3VHScfmWTpa2DPJtEZsN
	/vZZ/u8R0aiDan1cvABCniAHlDCh4c8yYvdRRbHcA+esbDsY51bA6tdoCYC0qDrLIHJuA6IwqQVIh
	OtIl8h1I1X8qWyOkiOsW+CyK37g88yY9fX8/W0e8A1R1aXCBj2+oQG9MLd/+WQlbeibILUz80OHuf
	fZlYlKUdkjzhzyBs5pYGcKaSWX+OGx6SdFuDMdvmP5RUkFeahMtSV8F6tXVzNybF4rTzJvpFXTsTZ
	92KDJkIg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXc-000BWu-0A;
	Fri, 13 Mar 2026 08:02:36 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXb-0005Xv-1k;
	Fri, 13 Mar 2026 08:02:35 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: imx8mm-tqma8mqml-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:24 +0100
Message-ID: <20260313070226.579939-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070237_299162_BBEAC52A 
X-CRM114-Status: GOOD (  10.22  )
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

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
index e44249c6d8a09..e5425653ea7ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	compatible = "tq,imx8mm-tqma8mqml-mba8mx", "tq,imx8mm-tqma8mqml", "fsl,imx8mm";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


