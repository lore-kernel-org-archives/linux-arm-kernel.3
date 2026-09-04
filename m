Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C73C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZQTL/pBpcVt07rJQmd4UdoWGK2B3BL5sj1p+ycgeVo=; b=QwjNgyyOr/Zvf3JiHhZtOUhypb
	bxoD176+BmBochp1CkKjJYPB1UrKpzO3PkyG3ans3nXlFbmn9ufFe67x/AsF/ji/qVMfcDSwBwT75
	phRYK+n5n/hAJu2YIwMKMotnde+1vAw3n9gcXzAgJNchDKtz9JI0AmoNrfHCQ2tjaiaYmQRj2UF/C
	8ANhs9qRqqCUAHx6MwlwNt94ZmdcWhaHO7XwLVjmm1AQNoe8HiLUcB8CCjQCAmN5KkyOcc/1gJXSu
	lyIU0cw7mEwxR+RZ2EOrwaPwbAAyPoDZHmUenrf2wZbsX1g3pQeb6SkPqeeWgzRsFdq3BJKgIZwYA
	UHJRuv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RBa-00000001fOJ-0RbD;
	Fri, 04 Sep 2026 10:30:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RBX-00000001fNG-17CN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:30:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso5465065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788517813; x=1789122613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZQTL/pBpcVt07rJQmd4UdoWGK2B3BL5sj1p+ycgeVo=;
        b=f8MDOnUZ4gDntXEoTzJlzgJ+wsKI7N7OrAj4IqeNRXQi02Q1Po7z6aFMkebHS2IzuZ
         uTOPI6AYCvdKqXju+/wRwguF4sagafg02DQsPM4wQZzP5ujPV2ucInnzvjQreaCxlsY6
         KNZ573BnQMnBD5ROqGQXnlAO9xrSUjczAjeL5TIHo5km3YAdHpTcKGO9G6z11WH1Jg1u
         wkPpvHn/7DzxcoEe5HoUOrqMJWHBJ1/PLtKPEfVS3G2UZwxj6K81KwKHDQ9yXJyvcZHG
         Gf+OTJkDfI0zI0ZjnDzf0UT3u8gxyMlXmpc3LoNvzjN8Xb+Ga/O8u5RRKeMRoA68h1cv
         KvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517813; x=1789122613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZQTL/pBpcVt07rJQmd4UdoWGK2B3BL5sj1p+ycgeVo=;
        b=gq1/ncO3yN+OBUycMUb3ihsBTZurPF3b53Ga9z+TwAFYCG3xunD/rCPW+yz1fqdWZf
         7KUSHPYGlUhR85HBq1lMDoUDi4GoDezM3R76Q5ce7/WRyNcOG+i3TM/vPINJ+SoL0j6O
         dxiJ3aak05aqPiBHdCwnYfdJfwgiM9fJmBCRtiu03ldjBeYZeHrYjuqnswZAV1M3bk62
         MtOadOGgKhibqZXuTOyHW/8+wT+bPxXQdP6gI8+hCwAKzhwI7EOXHEuzgdojnGkicm3l
         fTXvuFbHRNxMisRS4A1Q/4DN4/p40wyrHx/7lLptP4hVaWbaxmd9zNk4fA/4PQ2zzB1K
         RcGw==
X-Forwarded-Encrypted: i=1; AKwUvByXQ7ki7gQ1segKeTp9Xr7L8Axk9K4jP3svC9MtQrqpD9AwcqA2YVsoTXZlODOmGM65GFhKD6DS67aLN8urJvu9@lists.infradead.org
X-Gm-Message-State: AFuF++mLADOMnYw+ukY2cKqD4TCePxs+wWqYAzAE5yLJ/nUzFpZv0KTv
	DBmsiQzWL7Agu8RczRU7nJQWKK8DPC+NIEM3eDmgHs9YFW3s9UJjWvyEataemiULMzA=
X-Gm-Gg: AYBFou2l31ScfNZUMyCCwrhg747A/UDnEL4XtjOZxcoHzlE2yofLrjQa2b/Z8Feie9R
	oB9AnQiG6KeemtBHO+qWszC92xxI85aVk10WpR0wRgN0WPhrgtF82OJusVZoehtaeETyBont9xY
	bc6b/FOf9TklTlI3cUBvEU4e/FKV9pMGz9DBU8CKDPoqGGiTJcGjQBEIy4+Fzf1DPKK/SqVj7pj
	LeFT/Sf+KI8TYvUx8iUpnYnWfHGMlzPNXLEFcRREOXNr25FaoHZj7YVwZBeEuT0gihmy/7exaAH
	QeNrd1bWiMRxqjLv1+7TxygFCzsaIiaoVkz+GmVOla43ANCluyA/7vY3LQGNSoZvRGLo6Yi24e2
	iU6OvYI820OCCcYEtx+coEXr39JiXTTUOTJFv/rFnhmfMBllTA1S7PMxQl7teRB8r+GKMV7pxp7
	If5o0d6U/A1V0u72ArYlDEQL3ljtI7/y1xWhYmMdfzOVV08z4TJJDVTLF6hw==
X-Received: by 2002:a05:600c:8708:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49cfa211d48mr27435135e9.17.1788517813094;
        Fri, 04 Sep 2026 03:30:13 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm5567744f8f.24.2026.09.04.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:30:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 12:33:51 +0200
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <apqej5QyjOHu702A@apocalypse>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033015_326347_B3839FDC 
X-CRM114-Status: GOOD (  21.77  )
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

Hi Gregor,

On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.

Just a nit-pick: in the comment it's stated that the spi interface is enabled,
which is not true since rp1_usb inherit status="disabled" from its node
definition. This is fine because the user would probably want to enable the
spi interface through some overlay, so no need to resend the patch (at least
for me), so:

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!

Andrea

> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
> The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
> spi0 is routed to the pin header. Add the rp1 nodes and enable it for
> the Raspberry Pi 5.
> ---
> Changes in v2:
> - Drop first patch as it got already applied: https://lore.kernel.org/lkml/20260903194624.2038562-1-florian.fainelli@broadcom.com/
> - add cs gpios to rp1_gpio for pinctrl
> - Link to v1: https://patch.msgid.link/20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..0de3d78100a5d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -69,6 +69,20 @@ usb_vbus_default_state: usb-vbus-default-state {
>  		groups = "vbus1";
>  	};
>  
> +	rp1_spi0_default_state: rp1-spi0-default-state {
> +		function = "spi0";
> +		groups = "spi0";
> +		bias-disable;
> +		drive-strength = <12>;
> +		slew-rate = <1>;
> +	};
> +
> +	rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
> +		function = "gpio";
> +		pins = "gpio7", "gpio8";
> +		bias-pull-up;
> +	};
> +
>  	rp1_i2c4_default_state: rp1-i2c4-default-state {
>  		function = "i2c4";
>  		groups = "i2c4_2";
> @@ -94,6 +108,14 @@ &rp1_i2c6 {
>  	pinctrl-names = "default";
>  };
>  
> +&rp1_spi0 {
> +	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
> +	pinctrl-names = "default";
> +
> +	num-cs = <2>;
> +	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> +};
> +
>  &rp1_usb0 {
>  	pinctrl-0 = <&usb_vbus_default_state>;
>  	pinctrl-names = "default";
> 
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260811-bcm2712-spi-644b70fee3bf
> 
> Best regards,
> --  
> Gregor Herburger <gregor.herburger@linutronix.de>
> 

