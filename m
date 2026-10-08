Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C875ACA6002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf8C91/YkTRnGhfkIBW7/sOYo/dvYKzyIqnJrU16xfU=; b=cg+weuOTi6ImQiDb65Na65vEz9
	Okd5E0ILkl589cSTnA1J0/ytescfHiwkO5NpweXIsOjWHkzFR/1PcOx1psrhJFFDi4mWVbVzPOSGI
	qSk8e1byJi4eejVTn4eIUknM4qaiZGvj0SQWAT2KxQB2gLRaoV+np5zPDYb8yfLhNmDwAYr9s2pvz
	KxFcGPtCErqlXSlm7DH2zZLoCW620H8hbhk4UG9tn1D76x6qjkztJYPiATKbqKNyvY65HmzM2IfJR
	SmVFn92DxQ7JEivhesauILYTTGfJ7ERaj+PSH4cclsjbNRY/RFCtNFHxvVJXUsR3kN5Ow2fPm2G1g
	ouHdLjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgsO-00000003ZBz-3Ial;
	Thu, 08 Oct 2026 05:41:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgsO-00000003ZBe-0zmD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Oct 2026 05:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Qf8C91/YkTRnGhfkIBW7/sOYo/dvYKzyIqnJrU16xfU=; b=WQbsF3P/uyIxn5YdDfSKoS9z6m
	4WrB+rVzUwr2pvSENW6IJGnro4/Ic5Gwsjsl8y2NuRx4qUoCSvFE2sGPrEa1EhyJVKfm4q6WW/Lk/
	kfyWUpAf/TPrE0kfAHk8qwF6i922osShlyo5YR2gsiOLeuCClh9aK1oI5ykTCBpRpbZPWs/Bc+pH+
	4YUoLvVXh7tKkEhFl3oOiV7ADMTfWtQS31un14iX8JeQqj4nYJ9+cPrOGErc1N1i5w+ueOq56wYME
	E0GotiJluL+g6izOcHWSPdXe05k3sN7vijcGja9GfuKVfcVTU0nI0QbxFSwWCvNZaurdLtTIs/Sn3
	CKemtOsg==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgsK-00000005g1w-2tR2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qf8C91/YkTRnGhfkIBW7/sOYo/dvYKzyIqnJrU16xfU=; b=bJrPcDPGtxII2XFGW41gZ5lOe8
	yZA26pWprcJK+VMw0cBpu6Q/l2aaMNCDC+52aUpai61oOtMzjt7Fp//bIK/iMICXWgxmqeMs93F//
	mroakPTElf8Fx/agfVzIJYXC4yqZQieES2CaAZcprBzjQLZupdXv4qUCEm9yizpnXdXksJKN5PgHf
	iHoCFD74lcYXiuH9bSWm2amrG7mgDidJbKK+my5a6Wmn4LB6ONr1Q1jyKfZW6sEfp+XF+5/p//uKA
	YdAwy167asC6KhZpWrN8AU2DRmqXT+zMTDpiw+1IE4vrhLXBfPuzQmXRK4u/It4rOWZwezAsR5Gyl
	SjZHLS0w==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46684 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xEgqG-0000000AIc8-3Y18;
	Thu, 08 Oct 2026 07:38:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] ARM: dts: imx6qdl-phytec-mira: Switch LVDS panel to 18-bit data mapping
Date: Thu,  8 Oct 2026 07:38:50 +0200
Message-Id: <20261008053850.2941955-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_064104_814907_16FD8DA7 
X-CRM114-Status: UNSURE (   8.26  )
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

The phyBOARD-Mira drives its LVDS panel at 18 bits per pixel. This was
previously done by always overriding fsl,data-width on the LDB bridge
alone and leaving the panel node's compatible, "auo,g104sn02", resulting
in LDB and the panel disagreeing on the format actually in use.

Now, declare the override on the panel side too, via the data-mapping
property and use "jeida-18" which resolves to RGB666_1X7X3_SPWG, exactly
matching what fsl,data-mapping = "spwg" + fsl,data-width = <18> produces
on the LDB side. Both ends of the link are now consistent instead of
silently disagreeing.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index 8b2b4ed76328..50e5bb22b9f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -121,6 +121,7 @@ panel {
 		power-supply = <&reg_panel>;
 		enable-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 		backlight = <&backlight>;
+		data-mapping = "jeida-18";
 
 		port {
 			panel_in: endpoint {
@@ -204,7 +205,7 @@ &ldb {
 
 	lvds-channel@0 {
 		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
+		fsl,data-width = <18>;
 		status = "disabled";
 
 		port@4 {
-- 
2.34.1


