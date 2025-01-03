Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63932E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=; b=hzx+S8MLTxXKYw+qVCP/WfERuX
	JWW9QZfcb3HNp0zLEJYgvu2APAGdMFsy+SutkTJuzyGjSMUTag493eGtra4YquVeRf7tjzyK8uFag
	bBVeSHJF7xCmLv+z78ejYuUgZWYKtWQ7o3fCJeWedAIMmsw7pjeoc0BmTbJ+yj4xJWR4w20NvIQQB
	pCgAnTsv3Jm7zySo+GoxFIT37YVk0+X90LZ2DQqVWuMUd/ETGo9vqkeaQo6i9OQNJ6r7hqrX+kls1
	gT7wgmPf3qemsG70/TDm0BQ6ady9O4oU2A5h+28dW3AW5vun/jlNE6gq2AlxLZmMjrfHiglu/t1rF
	yvbHrwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaVl-0000000C8qn-0yXK;
	Fri, 03 Jan 2025 05:46:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaMz-0000000C7ik-2Pso
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 05:37:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3778bffdso13611695e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 21:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735882632; x=1736487432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
        b=RTnOzUYnIpvSA5keRYXzvfADnf3EVBIIaAhVBwwSJicXG8HG54AwdYzNzuC4G3xiJj
         Ev4PmLrmbWUypUqlajZbuLaY4h2Sl8xYZ4Ls/Pnx691SawO8nlQWCtxi014FX/T5SKH6
         E5TUi6909i6hKTeyik8a4mAfxe5TvSQ0Ek4chEAEaLObN9EIitkySWiwuwsP2R3Kpy9j
         e+ZM7A5GEbOZ5VMKYWkp3CQazTOQ67C0Wne452Yq/g5C72acK67jx9xsvKVYN0Zmy7+Y
         66JBF+zdny4Uv4285kDIRKgSkE0oCg6YvJSWTMiyL3E5wyYc/aIwmpXQUSf9tk8hbDn8
         M7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882632; x=1736487432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
        b=tvXq+J6k0Ldo1rTdsW+h4lSv+7zM+v57UYbd825VEoLd5m3xF0BtWB7gWX7fwlHvGj
         IsAKXFz+jzTOgwwPCCs3vLFCetPvZdF6KqIPhA8QJ3+zQ7F+JW7+wG4EXyZc3PzTiEQl
         0+snoHydJYUkr3L0QR9dL6nfjDkdadU+O9ZcCU/sNJrYYSqWV4GU1gII2/Q2vavh60JL
         ufGVpk1h/8P2NVc/6G90dAhyL57ueqe7wOS82iVGf/H1WVGOSFC3hpw56UXfTHtwLFx6
         rEdYvS9pO3MEFlt1sFMmPyj62oe5b0onFN4MlPTYUWj0dKxs4GF9dEH06FloqpIKx5Gu
         7ruw==
X-Forwarded-Encrypted: i=1; AJvYcCV2QIsom0yQmuAuJesUzjhiHpLLkDBID8QDsTvNRwdMOJ5N4bMAsWOBcOkTZXYe469Kczhkrq23A4L0wmctJ6zk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/hn5sL9xePiVeXmKNQwVNBdw81D54JV2G+QFj3d7BdvPhyXwC
	T0mBlNmbZAnsg1dZ1jQ21n2xNXGAktYGKNY2t5QGQ3/dfOR18oDhFkKkVJZenIM=
X-Gm-Gg: ASbGncvvr0clyC1IQYx916V3V8j391eik+btn9Vuz/2mUVwJknNSudLFMhAsa+AXmfc
	izFtkW2dO/FfIUYZuKQb1oiXM/TJFBbdcEj3G83Lt/WLJqO6nMxnLFtjudsDiCm4sU4IcO4rCbI
	mnEWDL+HCpzcUlhvLW5kTv2txNtCeF6tsysDiDxhseA3lXgKmNlUDVnrKGSi82fqpUcz9MDK1KS
	tbxLj9HY/MzpHd66wj2UHAe7hjHkGHvL5ktB4rH0Wcv+x5fsPgC7Yf3PrOclvNEF+cSv7dKexlZ
	KO/wNE/G42xMRtaGw59VIb606/t0B47Dfy7B
X-Google-Smtp-Source: AGHT+IGHQO4fKXV4A6UUeSv9pwYWeECIbpOiy9USqHzKJoO5upSfChVq4x5/CdajiSuV1O+v4t+BjQ==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id 2adb3069b0e04-542295989femr10755627e87.52.1735882631424;
        Thu, 02 Jan 2025 21:37:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215c1sm3942084e87.206.2025.01.02.21.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:37:10 -0800 (PST)
Date: Fri, 3 Jan 2025 07:37:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <elhtblbv265iorfwagrdenkujrbufakqakgajkdmldcen3xrar@plu5h3jrfqmh>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
 <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
 <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_213713_625559_13EF897C 
X-CRM114-Status: GOOD (  33.83  )
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

On Fri, Jan 03, 2025 at 12:22:34AM +0100, Marek Vasut wrote:
> On 1/2/25 5:55 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > 
> > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > 
> > > Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> > > the oldest commit which adds HDMI support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Most follow up additions
> > > of HDMI support to another devices has been a variation of the same commit,
> > > including connector node, which is the proper way of eanbling HDMI on the
> > > i.MX8MP.
> > > 
> > > The rest should be covered by output_port_optional which should make systems
> > > with DTs without HDMI connector node work, but such DTs should be updated and
> > > the HDMI connector node should be added.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Liu Ying <victor.liu@nxp.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Robert Foss <rfoss@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2: No change
> > > V3: - Update commit message
> > >      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
> > >      - Enable output_port_optional
> > > ---
> > >   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
> > >   2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > > index 9a480c6abb856..db5c8a76193ac 100644
> > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >   	tristate "Freescale i.MX8MP HDMI-TX bridge support"
> > >   	depends on OF
> > >   	depends on COMMON_CLK
> > > +	select DRM_DISPLAY_CONNECTOR
> > 
> > I was going to write that it is not to be selected by anybody, but then
> > I stumbled upon meson driver, which also selects the symbol.
> > 
> > I still think that it is not to be selected by your driver as there is
> > no direct dependency (and there can be other bridges inbetween or the
> > bridge chain can end up with some other bridge). Such decisions belong
> > to defconfig or distribution's kernel config file.
> Wouldn't that only lead to unnecessary surprises on user side ?

This is of no concerns to Kconfig. You can't select all drivers that can
possibly be used with your platform / driver. `git grep
DRM_DISPLAY_CONNECTOR`.

-- 
With best wishes
Dmitry

