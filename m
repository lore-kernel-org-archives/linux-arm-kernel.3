Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BFEC44524
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 03:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=; b=fTbpQpg5+0AC0vJmeqztxHg+PB
	AZpUgrUtkzMjJZgpXjnZXfVu+7qeo9qTw9fNGq3SNbTByd6yMyoji/O9LFV0EvboIFmsXVbDuJEDd
	jrRNmF1r5S1ZpZOCPMDoMjWUhg9lSympz0jsDodnOKeRGwhp620Acyh3hvOqIewaBHY6dQs3OOAOF
	ycpfGpoizbX5ThPr70LdOpc4Us/livjIUCchPplXcQv7bsAtKKBS8e/XH9mFjJqcdxDgIVb2I3q+r
	wkFa/1icHtYwRuiGinuW/3atHOeBpNHxgpZNXHaCmOtbhR5fIssij2WPKVxltHLX1NVdpJVn13eBy
	cQt9vkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0qk-00000008IeP-0vuo;
	Tue, 21 Jul 2026 03:08:54 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0qh-00000008Idb-3vpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 03:08:53 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-80e2cfe6918so61909227b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 20:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784603330; cv=none;
        d=google.com; s=arc-20260327;
        b=AbQnB016QxhmvDDqRu34drVz2X0jyrEmc/0tsoKjRGiunE5mid0OYOoJON7pZaFizC
         ni7iGREedf3QpqtVUowN18UFWDuyup/RnuWFkPhB9DiYxfk16yIEvvHRpK6O+j72H06d
         lDOARtrecS2+zgUY4Nd5+OQFoQdgyiYZWiSLDM1WKGy21PkLCeiFzdKu7o7hsQ/stcW9
         AvXFHZcuTKMl++332JgNl/boDnRFaEHaMfwvF89Mrd6Pz5y01T6kiYkPnPh3k31o0E3f
         tmO65hy5rqHW6WS33MMiQ9+0B2lqLUmA23ZOcdt3rgLqKglUv34YeGPEfRrIZKrytfK/
         h/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        fh=BMRbB4xRwOwt6OKzcig8yiVI7pnExhx29l7bSR3otvI=;
        b=dQY5fzFqNuZ3lTmdUjRYnvLuHg55TESbRQBiO6VcsV2ht9nG5i1RwNi56YqWErktKV
         +pGGn7VWm7Gv2TWgTltPZ5tnrHokrAJqdW1ysp6rll+701qVR3WfsQ1lAke+rArIK56W
         mi4aXxxbdoRaVkhs5/Pzs026CN2ZBkm9gZsBqUQinjVJQNV3KeklW6AWc2uAvATmDVcZ
         1pVU+JacndIfL7YMf7WjfDkO/DF+c2Azwj1bbUsOoNdmRoCDhliYgFbkI7h5MmQFW80D
         ZahiK4wo0bGUxJLbWW88tfbIBoaTuqGODJBMDOrC1H8u3Swhn9EyukkY1aqtz4GWknGC
         Mjuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784603330; x=1785208130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        b=eN8qR2CpQEoEiLT9pQ8JUGFL2URWUhD1f9c8e8WRedXlHJyPlozqTVT3jaWTDym5Zd
         VMnRkbHu+py9hdswuUyGaxZBhYsO+2potQbsU1zHEXDTNvdJD+w0oV9HTkkQc93kMVt3
         jCaREdWwCIvz4aPDmbZbrO9N4xIgdl0wFKRJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603330; x=1785208130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        b=FtI48VEP+kYjU1HAb6xMQqnOL0d23gER7un8yvE1ycY6/ky9I4eUlLM7tfkaZhngox
         ZY+t2RluyRcoMuafDVKrWJmCS0GxhpyMewkdAMGPBTAtEPu2Di4O+KnVLCk3Hfs0iZLW
         dkwtXiBLtjCIAFtcQZ3ZDnGzuUhI8PccmwF4dw0VXJUBy0UiZW4xairfPyQaseV2fdUu
         xs9ebq/gfSaKjEPGZUsmjTMLIB0vLsybqxS+rPSg+QSS8kKfUF2kmOnxGN9ciSPjtw/r
         lf3Am7gLckeFDeQizdQ3A2Vw4HnPM9TBPtiX85O0rQWbtrnzQRlzIdV/G//gIaS8pHv2
         GeDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr80fgrk+hW1VdphJW5m3TGKxsfI3mNOcOvsvTZriXbTntaT95Wj8BVYfiJq8lMSNnwmnPfGYJWxpWuBlmrRF9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj1e3lUEmDrWA41SlhIsC9B1JJczfwx3Zv2Y9TM5gjDBAXqgYn
	ybBbDQ1TGqQmnXchRHJtd5v+0/xwLzmDD6pitiEX7UkZpUCJ51BM0LfMzGlAHzqoUFo0afwpD7f
	pjeV2zFL5jhywPhxhS9P2cN/xP1z6gNp84RVPSQdNd1KwKi6cRq0=
X-Gm-Gg: AR+sD11PVmYcK+hP2+ZMPt56u5i2+lxitMhmlR2xLHxgvSXPRrGUPzHmii++K2U7zRt
	4P7KWfM2JZKWKygluVLZgQhjHQ2pGaqFQ6bvgSdpD7L1jWYw4y9SYsAOy6JGY0hgC3ldFBLTZBn
	bFrPo7Z/Lc0jxKzGfAYO4XofKWNMbRipoZ399g06tsLW+Z7lxi3dS5aBad0WibIKiMX2Huy5gtl
	2ZsP+E+iIoHWEPVQSKkg1CANo8+sWKYWeT1sVYUhs6exdjYmH1MA7RnNatYgAcdhpVx/bln0PW+
	j209xGxxwi3Qzfp5
X-Received: by 2002:a05:690c:6e11:b0:80d:78bd:7a37 with SMTP id
 00721157ae682-81ef260c8d6mr52675177b3.49.1784603330663; Mon, 20 Jul 2026
 20:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784600387.git.daniel@makrotopia.org> <e7c7944f7ab37332c2afcc808aa8e105e4752a43.1784600387.git.daniel@makrotopia.org>
In-Reply-To: <e7c7944f7ab37332c2afcc808aa8e105e4752a43.1784600387.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 11:08:38 +0800
X-Gm-Features: AUfX_mzmSRPeYPFPJC8VuKfMiw-bdx8XSXW3n2innYVifkRGLxhR_ScL03w_tUM
Message-ID: <CAGXv+5GOhYnziQnKeUYVJVr1Hn3vtE0Jbcqp3FoyT2eJpUEzMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/bridge: it6505: guard against zero channel
 count in audio infoframe
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_200852_043007_C4CF4267 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, Jul 21, 2026 at 10:26=E2=80=AFAM Daniel Golle <daniel@makrotopia.or=
g> wrote:
>
> it6505->audio.channel_count is zero from allocation until either DP
> link training has run once (it6505_variable_config()) or a valid
> hw_params call has cached a channel count. it6505_enable_audio() can
> be reached before either of those has happened, e.g. from the
> audio-FIFO-error IRQ, which is unmasked unconditionally at poweron.
> it6505_enable_audio_infoframe() then indexes the 8-entry
> audio_info_ca[] table with channel_count - 1, an out-of-bounds stack
> read when channel_count is still 0.
>
> Bail out of it6505_enable_audio_infoframe() when channel_count is not
> yet known instead of indexing with it.
>
> While here, fix the debug print in it6505_audio_setup_hw_params(): on
> the invalid-channel-count path it logged the previously cached
> channel_count instead of the actually-rejected params->cea.channels.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

