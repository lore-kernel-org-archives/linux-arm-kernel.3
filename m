Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6BEFED9FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7IffOQPDV8+R2vLMwqGaiOzpiBs5raeLy7NwaqA2zE=; b=uIlCQ1fgbo0i05ZwyoThjIXzhJ
	aEajTEVdA6aoJ+NBWZd6eVfVk/BJPadNYUsLy1d39CC1NBQfI6cFaYamaXpzGbkZ1pF3vAMhSEGMK
	yabwdvlBaIoF6Va8C/LiAIRmXyAM7AaTDmUoiIVfA0NMI3Copm8nn3z/ofR/i2ge+zHFHsynVhHrh
	7m5mhUoPQ5mQIda2roKEVP27u5/WqZUmHfdDsTqEeg1IqVyafMxqhlIWNBijZLqpneBoLcH5GY42s
	7BS49uJn8CXAkoEAAmub2FRGWbcLeSSCAgxhKHSlzZaCIGTVkdGmUYTfRYkPpHaHHx0W+i67yGOWz
	c1aJO2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YqE-000000071F5-0TZl;
	Tue, 17 Mar 2026 18:08:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YqA-0000000717G-0G3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so50635615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770904; x=1774375704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7IffOQPDV8+R2vLMwqGaiOzpiBs5raeLy7NwaqA2zE=;
        b=oPvvzNzXU4f85I4/A4Bgee2TTY3rK0UnCMTadxpq/mRhG0jguWvEwjPmy4Ig3FitHT
         jvS+jUzEL5h15r9erPDqdDqZ5Yog88p1UyuR9Tl1PrumjgWlAPTd/WmQK0zidePoTpti
         Px97wPp4deVMQk31xnFu9HvC5LtQuY7SF0zuxWnJrGV1ZSe1eMe/DLJGbE4ml95cjnFu
         mnlLUbT0GurP/10yF0NZLu1fuT6teL//vGz4r6ERsYjQPgd9QiwFS+pxpFD4DIcyvyoO
         YpLXkoaC+HqR3uP06T3nLGx/5p1kQADfZFznECme+BFh6d6wc8DcrQ0UeAIE5GTHExmY
         F42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770904; x=1774375704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7IffOQPDV8+R2vLMwqGaiOzpiBs5raeLy7NwaqA2zE=;
        b=gMVGGmF6Jr8U+a5lOzDYv1P5LgYnvfT4+RWh7ixUwOfwSJXj0Xs5zq0ESEW12z25Pt
         cIgaLxJ3YdaYYw+QpkO4lJWhxylcnoccbP2Jdxnp2rlWDFuUb4+ycepXwzc7kdiBhGtr
         xhclh7ENye0vU2cOkUBr/AolbNFtjRqJ9ZKAyTJG6rfRNaMo8Sxabs1HaewzJEOFIiiC
         84M6vy3Y0i6G75W4OzEvlpxtbghBMwc7MZLwtkL62Q4nryDCDdXPLVwm183NT8sBZqK3
         BhCvVFt4yKlzEO0dxpLHlxPHXMgX5mGLV55k8jr8nF7wQJlDCHvNZFVtjoTwG2nj5OdJ
         zfpg==
X-Forwarded-Encrypted: i=1; AJvYcCV9LCdyKdUBmicM2ayUrS0ZxtdkcUO6a6s2H0QyqYejrAbMgz5Mm/9oxS7Mumns/rlm3mRtm3F9ovKU7ScZpj4C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+qgQ4VFszJn+v/9UV8e/Zea/SNX/kMDPR0CzY83FQZ7cYBKtv
	b4CdvIgykbArbXDgMVPgJmEFRYFd5xIYuTZYJt0LYx5jyIgZ/cPZNH6d/iXD5n333cQ=
X-Gm-Gg: ATEYQzwvLP+PopqSP6QHfk15PagXuWdbaJyabX/Ma6K07zdnm0TJb+S+RX8QcViTix7
	+GVle4UJqrRcPNYnzUK8u+k/GtJNLv07hhU5JVtUC8y9ghvyUbp7Z3nf8SBNQpSdjiiNx08sIhb
	8CoGMtCbU1+6pJeba/V1pE787B9BJpx4LmcIofGRU6Iy0qtMeJ/3/v48LGbcSyJf/V+3eytLm/h
	KSeRTkT1VcvEVQwdUcmRULgp9CXU38Lp14aIcyCObncAnDeEAd0MfO9WttYWDmH28KgHx5jTz1I
	oRrc2WeuB+Yug8gHJvT4CSTGCZnUc261+yW7CH1pE0A4gUqXPSC55fg1fggISZpaqgrIIdxYgKz
	V26F8O6cz2C3lRXLzElWkdjoQ3WdCawynad9pldYRk+9NlTBrzLet69q8hQ7IWluuNf/sKbp2zn
	dqtpVMJUygLc4SEXaLo0nJ0W9C4YD67W4roehbxcd/dYn5cz2/Xb4XlMMFflojbeWF0krrVg6ST
	Z3gRQ==
X-Received: by 2002:a05:600c:620c:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-486f4475049mr8830515e9.17.1773770903842;
        Tue, 17 Mar 2026 11:08:23 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:23 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 22:08:02 +0400
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C controller
 on RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-husb311-v2-5-03c17c986abe@flipper.net>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
In-Reply-To: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=alchark@flipper.net;
 h=from:subject:message-id; bh=IcqKl6Q93uEU2+8AL9hVIxItRFtJRUZB5AVhl781nlw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNHmJGfEaCm+fu6bly6VCnWlgeb5ohfcLIqPLNWa5
 uH96gR3x0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFM9WYqRYX257051ceGN7IdvJFzdefLKdct/7G8ynD1yF1zeGz17TyQjw/lPB+b
 XxN1Z7rlz644PXIxnD5b9YTqx5UVLWbBzYb/WBR4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110826_134668_54A86EBF 
X-CRM114-Status: GOOD (  11.80  )
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

Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
its Type-C OTG port, which also supports DisplayPort Alternate Mode.

Add the required DT nodes to enable basic HUSB311 operation.

Note that for full support of mode and orientation switching, the USBDP
PHY schema may need to be expanded, such as in [1]. This is left out for
now until the respective schema is finalized and merged.

[1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com/

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index fb0dd1bc5148..df6c4b4b05f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -769,6 +770,25 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311", "richtek,rt1711h";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;

-- 
2.52.0


