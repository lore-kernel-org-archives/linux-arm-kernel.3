Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCD1088E73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e+wpvoY6yD1RG4Kj+AWSxyaFX8YNngg+IFhXCxexik=; b=TqsP3AJ+HdzvFabHRC7DqlBnGT
	QQGpKioqqLilnECpUD0BA/rsyfPXOS4UI5P+mY56yXtOE38zdpOWKHxZWo7hES2ylnljVkpecQGJk
	ByUlUqKik8kmK8HjIV7wxX7ofE3E0jQbk9x3LF9vT1/scBbFq5oScK7d0kmY2bVPo4m1nVGSusAbf
	dw3oCaZFg7U28Fy5/v91zhC0pyeO7uDrjZLbjnJRTBNpUa/ZXjGdoWpvOJWau/+7oDjUZ+gVK8232
	m4vBvfu+vgBtNLcfqJ897+j+6qmVVYwzkPYDYUuouy4p7VdnfxX9z9bP7VfK4P8UyKpz8Hl5wSRRJ
	jLIxbGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SF-00000009rIq-0Kem;
	Thu, 19 Mar 2026 03:53:51 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SB-00000009rHE-20aW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3591cc98871so111990a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892426; x=1774497226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e+wpvoY6yD1RG4Kj+AWSxyaFX8YNngg+IFhXCxexik=;
        b=Q2nSoBeZfkPy3eenymdFE5cYIZMENYCC9rKWOPRnJrNXS7m+c5a/bxZVufLDIlUo5j
         OYNRl9PsP+UF+LF1Bi8YanxmVQLQWzF+xWWZ2i1f/bkOssjtR1Yn0i43vLa/l3OScVUB
         YlhomMdWJ52V6ronQrhzBWxujjx/ZU5MkrktnpHP3a6/pCtytkpvwk7gyjRzSYotsvFl
         4gM8PeKRO+ed0BBk9qcMC/UYGYQqX63vZGuMjj5OZruiHEI+VZjOi2CvMRRM5fgzpZOD
         L20xMTG0vThMezF80Dtl3qYS0MDhYAcIgiHN8Ij0YKHfKAOBojM35YfWSKlubG9nOna7
         d2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892426; x=1774497226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8e+wpvoY6yD1RG4Kj+AWSxyaFX8YNngg+IFhXCxexik=;
        b=J2jxFEp1hjK6hD9diAkTdjjRifZGTSbfU8pDi4r6qGPXpvySeKUXSYtujz/OW2Qi+l
         s9lhn3pilEmKpde1WCngJAYfyc9y3/f/8Dbw0PHaCKsHRSJwegqMCsO3mKQf7lW+zRAh
         Fr+rkpUNOgwTUh6kZX/srJS5H+gn5dnv8WVWCGYKKL9alkhkBGDE1ziSzwHXFPn8HlwN
         NqxeFqjcgWGvdg5TCR90/7kl0MKAcOc+a/kbzyEO5hrJ1edGNAyTCE21eG29gwdH65so
         jiloPTWO9auzlLxgSCHWpLtVlvswX/Kf3vKAr1SRMplV7Iz4xa/xqiWHys3shG6o+dU8
         ydrw==
X-Forwarded-Encrypted: i=1; AJvYcCUieG+8ll6VA/NefSSWzvog/1AnZWsj9T285QIPy9kVEGBwNNTNaZ3bdUXrKp5TfJpeiDUyEWcb5ounmMH2FHOP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76iMwlJn9FgJfp6MTvYRkzgidAJgz5H8VwKizboapE7WW66IR
	fFlZi8NP6RQe76OJ8BOFtZJVzYCD148raaaa1I2360lhtHiKjrdTEAtI
X-Gm-Gg: ATEYQzw7TDLYB7O9DZ9TbwDKjJyA0I7YdpMhgZfueffsmh6lj7dKlaX9RYaV3zWEDVM
	S1Fk/Ui2lMp/zDR2ByhLvM7gVIwWeM3xA6AMLwKYl5QO9vtaefKLyoOiwaTVNMFnDUNCD2XF+Lw
	jtvOUI5tFj/YpBRe5IJFzJzJ/y9GMybTFE1ki1OIA0zaV7Zs6Vr4eXJAgnk63sK5rVMr4hDlC5N
	og8rLcJylI8n8y8yA8KBOkHlmaCJBUreRORIkFw7JiiEU71AqQDNgEUEIJACUa+q1d+sfNBBUTw
	Ggd9M7925B3r/nzvi5gfTwNuMjW43zSyVM1zK9gBGRpi48urYKKL/N7vYNzfmN1B14kbtpmdsbF
	dfumVRSiuosv63ZmM1XYhFirSftBpv462RrLzqJ6FYZuzdRqOcSAQ0nEAbSJ0Bomhj5mqJWZfoE
	Z2GOsQp0zt0UN/PlCK4Elkj7oY8vhiFCl4y+kq7wFGLfGP/662g7GJpg8=
X-Received: by 2002:a17:90a:d003:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-35bb9ef531cmr4730069a91.18.1773892426512;
        Wed, 18 Mar 2026 20:53:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/6] ARM: dts: BCM5301X: EA9200: add LEDs
Date: Wed, 18 Mar 2026 20:53:21 -0700
Message-ID: <20260319035324.269905-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_205347_536310_FDC2F59E 
X-CRM114-Status: GOOD (  10.58  )
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

Allows control and configuration of device LEDs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index a579c372d404..617fb55bc52f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
+
 #include "bcm4709.dtsi"
 #include "bcm5301x-nand-cs0-bch8.dtsi"
 
@@ -52,6 +54,43 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_WLAN;
+			gpios = <&chipcommon 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "rfkill-none";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			function-enumerator = <2>;
+			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "usbport";
+			trigger-sources = <&ohci_port2>, <&ehci_port2>;
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			function-enumerator = <3>;
+			gpios = <&chipcommon 7 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "usbport";
+			trigger-sources = <&ohci_port1>, <&ehci_port1>,
+					  <&xhci_port1>;
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+	};
 };
 
 &usb3_phy {
-- 
2.53.0


