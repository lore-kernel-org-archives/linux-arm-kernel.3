Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E394C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=; b=EP9yMSJ+lKMovfSwoYxrg1f1wZ
	PIjYE97Yy2J4NBhBlSbNnQfbN7RGGtglcaRQcz417aqwP+X4ukoV3ay+z8nOzI+Z7hKrm+4tbAFLh
	fsE6Z8FiMI73c3+RtiB9M3ACQdgA5T5+Mbdb9OiAu+0F5JNBfkf+qec+I8H35ZFlhQn+oPZZYV+7q
	wKZpXCTOX/2XHOiPqWNQrWymub8eOtUD89BBxe3I56MIZbIeov824hfal4HRZx8kuSNMp25VDineb
	mNcaKYCGCNCZQPNEnDsJ/z4mxM/yEyNcCYKotCWHAO9xT4ZTnu40VXCgbFxMMLINbQ9gL2BaectSH
	O68Efftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK079-0000000BRtP-3uu7;
	Tue, 27 May 2025 19:37:31 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK02J-0000000BRCO-11hI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:32:32 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-70a57a8ffc3so32344977b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748374350; x=1748979150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=S4v+Bv9Ssr99MofmwCZ1L2KE9F2hVb5GZJ86nhd0ZE9Op366rrU/tQGo+9181Tn99P
         fre5nZ5GWj8SNbWV4XMaW4SuVJhNBEdXk6Pjcrg6Jb804HjDXVO6HW4kxMcvZXhBoUcL
         AWuU++PFJ8t3baS7OhHJnnD8QFoiSN091lFX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374350; x=1748979150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=FtLBRadG7vTpM3n+uhKqKtzp6hxqin/bPJ/b+0dwgYauGMKNc7UYBH65Bc4+6ebdS3
         d88FgbFZTcuky4a7nOsdrVaYPnfmo/+TOFK622oWuF7UCaks7Kz+6XhTcEaZObg0bFFf
         VGIAEsYK3sG8dYO+xdf/q3Oj0Ynhqe9h5/yIGPsqAoCEW4LaJgHVNbGEStpzY4w9Gj6e
         Mx5YxuKvR7wkOzAYAKCim/1/kQM+8chKGWKicnGB9/bL4eit5piOnc/WKcMuyvATmOhG
         dbtmgXUfJBLptUlvA8W9zMGzpt1n53uhDM90PzXV2r/y1uejgXUb37v2vFsg6hExC6ic
         SBxw==
X-Forwarded-Encrypted: i=1; AJvYcCWsH9gUS6JybTzy0s0hExRLv2PvMlUAF6eNfblYswC5LG2iUl853ZskZDTTG0RdxoEup5mbZAjES9xD0Nl7Mn87@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6RgTHvzuMG5EdQslp8naVH2640TeD1jL5odq5U00P1KLs93DG
	2ozA6Qf6RweumXcdRXAQBRHrZHFqb2QngQtRVx1ODoQGmvv/SOOC0DuyWXRDAgLwjFQ2TM60okM
	baVbR4eOrmPWbD53sGBo5lb5gPGXr/UuShtmUdH+ylA==
X-Gm-Gg: ASbGncsD3Oc7FqsWQiKArMXEOLjUQu+fXo6LqT+FpTUHLC2+WWe6Je1vM5Mlj4On0dK
	OEGdMLCyocmzT0piRyUwPiY7q5umtfTCFJ82v0x+YpTgrUsGlP228WsnlCXBviUIAO30Z0mJR62
	X7gpA1mwYewh2N2c/t/dwTOTS6KbtyxBs=
X-Google-Smtp-Source: AGHT+IHpKdA2pbbNG4OrRbDcCpmkqycRDPThJP4yF+uhXUiU6y0MFBDvKQJkquESUTC+W3my9RdaR3/1y98M7NJ8QHE=
X-Received: by 2002:a05:690c:6083:b0:70e:2355:3fe0 with SMTP id
 00721157ae682-70e2d9daa58mr179805047b3.16.1748374349722; Tue, 27 May 2025
 12:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com> <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
In-Reply-To: <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 May 2025 21:32:18 +0200
X-Gm-Features: AX0GCFvlrZYhHqibbEv_6cXxIS8smjjQnIVNkeTDjWWzyIinppoBbEgrE74Khx0
Message-ID: <CABGWkvpu+quSY1y7u7eXOuiDLz8j2Sgs=sn=muZW80e-vNnHbg@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_123231_298536_417212E8 
X-CRM114-Status: GOOD (  42.44  )
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

On Tue, May 27, 2025 at 8:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/05/2025 17:19, Dario Binacchi wrote:
> > Hello Abel,
> >
> > On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org>=
 wrote:
> >>
> >>
> >> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> >>> This version keeps the version v9 patches that can be merged and
> >>> removes the patches that will need to be modified in case Peng's
> >>> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >>> The idea is to speed up the merging of the patches in the series
> >>> that have already been reviewed and are not dependent on the
> >>> introduction of the assigned-clocks-sscs property, and postpone
> >>> the patches for spread spectrum to a future series once it becomes
> >>> clear what needs to be done.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >
> > I was surprised to see that the series has been removed from linux-next=
.
>
> Did you miss entire email thread explaining why? I think you never
> answered to several emails in this thread... and we - including myself -
> sent them a lot.

I don't think so:

The answers related to the errors encountered during DTC compilation:

https://lore.kernel.org/oe-kbuild-all/CABGWkvp7n=3DOr-OqnLoOJsQQCHF+=3D8eQ9=
EV5=3DO+Qp4sQF49_DbA@mail.gmail.com/
https://lore.kernel.org/all/CABGWkvqfyH=3Ddcuw6EDZaFVVebj8SZhJF0P944+mmzL5Y=
K3-Pug@mail.gmail.com/

The patch to fix the regression reported by Mark Brown:

https://lore.kernel.org/all/20250516134945.14692-1-dario.binacchi@amarulaso=
lutions.com/

Also successfully tested by him.

And when I didn=E2=80=99t reply, I was expecting the maintainers to handle =
it
=E2=80=94 as Peng Fan had requested in version 10:

https://lore.kernel.org/all/20250314093503.GD12210@nxa18884-linux/

I may have made some mistakes, but don't tell me I never replied.

After all, anyone can make mistakes:
https://lore.kernel.org/all/d421a6e8-e72c-48d9-8806-09724723b5d8@kernel.org=
/

Best regards,
Dario

>
> >
> > It=E2=80=99s been 8 months since the first version dated September 28, =
2024.
> > The most critical phase was version 3 -
> > https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@ama=
rulasolutions.com/
> > -
> > where two key issues emerged:
> >
> >  1 The CCM design is flawed because "in the current design, CCM is
> >    taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."
> >
> >  2 A driver for anatop needs to be implemented because "using clocks
> >    to replace fsl,ssc-clocks is possible under CCM mode, but you need
> >    to develop the fsl,imx8mm-anatop clock driver."
> >
> > These development guidelines, agreed upon with Krzysztof and Peng,
> > enabled a coherent implementation of both the DT bindings and the
> > code. The following versions, from v4 to v8, were necessary to
> > review and refine those implementations, bringing us to January 2025.
> >
> > At that point, Peng opened a separate pull request -
> > https://github.com/devicetree-org/dt-schema/pull/154 -
> > for the definition of general-purpose DT bindings for spread spectrum
> > handling, which ended up invalidating mine.
> >
> > While waiting for his pull request to be accepted, I submitted version =
9,
> > trying to at least get the patches for the anatop driver merged,
> > eventually reaching version 12.
> >
> > This final version was merged, but then a few days ago it was dropped.
>
> And explained why. There were bug reports which you completely ignored.
>
> >
> > As it stands now:
> >
> > - We still don=E2=80=99t have proper spread spectrum handling
> > - Peng=E2=80=99s pull request has been stalled since February 20
> > - We don=E2=80=99t have a driver for anatop
> > - The CCM design remains flawed
> > - Not even the first 4 patches of the series were merged =E2=80=94 thes=
e were
> >   simply a replication for i.MX8MM and i.MX8MP of patch
> >   bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
> >   was already merged some time ago.
> >
> > Could you please let me know if you're still interested in this series?
> > If so, could you suggest how to resolve the issues that led you to drop=
 it?
>
>
> You got several replies what is wrong. Can you respond to these instead
> of coming now surprised?
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

