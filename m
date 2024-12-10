Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE1BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9lbLBBO8kM2n2jRi2Qb1qwlvQ3SeySuQW/fRe7E1eA=; b=oyvC007FSwwMi4iblosnRkEi6B
	ccZexIdz/AtT1iSOy6jd7IR0Oz1SyfyhSIS9meBuc4228bGAVHmYjE6wVhchf2pvProTfNYqLM3Ff
	bt5P+IVBexwOmcNFBgFpfNUbSPbhTEiINHlNr5GXKGnbPtj65jkTsRWHw6jq7VfNVKp5ZbdRo3Ir2
	gtjUwgd+9LWMf5GFuuquCIscJIcCqpiBkZigaV4YM3F++zEU1se0Cw/Do2x5fg+mF91nTWJjtdu05
	H4U8Q2ab7gEdYU0Q2cWoB0Zlj/m0XBvfXzA4cIY0sGLZ2+hGjuMFA/A98FARdORgxyrNYaQLVZ00a
	9nbOFu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6cE-0000000CdRb-3snT;
	Tue, 10 Dec 2024 20:13:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6bC-0000000CdJR-0vUZ;
	Tue, 10 Dec 2024 20:12:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so5204556a12.2;
        Tue, 10 Dec 2024 12:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733861568; x=1734466368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9lbLBBO8kM2n2jRi2Qb1qwlvQ3SeySuQW/fRe7E1eA=;
        b=fERUggPkqGR6BhhMz0sgC9N9p8rDk8Z0yOqd7kMqaggHFoXCyeeM6+0KkpmCQsuYZ8
         sn7h1bygoqIbXWXpgkGPWwiM90N/meE1VP0jgVjEOqlbN2Ais7XiS5BDa6LiLgil1cG5
         i/U126Xx/yuPLipA1f4p080zsv+8Dy68j9gviwVjiVPhR1Hy5w6n4917rBesZvZ+yY8b
         FhzAw2k/Muftlj74Sxf4g2OWVCuS2odirCnFay1TWhb/NA+fCUOC5qWqVyCzIVhSa7lD
         WDELucQdvnl1v0WY1jit24rV1IpXN3cn7m4T+Xz+Qp9MD3WQ6S1jHwmq0+sv3bTnufmK
         WcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733861568; x=1734466368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9lbLBBO8kM2n2jRi2Qb1qwlvQ3SeySuQW/fRe7E1eA=;
        b=qLfvV5b5zT5NySBq9puttApfRLqP5Smeu5lUcLsllOLjYd4OA9EePA1DmUeRAuvBCQ
         A5NLOa0vjR7BVyaqsmxdr0YQoXjrqlFI3f3VX15hS/MXvLsyI9CfaZhOaWyKokuPzj0u
         bdigqh3LlyqLqOWOPJkTlkClvAIv4dMrDbqrE2JBeKLFik7w90TH6ARDe/osZcUF/1UI
         V5D4QlQnGaxgdjzsiMOIREeazFDlmqi1qF4aANqvyNaD3FJSAHELcXtxyTwx86pPwDkd
         pwhvuZirgQxP8KdicAidLTanDWW4XtDf/oGN5IjJGG5VJCSvPQlkG7+nih76v6Fdg6dp
         S3pA==
X-Forwarded-Encrypted: i=1; AJvYcCUWFQfqqJFOC1YDDP8GjWv/L6fUefmr26HekhENIzHH07xfrKRzfP9hdjrgKrD2wWqDPToKdJbHK2Zfs5Go0rQ=@lists.infradead.org, AJvYcCWKu/jQKItZg22Ppiz94cLDR6+jCo83TTHZpAdW6j4qpdNj26dj7CMaliQOG9fmJD72M9wHR7JVr1I2vrOomQ6n@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhNfR9g1zv4nSUCqPI9316mPhsgPTY8OTpiDBeeajuK8JdJtZ
	yIxB9EaRgW7tBhgEnSvgfe0m/+ndyHAoGX40OXcXC42zoLbvdEUM+RIo9HQIPVirTvKDCW3+NFP
	ydWu2tL7cHV7iEWeUCB9jHt5m8Go=
X-Gm-Gg: ASbGncsNAEerT2bObF/HZB57Q2LldZyUypE/iVpcdryuyrSqOmPARFqLe2KCKynKVZM
	uC5MwZHGGOpWLdVOM74+uYed4qHmnkGkqbUCg
X-Google-Smtp-Source: AGHT+IGiPfuPBW3oKmG36OHVBhNiaww+/ndbWSRkgdBaXKVg4Zbsas+aQCY8I9lvfIp5/gr9+wqDTDl1YykwOSpcYwM=
X-Received: by 2002:a05:6402:2808:b0:5d3:ce7f:abdf with SMTP id
 4fb4d7f45d1cf-5d433163d71mr192647a12.29.1733861568260; Tue, 10 Dec 2024
 12:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-2-pgwipeout@gmail.com>
 <1b323d6e9ef873bfc770e9d54b7a3a64@manjaro.org>
In-Reply-To: <1b323d6e9ef873bfc770e9d54b7a3a64@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 15:12:36 -0500
Message-ID: <CAMdYzYqmn0UktNfz7L352zcjgmxf4tsRs2fwiFXF7NbfPY4zSg@mail.gmail.com>
Subject: Re: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error handling
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_121250_261515_07F8957C 
X-CRM114-Status: GOOD (  27.01  )
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

On Tue, Dec 10, 2024 at 3:18=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Peter,
>
> On 2024-12-10 02:30, Peter Geis wrote:
> > The calls rockchip_pd_power makes to rockchip_pmu_set_idle_request lack
> > any return error handling, causing device drivers to incorrectly
> > believe
> > the hardware idle requests succeed when they may have failed. This
> > leads
> > to software possibly accessing hardware that is powered off and the
> > subsequent SError panic that follows.
> >
> > Add error checking and return errors to the calling function to prevent
> > such crashes.
> >
> > gst-launch-1.0 videotestsrc num-buffers=3D2000 ! v4l2jpegenc ! fakesink
> > Setting pipeline to PAUSED ...er-x64
> > Pipeline is PREROLLING ...
> > Redistribute latency...
> > rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack
> > on
> > domain 'hevc', val=3D0x98260, idle =3D 0
> > SError Interrupt on CPU2, code 0x00000000bf000002 -- SError
> > CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+
> > #54
> > Hardware name: Firefly roc-rk3328-cc (DT)
> > pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
> > lr : device_run+0xb0/0x128
> > sp : ffff800082143a20
> > x29: ffff800082143a20 x28: 0000000000000140 x27: 0000000000000000
> > x26: ffff582c47a313e8 x25: ffff582c53e95000 x24: ffff582c53e92800
> > x23: ffff582c5bbe0000 x22: 0000000000000000 x21: ffff582c47a31080
> > x20: ffffa0d78cfa4168 x19: ffffa0d78cfa4168 x18: ffffb755b0519000
> > x17: 000000040044ffff x16: 00500072b5503510 x15: a7a6a5a4a3a29a99
> > x14: 989796959493928a x13: 0000000051eb851f x12: 00000000000000ff
> > x11: ffffa0d78d812880 x10: ffffa0d78d7fbca0 x9 : 000000000000003f
> > x8 : 0000000000000063 x7 : 000000000000003f x6 : 0000000000000040
> > x5 : ffff80008010d000 x4 : ffffa0d78cfa4168 x3 : ffffa0d78cfbfdd8
> > x2 : ffff80008010d0f4 x1 : 0000000000000020 x0 : 0000000000000140
> > Kernel panic - not syncing: Asynchronous SError Interrupt
> > CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+
> > #54
> > Hardware name: Firefly roc-rk3328-cc (DT)
> > Call trace:
> > dump_backtrace+0xa0/0x128
> > show_stack+0x20/0x38
> > dump_stack_lvl+0xc8/0xf8
> > dump_stack+0x18/0x28
> > panic+0x3ec/0x428
> > nmi_panic+0x48/0xa0
> > arm64_serror_panic+0x6c/0x88
> > do_serror+0x30/0x70
> > el1h_64_error_handler+0x38/0x60
> > el1h_64_error+0x7c/0x80
> > rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
> > device_run+0xb0/0x128
> > v4l2_m2m_try_run+0xac/0x230
> > v4l2_m2m_ioctl_streamon+0x70/0x90
> > v4l_streamon+0x2c/0x40
> > __video_do_ioctl+0x194/0x400
> > video_usercopy+0x10c/0x808
> > video_ioctl2+0x20/0x80
> > v4l2_ioctl+0x48/0x70
> > __arm64_sys_ioctl+0xb0/0x100
> > invoke_syscall+0x50/0x120
> > el0_svc_common.constprop.0+0x48/0xf0
> > do_el0_svc+0x24/0x38
> > el0_svc+0x38/0x100
> > el0t_64_sync_handler+0xc0/0xc8
> > el0t_64_sync+0x1a8/0x1b0
> > SMP: stopping secondary CPUs
> > Kernel Offset: 0x20d70c000000 from 0xffff800080000000
> > PHYS_OFFSET: 0xffffa7d3c0000000
> > CPU features: 0x00,00000090,00200000,0200421b
> > Memory Limit: none
> > ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> >
> > Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain
> > driver")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>
> This patch is obviously correct, because not checking what
> rockchip_pmu_set_idle_request() returns was simply wrong.
> Thanks for the patch!
>
> Though, shouldn't we improve further the way proper error
> handling is performed in rockchip_do_pmu_set_power_domain(),
> by "rolling back" what rockchip_do_pmu_set_power_domain()
> did after powering up fails?

Eventually, but the reality is if we hit this path the hardware is
already broken. I wanted to provide a fix with the least amount of
risk of breaking things further. I'm open to suggestions for further
improvements here.

Current behavior with this patch with the example above causes
gstreamer to wait indefinitely. I'll trace the return path and see if
returning an error other than -ETIMEDOUT triggers more robust
handling.

>
> > ---
> >
> >  drivers/pmdomain/rockchip/pm-domains.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/rockchip/pm-domains.c
> > b/drivers/pmdomain/rockchip/pm-domains.c
> > index cb0f93800138..57e8fa25d2bd 100644
> > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> > @@ -590,14 +590,18 @@ static int rockchip_pd_power(struct
> > rockchip_pm_domain *pd, bool power_on)
> >                       rockchip_pmu_save_qos(pd);
> >
> >                       /* if powering down, idle request to NIU first */
> > -                     rockchip_pmu_set_idle_request(pd, true);
> > +                     ret =3D rockchip_pmu_set_idle_request(pd, true);
> > +                     if (ret < 0)
> > +                             return ret;
> >               }
> >
> >               rockchip_do_pmu_set_power_domain(pd, power_on);
> >
> >               if (power_on) {
> >                       /* if powering up, leave idle mode */
> > -                     rockchip_pmu_set_idle_request(pd, false);
> > +                     ret =3D rockchip_pmu_set_idle_request(pd, false);
> > +                     if (ret < 0)
> > +                             return ret;
> >
> >                       rockchip_pmu_restore_qos(pd);
> >               }

