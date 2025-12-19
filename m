Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662D0D78769
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPb4j3wVisA9JnR3oRWF7sfi9svvn8zl+0LCubY1oLY=; b=TZmLa++FcR4ESOtcBfqDeodeMC
	6TmP8LaI3ZLIj8BvDU5gsoPRHCd1KgfduZsJZ3jF8vjyXP0p71ADWS0U6Chsozp3HH9c1o92yVzJB
	JdhJYkURlUTK/mOuJb7OUetkKt3ZMMJY8xcbazcVbKTanPIaLpjE9fbbwwRkwi6HJlFxgciIyCDmr
	UNb1wKfEBwj8cXx3An+eUTDRmK4/E7C8SGwjioOBaS78y3affIunJgZ2kEODVQQd5xIJXlsCO6plR
	ctouodih7Tnq0pBmwo+6gWFP36QzhhvF0ZCTJQwUxovB5igxwQ4p17JW5Qw1fdUuxFMsgAZiS2tea
	zjODrBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZcg-0000000AIIg-0UxH;
	Fri, 19 Dec 2025 12:30:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZce-0000000AII8-1Z3h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:30:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-598f81d090cso1922069e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766147414; x=1766752214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPb4j3wVisA9JnR3oRWF7sfi9svvn8zl+0LCubY1oLY=;
        b=pBm2NRjYRfaVnDMVhj1qjVJyMGGSk4Lv09xES+5Ox+U65wajaE1OpfXqbtW/ce+hi9
         C6H9l7c2GC4cInax3i439i2+qeSKGQi/oZE6F57m9ZISxnmEhjtWKNth1AhKehDpdHpe
         bMkYOSmbiPSH/faQLfmjm1Xq52NorxU75/kD9qpjw6IbsYzDioxafSgsTpHMdgw3rSqq
         pRT/qVbNSxZD054XGNGhye1uGX+HEUXY6O8+Mf4X8TmDNckBhZo7xhwbcn/Meg0zILA1
         4E2Ree5ZKrR1cKRFKIxiy5EOJ6rdIhzfHG55AdIIJqWvqvpidH4+6V9Vjrq8rvNzcmlu
         c54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147414; x=1766752214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPb4j3wVisA9JnR3oRWF7sfi9svvn8zl+0LCubY1oLY=;
        b=T7ijpzcms6F1tFJVjiLWEZtwA3LgTmH8heSwJwwvAivsTIophpIg/xwFlLKMGH5QCi
         794WRRfPBBAb5ivxBe9urcc19NkGkP8y6o1HebIdiXwNjkrvkaE/biZHCvBhVtnPP6oB
         XHYhD2PtexIN3wUfyX/zqiQZ/yx+UXtObxKmuNED4N9UZFXqwgeH3IoZymk+Y8X7NGju
         7nKmtl7F8FPHvA6kRVXozJjFD4Kc01HbdWZlE7GqFwrfb54mWSMq+/sFLleRbZJtOo59
         zW3g/toNNOexW0ZHykDCSkwvgh64xIEE4UF5rWe6SLpo0gQijW9Omg/ZQtP//xaUgNA7
         OE/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbyisin/711yZozwh439Er0uX1EFXPzGfIYw9oN+tcLBLEicMKrKl9b1+/AyA4gfMkffllhaUo5suvq9X/KeW+@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYYTrkblouK94oFOgOlwSpMbgaYirMlujrdW1iU8UK56Oc9bj
	ObxwO3ozQkz6QtlIWQ7STwWN5SXLxEWw9ZTII3aKCalFIsVvBeHmCDjGXR8oXwxpUZU=
X-Gm-Gg: AY/fxX5f/XKkuXWAtzycy4naM60OXtqBRmh4+kgJ6hxqJgFYI3LXcCBoXq3CUsX5lm9
	HXnJUcaSDGFsyrNnspyIOmExfmhz0lGdHsVhu+dm8bTFof4pdMwPFm4G6pviBwMovOISFJhOzkA
	4ltpsKA5FESCXzND9x41nJ/5bSk/u8lfB2JJBoks7sG6WPs4kmArKeW+R9d0PLmASik4y/2+cKl
	u+2F5Xx32e8amQnFldEcSduGwerkhejLOWmKxR9Dx+qInSp71X2k+1RsSZRIP49zvTk1tSALQrc
	fNSPPLT0KiTk0HLE1JO8RpyPyOvegnX/5KuFvUQfP800ff/MRg2CPejnwaoBUKMfXT2rEAimv8o
	nxh12e/nij+H1qI3+2U7ik/fMCHs78BarS4z+70hxPoxdVF1fUbWA8U0GJye/sOwOvB/cUOyI3S
	q9QZpH+6K4w6GE5D/D7pCRvQbZMufSthQxlCtZb1vnOcQLOkbeL7XfIVM=
X-Google-Smtp-Source: AGHT+IGJG+5oeetxlteCBI8eC8fSDh53fINWZpZaKlCc+ybCfd0LgBWIHILYHH2d0ftxpNb+VTZkhg==
X-Received: by 2002:a05:6512:2304:b0:595:7daf:9425 with SMTP id 2adb3069b0e04-59a17d3ea12mr1114950e87.28.1766147413776;
        Fri, 19 Dec 2025 04:30:13 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ee4sm681986e87.17.2025.12.19.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:30:13 -0800 (PST)
Date: Fri, 19 Dec 2025 14:30:11 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aUVFUx55XTjb_2nO@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_043016_457391_1DF2549E 
X-CRM114-Status: GOOD (  18.53  )
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

Hi,

On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> Hi Mikko,
> 
> On 05/12/2025 14:37, Mikko Rapeli wrote:
> > Hi,
> > 
> > Currently on default yocto images Xorg fails to start on AMD KV260
> > because 24/32 color depth gets detected but does not actually work.
> > 
> > These two patches fix the issue and now 16 bpp gets detected
> > and Xorg starts and draws on external HDMI display using
> > kernel.org based linux-yocto kernel.
> > 
> > Anatoliy Klymenko (1):
> >   drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > 
> > Mikko Rapeli (1):
> >   drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > 
> >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> Did you notice the few already sent serieses on the list where the topic
> has been discussed?

> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> [PATCH 0/3] drm: zynqmp: Make the video plane primary

Oh I wasn't aware of these.

> Or is there something else on KV260 that messes up the 24 bit color?

These look very similar and likely fix the X11 startup. I will give them
a try.

Cheers,

-Mikko

