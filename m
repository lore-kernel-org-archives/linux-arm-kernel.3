Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122EBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkmHafwpQo4yg6dWPNSutW36/6DlGMFcAe4tDDqYnTg=; b=GloNuxlfheCcTkK3FNuBROTChV
	a/GVhj1c0FPbbt16JzL9l3zoyW6eiyY9scTJKxvgq1+kjxsrutnqpPhxMo+e4mn5hBkoSjsh11a6V
	b+eZxuMugvt5yK052V7L/CdhwXqyfOhunCqdfOD3aCxXYdI5IURAibHGf7OsLyXQf8fv8FDLstUOh
	PyHBPgn0BnXGLzfb6eJ4XDJ3EfE/aU26/8DTeqG7a1oEX7jr0FstAtTnZv2r3w1tDyr0EYNcc8hgk
	dPd1fDV78oNzkruvlT9PfzBDIOVkiY0+QybE8ee9BLkqT80iRhU4w4rWR2kLxykZhRzfwUTS3i1rA
	d28uvzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhd1-00000005n0I-0R45;
	Fri, 20 Dec 2024 18:21:35 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhbp-00000005mmd-3dFT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:20:23 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6f150ddc86dso18433227b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718820; x=1735323620; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mkmHafwpQo4yg6dWPNSutW36/6DlGMFcAe4tDDqYnTg=;
        b=YenUcJeyqoJyZlcABldp+EEgkR7kt/KyJ0kLru2c+93ArlbDr4ST0/y+Nc3MfGUMyj
         z9WV5R7Fgk7GNQy8zsB24afqFA1bAo5tQ1x2J5lZWr+fkLrgOpix9OE2oGDgE44szwpt
         d4yEFVxb6YJeSTJnVO6FSh7WxCrGw9Z5de6aUpoaVkEcYNkdjwxh6kxromNeALZpTRZH
         p4Rft4/JCenXpy4GeTvmH330jWe26X1JOApPfp5eYLATRkwYfZDRH/r3UAtod+BBnHTD
         P1Q128oN181UwGIA5qW2HM6/GVs+tY1sGMGgwL7baDXS/b33cn4Mm4gfMncoh777Lib0
         8tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718820; x=1735323620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkmHafwpQo4yg6dWPNSutW36/6DlGMFcAe4tDDqYnTg=;
        b=STZonijgCvj20v5ae8FuiTGlmYZ82r0a/DptX+tTqqe0bJbsLTYKmVIq9ztWaWlD8q
         EgtiVqOnVOUnthWQUNDyLoZfNae2rRf9SOH9vGA1zQeCxfmZSWf0YccfZ74b9ANiOpT4
         ahiZF+HEw2mExrPGBzP5BF/J4CLvYK8XizU+TUYxcCWUUZ0wDNRCHiwFcoJxC8NrxCz+
         kUMzcAujGU4k5EM5nqu4hTulbajLoR1AXteqS/9DlOK1VkTJlbRM4hPsTyAe3gRmMUMY
         2xFHaZiu8Zx6FHZAsQkXNiUIDgkJR155DN/wZLORQiKXu1FTw/781UZB9yFm06DdR+oX
         P+eA==
X-Forwarded-Encrypted: i=1; AJvYcCVxW0yG8lIRv9fi/6VxIPa7//irLUgphZFHy5dMXXjWVdrdJI/mHSqTYZ6T1gLf1X6HzZB67QhGnoouZZp+ZIey@lists.infradead.org
X-Gm-Message-State: AOJu0YzXn6oToWo8d9Drn0AsSwkqfCUDuUoZkV992HPylE8/wOJ3tT0M
	88IBnV8tKxHcZCGi221LcMnFP6ioYJUwoik7pVvxJT4gccjDqoyqPrJnPl+iJvmUHXkYAQ9Kxgr
	dsmytX4iOAL++RrgYf/XeaKMlXQobUB1WZCcvZw==
X-Gm-Gg: ASbGncuuYcpry9bpMh5SeuhUSPz01WftMdS8lSznogBXIaw9L1VcMe7O67oq2T/Y2QL
	+90+zxMPQMSfrY/HYUkgkRMbJkyXNwtO77WOkUQ==
X-Google-Smtp-Source: AGHT+IHzodnVW54gqjkWU4S+wDRH0KnMRpnY498su5SkwFKtL+s6/Cs/9gE+4Mln5lebMJJZEE4Nq62hme2QdhAeF1E=
X-Received: by 2002:a05:690c:3582:b0:6ef:86db:4356 with SMTP id
 00721157ae682-6f3f811aff4mr32534157b3.18.1734718820497; Fri, 20 Dec 2024
 10:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:20:00 +0000
Message-ID: <CAPY8ntD=+FmSRN7k-kr6Vya0huEVKbFLP84w5O7ww3KSHoDACQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_102021_902685_501AB95C 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri, 20 Dec 2024 at 16:21, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> From: John Cox <john.cox@raspberrypi.com>
>
> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry
> Pi 5 boards include an HEVC decoder block. Add a driver for it.
>
> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  MAINTAINERS                                        |   10 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  12 files changed, 4698 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a33a97d5ffff..569b478c44fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19567,6 +19567,16 @@ L:     linux-edac@vger.kernel.org
>  S:     Maintained
>  F:     drivers/ras/amd/fmpm.c
>
<snip>

Typical. You read a patch multiple times over, and still miss a "git
add" of a new file

I won't send a new version now as there are bound to be multiple other
things in review, but hevc_d_h265.h should read

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Raspberry Pi HEVC driver
 *
 * Copyright (C) 2024 Raspberry Pi Ltd
 *
 */

#ifndef _HEVC_D_H265_H_
#define _HEVC_D_H265_H_
#include "hevc_d.h"

extern const struct v4l2_ctrl_ops hevc_d_hevc_sps_ctrl_ops;
extern const struct v4l2_ctrl_ops hevc_d_hevc_pps_ctrl_ops;

void hevc_d_h265_setup(struct hevc_d_ctx *ctx, struct hevc_d_run *run);
int hevc_d_h265_start(struct hevc_d_ctx *ctx);
void hevc_d_h265_stop(struct hevc_d_ctx *ctx);
void hevc_d_h265_trigger(struct hevc_d_ctx *ctx);

void hevc_d_device_run(void *priv);

#endif

Thanks
  Dave

