Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A8AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 03:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=; b=sD5q97fRGcFHnLr774PIdtWtny
	SMz2t/bniNew3edS6weNMiBkqIjRVsfN+lkaKKHZq6wZabfYtaKjd6VU1JACqSWniszlrUz2vnv1L
	QyQ1HCmXr1gETSExaQiLvfQa62mrISS4Odz1c070dzDHA/8ii46hhzn5+E7ghSR06PVN1LcIeKaqf
	BZsKsycEU8mOoybtx9jkoMnJ7I7K57Bo4J5Jr/uPWLyL7sGb+aq7JvtUMkcCma0ysiCm2lAH5aBjG
	Ev5pc5f4dA/XGxpaWDGVKSS1/6B0o7cWX11qu6xJLQCqTz2kbIfzeAjXZSQgq1AlZfQwNPcEuB84v
	fzjS0BOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsYs-0000000586n-1xiy;
	Thu, 06 Feb 2025 03:28:18 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsXU-000000057vY-1mor
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 03:26:53 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30616d71bb0so4902411fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 19:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812410; x=1739417210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=ouLjqF+XR/EVSmMHv9Z1VUTDVFAzFmpbc8/VF5WpYFjXYILQ5354a4UbEBVP5ddq9n
         VCUI54IuC9x9Ix47ZFmdmsG6tbemWcOgfssa1YjW7Gej6YsXsGzagKN5b/owWHczYB3l
         Ruwrj93wz5LnYUEVUU7nRwDZUQBEiesNndkj07/LG2/9ZMWeJDSMYRp1v/yIZf5j+sTo
         dIk/nQgWLIgYiOoFJmOlrSyfiOGST7SLkapD77IVoAhGMm9xvQeD1ky5YI3pGCKKPnId
         cWZPV2HTOZyERuH3G/xt8Kw4NG4gWMKOtBqBg8BEVG3uq2Mxs4efmXMSiVJE/zDijS0n
         fhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812410; x=1739417210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=b1fbM6CAT0ymDu8nAvbZDC4uxJllxiJxE8GoA+6jZqdptWcaCKOaGMlLYguxk1q8Ie
         uufgbXqdIPA+aPRoQi3lZfAhrEz89pCgJMbjcw7fd5lCVK1W9Fs1rP4ETSUQuli0GSmh
         ST0gIX+qF8tNUMqatLJVUOTfVSRp6JQns4OrcOAEGSwOPoW6hvxj07rfEUSUy7L2DTgh
         dR2QUXpqyCAth2YJ1MiOeQguwbBz37sm4Iblu4UYQ1u6sgv5PqozR9yOiMvyJkDszaX7
         1PIYNn88YWKN7y1oVD3ccVViG8qShf3QMg4W0/IallMnJ4tMoLBR3TPOwytb6g0ApZI5
         r3Og==
X-Forwarded-Encrypted: i=1; AJvYcCUipR2zL168VMsnx67/ZGB5TYzOP/nZYXoN4vBWqcPdG/HHtrjqRvsN6oGneVjDU8khgJ5FLhilWnQKLs4Bq6J9@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlp+QcWjiFElJTx0BjVtVUiB9cZguBCIIw0G5qp1fw7bG2HTA
	9wx5CjQ95DpqsTjvLeMqbXEKMV9C0OzHtAAfDLy8UAyxOrpGK20KMI/JgeEhKzo=
X-Gm-Gg: ASbGncuK87+iOAjB3RX3M5gf7k7PGxDTI/u29Lkx0imqnuQT2J6AgY9k7c1B2vrA/BB
	svs4t2o2SqvwN9/5vXawHcOFoiABfsUMPcHJr42mJSWACs6CPTrvC4DnhluBX8PVM74ZeOXlj8+
	Z1kEjoZjdXHqysg5LOcTaWIF74ovd2vOpYDrfNfQJbPCvWKWortQmTjHVXeznbjQw7qzOu2Q4iv
	oRh3RVwVBAlwz+267aINQ1mQ6B7SBeDrYOjTKv99xlGvBAnoeeGHJ+yyknC0PG+oHzwq7/ZiLGz
	XR4h0FwSdxk+gPMQEB2kvN5pEVkoBD5eSM6aa2+mGW1wZK0+bLeIoj+Ki+RZvzqedYUrrNk=
X-Google-Smtp-Source: AGHT+IHW1jb3KW8x6tt/qBgkvjmxR3wnyBKxeKsQxRREB62A0u+WNaONlVtge6tXCMFRwKna1G8X8A==
X-Received: by 2002:a2e:a54f:0:b0:300:33b1:f0e1 with SMTP id 38308e7fff4ca-307cf23dbd9mr17475791fa.0.1738812410424;
        Wed, 05 Feb 2025 19:26:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1c797csm236761fa.63.2025.02.05.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:26:49 -0800 (PST)
Date: Thu, 6 Feb 2025 05:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v5 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <lnsv5o2uln3bvwryxybx7xb4w3j4e3rr2h5inj7t6cat5zord5@lgohn6yrygrt>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_192652_472042_230A0E27 
X-CRM114-Status: GOOD (  12.33  )
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

On Wed, Feb 05, 2025 at 11:10:51PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This display controller is present on M-series chips and is used
> to drive the touchbar display.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig        |   2 +
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/adp/Kconfig    |  17 ++
>  drivers/gpu/drm/adp/Makefile   |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c | 276 ++++++++++++++++++
>  drivers/gpu/drm/adp/adp_drv.c  | 617 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 918 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

