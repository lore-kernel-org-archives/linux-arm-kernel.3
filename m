Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC28E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=; b=RoJVZ+VO8cTjWkC31ViyqWwFyB
	kXIr9nxBi1qO+UtHxFKyPoUrfBwpRQKpuFi2JNFle03VaUmFaOHQKYgno8NjWtEZu4VXoGQ+0n0/W
	W8yC3GnUM5gC6JOO1GVRzrYGxLivK7aNYPpKMx4PuvolpH+iMf0Hu5Uwcah72nouPILrv/nlLc/DC
	ToZc1YniDXAKNuYvzF8VFGirBCGXcp07nZEnZrcM+9zKse0rMzNPxcpE7xXErcIlTrI0jvU4Fzhbp
	rGRZVg2DaE90RDoGLnLvz2hsl/Y3sHMqxAbaosiQ/ymmwd6aO2kmY+QDKEwQeeQRPKZjKYOuHZloa
	4hsZP7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSPVv-000000068LF-1rqm;
	Mon, 30 Dec 2024 23:49:35 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSPUj-000000068Ik-0PYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 23:48:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df80eeeedso9631154e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 15:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735602499; x=1736207299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
        b=OgX0lIGiuvRkerPnYOHvSQsiRAaAaxzkOUYWuZ5shVyl/3KOUwmS5VmZ3Ay8lY1eab
         5Kbx+nwDuATHMzMtVBY/T7JPfHsTlvtvtZB0w0+QTES//gaAiB9oqxwkshmbCRUJ1r4l
         qZkMD4E/Xyf7zyXF8rOC1STPTSDcHqseUrxc4niiaYzuH6J197DoCzPBHk5TNhgiUVQ2
         2BPfkEcba7QQQKsaHqXOIZiWITtOr0ev6Bb/EK0oO4YFT6MsHWy+eDcPXqHcf+XZ6AH+
         1D/VjLIAqHJkCjExaeWDN7EJlpIcBTTl8X8Zz0qHGXtYyZHU9K6zVYvFghxlBTsxkIMI
         hASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735602499; x=1736207299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
        b=KvC8WHehghdWFqEp7DuIWYjJGCf7a++RJw6ACL1dc9FYjVqBWbKoapOSr/Pah3oOAz
         dowC7xF2zBKZlW/RLUSIZ8Tvt8tSlBOyEE4k9ZpnV64BXF1k2KkH6btBWDF4iovmTME4
         FZ/kQnhQeqxjZ0YRnOzOCh0aN5EKT3vaqFlpRj8g4LZyZ5V4fhqeYmNsLu6fyFkShcF/
         DCjaJl9GcAkJK+MiDdgz/IYGX60rASPEXL8SY/qO0EcxpmfEi4Vmg0VXG8dTHoZ+WDbV
         BTu2gUZ6xXuFRd9c4nUZbtfBrf5Kx3xRCvnZPhrnipRB7+QUE6IhFEw7T0iQSEL6FwYI
         wQEA==
X-Forwarded-Encrypted: i=1; AJvYcCUC11FZDpnSc6rX5zs2Zl9PXpFllESHgYoP0AI1o2OfSgBYua/P2U5LUuREf+9G5dylOANVlqBNJaIG0MsKocQS@lists.infradead.org
X-Gm-Message-State: AOJu0YxkhnW/ogtsO1ZqTRiKAdJsd/+DSzL9AJs2IeELQSj7MqzZ0mCq
	NEjKATT7Gyf7zC+aNjq/q6EMxbdi563hIvXlCxU7WjcAdtJyMgfgiry2UC1Libc=
X-Gm-Gg: ASbGncuCVKEp9nNwXbyRgavRn3nvRx9dyLPQsYjlDvjWQqaiDcYT1A7loLhrBaP+2mn
	Ach6sWWNxaSXwTywlgGvUtBYgA2cR1/COqeh51Su6JXR6kL3kJAoLhrRPlbjjzuJdG+avyudlZV
	QOwv0YM/BzB37QP9zls+Lp1YSzBiQgn1uuerfdLjhBWqgsjEy67uTYWHSfUOozNeH4D9/ACarkR
	Cw99H7KNzsC2XG1WMRuk7DO8jxnEqtltN5P8o2Ctdl/Ru70qEKb2wQ4g9aYb5nLi7kB8YHCgyxl
	5n3eODqz3cClbSUEYEICVU/bsiJiPMwVefZA
X-Google-Smtp-Source: AGHT+IEeHkfQLid0m43pDVugqz/D47PZrbPya309ylG+zd7c0WjADbMWKNB1PQntPAXc5YF0mYnAwg==
X-Received: by 2002:a05:6512:2387:b0:542:2e04:edb4 with SMTP id 2adb3069b0e04-5422e04f19fmr8697797e87.13.1735602498829;
        Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236001d6sm3295240e87.85.2024.12.30.15.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Date: Tue, 31 Dec 2024 01:48:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Ying Liu <victor.liu@nxp.com>, 
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
Message-ID: <z5so7ce7ufjrf4h7owoupimvo7qhdhqpd6ov7cjq4yoqvcmitg@2gdo2c222hfp>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_154821_197746_2452EFED 
X-CRM114-Status: GOOD (  39.53  )
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

On Mon, Dec 30, 2024 at 10:44:25PM +0100, Marek Vasut wrote:
> On 12/30/24 8:04 AM, Ying Liu wrote:
> > On 12/26/2024, Marek Vasut wrote:
> > > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > > > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > working.
> > > > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > > > 
> > > > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > > Cc: Liu Ying <victor.liu@nxp.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > Cc: Robert Foss <rfoss@kernel.org>
> > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: imx@lists.linux.dev
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > ---
> > > > > V2: No change
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > > > >    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > > > >    2 files changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > index 9a480c6abb856..d8e9fbf75edbb 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > > > >    config DRM_IMX8MP_HDMI_PVI
> > > > >    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > > > >    	depends on OF
> > > > > +	select DRM_DISPLAY_CONNECTOR
> > > > >    	help
> > > > >    	  Choose this to enable support for the internal HDMI TX Parallel
> > > > >    	  Video Interface found on the Freescale i.MX8MP SoC.
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > index 1e7a789ec2890..4ebae5ad072ad 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > > platform_device *pdev)
> > > > >    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > > > >    	plat_data->priv_data = hdmi;
> > > > >    	plat_data->phy_force_vendor = true;
> > > > > +	plat_data->output_port = 1;
> > > > 
> > > > Quoting my feedback to a similar Liu's patch:
> > > > 
> > > > This will break compatibility with older DT files, which don't have
> > > > output port. I think you need to add output_port_optional flag to
> > > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > > is set, but there is no remote node.
> > > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > > support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > > TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Every follow up addition
> > > of HDMI to another device has been a copy of the same commit, with
> > > connector, so I think it is safe to say, no upstream DT is going to be
> > > broken by this change. Do we care about hypothetical downstream DTs
> > > which may be missing the connector ?
> > 
> > These have no HDMI connector nodes:
> > arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> > arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> Huh, I missed those, thanks.
> 
> Would it be OK with you to fix those DTs up and add the missing connector,
> rather than introduce some optional port workaround for them ?

I can't say for iMX8 particularly, but usually we try to keep backwards
compatibility, as DT can be coming from device vendors. So, I'd say, we
need both, the fixed DTS and the workaround.

-- 
With best wishes
Dmitry

