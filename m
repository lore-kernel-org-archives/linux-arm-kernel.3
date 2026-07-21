Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6090C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=; b=PV2YLN95TLe5bdKo2LCfwebLZe
	kNY3D7B/5M6cQ/LaJT9axy1xr/FYX/sbnFbvabus6hHaahJWOByizPmYfY0jDIynRkoG0DvhfcLOg
	Zg4KxqHVk/O3q9KkUQkt41knVUK6lG/psRVTRpnMAF3JqIdBRz9AcEKGYSvT8gW3kKp07O+usOIzt
	VP3ZqKH8GLTkr+ASkzIncJhi5QH5fDRq5gFNEMYynzpSiUS+xo8REUQrmImz8W9lMZBiwqZKBgdkl
	lV0hKIdmKFHJZljoBr8ZG9pNnF3U8tk8uEeM7DyYsTD4Xi4IJsJMxdlrH91pNwIT2YeWygQqSERMZ
	SSi0Bxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5kB-00000008o6X-1oCV;
	Tue, 21 Jul 2026 08:22:27 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5k4-00000008o4b-0JI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:22:21 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-81e8fa1b8d6so112132957b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784622139; cv=none;
        d=google.com; s=arc-20260327;
        b=IXgc6DMOX9kVmlg5UcF5AwFfEAqIcknBDzOlhX8F2+5gassN+PjJwyyWA5sh3ZDxh6
         my6WxASXvr1FjPBAR+dQL1bdq5HByl3+PcWA2l+4x/p3zZlnGnVrsnThLy5lrMQJHSur
         iKGXiaWN31pR5c46h8agMe9iKcHJFHh2Ft2UgZ7IeiCLbZ8zvXuHrlvZbrfdGJFOfnRh
         pTgnTCfDSZcwMNH99FonpHOo0WpWm+vLospCO14rkqZ8+Nt2QdwWHl3dOUf9hEbkgZ3s
         CbyMZfXsAvq1TBp1l8V7V1EFz050Q/L9FfVJPcrHu+KrmacRgJPvgpJDHlG/rubeuVad
         M5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        fh=bqp4WzUfUY9RDeWItq0cA1bRs5Ai9wCSaD3UxOtNRVU=;
        b=FlV9Ski1HDT2v7MO+MpvItf+2e3pijVA91rq5x+pCuc4wbmKwgH+1084PDBj4LRZQg
         +NPvUxp9AlAq/cCg+g9CbqZ8+L3nHrpOol6O30eJBO19hnPhAuW0vWuTxqj2L38OgdeH
         xNAYr7ADGudrYKVe5Xugv9riADsN5L/+4kYqqibDa9re59jgWZC4+iVvGbYoqiYN0wkn
         VIjMpOCK9IUwllNCWeV6fHRlLIySydrbkpzbNKhvc04uWNiftdxcVyeLFxp8oeifEe+2
         f2uWafVCC6G/a7JxzQ1QbimZEG/S5VnRC35W3Z480wCL0hSPc5IKFYBDEjYQoDnuux+x
         mxmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784622139; x=1785226939; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=gBhSiQPGAXf/RILi3RQMdNdQO2S59nmpU66EphBylSX9Nw1YzzpC5DU5uPyPSqfjuz
         YOnHLH3BpGhCHMxdyOmIGcGsIZhTbv/wlZgaT63ghiKCyUvANXBTZJ04Ey+xsaMuT+/W
         J52rrjqo3D8uQ5TZfkPTmYOIIfM5sMoY8dNgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622139; x=1785226939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYMCpupp8yQkTntIzJ+s6xUACTMSRm9maqPbU9ARNc0=;
        b=B/hPBAfFfSD2udXEtK2cIV5qyE/5amA6i1DjZaYsYsjAjxQegzY2FL5DOu35qWk/KI
         g9a/f7FLw3jEzE71KA5/VtxjNvjaqWYw6XxK+jQ8ixj6wKAE/jM9ro0OvO6WKh7kvKvc
         p6SZcn0CS/ttCxhKOQ/0ZlSljM26rCD4HxVwWkxx1ZRvasVhSIda6MWIjIwfN1ZMhTKL
         /VAr7ao8cfgY1iZP2aIo+D9MZqo8C9UhjawBoeU5OdA6JpTjVV904NFe+ei/yMqIP/5c
         tccQ39SiWxhIFSMR6uqUREiks5xYOX7+OumHAGasHLx8d5mp0rXlr6dbchbMHF+FfXf+
         rANA==
X-Forwarded-Encrypted: i=1; AHgh+RqRbgvE26q4cYKBN2YEvRjnKHHsGcoJqyqTLNwG9zPbBTImhxjcZdkLAmPhsH63yPiMQOKsRS9jGQh4E8ZQixOc@lists.infradead.org
X-Gm-Message-State: AOJu0YyF4dti/YWh1U3/4z5DABMSxo92bzHwReHBim2PAksLHkmOpeKd
	V19ik90m6DK7khmKCv9997H8c01eqfT1djNbwBIBf9zE50LRcej2DCFytZ2JcfO2NDoYb45y3iN
	uq7uTsKAGzT1WOC/VYnxNvaVcGJ9g0SPVqW1GdRhMcbBHnLR5vYJCLw==
X-Gm-Gg: AR+sD13lWn4NkEFXRJzGoq8JAedkSbZUOvQ0xPKrhdw6aJJvg4c5q9IjOGhIXAhnV1z
	cHAFiQwV0cwPGq7a1j8MPGum+tPnbX3DZS/LtcDyE+l+UDuVe2vPWyVzsnX1wDHC44ItQaLR6YT
	s/IeDB33mhbu3ZQJFgG68YVrtBr8PhW1OVYcF2Qv6hbOdadPYXlr+fBhGyYnmOo6U70oCcUsECh
	mfIXYXyQQDUDkemTpfhACWXKYhpdwgaqBZcLoFi2DAowIhuVpiaM99Q4ye07iJYB6FT6+bNWlr1
	fr8M3V2OcAtMGLZWoJ3pmIvjjw==
X-Received: by 2002:a05:690c:7342:b0:81d:cc00:cb8e with SMTP id
 00721157ae682-81ef27f1cbfmr54139227b3.37.1784622138845; Tue, 21 Jul 2026
 01:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <20260721080829.4153C1F000E9@smtp.kernel.org>
In-Reply-To: <20260721080829.4153C1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 16:22:08 +0800
X-Gm-Features: AUfX_mxfs-owsFVntpy2TfnfT2PivUx0k_MVeEmOEDZDOObrM7yQy9fA6FUILhA
Message-ID: <CAGXv+5ECnGRwdqRLQG6EQ_bqaezYCrMkczn=MP=wXfLhG3Sh=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: conor+dt@kernel.org, dmitry.torokhov@gmail.com, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_012220_155953_2EF43D5C 
X-CRM114-Status: GOOD (  30.44  )
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

On Tue, Jul 21, 2026 at 4:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The prototype for `regulator_enable_and_wait` in `consumer.h` in=
correctly names the delay parameter `ms` instead of `wait_us`, inviting dev=
elopers to pass millisecond values that will be incorrectly interpreted as =
microseconds.
> - [High] Sleeping for the consumer delay while holding the recursive `ww_=
mutex` for the regulator and its entire parent supply chain severely degrad=
es concurrency, blocking shared regulators and serializing async bulk enabl=
ement.
> --
>
> --- Patch [1]: [PATCH v3 1/9] regulator: core: Add "enable and wait" func=
tions ---
> commit 73793dc0bdc3050ff22074a860d438d5d9cc0b49
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> regulator: core: Add "enable and wait" functions
>
> This commit introduces new "enable and wait" functions to the regulator c=
ore,
> allowing consumers to ensure a minimum amount of time has passed since a
> regulator was actually turned on. It adds a last_on timestamp to the
> regulator device and updates single and bulk enable APIs to accept a wait=
 time.
>
> > diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> > index 1797929dfe566..d14ce86d8f7bb 100644
> > --- a/drivers/regulator/core.c
> > +++ b/drivers/regulator/core.c
>
> [ ... ]
>
> > @@ -3159,13 +3162,24 @@ static int _regulator_enable(struct regulator *=
regulator)
> >               } else if (ret < 0) {
> >                       rdev_err(rdev, "is_enabled() failed: %pe\n", ERR_=
PTR(ret));
> >                       goto err_consumer_disable;
> > +             } else {
> > +                     /* regulator already enabled somehow, but timesta=
mp might be invalid */
> > +                     if (!rdev->last_on)
> > +                             rdev->last_on =3D ktime_get_boottime();
> >               }
> > -             /* Fallthrough on positive return values - already enable=
d */
> >       }
> >
> >       if (regulator->enable_count =3D=3D 1)
> >               rdev->use_count++;
> >
> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
> > +     }
> > +
>
> [Severity: High]
> Does sleeping here while holding the recursive ww_mutex for the regulator=
 and
> its parent supply chain cause concurrency issues?
>
> Since regulator_enable_and_wait() acquires these locks via
> regulator_lock_dependent() before calling _regulator_enable_and_wait(), t=
his
> sleep happens while the locks are held.
>
> In cases like regulator_bulk_enable_and_wait() where async workers are cr=
eated
> to enable regulators in parallel, won't this serialize the wait times for=
 any
> consumers sharing a parent supply, defeating the purpose of the async des=
ign?

I suppose the fsleep() needs to be moved outside the lock region.

So instead of changing _regulator_enable(), make it return the last_on
timestamp, and then act on it in regulator_enable_and_wait() after the
lock is released.

> >       return 0;
> >
> >  err_consumer_disable:
>
> [ ... ]
>
> > diff --git a/include/linux/regulator/consumer.h b/include/linux/regulat=
or/consumer.h
> > index 56fe2693d9b22..a69157c9b5b51 100644
> > --- a/include/linux/regulator/consumer.h
> > +++ b/include/linux/regulator/consumer.h
>
> [ ... ]
>
> > @@ -192,7 +193,7 @@ int devm_regulator_bulk_register_supply_alias(struc=
t device *dev,
> >                                             int num_id);
> >
> >  /* regulator output control and status */
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> [Severity: High]
> Could the naming of this parameter cause consumers to inadvertently pass
> millisecond values that get interpreted as microseconds?

Yes I missed this part when I changed the API to use microseconds
instead of milliseconds. Will fix in the next version.


ChenYu

> The prototype here defines the parameter as ms, but the implementation an=
d
> the parameter passed to ktime_add_us() inside _regulator_enable_and_wait(=
)
> treat it strictly as microseconds.
>
> If a driver developer passes 10 expecting a 10-millisecond delay based on=
 this
> header, the core will interpret it as 10 microseconds. Could this lead to
> hardware initialization failures due to premature access to unstable powe=
r
> supplies?
>
> >  int regulator_disable(struct regulator *regulator);
> >  int regulator_force_disable(struct regulator *regulator);
> >  int regulator_is_enabled(struct regulator *regulator);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721075226.23=
47933-1-wenst@chromium.org?part=3D1

