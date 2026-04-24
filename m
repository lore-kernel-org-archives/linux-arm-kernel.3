Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A897FB44C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/Pf7FKJvV5p6OiWqf5fVKF7/RdrgTzsTTFg4r2irt0=; b=QVtkeVGGX+/kx4qnlF5CgRmvCU
	Gkau3lSzBI3+epn0APDewNNrHX0lC9+b3qPQlRRet6FxoGp6WDQqWTk5uSrWHI/6jHmUhPxE4aNZC
	dbuclQ64fzXwfkwXkLlr3IIZ+PRt424aEVzOb0b23YSWPFmSjA3W5fJ1P8zrzGvE1lH4hhZ2HoOR4
	7zxa9q5x4a3bGYgghAx/nVEhT6/U5ry9dVzGHy5yuQN+o20VJkRxqlQHfNzQ1ANNvLmgU2uCfahd1
	v/4zhv6MJNJUn6gn8JA0VamO3+EwvS7t1rxP3tqGJw/OFon1sEhjVXh4QoIQpgwcEj8wUJtW5I2kP
	ExHK3rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBSk-0000000Cq5n-3bIT;
	Fri, 24 Apr 2026 08:00:34 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBSd-0000000Cq5F-0Ax0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:00:33 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-651bf695701so6036575d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777017625; cv=none;
        d=google.com; s=arc-20240605;
        b=knuS4rRtLtPc+DgNs0PgJyRcMcgeqZ8ewk9xsp7qW6ktzr3NH7VXqOv76LAXIPXkJ+
         E/aVUj1Lauy1SlAVTWNamm9AvKOlOHmJ6QaJUHi86ovsrOPEmZ6XDx7e636+Bvthfb1z
         otE1NZVGDmQR6mXGaYNwkx755dTP3/JL+AsnhcpOec4eVpi0ABko5Crn2OVy+/eZOonp
         2L8VEIra7TVdD6TOAZfPcAW7A22tGB3ZWfZLv0VazBxK1M7jCOcNw8Db2Ni4dh66dWJe
         m2QRKgGDY6s7o4fdHxp4L7cQ7R107Lrt8xGQVxydmPp1G2SulufMxmIiY4jal4914wkw
         3AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7/Pf7FKJvV5p6OiWqf5fVKF7/RdrgTzsTTFg4r2irt0=;
        fh=YR3OM3RJgsaa7O/IcRpni0po/hanD8s5pznkAuE8PdI=;
        b=hvoL32p2llQrCFkU0nhgp66O7AfFSoZLDekNbauylqGRmgCWbbIzEpdk1H4GSvVvu7
         IJnevYqX0D7FJvsWTsFf/xG4WUYGYuyzY3FjbCr1ku9AmygGMimllVejjTXy0Tdln6q1
         1Uoswu8w4i1XxoNnYSVQ57P+ZuP4T6ynYgLkzCFIRGJIFhspcQ1J3e4oOUGrGoJD/efp
         TmXbcA2eOtS9S5PS+COQC37216AYgITJo+X679ouHARFP95THP4Jj7wVt9ldAyu6mc08
         9Om/tZkx9yYhNDOhwcpxzVXIWoyetVbMClsRsfe13449qglEyk2geE7lgoW9T4WrVJAO
         bTDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017625; x=1777622425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/Pf7FKJvV5p6OiWqf5fVKF7/RdrgTzsTTFg4r2irt0=;
        b=b1qmnVRqZdLyWlhZ+1O03SbqmCqWgPvrBZZUTLzJLwp1Thl0O7kpJ8BAYzKTEwLFoT
         q4bBiifFEslBqPmdWFmP86ToBtXiOBoyDdUHg3CI7Ioxi+aTykba/KZXUprMiomwtlSW
         yNRvRM2pZDJiR2iZ+y6ZmzYo4nZom0vuW7D7GrhniA5/HFRRowtHV6VRdbvkZo+gJ8y8
         Bbuayx2FVYqpkwyWuZ3CzOzHKgb79jCA4P4jvK7GOa8LuyP/KB//XqMg5avTKif3Xerd
         wmYEUQPFps5QxVqt608bk1NbUH7LUHWJtPzi0gMfdCyVbamu31a1ej1aZ/iBIDD7sejW
         JYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017625; x=1777622425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/Pf7FKJvV5p6OiWqf5fVKF7/RdrgTzsTTFg4r2irt0=;
        b=aLuBL+3do0t5bfXMoarzSh0kCTtuuUAqsbOMP0h9GLDra1E1p/Bm5KIN5yXHBEaiZc
         /AQg1u0j+3dod3dBOG6Hz40GSWmuP1FTuEKY4o7u3uZEX5V7CYCOX7mjEu3GFt3Mz6jd
         BYWEcmjd8HnEn7DOFORXoTweT+u7kcBb5qVBLj/Nwv49IusBTz1k3+QsI/mbDi/2lQd1
         noD23swHrm5BgZv1nd1c05feVANIPpQN+cjkQV9agJftuRVEpkpA3ORu5FLpZD4/W4gx
         7MBgZ0SVDBfyN6CNQk1IbHGAI/i/65NH24vvDbyPtFBJieqtz2SfsFGTc+xH6h2eL19E
         sXow==
X-Forwarded-Encrypted: i=1; AFNElJ+u4nPaZ+Ku/el0LajGzYWG5kYo0/BfGNcMCg12D0O2lg5RN1p35Gt3dOPnJ0bjYRI7xznAdiHVvmZYTrmX88VB@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3t/LQHeu3JLskC5CB3M1HZ2asBJKGQqzRlysgo7+zxZkx5Qc
	Ydnwh4DGci8TfhUv0A8Mg40qKQB3BBVDZFVL8z2Qvo9xYrrnutuBmuPvSbjpyYJXowLElZpZOj5
	S/BuF4R8HE/YecR+Srv4hNGOr3z3V0eU=
X-Gm-Gg: AeBDietfDYpv+Kd2y63mBZPT+1qrvnbeiIw/rZzfE0B+tXn3S7Noed2BqadFSddSla1
	IFO+aEzV+xDFgfnKcccJ5yL+i46KbDo4rKN+PfjNqRRsJpf+7j9jCQeOmlwhr/eFAH+1gBUtOrk
	IVkgGccg4uhllVGk5Kg6gsPeaVAXxEqJk3ZkF7tArx7aebwXxsUa6hYPTYW7ijFbVzPcUIZbpEP
	xuHrVOMobnS4suNEcfHKDj5im5puS4eUmOocI1yatC2nTY5/2scAiMow9ZAM41wlRSgPh9biFk6
	9VHyR7WUwz0yF7mhhuT0
X-Received: by 2002:a05:690e:d42:b0:64e:e896:a7c with SMTP id
 956f58d0204a3-65310acebf1mr26232243d50.55.1777017624640; Fri, 24 Apr 2026
 01:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260413154727.3051321-1-lgs201920130244@gmail.com>
 <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com>
 <aa801626-2e33-489a-931f-600540fe4ae3@roeck-us.net> <CAD++jLkv=5rJhGv6t9H-oP9k5MY8s-fH1=gHVC88ctbiaMPC7A@mail.gmail.com>
In-Reply-To: <CAD++jLkv=5rJhGv6t9H-oP9k5MY8s-fH1=gHVC88ctbiaMPC7A@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:00:10 +0800
X-Gm-Features: AQROBzCp7GbvsKNqFEL0lZZwrTRJ-dOMRbt04jshHAKKnM3_ynbfvbbhROtoI7c
Message-ID: <CANUHTR8SLnhQ_Yx2tXbDcrZfDSXP+dRnNVhq1WbWJuUDvVhPxQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ixp4xx: fix reference leak on
 platform_device_register() failure
To: Linus Walleij <linusw@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Imre Kaloz <kaloz@openwrt.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_010027_093716_511E42E2 
X-CRM114-Status: GOOD (  29.03  )
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

Hi Linus, Guenter,

Thanks for reviewing and discussing this.

On Mon, 20 Apr 2026 at 05:34, Linus Walleij <linusw@kernel.org> wrote:
>
> On Sun, Apr 19, 2026 at 11:08=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > On 4/19/26 13:22, Linus Walleij wrote:
>
> > > Hi Guangshuo,
> > >
> > > thanks for your patch!
> > >
> > > On Mon, Apr 13, 2026 at 5:47=E2=80=AFPM Guangshuo Li <lgs201920130244=
@gmail.com> wrote:
> > >
> > >> ixp4xx_timer_probe() directly returns the result of
> > >> platform_device_register(&ixp4xx_watchdog_device). When registration
> > >> fails, the embedded struct device in ixp4xx_watchdog_device has alre=
ady
> > >> been initialized by device_initialize(), but the failure path does n=
ot
> > >> drop the device reference, leading to a reference leak.
> > > (...)
> > >
> > >> -       return platform_device_register(&ixp4xx_watchdog_device);
> > >> +       ret =3D platform_device_register(&ixp4xx_watchdog_device);
> > >> +       if (ret)
> > >> +               platform_device_put(&ixp4xx_watchdog_device);
> > >
> > > If the problem in the description is indeed there, it seems the bug
> > > is inside platform_device_register(), surely a function returning an
> > > error code is supposed to clean up any resources it takes before
> > > returning an error. It seems wrong to try to fix this in all the
> > > consumers.
> > >
> >
> >  From platform_device_register():
> >
> > /**
> >   * platform_device_register - add a platform-level device
> >   * @pdev: platform device we're adding
> >   *
> >   * NOTE: _Never_ directly free @pdev after calling this function, even=
 if it
> >   * returned an error! Always use platform_device_put() to give up the
> >   * reference initialised in this function instead.
> >   */
> >
> > Not that any code actually does that as far as I can see, but isn't
> > the above doing exactly what the comment suggests ?
>
> Yeah and Johan Hovold wrote that comment and he usually knows
> what he's doing so let's go with this then, I'm convinced!
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

After further checking, this patch is not appropriate for this driver.
ixp4xx_watchdog_device is a static platform_device, and it does not have
a dev.release callback. Calling platform_device_put() on the
platform_device_register() failure path can therefore trigger the missing
release callback warning.

So please disregard this patch. I will drop it and will also go back and
check the other patches I sent for the same pattern, and send follow-ups
where they should be ignored or reverted.

Sorry for the confusion, and thanks again for the review.

Best regards,
Guangshuo Li

