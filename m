Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D97CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJFVpcWLs8hzJhZRxA8jQtAdYhxmsHzd/bzdk6pJg5A=; b=KK99EYwKvubysQuo3Useu4icAD
	4ucozVA8tkcWgic+yjIaCkRoh5iX9tAe5JNSnlWNdEouOrryOcyY7SHUXsvLDbEoKye7ppFBLyKsH
	xGb04xUYC6LG9fbRoC2El0Vv2C0HuVbCOGfoA2Ci7D7Bo2Kaj4tVC8l5GU7egvxFWeK4iJLXT0OEx
	WWjzk/47j2btHw9yEegLl76nW5F/qeU5SRh2FaAikkMNaKeYhszpCsNb3QiygymIu8uD+icUx/J4T
	IlxnULOTCYOszgeaCpJswXX35g25qFpZcNKBX9ELlop79au/lwYUoylJ2rZ/iXU6pglwPL8Ceun7A
	33vioXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK5h-0000000CIB1-0MoL;
	Sun, 07 Sep 2025 18:26:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK2p-0000000CHj3-1WRT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 18:23:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso32364295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757269397; x=1757874197; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJFVpcWLs8hzJhZRxA8jQtAdYhxmsHzd/bzdk6pJg5A=;
        b=pyCOF1XsJtxZ5J2vYgvDT5esnNS8hkFnm3owgDqhuhz5n26rLKobm0x0HUKRDf+2+z
         cKxb1TL6XMuqzO3jWgG028QIcso0dlf9mazjDBfb8FdiQX78wO+1xNkn57T9nIYZCNgU
         BLQxcfxwtOP0cIld5CtEExKArq8yfNlfE3ilhmYl5iWPON/6ONGaQ5LEWMjZYsK7OKDL
         6xx7oG8kJlhqBznEPHxOZ0o2k6AAZBwQrkvqADf01RIMSRCMyVMb8Hq0mJg5iSDSR4Um
         4LmM2p/g7bDte2n0rHjkJ9PCkZmHqMJRCfSxvajLugiyTcumYxv2y76mcyJaJC39fKg7
         X6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757269397; x=1757874197;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJFVpcWLs8hzJhZRxA8jQtAdYhxmsHzd/bzdk6pJg5A=;
        b=MDZ3rk0WbbOg7XqupM/4I2s2hNLeUIdgH52UIZ69kMtTVNELX767cXyMLrTprWPTVs
         UlC+iIL7dPatmL95XInUX6ycTPNoT9uBjQOxWgFFeceFUqLGeZElHSE6AJqQv0sjqnEN
         8I5/35MsfhipVVg2cHM2aaXzUH1ENEpKHi/CEXOFC82BRgwuuTzCD9+qoPmbqwYTHUPJ
         frwFdS33+mF06k4MyB5bZigZ5xb5IZ+aqSmabFRYlNp5jOzpFokQg4dHHYPEMR7WiDzB
         oicmJ/fr7MHrfIbLrVSwKZzuAw42SkAIJo2paf/6q0MpGA3VCXIMykrKgsMBSiZQl5he
         yy9A==
X-Forwarded-Encrypted: i=1; AJvYcCVAx7hhdATi5RUBEyneUcz2x8dNURHdm2vebOzzabN0nEJmmJoFY5j/q2vaO2EuF9VWdHGBplxzLA2s0ER31yOU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2LafG9vs0nul+rqDGMED/wmGAZysUey1NhKrFQJItMfvDFPuP
	Pd4gGhQiRXUZqoSbOo9Vkzel30fXZrP6FTFxPMQ+OddPksVeGvOiHUmOdXUNvzVjWZM=
X-Gm-Gg: ASbGncv6wlMdpFu2TwpwUB8QOpf+yN1UpcJcPwn8gjhwg2ANhM6VWrkb6P47cXYw9OY
	VH7fFeP3uYc261CSEIgrWOWSv2FnDxST+LuQMKxWk4MoeJJ8nto9FHQyANc5yMtXVwvnFu0RM+u
	OT+KvxCGqe7zZFWkA+dfX3X2uWH1hhxXb6DuV4zYGIAhHDQQW6/mK+phjPaAhIEAcEfnLLJOK1v
	5Zte33MI0ZYEC80F8GvYESVUft9osPO+zjNhbr45Z0WsthKgUN9bQZHNn3907EXEmwDqADSU/E4
	HOdQCixKpBF809hcUOnOC8Mxf9Ozge5rdNwNf3WtCGDFkDcgnQ5cVPlcK20Bj4WzIC7zEbn5mWu
	JehybF404JU8evITqEJWu5cVRV9i7WNwc+LKH4olETaM=
X-Google-Smtp-Source: AGHT+IGOULUshdeLRil6HKEu9zZo7J9O1jxxfK8N+bL8o+p4kBnHT1aasX29KcGupM6Cw5i6XsgkhQ==
X-Received: by 2002:a05:600c:4e93:b0:45d:e0d8:a0aa with SMTP id 5b1f17b1804b1-45de0d8a342mr47706135e9.17.1757269397175;
        Sun, 07 Sep 2025 11:23:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c6e0:b19c:fab9:63fe])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd296ed51sm154484725e9.3.2025.09.07.11.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:23:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  vsetti@baylibre.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: gxbb-odroidc2: remove UHS
 capability for SD card
In-Reply-To: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com> (Valerio
	Setti via's message of "Sun, 07 Sep 2025 14:29:21 +0200")
References: <20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 07 Sep 2025 20:23:16 +0200
Message-ID: <1jecsi3ywb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_112319_639283_BCA50F52 
X-CRM114-Status: GOOD (  33.77  )
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

On Sun 07 Sep 2025 at 14:29, Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org> wrote:

> From: Valerio Setti <vsetti@baylibre.com>
>
> This is meant to resolve reboot not working on this board.
>
> The problem is as follows. In order to be able to switch from HS to UHS
> mode the bus voltage needs to be reduced from 3.3V down to 1.8V and this
> is achieved by the "vqmmc-supply" regulator. The ROM bootloader is only
> able to manage the card in HS mode (3.3V) and the switch HS->UHS happen
> at boottime in the kernel. The problem appears when the reboot command
> is issued or watchdog expires because in this case the "vqmmc-supply"
> voltage is not returned back at 3.3V before rebooting the board so the
> ROM bootloader will be completely stuck.
>
> Therefore this commit removes both "vqmmc-supply" property, which is the
> one causing the reboot problem, as well as all the UHS modes which would
> now became unreachable due to this regulator control removal.
>
> In terms of performance the main drawback of this commit is limiting the
> SD card bus speed to HS (25 MB/s) instead of UHS DDR50 (50 MB/s). However
> this comes with the benefit of being able to reboot the board, so it
> sounds like a reasonable compromise.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 959bd8d77a82ebc78c5e0592d7613e692e4ede4e..331a0a62b884389b4e0d4d157fff7f9c8738c89d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -348,17 +348,16 @@ &sd_emmc_b {
>  
>  	bus-width = <4>;
>  	cap-sd-highspeed;
> -	sd-uhs-sdr12;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-ddr50;

That's a compromise we had to make on other boards using similar SoCs.
With the ROM code not reseting the GPIO used for the supply, It don't
think there is way around that.

The above should be enough.

>  	max-frequency = <100000000>;
>  	disable-wp;
>  
>  	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
>  
>  	vmmc-supply = <&tflash_vdd>;
> -	vqmmc-supply = <&tf_io>;

... but do not remove that.

That way the description is complete and the kernel is able to verify
the regulator is properly configured.

It is also easier for a bootloader to alter DT to add the UHS modes back
(it is safe to do so if booting from another device that SD, such as
eMMC)

With that
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> +	/*
> +	 * Control of vqmmc-supply is intentionally omitted because it would
> +	 * prevent the board from rebooting properly.
> +	 */
>  };
>  
>  /* eMMC */
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250907-fix-reboot-04e0fc919ae0
>
> Best regards,

-- 
Jerome

