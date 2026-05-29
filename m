Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E27DCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=; b=muaIavFwEX4P4jwG6+bbVg/HKR
	E3aoZu9iz0IajaJh9kgc+k7tcfBHR8USR7s45RAt/JHSQoOwRJVf3xbksnjIsUkEZSxX2ji9DwxG8
	SP8T23AFGEB8BymQRv9xEHYL53fuk9fETaDuC6HIKoC3rgFDtEWHjbrPPPTKe0wZ7jk82ApqLVbyH
	SLfbqJc7+vK6ZJBtpwXmsvtOuZuZxcCXslcEZQaBr9jFUQVa/3/nBpUNTdjlvCzBXwx/Nwq0jijVO
	1tlroZpRr31wUoqyBBuU5k3kYnNWDmoYPFCVhPsEKYRp/P8w24pAeKsIcwYRkNCf72/rypL42pFil
	0cEs8LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBU-00000007991-3Uv9;
	Fri, 29 May 2026 10:11:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBO-0000000796f-2KbQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:11:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso69745735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=lrYmoISAfmGopawWRxzCL9NGoed9l0JzuCBwSmIK1z/V3VQqGSYP5EkJVEnrspNJDZ
         Q7k2qYlYpoFbjoor1DxtwopS6aZfRuv3hZWcezBmaoF/svu65syLtukm8E5gNnhVLNj0
         oxlMLBY87g5YNTSC+wPkqsYqxhShq/3peAofN1/WVPdOPeuW+E5Xw6bY5h+Js56TGF8x
         OQCAUUDsGS5bxgb2gsaTZAYCITM6dZriSI3/Wv6jZMfUSJs0QKjui5ZoGFZSRWnmaGsu
         Bnm7owobz6rbPFpZpl9wdO8EorL3zPiaDE/UM8yZOv0QQ6SJXKjk+KDiA0dKfaAgUyGW
         k2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ct19hsseUzI7/PXjrkjuwXhkiCOgWFxKkE4ghLuPimI=;
        b=WGDkKYOB4MM5cXSGhTcB8+IMfHtrizgBW5fTjn17mzWT6UvXHxYUVmitx3xNY9i9Io
         C83vKuZRzProjd5kX6i4q7NjoPlQbFTV8VcejL4PVHeseScD2H43iCttjKk4MJTbJh2+
         fb3OZZV1mg1lJM5SQzEZamYrcqPvYWkdJ1A2v+IBtgmxT7XxseuwROvk/txd0scXh3dl
         QuQ1hk5vB/+wjlH893MglE/KrIQsjFeYiUQZ/WzEE1wmWLB2KPeAhSDbvx7uZi7/zDb6
         j9F/ykHGKjBsAd4CRWYLaWht65uJRyghMQlAUZmEaTRQuEBzqwbNcoYxwEynMT2BKS+P
         ++tA==
X-Forwarded-Encrypted: i=1; AFNElJ9cjrcvd8qgR0JwDX+ekm7jFYaBdn1jkbqsDNJc1Bl/Ap1pDW/E3h1WXb4NlQFK2vTjb2YtblhDgZ6v4uEMbjSf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw41p9Zx0OFtEXQfwQPZtMxgF0eW1dnFKhtnWf/JLMynHekVjAl
	HrS8CD76FwlotykfwtIEjFg0KxBt9S8FidzrnFOoUK3w5y73LXg4Su+h
X-Gm-Gg: Acq92OFl0ccfG/upQYVC1p/rPmb5swIvbPo52wwQWyanBwjmAhGDg+bFnEW3tqxOtw2
	0J64oNCBF5sxKguwohElCc0p01IDNaIv6Mf+KNYBHdnq8KpMaYOc/j0MFxFUiXQkWgHSKku2F2t
	RJusZXfHLtjGBw++Yu9l5ylEvSR66znQN37JEpMqAjvkLwrTfUyhwUsw6DajLuY7WAPZf3Kp8op
	J5wO06HgsO61Csv2/HfpHdWKVkqcke696bd3qakodn58RkOD0ck7To2SCjh7c98dOtsbfS3K59q
	E6GYCLdqny7RRM9Pzt2kcFQw6/3E1LJbfRbl35w5N7+DN52xH48i2qCpiyYG/Zj1Ypkh8yOl97o
	CLtWJnNeu3n5aPrpuD+2gsua+9e5GaFxgLGAC/hZQT8sC5ndhKEKd7mM5O7je5ksz9pohZoVnYw
	p/cK7/laxzw9NE51E3kDYitQX6ZzMRJbdWBwPYbZlw+kIPMGDBwKZyZTUVlzeVtMdsSKXDscEVa
	KSp0YyyP3wv9+149Ir8PEkVZnFXCzcnV7b9Is6jBgq4jgE=
X-Received: by 2002:a05:600c:4fd1:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-4909c0f1062mr36191365e9.32.1780049472453;
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:12 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:10:49 +0200
Message-ID: <bdb099af08657e35b81a15bf9dc7ae2b5328c612.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031114_645777_4AB8DB59 
X-CRM114-Status: GOOD (  10.23  )
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

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index ea996a36b022..a5fe8432ae59 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3


