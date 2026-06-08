Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DB2CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=; b=RV22WSmcLQEEUMxQK6vAOXb4Hx
	SfqiK7tUNBuj9b19nPWuxbHXFxFsp0+4PxjW/7sc2a8QoIsnNG9i5A3AQ3nwdd5tLzBHx8Ku5EB1V
	kj8y+6k62HcufiuzDBeiw8+oUwnlg88RVgjaUY5JQFqkrLOqn+O/3EZP59aBFQvQhTxgTkxyqy+pt
	V7B7VMREgFlVwbUF/5bfx9CRTlioZW/tfhqcyDejIxLLooEgzqTo/aq0jTyHA0U/FYdibT7lQoNVk
	MmBd0sSQ8WrKqVne3FvoTha/UknSA+QvbkkvtobW310H2tnixV/BLG/PQWQIzzBm8zY3lhwCm0XVl
	pG6z/Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWW0A-000000039JD-3jOV;
	Mon, 08 Jun 2026 09:10:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWW08-000000039Ip-32PE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:10:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so4379309e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909830; cv=none;
        d=google.com; s=arc-20240605;
        b=DP3nB15zDrIEJC/ruHvln3d0G+eF+/WHAokr0JWERELMjVp8wZtas6qHTT9C36WkiO
         ct+8bSiJM7L83K67MRpTk1jXOLUvqfnuNTOhzor1K6/nhkAl2mpzwBVcUhD5OFuJfI6y
         gqlGLJPyin/Q+59UhnjWG7NcpcSkrepOdMMHsgUy9llI2Va5pvysJou/iEZ50VvsMtAw
         gBagdT/tV+FxmvDZ8MwjPCToN96OCiAFyStK9QTyiNvER5PEMzHPOPfV1Mv9QBb2wUUl
         lVIcaJVS3co97zKnuOeaSuySR+FnofrK4GwgIP2hH19nX0JgW9BPYD7tFEwUqUfazGvr
         IPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        fh=0BXxRNHXjZMCdLVdLTXN6uY3UsN6+6eS4pYansQMTzI=;
        b=Ime1EGk2kIGjP7PSAWmcy/TNC0bp63boaM67tqusRrR0rbJYrKegZhz/M9cJQx89JC
         VkjBDEqTRtql7vIvhotUwMAnXc1kMi3azTi68k9akjkwiLpBGGbKKq6FAT5lVfiCbSlT
         H91bIvTzo9N4X31/1aKKWSIkv8/6irqB6VxYawe5Ky42lItxnwNNmRq/+oUbwIe/uCtW
         YCoJl+vNNuQlPMXT7PgiwLTQ47gRKZDuV6E5q4LZ+cJLTDpxI++L6v5Yl1VCbrlfJxT0
         fjcjHH/OvkHwPZqY08s+A+/yJnYrLFC678gpf0aJhgwlEigcu6o5HtKbQ9S5f+aN0sd1
         66JA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909830; x=1781514630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=ZwgJWE5N6Ear4K0nIu0A4az2yT2JhjnNcRxPRT2jZFKPA8Jrru0nSO5oupNO6Q+s/6
         ev4T0cCd8UhNxQ/EAsYUwluomHP7l3gAw7QjAaTZe7K7H37uC+hntPiOAkR1vdrnH5Eq
         qa31ee0pgR3tpAZ9UIh21reBzWO51RufmlyowxsYDSw89uwJOepLoW0OyAtv4IWQdpZc
         Ts7XYQ6kufdDX4iDgpUQoV0HBhuYEaS8qDzsU1D4ruX3PL639Sy4gNL/i8Jf31rzdaHE
         3X2xnEmHCmPbNLSeXpGyEtoB8ySLTP4Qrgzmc70+bQLUd3feOvElKDwsOGP4Ja8IUNwF
         y4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909830; x=1781514630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=UrLjr6S76ZtP8xD1ZsKc9jVVgKRzvllmnrbbIQISRFkNPT0lm1yc4NNaLC+0F93yGr
         LDLdM75T5dIWdBodcfnEi+aDyEhWjvAU24pXA/sC60nhbT6SovW/X8yBsaZyGhvGZFIB
         gbrRt8j/6Pka6BwVCq7XZarzwWK3HCw0kSU6GHZBYWjSt5cmX/+Up9aOO+QCsaZAxQ6R
         DmtRjIvnWg+a1wAtorIhwHFc6RXvWa2Syy5oZm+r9KdxF23aTJjr55jJRweTKbCX7XKK
         XvGBXE6TT5VG9r2WRe6GJZIuVCfqedtzIqTR8PPGBEpMhLf1ybF1OYO4+4Zz3ItdWwaI
         gytQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZUgSbsgh3mVGZJnUL1pZ0xoDqqCQD4yppMe6hG27QC7HniTDWCytUuW08GweR6irzE52f5/nzTqsbbHRZnf9m@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14guKhh4HM7zki700KRDCHkZaBET7vD63L/7ylG2q5poZzqkm
	QqpfRQt4Pdeyr5+QJW2xIedGuWvijz7pqVk1IvE6oL3OeJbJizgPHaf/VRW4t9blpgjek4m/El9
	LPacXS1TunL/oHzMJUbojkLcfHObWl+I=
X-Gm-Gg: Acq92OEudsNf5KcgKdXxFqhNUUn3rhoUuIDGRWfxWrx/c3Xuq6DpIRfj2XQ4xVflqNv
	Fu3CL5X3aCf1D+8kQUuBYeleQXshr1k4W3WuhdRyX/dj2qtVrXj95bQypNwb6Bb+D3qHlrUI4dB
	ofjf+n5v4e2vMTT8qrj7YlsJd2hW2Ta3naKIUVtP9t5icvsXXAqVcbUtNi1pl43X/WcSNW+S5qk
	fgMntlMElMxLN7q6JRiUIQmSZ/0tQVnA+R1Bdw7xMuS+x8ViwOlKRdzqZMxshGLz3/YJp2tK5cY
	x0cmcYb1u0fqkM6JJPpiYUGs2bjGDNmxHyh5wMvENFwY4N+1RK28tDHTsDAZljDQTbX9cB9pFKQ
	Sp/nrtQg=
X-Received: by 2002:a05:6512:1116:b0:5aa:6c66:e343 with SMTP id
 2adb3069b0e04-5aa87bc93bcmr3927231e87.38.1780909829307; Mon, 08 Jun 2026
 02:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 8 Jun 2026 14:39:52 +0530
X-Gm-Features: AVVi8CcpFt73_s1W6tVAYjL6KIr_ANTO2-Kr_9uq4rs-k3XfwDZkGI2c1mIcJWo
Message-ID: <CAMB+xkZm-FA_hmnAYRnXw6T4tZvVtamM=kmEyatFKZWV0+kJFA@mail.gmail.com>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abel Vesa <abelvesa@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_021032_819012_83164639 
X-CRM114-Status: GOOD (  37.55  )
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

On Mon, Jun 8, 2026 at 1:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, Jun 05, 2026 at 05:41:05PM +0530, Piyush Patle wrote:
> > Hi Marek, Liu Ying,
>
> Hi,

Hi Ying,
Thanks for the detailed update.

>
> >
> > I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI =
on
> > LVDS ch1). It mostly works, but I ran into a few issues around DI routi=
ng,
> > LVDS format handling, and DC enable sequencing which needed rework befo=
re
> > HDMI would come up reliably on the board.
> >
> > I don't see a v2 of the series and things seem to have been quiet since
> > November. Are you planning to post an updated version?
>
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline=
,
> before adding i.MX95 display controller support.
>
> Unfortunately, it seems that Marek is not a big fan of [1] and I'm busy
> with downstream development so the plan doesn't move forward well.  I sti=
ll
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.
>
> >
> > I've accumulated a fair amount of rework while getting this running on =
the
> > FRDM. If you're not planning a v2, I can clean things up and send one b=
ased
> > on the current series.
>
> I still think that i.MX95 display controller driver should be in a separa=
te
> driver, rather than sharing the same driver with i.MX8QXP display control=
ler
> like this patch series does, because the two display controllers are quit=
e
> different as I mentioned in comments on this patch series and in discussi=
on
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
>
I agree with your direction. A separate i.MX95 DC driver with the common pi=
eces
factored into a shared helper library seems like a better long-term
approach than
extending the i.MX8QXP driver, given how different the two controllers are.

> >
> > Thanks,
> > Piyush
>
> [1] lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.c=
om/
>
I've had the current series running on the i.MX95 15x15 FRDM (IT6263
LVDS-to-HDMI
on LVDS channel 1). HDMI now comes up reliably and remains stable. The mode
and timing are correct (1280x720@60), the LVDS/LDB pixel clock is at
74.25 MHz in
single-link mode, and the DC plane is scanning out a linear XRGB8888
buffer correctly

The one issue I'm still chasing is color. Timing and sync look
correct, but the colors on
screen are wrong. I've ruled out a few obvious causes and see the same
result with a
simple CPU-generated test pattern, so it doesn't appear to be GPU or
Mesa related.
I'm currently narrowing the root cause and will report back once I find it.

While bringing the series up on the FRDM, I ended up reworking three main a=
reas:
- DI routing (display interface selection and pixel-link to LVDS channel wi=
ring)
- LVDS bus-format handling
- DC enable sequencing

I have time available to help move this forward. I'm happy to continue
testing on the
FRDM and provide feedback on the reworks I've made.

On the other hand, if additional help would be useful, I'd be
interested in working on the
separate i.MX95 driver under your guidance and posting the resulting
series for review.
If that sounds reasonable, I'd be glad to coordinate with you on how
you'd like the work
structured.

I'll also take a look at the prefetch engine series! Thanks again.

> --
> Regards,
> Liu Ying

Thanks,
Piyush

