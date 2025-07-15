Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAEDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=; b=eS/SBuib2rFDAZms8NE2O46rXH
	/kxvfOZyFSB7aj3fOuLPmPkXn+nSmOegz7JtcGzCe8jTJG3T1DF6lej1jW8kXe/6AwxpQXXwJ+tLV
	hA4IRodj1UM7mltyNzb16Wnmb43g2U3M3VyfxTbbuofCsCZ7tRtxC88UuhJbOIzA/Pk8xoy6KgFAE
	enCii6+TdzPZPNQdmQ5FhqDxKkUQYU1Ny6U51zLiDdfegV2XOqosVPLcq+Lh4gODAJ+kWfqs1FBoz
	TPw2P3HVsRIYzX69JjBFcgEjo8ws8w8u77CASxksGdgaOFQ6uNk7KZuX6tgDnBVAyyZb7UJPidksR
	HV08Ktiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgoW-00000005PTI-1HAg;
	Tue, 15 Jul 2025 14:39:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfZh-00000005BT9-2Xzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:20:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4108615f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585600; x=1753190400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=cozlFOdO2Nv3bB41CechfNFhmBvC6qoqNvBytpFz3FCQEU/UtnkhIUfbFhW9TRUyHq
         IUjJoftfWYB4Y+EjczwYn7qS5VM9j6y2lTMJyMC88sY7OjxaiPWwwVEonYr8er3D2OTK
         OlsQ8qkJhVANaLGbCAVaXfcTtQtmI+kcJNNI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585600; x=1753190400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
        b=qT/R1kqB04ZIuO7lQ3g1V+ab1REKvAm2u3qQMNIm262xk4Ja7FxEqilTBZlZbkC2TY
         sPurYv/7KZaBf5Iv/VF7LgU24uLOLyU+HGEwgVV+72L86LViXGAYqFb7iXEmu4XQxSrH
         3TiN8/JGfYLSJRlu+cl764zKOYcSMOsk1LC407V5msEqXQMFe1Hbco9BkDr7801BpInm
         qkHe7EcpvLTdU4J6bxreJMQObMvJtROaHP94rWxAkfEyuCVfF92OkO7RdDOQgySwsCK+
         Dk9q5IVN+rtYo+LltDFOZQYIvT9t+njj4N2rz3mAvhKfVNEa29DXnf7uuAEUiKdsI83J
         7tzA==
X-Forwarded-Encrypted: i=1; AJvYcCUupmLRymVnpPKDKT3RKn8fhm2Z2ydLai29hh8R8lFjti3GwsvpA0jAmrJk8FyKVU42I/+b2+QZX2leN0MbzKIo@lists.infradead.org
X-Gm-Message-State: AOJu0YyTP8Xx741jtBOEyA1QMBxh1kaKZfn4WY5c02aRcTNoQoTZLIx7
	lTpQh4T9JjjUxvY2Evdx1w57eNK3ygAb5QBC7yzJzYnrysugC4JtZ/nO0o6/5LszBys=
X-Gm-Gg: ASbGnctu9UXgGZj9u2IEm1f3pHis7OvzRqY2i23gaF0AUeaP+siIpRjJUTwy4UBwzuy
	VvDBxlCLFYwXyuuKOOBs3cA3KG4y6EA0cnCO+Ok/c3hBnSnehoIcjtA9i9tqB1ZmGJOLUQZL9I6
	UuI0hNe6nw8INRJA1Zsvx/vKfr7Fates+Kx0pz8BjW83EhmqDYhDb4ovRxV2KviGIgsC/vMcrOJ
	87TmT7WNSt9KB459z+4M+dtI+Hzk9d8DkrTkf5U++xbULJPxCjk7SCtIZXJLRu5IcR9hXfKrj9W
	KDtLxvhtC+9pj3oLZyMML7568kN4bnr9FzQFw2lbInp0Ej3/MpHbvo5Y43Yw/zBPQ/kdNFMQuBj
	FjNOS9Tx1gTBIZN8fpMuHPJwHpi0VGOk/7w==
X-Google-Smtp-Source: AGHT+IGgOrGKdM3z4rYXREjB5K13TQWQc9hzSbnGlRYyUFMTZTPMvyOf/txGJ4PS42ny0/qCStlXJg==
X-Received: by 2002:a05:6000:290a:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3b5f2e3ad53mr14816635f8f.51.1752585599669;
        Tue, 15 Jul 2025 06:19:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d70csm15389832f8f.62.2025.07.15.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:19:58 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:19:56 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <aHZVfD9Koa-fi5CQ@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062001_652738_1898B33C 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

