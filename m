Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D03D148A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAyXDWLGELFvv1UWhWJn7SNZwSDSfP0ZE2dhDg/EXvA=; b=RK7SoUT7mxPf33MqO5oYv9SAVr
	PK2sdQ+BwCixRaTYdgM0ZVk59AQbKfYbKCAbm/OhtVJ1tJZRDRWCkYtyNQ7iUySrChzWkZKejwOs9
	tc7UCKpVJryTolBH+tQ8H0Nat7hxf3lA8SI5/5tdQTfTlDhEwzN0BnAZY1KXp9KOi5JRK+IpzjyjN
	ivmcjLAIer+94vYJ4ef/jXaoijE7UbxvDwRMA8xCtpZ+1XB05KByI/NhHF81A1jrWpihWabI9cOCW
	Xb3+Ynp/4Q7J9f7BlGskMSTsAA8wSXdmfMRdAAPCvC5v37DwU+IrPEyaEe7rwg+6l+yt6hZViTcK+
	ASYUmt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjvO-0000000G2F3-3ITG;
	Thu, 08 Jan 2026 06:55:14 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjvM-0000000G2Do-2RaU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:55:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso5837419a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855311; x=1768460111; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAyXDWLGELFvv1UWhWJn7SNZwSDSfP0ZE2dhDg/EXvA=;
        b=VJoyb75v1Igmm3j4VHajc6b0OJXO0DwUkDOOcaNE73GOqatFqqjdCbKCot4KyC4JCK
         rVDdBa+gGZ7FziWeTrMZPPfMD6YLpO6LeBOmWEIvHt2wnRQiGbK0AVHGbrZzHhpx2Tua
         ZmI0ET/H/MJFE221K9EP4Rl21gS+EvNcFRMsUgtKTf9QkLu7c82BJUpOVzDvWw1CkvBF
         uQxp9CuwxqzkMNQ2P/fdDqzJAaQcpwAItZT9JhfjnP/kuz/e3U1I3VNDB1aJ5k7I+PD8
         EBOvmVq2fmYhu62F155bZ3kDCzYrO/RQ+OUsAF+qJ2I1SuDr8DqOQrFE+VUyuipw9qss
         sn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855311; x=1768460111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAyXDWLGELFvv1UWhWJn7SNZwSDSfP0ZE2dhDg/EXvA=;
        b=SH7LCrqmCouV5sgodyDJy87Exots1yhcWQ+qX7tpYrvV28NrbpuHqvwt6ipwLWK4kt
         GSMCr3XMJqpnEWSANkgDhyNYfdeWVugg8po7+p8EFeOzzP0OkJ77k+aSCzWCha4eaxXk
         zGTQC8IjIL8RmCtBECLSlp3SWAR1psWFu2ZKBgav9udC6LTEZmVd7cAKHMCSK2JrXm5R
         /LJFgfy5x2vvM1B+iB75q+w0EVjoUPTiveEY9453QJZhg1rrOGftT+5X1yXIC8bp97hg
         xN+PEx/PoFdTd4+dgngdvoymNTAIFN/w6S7zG7K1RvcWo9+KqJ7pzxXxonBA5bYgWNoa
         kwew==
X-Forwarded-Encrypted: i=1; AJvYcCV+562Pi8/YOrArIdDcKSWl45vFT5e4g+233s7KhhPx+/Ug//yFjjm71a9pVR95IeJZFfp5sIihmQb0LkgQxoAy@lists.infradead.org
X-Gm-Message-State: AOJu0Yznwc8hqrDkn5hOJ1B9PA/WiGNR6FOAPN94cz+5E3NM+Fcy8n1f
	KL10j2IsxPrU1/pfDGxKjWXcVHGRltoNmn3YTnRZoBtmkLZgouIfXKnQrkcL3i5zb+bUVxCLuJU
	5iPVqbFYOhelMInb3NHcWaWPIxrzp8rY=
X-Gm-Gg: AY/fxX61u2o5hrKqpo+HXSpxKlkxYU85Z/TuyASjoooOl8m/74nBj2CDK69UJRIxVbY
	FAYo8Liu3EI0D2KaRtUtcZ+Nelq7d6lLKfX0b1zE3wXZHj0lvqvqYx0GxQbH0Tp/fPZ9IWXxrmY
	PWaJIr43Wcf1KOfHph+D9IDtak7zih64qLKczXNLf0/Jl8N09AuffPM+TZJRyPlOy9Q64J174Ca
	lPwLBBEOnRQIC9bVGhZLWRHgcd9jQVGHqSN7kYhme3ZjH/kaS0WAVXAAla9tiIXB8M=
X-Google-Smtp-Source: AGHT+IG4m9qvtkc1tMc4hksJp1Vna2m4aQX4wMUQg4Vqs3Y0Vu+b7EVPh7KsSp/EWOjuxv2xkQR9qBYjiSFRJ2sMnsk=
X-Received: by 2002:a05:6402:27c8:b0:64b:5f4e:9e88 with SMTP id
 4fb4d7f45d1cf-65097e4d851mr3774748a12.21.1767855310352; Wed, 07 Jan 2026
 22:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-2-linux.amoon@gmail.com>
 <aVke1kQnHJLqWGHi@venus>
In-Reply-To: <aVke1kQnHJLqWGHi@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:24:50 +0530
X-Gm-Features: AQt7F2qhaPGkLVIcZtPHVBeTYLw90eQbbpNMhgJtysYJBe3JW3HGYEkeT1DfTvQ
Message-ID: <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225512_639081_F514BBE5 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Sebastian,

Thanks for your review comments.

On Sat, 3 Jan 2026 at 19:23, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> > As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> > active-low signal. It requires a pull-up resistor to maintain a stable
> > high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable signal
> > requires a pull-down resistor to ensure it defaults to a low state,
> > preventing unintended power delivery during the boot sequence.
> >
> > Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> > pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> > electrical requirements.
> >
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
> >     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> > ---
>
> Checking the schematics:
>
> 5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
> 5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R95035 is NC
>
> 5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
> 5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
>
> 5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
> 5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
>
CC_INT_L is gpio interrupt pin to enable the I2C read operation.

As per FUSB302 datasheet, here is the updated version of the commit message

Configure CC_INT_L as an active-low, open-drain output. Per the hardware design,
this pin utilizes an external pull-up and is driven LOW by the Type-C
controller to
signal the processor to perform I2C register reads.

The TYPEC5V_PWREN_H pull-down resistor is turned on as a signal to
the Type-C regulator, which has an active-enable-high property. In this context,
the regulator is used to set the polarity of the GPIO used to enable or disable
the regulator.

> TLDR: All GPIOs have pull resistors in discrete hardware and do not
> need them muxed in the SoC.
>
It depends on the GPIO, pinctrl PMU configuration.

I was thinking of converting the vbus5v0_typec regulator to 'regulator-gpio.'
to better reflect the hardware schematics. The TYPEC5V_PWREN_H signal
(GPIO2_B6_d) acts as a state controller rather than a simple enable pin,
and this change ensures the device tree aligns with that design

[1] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf
(page 28)

$ git diff arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 5f58e339a052..387ff009ec76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -57,9 +57,10 @@ rfkill-bt {
        };

        vbus5v0_typec: vbus5v0-typec {
-               compatible = "regulator-fixed";
+               compatible = "regulator-gpio";
                enable-active-high;
-               gpio = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+               gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+               states = <5000000 0x1>, <0 0x0>;
                pinctrl-names = "default";
                pinctrl-0 = <&vbus5v0_typec_en>;
                regulator-name = "vbus5v0_typec";

Could you please try this at your end?

Thanks
-Anand

