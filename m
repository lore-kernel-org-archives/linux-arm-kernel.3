Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D82FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=; b=3VGIcrom+pxlMDlYq+u0wG70kf
	Yw4RU7zPor0Q0q7z3ww+rNeBVnmJ44JtAox2ycZ4cBU8WXy/UaGSi+50LWqPnqvrAVeEZsU/0aSnU
	F69fdTm1q0cCr6WeT1wsWYeY6noy5qnZfADfGtrAUSJS17CjzlD90Od4Kjg8gjPQPwdcUDtHF+Esq
	Y+THrZ9YF+7AjrfjEOAVN+q/pt4ieIJRsbP1agBd8OH4EthXpupTFCdjWXUOuDCx5172iVDqVz/A2
	JrJRRH2lv+U+wx8KZilykK8K9rWxJAV+/DW9bid2/MFOoF5jRVwmm2rt2Wp+qdiLfbh4WUFgzyMtg
	dYGhzr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGI-00000009Be1-056a;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGD-00000009BbT-1WRK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=; b=Cnpm3WTTPGYGsx1Oxt4dZVDEDm
	k/9sxhxXq0GSeWrCF3gLa1GGP0nWvUY24moaNf/3pOYqIsRdoAYWZgMUqernmca5d5N2NGFaWlJAo
	nVlpFWe9XAcM6olmtqyvynVVMfsJih8fziqcg8FOZG/lWh+b8iBTqIjGKYsuHbrtDhT72zorfdxeZ
	iztDvq3BVuOf7yeQbGGEEoOwrcJZavBoalrAw50qhQyUmkaZuo/bLoWU7KROgZ8cq6k0Bs/tgGviG
	ZM/LUC4m4FN5i3qd1OwJWrCMswRdgrmc2i34Wz2T0M11O30BV7fijkZjfWFxqVv/H3MGJ4dh02alo
	Xm3HSrOw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGA-0000000HUfy-2KBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=;
	b=JYywOxZn+lQrLPd4OsfmpUNsMQby7MUQSp/GpiQyj0y4E5OBX8nmIJWx/UdaFcb88uZUXb
	GOaUf6F6mfa3/1+lQuDwlmUZJpbSlKL+SR64lIFx/xZ1+ONCHWAAHZUkKu+e4GOE1nz+oH
	1zBMXZl9iizoUcqp0KrXUwQNw9FCArfqXiMeeKYRDDV2AnTtA6totfnPyA/tmud2z3P4Zu
	SImkvoG/pXzyxPxB0YNjnhBJKgVBoIzMsk4ql/artKHKYcGe0M9lwAPfv7DMdG5vKHP91K
	0XH/KVZqNafV9NPVyanrWjZNnltSqQDSnsGWzlXtlobFQt9RmffnwftFabRgUQ==
Date: Tue, 08 Sep 2026 15:51:53 +0200
Subject: [PATCH 6/9] arm64: dts: imx8mm-kontron: Describe the ethernet PHY
 LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-6-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=3o8FkH+94Gp91Ts9hc9WE4bcbXn8u9fadCMq2uRk+Xc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsPMMRY1UhZwj/g4vdVV3RW2NDjliL8SU08Mwd8uua
 p7K+3IdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAEzl/kJFh0e0OHx3fXFm7zOfz
 ne47Lrimp1BYoaF0sz74Um7Uv7fbGBl+a+5tdJK3m3p+yx2WmROzeq5NVTfY3Lxj1b7wwza/Lgj
 xAgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145314_791764_FB62DA58 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The RJ45 of the BL i.MX8MM has two LEDs wired to LED0 and LED1 of
the VSC8531 PHY. Describe them using the standard LED subnodes of
the ethernet PHY binding, so that they show up as LED class devices
and can be driven by the netdev trigger.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index dd59af0ebaae..1f3d0577f10c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm-kontron-sl.dtsi"
 
 / {
@@ -139,6 +140,25 @@ ethphy: ethernet-phy@0 {
 			reset-assert-us = <1>;
 			reset-deassert-us = <15000>;
 			reset-gpios = <&gpio4 27 GPIO_ACTIVE_LOW>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };

-- 
2.55.0


