Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF79CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=; b=TLiRQHWmtsYdURLXMDeV/VbmO0
	/y9ok1Y3hc08NU6FAouLhBl8pi9PFVhdqZFH2DXeDy1sAVJID5SE474nJBcvh7UE7JiIwVukZY7Sb
	MaUNsdmEY+qbXm01KdgD4PMXbyYRpKm9GILiH3LGn9Kxle+divdynaJxe2gS8AuGybz4GUy4YsauB
	IjbRSo97I+O1+JyfoIBbZUrz6KafqxRLyxJ8rEbX/svEOVC3XGS7kxT7PTs0QaC8o6CYff8BaU3F4
	Bf0pT9drbySzicZ8p/jNDcPabV4K/gisCJH1RC3fjqU1j5rOFjq8624JmyCpoK+DJZbCMMxHEJ5Jx
	xzHZWPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj2-0000000FH0x-03aj;
	Wed, 03 Jun 2026 14:37:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiu-0000000FGrI-3HJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490ac357c55so35468575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497455; x=1781102255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=bxSxeIOVGfiCZb+6sPYGGHgT/1ORzDsu8RskEicKpYj3WMZeW0Gkelzm3dyLQC1uJb
         /+owPJ/qXLWfXJ/lnfGF5J+84vp2aBehnJcTM0Qo3ntQUgPN155JjFCYab1uNPYmLzdT
         ler5/lZ6/5SXMra1GJm9gWEKmBpO7wnjgvD0JMd+LTPW8VY5Pa+Mc3qo5V4IgIi6Ajxz
         xqJo0WRgpNKMG3IcnE8npMDYmpH5qONtCf1FapmJGIgBxny7g4821StjgBPk6xnMB/hQ
         zBrXV6y17gep0hu18KS94dAigbmdTm4SfqvzCeAkxWQPzm8B7NjBsCqXK//YWWoCwpm8
         GLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497455; x=1781102255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=FyhKJsQVcd35HxShNpTP4F2XjDMdTWnLZjiGw5hGG53qXtuc2VwCu6l3wQy2iaPjJs
         dJ4xnvFV7ocxpq6Pqr9Czjv8Jmf01bfL5sL+DgmXFXQaAqlsScuu3QZhs9yUGaTJhpk+
         SrhFC798zELQgDiwcvynfPhEjVww/gpAPOHX/+q2+xhgNe9ELRhM7u+BrkuBfFULlKWj
         MJcn/9I2H7OhrMAZ9xkvYHBfroryuj9EmAX5BJLN2bDz1bjnH+Hxe5fD3sYUDr/PuZx4
         BwVsTTtCU/8z5GMwG7gP7OH1S/VKPBKWWnt52EGIyp+8/5v3F4lWINjvaPVplUBzRE6E
         uNtw==
X-Forwarded-Encrypted: i=1; AFNElJ+TxikLrcj7WB4TIN4gRkBb+4cbJ/3IeAEqv//AFflfWvFM+/8yO+ReaZZqPET7p4PbOruFpGY3TbsXi6s9Apef@lists.infradead.org
X-Gm-Message-State: AOJu0YzyB78oRQbHfuaH6B+7iWKFuA1B08iBcb9vEb0HqPeZKcm7ngjB
	2GDOoLZ7ippwe6UDtaOdipAeKf1SqC8SyLqZDXw8CxrflQst5sIItiku
X-Gm-Gg: Acq92OG+oY8mju/AXME4c/44Lmrmi6IrMKK/hv9mAp6YXHG0fqPlOhOQCcNJ1Z9jF+c
	uKQ1zIruYkx57hwnIbYL7F/Vms/GEOv8eOMe+j+IPDWOiCblIdejBejmmfK7aLRXQ6vmI7orzwN
	V8qsiDGqOlfW5tNQpwaC5vyIioEaxABZxGOFoAPwvbJQiriI8JomWtWddFZk9gP8j+qEBJT79Xh
	ulpJljtYHeMyAsWDdMjGUT2wE46XnNLh2HeL1zkZ9N23ySA4+KGidBbKmO0A24JzRXsU4NsIJH2
	FMDnsTWTsEhtJTQCBLav3ffX9484ikhuggd3Pius6U1aO6Hjj00jCgZWZ7D+kJ7sKcEvvbkst4r
	17B6Ny08wikYahL13f3YtpY5n+xkLGi6nLiKMWek4vRjMcilL9Hf0JDll1b4/tPC1jGSUl/kHpy
	ERaCaYAnpeR7R3Oka/KylNSTpo2QUbKbNNeWqCH2ZHB7g3jB7ReWnO03BE2mc/v3roHE7thofMR
	lfA727bRKwm/6puO5DFBXmOw+dUrrn8gEBs7ZEh2qlUAOcg
X-Received: by 2002:a05:600c:3490:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490b5eae2c2mr58556025e9.13.1780497454747;
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
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
Subject: [PATCH v3 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 16:37:15 +0200
Message-ID: <5c79f633cbc4606ccaa962bf7f3f92bbfe6b522b.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073738_217766_608E35E7 
X-CRM114-Status: GOOD (  11.06  )
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
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f7eebf265fab..93098799211b 100644
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


