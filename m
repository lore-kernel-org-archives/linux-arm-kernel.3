Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2CDCFA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O55tH4mg+dDTUW5UrQWZ+uhv6UBmUWklyeFXKvl0nU=; b=YtSFnMuLFh7v0VgbBqeHMvl4U2
	FdKMuzAL9ck2v6UYGkEZ0uhm4Bt63IVEU55GbE5CQQvfcI3f7R5UqhuylE5PRNV7oPtCo53ywhq4n
	GQXaq+E/dtwXOKVpk3IBLVTFKxZKgLFDTfWtpPSVSSlEvW7VG4dziQ54lbJPhniEaRrPjxB603hR+
	mlwuk5ebOrBZnYoC1TE0btWiLlvygeYm63L/j6MLp09oWqCEn2uOAWpsRuVBjSIcvGJ8d6q3stXvE
	wuXvco0Q7FVCzHiIx07MDBBgSahtkSsd2FtR/0dHUZLGqCy+Ng5ZkFcmwiboQObBXlfIZVhcdipdt
	Lv3Zllpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ihy-0000000Fx4Y-03LB;
	Wed, 23 Oct 2024 21:15:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h0X-0000000FgXo-2eLC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:27:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso176431a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711620; x=1730316420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O55tH4mg+dDTUW5UrQWZ+uhv6UBmUWklyeFXKvl0nU=;
        b=W8Wa2VnFkWDnvUl9GxWPRAQ/jc3wU/f+GW98pAeOEZU3c0bBg88TnOohagGKv9gbK6
         QzsAdq5W1zwaB58+JW+Hdwp1itY1yiMwPMiJ9i7QzQWubJkf4TG9dFQTnV0AItBMekrA
         rK3mNOLYohmKuhtflp61sppKdcz94fjgUpnTY0HwG9mvhU4ZqT3r5imjXtR1Gi2TfgAy
         aMFcES37JOSPbqpM/brdzgz475pyUdR/kJcJWLgxokDtgkd1ytP23h++7frxmZEIPqpw
         mceMadf/w0W039LZ2r+aHWnoQNOerEK0JEyvHcUjjSae1JKddimLDetnP+MYCpxxbwKv
         POew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711620; x=1730316420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O55tH4mg+dDTUW5UrQWZ+uhv6UBmUWklyeFXKvl0nU=;
        b=GmwQiEmN033ACetwWH/atFcCN6JV1U6MC9D0TJRBtqY7tpBWf+RGOc78/vmWcundmA
         nuOyZmZUWT/OF8uwU4sDBxJmv5cqfhRHjdCf2NdIpTp+8TQA/DHqYC59+QNKo9fsSTtp
         FfzENutbat9EdcFwNTq912YpYa3h9RnzFyoGv5RqTC9eMIDyMIfDCBNbL36IJq0LwFe/
         2Ocr7EUY0IRE7JB7E9aC+2Q9SbQaUEm4OlGaWS/+/9JOMDRW0/AwftSTFuudV/KKzF4f
         3ucP22vrJArv+rh3wb6gNWG9jK/MU6RmoASsVSJW9LdT8lPRDxXgwkb8LAcP59uF/QgD
         c+Yg==
X-Gm-Message-State: AOJu0Yy7bzw+pf7zieljyXrz8wjsG0MEfWXyCTJ/MyNrQwoIaaV0eLYt
	fZgaV/GV8dMGbeMqmxjgHbIwT51LDjWJM06RzeB1JpDbUr28qpj2
X-Google-Smtp-Source: AGHT+IEQiy/xrKWaVqAIUMeAVSlB84ZE8bBKTViAbSYn9QvjbVrK0iE88B1fokuihlvyMJ2UBAPz3w==
X-Received: by 2002:a17:90a:7e91:b0:2e2:daab:cc69 with SMTP id 98e67ed59e1d1-2e76b5dbaf9mr3946085a91.12.1729711620181;
        Wed, 23 Oct 2024 12:27:00 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: imx7ulp: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:38 -0300
Message-Id: <20241023192638.1214045-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023192638.1214045-1-festevam@gmail.com>
References: <20241023192638.1214045-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_122701_696366_9120595E 
X-CRM114-Status: GOOD (  11.95  )
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

From: Fabio Estevam <festevam@denx.de>

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX7ULP is:

compatible = "fsl,imx7ulp-usdhc"

Remove the undocumented "fsl,imx6sx-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index b093f2a447ae..3c6ef7bfba60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -218,7 +218,7 @@ usbphy1: usb-phy@40350000 {
 		};
 
 		usdhc0: mmc@40370000 {
-			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
+			compatible = "fsl,imx7ulp-usdhc";
 			reg = <0x40370000 0x10000>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
@@ -232,7 +232,7 @@ usdhc0: mmc@40370000 {
 		};
 
 		usdhc1: mmc@40380000 {
-			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
+			compatible = "fsl,imx7ulp-usdhc";
 			reg = <0x40380000 0x10000>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
-- 
2.34.1


