Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC05C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 02:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=; b=3Fb0YlEfw7Szyg2ff7L+oZxKcI
	WnF7Jz9gc8h97vNbkLai4w6q8kEPM/zsUIYio21UqUT5d9vYE1i4yZGcLpQWnms4o+GkbpEHsh++L
	ULeuG9rQ9SfZ2hJmxS5zkrD2rTl6m3XRYFj7zsN681xwANRobXxIvHg2FprJkTSjI+yu609M7NsdY
	AEhEZuu7WeDFx657EGYkKPq7oXDBNBDq2Q4Awt9CFwidyK04fX4Fcf/lsmorYOUIG2wvxGMit4PWB
	yRjdlP845fLlSWQ33j2nN586lge4KtQuUnM3YJg7QkRQwMe0FG2u1KMsYgFnTMqb8dtTDDYGGrL3T
	AmjZUZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbp1-0000000D8Z6-034Y;
	Tue, 11 Aug 2026 02:02:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtboy-0000000D8Yh-1Pz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 02:02:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cfff5f88dbso38770305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 19:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786413747; cv=none;
        d=google.com; s=arc-20260327;
        b=DNRGO2jjCbASjYdYaChWUvMxDVsxnihrfo3etSFwYqe1bEbs5okDq9J1SibXhEQXLL
         iq3Qa+KcOLyiUilNrHwVcPWDtB8hYOrAKJWZv4gBMUWfNZserohysCf+yCVvVEig4sEG
         GRAEwm++YfsbtUbpBi6jInR8tb4BIjbL3crEXsxEjL2MYY+f5+jVSI6NhyPdfYh1eKdL
         Pb/bHRB/6DIX2BOZlgzSpv33y2o6tY07+w4TRaAnl3sjmduywuOKC32cyEYHBPQPYEDT
         KEyCzchB/n0MEyriudwifNByvGgsz2FpN446c0UV0gS4MeIzcv5YtjrzGUSX104FZNxe
         RG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        fh=F1kSw99Ly5VxDYFSYY1I7s4VltETU64EwiJWjr0pEwE=;
        b=sDKJqsanrKcoV0Xd77KFc3EKkfr6rhMSawzqRLzozvUSFwRgg/y9XqDvQBkTR3Kebm
         f1x0HkIZC/FiaIUQ+ev++AoOYC5v+Yw4/GYAYyvLIJTAyOe961YBsYioKWZpFg9dokT2
         536QysLpMCJdaSbPrYvCV8TpqA5x6P3zxGcBVhuQhzvivtqpZxIKQXQ2NXGhGwj9Wl5v
         ycGzD9RH2NZPDYVyioJZo9ze9nonQwyZ4OHZD2Lcm9I5uqlr54B82tLpSHkYCStFnM01
         a3PJmhiyTiQY+ZmVkX1MYNiWsLOTBnipOkAoMCAYMe6o5Uh4pWWqyIjL+utDp08RTNe2
         lAkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786413747; x=1787018547; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        b=F+JLZhhHYbFF9xf3ZpUIeoKJJICne6JwjclaP+JaWIPrYKs7ZAtR4a+/plytxuNUqV
         w2prYmMCivjM5kcd3A1FU4t22MOxLVwcx04d3TNiCVkn3jk9vd5YAtKIyHjaMIrl6WQ0
         mNM9gPLlSOaXUuahRxzrXzWY9ztM+PTZ1rSKQbWVIMaJpar3/ualS50zYpbW4VeEHMgd
         jIaXTsb065WvkIcj4ai5UrctsG4XhWvlGQJggeRNLkjFYa5/yjGvyjTt01hiuphObJoF
         bfzIrffTnMo9TdvxN0LzxtAN317iOi56RQWRPE7/sF1kPR7pJbefLJxZhUBFUUX+nUDg
         Ry4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786413747; x=1787018547;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2ie5zT76vulUOKxlmSFoYHsSNdJQnoxvireTA5JYWQ=;
        b=aju49yqU0ImlG054iSnTltVrZ1kqYRs3Oiihjex+rJ5xeVOp2GVPn2GvsJTuiyXUjK
         lO8TCrrEFJW9+ukln2k+08zw0vAirvpkLzPBejQQDY1/f0P1DQUtvvCPAHlpQvRqUBAJ
         mfvVxWAD2SkeDcfkQY2A6XPgEhQprOJlKQUr9yc0kHpFECoiMsV6eyZCy9bYe+VTiV3S
         xDBHQfa+Bmo5E2oGG7mojxV9vyNeY6erJN4mU855kmYbBFCWTFBQmaiG0EafoK0HFLhm
         TF2W6etnI+gxNebPylDLlVTiPdKz9iIgXNwWsQmwNWk9GTvddD7BvgjiSd3Czu58fYf2
         YTQA==
X-Forwarded-Encrypted: i=1; AHgh+RpzjjzNWbnMa4DfHfC6kb+WRdo3WsUIE24MHesEtuZsjMVjKoEAlAlFf3353w0yjIY1lEDPbdLLj797ZEMoKTIp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Q0mMR3p9jE5AscICE6a8rKXtWu8hxvcDaloYtq5EQYhX+hEt
	9axVi70gq3EjLd9PnCFlHeu5XqR3tr9yMT3RdBWBn8O/SOsDZgfI47ftMjvHekTXtBg6ACdfkdl
	MOhilFw/vKiToWIK32MiQ0cweMREcnZk=
X-Gm-Gg: AR+sD1258qE5M294h9SIEPSBlT+EbpqivZk9cxTus3wtMH1YNFJkkWmCsNZ+pCwIAbT
	JTuDJNSntUsu3XA5PUMfQMgDw2BAKfqFSCYNw4HdF0Ie5B0F34Ra2GfpazrX3zb/uc3MwEYW9rl
	sn4MDpXMbx/Vgy4ZRM1FN8N/PrE6iTEGDfYhXeZtj3RfPAbrmaSCUy9x91QSgdEYAEIcOsad4xQ
	A69CMu4OLtg0LM+6nOhj29ted172RKB7IKmMbdaaWhPi4FxdNAdCALuvloMOhLl9ol86BXdhb43
	I0dq/eK8Rc3Dxt04sl6n8nG7yXk9PlXZ6QPMqRQkpJ96rah5fHHKXIurdesB8kyew8UaPwyr2yh
	eedhwoRPxdkHj3thsStBok8EGDKk/tG8O27seFnI0zf4BsWRY+IKPJePx
X-Received: by 2002:a17:903:3201:b0:2ca:481:de45 with SMTP id
 d9443c01a7336-2d3177d887fmr819395ad.6.1786413746763; Mon, 10 Aug 2026
 19:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260810111841.77898-1-phucduc.bui@gmail.com> <20260810121914.GA2757863@ragnatech.se>
In-Reply-To: <20260810121914.GA2757863@ragnatech.se>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 11 Aug 2026 09:02:15 +0700
X-Gm-Features: AUfX_mx0gm4Mq6CMcIZ_Ee9wYl18KOH9W6eWXEblgpbB3dv-eRX3URinfX2ag78
Message-ID: <CAABR9nFkFyhzQO7UGsaiSDcZ8km9=nv-2+4xWo40EG6c555Lbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_190228_388015_02701F79 
X-CRM114-Status: GOOD (  24.79  )
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

Hi Niklas,

Thank you for your feedback.

> > -     if (rcar_gen3_thermal_request_irqs(priv, pdev))
> > +     ret = rcar_gen3_thermal_request_irqs(priv, pdev);
> > +     if (ret == -ENXIO)
> >               priv->ops.set_trips = NULL;
> > +     else if (ret)
> > +             return ret;
>
> I'm not sure I like this.
>
> The old behavior is that for any reason we can't get the optional IRQ
> the driver still works, but without hardware trip points.
>

Regarding the old behavior, it was handled like this:
------------------------------
irq = platform_get_irq_optional(pdev, i);
        if (irq < 0)
                return irq;
------------------------------
As I understand it, this is essentially the behavior of
platform_get_irq() itself:

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

This could be understood as rcar-gen3 not actually supporting an optional IRQ.
If you still want to keep the old behavior, then I think we should switch to
platform_get_irq() instead of platform_get_irq_optional(), since using
the latter
could give a misleading impression that rcar-gen3 supports an optional IRQ.

Incidentally, I also don't quite understand why rcar-gen2 supports an
optional IRQ
while rcar-gen3 does not. Is there a hardware limitation on rcar-gen3
that requires
the IRQ to be present, or is this just a difference in the driver
implementation?

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_thermal.c#L422

> While the new behavior is that if *something* other then the IRQ not
> being available we fail probe. What is the gain here? What benefit is
> there from the driver not providing thermal readouts if say for example
> getting the optional IRQ would return -EINVAL ?
>

Regarding the benefit of the new behavior:

If rcar-gen3 actually supports an optional IRQ, I think the benefit is
that it reflects
the actual state of the system. It allows the developer to know that
something went
wrong and investigate or fix the underlying issue. In the case of
`-EPROBE_DEFER`,
the benefit is even clearer, as it allows the kernel to defer the
probe and retry it later
when the dependency becomes available.

If we silently ignore the error as we do currently, the driver may
still be able to provide
thermal information as you mentioned. However, can we still guarantee
the correctness
and safety of the system?

Best regards,
Phuc

