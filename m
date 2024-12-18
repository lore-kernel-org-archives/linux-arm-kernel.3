Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D304EE77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 05:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=; b=HpZ0sOsihuzSHDKBH1A6ZZtvpl
	x32DhilkH29zZahvhNQJr0JdWcmnSE0QFZRuQ6GZ808R56fJ6tAaBaQ/UieEQns95PUQSIhjNZusX
	0XIFmTrcCw5E+TtdWoTfIP2/Cj4MzbC30zFAouq67YM0gUAxQHHgMMfgGQz4oD4EvJYWGkwkkmgEX
	5ZN9dMyu/9ymuT7vlYU8pKvl4HiNLC25BgknTP/kNAJsXYAuRJ5ktUbdaHfsiJyoMVeEj3NZ8CQd8
	wpjvWyQWhUd2UqtDhSt7dBzXtN58/awxiGCHyJ9Trf6QP8KtGm1Vr0Kvrt0lSnt+A0H17qzQljX0T
	fjhCPfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmZ2-0000000Fdiu-0qS7;
	Wed, 18 Dec 2024 05:25:40 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmXv-0000000FdZY-3XvJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 05:24:33 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e3f78f5fc07so4599603276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 21:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734499470; x=1735104270; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
        b=jK37vC/dY/dsBNP7Vdj+EZuZeq6YH6CZ8OQRPgyl3DaiwAp4UMwd8bJW9EvpxADCY4
         OdLKHHYpzePFpyM8X8+P1nXqUubqGjKWPsFMh/Logo4GzW6MIsrsjgJXZ/XEmQDJnWMy
         RorpOPfvcLFD7PKQVUBiaOuNIbZIyaIdHsH734WrFPuQ/6V9DiI3/l5MGeYfYcfbV37I
         TZuw3aO3xTakFZQbDGDr+SXuwg+MR/w1JZdUbuWblx8ek/Q8FUfMOqA3HZNiNFIJ7zoz
         ftpXO392oxg+6a8Djb7vOvOAXpLg+4whJj3N3fZP8TX7W1Pl4U4UCrq5/7mid3x3eAye
         /TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734499470; x=1735104270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
        b=sz1fYnmnTqzDsjee0+kpF3sbIRzF7IcqwJUOuh06Wk8aSMGP5XHlyCinuP7ryp7KU0
         CApvrJsbekdo/5qp3c19SWLGW1C7u2xbD1GtaC6PdBFsRSRc8dW8riswm0nZ+KX5ulD0
         xa8+aJiV6tWRoXITjr91XFrH0iemVLMZJJ5VojtY9hkZC0HSbmF1ITD5oUVpGVVssYrO
         bI2xawcYa3WYpycAsNA6FOGOH3mOgp9eYLom3aI3GF1RTbEDoR4/wCqfeoGc/8pPmVk1
         rIX/nnRIr8UWBpA4CpaMbWBeyV+w1iEAEwoqzaMuSWKigq8Y/SD9J/PmlkI2zFLxZalP
         ohaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjP30NR5HqP5vdqbPPlhv4J/1kHevt4AbWXSl3G9Rv//JuxIYZNqPUIE9W6zZ5JaElk21ky7XIxE+A+C32r8si@lists.infradead.org
X-Gm-Message-State: AOJu0YyE/siGvC5VZRD0ok1CGR6/Z7qtehr+JAfCzPpyEtOo4taIyrLH
	vst+wiuJjQZB/DOKTrD3K1/h5ZTI3vi2bVtcxsawgwmJyDKF5v8Te36Ls5ZRdTFEpvfGOLgCRIc
	ruyHXnK63qyhEnuvgsKaaATHw6JixLuuObKqUFg==
X-Gm-Gg: ASbGncuVebRSDz7LX/bCN8ps7s2CkEpxgcGH/OvqymZ3WiOEuz/I5JYNGRAUwrqvMp4
	lZpGEGywJFE920CtnqCFfush0wJA9gU7ILHF7hgN2ELVBG1punlcjoZ3FbwaEkBt3qp06fg==
X-Google-Smtp-Source: AGHT+IE3kqRdPneJyqqtRpFDLs6soyy+Bdc+Cywd1EGV0t4/4nnntxQS7NjaTVS7xOtVNpAQwVKUJPYkOMozlg43ysk=
X-Received: by 2002:a05:6902:70f:b0:e49:5f2d:e729 with SMTP id
 3f1490d57ef6-e53620cdcf8mr1205674276.4.1734499470459; Tue, 17 Dec 2024
 21:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org> <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
In-Reply-To: <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Dec 2024 07:24:23 +0200
Message-ID: <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_212431_941270_F82758FE 
X-CRM114-Status: GOOD (  29.38  )
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

On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > While looking for a way to solve the issue, I stumbled upon several
> > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > implementations were able to handle codec's 'plugged' callback. One
> > third of the drivers didn't implement the get_eld() callback.
> >
> > Most of the issues can be solved if drm_connector handles
> > hdmi-audio-codec on its own, delegating functionality to the actual
> > implementation, be it a driver that implements drm_connector or
> > drm_bridge.
> >
> > Implement such high-level framework, adding proper support for Audio
> > InfoFrame generation to the LT9611 driver.
> >
> > Several design decisions to be kept in mind:
> >
> > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> >   generic functionality (ELD, hotplug, registration).
> >
> > - drm_hdmi_connector sets up HDMI codec device if the connector
> >   is setup correspondingly (either I2S or S/PDIF is marked as
> >   supported).
> >
> > - drm_bridge_connector provides a way to link HDMI audio codec
> >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> >   framework.
> >
> > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> >   bits. Only TDA889x driver sets them, while it's safe to assume that
> >   most of HDMI / DP devices do not support ARC / capture. I think the
> >   drivers should opt-in capture support rather than having to opt-out of
> >   it.
>
> Sorry if this isn't clear to me and I'm quite late to the party, but did
> you test this on vc4 with both a pi3 and pi4, or was it just compile
> tested?

LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?


-- 
With best wishes
Dmitry

