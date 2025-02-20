Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF2BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/oPr+uhiMwVLonfT4r87s8BLvEv5cJUIRCGxgmU+Z4=; b=jVoN5RSxpAtM1ptC/LB2oXy6qz
	ByxfNbPL2rXGygAY3xt7v1MI4oeoW+60wMeN7k6KC+XlIzjdGCy2zg8gDpHx77ae4hFwhLAXSrzjf
	GqbeHCmzXZHwpUp9mm3SY7MLKt/Y6DsxkKaozRQURcSSEpf3yG1DZkmRPRwhGcNiAu0gKugNrEopw
	4GWZ9g+lWPVNQaG3xKhx57xOXg9P98e5UkDtV4w09J9AWxCeEkAYPX9Jw3/SE8yMKVaEYcUC91ePH
	FpOhoPgdSKCXqBifFI+o41t10bhlsLPCl94iq8iCOzDG9RgsR1+uj+yfgSofBUkSCbNAVPgbDtVQw
	QQEnWTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDLJ-00000002pBw-1Il5;
	Thu, 20 Feb 2025 20:40:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDJo-00000002ox8-1BJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 20:38:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso14182535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 12:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083926; x=1740688726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/oPr+uhiMwVLonfT4r87s8BLvEv5cJUIRCGxgmU+Z4=;
        b=nIUL4YjZHIRYGcKpjIjgAM7oMz99DHZilRn4gLZYjnPCH8ZmWtpv/ImlLC5BppPF0A
         SUCtq7JeOAgnWrbyYlvisKNMUUKEnk1YH44gtBWye1LXkW/oA28faaNIDR5yfhrJ6do+
         6JD/JCrkENY+Hm1INr5RJXcSA3lfqqfJRqXuXs1vh2z6QLl0adsbEHnfYz8srPV+2dMD
         +NP4Ig+dg5L3B6qKWvZcAHoOEfOOtdcH7Pr1Bm4QyFkXh1jVClBxscTb0DAEIrRCamN/
         yvkTCk4rvvYczrYLFlVe7dHIHE60+6nGbDytPlrGNqd+lEG8P6+roVjFBc0SoqY6ukfo
         vboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083926; x=1740688726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/oPr+uhiMwVLonfT4r87s8BLvEv5cJUIRCGxgmU+Z4=;
        b=A+fTZ7L2PsaJSBEPMljnOrkTmh2f4jaVASzmwH/+q7m0Z2LnksBoUetOP+6DPXi8uE
         ZV9oH3hVdaonQzkRob0CvuHuU0+XmWp+oK38ezdPhz0F7doI4ALPPzlDo99zSFbuOz1R
         L2/laXgtDjOYw1dIg96SN4NzYPSU3Zn2T/TV0S0YB/2va5hAfnki56io6+KSkszlfg6d
         F793UNaNnfvbBXNjTguBeK7duVFgC0sFKrj2F1Pn/Vby1BB8vRAff9o8gDZEaHRyJrLu
         k88pkE7XwtHg7vq0FBcVxzDJHkxno00vy7wUlCpWvbp/4hpEiHrphnrKTCgBvxM6JHQA
         UwtA==
X-Forwarded-Encrypted: i=1; AJvYcCX1+QqohzRM6GgqSOtfuTT+LnJ8ohORd3JRFZGMQnsvS4SFkP1XM0b1ONvOKsCvlOH+BI7fzU9rUBNvRhBij7ip@lists.infradead.org
X-Gm-Message-State: AOJu0YwdabFFWgzEuHwsMAQzIHjLJkT5AidcV4tfQCAE3DoaBbPxgxpT
	5MF2YDf4ZnlDb32QvxW3VGohI5gY53eGmqEvdUW/uvW2/t6y2w4s
X-Gm-Gg: ASbGnctPU35BDsan+Gr4OGYZ1spIWoJbENlXqm2YhQKBAhQNgZ8Q+5wG3rZMUFeOs6l
	vJNHGMQwxk5zZnEkqk19Yr8JSGNCegI2gIKPEeQKniLaDM32aVufn/bOiaG8Q4OPsWmoRhp0QIe
	VPco3e8Jyj2mrCHXW9UH/1uOkCEkqcFjtJBuwGiPZUHFa3dBJ63wQL+yF8BadwoLbBb2uJR9aDs
	qdx8V8gc0SoGEx5LF+D5SNIBe6S8QwmRnFdmcMDPQkO9i5ta1t++RmakjZkgsJZxTopvf9q+2QO
	7tdSsfi8oJT2iiL164nDYnlrjUocPuVawUZo0ErRh+FltZtPdq5O67lEnRGYXogjnMA=
X-Google-Smtp-Source: AGHT+IH9AWEvVPP40afiEyTpAqrp+DWpZtEd4U6ccKRCJ9igZQuFw9ymkzn2FjL3McLqq0mzFVmoPw==
X-Received: by 2002:a05:600c:524a:b0:439:86c4:a8ec with SMTP id 5b1f17b1804b1-439ae1f1147mr6622885e9.15.1740083926326;
        Thu, 20 Feb 2025 12:38:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439a3cc9551sm31663025e9.39.2025.02.20.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:38:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: allwinner: h700: Enable USB OTG
Date: Thu, 20 Feb 2025 21:38:44 +0100
Message-ID: <3229934.fEcJ0Lxnt5@jernej-laptop>
In-Reply-To: <20250118102207.9339-3-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-3-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_123848_317575_37285B00 
X-CRM114-Status: GOOD (  15.28  )
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

Dne sobota, 18. januar 2025 ob 11:22:06 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> RG35XX have a GPIO controlled regulator for phy0 vbus, add it.
> Enable HCI0s controllers and otg for dr_mode.
> Add phy0 properties to descrive id_det, external vbus, and internal vbus
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

This could work without previous two patches, right?

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 80ccab7b5..5a6ae42de 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -175,6 +175,16 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  	};
> +
> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&pio 8 16 GPIO_ACTIVE_HIGH>; /* PI16 */
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "usb0-vbus";
> +		vin-supply =3D <&reg_boost>;
> +	};
>  };
> =20
>  &cpu0 {
> @@ -337,12 +347,23 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> -/* the AXP717 has USB type-C role switch functionality, not yet describe=
d by the binding */
> +/* the AXP717 has USB type-C role switch functionality */
>  &usbotg {
> -	dr_mode =3D "peripheral";   /* USB type-C receptable */
> +	dr_mode =3D "otg";   /* USB type-C receptable */
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
>  	status =3D "okay";
>  };
> =20
>  &usbphy {
> +	usb0_id_det-gpios =3D <&pio 8 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* P=
I4 */
> +	usb0_vbus_power-supply =3D <&usb_power>;
> +	usb0_vbus-supply =3D <&reg_usb0_vbus>;
>  	status =3D "okay";
>  };
>=20





