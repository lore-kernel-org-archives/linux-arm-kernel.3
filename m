Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299B7112584D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWuktYYGFGWr7pyAiFwlIyxHt8j0hyF1IdPTFcAhi1g=; b=jLeo4UisTfRyV5+T0AHgBO8EUf
	7pPquYddjlhkrb3ug2QcRG49Rgj9ijEzjhDTBBKwBsVy+VNeyzd/eYVQDtuhXURKkPumkyTypcAye
	IJsldmMTcFdYYd7Rv+c35r3/zhp/8QPaN3wIUfPPG3z405G8PsVZxy0LUT6dG1dCdhuKyWisZ8RQJ
	jX/+tnF1HbhXPNBVQVd2zF9HVZz0m/QwxCosfBDkYjoaCPTTkb2JVnSpDz1s9/dP1gCF63OdrA619
	qg/hynkNcBSZ79Jyw8gsdLid+Oz92vGgjyseeIw9+9GMhCaQQgDsT84PUcCWyz0Gdcmma3XSXEu2k
	zQgVywoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOd-0000000BnlS-0G1q;
	Wed, 11 Mar 2026 15:22:51 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOa-0000000BnjK-1PJW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eWuktYYGFGWr7pyAiFwlIyxHt8j0hyF1IdPTFcAhi1g=; b=BPss/Iye/rk5X2qCDpusgy915Z
	EVpIePQgFbAicAZOP/BFmkvYp7ZQwGG1EInNl+6HIyVog8pwa6ioha1LyP0RPALDruYAyv13bg8h3
	26t6EUeIrWAnYX0E3Hy5Er9NTzW72vu8OMNzSDyNd2UU2MzZ3ke7kSQlOk4IRptEh31GJaB7zWIFp
	jEA/WXcH7HI8IhMYDvl13rTf1XhGDdY0x9FfjdOdJIAf8zkFQncBBr6eUlt4ReqtnuIkSXteIeKTc
	YJbQUIeWhdmHEibzwTX4Kb9gELlHrBebqsCqB1UMR8PS7ST8iRVP0Jh17r384Ts1ydNO3Io/94s6y
	OQTa/rVg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvH-0002J6-0Y;
	Wed, 11 Mar 2026 15:52:31 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvG-0005cY-2D;
	Wed, 11 Mar 2026 15:52:30 +0100
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
Subject: [PATCH 4/5] arm64: dts: imx8mn-tqma8mqnl-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Wed, 11 Mar 2026 15:52:18 +0100
Message-ID: <20260311145222.1749655-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082248_372494_026367F1 
X-CRM114-Status: GOOD (  10.09  )
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

There is no reason to override the board compatible in a an overlay,
remove it. While at it, update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
index 29235e390a5d7..0f4cf1855bf3a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
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
-	compatible = "tq,imx8mn-tqma8mqnl-mba8mx", "tq,imx8mn-tqma8mqnl", "fsl,imx8mn";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0


