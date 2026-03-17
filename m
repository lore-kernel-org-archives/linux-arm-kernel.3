Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD3F3380E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=; b=YgD+1bBP1aHV6DO2qBlaeuvDSM
	kVm4YFHCMt0AIjKzgN4GD7jXwC62OIx6QTJjhliftTTgMnHycKHDnv2fAJJlwf9Pieoiau6sKSJ7L
	Fg9NWtVpvoscPntruUS4CteMYwklUwEdW35O6/SV5ThjK/82B0AeiYZUxW8M4iGIB2z7/mhr1Qh8x
	xClHo7HQe2/AKammuk/juFr197Ve8Z9Gwi9mNe3KWd/uEUTsVpZX5+iDPJ1SM1m3rjIGwiq34SEAy
	NjtVbEp0mn2kcH0ESOawPWbTS0J75i8WV41dYqBKmxJdA76dhos8K7AnEVyKNtRRSiiY18uXaKWW1
	WXAvTXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PfC-00000005ic1-1RI9;
	Tue, 17 Mar 2026 08:20:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PfA-00000005iaL-17Yf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=; b=fWPlN3J6JJooiYgOFrNTaM5tQ3
	qo6uvNN/PbOovsIsMwurUorQIINsdZeu5P8hq3HRgDXA3pb3GXN6RrdqxzhdxvQmSi8KnTuse0Tbn
	y5jF2Jh3vKfWDLdNgk2klAbKzkkuEAXh85kRYg/hzyzi0kd+TlPL6tzCHwmCWEMnJk5j+VDfReWuO
	zo0L0iY+9viR4bKldiolLucaqtCNWa3xm6Qhknfpes4z4njPZ11mk4kKa19UzDscP8avhx0VXyYTC
	L1z/VJIWxdaTS6HC08Qgqjj2UL2DNRmOjlyKQgCUlcUTWFxHMprZNE2GgA9T15Mlj2/DPISfyagqH
	PItU9fMA==;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Pf6-00000008O0Z-0nAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:20:26 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffc8987050so3499244137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735622; x=1774340422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MZrBOzWKX3a3J3HCcGoedqBZCxLLoAjByNA5cYsB/Y=;
        b=PZZgLsYC4rT6XBHIL9mQyrV/U1xDxLMQ6pYrxWhQCqs6oaSrqfu1prfz4BYxDnaQ4q
         vs5qAWOZoH/dxZrwC4/kDsMxfbZf8K47kgSMNi8yGswMIabHTPRfFrurm/1P20eWdC+W
         +uSfBQ7nSpiFw7oOoU2O7RfdngmyGefdj6AKqRXNRmC0qmZRNTOw0WentbMUjlbHqbg6
         zad7WwP/3CGEfrEvGJyQyOrLbjQGRfJP0mFv4enx9NANML1USeH+4GWGcMYALx5xz8VG
         YN+BTbqu1nzXbJHcJMe55oPtVrE+FUhQhQikfwOCXJM9UZesiBQbnSlihyOdjo7rzpaJ
         DAyw==
X-Forwarded-Encrypted: i=1; AJvYcCUg5bgl/ZGLgKpHFc3f9vtZSQGCKecLYsjSCRJxSsZiDssNZzwx7B1aU2/OORK5Bt8yuxmi/ZXIAyn6B6WwPHln@lists.infradead.org
X-Gm-Message-State: AOJu0YzbMJpFxp0nQa1jOELE3aV6IGkWL4gin0DDwkwQZiMPE1aT4nZJ
	lWjMzxDuAurBHyDZlFAO5vVzJr4dut4PEMTgpc/6zqhzBMM4Lw+b+t20V34uAXUl
X-Gm-Gg: ATEYQzzuJhp9BVW4ar3S6hZQzsJgtJHbOhdlRquqr/42Ptjd/zmjTO7KE168Mxyl2q4
	t3BWTrLnX3auo0vY9xiqVaGtBxLOqmcPpkTmLIXhIFZ+FiRQnPP8QIip2mMFHSG5wmM9/U91fTK
	Clx/kqueChV86HXWEKZmwaHXHjiAxUx4/ZylA5ibDlZz2xJ1MVAjcsUABMpFVcAtcjHgj1iGShc
	2ZrOULtqXlWsj63kilfEAlvAyEc2BYzKbS8Yd3NuMpJ60R+R2BmXcfp9WzjrVGmbIdPcjVNN3Mj
	Gt72cKVu18YFi4VeE9UNXrtq6gx9tUquOOcgVqZLRysN+EV3SnOWhAh1jBBQ15IYZUtWLVqX+Uq
	+ULD1K2V9LHwMzPf8BKsy+yd/u9IS67qE2QfLCixCTybmVGQLwVhPfCZpPuIRDiP/yfxGqPwniE
	YQmVC2oAhvQQcX/PBmWxq8017i3K+8XFVeWu0xV3OFFRcsSCZO35yzR+Sw386p
X-Received: by 2002:a05:6102:6ce:b0:5fd:a537:a777 with SMTP id ada2fe7eead31-6020e1e37b7mr7366114137.10.1773735621902;
        Tue, 17 Mar 2026 01:20:21 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfedb663sm7060855241.9.2026.03.17.01.20.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:20:20 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso2934517137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuezW6RUx4eeNyJdIc/+gY1c0cSjSu0uxqyCNbjwmcMvzc4dnkIXeVKk8GNMKSw8aCdtEC4cbEI0vOxpHov3X3@lists.infradead.org
X-Received: by 2002:a05:6102:442b:b0:5ff:cc82:744b with SMTP id
 ada2fe7eead31-6020e4b8061mr7168193137.19.1773735619991; Tue, 17 Mar 2026
 01:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:20:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
X-Gm-Features: AaiRm51yyOA7w0a8XkB8aVbP3N6VXftKc6GGkOKP6ReYYiu4pm3s3wiL1ZOxXBM
Message-ID: <CAMuHMdXMdn4Uu+bLunb0g68rmV=AT523C1=sMdNFK47ZADU09g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082024_432274_1C106A68 
X-CRM114-Status: GOOD (  30.88  )
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

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 2-6.
>
> A further bigger optimization suggested in a past series [2] by Etienne
> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the
> functionalities already provided by SCMI iterators, though.
>
> Patch 7-12 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to only retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 13 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc3.
> Tested on JUNO and an emulated environment.
>
> Beside addressing a few review comments, in V2:
>
>  - patch [1/13] introduces a fix for the pre-existing rounding algorithm,
>    before relocating the algorithm logic as alreday done in V1.
>  - patch [8/13] hardens clock protocol initialization by adding some
>    missing retval checks

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.

As upstream does not support SCMI on R-Car X5H yet, I am ignoring
the hardening for now (it may be fixed by a quirk), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

