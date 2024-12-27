Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C38E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccPDTR1kHMs0ixCcKLLJ1/w1S1Oal78+tTjwCwFAdq8=; b=Ml2QOeNjeIdemnRt8BPdDjdrvh
	hoVczDWgjU9bkLBpmGuNyIJY+WFDzFd2SVWUvVdAWmrXhO/viLSM1VW4dxoDexHQrLtsODU2iK0jg
	QGM6QdaU70dTvNF3uNt8hWlJNnQ2SrxZtYKEgcUm9QQ+ifvAMDftrhnEkTarWx3hNLCTFSaIvJxyN
	6CE/pP8QlHwfaKNA99Vsgrwv+VAcwTH7vX3kdYlM2Ny2CtzSlzqb6obwI2qnjkkY060/G9VOfeWob
	lhXGtoPTo/jeehFDCDxnh4wR2vAtnYEcLTY2vvicl478jlVa2eWBuSf7qiPYIfakmEoLbBU6dVuHF
	HTmISdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHTt-00000000vqM-2rGn;
	Fri, 27 Dec 2024 21:02:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHSg-00000000vkL-0egV;
	Fri, 27 Dec 2024 21:01:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2164b1f05caso92267635ad.3;
        Fri, 27 Dec 2024 13:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735333293; x=1735938093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccPDTR1kHMs0ixCcKLLJ1/w1S1Oal78+tTjwCwFAdq8=;
        b=mK5kJkpw/MIkPKapJXmxfIIGT2OuAznd5Y8ihYV0lU+MHvRDnL7MfKn3YMkzFZntE5
         CyBqk5OTIR250bLIdRsvDfWhXYNzwj4CN7W2bV+kcnw5ibpyLrsVUlUluBW6kgIXM3o5
         yCqliqOEi6KVKPsYC3R6Qya7GCBmXbGOXCnTbHewEFimjALhAhJKc4XlJLdiN0QLWRFQ
         aKd3R47GRW0YFuMt8jLn7jCdoRUzJMMjKi82CxgOPHbQaRCcYPRU5SyJNl+7lD8iskDX
         hwrMO6skl3m9cIkLpXrWTGyx6QTExmktRrOw72Yu+3ssKPhAb9XiENkmKuEbY5tg25DA
         jqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735333293; x=1735938093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccPDTR1kHMs0ixCcKLLJ1/w1S1Oal78+tTjwCwFAdq8=;
        b=WD1LdRbVWrjcjlqPOnvrxjwEegjcZCV8plVj0K94mVF0XkSoolGv21MEBBbaMDsDjp
         3+gu4egjPKPC1+uvrsw0T5HXcE2SRN1RyCZ81InftF+NY/rkn9iPMB8xqQcWWVE+9Rxk
         OJIfPi+OEQxaXyB00rAW2QVMFsKWu1qzFWILVVbeLQbmJbqgsUV5oHIibc+QYvUOP5iJ
         n9ZeZmxlpaWuhgsZH4kqK2xNUulFg5ntTf7hmVXgl2sUdyzfWNGTAHahF3Pb0MMjikTs
         1SZVIHb6NeA4+DefPMq/L/l/iffK/4Obl6kHzDVixu+tIrhn2fw2jeNdodwTjxgYPDOC
         OI4w==
X-Forwarded-Encrypted: i=1; AJvYcCV8NQLNnoOv/+zP9DKixtuhuL1VZvAERpM4Yy5CKfn7OnfvtYA0kJDYog1d0MKqKDyqrNjSo3dnvo2MHmE3fcghPg==@lists.infradead.org, AJvYcCVCfROYm9+VE99soBzSiXFBlsBTVpjnqd27GTM0+5mZWzNy7N3JExl2bsKYrHQv9b0JRNUuc5xUwIZX4zLt@lists.infradead.org
X-Gm-Message-State: AOJu0YyH1K8itzaVmQSCfOcUzhPrpLKHh+eUwQFNKVHWL5q0APg7Z8Ud
	oIpx3nyz4XGATgnL2yhA/699b4fJK82Zzhk1qjZ0J16LO17piun0p7jts/EKS+0BQNu/dgAyJpv
	0zudFXZhUYgGonw6KeZTEjmBr1A0=
X-Gm-Gg: ASbGncuZ8Y7zZ8URszZC07HFGNXtJBPJqwK1MAEtsy/0b0bPEYtLObjBSOd/jc6BzSQ
	gCXKaScag3Sr5bBoiZNi8oBxFbjAvRdNFpUtAYFQOWw577pWQy4UEgiiyYkg6BCNjuQJSEgI=
X-Google-Smtp-Source: AGHT+IFXhi2DQ7mJawkzYDVUQ79N9lFaQ4i/jdWv6y5dstNfwoHp4E/xc57Uivp1rDsBDUSLHiKLwHYiM7t/X0LXeqM=
X-Received: by 2002:a17:902:dad1:b0:216:725c:a137 with SMTP id
 d9443c01a7336-219e6ebc7dfmr327512225ad.28.1735333292761; Fri, 27 Dec 2024
 13:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com> <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
 <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
In-Reply-To: <CACRpkdbd5HFzRhoC7qRAb-Kd89fa9sX67aqK9AAMoif3nw9qbQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2024 22:01:21 +0100
Message-ID: <CAFBinCAP_ohHiUEv_r+mEMVBz_XDNdAjw0FjeUhwPY_U1KiXuw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Huqiang Qin <huqiang.qin@amlogic.com>, 
	Qianggui Song <qianggui.song@amlogic.com>, Hyeonki Hong <hhk7734@gmail.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_130134_221854_C8511042 
X-CRM114-Status: GOOD (  37.79  )
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

Hi Linus,

On Fri, Dec 27, 2024 at 6:19=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Newcomers, latest patch set:
> https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42a6=
7b76@amlogic.com/
>
> I included some of the prior meson authors on the to line to see if
> their mail addresses still work and if they have some feedback on this.
>
> On Sun, Dec 22, 2024 at 10:08=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
>
> > > > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> > > >    so we keep this sorted by actual vendor, sunxi is apparently
> > > >    yours (AMlogic:s) isn't it?
> > >
> > > It isn't. Sunxi is Allwinner SoCs.
> >
> > My apologies. I mixed it up completely. :(
>
> But wait a minute. I see there is meson. And in the "meson" subdirectory
> there is stuff named "amlogic" ...
Until some point Amlogic had all of their SoCs named meson along with
a suffix which identifies the silicon die (for example: Amlogic
Meson8, Amlogic Meson GXM, ...).
The "meson" name was dropped at some point. Taking the example from
this series, the SoC name is: Amlogic A4 (which would have been called
Amlogic Meson A4 previously).

[...]
> > What do you think of the idea of a separate drivers/pinctrl/amlogic dir=
ectory
> > though? I think there are already quite a few amlogic SoCs that need
> > to be supported and more will come.
>
> So what about renaming the existing subdir "meson" to "amlogic"
> and put the driver there.
That will make it consistent with other Amlogic related directories
within the Linux kernel:
$ find {arch,drivers} -type d -name "amlogic"
arch/arm64/boot/dts/amlogic
arch/arm/boot/dts/amlogic
drivers/soc/amlogic
drivers/phy/amlogic
drivers/pmdomain/amlogic
drivers/reset/amlogic
drivers/media/platform/amlogic
drivers/crypto/amlogic
drivers/perf/amlogic

> Also I want to know if this driver and hardware shares anything with
> the existing drivers in that directory. It sometimes happen that
> developers start something from scratch despite the existence of
> prior art simply because of organizational issues, and we don't want
> that kind of situation to leak over to the kernel.
I will summarize the situation in my own words. If there are any
inconsistencies then I'm asking others (Xianwei, Rob, Neil, ...) to
point them out and correct me.

Initially Xianwei started adding support for the Amlogic A4 SoC in June: [0=
]
In this initial series he re-used all the support code from
drivers/pinctrl/meson (the new A4 SoC driver simply selected
PINCTRL_MESON_AXG_PMX).
This means that we have two gpio-cells:
- the first is a number which identifies the pin/pad (which included
the bank and pin/pad within that bank as a consecutive numbering
starting at 0)
- the GPIO flags

Up until v4 of that series [1] the driver side was pretty much the
same as it was in v1.
However, even with v1 there sparked some feedback on the dt-bindings.

With v5 of that series [2] Xianwei changed the dt-binding (based on
the input from the DT maintainers) to take the GPIO to take three
gpio-cells:
- first the GPIO bank number
- then the pin/pad within that bank
- the GPIO flags

An overview of the changes up until this point can be found in the
cover-letter of v6 of that series: [3]

With the current series Xianwei started over, with a new driver (v1:
[4] - and Linus, you have linked to v2 yourself: [5]) so it fits (to
what I understand is) the desired dt-bindings.
The main difference to the "old" dt-bindings is that driver changes
are not needed to add or fix pin muxes (old binding: .dts only had
references to pin groups and pin functions, the mapping to register
bits happened within the driver - new binding: all pin muxing
registers and bits are described in .dts).
The "old" approach is more similar to what Allwinner SoC
drivers/dt-bindings use whereas the "new" approach is more similar to
what Rockchip SoC drivers/dt-bindings use.

To put it into other words: the new driver (from this series) is a new
dt-binding to hardware translation layer. The hardware side matches
what we already have in
drivers/pinctrl/meson/{pinctrl-meson.c,pinctrl-meson-axg-pmx.c} but
the dt-binding side is completely different.

Generally I expect the new driver to be backwards compatible to all
SoCs that used the old dt-binding and the PINCTRL_MESON_AXG_PMX
sub-driver in drivers/pinctrl/meson/
Those are:
$ git grep -l '&meson_axg_pmx_ops' drivers/pinctrl/meson/
drivers/pinctrl/meson/pinctrl-amlogic-c3.c
drivers/pinctrl/meson/pinctrl-amlogic-t7.c
drivers/pinctrl/meson/pinctrl-meson-a1.c
drivers/pinctrl/meson/pinctrl-meson-axg.c
drivers/pinctrl/meson/pinctrl-meson-g12a.c
drivers/pinctrl/meson/pinctrl-meson-s4.c

(That said, I am not aware of any plans to migrate these SoCs over)

So to conclude: This whole series is not about a new pinmux controller
IP but a new dt-binding for the existing IP.
In the old series (v1 at [0] - which shows that the underlying pinmux
IP has not changed since the AXG generation) Xianwei tried to add
support for the new SoC with the dt-binding that other Amlogic SoCs
are already using - but this got rejected by the DT maintainers.


Best regards,
Martin


[0] https://lore.kernel.org/all/20240611-a4_pinctrl-v1-2-dc487b1977b3@amlog=
ic.com/
[1] https://lore.kernel.org/all/20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlog=
ic.com/
[2] https://lore.kernel.org/all/20241112-a4_pinctrl-v5-0-3460ce10c480@amlog=
ic.com/
[3] https://lore.kernel.org/all/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlog=
ic.com/
[4] https://lore.kernel.org/all/20241211-amlogic-pinctrl-v1-0-410727335119@=
amlogic.com/
[5] https://lore.kernel.org/linux-gpio/20241226-amlogic-pinctrl-v2-0-cdae42=
a67b76@amlogic.com/

