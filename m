Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CEEC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=; b=1FmqZRw6xfAPkZTuLI1VQOOFww
	NoODqdU6jspYzlBDE85rEXoWJPDp3oL8VQ7dsJ3owf0g4Qkd601/EulnPrf1OpxTydBcy1bEkg3mv
	l6/BhuM8eBv+FsNyd4N1kX/xKiVkqzODN1f1FFffSs6Tm2sQA8N6YLYtxtn5s3xYLqfKKypb5Kjx0
	I5eGF2yx4BeXrUewD2yRbVKbzJ/QTpXNTVxpEbcVrMMkI7MVcO9k8Kcup46CHifSeHV38qhueN41I
	AslYxYotVtNUFGFBHRvuTo8XYqLBlQLfw+kJhoX1+7NneLYc38grHokjuP2ASp4VgWgPX3CeFYVVf
	yWB25seQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSuC-0000000BKwU-20qm;
	Wed, 22 Jul 2026 09:06:20 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSuA-0000000BKvL-177d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:06:19 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-81ee41aaec1so63937257b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784711177; cv=none;
        d=google.com; s=arc-20260327;
        b=DhAFAoZf1EdAZ8N2jDHC7+U/ipOqetSPrQPb/Ul/bctcOxsK8ns841aMB/8c4P/B+W
         COvDa8PrrIrXEtG8AwULxDGn0COLpmdF7bXJjs98kQNN9eaHln63lDwQqRmcLZo8iyfB
         deIGN+uqFsJH4uB3j6QGjp0zdP6a0ILseuv1LSuEnt05iszs0qhaWflKpI90lkYbNVLf
         yrhrvQA6gxFRmJC1QPLSMtyV/nlWX87mZ2ju+ZsVyzVUOWolw0XCzL6DzHVs8Ysr0ahZ
         mSj8OMA16gmeh+9L4P8mpaxQcWyXABgmLjqpa3AvVr4mF+4UTnm3HvJD32HKVjFvXK8T
         0C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        fh=vHVI+DP0t5xCl/spbWhyeijT46eBukwfsWxvj2Q2RDo=;
        b=iDMFkisyrI8ZjFtqbe/ghbRdiknFJVKCiQt0rzCpSUehMEcBLoJM8Rr4lNn9bMOxlm
         IHwt3UHkZJIhSqKPmPO1Wpp2E2F0ghV9bPA0ThQhd/i9fuO1aenUd3IGaFka2YxTOi9U
         mcpW3MAsS7v57mIG9WiU8oYWJQwCfm/eM9t5KIimrdfz56Sm/S/7vj/dUSat3tnkAR4J
         X9N6Mcrwl9CjLa6ZDUUnST80TIqbWEJrA41M/L++dYZm8GNfh9uzMs5GnkR/lTQnk0KZ
         lI9HdRWIyX9jMFZtlDHQ8qmTlb43AwnUwwFvcjLFF0HTqKSvdmbNYULE2qQNH5iHyDMH
         uXZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784711177; x=1785315977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=DmPbVlCbzcbMkl+ge8OusYFCLCoztYqGQoy+fQ4C+P3LJ3qoCjVMoF1L+O5HJvgnPA
         n9OxKN502zjLruuyM90O2Bf2VhUU123TLcuzgKFnqS3xpa/SlTtzKCP8oGqiO/HS3HIa
         SkTz+2OqJqduumyr/GZL9CxL3tH/2umz5eB1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711177; x=1785315977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=ESLzCfKGOzyzGjR4SN3U3BId40nv0AzZh2Fs5HCb75YBgUpPdIU+BslGZyCQYyCiLt
         c2MIdj47c69W2wla+ULtJBHkZuau+BqwaJ5aOV440llw65e95laS3Ylcx0EOPVictdsi
         apf9ojEHXjOZXDhbikc97awrXdulwaDo3putx7PuESocPbSh1ThM3dCHyK4Xu6y/teUm
         iu87wV6YOAV1/5Gs23xaPIGUlkP+SXjhsWQDg+R57UV23QS9lfcqKEwt90/E54RoPmJd
         Opw12ONbSGVh1sLhqt5kCqUWJTAndNaq70aig8T94lYytEnraIHLYBM9VA07+geYeRBS
         4N+w==
X-Forwarded-Encrypted: i=1; AHgh+RoYgsgwtFMSDLEkBeuI42EI0gL2v4HrmXORvrfH+2No8LUwNGV+yKr8zdCg4WA5/MpmYaSBo54d9wBEWbRh+GOW@lists.infradead.org
X-Gm-Message-State: AOJu0YzjoHOh5vDHsTMIVa2mev/EuCb5Y48aUOrzDqwRagJGCrJ3jl7v
	AKOT/gjSG+tQro23JLSTba222/Q2eb5v3r3qcwWTynEN6Mck98TbUiiLpDr6H+lN4XjELFYCJ2W
	sRRIcUzZcbEBqGXFfvHksHRgPaywB3JbVUqSwx1cryf2OOBwFc1TycA==
X-Gm-Gg: AR+sD13MlZmh5DbYRNMhnfEDxpU63wb/W84wIFwd+vYZSNM0g2HMLGXyieM/OOL0Keo
	ius8caaaTEucuaTw4ORf5IuOfbrVnHBE+c+BxCgDM5iotKx7ITF41PKP5TzFcFPcf3LSuePMqui
	dcOEhilR8ug3bzuqUY1my2jzsgRdk8ufPRcAFqs1G9qJQS9k0oP9fgybmP5x0I/1m35iFwO9+lD
	YfG7NwRpzTQ4vmmH6w7GZO7iTKQ4Lp/qx7hg5RC/iz5d5zUpiuodWUWAKXf/XQK+JprJjBXiDWv
	dh+4gHfCWF4WOT8m
X-Received: by 2002:a05:690c:6c8d:b0:81e:6d03:40cf with SMTP id
 00721157ae682-81ef26ae40bmr73897997b3.54.1784711177267; Wed, 22 Jul 2026
 02:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <al9BwHbG5IX0mIem@ashevche-desk.local>
In-Reply-To: <al9BwHbG5IX0mIem@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:06:06 +0800
X-Gm-Features: AUfX_mw54F9BihKerjVbrM-HX0v6EAfSTuk3G7vvEfoFi_SJki_3pQoN0j1OPTM
Message-ID: <CAGXv+5HXtSovddkws58oUfUcucC3GKqTt-GgvXs27ALFjyFRrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020618_318559_D12A0CCE 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, Jul 21, 2026 at 5:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:15PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
> >
> > In cases where the regulator supply is always on, or has been turned on
> > or left on by another consumer, the driver could shorten the delay or
> > skip it altogether, provided that enough time has already passed since
> > the regulator was _actually_ turned on.
> >
> > Tracking this requires support from the regulator core. Introduce a
> > "last turned on" timestamp field to the regulator device, and "enable
> > and wait" functions to the single and bulk regulator consumer APIs.
> > The existing "enable without wait" functions are then converted to
> > macros that expand to the new functions.
> >
> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> ...
>
> > -/* locks held by regulator_enable() */
> > -static int _regulator_enable(struct regulator *regulator)
> > +/* locks held by regulator_enable_and_wait() */
> > +static int _regulator_enable_and_wait(struct regulator *regulator, uns=
igned int wait_us)
>
> Hmm...
> This comment a bit confusing, perhaps adding some lockdep annotations hel=
p?
>
> ...

It's already there, just outside the diff context, the first line after
the variable declarations:

        lockdep_assert_held_once(&rdev->mutex.base);

> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
>
> This style is discouraged as it makes maintenance harder. Better
>
>                 s64 remaining;
>
>                 remaining =3D ktime_us_delta(end, ktime_get_boottime());
>                 if (remaining > 0)
>                         fsleep(remaining);

Ack. FYI this will be rewritten based on concerns from Sashiko. The
wait will be pushed over to regulator_enable(), i.e. outside the scope
of the lock.

> > +     }
>
> ...
>
> >       /* private: Internal use */
> >       int ret;
> > +     unsigned int wait_us;
>
> If you want to make it more private (the above is only for kernel-doc) ad=
d
> __private annotation that will affect how sparse will check this.

Nice. Will add that.

> ...
>
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> ms or us? Please, double check all units.

Yeah this should be us.


Thanks
ChenYu

