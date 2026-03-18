Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C8A103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+z67iI4L59MdutM3mpmu0rsH9NTlRmTzd7nYcIbwIA=; b=JsAsEXzQDhqMTM/HqhqmQhdUbf
	dGdZEnt4AOZBva2mTDIqcNe8BgfZH+WqfGYXI1+SeTw75RDyNv4qpHBwjmVG1GhDV2ztdnf+JN+e+
	NIDZ10a8nmly6tD+xiEGMmmvd4+R1FEpxIhEqcklXxfpBTcUloykjfIyQoSaYXdP0H03EredmYMwT
	b4oaAp8QdaE0Bey3Y8M5DGIvbFYmmP5rSrWyRTHdjKQPE+Yj61lrNWrfKkreg3fjWJOR1OLzuzj55
	vLAqeWak+8L0FsvxIH/HdyszzfRCbZoT3f+rspFZew42pQAtYYnz8uMngngkMBi1ri4tbd5WLBy1P
	RJk2uVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sq7-00000008ieG-3cFS;
	Wed, 18 Mar 2026 15:29:44 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2spv-00000008iaS-3nir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:29:33 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-89c5340fed0so11499676d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773847770; cv=none;
        d=google.com; s=arc-20240605;
        b=FdJnVNDvd8vRUjSiB/MlUD8ynWVWZv/I36uRJXupspyWfDkPsr9RU2MDO8Wm4rH1bG
         iHMO8GbtNVhIc2lhCl7J8Y0/f6K1W7kS/5LMsXzht+P/YhIrbPepPDDvEsdrqfVW6BvA
         Pu/aA4YT5Wt1hGnTpXfukyaCO6hkNN451FKkz/coAAg5Y9OuQEc6B9jEQ6nW+3ix1MgA
         zwa3ryEykEIddoHWNZM/Xra0A6MZ3otrLAo7E4tBJt0/o6nrn82U32vDgSoW2yA98CCx
         rEjUklnuizzKk6wpv/4WlUhpc4FuAkP4CWG6KYz/udlTfUTSc6qGJOTxsHb0YbmobxqH
         NUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1+z67iI4L59MdutM3mpmu0rsH9NTlRmTzd7nYcIbwIA=;
        fh=Xe9TJ3Ygu1XEMIRsE99UfwMctyONhW0rNzcd1JAZlJc=;
        b=K+IlL5oT67gnrJ7xLVCXUO4oOTi93JcMI10tBZZztAoZWltgMgUwiIn22o5F4Itjr6
         laNYwEQpKbXXH7znEEmlBd8YExdjPeh9mYN8vmFLf/uWTwpZxAfLFP5UfA3hqc0e2PpO
         aaMcBCKeWnckc+3h3WVVk8m/4/LqDc/y25JuI6UhsEafQ28ZsBR8jCLOf1xqQxfXAS8V
         gb6nvkt79gpUBXL9pM1UF6Ge2Mb27fq9bGOdr8UM9q1BxQBu/KUON1d1pWhFwSf0jXIO
         DidzK+5DeFuAoQOgyqkZSv+GG6Y3bX1Q21ZhBn6yzo4jBfsCNnzxWy8iZit0W+ORoxe/
         1cdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1773847770; x=1774452570; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+z67iI4L59MdutM3mpmu0rsH9NTlRmTzd7nYcIbwIA=;
        b=l88jkp+krTI/wWYUrJGdpgqmJ5kxXLxajRxebSAX1GW/7WLKR7hrEa5sozWztdZ6eD
         HLCbQ0dvQR92d3VpsIW1jLwAOwc+YBeLRDYeULtyHH+2XQFJS6qGHqzUDwrxzbJRctHi
         ztOyMtOxMuPF4jEeCyuK4uAROR7bVbiMi3rfFZ4Ly2KLTrVD5Vn4nkiTp042cQnpSSr2
         tsVCO6UdsxvPYsdNjghsOXRgqPF2U3ArJG03644K93xt/BXRMUMcUj8wi8+I4AOpAML2
         p5p4WCErQZSHboDoo8H9aYYXFckJUT79iMIrFJKxEyfsVJUxc+0xV2VgxxDQepXnwD6X
         xHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847770; x=1774452570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+z67iI4L59MdutM3mpmu0rsH9NTlRmTzd7nYcIbwIA=;
        b=LQDvqXVqlboxoUl4nb9F7g3tL3DkJK59uMjBm2p5ElfTDWkGs5p9aaTgRSYA0+uRSq
         IaGXoFm+j3gUnS3q8GJM8HjnyW8uzTIvn3jHNQmN5zAAToizyomcgBw6bh2j+8ZP6KZ3
         MWD3W0UTqWI+Yjr9+pXQRvsvOgNStWAnsaqzTskMzra3ZQFoEUTw3n0XcDUUWsOjPKJb
         G977vatazvQ16d3V4TKlTi6SxPN20gSlhuUo0WS41bboRhg56JougUiv2Vkikxr1AtSc
         6Ne5NHaoVuX6c6dJN3cq83NxATQdem6mrr+yY8PIF8hDquqCFBSD32PvuoTOF96WCjKa
         pSLw==
X-Forwarded-Encrypted: i=1; AJvYcCX1QpTjQa3wcEqc2enHBPgoaawK/Z1eVWfbQJsDNomGeGUxKYpbaSgPNR2WtwgcJnoUOyHwqpQHRMSrf14Dr4Yx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhe7XCJhSAZu9YqY/z/jBNsLyyoZPXaXfH3zDgv8dWM0vfv/rB
	e6803yWuF5O53VePuH4g7Ufh0CFo55+hyKZAvb59hYDux2EHyDW+MfgzCyp6r7mKScmtYmuJ+H3
	7r0pdBa/H99L1dzrCtGJtn813a3rWbayZ31rcblqzqA==
X-Gm-Gg: ATEYQzwugW2HPlTznFWhyAN733r+HVRZi5dbTGYYL8OvQG2zhLYviTxwkTSx8T83hRC
	9RwV1+lIynHuN2yRKV7JxJFjvI61DOIYKBUPFbpXBBeRpyLp0xFTeJ+WK3nLNARYqu2JNKjM3Ol
	BmmRBcpRtpgV2M579WOVPNbqLsULCjbWj8FuNr+EdmFSHnnZ0SQ3KlupWuBWYzLhut1hwxd0Kcs
	xNk0OoXMKuv62LMC6+RRW8qAmvlY7dcvAx7wcld9aP9J9kEjtjE5dV9egTKPCVhFKDPagFEpfEQ
	yul0C8M=
X-Received: by 2002:a05:6214:1c4f:b0:89c:44f9:e894 with SMTP id
 6a1803df08f44-89c5e41b9f7mr103159756d6.35.1773847770018; Wed, 18 Mar 2026
 08:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
In-Reply-To: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 18 Mar 2026 15:29:17 +0000
X-Gm-Features: AaiRm53yGvgJgOV9I3p6FzqNAFzKV2WD3m1y2KktvZYLgOplUbSfLUgC9ZelTk0
Message-ID: <CAPj87rMW=4=0y_WZAhaLWhnEG1e-sF+Cn4XR57+p+d5wy9BvkA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matt Roper <matthew.d.roper@intel.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082932_082175_E64202DD 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Cristian,

On Tue, 3 Mar 2026 at 19:24, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Some display controllers can be hardware-configured to present non-black
> colors for pixels which are not covered by any plane (or are exposed
> through transparent regions of higher planes).
>
> The 1st patch of the series provides DIV_ROUND_CLOSEST() to uapi, as a
> prerequisite to the 2nd patch introducing the BACKGROUND_COLOR DRM
> property that can be attached to a CRTC via a dedicated helper function.
> A 64-bit ARGB color value format is also defined and can be manipulated
> with the help of a few utility macros.
>
> Note this is a reworked version of the patch [1] submitted (many) years
> ago by Matt Roper.  The main changes are:
> [...]
>
> The subsequent patches add background color support to VKMS and the VOP2
> display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
> families.
>
> The validation has been done using a dedicated IGT test [2] - see the
> reported results below.
>
> On the userland side, a Weston merge request [3] is available, providing
> support for the BACKGROUND_COLOR CRTC property to the DRM backend.  It
> relies on the already existing background-color setting in weston.ini:
>
>   [shell]
>   background-color=0xAARRGGBB

Thanks for all this.

To ssh://ssh.gitlab.freedesktop.org/drm/misc/kernel.git
   25854131c04a5..bec7cbfa7d4f5  drm-misc-next -> drm-misc-next

Cheers,
Daniel

