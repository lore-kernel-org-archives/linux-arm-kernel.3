Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E81E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=; b=PcQBRpJIIYf4kT5OsTh4UOydlI
	NF8ZfJ/c4y5mofrNVgVbOj7ZCVrWzmbEQKUSZh4YO2Ptu/AGANO4jaX7NwPVcAZlRoxrX2Lfmt9TB
	B3Ut4WwNL71mfngPvhpQ2x4p84qIVdfNwRoJ44DK2nj82bmoJk38eIpXsh5W+FH/5hG31srj6x7u5
	lwDB3G23cUzDmHedOVHY/X5gVhMQgMRI81/NO/GcmcCh+preExP/Ke7BjpnBTOEOtXTABrh9IN8xh
	EZT0FcygIEIw+a5ch1S0i+caDFbayAIdLEe9gHopx2I6Ym2eaYDTLwa4H+k9M7RYoU/fIVzQUnt7x
	VAtDwXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyb4-0000000E76z-17cw;
	Wed, 04 Dec 2024 23:15:54 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIya1-0000000E71X-0OOf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:14:50 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so2250831fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733354087; x=1733958887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
        b=W/phdenCTR3C/UsxET5YQCv9QqwIyKwVorXpviThIRikPqSPWTivUR2u4wzIdKCV1C
         WivM+RvXgLhC/oTgmrrbBdWJClwX38RwvCrRXaSzYKJBU//1XSygP8E0c0Ti7Z7V7E7p
         dWL4pVvGV2GlOuarSBCVkLXFazJAMAfjJ/Y62kggv42cdepz6kVliWOcIUlNuPV3QVyA
         jLWPJ3N2+BH70TWXILOOdyTijPMq+Cbr+eSQ6lDVot5Tv8oerb58CIuPQf8yVk2iyOO0
         gBIvVvF9cm3as70ouN5Lp5XpwvV5eNnouUQUHFCl5yHqc75tuGdXzpWIFhMOI58keVjZ
         UVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733354087; x=1733958887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByDBggfihaA7bzylhtE2nPcYIo+DwLJnDtkfjIDytqw=;
        b=R7mAzY1454KjxByqTYZod96ALltKUo1ZSH9ltgO+PR+IqMrDhljmFgoj9e+j0IdmZW
         fVTVJXqw1Yt+PbWElykfjXPeZSNDYY5xsV4Dg+9JgvP9JxY60BAHgpkbsGkuSPkMC0tm
         t9mbB8xEtaWS0oukExeupHXHVMKGlDGAZXaN8G5jT/RnpDqnbqVa5e7guj88ftICl1dM
         Q4WC+NplsNLLKSinA2PfOjWvG/cV2Bujupbe3C1JUrfdv4gDzy4yCBbqbLW7RFLM4cQR
         iZECiQf1YC0+GdQkH6Vx7GmbiLZlD7lel2LBKGXTONXY8eOT8+OsZAzeAETC1uhQZEnL
         3Xdw==
X-Forwarded-Encrypted: i=1; AJvYcCX+86/yUdItlhOw4D1YIfMaYlGtcrXtmpjseJNbENy3+zcgnMzCHLKMjY6hGDY1dcjJyvJt6wDnTAPalF15/ENa@lists.infradead.org
X-Gm-Message-State: AOJu0YxEEjuo1TJj8oUQe/pajeZIY1xO7N8vetQT3G7wYlBYi52hIhWC
	EkVDEVEWcHTw8nGrp1h4ILGZ73VfMlWoaoeRGDvfhRdMEigojFAZ8+MgBPohG9s=
X-Gm-Gg: ASbGncvsX3Rm5kANOPFqfZyXc6kuNSZsgF1mKd4tMbTsZMtgzi231emNEf+RuieJNR9
	vgKhIjQwxoI6IctPGUit5ec6Fb2ZSGUY5O4R/jZHvAOOoTRzVdkl+B330QCuUSB2WRYzxnU4WEE
	tDFC1R1sTMTqhLVTiDU1AsJR11dAMhZ5Axdke0CcEl7L24Lh655BtqNWqfhSLHzA8EMrqG0qZih
	EDaVUTB2f1LYvFILR5nwMv1i/Oge5btVmeqnh3xSLk9Y1516uIWKDvAfQUlCXdT28Z0BCd5ha89
	+rmgZsJhGkcaVj1/roxbqOws3bBtfQ==
X-Google-Smtp-Source: AGHT+IFuUS7Not1i5YzDB3gHy3ub9/hXvCvAwbQxzNqfeGQDqOoYZ6k6qPs0qszHy91ZjySfOh3ENQ==
X-Received: by 2002:a05:651c:210c:b0:2ff:7a4f:e770 with SMTP id 38308e7fff4ca-30014eaa13cmr17797471fa.31.1733354087009;
        Wed, 04 Dec 2024 15:14:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e2085fsm158771fa.83.2024.12.04.15.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 15:14:45 -0800 (PST)
Date: Thu, 5 Dec 2024 01:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <couqmlshll3v6vgziqnt6sq7caf4nart42ljo5fbim3rg7ec5o@3ym66tyaytd2>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_151449_153120_3D54886E 
X-CRM114-Status: GOOD (  12.41  )
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

On Wed, Dec 04, 2024 at 04:31:12PM +0200, Jani Nikula wrote:
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
> 
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
> 
> v2: Also update drivers/accel (kernel test robot)
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

> 
> ---

-- 
With best wishes
Dmitry

