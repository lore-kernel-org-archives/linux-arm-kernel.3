Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7507DE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZmzjNgd3FzWWFXoKed7UNpdcC9ExA3iDz2Moa5OROY=; b=UcG+MH3F0xYsibnkNpZvEvxrl6
	xoPi5G0kwTN3Ou4xBoVXEg0QZdIiy/ijSS+QnwKPS9RzGqw+xUn6wFuSMR99kIstWOBm2gCL1OtuE
	rFNUwkVK6b6BZLuSsKkzIk2tL194DDpe9GRxrX9B0fNpce820SqQ/ZqQ+OOE+3b9AjLA/Y/smVSxi
	ryqcia4aqa6W8RT1ebsRtw01vi9lli5uyCSSfZblXO6c0fmq4GertEOeL9QvjAFj5dr79Zm/T903X
	YHqMzL6MgYXwz+YLyPnnkC/f2/KUqN/0PjMFJK19focIDJtZD2uH8bN9VRc3cDrtEg5i1SwqXIulk
	Cmha0bjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJE2-00000002JrG-2jtp;
	Thu, 19 Dec 2024 16:18:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJCt-00000002JgQ-3vv1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:17:02 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6ef60e500d7so7946297b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734625018; x=1735229818; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZmzjNgd3FzWWFXoKed7UNpdcC9ExA3iDz2Moa5OROY=;
        b=p7VMpDlmfaURtvfRwcW3A/ch32DS1/lMIYPQz0Ho8js89ESljrO/qrvq+ohPN9ciNV
         pjP/sfkeNBa4ri3MXeBzQQoDyhJfriJa8UqW+cvdXhxTU1f7cQte+exskkssAI3Yo48A
         QlV2lxjE9ZO6WXKuygg6xLvfHb1uSpUDYnrjaSbsevz0P4qKfHTx83F51+NL2KiQq/Bp
         419Ezxm2WSxOLz/vrrW9piB11ckaVW5ZCyrw+ity67bU2esbmrmY/3QrCYPcGXprC/WV
         Oa9ztmmOqUoNgdT6usDu//EDTUeuF4f2bA/+yrXr4z+c4EZE6m4zErvFmUuiWTrLdIUL
         hxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625018; x=1735229818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZmzjNgd3FzWWFXoKed7UNpdcC9ExA3iDz2Moa5OROY=;
        b=knl2gJiTTcZk6Dc3/8xVBja/u2Xo8gpzOx0SlGJ76fPERpFWevnovjgmUg0jq1eHeQ
         jMf4H6/UulNTTuxzb6kyU8IBgoteuMUX3AugRH4k/QH+5HqPooQJrosNHOcrebVGxNX8
         k4w1+gKPr+rJH77130jV88ItfLAieJXhA2x/7jnPMA6q3UX4KIG4ueZrr6swFO9zzX4e
         s8OrfRm/16aDi7OGDJqnLcOaDtsseCCgUp4pK1H3QVwj/1ld/Br3yydIEQAzv2BYHFDU
         RhyCW5bKTxNal2b/E8aSzA9id7wDukpCkEi7WfEBrNX9Ktc72tZbYS6HZI3RbLnUs4w1
         4tpw==
X-Forwarded-Encrypted: i=1; AJvYcCVi6PEENv+E+5i90h8RgC8L1EVo2WV7GM4gSDWXqOwUJlTG9KJohiP4QieMD9COJDq5tklTbWyquj4X/mid/rq5@lists.infradead.org
X-Gm-Message-State: AOJu0YxZOqNdN/3ni0n9WnzCiQoMn3YwJu6K4ApgE+hp4aknKr+JZU35
	SYsNlcdnXLW3QrWlXbn1XROSbyMLS1nO+xZy5lOs2gjMRZlLPuj5iUzaamQo5xZHDiqCGsvy8V/
	eGSnYqoRMPYaSzAdtA73FcQYDhL5DnE3RRGdXrg==
X-Gm-Gg: ASbGncu4H1HLFEI128NP374AQG6xY6x3alZpynLRUnMm+9U499XLb981rvExYjXUjAN
	riZSkKi1t1Bginzl0/zE/KGmdQInV9mtPEwmpfA==
X-Google-Smtp-Source: AGHT+IECkheCLvfI42XUCb3c+ehUjJfGKo2yL4elekXmeYHMSMkezHohmTNLU2nT00zZk2MNPaGa7Nbdr9wYj8x5cGM=
X-Received: by 2002:a05:690c:7489:b0:6ef:94b3:72f6 with SMTP id
 00721157ae682-6f3d26c386amr59410227b3.42.1734625016409; Thu, 19 Dec 2024
 08:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat> <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat> <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
In-Reply-To: <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 16:16:37 +0000
Message-ID: <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
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
X-CRM114-CacheID: sfid-20241219_081700_053796_B049E1E2 
X-CRM114-Status: GOOD (  42.14  )
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

On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime & Dmitry
>
> On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > expected to get drm_connector instance.
> > > > >
> > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > third of the drivers didn't implement the get_eld() callback.
> > > > >
> > > > > Most of the issues can be solved if drm_connector handles
> > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > implementation, be it a driver that implements drm_connector or
> > > > > drm_bridge.
> > > > >
> > > > > Implement such high-level framework, adding proper support for Audio
> > > > > InfoFrame generation to the LT9611 driver.
> > > > >
> > > > > Several design decisions to be kept in mind:
> > > > >
> > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > >   generic functionality (ELD, hotplug, registration).
> > > > >
> > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > >   supported).
> > > > >
> > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > >   framework.
> > > > >
> > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > >   it.
> > > >
> > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > tested?
> > >
> > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> >
> > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > pi4 (irq-based) at least.
> >
> > Dave, Maira, could you give it a try?
>
> I'm on it.

Basic checks look OK.
Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
works, and all the EDID parsing seems to be correct.

Ideally I would like to do a couple more tests though as I had a
couple of spontaneous reboots on Pi4 whilst hotplugging.
Most likely it was just grounding issues, as I can't think of an
obvious way for the kernel to be triggering an automatic reboot. They
seemed to go away when I had enabled drm.debug=0x14, but more likely
I'd connected the serial port and therefore provided another ground.
Please don't hold the patches waiting on me though - I don't know when
I'll have time to do them.


Also unrelated to this patch set, I have noted I'm getting
[   60.780897] WARNING: CPU: 3 PID: 501 at
drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
[vc4]
...
[   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
[   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
[   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
[   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
[   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
[   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
[   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
[drm_kms_helper]
[   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
[   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
[   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
[   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
[   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
[   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
[   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
[   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
[drm_kms_helper]
[   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
[   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
[   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
[   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
[   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
[   60.781790]  irq_thread_fn+0x2c/0xa8
[   60.781799]  irq_thread+0x16c/0x2f4
[   60.781805]  kthread+0x118/0x11c
[   60.781813]  ret_from_fork+0x10/0x20
On first plugging or unplugging a second monitor. I suspect that is
spurious though and I'll look into it, but probably not this side of
the Christmas break.

  Dave

