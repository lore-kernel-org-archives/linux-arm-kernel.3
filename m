Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0444EEF31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=; b=mBQdLaq6TGNY4/dsGvvh/Sb93e
	xbcUOEq00WEl1GQ5a/tPzN0kb5r1zx0yjBxU6Y1Sz1GOPz2aRKG2FzYqwJG7vPA8Ervf/7yHysd4Z
	B3wth98+hmB2OA/QeXJ+nWqaxUumDc4Ca4fzJTHo0A5NlEhc5yWNDIBWDFhyAS2MMhWqqkxTGzoK7
	b9AfbG1lMMGwjAjVPWn0fs95keaytXE9M+CE6BI5vCfkpwdbt03QOWOU4F3ywqVJ9/6hv/F0c++uP
	sxYeLTYDUl49ZVtI852DMowYHBj2jYIXAyAW9Op3bNeAJ6vcHfY8fHGS8lJrLnBEk3ibypHAllgyW
	haxnD0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy44x-00000001CEe-34vH;
	Thu, 05 Mar 2026 08:29:07 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy44t-00000001CDF-1U68
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:29:05 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso812306137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699342; x=1773304142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=qBT4g+86g79xihanhOGPdiIgbaPzVtPeStyeM1Tm2Md1+OW9J7FkbZsNzuUpQQ2hn0
         fG29bx/AGaySh0ou7J4jatxuOmsMZ/bsbvEt8OV4bO112v4dtK0obkVDpNT+UsAi7k4v
         mNH0CrMfUA2x7qBaem1JwdGLxxAY3qPK9aV5v018AZnw5ZQKf4ERy2IKbXxewjgVtbiZ
         QZa0F/JTyIYpimigg6xg7v6QFFEJcpZISID4H25DTQ2oagmrF9kQiQWCuhOqMn9vrf26
         xKGUnnD6q3gbUYMw6WQM3O0anEgSY0wxOy7MkhzzY43E8V5Qw7zKguZI1QXcihCdSdSS
         WYlw==
X-Forwarded-Encrypted: i=1; AJvYcCUFmSclZrQbdMqtbzjo9MDhA975Ao8phgdMFgIuw0+onQRTm729ogsj22Q/rOaElDrbUj0VzYRo92z1QomDU3tB@lists.infradead.org
X-Gm-Message-State: AOJu0YzMfx6Hkp7BoasVLKnUKoe33m8eLE84DlkgmY0kMcKdtRtbioN/
	x9GuID2iUzEE8FoL8fb19XaeSD2FHJoiXM2LyVGW0FdZCmj2isHqZM40swLBuMMq
X-Gm-Gg: ATEYQzxweE+9khNhA5cD7A0puSA3KFchRUkKZrPp/vxdGC4lCrQgTtjfKAr2ffkkK5R
	PTvOaqZPZiZYThyeuke8KRiXyXBb8vvZOYsDcxPVxzuZah+Nx8zYa4ZIwzC+WgZe3D18T6CZMgN
	A0zr0foFnR952j5PR/eIMIjXMuwnbzIWtAFGP+MJjPXHzqC0vZernud6rOftfMpRhzZw0pXq7Ds
	x0bOT56XK5u4XZFAmLvSJtqvghPLoGBjTiyASU4smiZIY3S7gAOxn/4WSEA2Xg9xiwsJC9NuIkj
	+OxGSK3HJnhhwS7J0ppSU45m8i1SUBKTboMqHqccs3qsFb19O2UzO1xFSlDV/iXayNooYC3FfHo
	lNwjjbF+4inGQ5RbdrfH5rvNVK3AGMEq+ZPsiCcIJ1c8j9C9PmtIVh/5es9R/dGgrqz4jTqpL2D
	9j/3SAHddBXne7F2xpDZqHeTyw+LxjcD9Xpq9KdtTAHBNPJjUkT8KM+MS+BtzX
X-Received: by 2002:a05:6102:3e8f:b0:5f5:402b:7ee3 with SMTP id ada2fe7eead31-5ffaac72b32mr2090943137.14.1772699341769;
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffc0df8ce2sm2828922137.11.2026.03.05.00.29.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso812301137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxXoQ7xq9gS9jk7p/J96Fia9ah5bPqq1Sn8P/iaxzoXKIDUynEr9XI3KouV00g0x1OLrsB3BWTksRZ1Y19EIz6@lists.infradead.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_002903_400613_675AB26B 
X-CRM114-Status: GOOD (  30.07  )
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

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

