Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E8D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=; b=PHQE7SQhjxoksZsKq/u5Z9imKV
	eyATPGOrvaVUXmEOl/ZG2ZHY+TOTrEO2qz5cIMd9A2HkWXErzWSahxi+TaMTjRX+LxJDqI2lQ6Wp0
	4nlomSXIGT1RQjjYfwbH588P5xgSHLS9ddXizs/df72Xd+dzKlRKlMbrLJ3wNYjFa+Wr4ZooJk310
	QLAZkkT5B/6GAk3Trep9wNUk3nA/d+aAU76XQ0vOBhOEnFTDDZyEGUPPapi92DPqO4i29xIrnubwF
	0wCQN2ndPuODh6uAK6RqECi3de2gcEygTvpgEwL+NW0XFb12vZ6I7C7T/Wg1rcY0Sp7zza2QaMSms
	5xTMGFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7ZF-00000006TvD-2Dgt;
	Mon, 02 Dec 2024 14:38:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TM-00000006RsY-32mX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 14:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=; b=dy6zGKLEasQQ07shqSE5m0776C
	cAUyuSTiP/Xn5O+zpAY+kGA+mWSbUshkmpAbp7fOQWbmJBh0xt3unzupuQgGT+F4GmdGfvU2vt1oV
	AMLDyNI1YpFNnITifA+156Nts8+lhO62FAc4cO3LMJo3HT0sCP0XTwsKXpDhT4ATKTw/xmgqgoIKA
	1Nd3QxDGsmcS4nMEYSeN7h3uX7Gl3T1MPMsD9wa3Zqcd/oypH63gFTcGjObj/90iOa24AAsHFgtFs
	LxTSFiUXhx/ZHuw6MaP2i11b77XQYsjOWIH0l8OG1ILP9kmBOiozJ2HtlIHoeeuFjE1UyHI3UBk/R
	8coO+nDw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TI-00000002BDR-252t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434a099ba95so39235295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149939; x=1733754739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=;
        b=MTmsoiVlucnwYMZRqKuQU07xFCXB+Gm2RQV2cwK4FhrYZuO7vSm7HUs0fxC0VR5aq0
         sIefjwTkCaPL7iVXVVpCdBUaF5YSRytdzUwCBoK0gjCmncsBkixZKfHlvmhEXYxKpOZB
         ODUOxMwCwnJXaO4eEHWU46hmDOd5Mp8fkL5RnVxwecvsfS3aGwjlbXR8/7KcjSCKP9+m
         HOuBWJvYk5V1xPsu84cem+CgPTXEZsTBENaAMP0/o8Abwle1zY8buUorX7HwrffrZk1g
         FpdDlEVgxHkt7p1PpyPS330zF8D1vtoQXuW0+sWKNy1lLRxaTtVDWm3SYCIBo8Icb2Ca
         OvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149939; x=1733754739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=;
        b=OZ8LbNGNCIJaasjczocrU2FkayeKyBWTFsKv+lrJ7BLPzzEmqX25NreOZSTWgT00La
         tHNIMHrupuUrlhAdTCT9zlS/0qb9Zl0hbKerpDTX6oGyO32VtmpkcIXH1UI0ti653wKV
         ix0ht6DX7qCv2kJ34RoKNGl+OF/rFufspFjj331cZ0kPhXTF/+atyC8yWbZ5QnzRvL2i
         1hxXQ+O24WlYHTFXt2H8JEtgvOfATzxAsuKKFXjuCrlE2LdYedd51qNWOXDPvOZoOQg4
         6XR9S1TAIfVN5T8JXwGGq9GmL4JmLt2MCMzd/9tUkZbQzM5ffXw57M6kKYL6PHwRVG49
         ByDw==
X-Forwarded-Encrypted: i=1; AJvYcCVX4qGMBBdOza4HcdUvmKU39a3unImCGj9u51+48wWHrDYBhD2E30A5j57t1Ub4NJOTPrUJzXaWS3a8Dex+xH77@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl51n2Pv+sHUhLNvlTKRCWsSDn9/G/gPClIb18mSs+akwo940w
	7J5GochU/wdfXIHRTdgXgKAjlqyYaLtd7IyrDUGnkY4LAVezkqp1seH0JGKJLyg=
X-Gm-Gg: ASbGncvjcotTkyCAKdLRZAj0hC6k/YLYHJdksiwFbJ74RWR44OIN0AYcxchVnKR0fpP
	KLPoBebcA/FUOtZgNlz5/8z7NR/6rgjyqzQzWupny6DNfWieunL7ZOez0ZoLvQjcmFrVDL5AxOG
	XZprPe4Q+8vArc+ZbIoF5+ClUOdaN4Q8hzdo8sQBNzNHl6x1sVVV1qbwxJFZF2fo/WlwT3yyMrg
	fxcHEtq8lthC4yMScrKKGtGF005YBgU1mwOWJxMtg==
X-Google-Smtp-Source: AGHT+IE4Z97WqPTY6whDYYFojroLMECZvQLJmvdqsAduNjh17iqwixHR8OU1x0n8ZEx4yAwnePdiwQ==
X-Received: by 2002:a05:600c:4e8b:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-434a9df1f34mr200128515e9.27.1733149939226;
        Mon, 02 Dec 2024 06:32:19 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:18 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:57 +0000
Subject: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143220_712811_6A7D1403 
X-CRM114-Status: GOOD (  11.91  )
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

Fixes up errors on HDMI and interrupt controllers that weren't
noticed before merging.

Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
 			#size-cells = <0>;
 		};
 
-		bsc_irq: intc@7d508380 {
+		bsc_irq: interrupt-controller@7d508380 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508380 0x10>;
 			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
@@ -344,7 +344,7 @@ bsc_irq: intc@7d508380 {
 			#interrupt-cells = <1>;
 		};
 
-		main_irq: intc@7d508400 {
+		main_irq: interrupt-controller@7d508400 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508400 0x10>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
@@ -352,7 +352,7 @@ main_irq: intc@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1


