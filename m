Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BC1CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=; b=q/Qktbe5FCI7SsJeU2zSCSczia
	RJDBydTkMlBRl3c336LbAbfA4/vOFxSnPpeUfaJhxoZnuwl6LwPRG2HUvYRGwDD+5CkmE75iTaoiS
	fXp2z3KZ6oQQLQw/R94c8LtFVlMgi9ahUkCvt7MJJMoizoVX6kOaEje9fOoKVUYJKORtiqIZmh55J
	x7mU4b8PG+BGiyxXJBMeXIn/kgDeKmcackQUM4FdI5cw4rx/lqe9ABJMKkRuqAphPF7zQWEWtPP5J
	bFWwQORfxn+oLxTrSbkF4wEcQybayMax7TIEc2Kbdovfqe0C7K/lG5AfPOBzrkofcXw1knDlVoFSb
	D0IDvB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7PM-0000000GDwi-0Zmi;
	Tue, 21 Oct 2025 08:07:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7PJ-0000000GDvd-3czB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:07:51 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1070542066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761034068; x=1761638868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
        b=UzvtSiNSCHVrza6aXUG2X4brjFa3Y4TVnwwVDJIawYnvL5dQUBI6PerRPBcklgW0fN
         bBAA5Y1lilLLnlpbuxtZse+87315naD9yG0aUUPCFvwqfS77Oi+9L3VsGbbyHbO8JFb+
         1972zUnWR2uEY4vLKSai0+X4+JwX4siOBbyW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761034068; x=1761638868;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
        b=rZr3BPWThkkmfo6pJlsyH7uJB5/U5OSTEks7/zQyoYrPPrKIPLP55sWXWe9HB4tMwd
         IcVyrFJW6htL139FvjiyPzXB7FBSZMWUdTqpwSSDMZzmpqIRpjWtJodrdl/X18QKQIGf
         kHKc4JEuH2OcXwPmj0sOMAQHi1G7qd3tA+rdz+oxGx+le2JKdo1Kv8toi3+0YywSD0nK
         MaANBNZl+tCcAMtyVcQzl2eKfV4AZbHlFe4rXDoJKtYxbc++z07oTY5KrOKJxT7JDt6Z
         ytSN65Rm6zbDoPNXplzDNIhsSQ1NnHi6P6zvHAc9ImW/jWDgAWUxbEb4gUNAqdMjkLOK
         ngvA==
X-Forwarded-Encrypted: i=1; AJvYcCVeyM/NsUcEMeKjUIyVKk8lBTRa+PU3JHeBRyoizAv8BHyGki1r8hLfOxLLbgVgVGIhUS3s8S9BjyHSMkIm+hLT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp+Jx1XC+ThsIIr7ufpJDZf4WlG+LFKiHsWUl5iUkd4WDQdGMx
	x+f2Bx+YSGkG56i64FZ9laympfoemBebOl2TAhkEX7G/Hhsovcc1umI6c+uZXqSuOm4=
X-Gm-Gg: ASbGnctfpnSZ7YQnXwk6nsfBB5E7HbgpzurOIAywQrjhOYKW0dl/2+Kg6q1x1RWLafj
	WTKTUEkpB2rBQg6HfVNeqov0mb6jKRhV5FOF/8xyCk+Ce4uZOeM/9Wdixdb3p+HzuM/DoSFKaxa
	+brIldJNsVkNo16L40oD9kVQlGNiW3VCEwjlUGTamiYJgkAET5A14YX3BLHs0OV3kZJqGzHLhyy
	vj2TJMwaF48ohoAq1sDCPdxdHUsp7774apymagjGQfpIdiQtton7fzy5/gp8tfoz6Gvi9kP8AJZ
	IjNDxgMmAbFjJiaZFGFfGLu9b9EvsuZG+4AVLMdIhzxNCNSYW5/AOs5GhT1Eugb+3VtjJOR9KC+
	N18Zc1Rfh/3aYrGeRs000nFSCx2MzRKQX5y8ZQ7Ww6aJbWORGpIyMVux8bxN22txRnABgXOPFA+
	y4DIcZFTVtaHuptuJCzm1/XQ==
X-Google-Smtp-Source: AGHT+IEGcQ2tB+9FLkcsMzH3Z3OqGyaRZtqOqXHeWD/7JycNzUq8R6JyQRoeUwJtVWAc3tO+BkBXoA==
X-Received: by 2002:a17:907:2d23:b0:b5c:74fb:b618 with SMTP id a640c23a62f3a-b6472c61933mr1959457166b.12.1761034067061;
        Tue, 21 Oct 2025 01:07:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab65d6sm8600484a12.14.2025.10.21.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:07:46 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:07:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc_UBy5-e6HIW9I@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
 <aPc-Wad85lQWbqfa@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010749_919407_77A68C23 
X-CRM114-Status: GOOD (  23.95  )
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

On Tue, Oct 21, 2025 at 10:03:37AM +0200, Simona Vetter wrote:
> On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > in HDMI and DisplayPort to describe the audio stream, but hardware device
> > may need to reorder the IEC958 bits for internal transmission, so need
> > these standard bits definitions for IEC958 subframe format.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Would be good to get a formal ack from alsa maintainers before merging
> through drm, just to be sure.

Sorry wasn't fully awake yet, I meant that it should be recorded in the
commit. dim has a check for this stuff now and it fired for your patch.
-Sima

> 
> Thanks, Sima
> 
> > ---
> >  include/sound/asoundef.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > index 09b2c3dffb30..c4a929d4fd51 100644
> > --- a/include/sound/asoundef.h
> > +++ b/include/sound/asoundef.h
> > @@ -12,6 +12,15 @@
> >   *        Digital audio interface					    *
> >   *                                                                          *
> >   ****************************************************************************/
> > +/* IEC958 subframe format */
> > +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> > +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> > +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> > +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> > +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> > +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
> >  
> >  /* AES/IEC958 channel status bits */
> >  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

