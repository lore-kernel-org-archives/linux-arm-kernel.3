Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B60E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jUB4R2OgQuPDy2DiORHYI3Zbidn3DQRXHG3ZxiEftY=; b=twlqazDTVCEhn4hPVPKR3p0wAD
	6JSuAGbPLfIvAQC0k81c5bMR+Jg6oSs6G1Rql1b+srETIUfiokO0qFMLCKMa1wIECvjESWQEepPbF
	zBW6Hgzzn+PmJjhvLQoiyCpQE1n17wx3aEtF68u4YD0ANuWE4KQ1gGSLGiSYQ5te5r1h53dZjdMW5
	WbV4tD9tu3Ef2g3gZdeTYU4iQxHRp98t+CnN93KC16nKakr9juAaJ58DKBHJcFr/DDzD2hbqlDPTK
	H9/OPS8xcdr3RvO9pMhfKre6eNW6tB214lAYVILjCv8UzUzdFQQRMIHeY8v67dpgk0BkVBbuDnMtB
	XFEHKEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQux5-0000000GPdf-3moD;
	Thu, 26 Dec 2024 20:59:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuvt-0000000GPTX-0NNn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:58:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3022484d4e4so81708281fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 12:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735246691; x=1735851491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jUB4R2OgQuPDy2DiORHYI3Zbidn3DQRXHG3ZxiEftY=;
        b=pbvxW2e+tU8hOP7qYjHmGT+T53yyf2CI23yljTE20a2hHymY4ejai5oeTGEtpc5Sm6
         hDYNNKpR0G2sSkzPnoG4/FlwD6P+Hz7poCjufGLe3tLtWcx6tYTZ9wa86NDRkEMGCjwi
         AUMUmVqbOjOneLcWE6RCytd8XYQ03gvB1OkcGVRmLE+Ol3kl0Cs90e2C4ZRFjs+7y+8q
         XjcvCgfxecC8Me7u6B0W1Izpb8v2INPoPUrgvUEjJQKh5Sn/6EDVKB7uQ2BP3hjYMkkU
         qLYx/GF8eX5vAZmiSd+jKy920fsEarXnm4KRH2OrsIcGR2GbZ9HBAGsJtxRcPj6m5j0c
         iLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735246691; x=1735851491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jUB4R2OgQuPDy2DiORHYI3Zbidn3DQRXHG3ZxiEftY=;
        b=a3qZa7bukPeW2GJq0fl4VVzjFX8FenTZtxoZCsfU3BpI80RxcnLE0l7AfpVjr4i7Ap
         m+fSEwH831ePSClnBUfeUgMY1Sx64CI4s03hKasHHswr4Mk+6Hm0MYOQciJZ4BmbzawB
         ed0SqYmwTyOobHZ4Tm/ypRYS/t/XtUlSoNvtqfovqAPpYOiyaVhqHSuAapgha2IxM5hM
         PnJDsZknYNm8xtl0/EmsgZeUDc7/dT8GtovMe7r7r85hCwymUsM0xSRicJq2ArxIXxET
         locb3yOs3B33c7xlEkY6RlC6QKUexu+TfdHp8N5OlGNeP7ADHEVO4cYcUhZ7YxrDlUkE
         KHPA==
X-Forwarded-Encrypted: i=1; AJvYcCXQXj6kAYERy+iMTwzJlfT6fHqaU7cnG+OtyRz0OUwGipGcjo20VKoPiscdRzb9buRRsHfOX1hfUFJXITtAta43@lists.infradead.org
X-Gm-Message-State: AOJu0YwnimFE0jIO+q8pY2+VojQfN3qfAa9+XbQrO+IDLv/EgYQRpUW/
	BJ2+PQO74OoiZL/R8nksCWkrwLV/PTLDwJy89DR83zUh2vYXugrP3TrzaDVRySA=
X-Gm-Gg: ASbGncuYFO4MWPsyBPK7h1cstCH6gWiDIpF4O9bv643vKE1dXDfd44skpHlcVSwgNjV
	lbWjqzkJDtTpMilY+8P24W19vmNs5Lxc04inJwJBEWIWkMtrJ0v0MLpciPAb93rlbl5HH67/0h2
	3hQVs7oEqjch6dDBw6nD3AFRFuJmGVJf68bL3l0Ega19zNNOlqScdtRkg59CJpMijWU/WsPwMcf
	tV21NJnHmp8kwAp5aluwwr85i6DyJAuhcWzhjMMd0v9Oy2ZGYkbTKrsQUtx0QH1QG4fW67VlDKB
	gKhXPWQpSHQuVUBV6UgqT/FbiTDTdvwoJSiJ
X-Google-Smtp-Source: AGHT+IH9RJ8Nv+uSXlzQZRSWUI3tI0IDawGFvtix7DHTyV//L0ggmYGbFDj8jUvlw3VeFx2SGd8kHg==
X-Received: by 2002:a05:6512:1396:b0:540:c349:a80f with SMTP id 2adb3069b0e04-54229561adcmr8828170e87.38.1735246690707;
        Thu, 26 Dec 2024 12:58:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5423e0662e3sm744926e87.188.2024.12.26.12.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 12:58:09 -0800 (PST)
Date: Thu, 26 Dec 2024 22:58:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, 
	Oliver Brown <oliver.brown@nxp.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [EXT] Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Message-ID: <zrigjfyxzbc57ab3xm2m5gcjandsotcbmlgoc4ma7olz2iobqd@7cmsyinjw4xc>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
 <3ivd4mdmcb56mrgg2yo3rszksiusfkyxr3eycuw5kspczqcqse@4nub63fnrsur>
 <DB9PR04MB94528AAF7B7B60C48710CDFEF40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB94528AAF7B7B60C48710CDFEF40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_125813_203748_FB29C198 
X-CRM114-Status: GOOD (  44.15  )
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

On Wed, Dec 25, 2024 at 07:57:01AM +0000, Sandor Yu wrote:
> > 
> > On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> > > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> > MHDP8501
> > > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > > standards according embedded Firmware running in the uCPU.
> > >
> > > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> > > SOC's ROM code. Bootload binary included respective specific firmware
> > > is required.
> > >
> > > Driver will check display connector type and
> > > then load the corresponding driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > > v19->v20:
> > > - Dump mhdp FW version by debugfs
> > > - Combine HDMI and DP cable detect functions into one function
> > > - Combine HDMI and DP cable bridge_mode_valid() functions into one
> > function
> > > - Rename cdns_hdmi_reset_link() to cdns_hdmi_handle_hotplug()
> > > - Add comments for EDID in cdns_hdmi_handle_hotplug() and
> > cdns_dp_check_link_state()
> > > - Add atomic_get_input_bus_fmts() and bridge_atomic_check() for DP driver
> > > - Remove bpc and color_fmt init in atomic_enable() function.
> > > - More detail comments for DDC adapter only support
> > SCDC_I2C_SLAVE_ADDRESS
> > >   read and write in HDMI driver.
> > >
> > >
> > > v18->v19:
> > > - Get endpoint for data-lanes as it had move to endpoint of port@1
> > > - Update clock management as devm_clk_get_enabled() introduced.
> > > - Fix clear_infoframe() function is not work issue.
> > > - Manage PHY power state via phy_power_on() and phy_power_off().
> > >
> > > v17->v18:
> > > - MHDP8501 HDMI and DP commands that need access mailbox are
> > rewrited
> > >   with new API functions created in patch #1.
> > > - replace lane-mapping with data-lanes, use the value from data-lanes
> > >   to reorder HDMI and DP lane mapping.
> > > - create I2C adapter for HDMI SCDC, remove cdns_hdmi_scdc_write()
> > function.
> > > - Rewrite cdns_hdmi_sink_config() function, use HDMI SCDC helper function
> > >   drm_scdc_set_high_tmds_clock_ratio() and drm_scdc_set_scrambling()
> > >   to config HDMI sink TMDS.
> > > - Remove struct video_info from HDMI driver.
> > > - Remove tmds_char_rate_valid() be called in bridge_mode_valid(),
> > >   community had patch in reviewing to implement the function.
> > > - Remove warning message print when get unknown HPD cable status.
> > > - Add more detail comments for HDP plugin and plugout interrupt.
> > > - use dev_dbg to repleace DRM_INFO when cable HPD status changed.
> > > - Remove t-b tag as above code change.
> > >
> > >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> > >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> > >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 379 +++++++++
> > >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 380 +++++++++
> > >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 694
> > ++++++++++++++++
> > >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 745
> > ++++++++++++++++++
> > >  6 files changed, 2216 insertions(+)
> > >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> > >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > index dbb06533ccab2..bd979f3e6df48 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > @@ -48,3 +48,19 @@ config DRM_CDNS_MHDP8546_J721E
> > >         initializes the J721E Display Port and sets up the
> > >         clock and data muxes.
> > >  endif
> > > +
> > > +config DRM_CDNS_MHDP8501
> > > +     tristate "Cadence MHDP8501 DP/HDMI bridge"
> > > +     select DRM_KMS_HELPER
> > > +     select DRM_PANEL_BRIDGE
> > > +     select DRM_DISPLAY_DP_HELPER
> > > +     select DRM_DISPLAY_HELPER
> > > +     select DRM_CDNS_AUDIO
> > > +     select CDNS_MHDP_HELPER
> > > +     depends on OF
> > > +     help
> > > +       Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> > > +       Cadence MHDP8501 support one or more protocols,
> > > +       including DisplayPort and HDMI.
> > > +       To use the DP and HDMI drivers, their respective
> > > +       specific firmware is required.
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > b/drivers/gpu/drm/bridge/cadence/Makefile
> > > index c95fd5b81d137..ea327287d1c14 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > > @@ -5,3 +5,5 @@ cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=
> > cdns-dsi-j721e.o
> > >  obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
> > >  cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> > >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=
> > cdns-mhdp8546-j721e.o
> > > +obj-$(CONFIG_DRM_CDNS_MHDP8501) += cdns-mhdp8501.o
> > > +cdns-mhdp8501-y := cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> > cdns-mhdp8501-hdmi.o
> > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > new file mode 100644
> > > index 0000000000000..98116ef012fa3
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > > @@ -0,0 +1,379 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Cadence Display Port Interface (DP) driver
> > > + *
> > > + * Copyright (C) 2023-2024 NXP Semiconductor, Inc.
> > > + *
> > > + */
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_print.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/phy/phy.h>
> > > +
> > > +#include "cdns-mhdp8501-core.h"
> > > +
> > > +static ssize_t firmware_version_show(struct device *dev,
> > > +                                  struct device_attribute *attr,
> > char *buf);
> > > +static struct device_attribute firmware_version =
> > __ATTR_RO(firmware_version);
> > > +
> > > +ssize_t firmware_version_show(struct device *dev,
> > > +                           struct device_attribute *attr, char *buf)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = dev_get_drvdata(dev);
> > > +
> > > +     u32 version = readl(mhdp->base.regs + VER_L) |
> > readl(mhdp->base.regs + VER_H) << 8;
> > > +     u32 lib_version = readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> > > +                       readl(mhdp->base.regs + VER_LIB_H_ADDR)
> > << 8;
> > > +
> > > +     return sprintf(buf, "FW version %d, Lib version %d\n", version,
> > lib_version);
> > > +}
> > > +
> > > +static void cdns_mhdp8501_create_device_files(struct
> > cdns_mhdp8501_device *mhdp)
> > > +{
> > > +     if (device_create_file(mhdp->dev, &firmware_version)) {
> > > +             DRM_ERROR("Unable to create firmware_version
> > sysfs\n");
> > > +             device_remove_file(mhdp->dev, &firmware_version);
> > > +     }
> > > +}
> > > +
> > > +static void cdns_mhdp8501_remove_device_files(struct
> > cdns_mhdp8501_device *mhdp)
> > > +{
> > > +     device_remove_file(mhdp->dev, &firmware_version);
> > > +}
> > > +
> > > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> > *mhdp)
> > > +{
> > > +     u8 status;
> > > +     int ret;
> > > +
> > > +     ret = cdns_mhdp_mailbox_send_recv(&mhdp->base,
> > MB_MODULE_ID_GENERAL,
> > > +
> > GENERAL_GET_HPD_STATE,
> > > +                                       0, NULL, sizeof(status),
> > &status);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "read hpd failed: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return status;
> > > +}
> > > +
> > > +enum drm_connector_status cdns_mhdp8501_detect(struct drm_bridge
> > *bridge)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +
> > > +     u8 hpd = 0xf;
> > > +
> > > +     hpd = cdns_mhdp8501_read_hpd(mhdp);
> > > +     if (hpd == 1)
> > > +             return connector_status_connected;
> > > +     else if (hpd == 0)
> > > +             return connector_status_disconnected;
> > > +
> > > +     return connector_status_unknown;
> > > +}
> > > +
> > > +enum drm_mode_status
> > > +cdns_mhdp8501_mode_valid(struct drm_bridge *bridge,
> > > +                      const struct drm_display_info *info,
> > > +                      const struct drm_display_mode *mode)
> > > +{
> > > +     /* We don't support double-clocked */
> > > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> > > +             return MODE_BAD;
> > > +
> > > +     /* MAX support pixel clock rate 594MHz */
> > > +     if (mode->clock > 594000)
> > > +             return MODE_CLOCK_HIGH;
> > > +
> > > +     if (mode->hdisplay > 3840)
> > > +             return MODE_BAD_HVALUE;
> > > +
> > > +     if (mode->vdisplay > 2160)
> > > +             return MODE_BAD_VVALUE;
> > > +
> > > +     return MODE_OK;
> > > +}
> > > +
> > > +static void hotplug_work_func(struct work_struct *work)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = container_of(work,
> > > +                                                  struct
> > cdns_mhdp8501_device,
> > > +
> > hotplug_work.work);
> > > +     enum drm_connector_status status =
> > cdns_mhdp8501_detect(&mhdp->bridge);
> > > +
> > > +     drm_bridge_hpd_notify(&mhdp->bridge, status);
> > > +
> > > +     /*
> > > +      * iMX8MQ has two HPD interrupts: one for plugout and one for
> > plugin.
> > > +      * These interrupts cannot be masked and cleaned, so we must
> > enable one
> > > +      * and disable the other to avoid continuous interrupt generation.
> > > +      */
> > > +     if (status == connector_status_connected) {
> > > +             /* Cable connected  */
> > > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug In\n");
> > > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > > +
> > > +             /* Reset HDMI/DP link with sink */
> > > +             if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_HDMIA)
> > > +                     cdns_hdmi_handle_hotplug(mhdp);
> > > +             else
> > > +                     cdns_dp_check_link_state(mhdp);
> > > +
> > > +     } else if (status == connector_status_disconnected) {
> > > +             /* Cable Disconnected  */
> > > +             dev_dbg(mhdp->dev, "HDMI/DP Cable Plug Out\n");
> > > +             enable_irq(mhdp->irq[IRQ_IN]);
> > > +     }
> > > +}
> > > +
> > > +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = data;
> > > +
> > > +     disable_irq_nosync(irq);
> > > +
> > > +     mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > > +                      msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > > +
> > > +     return IRQ_HANDLED;
> > > +}
> > > +
> > > +#define DATA_LANES_COUNT     4
> > > +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device
> > *mhdp,
> > > +                               struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct device_node *np = dev->of_node;
> > > +     struct device_node *remote, *endpoint;
> > > +     u32 data_lanes[DATA_LANES_COUNT];
> > > +     u32 lane_value;
> > > +     int ret, i;
> > > +
> > > +     remote = of_graph_get_remote_node(np, 1, 0);
> > > +     if (!remote) {
> > > +             dev_err(dev, "fail to get remote node\n");
> > > +             of_node_put(remote);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     /* get connector type */
> > > +     if (of_device_is_compatible(remote, "hdmi-connector")) {
> > > +             mhdp->connector_type =
> > DRM_MODE_CONNECTOR_HDMIA;
> > > +
> > > +     } else if (of_device_is_compatible(remote, "dp-connector")) {
> > > +             mhdp->connector_type =
> > DRM_MODE_CONNECTOR_DisplayPort;
> > 
> > Interesting hack. What if somebody wraps DP signals with the USB-C
> > controller in order to provide DP over USB-C?
> 
> There is no such requirement now, and the supported types of display-connectors do not include Type-C DP connectors. 
> If type-C DP connectors is added in the future, I think it would be acceptable to modify the code here.

It would be acceptable, but it most likely will also require chaning the
DT bindings as there is no longer an easy way to identify the next
bridge. Also you might not have that now, but it is pretty common to
have DP retimers on the board in order to improve the sinal integrity.
Thus I think it is not a proper solution to check the next node's
compatible. I think we need a way to specify HDMI vs DP firmware / mode
in the device tree.

> 
> > 
> > Unfortunately I don't have a good solution here. There might be other
> > format converters after your bridge, so you even can't look at the last
> > bridge of the chain. You might want to examine the phy-mode property and
> > use it to specify whether the PHY should work in the HDMI or in the DP
> > mode.
> 
> MHDP supports either HDMI or DP based on its firmware. 
> The PHY doesn't provide a function to indicate which firmware is currently running, 
> and the controller driver doesn't have a mechanism to determine whether it's DP or HDMI. 
> The users should select the corresponding firmware based on the connector type when their get the board.
> 
> For the driver, there must be an external input to determine whether it's currently running in HDMI or DP mode. 
> In earlier versions, I used different compatible strings to distinguish between DP and HDMI. 
> However, based on comments from other reviewers, 
> I changed the approach to checking the connector type, which is clearly a more suitable method.
> 
> > 
> > Also, where do get the next bridge and attach it to the bridge chain?
> 
> next_bridge get and attach is missed in the driver, I will add it.
> 
> > 
> > > +
> > > +     } else {
> > > +             dev_err(dev, "Unknown connector type\n");
> > > +             of_node_put(remote);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     of_node_put(remote);
> > > +
> > > +     endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> > > +
> > > +     /* Get the data lanes ordering */
> > > +     ret = of_property_count_u32_elems(endpoint, "data-lanes");
> > > +     if (ret < 0)
> > > +             return  -EINVAL;
> > > +     if (ret != DATA_LANES_COUNT) {
> > > +             dev_err(dev, "expected 4 data lanes\n");
> > > +             return  -EINVAL;
> > > +     }
> > 
> > Isn't it drm_of_get_data_lanes_count_ep()?
> 
> drm_of_get_data_lanes_count will be used here in the next version.
> 
> > 
> > > +
> > > +     ret = of_property_read_u32_array(endpoint, "data-lanes",
> > > +                                      data_lanes,
> > DATA_LANES_COUNT);
> > > +     if (ret)
> > > +             return  -EINVAL;
> > > +
> > > +     mhdp->lane_mapping  = 0;
> > > +     for (i = 0; i < DATA_LANES_COUNT; i++) {
> > > +             lane_value = (data_lanes[i] >= 0 && data_lanes[i] <= 3) ?
> > data_lanes[i] : 0;
> > > +             mhdp->lane_mapping |= lane_value << (i * 2);
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +static int cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device
> > *mhdp)
> > > +{
> > > +     mhdp->bridge.type = mhdp->connector_type;
> > > +     mhdp->bridge.driver_private = mhdp;
> > > +     mhdp->bridge.of_node = mhdp->dev->of_node;
> > > +     mhdp->bridge.vendor = "NXP";
> > > +     mhdp->bridge.product = "i.MX8";
> > > +     mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > DRM_BRIDGE_OP_EDID |
> > > +                        DRM_BRIDGE_OP_HPD;
> > > +
> > > +     if (mhdp->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> > > +             mhdp->bridge.funcs = &cdns_hdmi_bridge_funcs;
> > > +             mhdp->bridge.ops |= DRM_BRIDGE_OP_HDMI;
> > > +             mhdp->bridge.ddc = cdns_hdmi_i2c_adapter(mhdp);
> > 
> > I'd expect that bridge.ddc provides DDC service. Is it required to
> > control the SCDC from userspace?
> 
> I may not have fully understood your question. 
> The DDC here is used for the SCDC API functions like drm_scdc_set_XXX in HDMI driver.
> So far, I haven't encountered any cases where the user needs to control SCDC.

Okay.

> 
> > 
> > > +     } else if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_DisplayPort) {
> > > +             mhdp->bridge.funcs = &cdns_dp_bridge_funcs;
> > > +     } else {
> > > +             dev_err(mhdp->dev, "Unsupported connector type!\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     drm_bridge_add(&mhdp->bridge);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int cdns_mhdp8501_probe(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct cdns_mhdp8501_device *mhdp;
> > > +     struct resource *res;
> > > +     enum phy_mode phy_mode;
> > > +     u32 reg;
> > > +     int ret;
> > > +
> > > +     mhdp = devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> > > +     if (!mhdp)
> > > +             return -ENOMEM;
> > > +
> > > +     mhdp->dev = dev;
> > > +
> > > +     INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> > > +
> > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +     if (!res)
> > > +             return -ENODEV;
> > > +
> > > +     mhdp->regs = devm_ioremap(dev, res->start, resource_size(res));
> > > +     if (IS_ERR(mhdp->regs))
> > > +             return PTR_ERR(mhdp->regs);
> > > +
> > > +     cdns_mhdp8501_create_device_files(mhdp);
> > > +
> > > +     ret = cdns_mhdp8501_dt_parse(mhdp, pdev);
> > > +     if (ret < 0)
> > > +             return -EINVAL;
> > > +
> > > +     mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node,
> > 0);
> > > +     if (IS_ERR(mhdp->phy))
> > > +             return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no PHY
> > configured\n");
> > > +
> > > +     mhdp->irq[IRQ_IN] = platform_get_irq_byname(pdev, "plug_in");
> > > +     if (mhdp->irq[IRQ_IN] < 0)
> > > +             return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No
> > plug_in irq number\n");
> > > +
> > > +     mhdp->irq[IRQ_OUT] = platform_get_irq_byname(pdev,
> > "plug_out");
> > > +     if (mhdp->irq[IRQ_OUT] < 0)
> > > +             return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No
> > plug_out irq number\n");
> > > +
> > > +     irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
> > > +     ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> > > +                                     NULL,
> > cdns_mhdp8501_irq_thread,
> > > +                                     IRQF_ONESHOT,
> > dev_name(dev), mhdp);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
> > > +     ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> > > +                                     NULL,
> > cdns_mhdp8501_irq_thread,
> > > +                                     IRQF_ONESHOT,
> > dev_name(dev), mhdp);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "can't claim irq %d\n",
> > mhdp->irq[IRQ_OUT]);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     /* cdns_mhdp8501_dt_parse() ensures connector_type is valid */
> > > +     if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_DisplayPort)
> > > +             phy_mode = PHY_MODE_DP;
> > > +     else if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_HDMIA)
> > > +             phy_mode = PHY_MODE_HDMI;
> > > +
> > > +     dev_set_drvdata(dev, mhdp);
> > > +
> > > +     /* init base struct for access mhdp mailbox */
> > > +     mhdp->base.dev = mhdp->dev;
> > > +     mhdp->base.regs = mhdp->regs;
> > > +
> > > +     if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_DisplayPort) {
> > > +             drm_dp_aux_init(&mhdp->dp.aux);
> > > +             mhdp->dp.aux.name = "mhdp8501_dp_aux";
> > > +             mhdp->dp.aux.dev = dev;
> > > +             mhdp->dp.aux.transfer = cdns_dp_aux_transfer;
> > > +     }
> > > +
> > > +     /* Enable APB clock */
> > > +     mhdp->apb_clk = devm_clk_get_enabled(dev, NULL);
> > > +     if (IS_ERR(mhdp->apb_clk))
> > > +             return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk),
> > > +                                  "couldn't get apb clk\n");
> > > +     /*
> > > +      * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > > +      * Updated each sched "tick" (~2ms)
> > > +      */
> > > +     ret = readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> > > +                              reg & CDNS_KEEP_ALIVE_MASK,
> > 500,
> > > +                              CDNS_KEEP_ALIVE_TIMEOUT);
> > > +     if (ret) {
> > > +             dev_err(dev, "device didn't give any life sign: reg %d\n",
> > reg);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = phy_init(mhdp->phy);
> > > +     if (ret) {
> > > +             dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = phy_set_mode(mhdp->phy, phy_mode);
> > > +     if (ret) {
> > > +             dev_err(dev, "Failed to configure PHY: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Enable cable hotplug detect */
> > > +     if (cdns_mhdp8501_read_hpd(mhdp))
> > > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > > +     else
> > > +             enable_irq(mhdp->irq[IRQ_IN]);
> > > +
> > > +     return cdns_mhdp8501_add_bridge(mhdp);
> > > +}
> > > +
> > > +static void cdns_mhdp8501_remove(struct platform_device *pdev)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp =
> > platform_get_drvdata(pdev);
> > > +
> > > +     cdns_mhdp8501_remove_device_files(mhdp);
> > > +
> > > +     if (mhdp->connector_type ==
> > DRM_MODE_CONNECTOR_DisplayPort)
> > > +             cdns_dp_aux_destroy(mhdp);
> > > +
> > > +     drm_bridge_remove(&mhdp->bridge);
> > > +}
> > > +
> > > +static const struct of_device_id cdns_mhdp8501_dt_ids[] = {
> > > +     { .compatible = "fsl,imx8mq-mhdp8501",
> > > +     },
> > 
> > Strange line wrapping, I'd say. Either it should all be on the same
> > line, or take three lines.
> 
> I will fix it.
> 
> > 
> > > +     { },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, cdns_mhdp8501_dt_ids);
> > > +
> > > +static struct platform_driver cdns_mhdp8501_driver = {
> > > +     .probe = cdns_mhdp8501_probe,
> > > +     .remove = cdns_mhdp8501_remove,
> > > +     .driver = {
> > > +             .name = "cdns-mhdp8501",
> > > +             .of_match_table = cdns_mhdp8501_dt_ids,
> > > +     },
> > > +};
> > > +
> > > +module_platform_driver(cdns_mhdp8501_driver);
> > > +
> > > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > > +MODULE_DESCRIPTION("Cadence MHDP8501 bridge driver");
> > > +MODULE_LICENSE("GPL");
> 
> 
> > > +static void cdns_dp_mode_set(struct cdns_mhdp8501_device *mhdp,
> > > +                          const struct drm_display_mode *mode)
> > > +{
> > > +     union phy_configure_opts phy_cfg;
> > > +     int ret;
> > > +
> > > +     cdns_dp_pixel_clk_reset(mhdp);
> > > +
> > > +     /* Get DP Caps  */
> > > +     ret = drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV,
> > mhdp->dp.dpcd,
> > > +                            DP_RECEIVER_CAP_SIZE);
> > > +     if (ret < 0) {
> > > +             dev_err(mhdp->dev, "Failed to get caps %d\n", ret);
> > > +             return;
> > > +     }
> > > +
> > > +     mhdp->dp.rate = drm_dp_max_link_rate(mhdp->dp.dpcd);
> > > +     mhdp->dp.num_lanes = drm_dp_max_lane_count(mhdp->dp.dpcd);
> > > +
> > > +     /* check the max link rate */
> > > +     if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> > > +             mhdp->dp.rate = CDNS_DP_MAX_LINK_RATE;
> > > +
> > > +     phy_cfg.dp.lanes = mhdp->dp.num_lanes;
> > > +     phy_cfg.dp.link_rate = mhdp->dp.rate;
> > > +     phy_cfg.dp.set_lanes = false;
> > > +     phy_cfg.dp.set_rate = false;
> > > +     phy_cfg.dp.set_voltages = false;
> > 
> > If all of those are false, then you can skip setting .lanes and
> > .link_rate.
> 
> I may have misunderstood the comments in the header file for these two flags. 
> I'll check them again.
> 
> > 
> > > +
> > > +     ret = phy_configure(mhdp->phy, &phy_cfg);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > > +                     __func__, ret);
> > > +             return;
> > > +     }
> > > +
> > > +     /* Video off */
> > > +     ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> > > +             return;
> > > +     }
> > > +
> > > +     /* Line swapping */
> > > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000
> > | mhdp->lane_mapping);
> > > +
> > > +     /* Set DP host capability */
> > > +     ret = cdns_dp_set_host_cap(mhdp);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "Failed to set host cap %d\n", ret);
> > > +             return;
> > > +     }
> > > +
> > > +     ret = cdns_mhdp_reg_write(&mhdp->base,
> > DP_AUX_SWAP_INVERSION_CONTROL,
> > > +                               AUX_HOST_INVERT);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "Failed to set host invert %d\n", ret);
> > > +             return;
> > > +     }
> > > +
> > > +     ret = cdns_dp_config_video(mhdp, mode);
> > > +     if (ret)
> > > +             dev_err(mhdp->dev, "Failed to config video %d\n", ret);
> > > +}
> > > +
> > > +static bool
> > > +cdns_dp_needs_link_retrain(struct cdns_mhdp8501_device *mhdp)
> > > +{
> > > +     u8 link_status[DP_LINK_STATUS_SIZE];
> > > +
> > > +     if (drm_dp_dpcd_read_phy_link_status(&mhdp->dp.aux,
> > DP_PHY_DPRX,
> > > +                                          link_status) < 0)
> > > +             return false;
> > > +
> > > +     /* Retrain if link not ok */
> > > +     return !drm_dp_channel_eq_ok(link_status, mhdp->dp.num_lanes);
> > > +}
> > > +
> > > +void cdns_dp_check_link_state(struct cdns_mhdp8501_device *mhdp)
> > > +{
> > > +     struct drm_connector *connector = mhdp->curr_conn;
> > > +     const struct drm_edid *drm_edid;
> > > +     struct drm_connector_state *conn_state;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_crtc *crtc;
> > > +
> > > +     if (!connector)
> > > +             return;
> > > +
> > > +     /*
> > > +      * EDID data needs updating after each cable plugin
> > > +      * due to potential display monitor changes
> > > +      */
> > > +     drm_edid = drm_edid_read_custom(connector,
> > cdns_dp_get_edid_block, mhdp);
> > > +     drm_edid_connector_update(connector, drm_edid);
> > > +
> > > +     if (!drm_edid)
> > > +             return;
> > > +
> > > +     drm_edid_free(drm_edid);
> > > +
> > > +     conn_state = connector->state;
> > > +     crtc = conn_state->crtc;
> > > +     if (!crtc)
> > > +             return;
> > > +
> > > +     crtc_state = crtc->state;
> > > +     if (!crtc_state->active)
> > > +             return;
> > > +
> > > +     if (!cdns_dp_needs_link_retrain(mhdp))
> > > +             return;
> > > +
> > > +     /* DP link retrain */
> > > +     if (cdns_dp_train_link(mhdp))
> > > +             dev_err(mhdp->dev, "Failed link train\n");
> > 
> > Won't this cause link traning to happen on the first monitor plug event?
> > Is it okay to do even with the phy being powered off?
> 
> These two cases have already been excluded in the previous codes. 
> 
> > 
> > > +}
> > > +
> > > +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> > > +                              enum drm_bridge_attach_flags flags)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +
> > > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +             dev_err(mhdp->dev, "do not support creating a
> > drm_connector\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     mhdp->dp.aux.drm_dev = bridge->dev;
> > > +
> > > +     return drm_dp_aux_register(&mhdp->dp.aux);
> > 
> > Why is it a part of the _attach callback? If there is anything on the DP
> > AUX bus, it should be already registered by this point.
> 
> Here, I've referenced other DP drivers and called drm_dp_aux_register in the attach function.
> No any special requirements for AUX in my DP driver.

Oh, because it's DP, without eDP functionality. Okay.

> 
> > 
> > > +}
> > > +
> > > +static const struct drm_edid
> > > +*cdns_dp_bridge_edid_read(struct drm_bridge *bridge,
> > > +                       struct drm_connector *connector)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +
> > > +     return drm_edid_read_custom(connector, cdns_dp_get_edid_block,
> > mhdp);
> > > +}
> > > +
> > > +/* Currently supported format */
> > > +static const u32 mhdp8501_input_fmts[] = {
> > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > +     MEDIA_BUS_FMT_RGB101010_1X30,
> > > +};
> > > +
> > > +static u32 *cdns_dp_bridge_atomic_get_input_bus_fmts(struct
> > drm_bridge *bridge,
> > > +                                                  struct
> > drm_bridge_state *bridge_state,
> > > +                                                  struct
> > drm_crtc_state *crtc_state,
> > > +                                                  struct
> > drm_connector_state *conn_state,
> > > +                                                  u32
> > output_fmt,
> > > +                                                  unsigned int
> > *num_input_fmts)
> > > +{
> > > +     u32 *input_fmts;
> > > +
> > > +     *num_input_fmts = 0;
> > > +
> > > +     input_fmts = kcalloc(ARRAY_SIZE(mhdp8501_input_fmts),
> > > +                          sizeof(*input_fmts),
> > > +                          GFP_KERNEL);
> > > +     if (!input_fmts)
> > > +             return NULL;
> > > +
> > > +     *num_input_fmts = ARRAY_SIZE(mhdp8501_input_fmts);
> > > +     memcpy(input_fmts, mhdp8501_input_fmts,
> > sizeof(mhdp8501_input_fmts));
> > > +
> > > +     return input_fmts;
> > > +}
> > > +
> > > +static int cdns_dp_bridge_atomic_check(struct drm_bridge *bridge,
> > > +                                    struct drm_bridge_state
> > *bridge_state,
> > > +                                    struct drm_crtc_state
> > *crtc_state,
> > > +                                    struct drm_connector_state
> > *conn_state)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +     struct video_info *video = &mhdp->video_info;
> > > +
> > > +     if (bridge_state->input_bus_cfg.format ==
> > MEDIA_BUS_FMT_RGB888_1X24) {
> > > +             video->bpc = 8;
> > > +             video->color_fmt = DRM_COLOR_FORMAT_RGB444;
> > > +     } else if (bridge_state->input_bus_cfg.format ==
> > MEDIA_BUS_FMT_RGB101010_1X30) {
> > > +             video->bpc = 10;
> > > +             video->color_fmt = DRM_COLOR_FORMAT_RGB444;
> > 
> > Which driver is going to select bus config for you?
> 
> Oh, actually there isn't. The driver uses the first format in mhdp8501_input_fmts.

So, is this a dead code to be dropped?

> 
> > 
> > > +     } else {
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> > > +                                       struct drm_bridge_state
> > *old_state)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +
> > > +     cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > > +     mhdp->curr_conn = NULL;
> > > +
> > > +     phy_power_off(mhdp->phy);
> > > +}
> > > +
> > > +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                      struct drm_bridge_state
> > *old_state)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> > > +     struct drm_atomic_state *state = old_state->base.state;
> > > +     struct drm_connector *connector;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_connector_state *conn_state;
> > > +     int ret;
> > > +
> > > +     connector = drm_atomic_get_new_connector_for_encoder(state,
> > > +
> > bridge->encoder);
> > > +     if (WARN_ON(!connector))
> > > +             return;
> > > +
> > > +     mhdp->curr_conn = connector;
> > > +
> > > +     conn_state = drm_atomic_get_new_connector_state(state,
> > connector);
> > > +     if (WARN_ON(!conn_state))
> > > +             return;
> > > +
> > > +     crtc_state = drm_atomic_get_new_crtc_state(state,
> > conn_state->crtc);
> > > +     if (WARN_ON(!crtc_state))
> > > +             return;
> > > +
> > > +     cdns_dp_mode_set(mhdp, &crtc_state->adjusted_mode);
> > > +
> > > +     /* Power up PHY before link training */
> > > +     phy_power_on(mhdp->phy);
> > > +
> > > +     /* Link training */
> > > +     ret = cdns_dp_train_link(mhdp);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "Failed link train %d\n", ret);
> > > +             return;
> > > +     }
> > > +
> > > +     ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
> > > +     if (ret) {
> > > +             dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> > > +             return;
> > > +     }
> > > +}
> > > +
> > > +const struct drm_bridge_funcs cdns_dp_bridge_funcs = {
> > > +     .attach = cdns_dp_bridge_attach,
> > > +     .detect = cdns_mhdp8501_detect,
> > > +     .edid_read = cdns_dp_bridge_edid_read,
> > > +     .mode_valid = cdns_mhdp8501_mode_valid,
> > > +     .atomic_enable = cdns_dp_bridge_atomic_enable,
> > > +     .atomic_disable = cdns_dp_bridge_atomic_disable,
> > > +     .atomic_get_input_bus_fmts =
> > cdns_dp_bridge_atomic_get_input_bus_fmts,
> > > +     .atomic_check = cdns_dp_bridge_atomic_check,
> > > +     .atomic_duplicate_state =
> > drm_atomic_helper_bridge_duplicate_state,
> > > +     .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > > +     .atomic_reset = drm_atomic_helper_bridge_reset,
> > > +};
> > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > new file mode 100644
> > > index 0000000000000..9556d0929e21d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > @@ -0,0 +1,745 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Cadence MHDP8501 HDMI bridge driver
> > > + *
> > > + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> > > + *
> > > + */
> > > +#include <drm/display/drm_hdmi_helper.h>
> > > +#include <drm/display/drm_hdmi_state_helper.h>
> > > +#include <drm/display/drm_scdc_helper.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_edid.h>
> > > +#include <drm/drm_print.h>
> > > +#include <linux/phy/phy.h>
> > > +#include <linux/phy/phy-hdmi.h>
> > > +
> > > +#include "cdns-mhdp8501-core.h"
> > > +
> > > +/**
> > > + * cdns_hdmi_config_infoframe() - fill the HDMI infoframe
> > > + * @mhdp: phandle to mhdp device.
> > > + * @entry_id: The packet memory address in which the data is written.
> > > + * @len: length of infoframe.
> > > + * @buf: point to InfoFrame Packet.
> > > + * @type: Packet Type of InfoFrame in HDMI Specification.
> > > + *
> > > + */
> > > +
> > > +static void cdns_hdmi_clear_infoframe(struct cdns_mhdp8501_device
> > *mhdp,
> > > +                                   u8 entry_id, u8 type)
> > > +{
> > > +     u32 val;
> > > +
> > > +     /* invalidate entry */
> > > +     val = F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id) |
> > > +           F_PACKET_TYPE(type);
> > > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> > SOURCE_PIF_PKT_ALLOC_WR_EN);
> > > +}
> > > +
> > > +static void cdns_hdmi_config_infoframe(struct cdns_mhdp8501_device
> > *mhdp,
> > > +                                    u8 entry_id, u8 len,
> > > +                                    const u8 *buf, u8 type)
> > > +{
> > > +     u8 packet[32], packet_len = 32;
> > > +     u32 packet32, len32;
> > > +     u32 val, i;
> > > +
> > > +     /*
> > > +      * only support 32 bytes now
> > > +      * packet[0] = 0
> > > +      * packet[1-3] = HB[0-2]  InfoFrame Packet Header
> > > +      * packet[4-31 = PB[0-27] InfoFrame Packet Contents
> > > +      */
> > > +     if (len >= (packet_len - 1))
> > > +             return;
> > > +     packet[0] = 0;
> > > +     memcpy(packet + 1, buf, len);
> > > +
> > > +     cdns_hdmi_clear_infoframe(mhdp, entry_id, type);
> > > +
> > > +     /* flush fifo 1 */
> > > +     writel(F_FIFO1_FLUSH(1), mhdp->regs +
> > SOURCE_PIF_FIFO1_FLUSH);
> > > +
> > > +     /* write packet into memory */
> > > +     len32 = packet_len / 4;
> > > +     for (i = 0; i < len32; i++) {
> > > +             packet32 = get_unaligned_le32(packet + 4 * i);
> > > +             writel(F_DATA_WR(packet32), mhdp->regs +
> > SOURCE_PIF_DATA_WR);
> > > +     }
> > > +
> > > +     /* write entry id */
> > > +     writel(F_WR_ADDR(entry_id), mhdp->regs +
> > SOURCE_PIF_WR_ADDR);
> > > +
> > > +     /* write request */
> > > +     writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
> > > +
> > > +     /* update entry */
> > > +     val = F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
> > > +           F_PACKET_TYPE(type) | F_PKT_ALLOC_ADDRESS(entry_id);
> > > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > > +
> > > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> > SOURCE_PIF_PKT_ALLOC_WR_EN);
> > > +}
> > > +
> > > +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> > > +                                 u32 block, size_t length)
> > > +{
> > > +     struct cdns_mhdp8501_device *mhdp = data;
> > > +     u8 msg[2], reg[5], i;
> > > +     int ret;
> > > +
> > > +     for (i = 0; i < 4; i++) {
> > > +             msg[0] = block / 2;
> > > +             msg[1] = block % 2;
> > > +
> > > +             ret =
> > cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> > > +
> > MB_MODULE_ID_HDMI_TX,
> > > +
> > HDMI_TX_EDID,
> > > +
> > sizeof(msg), msg,
> > > +
> > HDMI_TX_EDID,
> > > +
> > sizeof(reg), reg,
> > > +                                                     length,
> > edid);
> > > +
> > > +             if (ret)
> > > +                     continue;
> > 
> > Ignoring the error?
> 
> Yes. EDID read operations can be interrupted by various factors, 
> but as long as the EDID is eventually read successfully, there's no issue.

Okay... I'd still suggest a drm_dbg_dp() here.


-- 
With best wishes
Dmitry

