Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C1E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDeSzNmG0r25Rn5nUf/295MidZQ+oiAWsebYRxIgxz4=; b=zzOQd2yA+MihG35ri2ACBuIngu
	dK4hjjl1Kp+bOPtZ7NaoWIBWpx80X2704irhN9pEDULTqz7P6NKiK7/wnSpMpHVR6a+/uCVS+1y/W
	efV4kHUEmualf28HRrx9wzRHoYYRMcEzVGvHGN+i9wm24azvNjETxjM6/5IV8biilnZGLRxebov7M
	ei0I2/xQEG8eWCqGHoZDdJTBBv+FaiEpTRYzxM73jvZ4/kn86VBlMWoOb6LcI+ejAJhtTwN2n14Ui
	24QU0K5pBpOUQT0pmdirvEQ/WtvPJH1vTUW8P3knoTb68dci3mbRTNATks6Kfo8q7NBDBgPdL9mhp
	Gg2wZSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpKY-00000009s0l-1VT2;
	Tue, 10 Dec 2024 01:46:30 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpJU-00000009rno-17P7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:45:26 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e3a5125c024so935955276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 17:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733795123; x=1734399923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDeSzNmG0r25Rn5nUf/295MidZQ+oiAWsebYRxIgxz4=;
        b=iJTRixxELwHlvqumVPCRHsESWu/UftTwzWUDonlNatUCL8qyXZf6X/UduvgG4FezSl
         6+zR7dlBVXryCkEasv3d+VgNTAPNz/m8aW9l2CoctTt2jB1dMzsBdweyinBjuc2g7ixZ
         7DBvGa95VwXe4y50gP8VbOGh7bygayHs1OhvSRVp4zCS8fGTR4FTrHjh/QmvkOmH/cch
         NghhXtYNuzXONSFi/WE7U8/67YUlYjE3mi9oX7X0ZaEu3UBBYHkt1J9lCG9xbHnabwjo
         7cPau7XhRvs7cPWOY69M2prdvlfk3wxEwYevATezfK9z7ODQexcEf56PyVqd6TAiS75s
         K9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733795123; x=1734399923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDeSzNmG0r25Rn5nUf/295MidZQ+oiAWsebYRxIgxz4=;
        b=bG6Pmb4DJS5apVIcr62zMR0HRogrEZBtbta2cGboW5h24ycl+3nskbcdgR/PPYXzxU
         WKtU+nsuZWsOaKA8OrW5uJ+4Yt46WmXHhqSEeNyfbkgdimWzVd0USmYT3x8k3Yo44aiH
         J0bcZdVWlHyoFxa8uqIfNupoUz3sYsWoYbBPJHX8Im634J0RiPQNygAbNld9mc9/vz4T
         a8p0HxJgnzFCpaUQWP3iF9feMvZVo7t/5jsBQ2j5v+8jCi9H12ekPYPVPnImbjtoDh/i
         cEh7HAAgUW+i+n6A/XGfij5RQlAZ+Cr7vmD4H3GcWz8JW90zxEWpKlL2FTOnvOMs84mU
         sBEw==
X-Forwarded-Encrypted: i=1; AJvYcCUq7G+fOd5fRa3zg2JzKCYwYIPiqBRdQHhQ0Y8DnPXqqAvwGsRViDnGBpigFDAPZIneR16d4ePIeOwl37oqpyYL@lists.infradead.org
X-Gm-Message-State: AOJu0YyAR8at76iPQPKxnTpNh2ty6+k9A8E7pPaogOzfZCY60NVfYxMp
	HV15MG7xprska4WDWC33Yaw+8g1RcnoUJpy66ELBB82yyfENWJLWitMMXyari3TTIl7RuB1qaB6
	tMlzPnQlxjl3DDqimXuh3ZwT6h+oEifSeTm4bmw==
X-Gm-Gg: ASbGncvyqXsb+8U6RCf2QnTgyEamjkmbdCCkT2FUqeZ1xp3RcM1nWoRycbfdYtwMUQt
	JHwAIYOgSD1GRVuo5hqZTXN+Ozkc60rZOjO+l
X-Google-Smtp-Source: AGHT+IH9FYdZyuYf6+rQs47uyzndT1wVwnYcReW2ltFVfptMntuMiqQM909xz0QThYmGJkZYxK5rC55WkYQfh3JUnOo=
X-Received: by 2002:a05:6902:150b:b0:e38:b2fb:f57d with SMTP id
 3f1490d57ef6-e3a0b12a8c7mr11436978276.28.1733795122949; Mon, 09 Dec 2024
 17:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20241203165450.1501219-1-heiko@sntech.de> <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com> <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
In-Reply-To: <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 03:45:11 +0200
Message-ID: <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2 controller
To: Andy Yan <andyshrk@163.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>, andy.yan@rock-chips.com, 
	Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org, 
	robh@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_174525_162841_746AACE1 
X-CRM114-Status: GOOD (  23.76  )
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

On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
>
>
> Hi Dmitry,
>
> =E5=9C=A8 2024-12-10 09:01:38=EF=BC=8C"Dmitry Baryshkov" <dmitry.baryshko=
v@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >>
> >>
> >> Hi,
> >>
> >> At 2024-12-10 07:12:26, "Heiko St=C3=BCbner" <heiko@sntech.de> wrote:
> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> >> Hi,
> >> >>
> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> > > This series adds a bridge and glue driver for the DSI2 controll=
er found
> >> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP=
 block.
> >> >> > >
> >> >> >
> >> >> > I did more tests with different LVDS displays. I tested following
> >> >> > configurations with DSI/LVDS bridge:
> >> >> > - 1024x600@60.01
> >> >> > - 1024x768@60.02
> >> >> > - 1280x800@60.07
> >> >> > - 1366x768@60.06
> >> >> >
> >> >> > All of them worked without issues, except 1366x768.
> >> >> > With this resolution, video is blurry, and offset incorrectly
> >> >> > to the left. There are also repeating errors on the console:
> >> >> >
> >> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY ir=
q err at vp3
> >> >> >
> >> >> > In correct operation with other resolutions, there is no error.
> >> >> > I am not sure if this is a problem in your series or rather in VO=
P2
> >> >> > driver.
> >> >
> >> >This really sounds like something is wrong on the vop side.
> >> >The interrupt is part of the vop, the divisable by 4 things likely to=
o.
> >>
> >> This is a hardware limitation on vop side:
> >> The horizontal resolution must be 4 pixel aligned.
> >
> >Then mode_valid() and atomic_check() must reject modes that don't fit.
>
> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,

What is meant by the "bsp kernel" here? I don't see it being present
in the mainline kernel. So, if the mode is unsupported, it should be
rejected.

> because sometimes, some boards do indeed choose a screen that is not 4 pi=
xel aligned
> >
> >>
> >>
> >>
> >
> >--
> >With best wishes
> >Dmitry



--=20
With best wishes
Dmitry

