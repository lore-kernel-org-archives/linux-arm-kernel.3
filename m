Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11776C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=; b=q2uHKx+7seT7rbsOQMpBi2Qq0/
	aUB7Gke2wJKPuEJpSPMsCo0/ueJtGsd8TI73fNqIvwUQhevShsN9fBz6e7A2UuSsrscZnJ7Dv9e+K
	5RQWYyKJbWKAN0AGTKoyxQtRKWgg98NZTgp04AwBZLVE1f9AAi1drCTuCZg/vFsGWOBtS5IwafvcR
	O/tOJFTBzMvOlS++PngmQleQCMNtLC0mDf97KvMiOGrjyhU3wLBXkkv0/fJR/H2LuNaVB4Ef9ADq6
	viWzs5kr4yF7bykEiDP5o12LcSa+PMpx/avct7LNKjyfq9FM7n66mD5TMxgpAgAgu8EJLSkbqqLL5
	otoLUfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjS-0000000C3YB-3rSN;
	Mon, 06 Jul 2026 09:35:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjF-0000000C3H6-1jOe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so20856475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330504; x=1783935304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=OKUWft53MgbWdP6IZ+t5TOQj2JZFAvmd89ldY7fZ6wYm4VBOrm3PPfzLqGGbc1Ub4D
         9heFmrxjAsOnRON8IVpoodzxUk6ZPuBaeod2mHwpXGfrl6h3KQCp9/ID3208wU3lvX95
         jwqFIvJKLzS0OxKaVI1K4I1wYMyrsCKPspXmnL1/VrsJZWrHyVBFuMpVCwj6hUyvtCyR
         0FOEDqBjr+kTGCj7kUlZk6pHhV5oApZK9PWXeUTnWxqoacDdCWAG3WtBzDTg6LHmqH5g
         bhctYSGRYnJTFjo1n7LUL7JU3DfChQx1vhyBR9KJuamr6o0IRXzs4ooOZET/g6/9JbET
         KIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330504; x=1783935304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=D8oNZkN6dj5Qgbw664a4JqzL+qYGkrunNBGKk403aK7B4cV4HsyTe7lckuJ3Ikdybp
         DXmwdwgFV6mB74ngrkyDI9KZdZERqL/YcheQLqnOUZil+h9ej9XasaNCWyN77O8lupUg
         QKjT2Lj7GoNoMAv9Ez+kudDUHz/PLD9qk2xJFlzWi2a67aQaWuDpXPWyK9CQKiWQgCR9
         cBRMnLcogugiUT98esjkhtXx9IaAd89RhzgCKVonjSz4gTnuXLgU+STVoQRu0/7AguGr
         tgXAAwQruR0Euck90tikFHyFmqa7CIiGO61VyZBALOUVvkECKll5wijRyZYQ/mNcD6j5
         rElQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+PuzKv7TAg3oLAX5zq8h2cTdEEr05xB3d/dGQbvf1ueZv+bs1IbFpfRcblU384DhcYUeLSoIRM3a/dAkglAen@lists.infradead.org
X-Gm-Message-State: AOJu0YyrK2BX7Vd9OqxIdQJzErSDO5QK0kl/dKv0Fzky2HacyDRjD0ey
	utYsvoiNIRD9FwttTJI4FOx1Rdh7k5coOYqK0Z/Z4FFURmHztZXP+8aD
X-Gm-Gg: AfdE7ckXqF4e4y/8VU2oIgzDtiRdwj2ShJP58RNnzB9W6huzxH/lM3W+g/+Oj2aMmdP
	uKCTpK1mq+AqpIKgfNyVmDGFiNIk3/KZvCiP7kVYAzI8xlGLgpIYHozakL6Kn5zRospka3hjogV
	9Fd6UO+iDucj4OVxSUmRK1IBHjVC19pJI+n3kPMIqGen8FsIJ6kpk0tbwbVQWhTgRRFatg2O97f
	D5TSgUC+LSn7HJjYbLx+3pqBTNFHQnIBPdBTTGbrQPYaxbuuBm6yp1bQgY1/DTz58ZeCb7dMjVT
	Ul5KzlMYhkUlz8N8t1aV6DtOmCjI4+iG5X1B57iLFv+wJeccv3Pw9kdRhd7nnpIP7GX3uncswFR
	OexXMHKvhxqqIMLLRf5NJQQcLQlTvtsLJjzIUE0BMHytvqA9rU/U6YIz4QBAaOh2zwh+HKPxSlO
	bxK5y2kmTRurMzJcDpjvqytON8ERrb2KklqXjazzjQMA+HMLx3Iecb3+vh6712hHRw4/hQ5knox
	+vjdNU5BLGdtoOJFoSVQvc1Jg==
X-Received: by 2002:a05:600c:4e8a:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493d11f3296mr116847075e9.21.1783330503423;
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
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
Subject: [PATCH v2 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Mon,  6 Jul 2026 11:34:41 +0200
Message-ID: <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023507_784762_FE963256 
X-CRM114-Status: GOOD (  10.82  )
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

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3


