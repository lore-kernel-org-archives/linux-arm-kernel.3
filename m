Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577A5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgldlIqebxHMCQPj7i1Mg7X3Is8x4PWsXNlmpVBX+dg=; b=h00z7ppS9OsXiFpCB1c7Lk9zkT
	IeHuBQMTTV9KDnK1shB846g/J4IzaP4mzQ0xgmfq6BXBrLV+VbrZKzw3b7m2hNuSjPmTMnn1tvrvK
	qn7qe4pZGZnUlPh/KI/3GjEoZz4aZ8+ysVrqGouzoKwYmuY4uo/ZiSujVIMXkrkRV+i8WdXVC4Hh5
	cBfH1x6u2ROzUaSae36DkA1U6QupgsW11Qs6Shvx1kKVcm6YDmNU/wdteHhrCaX3gXJT+MYUd19Fn
	jGVrLTizORip31rxCVQQ+uXy+FeQxoOPWl2o1gnFl538QDuOgdWP1El61qw1IUL+lmPGU9hrwmDOc
	1GL5b47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeWc-00000005Gds-39Vu;
	Fri, 20 Dec 2024 15:02:46 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeV2-00000005GJs-12fy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:01:13 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6eff4f0d627so18548647b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 07:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734706866; x=1735311666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgldlIqebxHMCQPj7i1Mg7X3Is8x4PWsXNlmpVBX+dg=;
        b=HUMqfR2ZLpPUtVLoynIhHQUYmm1ev+CkyMSDGvItgcrS5gzTOW5UJxigl1xZkQxl5P
         wPIF+uYpA1G6G6YNpDh4b8G0AVTKAbe1U09uxGDz8vA9jchTWxolkY5DPgs8vNSU+CeM
         QcNaOcbUfrzPUDmbrfqwmO4DlUTpotRttyoC7/zuylOR5WiDTnT2NnPD47WkEIUPd9Z3
         NclwaFHgvY3UOmaQwa2bYCYVhwoJ3F2/EPR2cZd/sKQU59h9s/UQ7lTbMTFVxiDyJqos
         uIX2DBudJnr6JpMudGz/kvuynBDwaSOpCmqmrUqet4HiLowd8oRl+zTBX0qpHPnWe7l4
         lXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706866; x=1735311666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgldlIqebxHMCQPj7i1Mg7X3Is8x4PWsXNlmpVBX+dg=;
        b=ZkICEV5Gql7BzJdtFwqzKDuWjxMOibbSa5YCSdejnXJVD3WGOTuXzv7YlpQzBwBLu/
         IiUsV7hQwCLd1GWjQFq1WCSiOj54oYRizTGVj2PbNyHqlC+RTCzyn1lHVr4CM0LTj/du
         rU1yaaxIn27NeyP5QfclxWbc5xOhISILZFD/6dNDK3DRe4e33x/Hf4Pkqp5sId4RetzJ
         fcV3gCtU+Z8GaiplhVTkcf0YTBPaonATc+Bmau04GXUx7v40uTzMPn3c2IsEIWDIi0YV
         mhCy/8HA256yP2Z34AQGI2VE798FMhF9Ij2PWSrr5FuNqR0+Gfr4qnnaKZ8W1i6wNIKn
         YUSw==
X-Forwarded-Encrypted: i=1; AJvYcCVQBAC6wZ7pL/rWfd5fqKXq0wzTGpOHMIsOqjhumjF6Ls5gv3Qo8tsHDHW31Jc7I319fn8Auxi4hu6zFQAUTxsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwkr7xcD33uBEGH+Jmm60sVIQdVM2GFLh0aZ3qMwdtHgvMDKrx
	5UbUkeC+9/n2CuELW0NDLJ0KCXfbCu7Rm1J2EFGg4vTTHfLsFlnVpBIx5XhSxbFY1YqMg5DU+3E
	FY3hUx9xdYYmKfCvmo8wdqO4kkgsjEXe5LsHVNA==
X-Gm-Gg: ASbGnctZ8E74XBTSiyMJ4WxoZJc2khLGXs6QFyMp0FsQtoUiC8Ffi8d1QeuHI+TTC79
	eQYywCO40rhL9NkqX1peCvs7iDTP3gUbXhKSbCg==
X-Google-Smtp-Source: AGHT+IFc+oEnOShcdDC1byWLp4AC1qmPpTDBu0FWi/xC+iJe79EAhDsdRcF95l9UsCgekChEcx5oa5DdzDkNKNuDTEw=
X-Received: by 2002:a05:690c:690b:b0:6ef:7372:1131 with SMTP id
 00721157ae682-6f3f8251854mr22921827b3.41.1734706866390; Fri, 20 Dec 2024
 07:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat> <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat> <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
 <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com> <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
In-Reply-To: <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 15:00:47 +0000
Message-ID: <CAPY8ntDUaFnvkjkqES4AkrzZ2z659h3w5MFSd8vW04Eh-iJ1FA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_070108_379418_6705D2EA 
X-CRM114-Status: GOOD (  49.10  )
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

On Fri, 20 Dec 2024 at 00:45, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Dec 19, 2024 at 04:16:37PM +0000, Dave Stevenson wrote:
> > On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Maxime & Dmitry
> > >
> > > On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > > > expected to get drm_connector instance.
> > > > > > >
> > > > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > > > third of the drivers didn't implement the get_eld() callback.
> > > > > > >
> > > > > > > Most of the issues can be solved if drm_connector handles
> > > > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > > > implementation, be it a driver that implements drm_connector or
> > > > > > > drm_bridge.
> > > > > > >
> > > > > > > Implement such high-level framework, adding proper support for Audio
> > > > > > > InfoFrame generation to the LT9611 driver.
> > > > > > >
> > > > > > > Several design decisions to be kept in mind:
> > > > > > >
> > > > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > > > >   generic functionality (ELD, hotplug, registration).
> > > > > > >
> > > > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > > > >   supported).
> > > > > > >
> > > > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > > > >   framework.
> > > > > > >
> > > > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > > > >   it.
> > > > > >
> > > > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > > > tested?
> > > > >
> > > > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> > > >
> > > > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > > > pi4 (irq-based) at least.
> > > >
> > > > Dave, Maira, could you give it a try?
> > >
> > > I'm on it.
> >
> > Basic checks look OK.
> > Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
> > works, and all the EDID parsing seems to be correct.
> >
> > Ideally I would like to do a couple more tests though as I had a
> > couple of spontaneous reboots on Pi4 whilst hotplugging.
> > Most likely it was just grounding issues, as I can't think of an
> > obvious way for the kernel to be triggering an automatic reboot. They
> > seemed to go away when I had enabled drm.debug=0x14, but more likely
> > I'd connected the serial port and therefore provided another ground.
> > Please don't hold the patches waiting on me though - I don't know when
> > I'll have time to do them.
>
> Tested-by?

I'd held off hoping to get the extra testing done today, but that
hasn't happened, and today is my last day before the Christmas break.
So based on what I've done so far:

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> >
> >
> > Also unrelated to this patch set, I have noted I'm getting
> > [   60.780897] WARNING: CPU: 3 PID: 501 at
> > drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
> > [vc4]
> > ...
> > [   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
> > [   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
> > [   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
> > [   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
> > [   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
> > [   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
> > [   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
> > [drm_kms_helper]
> > [   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
> > [   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
> > [   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
> > [   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
> > [   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
> > [   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
> > [   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
> > [   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
> > [drm_kms_helper]
> > [   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
> > [   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
> > [   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
> > [   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
> > [   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
> > [   60.781790]  irq_thread_fn+0x2c/0xa8
> > [   60.781799]  irq_thread+0x16c/0x2f4
> > [   60.781805]  kthread+0x118/0x11c
> > [   60.781813]  ret_from_fork+0x10/0x20
> > On first plugging or unplugging a second monitor. I suspect that is
> > spurious though and I'll look into it, but probably not this side of
> > the Christmas break.
> >
> >   Dave
>
> --
> With best wishes
> Dmitry

