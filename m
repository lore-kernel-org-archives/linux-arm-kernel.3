Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7183BCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=; b=mULHKIzetJMUozCdMb8Y3fMf6w
	XbLS/kERZUSE71Yw/IC+Jo/Kk7HdcMg2h+AH0udYvQ6glJ24fe0CxFPcfiTrfn8Y1S51iGn2oiHDa
	lZuxpHjrdH2bCqkQzH8H2wL10U3YaS6rJCfsg/G54RPRgh4ng8YqflaqAL48AKxvcc5K1RiRVrp4c
	2iIR/nNrH0ZRscug95K7H3Cgnf7HZDQ1gRdH9xzw2TF5ht2bS+cC6yX2ZWBPGGB+OxWVsaT5o8OTs
	QuRvKnBHEwYwmDgatuieNC14+xxPpKwTU/uQd2MJaDTZnZqN+9F4fC10J1ea5Pz1yphGfBIj3oc0Y
	mu+8ccqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvY-00000003Hjv-0lbI;
	Mon, 08 Jun 2026 10:09:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvT-00000003Hbq-3be0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so2873889f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913386; x=1781518186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=sJr8LZT54a/5DOqcOf/G5FEX6/5Q9lU5BdQCO6C9jkqbD19TEe39/Pss2+sp9M2Zse
         MC0ia/gd21ZpUwXIixs+e7dwZe0Pew2syDDkda7utc9YxOCi+Ay7OwWFlf0uNquqrhxl
         1fD+AhjFf4tk7YtctKsvtLDFTR1/ykB4emohpReRurQnzDj28lv4UEFfbWe1fcxUAfDr
         GzPeONR108MOR+cXJK20B3e63e0uYZtu5QQLCORx+EzE5kMbO+xjSnQ2f79Gs/fvUBIw
         i0+YOMziv2ZzpaVaz03V+dWdkPJe/T7TqxWyeW/qcm53E2qz0x/6ZguPds9OjpWVyBg5
         sqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913386; x=1781518186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDq94AE2COVyqj0eDLL5JsdTWnDOBQADgtFT6pcEChc=;
        b=PZrTXQnKk1QM18044ji4pCghIbomtG+AYnct9i9ZMJrz2W6F7Lkvw049UmZSeV9GmQ
         445ACADZAKzQkASI3GYUiICHgfl+U3qzypy7sJeaapLi9YOj3PKE+2V1unsJMlLlg/1I
         N6FZTPgAkRWgHIoo6ucr19Dsw1caVrz5xP2fAxkmviWKrZnrybS4EhXfebxG5gCnmiP9
         g27b6dS3H10utk3upXiuuj7EGTrefqGEm25LBCW2WzOl4QxVKyJxhK4WwgqTgGCF4p8+
         u/8JbzeovB7OPRqYYBvns8m6Xm8rgy9oaht03HpbS7OR4RNYH3Mq8XT10g8e37RVJ9F/
         9kiA==
X-Forwarded-Encrypted: i=1; AFNElJ8u+FENxYay6E8YSeDEuxihHoG4g7vkCpM21+7/rbic/3Noz2wBxpa1TtBbHAnts5g3RnFUtAwOs09yEwN7wMXO@lists.infradead.org
X-Gm-Message-State: AOJu0YyoJlF9ESxuBXBFNYAm/OrntugzwCwEzosLt3rIFwF4CeMBcFRF
	5zMFqculxVFz8hBMP5vM3rOafCNse4w745i9v4gZCyt8PqlN9vBZ+R2q
X-Gm-Gg: Acq92OFrLDeQO+mKOoXDjl0ZInXLkRmujuVtxjjdQn36j/xHO1t5RVGN4qc9XJEbJ99
	H4SlPlqJmX1l3HSTi2q9PkUw7MGvl6qRGqYVd3mKXE4K8+C1x9L9Ya86wv4Q8ePpmwikD+kxCH7
	RZRS8Ul2tYfK0JfXeOOJU5pc9dc1o3Bi7YICvGGah5BlNNKmIRlnIJbJ8LDi9UkiG4qwEEM+RW0
	bcIMpfMtwrH3SRgD5HAnrIRztr/DQ+Yb8VEr/rt4xyeVdjHiy/WwPS0igvZ6myhBYrbrVJTyyLa
	I3pW1kp7+PVSm5wd8QaWdEEclx0ylWa6CRp5I921UPCmyEqlYF5JKag+cRxznGzFeivTaZLVYg4
	CX8pUa+79N2SVJymMdmeZfdYW7B2EJJNwwSJleZWdRlCCVP6nH93YmuqxwSuSy/1PFcXXtHD4lm
	g3K8VMeg9+8szw+XDU4GfFYqU4yV9KAujZ4VDcZrTa93iqbVg5nnqualIrHSoapGpIQS0hVMt1p
	1kGx0bssLYPAPFGqMeYHccRMWH07PkHI1IAZpYZSgg4FvxY
X-Received: by 2002:a5d:58f8:0:b0:460:42c:1133 with SMTP id ffacd0b85a97d-46030510ae2mr17045022f8f.14.1780913385911;
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 12:09:26 +0200
Message-ID: <4159f23a5a3e52edb49964b7b3dbdc7ff4b83f50.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030947_913908_AFA4A32A 
X-CRM114-Status: GOOD (  11.03  )
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f27ba602c743..bac3de6e1530 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


