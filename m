Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE6D132B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=; b=wSbBG8NsCqXAm2ZpLPfvvI+Ncm
	IkrmM3H270LIDGWg6M9ZWkRYbUUIsdqCgaeyQXoXAqPNF1oV7XnGYHdpJMjQ8lxEOTB+R0VxD1Lgr
	aGenZKTgEmtQg2Y2yqVuuxp/pEeejXQq+2E9wbC/hkNuMflYfPHmoYedwii5mS14aKXhATUxoQ3Pn
	KakVus4jcoUULe09M/EeQAyRT11htUC0oeSb8tqmd18TcvzM47ZUQa6gHqhskO9NoJFZaczmonQGe
	lrLU4rsD4CrH7uQnsuldtcrxw4Fkh2xWg6bjnGHlo2vvQO2xaIq8pA+xTfb6oF3zZ9uT1g/HNk3+U
	OW/CNj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wAG-0000000DhI9-0Y2n;
	Mon, 04 Nov 2024 12:26:36 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w8X-0000000Dh4m-3pQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:24:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3155730e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 04:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730723088; x=1731327888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
        b=oWtzp9w/waVDNE6gii3kEmWuV3LrDlHGs2HggbD6q1wZ0dEo08dY97Y7YnC0ZQ5+N8
         DgpJ9o63CMWrf04h7dYDYSNWuVSpI3ibun9GB74OyC1x7jEoNSn/CuY9c3q49E3HDnhU
         YSYyfS9igoefCf0rd8hjcU3TljpHvRTLLNtQWFx0vtrEkIvpBZycn4Vg8CerrrP+kqsz
         6JoR9syIy5skmaaBKlv55CyKiND4prmG9tQ6kngol6ppwTC+9H0DV85h56ZRJk8vsOuE
         KV2UFGKmzVPY4pfVIn3iYQRMk0ib8XbtnNBGL8txOH6ZAf868oVAU9CxAocvZxpqMEgb
         DvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723088; x=1731327888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
        b=vLWvRNnuKdNgAOg/bXe9eun1hMYPr0yQJoFODYnqTuRG2cNoJe6lAgAYZB+QJnHHW8
         9LpYGFZCrizrFtilXuYgWphK4jSB3NW2gPq7Ih/+Gxr4sl7CS04J/jiJPe1OtDZL40TQ
         pnxk1H2WkF1csSBd8lkgNhjyGNNQI0b7Cb66Pk1NDrsYOVPIa1twbYF4D0QdublScOOn
         zupDNeGaeKrZX8Ygqmk1kAPHHamYiIxjzP0CUbxIXiPSDv7HWBar0uiECNQCze2fzAic
         j9Twmi+b9RUuRmteIrJXLY+7DEIxa60j+WR5z5JaPqP73MH+IEtsd3WzZgike7N+BYzN
         /b9A==
X-Forwarded-Encrypted: i=1; AJvYcCW0MdrfyCCE/EkQdyPn1vWvkOdKfqLcjY/MMvs5c+FVHTHvjDQMY3z0SBA5c8bh13mdJFggSJ1Inubbv79RvL5u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+s4sy6LZKnFDjJn0Hcf6ZPN5bmi9R8Mx1kqS/luDIyjMgwIy4
	hoM70vG3JCYP5+h1O25W522/WatlliJvD9UIlWM2dtlcPZRyTUqjYniSwjXLfHc=
X-Google-Smtp-Source: AGHT+IEtBPydnkTY9XAl3wpUMUwj+iBOUPGy5O30ju0acWB7SwvbYZVi+55EBXKr6UE4cG8VsD+3aw==
X-Received: by 2002:a05:6512:350e:b0:53c:74dc:2252 with SMTP id 2adb3069b0e04-53c74dc2378mr6549281e87.49.1730723087398;
        Mon, 04 Nov 2024 04:24:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95a6csm1666091e87.4.2024.11.04.04.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:24:46 -0800 (PST)
Date: Mon, 4 Nov 2024 14:24:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Message-ID: <ix34xln3tl6l2h3jt7t4bhrydxfmh2m53dkl5rugxj335p7hgb@kfauvwrusipr>
References: <20241028163527.2425783-1-arnd@kernel.org>
 <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_042450_006824_61E98F1F 
X-CRM114-Status: GOOD (  22.21  )
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

On Mon, Nov 04, 2024 at 02:10:54PM +0200, Laurentiu Palcu wrote:
> Hi Arnd,
> 
> On Mon, Oct 28, 2024 at 04:35:07PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Compile-testing random configurations leads to failures in
> > dcss-kms.c from a missing declaration:
> > 
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
> >    95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
> >       |               ^
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
> >    96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >       |                                 ^
> > 
> > Include the header directly.
> > 
> > Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Unfortunately, it appears I lost drm-misc push rights. Maxime, Thomas or
> Ville, can you help push this?

I can pick it up.

However I think it is:

Fixes: e7033bdfd43b ("drm/imx/dcss: use drm_bridge_connector API")

With that

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Thanks,
> Laurentiu
> 
> > ---
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > index 3ec721afc30c..63a335c62296 100644
> > --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> >  #include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_client_setup.h>
> >  #include <drm/drm_drv.h>
> > -- 
> > 2.39.5
> > 

-- 
With best wishes
Dmitry

