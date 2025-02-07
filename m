Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D06C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=; b=yYYW+WMoo6etrh2s36HbUEGTb8
	KQdhIP9UBNcdCYYVOuq9y42w5EOHxTMqQNUHjZv+M2F3FaV4boQLTEevg8ot9lfUAcpACvlg9XVou
	e9sgpeRORfaOb5CK8PM46VB4BHkjwdXQsuQKdUX9Ea4+C7xJgH8w4ekypjRX+0dxeDrc5uWADS50i
	Wg4lA+yNr4vq+teGHQmjmrV0ZKkf2gzjuRha1eRR7kDgI/+bGeXqlqtU63rA7jzX10/G+E1/M9/2H
	XEG+BOMxlGlxQqInfYWhnOW9Gm1S67ou85dvOCjrqd+y5GqetLkaLYlKsRT7DZy8uc8agGyLbjE+2
	ML5xysVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEKK-000000086nk-3jbg;
	Fri, 07 Feb 2025 02:42:44 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEIw-000000086en-3pDP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:41:20 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30761be8fa7so14968521fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896077; x=1739500877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
        b=f9EKIfUIefgcLrwcDeKkf7M/xrVTEryEpuilOgaJSGecvkg/kTtG4h9OSEvt5Qh1ZQ
         UtmpDyH5XM9d+Tm2z+wVSbjiJTbmybQfsYT7dZ5ucAGpWoKW5o76x/3U330j7Cy/sdH2
         DSJHlUmR1G4tIRoOvKFe1pXyJxtpH9X7x4veGCMxd9iHgOJ2b3f4e2RtZ6k8Y/R9OBkT
         O3ARyPfz+ImGGREkmMTlKnMNJkgTLrhysWUzILtCKDIBQUazHdK31iWW95OzqxR8GDkh
         Gcv+Os3QdBoEXgIWPfOpc6EcclLfjNYCHMs8gvquy9PlAo2AGsa3eg86QjnwmOOQXjju
         AjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896077; x=1739500877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
        b=cG4hkG0nDuKQdbJBGZIGMefzt+4D2hC7+HpFTYfyXyUpokr8UJVJPxLLHPzclM0W8w
         RJvwHW/fACingFKc+XxuIb3jCVn7yjIKQHZx49ZDE//MySaNeuKhGIh/yuUK0rHbTLYA
         QsVuOK/OJPPqkfpdzppOd4ge/RPHSD0jWRHJzX/3KCwvtX7ef3MRx8txUHmHrxQr25qj
         HNT2skoWEkSERqngMDCgsleK+wHFgAZZM3+pSdZMrS49dmExL7jdqLt8dLR09CFL+cOf
         x+0ZxGMmjTpsp+V9GwK3618pjE3HyIVRGInWksoEWDpcseg5x2bpFmcnkGvewv0dbs9R
         Clyw==
X-Forwarded-Encrypted: i=1; AJvYcCUrTj6eSJv7IqhXz2Xsy/InnqsqsPI6qmT1jvs4/VFQ6WUhmGLXpxv9QuWmEUKDVc9K7z2yD0Xq90DJPUsslDml@lists.infradead.org
X-Gm-Message-State: AOJu0YxhDFFsIjRAcivj9Hd9yATg8mrUOid36gHAIn0XCnwBxuuK/e+Z
	k2izJtHyseckgtIFxi0SvyLkWnL6IQi2j3Ms1XNOhIpCW9ulrOS2G3+XOZl9z+g=
X-Gm-Gg: ASbGnctwhcuQxco5L7Lup+0IOhcVSTrrtK0gGzZD+yJqq7wqqIY1e5aGrNPOQ9y6VOH
	A36ZpZYOzmrIyE22/Pz+F6Ud0nnmeJ+mvZSX5xJ2oVOSCFfiBdARxWVy3AbRxtPoTkBCxzd6W0u
	6m3FuhcYVkU5ivUK9zvbSGRIObtle+CBgttAV5XzfvSvpKVWjoXOTTgLeb/jzLBe7FTy+LKe9FA
	GBogD+9A+H65xTWUU5Nv6HJnsFrOQuxRT05LjJvAscrZuRjN14L2iS0rXa2fSy3dMA0McQNY9Zs
	LxpZOGk6QYB/tZp49Ox+PwMcXLm2YJaldBRNlh0MyzZeGLfLpvbksZbELjwYoky2vJ6tJIk=
X-Google-Smtp-Source: AGHT+IEIcd1sCML4fLg7Ve3DlNewsN2pmF2R25wfRsiSNl5rJY8Hp8NDfnaEsylPnGJC1zPGHr481w==
X-Received: by 2002:a05:651c:150c:b0:300:1f12:3d54 with SMTP id 38308e7fff4ca-307e57cb21fmr3904511fa.1.1738896076944;
        Thu, 06 Feb 2025 18:41:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177cc4sm2954991fa.7.2025.02.06.18.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:41:15 -0800 (PST)
Date: Fri, 7 Feb 2025 04:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
Message-ID: <vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_184118_969795_EB8B277A 
X-CRM114-Status: GOOD (  30.89  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:20PM +0100, Luca Ceresoli wrote:
> The global bridges_list holding all the bridges between drm_bridge_add()
> and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> it.
> 
> To avoid code duplication, move the code printing a bridge info to a common
> function.
> 
> Note: this change requires exporting bridge_list and the mutex protecting
> it.
> 
> Also add a comment about bridge_lock to make checkpatch happy.

I think, exporting mutex _and_ a list is a bad idea (especially since
they don't have a proper prefix). It might be better to make the
bridge_print() function a more public one (and name it
drm_bridge_print()) and move allbridges attribute definition to
drm_bridge.c

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c   |  5 +--
>  drivers/gpu/drm/drm_debugfs.c  | 70 +++++++++++++++++++++++++++++-------------
>  drivers/gpu/drm/drm_drv.c      |  1 +
>  drivers/gpu/drm/drm_internal.h |  9 ++++++
>  4 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 241a384ebce39b4a3db58c208af27960904fc662..87cebec2de806781cee22da54d666eee9bde3648 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -195,8 +195,9 @@
>   * driver.
>   */
>  
> -static DEFINE_MUTEX(bridge_lock);
> -static LIST_HEAD(bridge_list);
> +/* Protect bridge_list */
> +DEFINE_MUTEX(bridge_lock);
> +LIST_HEAD(bridge_list);
>  
>  /**
>   * drm_bridge_add - add the given bridge to the global bridge list
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b2178864c7ee12db9aa1f562e106b2f604439f8..7424d5237e7615d63de6bba572ee6050da6709d0 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -740,6 +740,30 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	crtc->debugfs_entry = NULL;
>  }
>  
> +static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx)
> +{
> +	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
> +	drm_printf(p, "\ttype: [%d] %s\n",
> +		   bridge->type,
> +		   drm_get_connector_type_name(bridge->type));
> +
> +	if (bridge->of_node)
> +		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
> +
> +	drm_printf(p, "\tops: [0x%x]", bridge->ops);
> +	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +		drm_puts(p, " detect");
> +	if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +		drm_puts(p, " edid");
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +		drm_puts(p, " hpd");
> +	if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +		drm_puts(p, " modes");
> +	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +		drm_puts(p, " hdmi");
> +	drm_puts(p, "\n");
> +}
> +
>  static int bridges_show(struct seq_file *m, void *data)
>  {
>  	struct drm_encoder *encoder = m->private;
> @@ -747,28 +771,8 @@ static int bridges_show(struct seq_file *m, void *data)
>  	struct drm_bridge *bridge;
>  	unsigned int idx = 0;
>  
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
> -		drm_printf(&p, "\ttype: [%d] %s\n",
> -			   bridge->type,
> -			   drm_get_connector_type_name(bridge->type));
> -
> -		if (bridge->of_node)
> -			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
> -
> -		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			drm_puts(&p, " detect");
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			drm_puts(&p, " edid");
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			drm_puts(&p, " hpd");
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			drm_puts(&p, " modes");
> -		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> -			drm_puts(&p, " hdmi");
> -		drm_puts(&p, "\n");
> -	}
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		bridge_print(&p, bridge, idx++);
>  
>  	return 0;
>  }
> @@ -802,3 +806,25 @@ void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  	debugfs_remove_recursive(encoder->debugfs_entry);
>  	encoder->debugfs_entry = NULL;
>  }
> +
> +static int allbridges_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list)
> +		bridge_print(&p, bridge, idx++);
> +
> +	mutex_unlock(&bridge_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(allbridges);

Should it be DEFINE_DEBUGFS_ATTRIBUTE instead?

> +
> +void drm_debugfs_global_add(struct dentry *root)
> +{
> +	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
> +}
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..9b6d7bd16ba409b6a9155a9fecbec6bfdd5ea0c2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1120,6 +1120,7 @@ static int __init drm_core_init(void)
>  	}
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_global_add(drm_debugfs_root);
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..b6e875d4b25faae6bb0bb952c3c12bd4819698ec 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -48,6 +48,10 @@ struct drm_prime_file_private;
>  struct drm_printer;
>  struct drm_vblank_crtc;
>  
> +// for drm_debugfs.c
> +extern struct mutex bridge_lock;
> +extern struct list_head bridge_list;
> +
>  /* drm_client_event.c */
>  #if defined(CONFIG_DRM_CLIENT)
>  void drm_client_debugfs_init(struct drm_device *dev);
> @@ -196,6 +200,7 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>  void drm_debugfs_encoder_add(struct drm_encoder *encoder);
>  void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
> +void drm_debugfs_global_add(struct dentry *drm_debugfs_root);
>  #else
>  static inline void drm_debugfs_dev_fini(struct drm_device *dev)
>  {
> @@ -241,6 +246,10 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  {
>  }
>  
> +static inline void drm_debugfs_global_add(struct dentry *drm_debugfs_root)
> +{
> +}
> +
>  #endif
>  
>  drm_ioctl_t drm_version;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

