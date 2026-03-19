Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F851091911
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu2Rc4rssQfTFJ5EZaq1oCgNnoY0eCc8f3U0nan/fr4=; b=k4v7e2yIqQZwePafh6rsoCCrJo
	JUEHqzAfNabtsqzOraONdbk6JxhBi6uFYy3VdMiYkz3GkdcUBwoKb8NS31iKHudlWbxPRa3I7t6Dn
	+ra1y0axbNklUkwefAdCGp7ilTwDScL4oSiSYXU9GHqB+ME9Doab+S5EOIDxr0Q6QlYNjInIOrY1z
	UlHOhmPp1vzRBipdaGFYjzQOi5LbvUG1QjH6h6rpx3KFi3twasJxiUJOz4Q7sXyJm4KMi37wC//BE
	+bvYeipHzVuLlzk8T3uCafbbyULYb8Oyied60OJF7SdQL6/iy7P8cwfYZhl8Kubj+s/KFcX3wNNCi
	+LD6NQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJx-0000000BNYs-0dN3;
	Thu, 19 Mar 2026 18:42:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJl-0000000BNN9-1B7A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:42:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso11811635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945719; x=1774550519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu2Rc4rssQfTFJ5EZaq1oCgNnoY0eCc8f3U0nan/fr4=;
        b=bgBngA+T5lLHNErC0nrIcNptAB9hKVmcNvkdSm9zYKVPD7dLkMkhkq4mER9kPuV8UQ
         LZ81FcAZVSAyJPW+R0TLk8rbfr/QFS3FgmaZo6+YrlUaLkR9ORCmIlxWfYKPSRr6UXJU
         EIdhWAcOInh9Z9AP3MVWRSW8kXYtH9mzRBcEmmf7X+IbGu2FhHm7Vpq40AjuW1ybPM2h
         oC+akZtm71lg92hh52bx0CLy7vAzaki8srCp6w0g9rAUBhpbzezlPtbYmUbLEy6EHV2u
         Up/uvvQ5ilvBlAxk5fHqq1VRm+rLl/tkvZgO8J+iyk5iySgUaJQALqkK9JgqY7nAh9uS
         RJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945719; x=1774550519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fu2Rc4rssQfTFJ5EZaq1oCgNnoY0eCc8f3U0nan/fr4=;
        b=VvdGFe50DaE9zNLrwRwH3cZFO1K+GUGruxyQ59Q53crbUbxrA7IWjurd0P8xr1Zv6C
         JcsOO/cdHqJA3ocmZIeiD7KtKlLUtx9krtUe9A7FwEwrvi6uoJzoS+jcio+zW+AhgqPH
         7AeDLZjSIpePoyrhIxRHBDW7ThkUxyGAbjgpAG3veXbMTo0hC5knhS9ie9bilwVH7Zsr
         NAxGQR10oGOzjr7ux1teX5tLI8NpQsdrPeSZ/35TBhuZXXpp9E4F7FKxXv62cX1nO2Mr
         wTlT0GyDjFgLsBEHsiBYuQKrQcEKJTtKTBiwef4C50FCsuJy3ru+qrcT2UUYatfuwgPK
         3A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhauw2/XsBztox+HAOzYTLhJJ5jbo8fKONdezQCIKjWU3a15sEMNpootc3oh0QFoifEgSiUAZtzLAS9XvIcGL8@lists.infradead.org
X-Gm-Message-State: AOJu0YxIZB/qxZMuy/2bPRxvs9BFlCDgEwaC9WUcgC7g6GrcI6MQ+guZ
	DTk0v7foIhSE+RxefB4wFg4FHDz5R5XBLd0+hruzf2dKOoMlY6/5C4og
X-Gm-Gg: ATEYQzxvemC1AAp8PHukxB4wRHfbZmoY0aYfqSYHHbNEbzJiqRiSAJvD/QrGZ4BT42n
	DmGOHyKq8+OayVNd3ky5aVVUT6dtC/F/JaUiDNs2NdRQ1OsAPoGB2/d8QFQYXyY2B5D4slR0iO/
	SoM6QKPMclQm7s/F56QYiQR1pVhpLp6hYlH3rCg39fZdUJ0lM/ODAslGQANMDdWqCUBAFxIyZNj
	9PFpwxqGtclwD0Z4Xpl88+tzqKSs9EnZeut6iXpq1Ozr5aA3gS1Ogkc3cpR5iktedtX7opdNxN8
	K8wE7BO/PVsWh3GNlqIiMXUw2RoIlNY90dzGhFjoqvGABMTUlokpNj3DHZVRJRDGYyh9hLd9vNn
	VEiyT8dXIGr3n6zftmK382VUOXuQvHDuFh4TBL1UUA0qVcPpjRHv3lLHHTD3zj5swleExNl2QG/
	hDMfGlLldq4uP9JoBXV43XzmzFa0hKCByxs39BLmnQ7Z9y3fPAraolaQmEG0iIPySZwAGdIBpeX
	+PztXowCKwqB3FsWuHsIi2ICgmqkuahQqcNB54=
X-Received: by 2002:a05:600c:1da1:b0:485:557d:9fe with SMTP id 5b1f17b1804b1-486fedc9c01mr2720365e9.12.1773945719265;
        Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:58 -0700 (PDT)
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
Subject: [PATCH v4 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Thu, 19 Mar 2026 19:40:29 +0100
Message-ID: <570b16455e37e7ce4d2556ed4e21d67ac3a27183.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114201_341232_74FEAD12 
X-CRM114-Status: GOOD (  12.73  )
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

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 6da29845985f..6112e4392c59 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -153,6 +153,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3


