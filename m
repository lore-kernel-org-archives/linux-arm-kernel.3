Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0587D10388
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeQTme9OQpz5EUH4Q8dvIRMhuOZrF8OXC4V+2gIbzn4=; b=kGFsMAwtZfmC6UrPMXShHG1Em+
	oJmmGv6pDaY5QsANdLFevaiPm9A9EF9S7ucFNOBkv9vDyG3Y1Fncepb1+31sYu/0uw6ip/iYQLrby
	zoiQRJZCi8HUhpZo1cs62fAN8Aq5u48IifBN69qEavk0uImGDiWLrux9DBZWZzbjnVjh1mZMs1pRb
	YCt0Q8eArfyJVQKMVuowMJbP/oWNC1uGAjXZPsK2xfUd4lI7fURKs08HVdZR+i4Je5SQeD+z+Bbwm
	2Iz8ZvkFJ2YBrl+jzusy/I+sDf7zILt44N3o95z2Nr07IBNJRXyfwLKm5uFPqBMbfPLHFOxyf1GP3
	/B8N8Vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t45xO-00000001uyV-1OxN;
	Thu, 24 Oct 2024 22:05:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t45vp-00000001utK-3DK0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B2435C5930
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 22:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B8EC4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729807428;
	bh=rvm0sqyM2Iuo+G/JA+hU3fSOwR/fA93E6NiMqCWY8ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDsd6eetFsT76YujCvqrxSBlJhCRJNUngo87sX6virrURSXimyoeFnMa5ZKEoB2vS
	 sloVjhcFws7WV2JObyvAvI+z4ZXexaOdiAuky+EswMc/HKZBxCf28NsCXTkRhx3s1O
	 gOvPEpZT0eeit87A36FG+IfjCUsl0z6fQ0m5oRi/dIqEpVkdnaUWdO/0NESausgkHM
	 MN3Y15ywDOzTv0c/VI4cqnDNKt6fVbE47tJ5q8W4OavsZ+bOOL/3PSOYYhi/0yw+jc
	 DJkXNG/LBk4yCWyBALyDoKgYqrJZ0ZYGXB2N1aOQStWWGzKjjghAcjTQGyPlgkDKXZ
	 MHAZrVHT8uIkQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fe02c386so2514992e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 15:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdeohRWGBuPBDGtdCD9An6iFQbXVx4XeGlhutC7EE3NBbW4gzkfKhW/4HkVaLNRYcu53UvX335EcYwccP72tLd@lists.infradead.org
X-Gm-Message-State: AOJu0YxavtCtT1bfYsQGI0q6/qLC4ScypP/yEelFgL0UwKMTbkgBwjoV
	nusfT3D+mlCODgzs9hA92cafU6BYikYZevtDgXwHTao962FQVAL+XSRiRR/JNLpGwNk/yiUSzrq
	QkUl1AAk9h1U4TSAJ0fP2c4xd6Q==
X-Google-Smtp-Source: AGHT+IGF6eWZ0+7n7HQRyqqTejSHhmgOHjWsU/iJM8V90fYyb1ZIuNBy89dtclskBrr3PVViovbrpowh66UndWkfyZM=
X-Received: by 2002:a05:6512:3d0e:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-53b2371753fmr1240151e87.14.1729807426772; Thu, 24 Oct 2024
 15:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2024 17:03:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] of: property: add of_graph_get_next_port/port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_150349_911985_D53E3711 
X-CRM114-Status: GOOD (  19.82  )
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

On Wed, Oct 23, 2024 at 9:19=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark
>
> This is v8 patch-set
>
> Current Of-graph has "endpoint base" for loop, but doesn't have
> "port base" loop. "endpoint base" loop only is not enough.
> This patch-set add new "port base" for loop, and use it.
>
> v7 -> v8
>         - add Acked-by from Sakari/Helge
>         - tidyup comment line
>
> v6 -> v7
>         - based on latest linus/master branch
>         - remove "ports" base functions
>         - use "port" base function on "endpoint" function ([3/9])
>         - tidyup [1/9] explanation
>
> v5 -> v6
>         - based on latest linus/master branch
>         - [9/9]: fixed compile warrning
>
> v4 -> v5
>         - tidyup comments
>         - [8/9]: parent NULL check was removed
>         - [9/9]: use for_each_of_graph_port()
>
> v3 -> v4
>         - new for_each loop includes __free()
>          - comment indicates to use return_ptr() or no_free_ptr() if
>            it need to continue to use node
>          - each driver based on it
>         - care "prev" leak on of_graph_get_next_ports()
>         - of_graph_get_next_port_endpoint() indicates WARN() if port
>           has non-endpoint node
>         - tidyup each git-log
>
> v2 -> v3
>         - return NULL if it it doesn't have ports / port
>         - add visible comment on of_graph_get_next_ports()
>
> v1 -> v2
>         - add each Reviewed-by / Acked-by
>         - tidyup/update Kernel Docs
>         - use prev as parameter
>         - update git-log explanation
>         - remove extra changes
>
> Kuninori Morimoto (9):
>   of: property: add of_graph_get_next_port()
>   of: property: add of_graph_get_next_port_endpoint()
>   of: property: use new of_graph functions
>   ASoC: test-component: use new of_graph functions
>   ASoC: audio-graph-card: use new of_graph functions
>   ASoC: audio-graph-card2: use new of_graph functions
>   gpu: drm: omapdrm: use new of_graph functions
>   fbdev: omapfb: use new of_graph functions
>   media: xilinx-tpg: use new of_graph functions
>
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +--
>  drivers/of/property.c                         |  99 ++++++++++++++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
>  include/linux/of_graph.h                      |  49 +++++++++
>  include/video/omapfb_dss.h                    |   8 --
>  sound/soc/generic/audio-graph-card.c          |   2 +-
>  sound/soc/generic/audio-graph-card2.c         | 104 ++++++++----------
>  sound/soc/generic/test-component.c            |   3 +-
>  13 files changed, 205 insertions(+), 172 deletions(-)

Applied, thanks.

Rob

