Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44572CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=; b=mEpk0/Ti6TkEgT1YeRa3/6tBID
	Z8+86yi+Bl9FpqJbGZ8gYmBxao3tnUwrNrAxNyljz0r/ckoRdffvAWW+t3YePXHnd77VOV4nHLwKU
	XVX9iFccfypfydxKv5RLhUd3E6zVcac5s8FDuH6TTI3/YCniT/PyrbL4k63cC0xHWbU1NkvLbnkvQ
	dZGjgfX+SFB+jwpzI9KLrAg2ZgSRa0HUoMZCeBG+/qDxlRwr/Na3vMO2voO7UrVIXRzyzYuy6EYYr
	cStLaVHQaSHN6h1L/dfLXvE8gC2pvb718EVy91Z3+fpKH0Ifm5lMYum+lZiVb8hiKuse1cXyD5BiC
	6PqZWmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj3-0000000FH31-06f2;
	Wed, 03 Jun 2026 14:37:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiz-0000000FGup-1zuK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11276885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497460; x=1781102260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=svhqCZYUgPC5QGf4IQb+tyMspJgyjjuKlteoVp3UH2DXS1t01J7r9WA4gUYrBHDPKw
         35EP/USP11as9IN6HruA2fYyqun07tGIr/pv9nlyvUctasn6B3YzL/mwmLXZ5Ayo1FZv
         lrhW3DzsWs4nTgCFTWC0OwljtabnL6un3WQzCLIxIOEU1CCkz090prBkBi8vULK4J6j9
         B5BCY4M5AlPr7hf4Pia5CuSYI0ZMIKX5+9ClgFMhXh5X+syVYq7zcnZE4GCO1494Y+x9
         wwHIEVpkOx9qJYLULO4wOPJPna7mcWKu+J29bt5LoUKZVGfooJY38dHqRuu2GLRF3fLU
         OUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497460; x=1781102260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3i7F1X9p+/0lWqZkki+er1i0WQJXJNWk+O9bJqudV0Q=;
        b=ifGaPiDv0vgv/2U4YfLQoPyQD9DUFGqSauEiKHLqPaOo1R/4lcBW7UoEfcKzKwnXF3
         QlvByzlIyjklGSK+SmPCzq0jOmGSlrRbUVjk8RjAiuDuKzmNCvS99KCZ2U7lFreFbJIf
         X96LOHu8sjldynREMbbx66GZVFgvzE3mD64E8pYLs0p7T++6cWRL/6iJo1vKFsCIh6rP
         D/9s+9qSJ7IhvpIUCGeAOk+aAaKeDUAjCU1pb0tUVC29T7LIPxL4LTluvqZsVYyREQdd
         Yn2dH47P6MIpTmebqFNt392oMcGiyI+Dg3xTgvwgbT2XE6O6vcQbg9KdAF0XhpYS6J13
         v8tg==
X-Forwarded-Encrypted: i=1; AFNElJ/LccQ1X9Av5VCscNawLN/mJKiZ6cpUGTfUbN9xBiL18bmKC5MKhjIo0gtbNI6wPPuoYb0zG1mNiIbh3elIbpL0@lists.infradead.org
X-Gm-Message-State: AOJu0YwRqgJKLPA2wGkr7NdQ6sXXCTg5jQ9E+KFDu6e1uhbk9VOC6ilB
	Qf5j8DJnFAvj+Pw41CMf5EoopFLn8Fs6y206VsX+szVS/j7iCjkyGxa3
X-Gm-Gg: Acq92OENHL7YXW4M4lNP5eROixvz0ba0DSCHvZGVYEiDxAo+grM1N9JKhRZYEHzpN/l
	Fn5os6D7EHiSgsfqP1nfPLeS/a4Sr8tSqoc10dXcp4XecXBVnxz7YVoU4ok7yJmDDCAs9ZeaUkX
	Ixalc+XA1JXdbE0Gl7E3IuKBe3wslsFMvtrSNgqK0dTGKiVOuXihYOpun9foTfgNNwMME8uk7wq
	O4g8Ky6zUw1pBNjGmBvYZYHzivcfZ1FK3Ns7NSsQDPTdLwqWmrB0KfraYE5psKsO2qI37vvDk6n
	eQr3xh0fzSDTpjIXptUmbikHp32n1PYEylCzVH3wFpCVzUpsChreb2gI6DI6dMzRohTycwvxrRt
	vstyLXRVffs+qeYHzH0eq4dRdbqRMIbNNkjzvNkmOdCWFXfiXqsm5x4bEvmbpVMcpL0mteCfXPv
	ex4/q8vNj9/3KbRnlQvKK4v1OvEYnzC2jUM5k+0kR2zwXXbyBxL4D0lwlT3axD0v6RmMYBvaBQY
	HTxL2BoZXkRrprWvHdO59T37ByBSQ+GBoU01PwnXMeIet+VTbSapXtKJII=
X-Received: by 2002:a05:600c:871a:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-490b5d3fd8amr66017905e9.12.1780497459695;
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:39 -0700 (PDT)
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
Subject: [PATCH v3 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Wed,  3 Jun 2026 16:37:19 +0200
Message-ID: <164f8be4e0c1260130c024a47739de6cc96f94c8.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073741_611827_1767B9E4 
X-CRM114-Status: GOOD (  11.91  )
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

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 28424c2405cf..6b2aaf6bae07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


