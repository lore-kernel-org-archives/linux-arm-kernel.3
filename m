Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C69C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=; b=C5Dq4qezW9dzXMYln3tyLMWKf2
	4wl1uiVfnaFYYq5AKYghD/wp1WXYjwdwLqjRMUvvm2trNF4QTGmgzkVCX9wxg1hs8cUiIg4tnNZ6E
	eZAP1I4n43cr9i2ENn2SFvdBO6B3H4BP6UMf8dQwtHPRZ75dWG1O42omYsTUGBq131RUHs8YFmEbi
	6T0LigKtnhL/Mub+nWriI0s+enlPA1ORiA21IkPzZ1fx5kRDdkG++cUPFk7tuX4x/FW6zUNj1I0fe
	HpxDgfd2ZgX7tFkuvF76lKan1q1sTBAcAEog2ZMmnNcHljgSlr4bvB8A4tA/YhYrE39OkygiNYrlj
	m7Dn5UzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjR-0000000C3Vw-1DPK;
	Mon, 06 Jul 2026 09:35:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjB-0000000C3Ad-3IMK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10828145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330500; x=1783935300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=DoaiyNsc00VkUO5ycjKGUNWOYxma+Q2K6eGsbMF6DBIlkgIFu+8xp5Yw0GkBjOumqK
         aokQDDPx/fqyi8a+lyCVKU2GNyzwzAuQSq0ER/YC9w13Fo536JrYlH14PMGDccqvbvhY
         aLQavk3QDXBhczPvav7IzvdIU8JPPxo/rRqD4FNlu2xx1E/YFerVEly9iLmZcdJZwaZz
         H5gYdNqp0GjtUTMT87sLcyF/xEmfC+G+1XEDPIQxLgTCLbRqsDh9fa7YxwSWwVqTL64J
         q741LZ+P6i/694FEJET40bsKy5WjFzT8j2BLMUXeq/nSmdpQGbMRVU9/GNFx248tkr1z
         KVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330500; x=1783935300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=UWjRWwluZ8mce6LJoSOvDJw1xtcfa9sxHcoUKv2xFzdMLdW6aYZSVfYV+QvQnIbC2i
         2n5nvVqmhvmp+B4OGURh+uWAouma7eEBD0NU9uDRtL1KQyMWosXIt4h8cSpZielRD8LB
         H241FxXZEVsjhBlasrobzVCFkGsbcKWBdOh1tA3FKT1xtpFjAsPyuBWtfAXafsgfRcHc
         NaGlIhAEN/ZpBb0Y78d5Uc4cOe1Rt2wTd8uFF9bDo+uqpgSh1Uip1SEmJ+ATYJKj60SO
         iYQbAnKUR1kSvBvTzkOJB0Mbp/inO4DmB1muI7y1Iifkl9zToCIjyvj3idhbQ+IV5E2G
         CE5A==
X-Forwarded-Encrypted: i=1; AHgh+RoGW6LmcMuv9XsW+C6ZQI20de+Vf76C6C7iW6u+1RPA+cYl5kdNB1D4OFZK5CAYM/NbYq3JKz0ggVNtPcV2bWd+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb4csAbvRz1XwCAWfeprPZPCXH2UDRhLuq0k20zOIH5G0lp3Dj
	2peXPUVSQ/2/epvXTNlfQxHr00KG5W2TrMyeRyrQc8HDysrSyD2zOVmj
X-Gm-Gg: AfdE7cmebK1JFQo0uGElWpepXfQYT1zl9pw6ckEImPUHWH/wBpZpGk6QwL1T7Ix8J3i
	ZFrw65+lpepRH0S+3sd3BYF4Tbj2tPkEZB+2lv7/W99HTDK+7wUrVPSaFzHWdZYOUwQnHIbvK6y
	xJ0UnNgPAPaBV4r4YhtsWxwNFViwnzyfhepDfXqopm8qZGD60p/Im1SKWx3heQykLQh4JeCZTSz
	uKdx7QXaD34z+euL1NmVZmKIcxoiXxBKQdR6PgFS7uGIQJsls/yANdOFMZ2axojLdCj2jJ7mPec
	5Y0yyNov1CqhMBgvjFzapo/k7UTXzKrdQ3se2hERa9h8SEIRGT+UIjtP4qTH+tkYPJczawO6wc7
	c3yOZoiJzPNuMvIhkAapQ23rkhf96CTgUYnQIlxePkdThITGxa0usj9POH+AYBBVrnviSqLyBHo
	QLQevAaeB7vzQnsbnURXyBPcPMwXuUbuEOCDX84XecHTuuAP1LqptvhuYc397phnPQiQwZbJOTR
	Rpr5+O6wYA0J0NjUR+g51iixw==
X-Received: by 2002:a05:600c:4ece:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493d11f030emr111490185e9.18.1783330500022;
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Mon,  6 Jul 2026 11:34:38 +0200
Message-ID: <c9696914817c7e9290de7c1d9f588632e700f478.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023502_109414_C1F8442F 
X-CRM114-Status: GOOD (  10.77  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 5d8cd8c13633..7a4c7455a162 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
-- 
2.47.3


