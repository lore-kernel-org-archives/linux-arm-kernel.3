Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35079D5A6EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=; b=WiBC/G0ZgJRrMVDuzD7C+TaMNo
	lwMh4mPDvuophD1GvIAKL/V0O7A1xXZqFZzmyuLGHJ/Q+8l9epT/ZvgRw2XMqr3ADF+i3FKNeHnRb
	7HbWos0QTd2wLz64kuyoXbaNrjSCWydwisxEz8vLwN8fE7kVhSYWc5GH8+AzCPTWxRiYPP1voeOf4
	ZimQt77OBfMg68UFRetHRkF45g/vogkQSqiDvIs4ccCGWcjX/swvbHWJnQxI4pcgvv1se++cO9R5r
	qo4ZoZdKW5tHbUbWNNRu3vwS7KTw5qdubCfLpWduyJeNg0/eQ/bPvO6v/laf4SfNQ9JziVGkvcqOH
	N4TzGNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqdG-00000009vsw-1Kq4;
	Tue, 26 Nov 2024 08:09:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqVh-00000009uXj-0PGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 08:01:26 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so11801708a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 00:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732608083; x=1733212883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=;
        b=MuMC07hu2jnDt37IhV00sKSNyRFj+uQ4vl1yFu9PfPH0bJm5X5Iom/F2XnRY10VV+N
         6f0gdTO5jfyahpVJU14K7OvkNqh9T9ZwB9clR2S4eGPPq0oJVf28C9tpgOJ8OqccPfSr
         l9O/oKhIsbT+LDGeh2/B7lqlxbgZxn/Ve10Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732608083; x=1733212883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=;
        b=l9m0Cukbc7n2TMRqbgQynxASgU+AXvuYf4b0MW90AzkNNhI/8687CAbUbak+a3NGD3
         eaDLPmtotYrYMxEfxtbyWL0gpOEQDl99HYxyv0CiOXzrqiJnREGrXSzjhDu3IwaaqLRh
         21IX7xyko3gHGwFGqUZzJ/6mp6Mzd8Yn1CsIgT96bxywWl5ZdgCuRgjBc4YPisBGImDG
         RrgJbNwDEluW5aNFFy8Z+PWF6Zsl3UwPmsgL2fyBByErQoISFHvRwrXF1tXwC4OTRj2y
         ktWnGvL9D2xdtTNDeWBpsasWCDU//z1HkIq+95rTByiCVji6uhst7fv7YYyrsXtKW/I7
         rtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd88HFa2BPpfb8FEsoyrH5XhL1tXLvhCUCFRHxTsLA86JPBch+IQ9Ez5ac+Lc9onlvh5gZuEcealznxf0aV0Fa@lists.infradead.org
X-Gm-Message-State: AOJu0YyXzx4saN7SYKqP4pB3XEwEojGmdW6e2PCM5h4T2VDs550o1rND
	kQ9ZW+A47nNdiV8isg5MGsmf4FXFR5nAnOgV1ba6Kh7AX3PGTOU96cqhrszW8ZlPciHRkBJt7wo
	=
X-Gm-Gg: ASbGnctBidSEhuGZJepPtF5uyC/qux+OdgLfwbVZrfYxcNfgbub4wkb/SPci3zZAVta
	lJvfjDJAXy27B66xpJaChVUI0qkUBnZ6BFBYU/mHu9yU3hApTLJGAC8Ftc1tmiCMB5bg1dqmCJu
	+4odhxV6ThUKRy6PK7pRAJI6lEOTwtmd4cIYS1vNeOcs0sOx8NDDZIjwmHoH5lkgbOuSVd852m1
	ipf0QYAbTjepz71DUD+vfRRjgwHT0OBik99o6sMtnDHNcdRlMlgFBdRGLmyL3wLBzP5I1p71xfr
	Z3aIe4jNIjz5JzNN
X-Google-Smtp-Source: AGHT+IGtCe+g12k4e/jKb09CNrU2plMtTaVCv6dGwcoNuYlUcSErRxp7uhHjudmWJfV3bElWv2QVjQ==
X-Received: by 2002:a17:907:2d8f:b0:aa5:4a38:174d with SMTP id a640c23a62f3a-aa5649cf406mr184478466b.29.1732608082039;
        Tue, 26 Nov 2024 00:01:22 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa540be5360sm347547866b.27.2024.11.26.00.01.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 00:01:19 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfb81a0af9so4740a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 00:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1dlk6nC81gpIlw1f99EE/RofYbD9ZzZ47wT/SqWQuPog5+ErjUxvl/NKuRiMzUnY2bWm258GDyE4y+EYXqrd7@lists.infradead.org
X-Received: by 2002:aa7:c48d:0:b0:5cf:c93f:36f3 with SMTP id
 4fb4d7f45d1cf-5d06f511712mr30786a12.7.1732608078885; Tue, 26 Nov 2024
 00:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 16:00:42 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
Message-ID: <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_000125_163564_D634CA3D 
X-CRM114-Status: GOOD (  27.76  )
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

On Tue, Nov 26, 2024 at 5:21=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> When configured in filtered mode, the LVTS thermal controller will
> monitor the temperature from the sensors and trigger an interrupt once a
> thermal threshold is crossed.
>
> Currently this is true even during suspend and resume. The problem with
> that is that when enabling the internal clock of the LVTS controller in
> lvts_ctrl_set_enable() during resume, the temperature reading can glitch
> and appear much higher than the real one, resulting in a spurious
> interrupt getting generated.
>
This sounds weird to me. On my end, the symptom is that the device
sometimes cannot suspend.
To be more precise, `echo mem > /sys/power/state` returns almost
immediately. I think the irq is more
likely to be triggered during suspension.


> Disable the temperature monitoring and give some time for the signals to
> stabilize during suspend in order to prevent such spurious interrupts.
>
> Cc: stable@vger.kernel.org
> Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chrom=
ium.org/
> Fixes: 8137bb90600d ("thermal/drivers/mediatek/lvts_thermal: Add suspend =
and resume")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++=
++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 1997e91bb3be94a3059db619238aa5787edc7675..a92ff2325c40704adc537af69=
95b34f93c3b0650 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -860,6 +860,32 @@ static int lvts_ctrl_init(struct device *dev, struct=
 lvts_domain *lvts_td,
>         return 0;
>  }
>
> +static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctr=
l *lvts_ctrl, bool enable)
> +{
> +       /*
> +        * Bitmaps to enable each sensor on filtered mode in the MONCTL0
> +        * register.
> +        */
> +       u32 sensor_filt_bitmap[] =3D { BIT(0), BIT(1), BIT(2), BIT(3) };
> +       u32 sensor_map =3D 0;
> +       int i;
> +
> +       if (lvts_ctrl->mode !=3D LVTS_MSR_FILTERED_MODE)
> +               return;
> +
> +       if (enable) {
> +               lvts_for_each_valid_sensor(i, lvts_ctrl)
> +                       sensor_map |=3D sensor_filt_bitmap[i];
> +       }
> +
> +       /*
> +        * Bits:
> +        *      9: Single point access flow
> +        *    0-3: Enable sensing point 0-3
> +        */
> +       writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
> +}
> +
>  /*
>   * At this point the configuration register is the only place in the
>   * driver where we write multiple values. Per hardware constraint,
> @@ -1381,8 +1407,11 @@ static int lvts_suspend(struct device *dev)
>
>         lvts_td =3D dev_get_drvdata(dev);
>
> -       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++)
> +       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++) {
> +               lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], fal=
se);
> +               usleep_range(100, 200);
>                 lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
> +       }
>
>         clk_disable_unprepare(lvts_td->clk);
>
> @@ -1400,8 +1429,11 @@ static int lvts_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++)
> +       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++) {
>                 lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
> +               usleep_range(100, 200);
> +               lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], tru=
e);
> +       }
>
>         return 0;
>  }
>
> --
> 2.47.0
>

