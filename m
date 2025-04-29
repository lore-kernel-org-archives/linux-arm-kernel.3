Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CAC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+3XDw0zebRF4K8CmESLbvyPpxu1c3QADWt4g05ubeo=; b=FO6ZVuyFf5meHc
	ixo/rXCJXOlYiQpNETwZfgXqu9hYnAzDAzOXAo+s0EJHmdY5Naw/1UvZvoIpaPA6XdH7+TlnqP0qM
	I/STM9NCDBNGDLB08aKKpo+5k2A9lei8aosb/3/sgHrclpxKZGphnivgj7WX833WAiaFh5JTB5yn4
	z13bzSArbMaJSZoh9pvtDmAP9EW5XOIsBbT+26H6o8AF7LnoWa5IvCNlsC0+vGJRJazJYOMHf5Gn1
	sG2wtR36jyhiNnQJYEYvlPbUF7BG86pmxB0H7ho41n0et/ZvLRKOuwoL5Uqn/nBLlpMNh67Ev6r/k
	XDIweto/0QdXlfr9HtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ncW-0000000AE9e-0vkL;
	Tue, 29 Apr 2025 16:15:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nGl-0000000ABNf-3tiP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=8+3XDw0zebRF4K8CmESLbvyPpxu1c3QADWt4g05ubeo=; b=pMhg52muCiHlrv8i0RCHKIWn4x
	Is+sC4V7UHrvD2Z+Yuq9myYJTTTJPfsNnAOEXKiBUU8SBm8G6HGvySFEEZO+e2J0sON05Aict+vDY
	aQ8LbTU1LUs3M14rbI+pEK/jLJRbEKVrfN4s60TS9DPPOaiXctX3w2E/aZfWXWTKMlnD50FVFz2Cx
	NDKLcHC+Tr/cPHPQ6yJ1UH2K8KAWgrVwu+iPQp2TUDDXBKaZYynuxldniK3ZeFoZT7QqWFXLzeug3
	iHRrspddnMw2tuCTMMjDSSUJPI6DWz3uASwSedxCD2enRGequsvaLKuoMMZQn48xt47CmnMojd3qz
	VPHe4kiQ==;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9nGi-0000000DSYy-1LCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:53:14 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54af20849adso6252428e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941987; x=1746546787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+3XDw0zebRF4K8CmESLbvyPpxu1c3QADWt4g05ubeo=;
        b=lDLtMPXpuueOYa+7sy/Jmu74stycInKnbJeMltFd7NZqs/q1Mvcy9EyLskvLbMf+ff
         fJOK4Qxvk7uL8M3SYtA0dgfRx+JrWRlo543xSk0Keextj1CuJMF0wcfCAlXVECNUkZuS
         MVii81L7sumwe3TABEYM6BEVR+mD4opjL9QZNEu6NSBub4aDFiN8opXSuovM5j219M+G
         4q4TUFwKPXX/L9P4Nmn8CJM6SbW1zF/rgV2v1uQ+e4XW3grvjXLFlXuDJyAzh2dljswg
         D5NRJo8m/AxvNbSKsFyN+/UGEH+edEaqyKPxkT02p1SGVQFUmu3kbj6cdrI/T1fYduUH
         T2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvLy6beQaaijG4kczA/77yyOp4CT7NCe5gYXv+2uLEmSDYhr0izps025b5Xr0QLtXa3FoKl24HJDIMtHVsOmiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyhB1Z1dLCA0zHWkeYU5S3kR5pGHTyCAF5Li2WvqS8YWQNKpQSf
	9UazYK7zVP/t1eumCTVZcrHMg+iogmib76pQu02i6GqG4FemQzKskaa1Ges4
X-Gm-Gg: ASbGncv1PJH6YUpknsylUCTmDbtOjXX6y39uf/CMc1w5rUk2piZ5P4pB0SGhCu2OlLx
	+jafsJsJt7OCNqNzLOsRETphq6uz3OOwQn1Zv8Rd1ZA3+aRgs6DvHAfjqJ33R+mVbEMOkl/Btoy
	AZOxxMFiO1Au+I2jdFBGw2ghGqOo50eqxTjgPdkGs2YCnKJjm/wi85LJfLCofjkprbVuBmsxprq
	mvJ6OE32dZx5IJmo6Fkrqk7a9w22qoG8ozhxKxQSLnYOETOvYUqkSjhwFscMgKnG6Q9cPCa6W5l
	Vmk8IUOf0k32p4FEUjWaY9BY8D5Ex2L7KE3eBbU6iTeAN8ljEgJQVsjkLIxR7gmqAIYMT+aU71R
	849kUKa6j
X-Google-Smtp-Source: AGHT+IFmHyEHPTTm69hqwRcJfAJraB7e+rqDefnwmGcsPPyWtkBj7RDqKYzlE24aOkLSkIe80zrxRw==
X-Received: by 2002:a05:6512:acf:b0:54d:69fd:3598 with SMTP id 2adb3069b0e04-54e9e18fb44mr1259210e87.18.1745941986248;
        Tue, 29 Apr 2025 08:53:06 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e85csm1952099e87.121.2025.04.29.08.53.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:53:05 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso63601731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvsunTeiy1xB++XgBnlxXfqG1pN8AJU243b0rVroDTUX64ShL7cAoizeAzwy1TmfFSB9/eygEnL+gy7SPrZL99@lists.infradead.org
X-Received: by 2002:a05:651c:1546:b0:30b:aaca:9b2e with SMTP id
 38308e7fff4ca-31d4321c950mr11651651fa.0.1745941984684; Tue, 29 Apr 2025
 08:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch> <4645060.LvFx2qVVIh@jernej-laptop>
 <4975791.GXAFRqVoOG@jernej-laptop> <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
In-Reply-To: <2486dae4-c5a5-4df2-8048-87b4b2d46d54@lunn.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 29 Apr 2025 23:52:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
X-Gm-Features: ATxdqUFWPc1KkFXbaozIMU3ylesK6FEAqWczY-QB5FUll7_UlkeMPMrayMJK3Jc
Message-ID: <CAGb2v66dF8hMmjjJMnpVxM+092q=ZYZ+kT316roZuty6i+rcXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_165312_438533_CF9B0C2D 
X-CRM114-Status: GOOD (  21.29  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 29, 2025 at 11:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > I just to be clear, I tested various combinations, including rgmii-id, =
and it
> > didn't work, except rgmii-rxid, which matches strapping. Of course Moto=
rcomm
> > PHY driver took that into account and set registers accordingly.
>
> So we have:
>
> &emac {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ext_rgmii_pins>;
>         phy-mode =3D "rgmii-rxid";
>         phy-handle =3D <&ext_rgmii_phy>;
>         phy-supply =3D <&reg_gmac_3v3>;
>         allwinner,rx-delay-ps =3D <0>;
>         allwinner,tx-delay-ps =3D <700>;
>         status =3D "okay";
> };
>
> and
>
> &mdio {
>         ext_rgmii_phy: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
>
>                 motorcomm,clk-out-frequency-hz =3D <125000000>;
>
>                 reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
>                 reset-assert-us =3D <15000>;
>                 reset-deassert-us =3D <100000>;
>         };
> };
>
> The RX path looks O.K. RGMII-RXID means the PHY should be adding the
> 2ns delay. The allwinner,rx-delay-ps =3D <0> should be redundant, that
> should be the driver default. And there are no properties in the PHY
> node about RX. All good.

The default action when the property is missing is to leave the hardware
settings alone. I admit this doesn't match the bindings.

> TX is the problem. The allwinner,tx-delay-ps =3D <700> causes the MAC to
> add 700ps delay, and 'rgmii-rxid' means the PHY should not add any
> delay. But 700ps is too low. It should be around 2000ps. So something
> else is adding a delay, or the 700ps is not really 700ps.

Anything is possible. As was raised in a previous reply, it's possible
instead of extending the delay range, the decreased the step size and
added more steps. The problem is we don't really know.

> You say the PHY is a YT8531C. These PHYs also accept
> rx-internal-delay-ps and tx-internal-delay-ps properties in their DT
> node.
>
> Try setting 'rgmii-id', allwinner,tx-delay-ps =3D <0>, and both
> rx-internal-delay-ps and tx-internal-delay-ps in the PHY node to 1950.
> If that does not work, try other values in the PHY node.

I don't get why we should ignore the strappings instead of using them
as reference or even truth. If the strappings worked correctly w/ the
generic PHY driver (that doesn't know how to configure the delay mode
on the PHY side), isn't it working as intended?


ChenYu

