Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C0D1358A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgy3VGk1Pn11Ai88JL42MQBwi3PPMEdh/Mp+3wfCo1k=; b=HjTuenD09mh1EiCfM8Qk0tqX2W
	dDhyuRdj6qq0pA89D5ozyoql4bWPbjB82ACiRRbo+imjJgJrjJvv7tFC8bl67p/SQFfk+9Dfvx426
	oCSsnA17yaoxB33u23O2SU8PQT0NvFCSGOLxkTD5vXukhkUsQ/00IytGAntBb4kl1cmOW8hVNoFZw
	pFc5WTPA0jP1yzzS7np/foF6D6TxAR99nUJyfG8VfRQBEPnyJWrwA+6YeAgeyMBpooPZig++8dTE+
	rMDMhFDFspYBecsS3Ocllt7nzT25TUPejW3gxm5pCW9HUhlMeb1Yzhb26bFCgJjf2rHSTuZD/e5Hm
	wlbi1NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CE6-000000092rl-0GDO;
	Sun, 27 Oct 2024 22:59:14 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CCU-000000092lM-3obt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 22:57:36 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4a5c4d8ee99so1241051137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730069853; x=1730674653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgy3VGk1Pn11Ai88JL42MQBwi3PPMEdh/Mp+3wfCo1k=;
        b=YrtPsnQAWPIm0B5b+cqBvja2uJM+N0rTNMobonibyh19YfIOZYzkVX/8i4zMztBRZk
         cI03hRM+dX4CUbHR7O3GH/4FzFVNzZXRe7AgfU3hpAz/zzDWU+tm3UlXFDHCG1k2azJJ
         1fKj6MiFW9rnLI4C0Atkq+yJuF3RaiL2wdTZgnFujoqieqZNFh9Y8cHO4S6cRYayeTqr
         EaScHtU21xKG3u6mGc+1zIMBDrg5W3zmcGfITIr1MEDDCQ2NNNklHECLRPqLDn6fm4I0
         fiqOY+cjxv0sfQfhxfDNUo+fDJxDlufBtK4RDBgCe95QLZrtP1RnH+M8W4QLNi3PyvcE
         oSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730069853; x=1730674653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgy3VGk1Pn11Ai88JL42MQBwi3PPMEdh/Mp+3wfCo1k=;
        b=YBMJycD6+V5Ri0KUMn09GI6ftjnCZXSdVwoQavm8iDgFN9pVycqOwl5fomdXhr2/Ii
         qJy/jWjFEO9zHwd7VtTq90H/qz7QLIoY4tJRnafuKbFfGQsSzl+oXmqu3YswCQ7MT9H/
         /uVwJzrpEi+N7NVTL+HNye4U3WMXGJ+9gqLSMbeV5JchM39rSP6B23PI8cF5gD8jhBxs
         IEhVsqUIaF4zFzwpvt6XTItmcVQ0LjaaWYhYJjKAvu/tvJbCzejag8bvWqP41N4ruORU
         6JOucVKeyHIQpC833h0K0zgZpI2mCI0rEg3oGALhKVDyjdo0werNj4YzBLQd+jGtorZo
         QBhw==
X-Forwarded-Encrypted: i=1; AJvYcCUonZrDXIeoecZ4Ii7FmP5fL+JsVRQgyFMCjSHTOFGx5Diab6eckn77/vbW4q8Pmy9g7DxV75hZf/yTE0HGiY0I@lists.infradead.org
X-Gm-Message-State: AOJu0YzlXeNbMBJiRC2PJLRKptbXzAkwFk3ZMphQ5G5/myMekOtoNn7/
	qCi2dKj05Xba9qoXfiki79GpEevLfMhf66XMzXh2IfYcpLhFKtXrGwOOarkJ
X-Google-Smtp-Source: AGHT+IEp5GS5n0x05w29XQotioDngzTwdv1OubJphqMniSQH5Is15OR/44MN0WnwiCxIyQF01R4TOg==
X-Received: by 2002:a05:6102:a4a:b0:4a5:be31:b349 with SMTP id ada2fe7eead31-4a8cfd6d248mr3458945137.28.1730069853086;
        Sun, 27 Oct 2024 15:57:33 -0700 (PDT)
Received: from localhost.localdomain ([2605:59c0:1487:f210:963b:c209:74fa:42bd])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85580b18374sm819159241.26.2024.10.27.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:57:31 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	Gilles Talis <gilles.talis@gmail.com>
Subject: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
Date: Sun, 27 Oct 2024 18:54:08 -0400
Message-ID: <20241027225408.195475-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_155734_974005_F5E826B2 
X-CRM114-Status: GOOD (  10.79  )
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

The HDMI connector on the board is a micro-HDMI (type "d")

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
index 5fd1614982cd..4a4f7c1adc23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
@@ -18,6 +18,18 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "J15";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -85,6 +97,28 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -213,6 +247,10 @@ rtc@53 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &uart2 {
 	/* console */
 	pinctrl-names = "default";
@@ -279,6 +317,15 @@ MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x19
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x10
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c3

base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
-- 
2.43.0


