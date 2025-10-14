Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=; b=eXKzD0sVXzRZXckFbdQu1Jh4LE
	TyeWumPtAL4eLbc66Wy/LjTyKast6EfmSGrN97EQ7+sgvDrxMbeGZantRgg/XLkZeHh+t54eeUQ7N
	WQ3hD6DxkHKaZxwZ1oYTQW+tf9Q3Zfl00IudodLrWW5s/IzCKFauzkzsLNeMzSuVZJkRuJWmhXC7H
	OTE1ZWn8qrNoSc0F8uPjsFor57ICyR99mjDMQwgVGaXLy7sLn/7PMwwncGCE2gJMdH5Svs87C3tT1
	0LBx2YaMJgMNXT+069XCePz63ldAw5jHXS11QGBG8lQT5dx2pwoequGxpqIBded0cmXzfZ0YNQOyd
	OaK/eAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dee-0000000GB8Y-3k5V;
	Tue, 14 Oct 2025 11:57:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dec-0000000GB7r-1MtJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:57:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b403bb7843eso1116670866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443040; x=1761047840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
        b=byW1GcT/83IviJVSU3fjsfOx02TdUsrJR0cAi5FmvwbPxoVri7tEB5JABkB7VKEmPa
         pcmKThyfOujCRE/EiAjfTyOm7wn+kk3SwFPZsLxX2yhjHwrKPYPVmtZOpLBaqYeHdElg
         U4hRMzCBBKfeOwL6MwJ1zfX/RGRsDndD1VC0e98XMHSoI7uL+T6tX0uYlYsgUdHSXLlv
         NeIeFYH5Q5tshvvzhJPKOtlRJK1A5elH0h9TXF2aXWJpPvFLJFBQdIADVVCdCRgPVIAU
         fUn2wHqKaov7v/JWeCj1UAX5sWaJTiPx7SzAEGN2dvz+612Be5GwlEZKs0II4re6SgzM
         OLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443040; x=1761047840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
        b=Zq1gyUFE5/NvPUyvI5NuvQverwckQGAxMIoifDtRYzuhURsYo018k2H6n5skTHYLg3
         gdGo+VfzIhwKt51I1KGnlA6/NHLoNFqNyqTXsGnn96jYUHocHrGkpMGEaI2vcxtn5PFK
         lCmJF5t5q3wYNJPbIhO2NXBhVQbxTBG1De4wR5ZXOGLxj7uklXVUsGDj+97Ouz3Fvisl
         3uSJ7Caa+GptekxPP+3aFOG9LGgjNzZaofG9aQPkw0KiMV1VuGMfCGnnURNxW6dw2dEV
         dstBTTtVc/VXKwItj2kT5jt+kZ5+eKsmElGtrM9UrKyZq3Iw+zOpBqfMJFuwX44v5yJk
         UcVg==
X-Forwarded-Encrypted: i=1; AJvYcCUdgDceKKeF4ok/P66OAQpVdWCt2KEGWA93CBMhomQeZrmpPBFQvjg0V6fhdbxM/TyqgvVWxzrEinYJKSrezn8o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0igG+YuLqnMIiiR0KEpUb1SY2w8PrfWDjIt1lA6kuyOFENxiT
	kVR/Sc946e+56J4gGALdUGBKDVPDHQFaKKpp1LCAK7hjnWs8olmegGhs
X-Gm-Gg: ASbGnctvdrsr+7QDZimTxRftVpdK/BD4++qQsp4O6NG6n54iNb+38YRHpt++PzshWc6
	we38vxhMAv7CKJagpMtKgcyI23CfbBZvLUz4fG2p0kCE10xJFo7i1YtfzrWGJN9SjCaPrjyVwrQ
	ONTvqej9Qhxv7FoSciSsEPmhX7GWsimO6YD4CejrEjF4VagLhH+Nv1TTQG7icYMTH4/T6ZQL/hO
	aL5d9VoCwGbNaXaG+cL6OKc1jYfaTYhdKw/qlw1kIzqe3YbjGeULgBA4/VITB9KGJeQabIqLwJy
	OTT07ssdYWXkrCOysj0IqGrsXiqCaACJsy0AdyYhDc1WDGUB0ndSH2y1pkgADgIFtGn+0NMJ13a
	Poj+ljP22hs/Upm8jYERhy2guMf6pM54mrsnNlV8wR1NciIROlpwZMPfxSnYCU9Ddvp9r7OSh4F
	L5VIwGwdwZz8XWR3sX1cX16lovDQZ4/ETSCmLgIcTwadfpwD9lHsY=
X-Google-Smtp-Source: AGHT+IEO5ExkdB+Vc/eA9hYbJB2YUbFHvlBREw3jtxdBP+T0I/Kox+2SWgXKekZXvheyf/FHTlBwdw==
X-Received: by 2002:a17:906:c104:b0:b04:9ad9:5b29 with SMTP id a640c23a62f3a-b50ac5d1e3bmr2852743666b.54.1760443039715;
        Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c129c4sm1152162066b.41.2025.10.14.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:57:18 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: convert to
 devm_drm_bridge_alloc() API
Message-ID: <hr4htgladsaixbuhz6un45syyynzxl6qpshsss3cbeww6mnj7y@jbqwfnzbufqs>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
 <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_045722_398769_91C40F3A 
X-CRM114-Status: GOOD (  15.05  )
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

On Tue, Oct 14, 2025 at 01:30:51PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This conversion was missed during the initial conversion of all bridges to
> the new API. Thus all kernels with commit 94d50c1a2ca3 ("drm/bridge:
> get/put the bridge reference in drm_bridge_attach/detach()") and using this
> driver now warn due to drm_bridge_attach() incrementing the refcount, which
> is not initialized without using devm_drm_bridge_alloc() for allocation.
> 
> To make the conversion simple and straightforward without messing up with
> the drmm_simple_encoder_alloc(), move the struct drm_bridge from struct
> imx_parallel_display_encoder to struct imx_parallel_display.
> 
> Also remove the 'struct imx_parallel_display *pd' from struct
> imx_parallel_display_encoder, not needed anymore.
> 
> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
> Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
> Closes: https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applying fixed all the WARNING regressions I saw before, thanks!

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Kind regards,
Ernest

