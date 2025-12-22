Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F80D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4v+w9CPYJEPXs3YxAAuS8q/mpHCHhgqqzQWL+Q2HXy8=; b=wwKPQAtvujkdDvktzyjG461Btr
	lV1RHG5FYfNzbttqx2iHA1QWIFjEqjX7oSkU3rpzZ+U7chTd8+DzL9nPNCMqI0MxvFzq6nXVDYodL
	30ACklbh9j2PfF9XyGpzXWE2dXOBoFIgh3Xyf240gqOw/wKnwsjJr0SQhUcbi/qDZC9JKBwVY/B/T
	APMEI1NUDBnAQw4MBpckvdILLQPzuOM3ulQN5ATHhwz7y9eFz3fHi8ZHvpeU3Nl1nyqfb+2kMzj5j
	sNseD8F80DXpO4u4zkus36j4kGoyqYGVbsNQ87lnJwAOGaWUCyTFYFH4KgXbh7UDMb93IjGOGArf+
	NZ91vYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcQj-0000000DXAG-2pnO;
	Mon, 22 Dec 2025 09:42:17 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcQg-0000000DX9T-2nZ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:42:15 +0000
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-594330147efso4466603e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766396532; x=1767001332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4v+w9CPYJEPXs3YxAAuS8q/mpHCHhgqqzQWL+Q2HXy8=;
        b=WMXq6DxdtT8nobi1eQal9oJGVDcXwPoW3QJHQ2HS3Px0nwWxgApE0a2tQyqe5xiLYc
         lV+Nt1KHxfoot339yVNYqda8sATOiAGbJ1J3e+S8riZy6WpIOnwr/z9QEOI0PFBQzmpO
         xD+vBzHDl970rNJRNTrqLnV0/yhSx/BN/Nxn2GAGydD9usOflRx/5Pkh4GJ0x+4pDI7I
         RBk7wwiFoKeGmFoYdc6Sup1myR8xIUd+F1mtX3wDSxV/aQgwo/5yfY9ye38JDonlF8ud
         xuMjjjdX3kCwSw2wiXkuRN+kBSIcm1N/W+in/La8L72XsEz/emOCKtFCPavKgpE1RaDJ
         uo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396532; x=1767001332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4v+w9CPYJEPXs3YxAAuS8q/mpHCHhgqqzQWL+Q2HXy8=;
        b=QMQDqv3PmMBFuTBM+l0Mn74nh1aQf+QsVOtqXa0fjCCHDtuC2qBu8x6gn7gmU91t+s
         tdsN5bIfq+fKpACUKEbR/GzMgC890Ykg9Sr4zoPzh06y0gM+E/cPxnIEZ2rbEQIVFQsY
         9LfSDsGD6TKXX9fcUeMlw9Nu0tCpY50+K3fYkECUJ/kMMRkAOw+5q/b8WbuUYVEvkl/S
         caf0qDv6tpLMaIeT014Fq940Iw9lW29M18/IuuIq9XsEGOADDna+O9Yf+psU3XFV9Jpy
         p1UZBjsjqnXZwOtYc4vulVwstkW/4cbS0hGE0ppQaqXd+ICedTNkFjfx8obvK1NWZSwu
         QzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXks5NgDrc1PjweLzVVCI3ElQWiB+YCvZjx+XHqTkSIJQ7z4mRMWAJ6Z5oaCuIUNmrxmaW4ei/ypqUDwTQpIrSY@lists.infradead.org
X-Gm-Message-State: AOJu0YwpPU6RBxmb9H1qVGvMh/SwTkh4q5HznKvslTBe/NDbYfsi3DeC
	rpj4UiRlNYa7O0wQ7jcx9xUkkV6m4MH8XGndd9CX4mp7dN9VADBIt6/NW0dqI7YPjCs=
X-Gm-Gg: AY/fxX7wb8pq5Ucdd3N26yKlisHmUnEK6AKn+e+mZnx7KPUsscgHmbPnP7mrMyp4KaX
	P9kczrODuBgdWj/gykwmTjN4s3gUjzTR51Sz1GsZVlfWwtg8hEJQ3gWEsQzcdMhkGdnvd/Xtbi7
	K6/crhwgwSAs/vD0soHaWe6sSW7qARU7yrY9y/giS6SMC5tm0RihYGHbGDOUWQBhlRbC4fynSuN
	WynwGCp+cyczmPb+AB0kR0NyL9twTDDCPYWsQxyvf1QVTG4pupoY+kZl870UNQnNKiiM2c5RQQg
	r7jR+MCW+LRhFchlzmB/mYJTET7gGHylXN3SWdXBRJQkcYK92Q0LUzo18fm2Ky3wp8LB+7iMzKN
	pact8DwKWrJdj5s9TfEx1NzxXgYT3RmUqF7YfexkRsIosKGiEUv/PckaLN7b9qWDALpjEAguqLC
	X0Ba5k4zNM9j5mbW/Rtm2oSD0gSfgGcqClPa2rPlzlECrtAyMltxdatxg=
X-Google-Smtp-Source: AGHT+IGro+wwQsR/NYh1lOG3a8YsY1zVzwtGWwXW0iRMHe8R+JAt821t5/4DYVjAoWTd+d+cAOY8xA==
X-Received: by 2002:ac2:4e08:0:b0:594:93b8:88b6 with SMTP id 2adb3069b0e04-59a17db705bmr2948525e87.38.1766396532340;
        Mon, 22 Dec 2025 01:42:12 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5e32sm2958869e87.8.2025.12.22.01.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:42:11 -0800 (PST)
Date: Mon, 22 Dec 2025 11:42:10 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Message-ID: <aUkSclVzlRCXDdug@nuoska>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014214_755696_8AF8C8CF 
X-CRM114-Status: GOOD (  16.61  )
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

On Thu, Nov 13, 2025 at 03:37:11PM -0500, Sean Anderson wrote:
> The graphics plane does not support XRGB8888, which is the default mode
> X uses for 24-bit color. Because of this, X must be set to use 16-bit
> color, which has a measurable performance penalty. Make the video plane
> the primary plane as it natively supports XRGB8888. An alternative
> approach to add XRGB8888 to the graphics plane is discussed in [1], as
> well as in patch 2.
> 
> [1] https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/

I've tested this series on AMD KV260 running Yocto genericarm64 machine config and
core-image-sato with Xorg. This series fixes HDMI output using X11, no need to
configure Xorg to 16bpp as workaround.

Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>

That said, I also tested
https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/
and it works.

And I tested and submitted the patch for zynqmp framebuffer to prefer 16bpp
until different modes are actually support, which fixes Xorg startup and
the depth detection logic used there:

https://lore.kernel.org/dri-devel/20251205123751.2257694-3-mikko.rapeli@linaro.org/

This series and Mike's patches enable 24bpp mode to work, which I guess is the long
term path, but it is not clear to me what is still missing.

The patch from me fixes the current situtation where only 16bpp works but framebuffer
driver does not prefer that and thus userspace X11 uses the default 24bpp
which then fails. My patch could be merged right now until the XRGB8888 support
is finalized.

Cheers,

-Mikko

