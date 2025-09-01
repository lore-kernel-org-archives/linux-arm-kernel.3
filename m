Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BA7CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P+m7Y/nxWzgTwgV0lOUpGrfM4BscgupyGBe9TnMFyM=; b=MQ3NOKemBdl4z1QtrrT9B9AxQQ
	R9fO2gJXYZVMDAN6AHKUFYPrpxOpQmLNlZfUAYNxwhiVPo+d57vSdq8YlQbT1SxSE/Y3ut5pBhrwA
	irMUfddhEwvMIcE2yM/hILhXkRfQSRAd4zAKvD/OifaBKgaNANT9NGbo7kCGg580BaBMQXYACo463
	ctjkVpuSJbKilO3Ahsu94Y/X8M+8XEK+clsBAMYJ1264cPJPn/DQgUN+jXw90OtRgmOTRMbWWEpJO
	IjieZ+EinR7lZkhtKbXmYXBh8X5IXQEq/HTcxt6LealuZxb+3OXJqFrS3PlFm0J1zqjnEAz5IPHS5
	tB6A/acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiS-0000000EGFE-04Uk;
	Mon, 01 Sep 2025 23:13:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut812-0000000DPTs-2ewc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5607c2f1598so716917e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746503; x=1757351303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8P+m7Y/nxWzgTwgV0lOUpGrfM4BscgupyGBe9TnMFyM=;
        b=UdAgK/tfT563QmYuek4paxh39FyCsidozjvDVQWseIGhGWeik+djmXJMiNtHr9IN9r
         MPDHBPLfe4PEEXaGMswRTXFjrZdVOXO7AwpwLQkpJN8MZEqzXbuKyZm5lOalOqbUVXd6
         HZOOlv4HlwtLGWoIdvEfZQcBMDF6c3d+8XhFF+1xst1shpwc97cCS1EUX2DXdTUoUF0d
         LUf+Og65ykksEImXhihj/MK6Ru7iUHKGruN98ykPXvuyo5axr5Q3eDaZHXcu1qxwrnR4
         2jfyUyQ11dap/YO3r9HY9Jlplrs6Q7r/VwErAXuH4iLPM4gPwdZwQQDtR8amwpA4KsQN
         q5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746503; x=1757351303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P+m7Y/nxWzgTwgV0lOUpGrfM4BscgupyGBe9TnMFyM=;
        b=euuqZ15v54mQC952hcqn82COK6x/ipKcmFC1VFuS2B93+vsH2P7RSr0T7NzBMy48vg
         0/0e7ofq9ipWnQ3M+JCn8OZPAs9oy6B3NNimpsFvfDedv7Hl+2lU1JK9ocEikxTDnhvD
         TJIj7vMXefyHXo5hW6KGkJxovFRn+hJEkJCXkn2I6W8BEZzCeDr79auHYFc5ngRCQpGJ
         idhVcb8C4W3irxHq8OdDicgLt7DOZBaEj8gOgmFFiF0cPfsjSogxQ9rXJ/zGjkKg+MBT
         RwabUeBMWh9UZidB4fsjAroPCoXkorBF9I6Iq9CQfnToCKx4XjsRPfSBmjYEYnYO2rP4
         R4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP1Hg00coQ6es6+rOt4DQ8G3hpZzYX0d+XZYkcWxtFdf3R33bIKYQdf6HE8BJOBkBq2tRmPaMxU93tEZRm6tbS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Z6FvlagiWI9AqTQ4O8vpF/2NFRt3UA2ZykoraXzxXbeGcmnq
	D+MRiuMegu/wc04wr4kuHnRpkb6NiSkny3JqpRc4vEH9EPtSCcXbHDFs
X-Gm-Gg: ASbGnctZt1ChM1lkDr6S3TMafP668YsQKJ3I684o6UD+TuuXXK9LjC0ue1aQlgjxJQB
	RPkh19l1sugnoicd0iW4RZfqXuMnhUTHJAOwO+GLLwWdvXJvEuQszRzKjp1fNCGZY7Bs4Si3vC5
	Epghpxsf+odTxNObnQqSW1xcgZ0/4Fqi4TWOQOQmYfCy2Ye+HNYQKtHoRL/sMrvo359sX/RBZs0
	JrTL3H1Az8s2S9iQXuhTGJOjsVfkig9LFXGNz2dMEg0ISHI89eKWHiwacSUxcPOneVGhZBh7/P4
	mfZTWNQaKqO5wWmfSb8B0Icn9lym2/xau4clKCkGybfUxO5YQRHS5AOUoOYOIinRfYiToZR/H5J
	GWxtDjFLOKAvyP8c2mM8cph7Tk5jYTB4qq9A=
X-Google-Smtp-Source: AGHT+IELIB4bITlhgOPTurMm6oZh59uaBBEBFYTOPZ6U/I2q6zrEZv9FpccN6USg6GENgO5mVScJCA==
X-Received: by 2002:ac2:4bc5:0:b0:55f:3e82:9c7f with SMTP id 2adb3069b0e04-55f7099a779mr2066829e87.51.1756746502867;
        Mon, 01 Sep 2025 10:08:22 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:22 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:14 +0200
Subject: [PATCH RESEND v6 8/9] ARM: dts: bcm2166x-common: Add matching bus
 clocks for peripheral clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-8-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=OMng8naVRXMXeI95f6muap+cKQ9MSMRKToTbyrOWZkk=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLKguyUaS87eDMZUI7MCjHhhosHT/OmHzMPf
 bhMLUpCljaJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSygAKCRCzu/ihE6BR
 aD31D/4wuD30cdNOi2kPvIwZvJywOqEaj3s5BdZ2DlFwEsFX+lAI2s/M/iajO3yN5lL1Tt0ntIh
 N/bv3O/Vm3yolUmy9rhV/r1LP3t5g+HAtNtmRuZ+21JYrrugcP57seO7iEwupUmHZwBRLe9/PyR
 AbP3YVWI1gEqBVXLUIX7Yc9+2WDpJtERhMAhJ+koHgvBPcbZF46P4Xy+4oyBUCRx0lA1TO31YrY
 84FmKasmp0xV8PxGKaWX0SAosUoxTQsThd2H6tCbHv2lPHRcP5MnwE/Zq6O3HiE4DeVklLjDiaF
 tqV5hewKD7xZJcTTvjPzZOCLZ5EArCsmbwdB1GbTFkGO18MIVO+7c8NmMHhsBFqQvTz1t6OUHll
 hbUgi6r7K95BAnCdWYi13G/HYWWwfvisBaIMBoGf+ibkdnic+Abp2y5I0u/iyvWbK6qvpUWQ7FT
 4FBJnuzq8dKZL0mB0N+S9RQvckXngNqMY+AkoBaTibRhTM1No42pU9AfgiXhRoxbT5XuHO4f0dA
 0lN1Dy1epfe2p0QoV1Wogsfpw6SgIxuj54Ax0MxZ+XXdz3VIsuqGomGZKSaGih5lowX20yl6x32
 h554c1b47jM1zbU1l4zoegZNII5gh2XNXuH8j584PsOVFQsqF5q+db4virt5jOgW8SbGw5iSbeL
 hDrAZCdLawi0CEA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100824_682595_177C8C8B 
X-CRM114-Status: GOOD (  13.05  )
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

Following changes in the clock driver, add bus clocks for timer, SDIO,
BSC and UART to the DTS clock output names. Replace the usb_otg_ahb
fixed clock with the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Change commit summary to match equivalent BCM281xx commit
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index f535212cb52fec0668abfc06e7268bead70d958a..b8a6b81d2b7cac00cf393ee37aae4dcc379e487c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -148,7 +148,7 @@ usbotg: usb@e20000 {
 			compatible = "snps,dwc2";
 			reg = <0x00e20000 0x10000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&usb_otg_ahb_clk>;
+			clocks = <&master_ccu BCM21664_MASTER_CCU_USB_OTG_AHB>;
 			clock-names = "otg";
 			phys = <&usbphy>;
 			phy-names = "usb2-phy";
@@ -253,12 +253,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -306,7 +300,8 @@ aon_ccu: aon_ccu@35002000 {
 			compatible = "brcm,bcm21664-aon-ccu";
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
-			clock-output-names = "hub_timer";
+			clock-output-names = "hub_timer",
+					     "hub_timer_apb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -319,7 +314,15 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "bsc4";
+					     "bsc4",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "bsc4_apb";
+
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -333,7 +336,12 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio1_sleep",
 					     "sdio2_sleep",
 					     "sdio3_sleep",
-					     "sdio4_sleep";
+					     "sdio4_sleep",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_otg_ahb";
 		};
 	};
 };

-- 
2.51.0


