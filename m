Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA04CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XEIlIk/bq6b/zmhQ7TTZFJvpGHTSwiqbqeiQPXe6GA=; b=IYiQYQX8LMP/tYfj3a5YyYBYXk
	l2tf9+cTYVkhADLicejq9hRDxkkvDJTGxmd9QPYQrKmu4As8rDrBRXilUyW9/5lbUXEgC6ITnq5X9
	X3eYjye+llhvEyMT5AOxoDINcmaBusDBUkaPus0Jai4T0FkiTvbGCaLmS6xna7x7s8oLHOzLdz2eU
	UTgqpzdMM+GTOwM85UMl/kR7u2QyYyxwOtwd3moSR0YaEO8CJqob3mvEnw9FAHXAQW+rhl/vG2Wu9
	F8VeBVnxgSOPsYg8mTbnKpWaTemmGyAFtd5BwvwUKSNZQ8KU+OiX1NF8cPPQ1qI2XFvUfT0xxleGE
	Mh5SOvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneF-00000003y6n-1uqv;
	Fri, 29 Aug 2025 01:11:23 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjxI-00000003KBg-1Zmx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 21:14:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so1398385e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415687; x=1757020487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XEIlIk/bq6b/zmhQ7TTZFJvpGHTSwiqbqeiQPXe6GA=;
        b=Rw/U+URHcglUnQwrXgR9LbEwCjDd1qZQDhWtre1CGL3Ah1Vx2D6focYIOnh23kd2bW
         L9peePYyiEqCig0kI71xfE5uDZQU9/x9m+HQgJVhencBTkNM0W424DHv4VhhactvAL+8
         +vr3EgAYOw4Lfn8P8ZXfJnBpGzOLaDMRP1N56Lr1s4x/4ygplqTepl33oOwXkTQKl4vJ
         Sj4igTtaG9Y0lTwUTCR4MK/Mv5dj0ckFSMpnEU9cVN8v248JCeF7AhqYT1IUqpuEi2iH
         u915zPME/b5l59pOKkcSUht0YnldM4nyB/s2AeKX4/mxqMR47PmZFYYN/bOd+fS6E0R2
         sXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415687; x=1757020487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XEIlIk/bq6b/zmhQ7TTZFJvpGHTSwiqbqeiQPXe6GA=;
        b=uIErKSfFzrErv+KpcXtaywauzBHk88y16MiV7t0CkPi/X33aJZLQy98PlVaZJbcPpj
         z7hoFGYXBRQp9ZvMkcVK/601Zj3NC5KKUkNqrRcdzFaWyQjkTXzZ2nzIt64yFdLwmIX2
         p4OWyQY8R8D66rKUdXyd6ppe2Tqnje/WLLtqFZEpDyg/S/2WLH0823+BJTPIuZJDNY6s
         eo7fZXJ3/nz0ROHzf4aRsHkRstOTPXtMrhriyQ/u3n4wfUzYg1C8LBuFf0oUx9IRwkR+
         jtm7oe9/UTYn9+qoaZAGrWL6gD7As6pULmDXZT79p6//0JfBXgR/JCR3rowY1oqIKQtG
         UT5w==
X-Forwarded-Encrypted: i=1; AJvYcCUO2GemC8cE8fSc7/HpC7tq3ti7bEcGslZiVT7EpF3th6s8WulLD2ixqv7Vaxl/aTcmFQaXkmNXYaMJTWkhBuXs@lists.infradead.org
X-Gm-Message-State: AOJu0YxwaK7eJt5pvzYbtSpMpT+QII0lwShZrgVdez97EPPLE/7gLRE6
	4uPBIO1U9z+n8QSGu8WNGnPER81qdCHi0rsnyWs5lmZPOHG7dFJCO5+N/ndAsumCeJj7GSSJA2K
	1EM3bu6ieTT+dSGwceHLGGSNwjB/lKAHy48tXbT9tpw==
X-Gm-Gg: ASbGncuUXm8mo9l0QufkvuAVAVDprQqxRYpI0klv2d/15vDIA+S4oIkT7/O/pN6CLEg
	8XX42iEmar7QxhNJ/jf1v/3nUQ6glAEiiz0Prx6ZrqIpakfB9g5Ox440GrqAIGdF1xcJtSiNCuE
	SnlKDPmpNyTf6++ZFyQYt2XkMk6RZeSvhLP34ZWo30hE8THmtKbJNuOZQCCZGMqQ5c5b43QhJDD
	nNoL3Q=
X-Google-Smtp-Source: AGHT+IHnq5j9y/e9zgOn/W95LXDrsMaMJHjfFJrVjLLZ4xyDUaX1ZKKyMsyBeP8R0VmL3N5ZRmoTyZaiETxJgA8aygo=
X-Received: by 2002:a05:6512:1409:b0:55b:8aa7:4c1e with SMTP id
 2adb3069b0e04-55f64e2a401mr574939e87.53.1756415686593; Thu, 28 Aug 2025
 14:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:14:35 +0200
X-Gm-Features: Ac12FXx3Zu25fmAofOtWqFPELRy7r2mWX-Zguu16p7nw27EDWZqR7HdQtxpXOKE
Message-ID: <CACRpkdYdzsVTtwsw813k0gbD-H7ue8iCNXOdWD8feJCSWZnSdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_141448_421392_318BC9AE 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

(...)
> +static bool brcmstb_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
> +                                        unsigned int selector)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return pc->func_gpio =3D=3D selector;
> +}
> +
> +static const struct pinmux_ops brcmstb_pmx_ops =3D {
> +       .free =3D brcmstb_pmx_free,
> +       .get_functions_count =3D brcmstb_pmx_get_functions_count,
> +       .get_function_name =3D brcmstb_pmx_get_function_name,
> +       .get_function_groups =3D brcmstb_pmx_get_function_groups,
> +       .set_mux =3D brcmstb_pmx_set,
> +       .gpio_request_enable =3D brcmstb_pmx_gpio_request_enable,
> +       .gpio_disable_free =3D brcmstb_pmx_gpio_disable_free,
> +       .function_is_gpio =3D brcmstb_pmx_function_is_gpio,
> +       .strict =3D true,

Oh! It's now using .function_is_gpio() and can be charmingly
strict!

Better let Bartosz have a look at this and ACK it, I will merge
his GPIO function awareness patches first.

Yours,
Linus Walleij

