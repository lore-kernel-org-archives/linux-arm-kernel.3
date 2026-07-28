Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B9C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky4p9c619YcdUCwOZ0Klq8fyqRaFRsS6gRFyDHER/1A=; b=roJpJe+ISvIrttXF3+/a/CoYBz
	1Y07Sz6f6t44kglvYXrzc1pXVam2DAW3A4fAc8VDNFaSZzRitYbcSiSFEhmMca3Xhj/7UZVbJ6G2X
	pHJxnatjhs/RlaHWPgX/+sU7ZEU8sr7najCjmVewMZCffKp8AWOi5IOF9P432SdiRxY/MbFqLPRwd
	EFvX5guiW+H412Nyv8VhlxhSlEOUTrDGvjJLGBEGQy3TdVrBW2fMsxIIxcN3rxiyP7eq35v68K4tM
	4TZneSm9S+LQOaxiB9OnwoNmfjvT+wuVV+UANFSPnEfrBNsBhVD+2mrttTIPPSqcM5fqlKebmRGVj
	4vPaPNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjj-00000006BMA-0nlV;
	Tue, 28 Jul 2026 19:45:11 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjY-00000006BIC-40iZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 19:45:03 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7ee4f241f42so946019a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267899; x=1785872699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ky4p9c619YcdUCwOZ0Klq8fyqRaFRsS6gRFyDHER/1A=;
        b=bdyEjcYaILllsHGIIyDjQF9qoX6w4+zz2uoAWGusCHHRfb/gRdSHyE37ebT1C/tgJE
         eRI1vv28SxYWZdoD7n0iEM3ajDt8w6GKRgimZ96pDLxuNt+eIK5VyAZL/pOzM+rVy1KM
         mvGKZzJ9lc1FrKvaBZxVZ7fTS//+bbtkedhzxl/NuIRfvHCRYAoL1svIt/2zP8x/d36g
         84FIU+gKXy7s6x3j6eXKYhJR81vc0qRjS3j9cPsNxqwgy1h6rVDhr+Daz/VCZ9BpkNUr
         VRV4zh/Ss9tJ/lFNfvy0rh2rNoNrkfomCr4p33jawDKkClRzflWms9AqVbhlOyA8dnOW
         +3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267899; x=1785872699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ky4p9c619YcdUCwOZ0Klq8fyqRaFRsS6gRFyDHER/1A=;
        b=nMe4BituROV+RpCu/qaHGZ11h/JspGk5UE6PZgXKBJjx/7r88GupBn3oC2NjgBUS1a
         Up5wVRdwMDWzwU3XOr5xbqbuU8Po5ffn9E78c3mMFuavVoxUnxDcc4STuuccC83lvl2w
         kEHBzFP1HWuFgoI9Ix/rSJz8D9TJuc5d17AFcEThG3NsF5HaoS4Xs/rDtMAK3yqhhc/w
         dOVoEB+SnmwdHguBk8in5f6V07Lfkv1QaQfJmOoAj0qBD6J5XCr0V7betpm8EMiBdnPA
         WrrC1G5t7rz0upPyfd1llv+jbLLBtIw7oIdIdfEnmdXUCr9qlFdvfqfCFF+EFrUiTqrY
         BIQw==
X-Forwarded-Encrypted: i=1; AHgh+RoxdN2cCqBLay8cj2dB7IxDWACrfSydKZWSeq1IyssnGEZB7qphkdswRnaMIzr78KsLBxEs8ii2CwxUBk3wQbv7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9BE7TRgRdJQxXRDtu9ZECUCOXSLN/A754b0whK9pqI2J+Ao4V
	cvfQ1dH7RE1IyttMI2wy+ToVzrcFWhK5YlifLyhR79c0DLwB272dsx+pRfpNk0+ozVXX1ZRrWPx
	ACg5X
X-Gm-Gg: AR+sD12zhqcU5nxdnbQAsOLexFiNyHJQQQVzRTarAb9Ea8xf13yDXbnTDx5PObdGNrB
	3aSdmTc17XS55HbsQRuxizqVcjsn8V1UJKFohRKJmftX5HhcfvFZlixiUolJoQYpgIVQWB/JRJ3
	h+k1fE5JdFsuKEYf87UM0RVNI9JhvZ2FlvVI0BrjDAFJR6sBP0RMcyXb9EFxxPsi/KPKT++ZUiq
	3WkC+W6yOpUzFeCiGixDDCfPidyDIZ4p+4qfLkzztoDKDEJPRgihhXkaThhclliu8HgTGljOVlg
	ZI71S//kkgYIvcRdnOhZNy6sUa50rCtOZTVDH5N6EizwHqVOwjWobWJwJB6TjlwEsGBnM/Pv8dL
	TSuNcspTWHox1Zy69lSXZroDBqk62ysqkm3mBPONaxud61XLRcmVpnwBtWmBOEsErHPCJSaa9DG
	FpHR7PEoI=
X-Received: by 2002:a05:6820:2d06:b0:6a1:64df:7324 with SMTP id 006d021491bc7-6ac969e9b7amr1667291eaf.7.1785267899457;
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Tue, 28 Jul 2026 14:44:36 -0500
Subject: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3kap1OQlb8KQEJvsMqcMvJJGQFNmK8fFj0hKxy0nSPA=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGppBq3IR2kx9BEyEAIpkrtzVhoxGf6F4nTEAwH5xCRvnCWdV
 YkBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJqaQatAAoJEMLMIAH/AY/A7J4IAKJF
 rz9iDXeqootTZWb0TQ1maNwTTKROj5YPp2cA3V4dt+ISwxNdRnSobLrtm9T6moyGBJYomYsT7lq
 5wZ4DXMWCD79PwinGdZNP2220sn5bippcoLZ7xrM7uo7OWFVUsULiTAzRDz3lJoyns23MxwQdv1
 xp8IY+DIOi3pze9ztgdm5vZlToaPZbKWOCDjm+BFA3JzYGdrsj3PWIvJaIyK5MBuQQtFDyzqznP
 qFp1MleNbPkzwtfUs7YcuKEkQuB810p4To/nT8Qrt5IsjQYGkW26aCyDnM911fgPAgFJDrKqLxD
 dV/dMgYBsWcPtlJWf+A2QSbMS4I0clxQdWLcAkg=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_124501_020524_2A9C2C10 
X-CRM114-Status: GOOD (  10.08  )
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

Add pinctrl-single,gpio-range properties to the BeagleY-AI .dts so that
GPIOs get the correct pin mux when requested.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..599d576f694f 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -149,6 +149,19 @@ led-1 {
 };
 
 &main_pmx0 {
+	pinctrl-single,gpio-range =
+		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 72 17 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 101 25 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 137 5 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 143 3 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 149 2 PIN_GPIO_RANGE_IOPAD>;
+
+	main_pmx0_range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
+
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D23) I2C0_SCL */
@@ -267,6 +280,15 @@ &main_uart0 {
 };
 
 &mcu_pmx0 {
+	pinctrl-single,gpio-range =
+		<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
+		<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
+		<&mcu_pmx_range 32 2 PIN_GPIO_RANGE_IOPAD>;
+
+	mcu_pmx_range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
+
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_MCU_IOPAD(0x02c, PIN_INPUT, 0)	/* (C7) WKUP_UART0_CTSn */

-- 
2.43.0


