Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B13D1359F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kewq0jun/sKTyFEkBiL9iXhIasxDz8VGr2qCbe0+u6U=; b=hkAg5kN3v5bkjUFbyK+zbdviDg
	QbvrZzQUtT6xkMlD8xqwdR42j6AD+nop/QS/Wua6XMzBLqKNe8q44wB4lQlC/EEo6p+6w3n1TsRuj
	e42Dj8uB+SWZ0IqYGaONBbju0DAXuyo7V2mYxm8qn10lSpSoqvJ5ONY4yj1orSdxGUSAB6/w53s+R
	b7HruD+77flfKATmBIP6pxrjJpxxSIz8Vqy6sbfCQZXLrvSqCmrUx1rF90UqKXEKXjxV6bnXCQSJX
	ksGM38sFRXuHlcOrVhCMA73GS9677dbSPRXKthfj31dOlJ1cVRTz7UQItRYCZ1r1ujEs0gDgRsi3D
	/L95xbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OkB-0000000Aj8R-1Mt5;
	Mon, 28 Oct 2024 12:21:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OiT-0000000AihJ-0Y3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:19:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fe02c386so4859494e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730117963; x=1730722763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kewq0jun/sKTyFEkBiL9iXhIasxDz8VGr2qCbe0+u6U=;
        b=wi236YqPJxo8TifZDNK62q7tnoFibHKdQDExbsivnyKMxpJ0xtAhMPmAT2tvqmyBaJ
         q3nCaSmy0RgCQcUFJQvkvolyfix2HBnT1tXUPOkF6EOnSkOfmSeHCEwF4t7m6ous+sVR
         eOXDT1aeKOBcoY6FuDyzKsbmmdS/zwjleUcaY9kZerizBM7NZBHhgFpQ4tyL8O6YCcOS
         fHt23x4eO535YErOMWPQdvhPttx1Q6IsmJoC9UMqqXBlj+MPXiiVcIl/9QMIWhWHfugy
         0Q27IUZFhOmLzXkYohXkeB4tfHz/wcPQYLdIrcuwscbsLBBPAWAYlLBRMKBqtco9MXnk
         MWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730117963; x=1730722763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kewq0jun/sKTyFEkBiL9iXhIasxDz8VGr2qCbe0+u6U=;
        b=HY33ACXdp4JaIgHABY9CTN/CdlRjZrpgkdYBMsQssi5pCWehi2XvY0cdIoXpvb9WTK
         +LtQAmZZKLcsVDdeDeMX219oeFa0oQs2EI1N1DeFmnUt0Ddp2pkDlSiSr1oXQ/itfCy/
         cfLps3/ufXK88rv807J8NyXWgiBfBJK+FfeHulCxABCMfEg11MpawxJ9WW3cNzejfFGN
         7zmL12BMXhKepJzuJCrnA933PiUbs3/iofiBafbHZMR764iMk/PmZl3j2+fTewWrEA1/
         h/rBYwDw5jAbjeAcS0CzJEHWTtJS/teV1dJwbw7VM7vSlpzVttrUceu5Sztf1YFyv9vx
         Ngmg==
X-Forwarded-Encrypted: i=1; AJvYcCW3X4OiVKEWyLFUYqwXz41x/NMXNulG2IdcaU++Rkpn4L1UWF78CsjohAk6E3mVqy8viTcOuMgHis+FzHzedgBw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9WxhQLREvNTmkCYCSDWKHdhxN3yGqM0KSXePOnQylyAOYoXC7
	kdaei+5KZ84DgP/WI/vSOj93wv7dFrcha1bx5ySUOWZF/C7v2BTSlsSTW2qMTNs=
X-Google-Smtp-Source: AGHT+IFcJ911YncxzDz+vUGU2wKxP//zFGp4XOAPitX3IxTT9WIuDtrsNPSJE+JGqHL6nbUCTYefbQ==
X-Received: by 2002:a05:6512:33d5:b0:539:eb97:61d7 with SMTP id 2adb3069b0e04-53b236a6912mr4462705e87.4.1730117963369;
        Mon, 28 Oct 2024 05:19:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a7bcsm1047277e87.21.2024.10.28.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:19:22 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:19:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liu Ying <victor.liu@nxp.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de" <arnd@arndb.de>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org" <sam@ravnborg.org>, 
	"marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Message-ID: <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_051925_204372_5934B023 
X-CRM114-Status: GOOD (  32.89  )
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

On Mon, Oct 28, 2024 at 11:12:00AM +0000, Biju Das wrote:
> Hi Dmitry, Liu,
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 28 October 2024 10:20
> > Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
> > 
> > Hi,
> > 
> > On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > Hi,
> > >
> > > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> > > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> > > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> > > function.  IT6263 product link can be found at [1].
> > >
> > > Patch 1 is a preparation patch to allow display mode of an existing
> > > panel to pass the added mode validation logic in patch 3.
> > >
> > > Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> > > the next non-panel bridge, that is the IT6263 in this case.
> > >
> > > Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver
> > > against "ldb" clock so that it can filter out unsupported display
> > > modes read from EDID.
> > >
> > > Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as
> > > they are supported by IT6263(with LVDS data bit reversed order).
> > >
> > > Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
> > >
> > > Patch 6 supports getting dual-link LVDS pixel order for the sink side
> > > as needed by IT6263 driver.
> > >
> > > Patch 7 documents jeida-30 and vesa-30 data mappings in
> > > lvds-data-mapping.yaml, as needed by IT6263 DT binding.
> > >
> > > Patch 8 extracts common dual-link LVDS display properties into new
> > > lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
> > >
> > > Patch 9 adds DT binding for IT6263.
> > >
> > > Patch 10 adds IT6263 bridge driver.  Only video output is supported.
> > >
> > > Patch 11 adds DT overlays to support NXP adapter cards[2][3] with
> > > IT6263 populated.
> > >
> > > Patch 12 enables the IT6263 bridge driver in defconfig.
> > >
> > > Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.
> > 
> > This has pretty complicated structure from the merging point of view.
> > 
> > I propose we take patches 6, 8, 9 (without 30-bit formats, they can be dropped while applying), 11, 12
> > (?) and 13 through drm-misc in one batch (once DT maintainers review the binding parts). This looks
> > like a minimal set, having no extra dependencies.
> 
> > 
> > The second set might be 4, 5 + new patch, re-adding 30-bit formats to
> > IT6263 binding (no driver changes are necessary). This can go in separately, after an Ack from media
> > maintainers.
> > 
> > Of course both sets can go together if linux-media maintainers reacts quickly and ack merging media-
> > formats patch through drm-misc tree.
> > 
> > The rest of the patches don't have such strong dependencies and go in once ready / reviewed.
> > 
> > WDYT?
> 
> I guess, 6,8,9(without 30-bit formats), 10, 12 and 13.
> 
> 11 may have dependency on 1, 2 and 3 as it is SoC specific.

Yes, of course, 10, not 11.

> Then 4, 5 + new patch, re-adding 30-bit formats to IT6263 binding.

-- 
With best wishes
Dmitry

