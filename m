Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A49CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=; b=XsB+Nc82X47/oIxfkxTfkO9fAi
	hoqMLsWkCWv9cKTk0GeiLMm7BNhX0Q4ahncUKgBGo2gG1Rr9dMsXFJ5WkW7XrxMQN7U+1bexzOh+5
	ta/14zoompFoTRFycNScZ6jE6rRk9sAb6s2QfZDItXJi4tfz04H3JDpXJxxWq7L5r5mi1YS80vAgN
	+Vst3ITFSi0NiexFH7DV6TKXEE9+T+pbsqKZhV/hGEY5cFVPQ7QeBbLWaRJS/UvUuMWfvAc2RWlvA
	Lulg3G+acCBg17zlqbyFZqr2dmdIsBOLRwvvE4qg8VjyToLI/9YBVRzQhBUWZeM9s+N7PfSmaNHVX
	V0drAwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFoB-00000001HYf-12ZC;
	Mon, 28 Sep 2026 18:10:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFo9-00000001HY6-3hh8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790619033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
	b=UpuhIlNJJe2UFT1Iuh4GBHZWobfOJMqqD0kflurAEVbsYGvZEcPmR1E7D6z+QiKfqQtGWS
	N6Z46KWBxDk9EhwpgyTmrVVkUMrq0F5ZLbjfMM8dGGzgZM/Cd+1QCKa8IBABdYXb6De7e7
	jZ2v1GYG4azV0SHCYI8AHD+x/e+/6tc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-A0jtGnoSNAqWd9vm8NDlSg-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: A0jtGnoSNAqWd9vm8NDlSg-1
X-Mimecast-MFC-AGG-ID: A0jtGnoSNAqWd9vm8NDlSg_1790619030
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49fffa5de0fso25408085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619030; x=1791223830;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=dbAeWvYx/tE62HPK2NMJVxw3+hHhAV2f/WKQwvgFNvFSo1WX3iaI6HSXvLqiyIQOBp
         IiGx+qfXtt7b/BIOiy4UnRpoy6eUJ9pumvI6MV4ySYBz+sUVQoJXH1THIls4rlNqTf5j
         KyZGX6XxUfh9IS9eCFarEvhztBFtrcP48UmgTEIlzJclskVHW2CcE9lpHYDkoqjkbOdg
         rb3Km5a66tzEWvDoBsVNtfJsbCmKgYhY4DAWQ+QvWFQ2RoDTFSQNoEUxqXRqctvPl/QD
         PznEVySUJz+8c/xMptpAdZljTCrnDUoZ4i6fk54YvQyQ4LSyTPAo/gEAd0H2fP5Id6D3
         w7wQ==
X-Forwarded-Encrypted: i=1; AKwUvBw69fBgjnOBhG4HC89khLMeK0aN3P1YGi6dMUODyoBudU3cUv886rnrNZn9G9+7o5j9XpfPIX+ZrjvOgxbGpRbL@lists.infradead.org
X-Gm-Message-State: AFuF++ldCwrh/Ryiq6BO190knh264DGWexUaxDUlkVskTMxfEhPNCmm/
	vEDvp6Pa9eOrXyr0fPCgNXh38ka+O0K5aYqMUenjBQe9g8La4AyJS91fPatz/IMmdoJV5sX/Fk0
	ZMagxZS7w4DQy1+Ac91GbPDig+Euny+G2bGjo5/H+cOVe4IPFvQZ+z3p1RqAulqLdiRdJv497SG
	xI
X-Gm-Gg: AYBFou2QUvApodMXcT+a3p/Du84SfV/bKrc4iRSStnZM0cqXcYUpuZG/iRfYBtmbpkH
	Nuq3u/ZviRw2NATfRi+MNYdXrd5xBuefKeYGIGYwR9i33aXtUT8QyWr/0ymsdeFfoPlGUDONpxg
	RhOet2t6+LM/CpwhUmflNNdJfbu2nhNgjQ5QGnMSOx6MimwIYgjoUmGboTsahpXbY2uth4wSm0Q
	S0g1YUFJn6jJ6pQEpyeFomC51MbOafwb7Pp5jIm8Lik8jNhPAyeFJ0NMc9FqEc22RA5iy/gL8LG
	n0BZkixGE+xZo1olGZKB3+myQ4gURwsU1gTgdMt4bfb8R3ALIy6IUtGRr7Tl3Qw9Q1QYAmciQOX
	km5B7oHFSGoJYujEy472rI5c+8hKmw4Gsuoi6EzgAOmxSZ45YyOklgJ0NP9RGU8FMeQ==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712405e9.2.1790619030021;
        Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624;
        Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zw20Pe0-7IXQn2J3VykMVpAZYtDX4ZwB0xJvmk5lp_s_1790619030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_111033_993179_7583FC08 
X-CRM114-Status: GOOD (  11.37  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


