Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64307FCC06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opNBN+DL1CwCTEmCmfQVU04W6S+7jcXxdGJnG1le+IA=; b=pAsNDS2qwD3zxZQ+0YXWiUgp6H
	uLWK7I9ATa7SpCNAcG+HUHcJ0YusQJ0jQSMwoyn9i8kDcq7twXA6YW/uhoDrpNkC10S56bJcQLUr8
	/mWNCQxBytgPkR4CO92lBt0oEUbZewEtyxmdqz7MnzAVmKEsPB0Gcb3ROwmiymdxEyVPvBaMpAfvF
	INS77Dd34L1/FfcRIU7KU1u2sfOBE6Jk9+7SbNhyANmlsM6kTR/nXIt5lWdJotQJmpq/PJJHKGxOH
	TBrb07o4HAul54KCRdhdD+iQAXSlDIPZ0FDrCaYHH51INMpn8Ukovm2KELMhfZ8DkxG/429VDvye+
	CHQgOMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK7-00000004QoR-2kqR;
	Fri, 06 Mar 2026 19:58:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJz-00000004QeQ-3PO2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48370174e18so58720885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827130; x=1773431930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opNBN+DL1CwCTEmCmfQVU04W6S+7jcXxdGJnG1le+IA=;
        b=KtzzQeFt1922KeO4aS/qzFjEGqXUbvCuJEgIgWZZa0X3BEaEjFl4+/4yS5PeY10dmq
         EjZpkyQVmGDXXf7VgS7pLQAWHz2BscNGxx6Y+kj28Kf7Sb2mbRF+G+H01uXmpv+FLVGh
         dzDFaQ6DtqKmv1Qs0Qz6K1c8Z5yF2tsvJNOyCv/yufr4WszxHZ29Acc96pLFkmxgQE2P
         uvoB4fXVQtGHLX1YWOjafrR2eft4j4tzuKQqhlopbSUOEHBzSJp1aJOUwg3RhOqPgEt6
         UI42vZIu6tJTJVNGppxR+QcNM5gd+L2k97wyAsRuMOLOaIWULRMQfXYUzh6YzwbctET5
         Xgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827130; x=1773431930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opNBN+DL1CwCTEmCmfQVU04W6S+7jcXxdGJnG1le+IA=;
        b=wBAtwYWWjaaxovKy9aLVQvBNZJtqkaHjzxsuXYm1BF+RO/T2j//6X/Kb8hvWX3mxLq
         BXiJ/E8DXcRbA1BUBTMagsmpf3Gs63UfWF+doVgfJ+0VZUXWXMeAVr2rmxuA5rXdzfiD
         fCWsdrenzHrAwtukTGWdgLw58jqzXOhCTTBUi5/QeuVr1yKBZGJqZNImjU1pV87FdNNL
         BFxBPIAAH5Y+0zqu7E6MDcQW5+xcJPLNU3YalxqoFGMJdAs/O7ZSmEZatk0RJYTsAqlc
         8TYn+Q1OGW6Y+GiQO/1IbbnEseqFiBwKFc0Td3EMw+dF9I2tboeOjdfX+BmvfTL3IWsj
         v7xw==
X-Forwarded-Encrypted: i=1; AJvYcCWdkpVTJE7REAf+8e5KW6qgbRFJUlNmmv/lTcmiUJXJWPs+0fmZlpAEIExS8g/Nv1ZPVpoJ0U8U8t6fM+TESpOU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8IfQHD3xkebod52NVareqYpb9q5ojp18nqcfwdjwTfn5h7ybd
	OM2G2br2qYw7ipCBX5l/sR95yyeXIQuc+IPQ74+aywBSG01PrvyGQCzk
X-Gm-Gg: ATEYQzyHCFTCJSTdeEFfIZMVvdP1IqSfU7VcR24Ms9PmxJA1lL4Kbpgrx3c3/IqoqVV
	0HXgBvh8uXVb5PeH3Q9jdUfXMr2j6UEJuhJoXMFV1oCOo7ha3/h1zfvrrz5v8bIZsP2vKURpjGX
	reoGAjsYhebUigkL+prv/QLqaodirfLUhjguz5yYfXrlKG0EPaq40Aec701zukgrsE2SbIQAq3f
	Qsvhpv6akZt7nKuv4J2bzD/LwzxywdWtAFBv6knjN7h0WQXv8D+peL+h5gQqIqktChFPoyyUl5F
	/YbbCnBh7dWlaJ71sOIHE+EmVdoM6WkYtGTLKMV6a+ZEltG/B2k1V6BUaWyOT19i3yLwUydUV9C
	CnEQMJne4meBlpH8iYZzniweCruRrmN/CNK/4Aol2XdcUrhePY8y6WlhG/itoMkDer/fWyYEctq
	BQenunU6gB/Yi4kYyl9J0U6EgiqUI2jO0Lda6Y4nB5rmm1s4lrzojOY7i1aMK4Q91v8+pCY1BFo
	YaXDO4VQFXKe51egkzDD3AK6gi4xHEYkW+zxKI=
X-Received: by 2002:a05:600c:4f0d:b0:483:5a29:9678 with SMTP id 5b1f17b1804b1-4852691967bmr59464725e9.2.1772827130125;
        Fri, 06 Mar 2026 11:58:50 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:49 -0800 (PST)
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
Subject: [PATCH v2 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Fri,  6 Mar 2026 20:58:29 +0100
Message-ID: <02dcc47d59674a9945ade8a6f2c42f4c0908942d.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115851_867127_C0EE67B9 
X-CRM114-Status: GOOD (  10.57  )
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

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a77085b264e5..9a29c81b06eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
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
@@ -288,6 +298,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3


