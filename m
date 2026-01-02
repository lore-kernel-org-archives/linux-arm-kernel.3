Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B41AEED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=; b=g3orR8/054rDerNc0SFiN3uXnp
	DHSlOyCXxIZ/SPm3ZP5mZPecg5WLCgWEwtT6TaUIz1eQ1VMNJboeVR44FHJUnLip6JH+xEednaKqD
	IvXP/yIj5Cx96ln5jY2EOyI79S45d0EPPJNQncT0FRLok6l1EYoLpuQVULVkh6lJ9uqBjJ212KSTP
	1a9pk5eV1/PrkWrpDyUilGs1tEogOVqCIcnnmlWGqesEM9xSb7JVGNqVb801T9z70aDaeIbAJilIG
	3+uCSC2Us6lvsyCmh+dSnacJ8pZGVYscDrD58I/T7CveAPsDWHiG9M/nAeq9/1Y5tyudiTHABczPL
	BJ7rMmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSb-00000008b3V-1JWe;
	Fri, 02 Jan 2026 18:01:13 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSX-00000008azv-0Hiv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767376838; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IU13SRqmCuFz9WibsWO/8sQOEN80qhuPtyZRd8wKJQKek8tiyRMTB7FZ0B7rptqeGs
    Box2RXeI9zKHlQXTuuuH6B1O+mOdCFNWmyYux1BPlFM7MKbUA1Xdc3lvaadcrbBKzspb
    S6wGIGOJ2F2jGm//mW1SzeN1ZoNQcYM+gcnSche4ZKid8ptY0NFty3SRU76CDVgW3xs9
    /aJibXQsBNDvy39LEOPVLzBhoFQeecWPK9pGhjpP95/v67FXJ1w2gz3Eww+A5xEta6nW
    M35qM+yhhWRwEnqLNPwB9tHwZzEqtgUbRL2FbCQ4cNMBqX3eRe63WYN/X8VKIUxYVr8h
    AGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=WxV3tD9apIoYO05ioQL48rEXrwFHBm6zsbwIvtI5AL6MBS7VB+WvXBam22gA1HzC3R
    n3h8S2nHEJa6u7k5bVAJbf/GgCjcuk/juGpvg8geLN+zqK4UCERvB7YEFQtJ1M5Ge6dV
    +485P1WUOECAHTTnEWdWTwg5ljXenHWd6sbaABBXi+kux3jVRcnWSxrfWmzQ79DA31SR
    2p8QTMXwF3QmIZZT7MCAuw024twWXgxi859VkXkOW07A4ymS7fXoXrG+6THMzziYOn2r
    mZoxjZlr/DApL8jYooSUcICEhgC1vuJd+GDq/HR8JKnqBWielTKH74ZtyhAzKnww2r4y
    +z1A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=hBWflBbPWgIWIkwGBCSYV7bMa16sPrtjxIIHg9nIae7WEn/Gmf2nmBhaxG3imBXf06
    F6kFW2WXTYh1ba7E/Mc4Y/qLCwHWY6Kvm1pDJHJHxYzscUlHDSowC0+gaI0V+RTe1iU5
    eGX/Jphx+VGvlyKM4akWZvbKXawRIFPV9jDKCNRwcpDinrYvyNYWnLcCJcghm0nlYLa6
    aL0GXfyKuBSCb/jZKXO2UpwvOKWxmALP6R8RsnI9KVktI1K8Z2BvJzAO+yjWJtAcmJal
    LzoZIiLMoPZczOYFsW6atYqVde3U5PnScQcXUyB6m9cTLrY9WyFRSPNGYnkOJTh4nFdR
    12FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=fmb8knCDGGGisSp3Kuir/I1mSfTxi5qH2pieptBtj5sTYFEhIUcwRvDFaMYsFElXSO
    5uynNR/unyG+dScGicCQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0bEUA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:37 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Fri, 02 Jan 2026 19:00:31 +0100
Subject: [PATCH 2/4] ARM: dts: imx: imx50-kobo-aura: add description for
 battery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260102-kobo-aura-battery-v1-2-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100109_252474_D44715D2 
X-CRM114-Status: UNSURE (   9.01  )
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

Kobo Aura has a rechargable battery that is monitored by the embedded
controller.

Battery markings: PR-285083 3.7V Typ. 1500mAh; 575327416288 5.55Wh.

Add description for this battery and link it for monitoring by the
embedded controller.

Reviewed-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index b1a6a9c58ac3..dc8d9fd45cd2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -16,6 +16,14 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4100000>;
+		energy-full-design-microwatt-hours = <5550000>;
+		charge-full-design-microamp-hours = <1500000>;
+	};
+
 	memory@70000000 {
 		device_type = "memory";
 		reg = <0x70000000 0x10000000>;
@@ -151,6 +159,7 @@ embedded-controller@43 {
 		system-power-controller;
 		interrupts-extended = <&gpio4 11 IRQ_TYPE_EDGE_FALLING>;
 		#pwm-cells = <2>;
+		monitored-battery = <&battery>;
 	};
 };
 

-- 
2.43.0


