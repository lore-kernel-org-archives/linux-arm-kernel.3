Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859CD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHNjTLLxaiUYX9lnsCkT/PipZxZCO7Z4aDIJ/ePIGAo=; b=NSWwF53RNe33TE7wPLKNDExi6p
	p86TMH+us3c+qsDDsnQJkr3K9R0/4rLAdwGSaMSZoSMqat14glnFjbrZ0bMGE7j3iUUtnlwM4YJSE
	Jd2vsr75sR8Ivqlpjy6vgzkJNom/hzsP4IwYLE6iJFVzLGGn70aDPzZI3tLax+FDtzcSUbk718fUT
	lmY0VN0jA86gTfGGL26jmbu70r3v0H53WcigXEYzW6Q8Mi3/eAX3j1ytVSlh3ySdstpcZ3bgfQ3Fe
	W6Ws+JqoxMPcs709/YGsKjAthEG2DmD3OQAuotwTxDuLqm8HlXzNWNqv4I9tYUD6vJ7yN0ACyBStX
	MqBzngnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyCc-0000000EM9k-1FGC;
	Tue, 09 Dec 2025 13:56:30 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyCY-0000000EM8x-1RBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:56:29 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so9138689a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765288584; x=1765893384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHNjTLLxaiUYX9lnsCkT/PipZxZCO7Z4aDIJ/ePIGAo=;
        b=AIwvQ6gVQdEn/YIFqHZrso5lFJ9gxtdp5idyBi/AfaFi93CDYQqs0Fn2jrpjVdC2oN
         Q/4r2IV3CmSX3ZKrsjvO/5lv4YFm3e56xFIGz4FBWPCgmD1lHPfxFLSeFv58YFTJFGeJ
         DTww9jYKVoXhTGdtUi0wvcwHP45uDSKRSdJiMXvXPBX0lJyY9ygd9qUSOHkSzZ2Gkrph
         D3Y9A2ChWAmzLs/nDELXpzCVNqJJaLcQgQEIUYwTu0hNmpxPYUo/9FEPiS8D0M9eaw0n
         Gsykh5iwDTnVoxg1/4sP+KsUrrHGvFOMaCbPJEMtx6JZvo+hyB99TfkSZqJRdvqeddab
         U5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288584; x=1765893384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHNjTLLxaiUYX9lnsCkT/PipZxZCO7Z4aDIJ/ePIGAo=;
        b=qeru+7sWljDk2k6bP+vOWN6L0DiugIepeMh6VkRdHWeXDBUXY3xy4hMI2fFrFYgmiI
         UCPAvivHtTXP7EwzuKriJg1F24F2RJdGyHLYCu+OpmSY+sr6LgJXx/hgSTh98yyoJl9W
         Fk44gBtnFqasJNdX2fcR5Qiy9LJIeXP942nYilfSwm2uq74EwsrRYRPD2J1QWBSJm0rX
         pb0am9358R5RGdcP8XjZs8SCSovchiD271iRqxv+OhNRTLBuroZXO7VIDlj7tgmKlJdZ
         ddH5Y1pTsxwerOT907OZFEmh2wZrJRrmaVR/91P6iK+0gTyXgu7ZS6YMq2blyVyn2y/V
         mXkg==
X-Forwarded-Encrypted: i=1; AJvYcCWXMmVpB+6zwYG5rq1Y5f0bpC/RQyVq3PL91CWQNUFFzjCwOVgTKTFP7QE8sL3pAJ65vv4/wYGmw6Oy7ZJfPINL@lists.infradead.org
X-Gm-Message-State: AOJu0YzpJK7drx06ummm+fvnvm0umiRduEuDJwwB/4b7l4CYnnLYD093
	wuazvo31HOyQxb/tAh7fcmsVEmtGkNB+RI1vWEjsOu1kN34rMRQFy5dHRrlG6PVmwCc=
X-Gm-Gg: ASbGncvGxYiinNH/ZcNwuRKi4SEDTAXbmx8O2MuCyt/LEFnIGp9+5UT957xyKT+7tXq
	bz+KYWgksEt3okU1PnpQceWck2tUHjpfOULKFKTsKYyzhl+g4R/Ofh+TyFQN4INCPsmGTCPOkRc
	ev0iiSzvNlNTfzg0OudUqAvOZJyeg3FDWpM+ZnV9QM/E6XjfKCg+KCjr+3l9CnjFwZMXam7Qk75
	jRGBzt/Dspak5AK+WIBCtNii2R6YB9RqEg9TUv5st0tBpA9s5p1buV1ilWbLnKFVnfeldA5LSWz
	Tye6AGQJcsP8asx7hn1bfAKrEp7gGDDZsRq8CA6Nn839XRJS+hzgHuNmzhfCGOzxNsY/u7TtihF
	F+heoRuLxI54Yxkn5tNg0UA72vGQB8dGFKI80uPANtLXvXmdDfgdzo6mh1vurbkXiDXFgdotyy7
	DBjTQh6wgZZVSKlBrdocNpzUuI6GWbzKJ8j9zJ/BwnsJPFomhGj6fucQ==
X-Google-Smtp-Source: AGHT+IEVtNxShWKdJLARvgeokUGdhCwxfGrQUplQ/ttNSMiqiRZXHBzJAE2rqsYOnWcYgx+CnvNcUA==
X-Received: by 2002:a05:6402:4314:b0:640:976f:13b0 with SMTP id 4fb4d7f45d1cf-6491a3e1fe8mr9388418a12.12.1765288583801;
        Tue, 09 Dec 2025 05:56:23 -0800 (PST)
Received: from localhost (host-87-6-211-245.retail.telecomitalia.it. [87.6.211.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dcf8sm14243157a12.19.2025.12.09.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:56:22 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 9 Dec 2025 14:58:52 +0100
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] arm64: broadcom: bcm2712: Rework rp1 overlay handling
Message-ID: <aTgrHEoxl7J8_BuU@apocalypse>
References: <20251117211503.728354-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117211503.728354-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055626_419418_0BC53984 
X-CRM114-Status: GOOD (  23.70  )
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

Hi Rob,
sorry for the delay...

On 15:15 Mon 17 Nov     , Rob Herring (Arm) wrote:
> It's a requirement that DT overlays be applied at build time in order to
> validate them as overlays are not validated on their own.
> 
> Simply adding a build time target is possible, but it's also not desirable
> to have targets which include the overlay contents and apply the same
> overlay.
> 
> Rework the targets such that there are 2 overlays: the existing RP1 overlay
> and the board specific configuration of the RP1 (bcm2712-rpi-5-b.dtso).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> The missing applying of rp1.dtbo will soon be a warning[1].
> 
> The comment in bcm2712-rpi-5-b.dts(o) needs updating or removing. The RP1
> driver or userspace handling of the overlay probably needs updating to
> handle the 2 overlays. IIRC, I think we can apply overlays to overlays
> which may be useful here. If not, adding that to the tools should be
> possible.
> 
> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
> ---
>  arch/arm64/boot/dts/broadcom/Makefile                 | 10 ++++++++--
>  ...m2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} |  2 +-
>  .../{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso}     | 11 +++++------
>  3 files changed, 14 insertions(+), 9 deletions(-)
>  rename arch/arm64/boot/dts/broadcom/{bcm2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} (95%)
>  rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso} (92%)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> index 83d45afc6588..4957edec9d9f 100644
> --- a/arch/arm64/boot/dts/broadcom/Makefile
> +++ b/arch/arm64/boot/dts/broadcom/Makefile
> @@ -6,9 +6,9 @@ DTC_FLAGS := -@
>  dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
>  			      bcm2711-rpi-4-b.dtb \
>  			      bcm2711-rpi-cm4-io.dtb \
> -			      bcm2712-rpi-5-b.dtb \
> +			      bcm2712-rpi-5-b.dtbo \
>  			      bcm2712-rpi-5-b-ovl-rp1.dtb \
> -			      bcm2712-d-rpi-5-b.dtb \
> +			      bcm2712-d-rpi-5-b-base.dtb \
>  			      bcm2837-rpi-2-b.dtb \
>  			      bcm2837-rpi-3-a-plus.dtb \
>  			      bcm2837-rpi-3-b.dtb \
> @@ -17,6 +17,12 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
>  			      bcm2837-rpi-zero-2-w.dtb \
>  			      rp1.dtbo
>  
> +bcm2712-rpi-5-b-dtbs := bcm2712-rpi-5-b-ovl-rp1.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
> +dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-rpi-5-b.dtb
> +
> +bcm2712-d-rpi-5-b-dtbs := bcm2712-d-rpi-5-b-base.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
> +dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-d-rpi-5-b.dtb
> +
>  subdir-y	+= bcmbca
>  subdir-y	+= northstar2
>  subdir-y	+= stingray
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> similarity index 95%
> rename from arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> rename to arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> index 7de24d60bcd1..48a0ae118839 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /dts-v1/;
>  
> -#include "bcm2712-rpi-5-b.dts"
> +#include "bcm2712-rpi-5-b-ovl-rp1.dts"
>  
>  &gio_aon {
>  	brcm,gpio-bank-widths = <15 6>;
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> similarity index 92%
> rename from arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> rename to arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> index b8f256545022..89d099c00035 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> @@ -15,19 +15,18 @@
>   */
>  
>  /dts-v1/;
> +/plugin/;
>  
> -#include "bcm2712-rpi-5-b-ovl-rp1.dts"
> -
> -&pcie2 {
> -	#include "rp1-nexus.dtsi"
> -};
> +#include <dt-bindings/gpio/gpio.h>

Sounds reasonable to me, please let me have a full round of tests to check for
any issue with the driver and I'll come back with feedback.

>  
>  &rp1_eth {
>  	status = "okay";
>  	phy-mode = "rgmii-id";
>  	phy-handle = <&phy1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;

I think this should go in a separate patch.

>  
> -	mdio {
> +	mdio@1 {

Ditto.

Many thanks,
Andrea

>  		reg = <0x1>;
>  		reset-gpios = <&rp1_gpio 32 GPIO_ACTIVE_LOW>;
>  		reset-delay-us = <5000>;
> -- 
> 2.51.0
> 

