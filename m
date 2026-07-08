Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA4DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=; b=WOC5AoEydz9SXUPXdziCOW6Vsr
	Sd4NBn+TRHSr2TUyDns0ol3pzO8pXZA/2hzmKFYi+AsbUCVj0hJPIpr2LE9YGYN1cDokPGmweAHqx
	C5wxkj6qXwG2B3omhYGTZG4x07JBFC8o1ba4KvNSB5BA8ugxi54k3lW2FQKjY4r9VNe8qSV0hH8hz
	BIpysgg7UgGaC3NoI2L8zeeCDEE7oYVY0Z89JjLNL3gg14ttREaQHzjr4taZ/1v32z6UCUtoHuaA8
	rWkDYnD3svvT0TFRpm2XUexohs0sHT9EK3ZF7j6DCTGoSZ2d6rH2ch0t5yGsbJuo1s5Z+AAPV3PHp
	infZ3BzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQI3-0000000GzUO-0KrO;
	Wed, 08 Jul 2026 11:18:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHy-0000000GzPX-0yvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47de0093c42so556646f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509480; x=1784114280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=EdpVtSWQ189f+wcx5yocmX6u7iD7Q+wu5LYE5hADEXh4Krx+EtlbH9M18oC31EYaZg
         +fFDXEsfvOHG5Rje5B2UKMkYJcofpc9X7KrDZF1CdKfbpzaUUEsw22vKAB4nIGrGnXcI
         Ox0DJtBaOJL1GwZl5s+DRcjkK6LmIhcYKrMgbm0CvDh+dGtF6NnCM8GGqbAGvv8dVuDS
         yk9G8EnEASTyTvi/P86fkbZvyZAM8xXKCobRLMXUiOtSUVWo5NFlq5eit7HICNusA0Jm
         SkWsC26wWSxVi4nfQ0HgNVSx6QkOZbeUxrei9iI3/olc9tcUNxz6RQ8lsVufopgqMymF
         jsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egpcAQdW/SLTTZ7EKezQRyQCSwkm0Zu7f8FvgmBPrNw=;
        b=AyYbgmEMBWopMFcxv3JY5J0JKmt2g+qjfzuXqzIqf8mp1Kl/Sv26XuzoOOLtVfvj/C
         v3CKD0N5rG3/TKUzUW8Y3rC+GjFw45nONIFIhfoeZT347GS5ENIWhPScvyeeX9opxzDh
         kV6do2v1TROCNQOTRwwJKNpvaDe068qevmMMAePPDTyz+gG9c94O54AaLAVkEN8Fwc9g
         raozHhwH0gMhpfOPXrRrDidU7akKHP5JF20OUEPER2St/X9cXRjQy9W5MpPi5BMUkANA
         0temAn6zS0D9/wGMgyd2hvVHAMI2omI8EQFFAWZG0/oXQ+1nebAYvh436F2ixj5IlLK5
         JDFA==
X-Forwarded-Encrypted: i=1; AHgh+RpaE8vHLrlK8nCP9tjQ7ZZnCap1Gwx6T2QXkk6feX3T66+6DCyfI7u0fz8v1vjGKVawcKyt1x2ZEn4kS9zBvff3@lists.infradead.org
X-Gm-Message-State: AOJu0YxpzwA3IBdltzVK3CRDo04wFkJER+aT3SEzMyZS9Fpx7tDAIwhm
	FnM+EdC0Jm2HrHZKaE/acApIaXc6QaZ/30uTWlt8PZFRTexIZsC8NfXXWW5O7AYMVPk=
X-Gm-Gg: AfdE7ck5c7tZgYnjHvRXVutxL7FkrP28Vk8cX/pTD4x250sgFuwhVMlb4Q/PrhA3Gj3
	ELNgmktu1Fod5kRbdYtcP2NPlSe4lh2KVsYkFWvuJdSNCMeQ9HYzNq6TaOke+T93nIinJGySgEL
	y2nmqrjE0MqlF0qadtfou7V3h1cxOvp8S7kWX6PmerpRZFLb6wXYAurS2tCpufyaULf9aCfLuyC
	1CQQp5ZxgAjNQHSy/Hpts8kcAibBvUUmylMkD5n0jysCDAyhwioU8mv2Cv3jzHU1rkfoXD6eaEG
	zkKAhOXFBKFokJSKrM3RUvcdekV3AxYtsM3Pyx2URuLnTC5lLLhLj7cR0sM1PYHXN97jbcdNyVZ
	h5UrbESBkv+IqZo1ESw822MCBBjXfhazw9E1KPPkqBvv37ffperCgYUdM+V+FQVaAhnJS/aVCQl
	FPDFwlnpLoLeff+t+yGQATCOKW6PQ2j9bdwZ5M9jhxctawTEX2TnjqrNnQw21lqSgb4iH/ImKq2
	pu1SFZ/yS8mnCIdZg==
X-Received: by 2002:a05:6000:290f:b0:473:c18:f2cb with SMTP id ffacd0b85a97d-47df075637dmr2204598f8f.18.1783509480468;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 08 Jul 2026 13:17:40 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: alias all enabled serial ports
 on Genio boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-1-bf22229e9383@baylibre.com>
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
In-Reply-To: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041802_282868_6C87BAB6 
X-CRM114-Status: GOOD (  12.86  )
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

Only serial0 is aliased, so the remaining enabled uarts get first-free
line numbers. When the console uart defers on its clocks, another uart
can win line 0: console=ttyS0 then ends up on the wrong connector and
the boot looks like a hang on the serial console, depending on probe
order. Alias every enabled uart so line numbers are stable.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi    | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi    | 1 +
 4 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0


