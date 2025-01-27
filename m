Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6B5C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CpuCgUhzlMwquwyxIpORAsFWoq98Sx1RYSATdcpZF8=; b=Ez7XE+zCnqdT1HVlYic6jkGQsb
	qYY/PziVX8C6HBodwgmEJdX2zW7SQ1UAcJ6ViRrJh7UiftNLIU+E2pezQL3BwuQigZpwHIgcI6Q3w
	qp4HFYiAoFI8QEDxp5Oy5AKD8deoLUC6CVLg5dnjjxuqQH/oqZCxtUWIaYBx72m+ENhmjpcJ/mYhl
	Hrz+3l6zDRTI75tfM6A4Rndtt4ZSYAioEyOwoIl1SIosyPVdPQ5dPsom7WJth4BNOJaLHOAV/VN5S
	t71XeCVmjUNUt3ISxaYbo+YYuGm+1OReyCVDRewyDYZmrJEbfMhekuy61sf2anmD9G8j3ZvRwT8kS
	NfRnIF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKcP-00000001u54-0zJq;
	Mon, 27 Jan 2025 08:37:17 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKb6-00000001u0s-2aEw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 08:35:58 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so7233194276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737966955; x=1738571755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CpuCgUhzlMwquwyxIpORAsFWoq98Sx1RYSATdcpZF8=;
        b=jaFsfh4iyGivWYNT/FZ0X1fXXvU+W8c04jl67APOcOmDTbpM8lYLjINGwczAPUWE0z
         UF2PA6WdJabIKM8/x9Y3vcqf9vUk5Aa3EOpvXdB2mSCI+tCnQPNKIDO+Is80nJPdbRoG
         H2yRFmOwCcwm6irUn/HgZtdpcBstoMhZB27Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737966955; x=1738571755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CpuCgUhzlMwquwyxIpORAsFWoq98Sx1RYSATdcpZF8=;
        b=LcjNh9GWedWseCTh7vegJPjsLXgFFzIDM5cN6id/isIqfCCx3M1m0aLN2VUG411rRc
         NTDdRCWvncZzAiSWZTUVOL+sqY0f2icyVVLKYLx+WIX7AHR63vZVAjl6iqkEmDHPU8NI
         wx1+CLghBMYVBnv1TUdUV8TUD2eZP+1UrgpyEDOtXbjupng3LJYRuf05DiI9v2EJXb7s
         1cM1vZaTOIPhija5KVqbwcbdkyDGa1NyYIc0OYEKonQtX6uQiWhjzlHXTGamQGjVJLPw
         nnFpGz5txmgUz0RgKe4lA4YYC03vSmtQfGjuzinGl/OKqO3O9NmtKelXaw/00dYHw6EJ
         C3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWL7d5ELX3S3Jy8GmsVbgghfAnP2zYeSud2u6WFHY88xM+ig3eYHb8uhhmoqaP7M439ATKqBDQ7A5V1OuP3cWkt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9M2H0ZEBsvzlNVIH/iYNg8N/ttLB6BxFnxm3c1MHngosjIyeX
	XXauALuxtMYnphxONLysMwngE98EsK33HFq04PjUVE8jpnMKA4Iq0QTtUjHaqiBb9r7kbBuKziz
	vyg5IK2xwF0ZGUcrOArPfVxzDjrErgxY2bAm8Gi4J/t+Yq4SOMck=
X-Gm-Gg: ASbGncth1hNeAsvxOgHIo4KEgwpcq7evRI+45ySTTkJON/F9QkOq5GE2nI+hGGA1t2b
	o04ci/Eedmepi6SFBzek8T5GBKeOqXa7gzpEJvEAgVHUfis3N+HJ8VHOgA8up
X-Google-Smtp-Source: AGHT+IGHyhUgcceh+vJXcAZjGUchw/OGjVtuboku6Agl5DSUcHsODqJZuXCoUSbUuE0lX16ABYtMxolar2BSkwIN+2o=
X-Received: by 2002:a05:690c:b91:b0:6ec:b74d:a013 with SMTP id
 00721157ae682-6f6eb68959amr300759977b3.19.1737966955422; Mon, 27 Jan 2025
 00:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
 <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org> <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
 <5165cc5e-4ba3-45a8-8bc0-6ff6f379c4af@kernel.org>
In-Reply-To: <5165cc5e-4ba3-45a8-8bc0-6ff6f379c4af@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 Jan 2025 09:35:44 +0100
X-Gm-Features: AWEUYZntrNnNxynYCZOhupOW0McEcrPg1c849eddjMilDJLdiEK_7si4ALRf0LQ
Message-ID: <CABGWkvrUjQPOc+PnpNSp7Ag2HC6DLLAH-fqGdSwUSfo6Z=M+AQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250127_003556_679048_C5AF52D9 
X-CRM114-Status: GOOD (  34.62  )
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

On Mon, Jan 27, 2025 at 9:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/01/2025 08:59, Dario Binacchi wrote:
> > On Mon, Jan 27, 2025 at 8:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 25/01/2025 13:58, Dario Binacchi wrote:
> >>> On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >>>>
> >>>> - Introduce clk_set_spread_spectrum to set the parameters for enabli=
ng
> >>>>   spread spectrum of a clock.
> >>>> - Parse 'assigned-clock-sscs' and configure it by default before usi=
ng the
> >>>>   clock. The pull request for this property is at [1]
> >>>>   This property is parsed before parsing clock rate.
> >>>>
> >>>> - Enable this feature for clk-scmi on i.MX95.
> >>>>   This may not the best, since checking machine compatibles.
> >>>>   I am thinking to provide an API scmi_get_vendor_info, then driver
> >>>>   could use it for OEM stuff, such as
> >>>>   if (scmi_get_vendor_info returns NXP_IMX)
> >>>>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
> >>>>
> >>>
> >>> I wonder if your solution is truly generic or merely a generalization
> >>> of your use case, which seems significantly simpler compared to what
> >>
> >> Please come with specific arguments why this is not generic enough, no=
t
> >> just FUD. Does it fit your case? If not, what would had to be changed?
> >> These are the comments needed to actually work on generic solution.
> >>
> >>> happens on the i.MX8M platform, as discussed in thread
> >>> https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@P=
AXPR04MB8459.eurprd04.prod.outlook.com/,
> >>> or on the STM32F platform, where parameters are not written directly
> >>> to registers but are instead used in calculations involving the
> >>> parent_rate and the PLL divider, for example.
> >>>
> >>> I am the author of the patches that introduced spread spectrum
> >>> management for the AM33x and STM32Fx platforms, as well as the
> >>> series, still pending acceptance, for the i.MX8M.
> >>> From my perspective, this functionality varies significantly
> >>> from platform to platform, with key differences that must be
> >>> considered.
> >>
> >> So what exactly varies? Come with specifics.
> >
> > In all the cases I implemented, I enabled spread spectrum within
> > the set_rate of the clock/PLL in question, as information such as
> > the parent rate or the divisor used was necessary to perform the
> > calculations needed to extract the data for setting the SSCG
> > register bitfields.
> >
> > If I'm not mistaken, I think this is not the case implemented by this
> > series.
>
> It feels like you speak about driver, so I misunderstood the concerns. I
> did not check the drivers at all, so here I do not claim patchsets are
> compatible.

Yes, I commented on the driver.
For the dt-bindings I added a comment in the github PR
https://github.com/devicetree-org/dt-schema/pull/154

Thanks and regards,
Dario

>
> But the binding takes the same values - the main PLL/clock rate.
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

