Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A0C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=; b=wmUdbrBb7DeraPT+3HdTEL1yca
	q2wMMKNqx1SDlJlyRlUeS8IrWQ0QrLPnMfBxuSgRB0WBN9bid2yJGArqizL71rSSbBxL+xJBWHQrb
	QQaRiz8oFuoWiTAnyfu5tU040QvfU18tLemZX0lkzh8u93krIJnKopBMFjJkDdXGwqyZvqYkETtIN
	8pUZzsoXIHLwUWKmgmHbHQd93fBNF04Tpptu9o6dBwrrXpYT05v4tIwKknZsrGe4QmnWbuwtrXkq9
	jocbSMpZArdaAErC6tiKQ8cvN6MUpPrnxuFGEI7d5W0HfdTOUXGMETBYdukteRxmUghIfIo2BW+Oq
	oSljB8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOH-00000002THz-2zgD;
	Thu, 28 Aug 2025 17:26:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTQ-00000001hKC-26dz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb78fb04cso146333366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386927; x=1756991727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=WmBhdJPm+BzVj5B/TxPsSjMkO1gwNMWuaetLiBojqN8w8Z2aLyM4cnzQOZcRnQM5wU
         4mI1whGUlDQPsYiPddJky8IvpZVLp7hStd7iqOWlyxXKZWLt2sriGe7HgWRCYAsVgX3N
         scoAkTvdLR09SE9w7G88xJZCDirQtTaujyuoRpcez6BnBMC+y/rQ+X0FVwvMTEgMrpr8
         I/zCyMGiiesh4OBNxAG+y+cuRltNnabakeQtbrLbPNx4mAHCkWjIJHW4GuY6+itKXJ5X
         H0TQ5JeXuTg/JuKvS5rL3VcH4nC8wpKh1/mqqgPiZ/gpwgWyq35SZT9UO3xc1xMQr7lu
         x5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386927; x=1756991727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=o6BVoijvdV1NBIWBOG3eNJ/0FzR67TjGMD1R0XQEYnDrZ7EpUx0aWEr2STUND+cXqj
         uVUVJqnwugPda+N/TByOLKX9LKcjhifNWJ7WqHUC2hAb+yFHXCJO0+pkJcs0wFhjuVFx
         NS+EMLXbIw92WxhTXkqYclQlcFrPZjbHqtfCqTqqyYFWfB0DGkUu3UPuMJeqmetLrPx/
         2CJMFMzHgn0JgSiCQ2yMOvufxc3WGshFXpvre7vKsfKzZNbWnaTYMXVhj3tVQIOaU+E4
         dIgw5HQ3YXcMKZq1qJLTsxMnIU6ceRM+mVOc8tAiakfrJLrygqO6bRNzie1NoqVafr3o
         v8mA==
X-Forwarded-Encrypted: i=1; AJvYcCUPNCLdI53CpO2v/EedUhDKs9T0dlW1dA2Wlz31MOUcfRmNligIi+6ljisOo8Ih7Wluyis9/0rL6e/SJqdnyVvw@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDN6Mditxs11iUUPbGfHtn27vY6ichaMRWHOJeKZ2zp4Z/Gys
	i5oqQH07qvj8hewU4znDG9Ku6x38yM6xk8nYDry4v+KKljdZQ+Lrbo9XTTxDwEcyM0M=
X-Gm-Gg: ASbGncs+8uRk9OYmDwmBNZA7MYuHPs9FJwCtMfjKfn2FDM7jgqK7+BWce01VOg9PTyr
	kWudZv0lZn+7Oof0LT2FtItQL7uQrQf7Ar4PeMjYjBab1HRRNVHxECDptstd1fDKdNtCmD8GElh
	XJqEiOdgm0wMDquKEh+ft5LqOtTmHRJhgS9j4pdJU/r+hdV1mGSlef25jIamny7FQbYVm8ViW6b
	VMUVUTjq5DTheSxFgS/11dY7iWnXaANNIBAolmg58EU7lkN9MMati7lf4AsMuHLuUG9yTWpaFRB
	EmZc+BcA/t+AiwcDTpK1A80nIPIwlij3p1CI3EZKi9GiBEXHpglyYqTo4TYJHoTHDas/YUWTKXc
	w8M5KdW4+lxTz5jBC5847SL8nk2K4LFDO6Z2PQW5lBm7nYQ395agIoA3sRb1LHnWfTo2P/EKouV
	fv3J3FcSO1KB6/opbyfZ0cNjMFBLI=
X-Google-Smtp-Source: AGHT+IFASTcYU1kmiPw/dIyGBabTtHK5TXjK29v0S8XCQMxwAXDktvkvQ4lV7/Zr24KakzZQ7bRZwg==
X-Received: by 2002:a17:907:3f82:b0:afe:d1cb:632a with SMTP id a640c23a62f3a-afed1cb6ea9mr444267566b.37.1756386926851;
        Thu, 28 Aug 2025 06:15:26 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe9c908414sm641942066b.97.2025.08.28.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 2/5] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Thu, 28 Aug 2025 15:17:11 +0200
Message-ID: <5ceba8558e0007a9685f19b51d681d0ce79e7634.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061528_543597_67E261B6 
X-CRM114-Status: GOOD (  11.95  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi      | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6ea3c102e0d6..6091a1ff365c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -53,6 +53,21 @@ sd_vcc_reg: sd-vcc-reg {
 	};
 };
 
+&pinctrl {
+	emmc_sd_default: emmc-sd-default-state {
+		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
+		bias-pull-up;
+	};
+};
+
+&pinctrl_aon {
+	emmc_aon_cd_default: emmc-aon-cd-default-state {
+		function = "sd_card_g";
+		pins = "aon_gpio5";
+		bias-pull-up;
+	};
+};
+
 /* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
  * labeled "UART", i.e. the interface with the system console.
  */
@@ -62,12 +77,15 @@ &uart10 {
 
 /* SDIO1 is used to drive the SD card */
 &sdio1 {
+	pinctrl-0 = <&emmc_sd_default>, <&emmc_aon_cd_default>;
+	pinctrl-names = "default";
 	vqmmc-supply = <&sd_io_1v8_reg>;
 	vmmc-supply = <&sd_vcc_reg>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
+	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
 &soc {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f..8a517261841d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -243,6 +243,16 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@7d504100 {
+			compatible = "brcm,bcm2712c0-pinctrl";
+			reg = <0x7d504100 0x30>;
+		};
+
+		pinctrl_aon: pinctrl@7d510700 {
+			compatible = "brcm,bcm2712c0-aon-pinctrl";
+			reg = <0x7d510700 0x20>;
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.35.3


