Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FED3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4jDBOd4uA6iWq10QaHFHWmxRK0/Onl9k6WANOitcUI=; b=SajlecflwEG6ZWwlKT6SJgK6zz
	dOzXYTFNP7IO6igtzkWbbclfM/NnodjSg6adIwxcrw7qQtfF1UB1ZSNLIVhX3Mk1rTroKuguKG5CC
	uAlYrC64KJb4SxkmT/RMmVzmneD5Fm+HnlPNYXbMJe8IrCLknBK3cSKHI5DwOJdQh6txVutooLRhB
	7u895nCadzOshh4eSU3ZbYvi86liPzuSa4aG68tv02x+gAMp9YRm0cEp5owZRFI4nYf2Ye0gRYXLt
	9974GermcSDnyp5L/tXNOuHbW/Uk6svHGP32dG7Rl4JHoVX+3AP+hXxXPT8n7zyQszkDhtIYz0TtI
	xE4NZTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5oz-000000046da-2CUn;
	Tue, 07 Jan 2025 09:24:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Y3-000000042nm-3CGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:06:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862df95f92so6688063f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736240810; x=1736845610; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4jDBOd4uA6iWq10QaHFHWmxRK0/Onl9k6WANOitcUI=;
        b=HCLq5g7CUiavXdvYOK2111CartFOMaZV4PHxzojO/723D9hipmPMMpjKqJ6BF6RL4N
         fI6VUPLU6C9CnPr6iq4snliXTR1VlCD2xGk2boQq5ry+4PYC3l6EHd9F96G0zW0pOJ1U
         oW4qkxmmrpuVrK/tLvRn6tRlBGK7hgKr9Vci+fNPPuoeLKcqxiwNKfTaiKln9Cv0LRUB
         c7ekJhPotvQlMtoqSOdr/i0B829DAuYYTTrAp+cSxcqzFlqFCW50+xfgk8afatkKAAPg
         aLR/iJ734bmnl/hjqnf8vuCuKSvpq1sHynbwgeIMic1vu0Sv/kLFfiYbYReGoEL7rFnk
         lOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240810; x=1736845610;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4jDBOd4uA6iWq10QaHFHWmxRK0/Onl9k6WANOitcUI=;
        b=a+iXTcJzNDX4pJChDHFINKVGkbeNIKVynRl/3JEuF26uM/g4flwgv//bASOTRiIGC6
         ImeWJDZS602jxH4lsy9s1kV3HoYqdrqdWj2rzEjaI4c9qiO6C3/Rv8jeH4K2mKseMIa0
         2+pg6cEr/IrWT47XZ0vthuHvkOPmqv+z+AdeOhx/njGp69lQ0mV9pJrmnyXKFVahGY1j
         NEce6KAzVH7BB1MeHH/rF7SJhToHyOkZeRDr0SXaHgcvQp9RwbvfCQt70AAod+Nq2OEw
         7uSnQR1W6hOre7iipej4D/B3g6NJ7fgjilANOMGOqi2P8/lZ1KynMjNcz3mig1S/rq8B
         5/3A==
X-Forwarded-Encrypted: i=1; AJvYcCVgLKChcQgo2JNZQuepZ5XRtkB144j5LyvF4L53tZ+UhdTiN0V6RKOPWfwVqqXop/vS9pZQ1SSCkqGS0kUFtdEJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxAhi1CprAGnsPB5GcQJnxg4uyatptf8EbGt1xppyJdoRJkDAYa
	hEJumMoIPLV24AmyGnRGBR0Ly2Budg3GH+SV/DbBbWeENGzYvG7vYLPKXw5o7pY=
X-Gm-Gg: ASbGncv6xJtkf0zazunFDF22zIBKNmTh1Kz2adaRYI4Twnw3ESFbfiDJeHK8Y55K/hC
	jzMenL0gXv9wMfSiIcYX+VrDq6G9bModC67IVHuxBc5xft7/5SWwz8mi1qTIPiEUPi37Zafz5vq
	kdMo+FZRMharcgD1E9thcwkoh4Z8bzfp+qCzAi8zvSi+F0JMW0akg66BMMd+GTwEEGuTSJ1kGwM
	uLmDCH0EoSRk5XLqNwwWQA6iYGh6A2BnJJshgPh0NRTtpqwFmNVxEIQSrr54w==
X-Google-Smtp-Source: AGHT+IHZAZxqzkt43hjIPdmiX16LWtAmIlQjSGTOiM5YyAVZqEoQExXofh761RH379rxPGTtkqw/RA==
X-Received: by 2002:a05:6000:480a:b0:386:1cd3:89fa with SMTP id ffacd0b85a97d-38a221fa8c6mr57479039f8f.33.1736240809665;
        Tue, 07 Jan 2025 01:06:49 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm619089305e9.12.2025.01.07.01.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:49 -0800 (PST)
Message-ID: <74430be84cb49dc0a7413656a2923facc021cd15.camel@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 07 Jan 2025 09:06:48 +0000
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-4-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-4-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010651_799082_39B6E3D1 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Thomas,

Thanks for your patch!

On Thu, 2025-01-02 at 12:15 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> Add the node for the max77759 fuel gauge as a slave of the i2c.
>=20
> The todo is still applicable given there are other slaves on the
> bus (pca9468, other max77759 functions and the max20339 OVP).
>=20
> The fuel gauge has been tested and seems to give coherent results.
> Manual activation of the charger via i2cset shows that the sign of
> the current does indicate charging/discharging status.
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index 387fb779bd29ea3812331a7951f03b181c5fe659..6c83ee6f8a6b0327c576573d0=
3a8d2bcc93f9e16 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -10,6 +10,7 @@
> =C2=A0
> =C2=A0#include <dt-bindings/gpio/gpio.h>
> =C2=A0#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> =C2=A0#include "gs101-pinctrl.h"
> =C2=A0#include "gs101.dtsi"
> =C2=A0
> @@ -90,6 +91,15 @@ eeprom: eeprom@50 {
> =C2=A0&hsi2c_12 {
> =C2=A0	status =3D "okay";
> =C2=A0	/* TODO: add the devices once drivers exist */
> +
> +	fuel-gauge@36 {
> +		compatible =3D "maxim,max77759-fg";
> +		reg =3D <0x36>;
> +		reg-names =3D "m5";
> +		shunt-resistor-micro-ohms =3D <5000>;
> +		interrupt-parent =3D <&gpa9>;
> +		interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +	};

The order of properties within a node should follow
Documentation/devicetree/bindings/dts-coding-style.rst

In particular shunt-resistor-micro-ohms should come last in
this case.

Cheers,
Andre'


