Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DFAD4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJB9vsPJhBGqG1y/+P5/s4l3WFLRuJ78lA6bLowUWtk=; b=TPKj9x4f/AIFm5a7VwrHVgqZZy
	dVDxoMDYzbEJjA64emyFAYmJE+Oob4r8RTN1kOJD2C56LtjiO5ZPE6fCa3SjRjsejiKbJyruIry26
	au5ZVkPXZH4ZAnUq+WctmB9H4xawUNfY8A0U/P3p3Vyvv9gw4UAkVQtrmwzQaP2KcHnb9IwfG092Y
	SdhsBarLdlsKvTtsbkHidPH152YyLQmIszDul22DMYGMCC/ZxlfTx9uOrpQyfGrQicpGuzRYvdQrL
	Z0Qvi9PT9CmtRTbx34BtG71Mcgq7QrTVhcj+oGKZrVujItWf/jR/ShJDcHkUqNUnoqZWJfKKba9sp
	9Ftn9xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpIs-0000000HMca-0G5E;
	Thu, 11 Dec 2025 22:38:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpIp-0000000HMbr-2aBs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 22:38:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477a1c28778so6778375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 14:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765492705; x=1766097505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJB9vsPJhBGqG1y/+P5/s4l3WFLRuJ78lA6bLowUWtk=;
        b=VdN5YmTpR5Dj7YiEy1YzsE1AXeDVxt5RFhAWiXdGzcj2UCnMvppKZArBAd2oNdY+y/
         fEgAq2tj4rsPOJcmisCyaz2D5m2j5DRJ05tz616vd9x1x53fkLnNk3lf83k7bub5Il1w
         QJN4gmD9G+nzokaJKIc54xG/cVX5AnFl7CWNVhuE/73jF7eWxmn+XxIEUm7jmzpSyanE
         +BKwfgYkHi4Ekx3NZqF5ea4RSb8J34H5aer4zumnqEmDWVNsegJx4mR2OLDZW8UB9p9H
         usdudEweTZp3DNQldr48qH6I8boAxza3vUzYkbKCtbkQ5VR6TngjV4QnmVHsmlCU2vaf
         Nsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765492705; x=1766097505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJB9vsPJhBGqG1y/+P5/s4l3WFLRuJ78lA6bLowUWtk=;
        b=nAdS3SDcslT7IPgmx45pSMr9QUtWvkld7qaBPZpX4IUJaXgVReP6I2uqjjDY1zdMRZ
         TCOAvZ79cqFPLNkfL7HiBupPbLs3xABWYSVDlSeX2LKyUbiLqwWB+xhr6VtagIyP+vIk
         MVVJnngK9LRLmSC5m3647DYEDNE4chjYEh1CkNt+NcKNQiXVnj3NqCdyzpukIjO09qeL
         Ixar8t8BtMJh7YQXNe7Rwp11Dll9h5CLWLZbNmTK4MqYA4jRt3BZKRT3B1pveY7H/gL8
         B0jB1oVrbQxJ90H6tnWOdH61rQu9q3H+tOmFRxPitpZdYLFM5d0W72B41lA70KZ3zaY0
         98mw==
X-Forwarded-Encrypted: i=1; AJvYcCUR0ZHImrqs0nhMTo8gEUC8CUKCsADIscKYiB4+p5Rue/mUfBhF/oMO6RiNYF4B3WJd29YSATjaIPYX/2YUXDjl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd5mzwLoYWZP0BhE6D/LijDrvlaNWgPbUNWtL+lOgKBuHiFYZK
	ucvlusMh9HMxe6x3YOYUEObA+sEnqtcMoNqQASevVmYhwxO7AIr0aQS2
X-Gm-Gg: AY/fxX5keXwJxMMgM3j5KDM7/iumvBO7FR3T14JpvIEMuWw+dU7iyMdn58kO5VdXg4+
	irNWxQMB+uoi7NDvOlNwuyLEmmusdnaySPrr4D6HEwCThqZ//nf4Pw9GO389lh/63u0jIIIE++q
	+TL7zs7jsFCSFWygXX6hmmWZeOR1J0dBlevEojrnQ65pKjZcVexWvNukBsgBh1KX/whdNcQbjcb
	jUkyDKiiZOh05gqdIhRLVXS3FF2RFVUUUQK3Xv3Vr9w2OTCzgzA2Thqf1c9+uP0Ltl00cZZm4O2
	0ZE9oo/Yw+LYuzXcS/7gpEOQzT23tIlg6BG1LK2SPnd0K9zpo8293QZc96uaAoxT9NIJNAXNv+Z
	n67lJ/EyHeIyAPTU1rAlmfWoQtwlf636BIYqla4P6r3sY7t18N9D7pqH2U4jjU33FzHM//xeG7t
	gLbEeTl6dMZMb8L+HzFEgavk4oM34xGjdenh57N4fRSh4TrPMj+65U
X-Google-Smtp-Source: AGHT+IHLwdFc72oZ+XpABv665DoqMI2joXHmdbmUSRJgh1kVpg1rJGVTxEvlCZOJHg/L9U83lkVLTQ==
X-Received: by 2002:a05:600c:a06:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47a8375362emr95622175e9.16.1765492704852;
        Thu, 11 Dec 2025 14:38:24 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3a20c2sm508975e9.6.2025.12.11.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:38:24 -0800 (PST)
Date: Thu, 11 Dec 2025 22:38:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Stone <daniels@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Message-ID: <20251211223822.6eeabb4d@pumpkin>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
	<20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_143827_678837_715D3D6A 
X-CRM114-Status: GOOD (  21.18  )
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

On Thu, 11 Dec 2025 21:40:31 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> From: Daniel Stone <daniels@collabora.com>
> 
> We should never be able to create a framebuffer with an unsupported
> format, so throw a warning if this ever happens, instead of attempting
> to stagger on.

It doesn't look like you've changed the behaviour.
Except that all the systems with PANIC_ON_WARN set will panic.
I believe that is somewhere over 90% of systems.

	David

> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..20b49209ddcd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>  		return 0;
>  
>  	format = vop2_convert_format(fb->format->format);
> -	if (format < 0)
> +	/* We shouldn't be able to create a fb for an unsupported format */
> +	if (WARN_ON(format < 0))
>  		return format;
>  
>  	/* Co-ordinates have now been clipped */
> 


