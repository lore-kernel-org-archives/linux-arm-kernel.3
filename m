Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41280112583A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyxOCOREEZhu7FyrjZh7UOjZ2zrzUppYbjhxwg2uC4A=; b=fSeYDwi1yhrdq2qQqiZJ4XZQG0
	cdNhH0EKdak/Da7hUYMfVD2yZqs3Btm1+vRa52VHr+43qiVk13ts3XSmlWvXkbUA66YRpu677dJzX
	/vt6d0L9f15K8p/73/MZafXgzLweqKnTc7bcM8D4kROtR4pMaATUR4+r5j6Z3HPrexikjiy3jA0nv
	XEcegnNwOaEeSbjBeFmbkMhmq6y62HaIowHbvG+TrmgNeoHltDXSJjtzjET6aYf4cfZSAiA14M7MU
	19sgUuhu8nc3OqPH1SLYP42KjqQ+JSnmrTmGa78OMGmuj08moyA/WbBcMJWUtP7x1YztcrJQLqMA8
	bDoQiVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LP8-0000000Bo89-2SAE;
	Wed, 11 Mar 2026 15:23:22 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LP6-0000000Bo5d-2cyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DyxOCOREEZhu7FyrjZh7UOjZ2zrzUppYbjhxwg2uC4A=; b=OOUZLShQupzj3Rm6TleGsZH/nl
	nojdNYfIeBIRucvA0kRqCcenpuUv0Y4Ts+Ek5ZnUgXkSS15ywnAgzsY4s8n6TkwnqYi173aQ8l7Jg
	rrU+fKW5paypK/NgUZjjP0DZFEpG2g6ge4ph6TdN79LDQrzWEO7SiGSJiJGUWtY6IRGiJYj2zjbPI
	pbjLuZid3wU13QH8gAOyUBUZ9ZQpNtpUD9fWupZLMH3jvGMdobg6mfJpitA8Q8u12cNyz4+AP2Wac
	IeVvvgGU1WFenwDkvRHLJ4BLR+Pf3n6CqxiglJ+VbPQ74a96BTFQ4r/WFsnqWa5/bJZ+q2RM33HN7
	xpv29Faw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvI-0002JS-09;
	Wed, 11 Mar 2026 15:52:32 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvH-0005cY-1i;
	Wed, 11 Mar 2026 15:52:31 +0100
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
Subject: [PATCH 5/5] arm64: dts: imx8mm-tqma8mqml-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Wed, 11 Mar 2026 15:52:19 +0100
Message-ID: <20260311145222.1749655-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082320_673697_8B68CF56 
X-CRM114-Status: UNSURE (   9.80  )
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

There is no reason to override the board compatible in a an overlay,
remove it. While at it, update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
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


