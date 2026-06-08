Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4C3CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqeXOKCCAHTSbjT3thK/dQntkGiU6yHhlCDunMzJh8g=; b=pXnZpL6SlusqCdN2g2Ywi/6WNK
	PoHyBIPrb6pahNN8QgRgZl2G2EIHqANo/3WJ6CcXwMMHk3bLsQdkU2pSC3uAOayvT5vPw8ee2g+NY
	Sy691n/0Xe8WyYrtoVbqo0PfqOmE6QutOvfNocLXYFj1euEZqrUAR2z5bUvYcDqhQ+ScpviIgksm7
	S3KLh+v9sDmgwxhPJxY5PxO1vtjI3xTWTOLwjbboCIiTQ+NJ/NlzLTzJEwZoOmfC6gCwNmfOSncAS
	VU5tmes1QqS/yh0Je7555NCAFXJVpRo9Nc7+IV5/DzFZ9I1tkkZ+0in/smDC1zik3QbMCs9HWVkCI
	v+l+sQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYUN-00000003SaF-3L4c;
	Mon, 08 Jun 2026 11:49:55 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYUL-00000003SZO-2s8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:49:54 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4863eae453eso1842450b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 04:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919392; cv=none;
        d=google.com; s=arc-20240605;
        b=X8xV4/CERxqDPE6lXHYC/alFRp7/n2zvrCdtdvpaq25IaA9HxnLSfjG7tSSnKxuD9K
         WN47aq+O2TCzwSivk2463R23kgWxGa4054C7JlQiNFBGJn9oQ21nMo62HWdKhWyetRKr
         uGFBNQF9nt9BXCfExIQoav4Zhga3UiXTQ9b+Uns3dm/fEJbFTKIsvSf6i7w7sVZI77ou
         IRGK44turaBXUCicW9yorBAcUs151PG8wWdiaEKAO2lX1Y/iQO+J2OT63422fyqoZAnT
         heb0ZzZwL4ai4rVjIUZ/jo/oSMQtXla593NE318iHgpW7FgnoVim5heuLQXEXt2pN9mN
         evXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bqeXOKCCAHTSbjT3thK/dQntkGiU6yHhlCDunMzJh8g=;
        fh=GRT81W5b1JlFb/Jy4aKM9V7eRRU7r/GOIOqFpV7yKFA=;
        b=jhExv9wv790Xbjrpy+ZGfx++bqhgzFmIBP4CwbWAw+mXLz1VA3RqGgHxP+eZuMImYd
         NkWGKNDuYJNt4IV3GHDx3hZSHJRSWH5KoPYs2eJr9BmVPmy+T3+jTgD8clchUS51lPTs
         w48/HcKKraI8xfehPeVXgj3zxMWpqU7QJ4nOtD0VqhD6xzS/XWTAqF5Rw/+FXO+jfA4G
         j0fpZ24b6GRM2acxcLzm8ymB+9V9iccRKuJxpSCwmfLTVeA+JcfjY30RYieOCcrqchxJ
         CGIWz9bkwbGWHpcBH3CoOp1w6VN/Fa33oohyWESbGTs3pZl9q68Xh2/N+XeUGgDpJclx
         0MeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780919392; x=1781524192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bqeXOKCCAHTSbjT3thK/dQntkGiU6yHhlCDunMzJh8g=;
        b=OVRN5MpIapxIsjcDJqHt8U5PiQDkAfNg682Rm47BAmu5MTGnQwYRSOiOn7zRY00BtY
         16utl0s7cANEt+FI5Hz1Ek36T0TA8i0oSlO7VoovJWbwsXfPeuW93PfqOpEXIDT2qOeu
         bLY1Ca7bRxDhach8Wk4TsiWlqwf4PGadafgC1M2d5C2dOOMHJXUfYQMi1X9MWJj9HlMG
         bHvAI01T4rw6NvDA1q3cXY8hWxFXxiamJibLgUouklCcV++N0I+RWV+miRmGtTfeKiDU
         q6G/zKT1yi0+/uKjfkprxvogDEJTi44Pj0uMmGENwZePVuLSufxfvOspxirnGKEB81wm
         khRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919392; x=1781524192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqeXOKCCAHTSbjT3thK/dQntkGiU6yHhlCDunMzJh8g=;
        b=iFqwhccR4S50vfkuBmWVtkEqHM5ZuH/WEkdqF1XXXrkixQ6jsE55t5VwKJYiiKMOfj
         IuyGvezvve3oMBso8nNGhvxJcG0EbJSlk/r0y9CMfI22t5bIMIQbdC33y2qgUtwtXCRB
         wpwDCDYeIILlwwHXQYkRVygVKHD4/+rS46wYy5zlx4wPX0hzFu+iCNPRpwp0BvkA0r0z
         hCn5zbZZ7clufPGPBCFQpKhO1i47yTr/xnKJrN57iVuamD4GEgrPxMTraA8ukyTYb8NO
         tjU+/+EeJ2efFEHRAhxZGIxjB5RbDcCoXOMQvcevXbsnp2tAuxuCMVD2vmP5x3+GPiTC
         yRzg==
X-Forwarded-Encrypted: i=1; AFNElJ/iCJ6YLvpvd7aKfzjjqgIyfBBKCemQw1HnudChwNp5UaBs6IXWsEW1K1kknO5XBheF509zlEG6GVKhL40+yZeE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywihcp2nHuC0y0YLMm5hi8aEzjEwqx3n6tp83euZEK5otOz+SG/
	XX5Yq2DgPs1HpIwhi4gqmNXYCpTFbMPQma1kyJ4m1z3IykrO16J2S3NCatlHY+mmx2RWS0Wgvsa
	gRy1qcIy1CXXG+135JX+4kDqD23KFDho=
X-Gm-Gg: Acq92OG3CXh1MGW+CQR9XCHupAtxHspgArnAFH/mGx81IVcpDBgRgB1BbRSFEMruahg
	eXZ4y7J3eIwrZyTInSEo5Y8/LxdZVRh42uxigyf/7M8EOdVYZfXZkGqihxmx+RwQXoGfsvZwOsl
	YHttz+LIbt1uFJ4gD/UCrD2qdjJNqz4Fc9XgwQoP9sog9GQ5qzWlXKuD62ZsXpRENqrJ6qRkxct
	+bmG+sINBm/8yvbwfQCSZCzti70/5eU1jinSp+XAGWgi8pr9wJ0puOELEs54qlsquhrJsNPTYFR
	A51DAR1ppGZYNoF/dNnt6IGM+qDqWMR2DKuIEiqYTtO5Ks6bY4M=
X-Received: by 2002:a05:6808:1b25:b0:486:560d:aa9c with SMTP id
 5614622812f47-4868dc63516mr8010687b6e.15.1780919392233; Mon, 08 Jun 2026
 04:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <5277524.h16uAIiOU7@phil> <20260607123739.393974-2-diogompaissilva@gmail.com>
 <c8f30973-450e-4995-b6f5-03e7b6afc75b@kwiboo.se>
In-Reply-To: <c8f30973-450e-4995-b6f5-03e7b6afc75b@kwiboo.se>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 8 Jun 2026 13:49:40 +0200
X-Gm-Features: AVVi8CeJxeUbHghlTxE2UuvYPxQ1LFCbqB8oG8ZnSbGCKhS2OtDVPRGGcmVVnZs
Message-ID: <CAJpoHp7uF+Hgr_-oxxZEkaL+XbyLMv4=khMrfsDxPnty6=4oBQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, airlied@gmail.com, andy.yan@rock-chips.com, 
	dri-devel@lists.freedesktop.org, hjc@rock-chips.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_044953_731675_E1A1DDED 
X-CRM114-Status: GOOD (  11.16  )
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

Hey Jonas,

> Please base your work on latest drm-misc tree, this has already been
> addressed in commit 3de723684be5 ("drm/rockchip: dw_hdmi: Use drmres
> helpers for encoder resources") [1].

Sorry, I'll rebase it on the DRM tree.

>
> Also instead of open-code, maybe a change to use drmm_encoder_init() is
> more appropriate for some of the other drivers?
>

Wouldn't it be better to first remove the deprecated function and then,
in another patch, change to the managed encoder as an improvement?

BR,
Diogo

