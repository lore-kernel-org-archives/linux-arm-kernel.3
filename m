Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE44C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+VoyYfMUG+4N9u1dObDfYsaafMFTRcdAzbPiYZN20k=; b=LG8B2OKBMJJL8EiOw8HWDWcgfS
	ol/CKHvebhJ6awwzmGRvrq0IpPI0mEdYvgkRIqCDZvLm4kvEm3JtzMfPPF5ctlbaRXt/89UqqneV5
	BCooD0Xr61v552Ts7VJFUS6l9o7FBNoRAiIAB7REQ1/Inw2mSFcr165CMslxKiTcekjBZbSZSPRhg
	YsNhXX4YxE28UXg+HIZuNynOVU7/Q5tLhghUp7tZT4M1K7ZeORmbvXW2S/AoXbNG8Iz67vRNVQvaW
	zlAlauT6Yd2eA89Fwf9MUJfKsx5O+dX3Gho6ICTvi1EeTr95O0k9dM2e+Qgd+htLfffBRVQZ/20lv
	qORJKm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcK3g-00000001quA-1fVr;
	Mon, 27 Jan 2025 08:01:24 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcK2K-00000001qoX-4Awl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 08:00:02 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so6281028276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737964799; x=1738569599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+VoyYfMUG+4N9u1dObDfYsaafMFTRcdAzbPiYZN20k=;
        b=PWQcsZD25XIlf438woe8eYLzy1hIQLVNNqi/gR1JhhX+QHeNWV/KmM0i5w8eD3BOni
         X4jz/Y3vzriOGqIZ935o9RIrAjNMtO3we3fPPikv62UGkdWlbkb/xnbuOvJhqH+9sjxc
         9amBarCvGo5xF+A4Al62QENam8q1crq357Q/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737964799; x=1738569599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+VoyYfMUG+4N9u1dObDfYsaafMFTRcdAzbPiYZN20k=;
        b=XgxjLY34hRyy9PB63qJ7NhV2pNMeOOucRZrenAxsgRggEJ1LBP2M4ZhL4IyVE3ZwjU
         G/LOO/oM0+3wmEqA1uojkK/0Vse0/dTyGxUm9sCdo6WkX9FgDAeAYNFz5Yn6+NHmiyWS
         usyUXdlu7YfOY5JSXtC6rf+kCDk3VL5x/25VDN5r5q+nrkAB1tY0PC808fVf84JZBxVB
         w7k7+uMSWUjY48eqr5+L2vvlJYrJ9NuQZoMjpTb06atF2J0lbac2MPLdAR0qH9IqyGSz
         uYmtPX0e+9KhRPBTEdNohKJvF9+W5uPVvAd0IzyVhipkvhUglzb6lvaerze0bH7SC7XX
         byZg==
X-Forwarded-Encrypted: i=1; AJvYcCX87gBooWU+1etDpcoY5z8J9JSKYJYTQwiAJg8hxMKZt7kKtf8bwTcRxgZ2gsU6Lsvctcpo4HA1flfZivM+4d84@lists.infradead.org
X-Gm-Message-State: AOJu0YyU37wpImQs3ytQXmfU8QAr/IiYHZswAfBXQZt+7BrCmYXGOVa6
	Sf0vZGZDELzesJhaB2GA4lq28piGc7gHSD3jrIUhPN8uUyEbvKJMA5pFAWq/DirF1IaLgLr5sA9
	+w4pqDKaXmL/tlk9iYC6lYUvhARXb6OvWjWCyww==
X-Gm-Gg: ASbGncucJlKhWfHBZGnTpWWpw9b/OpaFWorXn0U/v75GKXu9l9WRO8aourQk1o/W6fb
	BUdiWh9jEspFeq0QTQOFFdHbMKThCFypa0e2QSaBw2fWSHNPTCVpqWybrNq0P
X-Google-Smtp-Source: AGHT+IFX3AyS24bKYvvxXCujrzZUbEJvGk+kAmVE1IyqOCZgAHd9qOkJvg0QvUvcRnKZzmt22xUGs+LmO83I6nmj5A0=
X-Received: by 2002:a05:690c:b99:b0:6ef:761e:cfc with SMTP id
 00721157ae682-6f6eb90b207mr296554447b3.25.1737964799325; Sun, 26 Jan 2025
 23:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
 <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org>
In-Reply-To: <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 Jan 2025 08:59:48 +0100
X-Gm-Features: AWEUYZkHJy82sfoPRSJ6UWwyoDs8ApP5Odlncth0pfXUuoFeCY-aQph_yq9FoZI
Message-ID: <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_000001_055952_65B99BB3 
X-CRM114-Status: GOOD (  31.10  )
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

On Mon, Jan 27, 2025 at 8:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 25/01/2025 13:58, Dario Binacchi wrote:
> > On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nx=
p.com> wrote:
> >>
> >> - Introduce clk_set_spread_spectrum to set the parameters for enabling
> >>   spread spectrum of a clock.
> >> - Parse 'assigned-clock-sscs' and configure it by default before using=
 the
> >>   clock. The pull request for this property is at [1]
> >>   This property is parsed before parsing clock rate.
> >>
> >> - Enable this feature for clk-scmi on i.MX95.
> >>   This may not the best, since checking machine compatibles.
> >>   I am thinking to provide an API scmi_get_vendor_info, then driver
> >>   could use it for OEM stuff, such as
> >>   if (scmi_get_vendor_info returns NXP_IMX)
> >>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
> >>
> >
> > I wonder if your solution is truly generic or merely a generalization
> > of your use case, which seems significantly simpler compared to what
>
> Please come with specific arguments why this is not generic enough, not
> just FUD. Does it fit your case? If not, what would had to be changed?
> These are the comments needed to actually work on generic solution.
>
> > happens on the i.MX8M platform, as discussed in thread
> > https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAX=
PR04MB8459.eurprd04.prod.outlook.com/,
> > or on the STM32F platform, where parameters are not written directly
> > to registers but are instead used in calculations involving the
> > parent_rate and the PLL divider, for example.
> >
> > I am the author of the patches that introduced spread spectrum
> > management for the AM33x and STM32Fx platforms, as well as the
> > series, still pending acceptance, for the i.MX8M.
> > From my perspective, this functionality varies significantly
> > from platform to platform, with key differences that must be
> > considered.
>
> So what exactly varies? Come with specifics.

In all the cases I implemented, I enabled spread spectrum within
the set_rate of the clock/PLL in question, as information such as
the parent rate or the divisor used was necessary to perform the
calculations needed to extract the data for setting the SSCG
register bitfields.

If I'm not mistaken, I think this is not the case implemented by this
series.

Thanks and regards,
Dario

> To me look addressing exactly the same.
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

