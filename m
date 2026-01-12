Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D81CF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldGPuGZG523RSoakys4MiKPAfsrjJwPEUi50RijOKj4=; b=iUwcabTTObaTVRjNYPgCuVoOck
	FDD8ewZyXo2OBEXtIAAMEpghH3Rf/8uQmmjnqGp8n6EsOSpAeYATnUyNFJtjWRFxZydLu+qhsYFQb
	lNazLacpA4RsFFY8VwmEFoo6qoPc3BY/QTkKTUPWZtzNG1ZSJNIAXjfXTmru+Dyv0NEUodLPXOHG3
	UeJ5vv7pvSZHnitiZsG8URSjgWyWSmS+ZdY30wgwz6zGNMHHpaC5g1xVrYwA9En1tFvzVwMDeduna
	dEB1h/zeP/lYBtn4D9osuzNKmuZGyRveoWN/IORTR/r6UoIsb7IKS5P57RiTcxqx0bwXde4+MUEBw
	4tgCF3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPHd-00000006Cea-3Pcr;
	Mon, 12 Jan 2026 21:17:05 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPHa-00000006Cdc-2cJl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:17:04 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-11f3e3f0cacso8615438c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 13:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768252619; x=1768857419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldGPuGZG523RSoakys4MiKPAfsrjJwPEUi50RijOKj4=;
        b=dsYd3euzULENcewSCW3SkCEj4SNctrV0hAxx0/XfQ4wJLK4EexmtDOCDmpyiUQvwqa
         keoIUjixNXAFWvnRXvNtQotGKvaRMHz2fE/JKXgpNHWVx5JzalM1VwzzaG6z8z3lCZ0i
         c/Ksaxs5vcc2dW8plVxKyq0agzb8OQ2pdJekN/nhLloQ3z6+GKZCaQPHEA89LQEHt6gd
         B2e/SrBzkwTEvlKyhzZisHlcfTetQHwzj9LPbKNjKC4mJFUK4Mn0dbN+lpcI/v9exfge
         JKGbw/wdlgmkO+n7W6p3CCNHjQ2E8U7NDt6ba248+IRBbZgYAbuKpp98XOm+T0dMGpws
         JvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768252619; x=1768857419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ldGPuGZG523RSoakys4MiKPAfsrjJwPEUi50RijOKj4=;
        b=onizW4mgMe/PY5gyo3WZp32Mp0xAeW/teUymJMbEBeJeeno/9rYnMzu3ytBObf6zln
         qVJIMb8rWZZ9ZlGQ5YL64VuakYwdosF8LS+Hnj3sbAWF1KFdZuXynJwrgZLtw18yn2+/
         cHzuG9VPIfIrE2mDNLYc3fmIhBFPbX+LUV2WLGm7+uM25kWWynTBICHZsBEnTOdbTe7b
         cousH6tUTzU8P53IaHp9iHyBNf9+J0USC9CvAsJNzKHjEYvF0shkcPC2M4hzoV6vgX61
         IEB6eQhQFFWcA+blC5QZWlhpU6X+M4oLk3v9yMb590wfh5QFtKHMqcKZ3rcD7QLSF49p
         ZB7g==
X-Forwarded-Encrypted: i=1; AJvYcCUl4j7MK0wOEjWzVL0T+2nwo/HFo2PChptWu3I3CXWifUk/ZWYEOGNKwwUlRMpnV8mnfQHdrPkrrPoPJPlehskj@lists.infradead.org
X-Gm-Message-State: AOJu0YzdtHEuSV9hAkj4dCWFmN0CHEJ4ZLyAjh/KPb0q0xQhifyc/Ggz
	b70tI8hvW+s0ObBH9grK7Vn9XtG9BfTa71ZVIraD+AszL5Dpj2c1eBIB4PTUutxAjlg2lxHvw6n
	lO5tOcxTPoeBsDUHCOHrTQxsCNjhFk84=
X-Gm-Gg: AY/fxX54a1XehFAZzAYinRA7ux2CUb9IraJIqsCJNk4/Efls0CJnoiPhtjKK1BYZne9
	cwLOv/dZtqy60+QHO3S3vU2kPDTExsdjPsB2Np9ttuQcW6aKccLssx+93WXqOydB0+PaUcEnTPw
	8wQJJLorbQL3vEouKwZFrKkd629kGFS5GGW3It+6spiUIGjdopyb7FkIihYdfaBzlilOJ2low5D
	O/E2U9QzITYBHPJhiRSXyQpvzgmF+dtq7V7cmNl5Ons7+Ml4NlPf5eQesUOI4Yl1dWttLK/D6Xt
	qli/YP65
X-Google-Smtp-Source: AGHT+IEOZLPJwj/S58CaKJrV3wQ5O6ZbtxN7uz0O09Ew9vCMcJuDYyeoj1bB1o5HdriBJYahGUi2SE9K8dooarY3xtM=
X-Received: by 2002:a05:7022:670f:b0:122:1e3:534c with SMTP id
 a92af1059eb24-12201e35454mr14780318c88.46.1768252619049; Mon, 12 Jan 2026
 13:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-3-anirudhsriniv@gmail.com> <20260112-upbeat-gay-chachalaca-ecb74c@quoll>
In-Reply-To: <20260112-upbeat-gay-chachalaca-ecb74c@quoll>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 12 Jan 2026 15:16:47 -0600
X-Gm-Features: AZwV_QiIk_am64aGoJ59TKkJjjSWuft6c_UwxN_mAcvJf8KPJOFciUjwqcXNWP8
Message-ID: <CAJ13v3TqhKyT62NZFRz0dP0tov=q8fz99X_HgrJnwkd6Y5nEig@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_131702_727968_801676AF 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Krzysztof,

On Mon, Jan 12, 2026 at 5:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-fault {
> > +                     gpios =3D <&gpio1 ASPEED_GPIO(C, 5) GPIO_ACTIVE_H=
IGH>;
> > +                     panic-indicator;
> > +                     default-state =3D "off";
>
> Missing color and function. Or at least label.

I will add this.

>
> > +             };
> > +
> > +             led-heartbeat {
> > +                     gpios =3D <&gpio0 ASPEED_GPIO(A, 7) GPIO_ACTIVE_L=
OW>;
> > +                     linux,default-trigger =3D "timer";
> > +             };
> > +
>
> Drop redundant blank lines.
>
> > +&mac2 {
> > +     status =3D "okay";
> > +
> > +     /* Bootloader sets up the MAC to insert delay */
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&ethphy2>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> > +};
> > +
> > +
>
> Like this as well. It's a sign of sloppy coding.

Will remove

>
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             status =3D "okay";
> > +             m25p,fast-read;
> > +             label =3D "bmc";
> > +             spi-max-frequency =3D <50000000>;
> > +#include "openbmc-flash-layout-64.dtsi"
> > +     };
> > +};
>
> Best regards,
> Krzysztof
>

--=20
Regards
Anirudh Srinivasan

