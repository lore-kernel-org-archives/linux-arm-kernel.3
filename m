Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D92C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGtsisFYQ3ZsoB2jg7Gl9tLznZoCpOpVvTrcNSu1WWg=; b=YkcOeB96uqt5J/MKK7bMfkwawC
	adgkAZ8j74mT7uZ1S0xrQhLAVOexp4UpuE+5jSXlaAtRts7S9cABUuR0XF2LOtRq6m7M8DHlqvVnF
	8qtAeNSnF6ntod9dpLGurPGFjiOUB2CvbilSn3Ybd/a+6n01pqyZZs0mDV5fV4zBZopmpocAVI3es
	h9imWChU4I0+HzOChV2JsSEV5rE3A4e9GvrWeHU6qdeLdB4ljnWIw4wdrzl6cglujcOdhAivhSsOf
	KPzJ7MP5JCpnvzAHkGhgSXC34ee8mc9tfDJpTpBS3mz19M1r8+mPP7nFESiMc5XwF6hUDKW8gjhDb
	2OFekg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgRSH-00000009Yil-44D9;
	Sun, 05 Jul 2026 18:20:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgRSE-00000009Yhz-46GU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 18:20:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so32156935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783275634; x=1783880434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGtsisFYQ3ZsoB2jg7Gl9tLznZoCpOpVvTrcNSu1WWg=;
        b=Fjr4N1zBo3U9Nw3+/31R5uchCBBt48Yp7R/hvVf73yhDopXZdV8swoGv17CbLCLZ7V
         O2zS5trriNf4swROsMKHXVTZnlI7/xzVTC/UbSW1zdXya9LKs14QjuE60NPNxHbTJV/u
         dm381k2OXKK6/828MD8Ct4TBU2eAh/bcCIV1FAbgYqFNqz5IpriZUU/+Y2o7QMI9YydN
         Lm+f2nwnIfXiGRtT1t+2vV1Pm1i4OUY9AafT5BT2Hr1OUTFMMMvEC5+HDJNu6/0tpWLY
         fXnbhPIbUw3sChcJHgo4Rua9IzgraORdRcdRff8eWnDe+ZdnsVzgYsA+4XbltDp/PG7c
         lgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783275634; x=1783880434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGtsisFYQ3ZsoB2jg7Gl9tLznZoCpOpVvTrcNSu1WWg=;
        b=W5NRpTci4GClKYpOgnrtNdwPsnedKzleLKiY3apBPa6lMc/LPjyj7An4iNSv4uTCry
         RbHYAu4TSLqzcvSBPoYHOdqJ7JyCwJadSU+gPXz+P2wmMBFp2BJb6OFTbXCq9SHcS/rV
         oXkb4oy3EHvvBRz1caJv7QCSKoAhsbQKO8rS4Se8xewuMP6aJki0ua2BFTpPyHGHVgwr
         rnRUMwhAQZG4xcJl3HfYpZ69AQ+MRyCr3anHe2zOw3dbOCO/WNrxAf2+EbqXIwcSQS7M
         6zsrq2TlCsX3X2D2cDNeN+vTvRmmKKBVPWlzF5dohOqFL6KJb+A3tgwH0KGFuGLDTbO9
         +LhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1r2tpJEs7yKASfVA0Z4DBZ/Y33trNfF9Nl715p/toyWkfdJ0DDu7xcyzJUiUU7q2LqrIiVeiMr4c6WkjpFDaS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+cxvWtReuirahoAFytdoZ8JnNfaEPgemYOTuVHttxu8F6vje
	w7RbO5v5Tpw7gP1sZ2Awjs0t3J1OWBRfa1dIVfeNMfQLx1ItILhDQAUm
X-Gm-Gg: AfdE7cnJFaVa3OBa/hndZgTqk4wlGhKHFBfBkX8byv79McoyDq4Kcs2xfhRiSG9JE/V
	4jP97Oroo9z9QN5kP+ZKv7i9Yc95Bdn8GKztCcaLt8P2G/9n/EfSSW3KzTYHH6KmDgo7lZeIIK1
	tYZi77OhPpuhM8AwCEIFB+D7H2Ywk+q6KVn2NHb2IDmHX0LfoHh6UAN7NPXuc44WD0So826fYcY
	fWnLU3VfK4X1gAN1jmCWcERgX+3Y3xZ5xmPnVNTgPUZsZsw+OhkrJAIRfWYIg5w+7OAww6dR5XP
	Ap12tWFhTysR+sdWefG+twRUiYcwpoA4ESal8EpC7o1kmcoCGeSmyZ01J3lCrzg93PbGGQDkHw2
	mkLft3f6/xyvGGo4K84w93Q3BT//hzb4o/8CrsHeliY7DpQN4deaQgL3Idz7g40L+daYLamqTJQ
	Lhe2migiDP8fwHW+9IlhRxCoVIuElN8TFP/zquigKCg+RyT+xKq4g+iVzyQso0SardtAU+B/qXF
	p/kCjVPNDUxWqpj
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr13586199a91.8.1783275633209;
        Sun, 05 Jul 2026 11:20:33 -0700 (PDT)
Received: from MacBookPro.tail6abcb.ts.net ([2804:7f0:460:b8cc:e161:f046:ac0f:f27f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb7fe46sm51230319eec.14.2026.07.05.11.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jul 2026 11:20:32 -0700 (PDT)
From: Brian Mayer <bleemayer@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
Date: Sun,  5 Jul 2026 15:19:19 -0300
Message-ID: <20260705181920.8633-1-bleemayer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2960762.AiC22s8V5E@diego>
References: <2960762.AiC22s8V5E@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_112035_009804_DB648C9E 
X-CRM114-Status: GOOD (  14.50  )
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

Hello again, to clarify: I tested the v1 patch in my radxa cm5, but since
this v2 only contains name changes I didn't test. I added the missing
agent tag and am sending the patch inline. Thanks.

The Radxa CM5 IO carrier has a Haoyu HYM8563 real-time clock on I2C6 at
address 0x51, with its interrupt line on GPIO0_B0 and a CR1220 backup
battery holder. Without a device tree node, no /dev/rtc* appears even
when CONFIG_RTC_DRV_HYM8563 is enabled.

Describe the RTC, wire the interrupt pin with a pull-up, mark it as a
wakeup source, and point the rtc0 alias at it so RTC_HCTOSYS/SYSTOHC use
the external clock. Wiring matches Radxa's downstream board support and
uses schematic names for the rtc_int_l pinctrl entry.

Assisted-by: Grok:grok-build
Signed-off-by: Brian Mayer <bleemayer@gmail.com>
---
 .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

Changes in v2:
- Rename pinctrl to rtc_int_l / rtc-int-l to match schematics
- Drop Tested-by (covered by Signed-off-by)
- Add Assisted-by: Grok:grok-build
- Send inline with git send-email (not as attachment)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
index af4a9bc01..d22db4d18 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
@@ -19,6 +19,7 @@ / {
 	aliases {
 		ethernet0 = &gmac1;
 		mmc1 = &sdmmc;
+		rtc0 = &hym8563;
 	};
 
 	chosen {
@@ -198,6 +199,18 @@ usbc0_dp_altmode_mux: endpoint {
 			};
 		};
 	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
 };
 
 &i2s5_8ch {
@@ -221,6 +234,12 @@ usbc0_int: usbc0-int {
 		};
 	};
 
+	hym8563 {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;

base-commit: 87320be9f0d24fce67631b7eef919f0b79c3e45c
-- 
2.54.0


