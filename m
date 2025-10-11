Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59CCCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xljFliCRP9Mj6mcwv/ihtz8MrzZBGcHB9dv1YI9AHNo=; b=Kbtt/GWHas9MQw/gCnYmLjqwUJ
	Fhc3CwO82NH3FOg1vdqK6ajI0Y+1pXb2c6Ayv2TBdUA/+dyY0JXONrPSIrqWAOEzW2yElWldw1/7d
	XYl/e0qpZnreXVRXdCju93gCtbonVbvpf2q89eKr9gRun+kXaxv90jO8gocjAN0kE8AtyFAsac8wt
	K+WNQy9HOGBFTYOWBvd7/7H8VNM6HEiK43rfo501N8xUIEd3K4H4v7moBDFoQ1o4U/9rbdjUSTzpZ
	Tm/bRVsqzV9UdVg41VHpZrXROjcTFZZo6f9WO/124cYZH2xzNZZr7X8KfHJ6M8NpOTQ8lfJRqQgfg
	8jZ5fhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d1P-0000000AOzH-11Gf;
	Sat, 11 Oct 2025 17:04:43 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d1E-0000000AOiW-3Oop
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:04:41 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVMg02Lpz9skc;
	Sat, 11 Oct 2025 19:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xljFliCRP9Mj6mcwv/ihtz8MrzZBGcHB9dv1YI9AHNo=;
	b=OuhAg7a+AvOBtY1OOCt9SAF9Y9Ap26u8nYvGa0bCH9tIriLGwIozd7ePesi9m5DukIumAH
	4woWUIZQuytAt1nKN9USssEi6TXxZI3Z4CwcJMX70ZKYYh7+sX3p5KygUHVsRYmMKyrjke
	3eAG0X+T/XpD+0S7unLR0Mfa2VK84EBJzwPEg/yBDV3kz4DFuBa+cfosnDow1n9/Nw5GDC
	N9btCb/b/ZkIotMNAxEF41ltPq3LaxDQGc+I7l7vwv8r0DWTQ2aUpWfpGQmT2PGZ6CWUov
	dMtCufeSK5SeIFcS5SzCcCzt0IzygnqJ6xOwPKnJP0rAb+T4bpXkQYVgRls6rg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xljFliCRP9Mj6mcwv/ihtz8MrzZBGcHB9dv1YI9AHNo=;
	b=jZmdi5THYXHZBoohzFTEmcDYMIG01oYDoFGwFMzCvCNQCFHTHHMT66Q1F34TXvZDakfudW
	WBGr7HE5tMU7fFBirwjGwbJdWAdU2ws3zQ2MZ+ECMEnsPXTCJcZrvehQorvyJiiVJCEgBQ
	1RIts+y8ShMXYeErueMM/2+TDYbtLWUchlZk170pcmfSo1xzeb4F3YqTHlUc+3qwO5iP9s
	tkrwVTAJF9fVtGVscIbI9pp2wl4Zg/50z5D8apHpnynLwEvjUvoUov3geTvSxqD6E9Ahbz
	d9FOCzyM4/tv2/8YYarAZPyUH1+RtiFdV8+NWP0o3WCapXjZJy9E2vfqxWnH3Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 34/39] dt-bindings: display: bridge: ldb: Add an i.MX95 entry
Date: Sat, 11 Oct 2025 18:51:49 +0200
Message-ID: <20251011170213.128907-35-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ecmhhgaji385qxs8r1n1u6oze13afseb
X-MBO-RS-ID: b2cf3b604c2589930db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100433_028032_1F98D1FC 
X-CRM114-Status: UNSURE (   7.11  )
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

i.MX95 has twice a single LVDS port and share a similar LDB_CTRL register
layout with i.MX8MP and i.MX93. Unlike the other SoCs, i.MX95 does have a
mapping bridge in front of this LDB PHY.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..9564360d4bbb8 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx95-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx95-ldb
     then:
       properties:
         ports:
-- 
2.51.0


