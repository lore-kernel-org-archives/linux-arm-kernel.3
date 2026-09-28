Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9BBCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=; b=M5j1JoRhQaJh/EGUTb1QlvNy41
	RztDHJlk4Czhx9kEhM041AIClDT8tBBBXJCoHVkFjOljp2FCV6Lp8pshIDiVHdzcBKgz+NYDJyaGM
	G+DA5ePRNnIt+cSfYPmjqEft9FL1lBbb0oRLejlbl9+ovfinqW3AuAj5hq+g2MAEJYATwwGuP2fdw
	j3dVT3NpCHPNmYuGHMe8fnMCfZKo9ARc+sd1pXNc7c94gozPvOimUGJOglXarP4+4cJqJ6310UMkQ
	t6CznsyVj7Q3TftZwCgDsZtTqA9NfNd+xBp040HqOXOvIJtIA4hEnSk6aM3H1ccXJQYkG53tKz6s9
	+UA/Y5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFnG-00000001HMh-3vZf;
	Mon, 28 Sep 2026 18:09:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFnD-00000001HLN-3Ouy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=A6biqNKXoIYIsoP4BCSWnzSdE+Qo0qGkMIRW3A9+nQGJh5MzKzkRmpny5t80bfArJOzMbx
	GqsLZHQf4LKot3eng/aUwK4IZGim2JK6l62nU+PoCjFZGsYBE/z4jyWV6CYHbwTfP1djXU
	uKNckHVxNbjD1AvbM3DfrU2XnMIAxwI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-7nMEg7EzPj6nSQ5wk6ywlA-1; Mon, 28 Sep 2026 14:09:29 -0400
X-MC-Unique: 7nMEg7EzPj6nSQ5wk6ywlA-1
X-Mimecast-MFC-AGG-ID: 7nMEg7EzPj6nSQ5wk6ywlA_1790618967
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6ba4abdfso35375655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=CMXYvgU4AWgmWHfwsMZ2Q+ZMTcGDF/Ms9eS9f50Ejh1c5rytTPc8zrwqEPRqTgzlKo
         EPlLw44oiDxg8zO9yGNFhOUOj+/kGDI4FBOz2wigE9oeyUYmSM8xcNUvK7t+Pt+MXbXA
         jXr2030cI6SR6K9BlB+twotRn4kTPLldwZ0PEtqhlGpPAwHdPTKDnSXeSGrPc2FoZ4wc
         rnpJdtTEV7ctPFNs7GPXN1QPXBUlTdneVFBYPqTaqgSHrFe3QQJtGLsHZ1MZU968KNzv
         ONstdKmtCiUFvYAPHG6y0xrufM9cJUmUIUI1gkxDUdkrbwio4+nHhtNiXpk1pkhxWIfW
         MrFg==
X-Forwarded-Encrypted: i=1; AKwUvByo4KTeByQ4B67TExv8KfgSByD0Z3MbLyhFOK9AbhmguY7/hUyClrH1DmLnsqx1QQ6kqU4eIAHojCZ3uheP+6Ls@lists.infradead.org
X-Gm-Message-State: AFuF++mISYaCoCjwWt0S/Fr0lL6fCjkNUveWw/TOGVT1w6JuHJl/+iyl
	EHzopUMPhpFKhpeZEjBRRyyFIMIONiryrhRfB9lKg8jKSe1mVW6BGMPGJXPS6g2Nak0HiifEiqh
	ARYe6Z/o6n4o3UJ3Dci5TAUql5zb18vLuwbyuHtoFWxpvD0aaRxRWI44gyNL4wXNnlqYP2upR54
	v2
X-Gm-Gg: AYBFou2vuI7vVwxBR6q+77N/sH/GhJAT/d5mSVFxDF7wqoa6GJpflJ9XOBQ6A54RLfn
	AklmIj9r1igV0TbLNIKLEft1ZwotNfnhv1ui4eyFxOUZfQlRtlUvwG8W4llOkLMvTMWrQrH1sxJ
	oLdMuRZ+p2d2vnb2/y9iXt/lFmOIE7U1dK3bDBSNj4bGaHV36obMv/6LmisAJQ5ZtvqsVThZOE2
	GrQeuS8R5rjmbE+w3fJutAFHND2vmbm+THxy+UaS4uzSFvJLtPMh4PwFc8hJR7EtnB5HWg13D03
	m63VsW3duXBo6VO3qWevN5nzdy/2P27hLNFB5ANSk7YN737KnDixNDPzOf9j/I4XzV09Jv+6Tqi
	DnhaScoYLhe1D8X0dOJ//XrDLGC8SHebdZNhYYI825pNTFyuvbrgVK5ZujplrBCf9Sw==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739875e9.18.1790618966874;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lRNVFOIFJM5NbNTeuTah3TcdlCnu-KNc_KLSTPCM0nU_1790618967
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_110936_041935_39F73FDF 
X-CRM114-Status: GOOD (  13.66  )
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

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


