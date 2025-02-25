Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpinBTLgUsFr4FW8ynMBn6mnM1bFPNOn+l/M0TzxPak=; b=UqglMWM9AR6vPUhtR4yd57Me9T
	xtR7LwQqgI57hHnhKjCCVhmfgA6CrpQ24PZas5bi0PFQaiMatzfGgdJxcOL42ZGnShqnuY+HPJFjo
	HWQ8pm3uZcAhZ4RWI5Fd7fC4xSqaxMVMkrFytV9DuooX8pVLZleArCuKpWaAyoz3PMO+dbz8D2VIK
	/5uGCpOmqqJ8guPXSNLihXlERtYyX1BLvMVrS3rvjh/N1o+zcOt1fZWeA8iMY1ODa1qEi9UingD1W
	akTKsAGZW8AT8KlIhemVbaM5WvAsxHKx/OvvqsAxznw3etXQdy/p5HBocpgf3w5EZdaBIZFhoA78G
	4xFbwVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk0u-0000000FjIJ-2lN9;
	Tue, 25 Feb 2025 01:45:36 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjx0-0000000FimV-24O2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:41:35 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-30918c29da2so53678361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740447692; x=1741052492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpinBTLgUsFr4FW8ynMBn6mnM1bFPNOn+l/M0TzxPak=;
        b=Lk/6jzAwd+JVJFJCn0vyFWwgdhiLSxMhibBrx6U4/VcDqD3yKmZt61R/azljxhAyTL
         NPBVvRNoSrzDNThb39uUSqUhOYjoHEZPM6S0G9SNJsXZpLSQuvabVgExbEoiSybw33GM
         Ivk9jmnLr4C0srpFbsub6w4ON59NYamqW8aZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740447692; x=1741052492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpinBTLgUsFr4FW8ynMBn6mnM1bFPNOn+l/M0TzxPak=;
        b=lsfXGGyWujP7yIm1d1DuowpuPV7ZTtiTLT4+/pXvZMEsDUbL7nP+unGG/EHi+wPI8Z
         3o3Tg0l8L6VVOxOH5D6QnPyToniNKJLWP9xOUiFJqoRT5t1wSEL+Jo/4SL1LALuJaaMB
         JZShFj4DRKrC4W1ys2/ACDOQ2CfBsbiPyjA3ExDP/ryveJQ90NF+4Wj3V3IaDCSun/Ur
         fJ4U3+9kdP7Wz70s5Y9iBkg/akzN43iLEdUb00Zim8CE/bgyHym5TaBH4sibb5u3Vr3a
         7VvX1MbT33HlaJKRs8yWrQOrD9ChBSr99X37duLIL2/mSlgQR4R67rZgpo9xjUXA/grs
         pnlg==
X-Forwarded-Encrypted: i=1; AJvYcCXzdbwUYdb+wfrl6xcv6/xm0QG90cX1lhUhDcYY4q+wT6aluAPm9RKzT2b50p5eDUervaUEPoefUzZbwHWprVyf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5W6HQ/1zuX6BhEHspLr9y+LDvaf/DTdNOQjO8HfgnGaqy7Jmi
	MnCC88XgvfJzotx+M3qlbKrj/glt2dmaTDpmOg+cBR2wXKll4FdlWVKd+Cxu9g8OH4xXy9rXDwT
	uZAwg
X-Gm-Gg: ASbGncuGHZhRnjmNirmO0E/6tSE43oblOjQx3SVAgb4xRuXfaXgFwjL5OGdh0ocg1U0
	l+mVzmiJXzdAmxj3JWd+BwEXF10XVo4AkyMSWpFCpNUsRaNtgwFtWcy0fo4xMamW0PZqGygaISl
	09xKTWIoOwIu1sU86JabibUbEdUoDYZeZWoPBZ29XPijrXchWC8TftFuUgYB66JK5GaRG37v2Dp
	+QYjH9TPdb/45CKMaElN9tSJvDVE+pvhjAaUaZmuybtTSeFfsgoG3hnY4JTpLP9VTgr5zLQnjqZ
	ZIVc8jCaQNqt1LcWX5hAnmJUqwfNG2XU6qjI2ceZiuWeeCyHy1La0XFOOa5S9B57ntEPlA==
X-Google-Smtp-Source: AGHT+IEiX16XYnBpeDclPdX97kHwTn8sMmOHgfGt980H/+u4nroJmu85P2fRjlLbOgY7/h8ByAwNeQ==
X-Received: by 2002:a05:6512:3e14:b0:545:1d13:c063 with SMTP id 2adb3069b0e04-548510d1bf0mr360977e87.14.1740447691586;
        Mon, 24 Feb 2025 17:41:31 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9e91sm50618e87.100.2025.02.24.17.41.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 17:41:29 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30761be8fa8so54525721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5XiPESGRR2hzGdGq1vpJc2Sj8YU4TaLeeAWn2rhiBeg0w37jENC1MEYwM6b22oW4MqFMK0K7bvuI24IxoBU6N@lists.infradead.org
X-Received: by 2002:a05:6512:12d3:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-548510cd51bmr337321e87.9.1740447688736; Mon, 24 Feb 2025
 17:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com> <20250224081325.96724-10-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-10-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:41:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
X-Gm-Features: AWEUYZnKr8Y-H4FsK-guhyhHxicg1iDHnSI-Q2A1gzO1kxk46bWqe3yORiZ3SvY
Message-ID: <CAD=FV=WoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq97v4GAgvmw@mail.gmail.com>
Subject: Re: [PATCH v7 09/15] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_174134_539967_E228461A 
X-CRM114-Status: GOOD (  26.74  )
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

Hi,

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
>
> Additionally, add support for &drm_dp_aux.wait_hpd_asserted() to help
> confirm the HPD state before doing AUX transfers.

Maybe move the addition of the analogix_dpaux_wait_hpd_asserted() to a
separate patch?


> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>
> Changes in v5:
> - Advance PM operations to make eDP AUX work well
>
> Changes in v6:
> - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> - Add a new function analogix_dp_remove() to ensure symmetry for PM
>   operations
>
> Changes in v7:
> - Fix the misspelling of word 'operations' in commit message
> - Remove the check related to CONFIG_PM
> - Remove the unnecessary call to pm_runtime_dont_use_autosuspend() if
>   devm_pm_runtime_enable() fails
> - Remove unnecessary function analogix_dp_remove()
> - Add new function analogix_dpaux_wait_hpd_asserted()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index a57e06d303a1..ff81c37dbe1d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,22 @@ static ssize_t analogix_dpaux_transfer(struct drm_=
dp_aux *aux,
>         return ret;
>  }
>
> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsi=
gned long wait_us)
> +{
> +       struct analogix_dp_device *dp =3D to_dp(aux);
> +       int val;
> +       int ret;
> +
> +       pm_runtime_get_sync(dp->dev);
> +
> +       ret =3D readx_poll_timeout(analogix_dp_detect_hpd, dp, val, !val,=
 wait_us / 100, wait_us);

More than happy if someone else wants to overrule me, but it seems
weird that you're looping over a function that already has a loop.
Shouldn't you be calling analogix_dp_get_plug_in_status() directly?
...and if "dp->force_hpd" you probably shouldn't be polling at all. If
HPD is not hooked up I think we decided in sn65dsi86 that we should
just sleep for the maximum time (choosing a conservative value if told
to wait forever).


Aside from that and the idea of moving
analogix_dpaux_wait_hpd_asserted() to a separate patch this looks good
to me.


-Doug

