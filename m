Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtphmJJvd2huuYFzKRkVf45xsccE6Ms1jkEdDHx6d2E=; b=whcyJzdyhCXNN1i4rwjk+TQaox
	zQkC/SQX1qS7L1YMH+yIH4Zl3WUOXcT+CFFn/PVj8FK5zOCg1rRf8t1XEpGxb6lSwaSXsl6Dht8Zj
	yrae3LQ/AbaH3laKZ/f3qVrXEZgQoRc91PsGjmzGIMrvOo9iNG45OUJi/ILqewM6WYPsBolo/d76A
	Q5IpR1PhAVVxdbQuz6qtJDMpD27HvNrVWG+8GaUfBSV2ZCy6JlYMa5Lqx9FBxvjjoSGICB7akgrlZ
	DhXjTw4lUzGTUvuqvLKIHOIHASMEAsbHba4GdkRbbKpj7Px00zOQawgB3A2ew96rlfSNdU3Gp3OYN
	0EnAC8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOR9s-00000003VhU-2Uiw;
	Fri, 20 Dec 2024 00:46:24 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOR8k-00000003VSB-2hXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:45:16 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so15626441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 16:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734655513; x=1735260313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtphmJJvd2huuYFzKRkVf45xsccE6Ms1jkEdDHx6d2E=;
        b=RCieHnyuDf1pSqt4/RJIC2/kk5hT965/tLbrYr/DJhdoh5P85H1Iz1Oy6nvc9Zir6g
         3kcV7UHtKuGhAUczcBAieewEb1RVxTvmpRUf2+VDnPyg2yltnlsAI5YaY4WNG3dxqObz
         YQG/Mng+oifGbzrTmoKhwG5ysywjU6MwmwN9NtCBjcl9SDAJ58OcH0aKbr80MVjiMSh8
         JrRFzfne4X5yVblv5T+P8yYbCNCiSkVsLE7TOnC73JdNOvVqnYO0zfSPfCGpdMQeiDL0
         lBv7PxZoQGTeRhTTSfgV+DQEMOVu2Ml4K9q6zAu5dtUnw7bv+OTK45PdRadGZfWJoBcM
         TjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734655513; x=1735260313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtphmJJvd2huuYFzKRkVf45xsccE6Ms1jkEdDHx6d2E=;
        b=qEbb33JbZ6eiRj4eFVWT278chDaNlKhcm1KMhYTC0OiXLEaWhp6uqapiKLnh7HfbPd
         h+HtGfZGImIBdGtQmt/v5O7CttymXj3et4yovzlAfNC/PED7lTV2YTytvtriUcB7j538
         oNR7z9MQZxaxhdiMZ9AWx+GZjuiuTxQ1CWekzumgD3edL6JQATM3VEKizIPGzSBNk6aH
         2jiQuOI6BcPjVUlWJL4/iwaBgDMjysrTrbFjcI8P9q3snawggEanYVttWyzHeHxaAkhW
         E8tv5Gwbnre/h2DrOuC77/ww8jbD1wmjLWxLLC8HWz2ZjF9VurlQ2fiRRO82V15A31ed
         zhHg==
X-Forwarded-Encrypted: i=1; AJvYcCXERpmkc9eANvbH+ykjN2epV4+5BTmvnsGA+A0GWg/Gh9t5XKTQpn+ixYqgXJt0KBvlGCQXiYL6xrwkjj7lmolL@lists.infradead.org
X-Gm-Message-State: AOJu0YyGqEQXIuG6Ymn3oo3/51A0z8fUDr1rSN0sSaHU0lvAVX+xjsdO
	vsFPYis5OLhUV6Gqj13HSuHfVxWSRx9L3QiLm3jOynKmYD3VRz9RWVg5VeT/R9I=
X-Gm-Gg: ASbGncsNbMdlZ55I0xGjlNuYDegtQsu1biqqxqy2LdzZrpfXWLsHCRoEFFKEiVoY7ob
	Opn/N9ut9c14bkLFlHz5zyTEtvE34sHlUwAF8oU3Xm8lYzGXUxvkth71/G7Sc5roLCP+zDuMNR5
	6mYoG2Ci8enaZcQEcwscYO4JSiYClGs59RdWnee9aj7NG2wJQcYefZcd3pq2ise8erTh5lZHRK5
	KHjL1H4Tl/RLM18KvWzZzSpmrewTlWEb49ieV4wsmdBuGss7FgsCeFw3Y8X6BRWzlW+/YIqV1Pu
	9+OiTqu/PZHIIVx9d/bumSqToOLjbkcqA1si
X-Google-Smtp-Source: AGHT+IH6uB6hHFdhZ8g1M8LwKBeApp5BdicV5eI/Ca91+dWC9LroL7URt+wK91yNOSkMF1+1W94jDw==
X-Received: by 2002:a05:6512:1329:b0:540:1dca:52bb with SMTP id 2adb3069b0e04-5422953c126mr191526e87.28.1734655512484;
        Thu, 19 Dec 2024 16:45:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382156dsm315960e87.186.2024.12.19.16.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:45:11 -0800 (PST)
Date: Fri, 20 Dec 2024 02:45:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
 <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat>
 <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
 <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_164514_683427_E49804AE 
X-CRM114-Status: GOOD (  46.94  )
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

On Thu, Dec 19, 2024 at 04:16:37PM +0000, Dave Stevenson wrote:
> On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Maxime & Dmitry
> >
> > On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > > expected to get drm_connector instance.
> > > > > >
> > > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > > third of the drivers didn't implement the get_eld() callback.
> > > > > >
> > > > > > Most of the issues can be solved if drm_connector handles
> > > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > > implementation, be it a driver that implements drm_connector or
> > > > > > drm_bridge.
> > > > > >
> > > > > > Implement such high-level framework, adding proper support for Audio
> > > > > > InfoFrame generation to the LT9611 driver.
> > > > > >
> > > > > > Several design decisions to be kept in mind:
> > > > > >
> > > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > > >   generic functionality (ELD, hotplug, registration).
> > > > > >
> > > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > > >   supported).
> > > > > >
> > > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > > >   framework.
> > > > > >
> > > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > > >   it.
> > > > >
> > > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > > tested?
> > > >
> > > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> > >
> > > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > > pi4 (irq-based) at least.
> > >
> > > Dave, Maira, could you give it a try?
> >
> > I'm on it.
> 
> Basic checks look OK.
> Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
> works, and all the EDID parsing seems to be correct.
> 
> Ideally I would like to do a couple more tests though as I had a
> couple of spontaneous reboots on Pi4 whilst hotplugging.
> Most likely it was just grounding issues, as I can't think of an
> obvious way for the kernel to be triggering an automatic reboot. They
> seemed to go away when I had enabled drm.debug=0x14, but more likely
> I'd connected the serial port and therefore provided another ground.
> Please don't hold the patches waiting on me though - I don't know when
> I'll have time to do them.

Tested-by?

> 
> 
> Also unrelated to this patch set, I have noted I'm getting
> [   60.780897] WARNING: CPU: 3 PID: 501 at
> drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
> [vc4]
> ...
> [   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
> [   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
> [   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
> [   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
> [   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
> [   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
> [   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
> [drm_kms_helper]
> [   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
> [   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
> [   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
> [   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
> [   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
> [   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
> [   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
> [   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
> [drm_kms_helper]
> [   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
> [   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
> [   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
> [   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
> [   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
> [   60.781790]  irq_thread_fn+0x2c/0xa8
> [   60.781799]  irq_thread+0x16c/0x2f4
> [   60.781805]  kthread+0x118/0x11c
> [   60.781813]  ret_from_fork+0x10/0x20
> On first plugging or unplugging a second monitor. I suspect that is
> spurious though and I'll look into it, but probably not this side of
> the Christmas break.
> 
>   Dave

-- 
With best wishes
Dmitry

