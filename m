Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA71E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=; b=GUUYSGD7uhrayCi8RFcOpnh/jM
	NcHhK7JvYlJtfB7vHt5LVfRViZCbp1oBatwTjHs8VZDe9gb0KihE/ihGLBJuK87gGbTTr6JswVthU
	6yfTuzfKzrgQl9xToB9IU9+A9/5qb6z8zD9ac4KGbxnteOBnUNQSJAKC7Tv1xjEqVOgQi4HxB03WP
	tO9XWKArNDUCT73FcQokKIHIaJZ/aXiAji1H20HX/gTQFJ/4yYL3m9XmRr5MTuxUbt6zBtc2dt+kr
	RWraO7ZwtGFI/8WX0r1VnpCax16IiFRwbHfRArg3f6k+4dC/71H9xVT7wYWrpnEYJpzExbcPN4OR8
	C1toWfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSG9j-00000005IXE-1Nf1;
	Mon, 30 Dec 2024 13:50:03 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSG8Y-00000005ITS-2LTZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 13:48:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so10011028e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735566529; x=1736171329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
        b=FhFO5/oeCVlG7lFO9l5H1QnM74G+mjRRSQb207aHh+k3iWjZBIGAVn7p+KTeZh6EIC
         22MonEkaW0m81xYMyVt49hKngVQAoj2n10Y1NRWzTrVd4vwyPPzWFKIcht5gZpNvzOdz
         qKmPedSazVIfZzdzEThRYxb3ytDHrO9zioKZtqoEJJi5UFMNc0COLhrjmARmhTptLbgN
         hfAMCDmwHWDUnHTgv8JthYX1IgHbMvqqE2PS/Hn/oKX1rV0UPCi9i61zDzwqfarRJBTs
         UUzf+tTyAsli1LfiI1GKM8zXYjhO9KV20bFvQeCMLqheAG/uPpUQMhNWkq4sLXJGGL1m
         4FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566529; x=1736171329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
        b=xDXKFd0CjZSaCVN5Fi23OMdwNZNwMQjibJQVb/lxBJBtwYLqn+svUI0tipeogpRHdf
         +iD8YeuRFoeox1X7REgaDZxwvQZcmjI/n7rPd7qBQYtR/IiGXazyXWAFvoeej+lfNSLa
         HdM3CG+BLuP8nR8Aa0HY4GxRKqwN81HhE+LcNw2MI+Uuo+ZNdYh3Znhi75R9KvT8L60+
         gYcTRZM4Pr2NLRmgWc2Qn/nPNyPZ4y5zTrz7jZDv46QJDwr4ezRp5aibh1Tz6+nJM5LR
         wTEs8olfSl49TWjFyYVyN7X/7EC1uxNPN5nKHPWEsgUP64wN3/zN7Awn4y4dGN4jI7O3
         MfUA==
X-Forwarded-Encrypted: i=1; AJvYcCVIk7Eki0zKCKjhZPKW2hPdmqp1RX+8pFbtiQABsgFcHYF3i+X36RbqYrwPg4PO8V3DbNBITkVPBFt8c6tPCQG9@lists.infradead.org
X-Gm-Message-State: AOJu0YyhUfUeP/vPeodBTNhojG1/9918Cz1ayeJXU2gzaMGNrcdfT8xe
	97W60TBxDvPV0m/e8oXr+7f+Y2+jvLilCR7sLUhOd8ENjNMa9XrXfA798iM0hCI=
X-Gm-Gg: ASbGncuFNtl/IV3166q9uswQw/Cy21JwR3n3KU4fphA+YmQkiRhBZy7Ev3JK7sx3bn7
	2PEDp5zVOdV3sQeqRYLYbG3aJ1Q22yOQ4qFTnxYXC67ShlV9nqJ8k5ESBkM2R5sQLT1SGmvvSp1
	+2ZOUw30iRPSr7vU2yMcpkpIRGHzv/cxMDnodhn0svXPvVCQRItVO3glwwiUMyfrnoiTcUYQOYb
	O/cfeb5ZjBbyThalloxYvovl+zGNQIEvrawsl9e8pR+kVI/k/+9YTQl3KiujUy7UhGtTnZeN07B
	SifLOGTXri5LwVRpYjuAZafl/zpKx7+jt2n4
X-Google-Smtp-Source: AGHT+IFz6vnKDsjYSCj71qMJRlNWygcgRvbZvMXcj/k0biLU+n2vHyB+qTqUo+a6PyxFg6r3rse+Tg==
X-Received: by 2002:a05:6512:ba5:b0:540:1ec7:ef57 with SMTP id 2adb3069b0e04-54229586f9emr9237438e87.56.1735566528611;
        Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238137cesm3129503e87.148.2024.12.30.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Date: Mon, 30 Dec 2024 15:48:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ying Liu <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <dc5apgdlj7ybujm7spadpxhilwdb3266x3xwok7blno4y6sp5m@4iwa7wiwkaof>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_054850_617178_5D5715A7 
X-CRM114-Status: GOOD (  36.25  )
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

On Mon, Dec 30, 2024 at 07:04:51AM +0000, Ying Liu wrote:
> On 12/26/2024, Marek Vasut wrote:
> > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > >> The dw-hdmi output_port is set to 1 in order to look for a connector
> > >> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > working.
> > >> The output_port set to 1 makes the DW HDMI driver core look up the
> > >> next bridge in DT, where the next bridge is often the hdmi-connector .
> > >>
> > >> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > >>
> > >> Signed-off-by: Marek Vasut <marex@denx.de>
> > >> ---
> > >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Fabio Estevam <festevam@gmail.com>
> > >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >> Cc: Jonas Karlman <jonas@kwiboo.se>
> > >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > >> Cc: Liu Ying <victor.liu@nxp.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > >> Cc: Robert Foss <rfoss@kernel.org>
> > >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > >> Cc: Shawn Guo <shawnguo@kernel.org>
> > >> Cc: Simona Vetter <simona@ffwll.ch>
> > >> Cc: Stefan Agner <stefan@agner.ch>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: imx@lists.linux.dev
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> ---
> > >> V2: No change
> > >> ---
> > >>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > >>   2 files changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> index 9a480c6abb856..d8e9fbf75edbb 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > >> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >>   config DRM_IMX8MP_HDMI_PVI
> > >>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > >>   	depends on OF
> > >> +	select DRM_DISPLAY_CONNECTOR
> > >>   	help
> > >>   	  Choose this to enable support for the internal HDMI TX Parallel
> > >>   	  Video Interface found on the Freescale i.MX8MP SoC.
> > >> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> index 1e7a789ec2890..4ebae5ad072ad 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > platform_device *pdev)
> > >>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > >>   	plat_data->priv_data = hdmi;
> > >>   	plat_data->phy_force_vendor = true;
> > >> +	plat_data->output_port = 1;
> > >
> > > Quoting my feedback to a similar Liu's patch:
> > >
> > > This will break compatibility with older DT files, which don't have
> > > output port. I think you need to add output_port_optional flag to
> > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > is set, but there is no remote node.
> > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > support is commit:
> > 
> > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > TQMa8MPxL/MBa8MPxL")
> > 
> > That already contains the HDMI connector node. Every follow up addition
> > of HDMI to another device has been a copy of the same commit, with
> > connector, so I think it is safe to say, no upstream DT is going to be
> > broken by this change. Do we care about hypothetical downstream DTs
> > which may be missing the connector ?
> 
> These have no HDMI connector nodes:
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts

Indeed. I should be less trustful.

Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

