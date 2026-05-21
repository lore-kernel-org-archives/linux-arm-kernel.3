Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A937CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=; b=EopWX5/6ugbY1J7CcEQyOh9xWb
	vIwLD2pOrBFMTyz/USUpe+P6odV0sX0FWCqnnH6Z4mlboEEahe017DGdLBiFKqcdKk+FMv3fF5rff
	R4t2V9u1uISPSxAzCpnhM31WPSMdMeah16OuhUEboN0jF9Ko+XjHnhInE2N5mEdFaC7tOE1emtC4L
	PwIWny4ITVsM39bsuZ7zedpcu5IKp0F9IaXqY4JciVPuuf7fxVDm822qjMChfr1c0sLsS5fjI2NUb
	c6YXoLfVv+eX28P3k0BgSgVl3168Wm4yIp19TKOl4u1FBnTise2fhPa+P8pbhVgrWpqDGKlLKcON6
	+jGxqo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4mc-00000008AHW-1Wgv;
	Thu, 21 May 2026 14:53:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4mX-00000008ADM-30rD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:53:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-369576666d5so2909872a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779375233; cv=none;
        d=google.com; s=arc-20240605;
        b=CBkGFTqjCwK573vI3KW2shuXaJd3sMZFLUYFHYJsf+Ff6liVTex6ti9/sBm9p0CFhJ
         Fc/glTPCWqaSk+mLde5u03fSee0oZMeTtUkjBNmTz/+kK+2ptLo57KzWRiK2gktdyD6k
         C5Ty9ZStwhJt+QYTzrcKnoSlNa+hZjePR4jb5ZJg2oAvEM2xz9wBZA6aUKqJDa9YZt+Z
         GGni8Rk4BU49ZU3C9Mb5jzeodZWNl1+SPCKzt7cWJI1078+Cu/pHgLepDz+QLfjvVS7r
         HrD/ihULYULEPfrWgIRMcscozwEKanjym8FwYR5kc7VN1pBLZKUC3GcqUcHSBqHIiWvk
         kpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        fh=dphJETkWb34+8HySkHHOPsnv1OrIenlmfSHmPZroPFA=;
        b=ktu8hQZIpBTj0Ilngq0pcJQahkKfPofSvVy3qbBAuv0NVs0mr8PLAhCBy2HFR09jgQ
         cWE48c+n80JSEv5VJpKDJK1ESOehf4K1Wm8Syju93xrEhp2nPVcLeXrZQO7xbcVAxVxt
         vqnVnMNMTBrMD99enQURav4jdS5JQahNDPzjDGuV/F3dK0lvFc4MjKRlJ73eoG6xk+eH
         TyI1/VHP8ogke6G7LGX4YFNC/yeHD+hXnybjcud5+Ug1P6MgyMf3y5JWKRXITy0xxTCt
         RMd1kcr0MocEJGPK5OOrwjChdsOG7uQYhe4l2rOuseFeRBSvXl2UyReENdc2R5f7Lz+o
         zYdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779375233; x=1779980033; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        b=JUzU4ppMVn1uSgtLVyxBldyrJ2iG3SM45bjgUpPibuGWiSujufe2d/eatgGaQvza1w
         Jvz+UHNO5VM/qtLE6LIPRVXEofOnNtZ8MBaCnVUNlY21/BHv7VS0zU6EQvXNH5K4f5uQ
         5lHPa860FTQSyLNHeY8IHSxMG6MZS1eZD2gY4uynhptKTC/s9jGBmHg6NXWaaDJFSfYc
         Y0YL1GrjSPZStsE/EJDCehVltKTuBqTvDTyyDWXDlPZUb0L+RgITscVVIVd2zmQeddo+
         JQ6Lu5eJhLNg8/er/dPeG9czS0KO3T1Q3cZLVVlcVZDIvSCKeHNtcrttz1Wfvc0LoEqK
         Xa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375233; x=1779980033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        b=mfVg/I0OaYGXx17lQGH8a10RtTu4pqquIkY9bcxbpOoX7WHrTyjSBDxbBrovaCB6WH
         oG5OLGZJMa0IwLBQ9Rl+MtqSK/nVDNFt/08XY72RYCa91xVlXy5dnTOW2ALxNywPaXhW
         MaE1ptc5QhDR7gwOAOB7hhxBsGHkMHKQFw2Lafk4yNz8SBJf4HsKuTyfj/54V/sUAp9k
         evjubJXtR1pAzL0RRbiLR2EdGRcXhaZRef0b73FNJq5VceWkj0Nie5z2B+un9kB+2ru1
         EyqQCAeh4Cydz5U4MR+UKcJojpwJieUB3TyMsU5A3feEjFr82B0lO/H8HCR9Xo2GVcAR
         AQzg==
X-Forwarded-Encrypted: i=1; AFNElJ8wdv43jVDTrQw4tYgc6OI6RlVjbJvyU48ojXXjqn/2QD3au7qh2XIiQBBLYavnmVm+nQe3RBERrUxkTSPMQDOC@lists.infradead.org
X-Gm-Message-State: AOJu0YxFiXuEPx09Vw0M0Mcq89uI9meEjz2HhNpJwawLpWjWchbcBr0h
	yijsbNHEjmY4dWmGkF8IFXQNSNCv1zujnNs4X5Eo+v3VmbHhEW5Ufy7Y28qyjCSR1m2uy+KIij5
	OHlg1P4tC0rYr2qGNN0Y3Wyq8fBbN+T5dg2c3gwtPsw==
X-Gm-Gg: Acq92OFXA2m6xRwWBjDzVJLCSTwPmulzM/6L/DqEyKaaAdH03CuJryPN+Fj3J+gQ/Lq
	KxCkUXel/zxHzrYZchAPINdYtV3K2pv25SW9VhVGNg9unAMpWCve0yIVdOZegEw8C4iDbKTmULm
	DH9TgboWZdB83h+1mfzgbIFLS0UkVgIF0gdqIzcSKiQWl05q/bEZAKIdCiZaD/s1F8OK7kqhF71
	5q3m22TTpBEPdJjUUjiU5TzskMNNKQ+d5sUBHaa6sXP/odq4w9n2+g5W4+Ii72c4SI6DE+6vtZW
	5TbMcvsfRr6ewNUAbMNrFroePgYmMcWqcC63A+E=
X-Received: by 2002:a17:90b:2d50:b0:368:78da:803 with SMTP id
 98e67ed59e1d1-36a451816e0mr3680773a91.12.1779375232901; Thu, 21 May 2026
 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:53:41 +0100
X-Gm-Features: AVHnY4KPQYYiaRNDiAsU-wmS8JuOZnjSnShN4CXgg2DHzWx0LVSgQ_nHQROoprA
Message-ID: <CAPj87rOFnB+csoswOOSBR2-=abtCDbsKq2uJ_PgYKPWh-G8m9w@mail.gmail.com>
Subject: Re: [PATCH v14 00/28] Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Marius Vlad <marius.vlad@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_075354_075828_BB56C028 
X-CRM114-Status: GOOD (  17.59  )
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

Hi there,

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> We have an implementation in Weston at
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
> adds support for this property. This patch series has been tested
> against that MR on i915 (HDMI, DP), amdgpu (HDMI, DP) and on rockchip
> (HDMI).

This MR is R-b me.

> General notes on the approach taken by me: instead of silently switching
> to a different format than was explicitly requested, or even worse,
> outputting something to the sink the sink doesn't support, bubble up an
> error to userspace instead. "color format" is a "I want this" type
> property, not a "force this" type property, i.e. the kernel will respect
> the limits imposed by the hardware.

Yes! If userspace wants a fallback chain, it should encode it itself
through a series of test commits, rather than adding the sequential
logic to the kernel. Doing that might work for one axis, but pretty
quickly disintegrates when there are multiple parameters to perhaps
fall back on.

I had minor comments on 03 and 20, but they're Rb me with the obvious
fixes. 11, 12, and 19 are Acked-by me, as I don't quite know the
hardware specifics well enough to say. The rest are Reviewed-by me.

I suggest you merge the common code and VOP2/DW-QP implementations via
drm-misc, leaving Intel and AMD to merge through their own trees
whenever they're ready. We'll merge the Weston implementation when it
lands in DRM.

Thanks to you and all prior cooks for all the work, and to Maxime and
Dmitry for the help and review as well.

Cheers,
Daniel

