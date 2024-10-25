Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4C6D0C5F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtKvVgvka9iN+kbiGV17uPT0FqDZwLoJavxYI8Qd0js=; b=bpn3IJ4vkwHlg+fHBkiVC2qbJs
	LcNSvr4oHF8AqukD41z4+V8iiEYnrxVwylw7mMex+LbXRetEh0F0Vp3gmZJOZAR5i6vwLzeuS1s99
	Q5UOV5Bc5FTbgOWRc8v0SHCUu96OvkcQd0SmwPg74ad2DGLFRxXcO/aVRjJlbZeqVfXM64qSxb2co
	aPQyZo6ocN1dHPbxNEIquhN6LUai5vm2y42pdD9yYKeAK8QR6hrqpk/5PAALHT9RSIk1udHJM0MZq
	opwHsdddHFq/pRtJFdemXNEHtxoqX7IDpBls2t4i71IiM8sjfzh0sYih4U6f+zjLngnrf2BoUMbQ1
	uhnPtXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HAN-00000003I5x-1ZRP;
	Fri, 25 Oct 2024 10:03:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H6I-00000003H2K-0hFZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:59:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so19045615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850360; x=1730455160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtKvVgvka9iN+kbiGV17uPT0FqDZwLoJavxYI8Qd0js=;
        b=Us4Lg+hQfSrWAzytsLcePJZzBDiWg04qaeMwYMbz/fIUEOe9BzW+hDpCk0zO3tQ6op
         7X1D54iqy2ClZY7WgJgouIR8uWYzI8Xy9YdH9IdX5I9tcmt/s9pO3Ci4pFqTTmsbjcSN
         zwmnRus5IZkEfF9pQ4n68bKPoDuxovDXA29iSPxklAh+ncWmv/ecBc3DZKN0bnjm9axL
         fRThb3Xe0l9ya2codLHXv9CLiiNH0MUBUDgZ7Z0N3nzq07X8GG7GLCmHGI/uoYgXR45X
         eFzqqArFSZzQbBU8SVACKsxb5a0plpYDOs/HsTfh4tISLQuZNtaSggxMTZQEJ8uljnWa
         DkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850360; x=1730455160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtKvVgvka9iN+kbiGV17uPT0FqDZwLoJavxYI8Qd0js=;
        b=pCa7zKzkk5oula6zj0SQVifmHzWtQDoX/rScno7ZoGKJE0camhF7z3L7Ob1ZdWJLJ7
         UfKBtqPSBc0RKDCsX5YRQ4R0ojF8cFxv+OAlbmKcfid/8bSouzclPJt+Yf5x/C07scXA
         +rALX7LTsHsgKuseoy1lGHmftggDVSn37seI/16Z9OGG2K4B6A85TmfGxCDLK65xh0C/
         alhvpZnYiZSYbdUOCtGF3boSSft8NPjho9tnBK7ftgVY1gBm5SIsst4p8CPIoYnOPRNf
         qB5mRrvA/OJGNpMFHTojQWhobNOQiL2sfbugtFTDw6r4aXqjIMspLZHRkXkf3riMadXZ
         BFDg==
X-Forwarded-Encrypted: i=1; AJvYcCWr6xvEYleO76xcpUvHGkbxRjWwBFtKlUTsm+PgqAi2FHq6UFBnV21LWamAus45lznu0tYm2S0CaDlLgn+C2O4U@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl8Ged3nTgoVVeKtUJi6q07NWdcr5AMeRm1PtfSKSJYBDVdv6B
	TkgWcAtlMoo+TvxWutkSY7RJjwAtmO85+CfXq1OWkc7UC5hg75EP
X-Google-Smtp-Source: AGHT+IHgz1qa+4ruXXEU9mLOWIYjUTskP3J0uPmavT75tDGVcKYFxvpomruMOKNd7WxPb9yzDb7knA==
X-Received: by 2002:a05:600c:5123:b0:430:52ec:1e2b with SMTP id 5b1f17b1804b1-4318c77ee2emr44793845e9.29.1729850359933;
        Fri, 25 Oct 2024 02:59:19 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:19 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:02 +0200
Message-ID: <20241025095915.22313-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095915.22313-1-eichest@gmail.com>
References: <20241025095915.22313-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025922_249854_CAF50873 
X-CRM114-Status: GOOD (  11.13  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

By default we expect all i2c nodes to be single-master, we do not have
any module or carrier board that uses multi-master mode on any i2c
controller. With this property set, we benefit from optimisations made
exclusively for single-masters.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fa3959141911..95d5d2333ca1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -367,6 +367,7 @@ &i2c1 {
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "okay";
 
 	pca9450: pmic@25 {
@@ -561,6 +562,7 @@ &i2c2 {
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
 	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "disabled";
 };
 
@@ -574,6 +576,7 @@ &i2c3 {
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin I2C_1 */
@@ -584,6 +587,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_gpio>;
 	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	gpio_expander_21: gpio-expander@21 {
 		compatible = "nxp,pcal6416";
-- 
2.43.0


