Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4670EC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lY8ZEQ2hlKG5xfE4pkvXblb/dffG7Wh4lNbHjY9KfTc=; b=sSr2uIsQwvsFSvmXGrDzhD0jrS
	L7W6lOxkL0gNN0me7+O4uKucBEOQvhtOL8BtprC/LBPmwa48p4hlSqHA62JXSAFa/M22em8P2T6VV
	xQVD5RR+LdJ455aq2rrOUC30E6N1IvksVQiAVMEgx7cXirpZ0p80hmPBgSbcUlkwq3fZadYFuRPw4
	MkThQiiGXeiweTtH3Ly5Cwta1fb3pWVGHaM4ov+XIaX/MjlKyhatA6U1F1hNB6n6T4bzEmrz6d5aX
	4dOOBSc7pLEnGb+Zyxqo2V6wx2TBHLF873Kl77r46fa/tTD88nIcmyq8eeG8t/lg935gTDLJY+OlD
	JXRL4iDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgrU-00000004QRD-3QtO;
	Wed, 05 Aug 2026 19:01:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgrS-00000004QQN-2kfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:01:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1530083a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956465; x=1786561265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lY8ZEQ2hlKG5xfE4pkvXblb/dffG7Wh4lNbHjY9KfTc=;
        b=riEX7Ysf9ZJ8XVQwVxJU6ukMkAHXE1Gmm7gFtfo8tMyFRXX0eHE4BwSTuL+xScbZFN
         VXLb6ODpI99iW2RfYrw5U97gGzkftoDS52bm1FFF5ADS3UrGBLjFx24+z1SSQdSGuHqC
         qajUm3mRQxuZC0WTeBFGV8dHyKAxMtUZGJcoKurQVSmo5nN2YWVdqlbH6xrK+m164JDM
         FDGs0l1Rs6vE/R7fDyWYHf2+0+bQVCbqhGukwKk/SqbP9RXpktrHsV28QF2dWdnfsdcz
         UolTu/Mtk2rxMnYqB76E5wvLDwn4VoZLd+aFhb12k6Yl+OdxrfCaLoLwW9tR0xfnpJgL
         d0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956465; x=1786561265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lY8ZEQ2hlKG5xfE4pkvXblb/dffG7Wh4lNbHjY9KfTc=;
        b=Bf2X3CUNeVstt7VF1+8tcHTQmPFCdFvg23timAKk/lGZ0o8Qe1Yi8nPa0HNJCRhgzs
         nWdSvJTh4ddiY53ZDd+hX1SZjoWXrkLYRC6c/LelcSASLlPLeruqb+v/xRPcvfXYyAji
         II69PV0crm6w9fpm2alEKpbHfX6vQ/sNwur/epAobdt0ZS++1jZutzHHL9BmH+mSAwU1
         JkowNgqW3grE5XFw7L7OUVwnryFxQ2qw7r7ARE6ARAVdP+sJelu1+K+A82j12bjsNu6S
         N6YfztwpPL1WxMOLR0ldYw7YkXnztz0o6tD51Nw7a1zT9PerB9rOUP332eQ8YuwkNNXV
         DOqg==
X-Forwarded-Encrypted: i=1; AHgh+RqEDwo/tGIyaMWDkH56KKVyf0b9u1fk/2GHJ7po/XCzdtwSkPh2WsWreR/0yb2zj0pFSp+6bqiTjXf4N51XRf8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ljych6dP1PTGj9JN0+8/eh2AtPAtIL7THKA1Zs0qtoocFtpy
	OSL63PALOYoLvaDO+hIhFgnFY/qkYkZWEur7mob8IuTzcuinjhOSlmh7
X-Gm-Gg: AR+sD13ckyvdQVoARPlQQuAgTKgwVFzOX635/PWo/O4gDb33qPXWgWVB8w6DX0zIkWd
	HYiMAdF8BO3BK5u4MJfaucq6O0Jwbck/dc0SLNzCHUGRDzxQwROaWB6e3ebKbsbbfRgXgGZpVEy
	r+QfCyUty5m9BLynBM2MhrviHKxdhwPeRKZp2G1TmIoN7oLXtxrO1hhcJyHjHhwULEPsTc2FcMH
	JdaNeSB1vFpuwwGbfTYaC1y7iD3V5S5aft97dI026OEVvZHvbvUJ79BnpXmurjLJnAI9egDqC1d
	bUwPbbKl+ufDfJ/VCigh1/9y9CJaL7e2KwDCYD+9lr5blagWHFPHFujdRBbsAXGTLrhkr3gHa1U
	b363y8Q2kV0kilxu0fJUxKzgw2etNUfJDUiIBxc4rkL3ce2zQBAOo9xDCz7eokcEQ/LlFg8TKAq
	zcEMGfle+BMe8pNdq3EwVw5zny0mvVD+RgHFQZkPL41/Fkrq69kWes2K0udnsEd37DK7xB4WXTy
	nQldSdvkUdkuC7U431V8wxWmFdG8Zpp4KRqrW7kp+2zP5ky5Nffm9o19RvnpMMA9CuN5emxUXyM
	/s/wP9XjGx2QEIYHJ1PVKryqpiWoVw/VEr2Qmg==
X-Received: by 2002:a17:90b:46:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-3903c5363a5mr10200520a91.6.1785956465025;
        Wed, 05 Aug 2026 12:01:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d183dadsm2136925a91.0.2026.08.05.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:01:03 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC56U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:01:01 -0700
Message-ID: <20260805190101.6773-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120106_695762_3E4989EF 
X-CRM114-Status: GOOD (  10.20  )
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

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..df59136b076c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,49 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0


