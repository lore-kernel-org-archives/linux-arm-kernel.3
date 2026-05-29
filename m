Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2521CCD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=; b=4zM6+bLKy11V+3Tr6V3I5jYtG5
	3NGICqg86aFDjmiM+4pE8VDvd809jkt8MVj8z/fZLyofF8fdYQAQU+eQG+sjWJIcDQuPp9fGtNu1y
	2ZPflniB5Jt0t1kCZZvVfHjrM8fMLrIYFsRpMYliGchqOFTdeXK1Mo+ziU6BhHbZFQaK8ZslGG/ZU
	HZRF0KPvHbfh8HeuQnWtpGeti6W0041TO/2VkWAZuHu1GkAs3W5mnhW0bmHBEe9DJvK1+uppg0Ti9
	cTFKEBSZELoljKM5alF69Kmm/J/PDxK1WbS7QUrMQRdZW0FAEU4xQl5/R14thAi8Jb1P1SrKz75Wi
	P/3DTksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupq-00000007E37-0J1H;
	Fri, 29 May 2026 10:53:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuph-00000007E07-3jBq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:52:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45eeea039ebso565767f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051972; x=1780656772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=Bk7NL+WxGmp+W2NVa510mXcYPZ69YtcmCVQUr9SiuxQQThQEY7Ao8Ne9wsuCHQSlLl
         1DnmsTmNVZixs84J3nGrzWOc6tyR9WanRWitxDbjyvqmCry3aPIgBqoe0ov0drJhqz9/
         4aZ0TzRLO+wk8PyxJIxzu/alniHPR1Oede5X71/KzO+g1V+x+vXrZqGyg1HJ7uUHw3id
         IkiTHXhZd/7VTzPYdl54DE/NPcJmfZbyt+C3VNsoBMDvnvajg/l6g7Ey/o0RJsv0k5FS
         Vyj2Ci8PEKhWl6O1AyBwneLcJt1dEiCNzvFqwPNhvVxcHenzYlidNjNgIXBMTJPJJxij
         A0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051972; x=1780656772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWz1bxcbCKnB1qui3eEEw2DsDlA+ORcLDTKiyWMH2XQ=;
        b=OmQ9unCdYBAtO8d3JELgmavFgHbata4EDLEDJfV+I1+a5PPBvBVHI+YnY0/JMBvyct
         GkZ98Ya+2zERDTXq9OSia8B668c8EZ0K5dd3o8RkNRl4P8BspJ/wKyM2/eOtpRBFjHWG
         9azmtiUoEpz4yrA9cFDmzS7TB3bTJcfrPEJGdzWn9ymZoEQ14RJyoGuSTEf2N8jAkECo
         tFVgzOOVEZUP+sYAbRZPm5PbwkzJ3hbbly6jUoyBjAxxzGwFEbO+SsgyzJ9EM4aIVovo
         31DBw50lSR6UVtgoAh/+7rCEaV3wq1bY9xsuFp4tDhBWWCuKtiWvRQalWZPnJ3yx9JKm
         zzRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LPkbW8AgoeecA17+jHesywZ0Le9qcwc/srhoC/5ifJMZUonS9AWQg7PqztT7ZMP0kw05BLCl/TNYFKtHIhY4q@lists.infradead.org
X-Gm-Message-State: AOJu0YxC3IBRdl/EDLJu1LU44itXDTemzrH554fzw10TrnbHpJBJ9Iom
	4Xa1vGEQt7vnu3QxhJlf6J3hcnhNcKbr1eEia1r9wWSBVMDSrvKANM1nl0CzYQ==
X-Gm-Gg: Acq92OEZX/7puItugkbTKqy75NrkIec2rVs5HQF11DiwLMvuM4+Y4k7pTtcXsaD6j6P
	yNmrCWilP3LFz2c15EJX5aioFL7xffrrKkjW4/5rMwe+QZqSAuJYQbvLT75VYHqnBI59FNqKMc8
	DJtnfN9H/HwYFhjfuPtSra8BuL5MebfFuB3UgOXT+SAqZDrsrQwMN+UhR1/8G5oWak87Lj0vGYm
	AJhpz2s7jRFjbrYL6nCAYQ5Oev3rmrlzOuwEnvUK6EhWYzLqy7u2kxG/JeRTpPBi6KezrBKT7CE
	ZIJ++JypO7kL4eQhkEJrgcxIkDoPrCWjD+AIi+aWYWcaQZ6/zlxFRzl9DES01HnZn+eoeIb8mC7
	VR52c8bjt0LcZ25edFgAZh3Q/o8Ur/uIH4tNraiqe9H7MbVvVW0/yrI4IXSymjcH91Bm/UP+tld
	xUda6bj3ul8MfxVyfZSHDhhQhC++3OsQcN5kAIdK/1FRG0SEwdH4bx7u2lzvLMVic+3c0xtCeGt
	a4LZpF3EUVq9AzAEkIIkir1t7yg2YFUucj1sMNpc/bmmy1ulNbsLA9Rkw==
X-Received: by 2002:a05:600c:a08c:b0:490:9d1b:2033 with SMTP id 5b1f17b1804b1-4909d1b228fmr42473415e9.9.1780051971822;
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:51 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:52:44 +0200
Message-ID: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_035253_942799_ED7D5346 
X-CRM114-Status: GOOD (  13.17  )
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable line is a board-level signal driven through the PCAL6408
GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
this board.

The TPM binding does not provide a dedicated enable GPIO or supply
property, so this cannot currently be expressed as a direct TPM
dependency.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..f541308ebf6b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


