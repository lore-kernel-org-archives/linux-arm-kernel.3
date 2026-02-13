Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE36EF48DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vWiuB+OJ5TMezpUq3g297LZQT9wOrkp2zD9EqhVqw8Q=; b=nm8QLAz3Ri6hXvquUEaAIgn72m
	2403CMHiX5lGNlGL+7sQjz7CK9NeTdn93FfBy+SMBwOQa03gzlyLyY951soARubjh1C+6EvNlJeCA
	euNiKNmYd/yOGo6scJnnEwwma6IVnsBbExjUGq0SQQICfI8YT12iDILWCIKW+k0hInRVgp5Hd6LCF
	mrzC2PGB2yKrN1KSDmoPsKy7IvOJiEaXts/tiWYwpmJJDZBbbEzzWXau1L8uWqpgr9oyw1MlsUbQ9
	357Ivr1BIwDl9h/BPjc5ERuowcoBEPqsAcT5t4t8UYx5IKOy7LGU2IBzJemLmwnmZXJH7vzEFtYb3
	w6ZEALvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkz-000000037A4-2FRq;
	Fri, 13 Feb 2026 07:38:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqnkw-0000000378U-3gL1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 07:38:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43591b55727so639246f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 23:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770968305; x=1771573105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWiuB+OJ5TMezpUq3g297LZQT9wOrkp2zD9EqhVqw8Q=;
        b=UVzY08/SGEX0P/xueIKTUpL2gdu75WfbB9+wOTo+J0DLNZ3rinMgCyU0BczWUMfBOL
         utcc8M4oZzWA36O7JeXIMBSLM1dd+irpLvoQV4Hi7ju9zMdRN0QMCUqEJYQst+hPbD2c
         tGVnxKzwUnsDHPIFWCl7roW1EMV4rCR40p0jo3VsbUBULEKIM7/VWBQ9AMkNwNY1DKGn
         /YmxeIXDhQsX5WJewlrAGVyIWScGCXqbJrIf85LE++f2H8/nAwav1jaLGzM3aZqWhNmO
         TVHLsQ3eFd8pPALb0DzRJcZhsrd+7AfLZN96wgO9ClsOJmCurlqV9h5AS6EHqpftaY+Z
         JNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770968305; x=1771573105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWiuB+OJ5TMezpUq3g297LZQT9wOrkp2zD9EqhVqw8Q=;
        b=gon08jzQv48RKJP4CuykTUK+gGaKcO25BXyANgs3AK6NqQC3Z1uxN4wtePYY0UYlPl
         mep7c7XsFHAx+BzFpAjmkk1t5FPmQV+VlSvmguF66YzauwZZ7o+X0puaSAZ2IaZAVFN+
         9w/HFcWi+isFLVELjNxeGEQT7Iqd6wgGaTWroMJlxN787Wu3LW/KeDcWy92mYEvH1nb8
         gNnbm5i9xjO5UGkyyLpQzKYW92Sw2nIg/7/+z+uBqyK7hB3c4fuXdhgJ9tQzKnaRve6C
         8DzEtB76Fr7QCVjshMWwL3Jbgjmz4KjX8EkfGFeiMy7Fr5rpwZDzAlhpUrOpmKsqOHHF
         8vrg==
X-Forwarded-Encrypted: i=1; AJvYcCVomdYlx6r4uwTdJW5rTjgjFtEGI44Fzd+6mHb9g5mxwxH46hpWiUsC24nBiRWgF/q/y6JOrrJyAUejr+oa/fdb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqmw4euyRDKB3LwhHk4Jaxv5PkSwqYK7xYeShZF+SxAP31DDNm
	YbyDqIP9V45GHAOOcUKEB51Z/XEJj0LBQojillpg1frBN8Zaj6JDe9DS
X-Gm-Gg: AZuq6aJECU10YEg1SfJARnn0jRFOYB/cCISuBmIJg+lE3sYD9FMTUkAyQgImlJ1DNmf
	CBUTdQRb79XW7ARtF4v3gCLM8qGi7QOETAUocHOO63X6YUkTZHwKEyBq7qkmmE1MZkIedMrSCWh
	LLP9bV+lR5NAHJqlOPz8Y/uVCRz8z6PjMsvUIPjCtX9wCqHqjdsO6fO34TQtDi0IbZ2B/f+e3C4
	1awWvsjSdS506BwlYXgI5vIT5NgHaq/DId2wxyPdkft2mziPx/1N3e0DpfZvPbNk07wOW3j7mxk
	ylu6V7B6paOSL7CwsJQpyH0Mxa/1fzJzFabRj2EH6hM9CHEe6Pv8kZbvnMWoUZqLxcfbzJ3Sc1Y
	EUHSMfM9BX+E6LvMlOkqpAIERPkNXGvK07ZvulaiyTeL56fyx06esA3ObiLjczPPIvyZ0cmSKP/
	vMqJN8qiMKD41Z2AESX8/L
X-Received: by 2002:a05:6000:22ca:b0:434:32cc:6c86 with SMTP id ffacd0b85a97d-437978cadc4mr1730591f8f.14.1770968304335;
        Thu, 12 Feb 2026 23:38:24 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a53:6b71::1002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a5f0sm3622107f8f.11.2026.02.12.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:38:23 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	yangxuan8282@gmail.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
Date: Fri, 13 Feb 2026 15:38:10 +0800
Message-ID: <20260213073810.552341-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_233826_926287_478B8DEE 
X-CRM114-Status: UNSURE (   8.92  )
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

The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
interface connected to uart_A.

Add the required device tree node to enable proper functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index 393d3cb33b9e..dea3a60e8527 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -30,6 +30,21 @@ &cvbs_vdac_port {
 	status = "disabled";
 };
 
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
+
 &usb {
 	dr_mode = "host";
 };
-- 
2.53.0


