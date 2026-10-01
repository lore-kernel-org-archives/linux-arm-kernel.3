Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207D5CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=; b=Syp7XXbS2aL/0fDbVcR1dGb/Q9
	cxBb1omdhunOpD/p6I8YlTZ3VvuGJ33aTWgdsAF2gvehYHKWN0Fb8XC5uxtmYWSPQrF1+zPy1jMWL
	5WTal2hwdRGyfSe81FnShmwC1bbgTPQEKEdErv9L3EaGqPsfHiiXkOtVXQ9DNnvxF6T/+hdOq86PP
	lnr/RZJq3SzqAo8hnLZ1j21c4bNHttWkyR2hxipHP7bMpYFYcs5aqE8j2ZkIJ4u05kwTqgkkjQq83
	e4ktG+SjDZXyJAmPHiVuynJSAPlyCTZRDeb6Yob22aUQzNkN9iLS9fNvVQp+EeFzt9Ek+SOhH/VII
	SllUiK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7O-00000009bZA-0BJI;
	Thu, 01 Oct 2026 15:54:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7I-00000009bTB-1WJq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 15:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=; b=Wm0o2FwS+0SxCThdYTSckXFO3Z
	+XehFhbLywoPiuJTwAyUGaMVI2kzlaqdqTlVZ+mWkQFlu1A7D5EDHkDCHR33NTJ0B9E2y8Vm1Q22N
	35NDTItyxn++QYyyv+pOdSUumAnlYMKr4bJ5QxS6VE5N8fHtoMZhE5SEo7YOYxXCHCwalR/xhCgdI
	3b+yoqxlLc5+pXfQG3JC3Qt2ZS6voJwI/kjgyLWaK5ucpLR+gL6QqCx3grQyv/KMcvZHXFhyN+9BM
	YwHUHG1bnFau4Tqd5U5e1BvbPUmX/0/8/yGbTvUAJCZH8NVcDV0BzoA7ERPlw2SA3WycWh6ZltABn
	p3hptcsQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCJ7D-00000005AMv-0K4U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:38 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so44231025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870073; x=1791474873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=UIUkFILIrSfXJWMB6f297ZlCDjmUPDGsBbiJk/eiGXvEYl+dmfv7iiMClWsVZfATcW
         7iskOzOTTU1plYlOL4xNOM0YNpr4HdP1gTe7qhzhWG/cqU/XKvIBOTO/1D5fG02z3eYy
         450mu/gi+xOmBKhp81NAZLavoxwYMGzZ5t3hBKVkmPly/Q8reUx0a5l0FvzsNTp+mxUb
         +KO70EazR7vgcAQ7/2Os3dRDsnDILA2ZIjVm4j9WUupNaMS4P2xtR/Bd7XGjGk4fav2i
         iZl0myykyzgWrBAnwa5K52P8yN5Vax0gDaOHcpfoZN0T0r84WH0Xrf4gXcJlPPrlGT1O
         vvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870073; x=1791474873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=okx0ecCB05anaGXke86P5H6r33AhR42lStH63dHkTGEp/TAFRUf9k7OSrwMU6S7TsC
         Euv1+KBfu2KWrjTI6mFW3BideffE7cp4Jy69s4ghUBTUSXryOqJ/ggG6ANhh4D1UtyIY
         JOkcgUD5qgp8GdHE0/tjfObvHlSDeaXQu7M5H6kf7P2X7R84+sFCzAbWCbv9M+UhBnwI
         KGlVhTfhcCLMCmjEL/ZHGS0WRz44GxWXvn4zeuAOmu8BVSDjZe/Up58c2exNqxllBixU
         cEHoQ3T1CfhY5+RdOLiospgyNJARgRaycGFWx3Ls9ptBVOf7QUKH6jemfPs9eiwXOQCR
         /riQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqBc4F/5AS8PIjGM0y4UEeegRWVK1GwWvvZGF+jfNuWyP3TH8hStZlpWRyUbz24wIH2F2g2UV1mnpC+nXD3FBS@lists.infradead.org
X-Gm-Message-State: AFuF++mRwmwXb1YMGdFK1QIjkFe/r+kQ+uCZStD5cURhn54zNOF1f/hb
	8QCHWeOw2af8IxV0EKgmyUFjIRGZbd8ZVnowsfGWyXfT1by/fmedRPPk
X-Gm-Gg: AYBFou2pCxWr/UGm/6qy3BTYu9Wiu2M7syDd6UhdvVhSc9i9MzVJuNCJsx5JDASrAzK
	LYUrzBPSzLLFERgHoFHrIvIna9cfjoabW1wMtR9TgD26oE+LRhG6mBrrcyDebod+G5Y9bZw+Yii
	v0jHxxp6wfncOPqr0avNu0YfySwvTA1ZXm8vNp5zLKeQzf4LnYkcs4U9gvHeoCfynzMCZuFUF6P
	Eto8reIRAjk/1/FGSnKURSR3ICB3gUwXum6kuwgBwuUIvNfqCcAi25MVsug85FWl4XbkeeS7c2+
	B3AiRmMEJOb3+hcdwWPud4f6tt2H5l+X0ChGneJ1knHaHSeD1dz4D96/XP3hWCugixwAz7ksyWN
	JxrhSgjPMRYNva4BwwPIihqLHMQhIhfZn5I6U4T0YWwi90WiSPXKsBsM19r2nk7rC95nRf12dbh
	ZWur9/60VDmuJ75LsUif7QscQIhmgQkrbX/KxI2HkItrMW/HiV1dt7W/zxaumMSUck1TbqDJ3cy
	KGXX47YwGhwxH8rI0Tba1NcqpIYQIuNSHHjPuD3DKNbBA/pXGX2RILYFG6OF8thbBqVx7Qk+tYv
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr1517275e9.4.1790870072609;
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:55 -0300
Message-ID: <20261001155412.3177428-6-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_165435_384943_8907E168 
X-CRM114-Status: GOOD (  16.45  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 5f35771cc3626..cd1b095ce06f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -107,6 +107,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -243,6 +247,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -255,6 +260,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

