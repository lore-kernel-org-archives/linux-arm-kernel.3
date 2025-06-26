Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746F0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Op03+qucqVF+nZEGn/AJUKWrnarNtLlz6bXQbzmKHKo=; b=DS9s3G2lL8ZA6cddkaXeo1mutS
	y16WRscnLb0ExUUSTkGtQ4oIbNiofEiamM4LfSFh2pdiCbZLz3q9AGFOQ4cI8n5vCKpCFkyBc+U6k
	zZRTsIWHIGE+Nr3vvFj5GCuAmH1QCG05tA63VAuOPQBDFNOTfVAjVcW7mgLnCHDbtSyu0AlX/Qr+t
	LnqEHc7hG2ADE1Cq8jNKJCpyoWNbYVxeWe1+4zsHpiw/ht3ewjhK4Pj1pmmpkxO7xNnRygGrzkR94
	qlQubdTvj5K1/9EPCJpjslnNgpYhAhtZWp48UwJ/i7woaMrqsBA/GCe37IqCiMzvg3WUxFjFBC99Z
	xmvMjEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgt5-0000000AnP6-0IS0;
	Thu, 26 Jun 2025 07:19:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgqp-0000000AnLj-0zGg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 07:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Op03+qucqVF+nZEGn/AJUKWrnarNtLlz6bXQbzmKHKo=; b=htGq4WysG+Z57EMyORyov5BGja
	RnE1WHx54SMxxZ+svspJbznzEqXr/3hcBuA6s/ZZ7U3iG1fTlHkQmpYffPYtSeKDxI0amBjxfA0sV
	ER/U6GGoAlAt7r5U92QKkapB0KHTOvXUZI7BZloTHHdHpAi7LaG+LKfKdLZNUAOHRHLSwB1CsveKa
	npLwLwL8pgDuLSejMtKjHvtqpI1qOQ9tgUkB95D1fF8XW2k6BpjtNlvXMD8O9oATUR5K8yQ9UTUnm
	NELp+4XJekeDV6JWCU2AElMbjjiLvYiiGFfMFRnY4UsiVLy1ksbIgtB6TaLjhG75F20K9QgiA8QcE
	WFFuphXw==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUgql-000000063DD-20QT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Op03+qucqVF+nZEGn/AJUKWrnarNtLlz6bXQbzmKHKo=; b=WDgrXAck+b+Fb89P+1pfJvOa7o
	hkmcyJOlDNvaik2y7zg4BIznyeoU9Q/YtKp2tiFkrZ4F4K5NjBZy/g35m4TcKR3yTQ1lncUjCc3Ht
	8U44m50bQiR7evULsQRTR3QdY7cQJZcLTcFveMPQV7z9DqZTRxV6b6QDTd2t3O2UpHd96SplZ5jnM
	gLM9oHvNOaat6fwSKMVV+tl0nj39o9WKEJ9nq3ZP52FekEmiRyY0ns5Vm0d82dJKI1guYi//iIuXh
	hgyTd9n2oX5IfLy4I+SwCPtX8KCrhidrJbpKiD7TqIQs3SnA+jg/NYn7wYiqNrrDO1GQKbVKbTugO
	PYucaynw==;
Received: from [89.212.21.243] (port=34404 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uUgqU-00D1LJ-2V;
	Thu, 26 Jun 2025 09:16:29 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Add watchdog ext-reset-output pin
Date: Thu, 26 Jun 2025 09:16:29 +0200
Message-Id: <20250626071629.3380656-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_081647_818489_09E70814 
X-CRM114-Status: UNSURE (   6.46  )
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

On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
"fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
timeout/reset.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit title as suggested by Frank Li in v1

Link to v1: https://lore.kernel.org/all/20250624061323.601550-1-primoz.fiser@norik.com/

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 5ee52774e7bf..729c26f9ac94 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -191,6 +191,9 @@ &usdhc1 {
 
 /* Watchdog */
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
@@ -279,4 +282,10 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };
-- 
2.34.1


