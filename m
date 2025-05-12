Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82142C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=; b=I89/nucJ9ZzbSxjSEdODQtlsXo
	h0ZcGwkT119ZQ2JA8ETHLPFmbP0VLsSTG7yaPJHDjF5SmKYWwH9Ebph/Rc/yFgOB2AOmez3pGmTLt
	T5AGHV9f/zAda1mu2CZXqRQqQxvBLxQUBD5/j8ZZEtucfurIWvC9DYqQ3WNdgxEigKA3KYp3TE024
	aJpIzq65fvM1jvk64PLKv5Z3AjWW6zRZfvBPAf2UKYiCIBpBiNWRJjgMBzIdxDLKxaiPyxWl6AJz1
	P8Uvokqlv/0VrYZxxN6bc/puFOIW2Ewwmgs312AC6NdwcELwizzP0U7dXSheMupEC6iOFmAKkKm6n
	rnl8SUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVpL-0000000A01h-1z3v;
	Mon, 12 May 2025 16:16:27 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVRA-00000009wWS-3pD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:51:30 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-72c47631b4cso2853259a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065087; x=1747669887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
        b=AgMbPcKRVxTq49uf+fhB8n54vX2GSYBh5Vxw+w20Xs/0UNtsOAhPQrLyqqkiXB5ig6
         9TIadArDu4wEm0h5isFToagnLI70uaYhtWmF9ryu2yvJRxg3pZJTssuRkpPZci+MDREc
         Rpnbi/1ifhKJjuMJ+8y3lkxy1ymot8TMVKHQjORGk8fowJcnHXcm/aXp5ZG6lM7lWket
         Pa//biihrlwXw35YEjzRr+yN9KyTtyCnXc14jVNOwa5irxL8kkFm+SZVe9wIm5LdIErQ
         34IPnaFpXJQ+y6FKcQtWLviz3MsXm9wGtfRBR19lG5vJiRi3MZPZqDAyl0G0D8si8uw+
         oG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065087; x=1747669887;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld9Mq7+qdXV9AhMC/9M7vzrYD56VNJUHYiEJWfb0qDk=;
        b=gO3e96enDhVg9NtI8bAoXjqD7dLgBjNIwxgR0raXi3QZVRIm+kBqSBniPhVVRtO4+F
         tbXB+U3N6uVwkcNawjPtgbkFZ9RzZ4YUAb8QQw3OIhHEom1YW4IDalxBypnDclFYq3Wk
         kFwBalEMVUxHMsELbhwB9I5Q9ovI2uIn+bflZTIhunacHU3/uPpv0Ec1lGx9sEQyWAn0
         5Rmmbrxh4hOJO8aL3v6qMcyUvressOU3hah2k9sbQncijLhj4uKGrHj6OWEInoFDMe+v
         sqc2pzsbjtbDVMHdP9/wAeBDGGYYM2ruJfsy0XKqM9osO80o59YkB5fALRH+mYhlqGl7
         BXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmizBzekGiZJmLDg6PkCqJMZ0cP+Vq0bTB6h05wohKdfbF8VeUOxX8EOFw51WOmd3KFd1Ox9r1j6aIfuVlgrrJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3DN15y9InKz1jrVEYGBqwSs41upE2TFcmPvB+XJ4N6ntlYePe
	ijzN1KsVltvO5Q9vHBQeQBY4vD93MFiv4thohU7wOdzYUKGCtC7Z
X-Gm-Gg: ASbGncukzsJw5Q6RIYs/mnfhR3ReB1Kun7MS6Lao9qmPbkgftt6pFHS1hoiZ8Rc4sM1
	s3bKo+GKmQMsdkhH2rLnKm3TuPjT6gvqIbMPMJTDjazwLfJnhPw3jXATxhcAva3zHX399fj3Xn5
	Mbf768sV7CgU/LO9dorxKTd0gvDz+SREtw6x1bAwHCm2WRzcCU26ZYW3J/rzRHKmme3p0RzaTyp
	XoCRbg0Klc9Uputga8JK/GnLM2Rt7fvRIx0rw9iOyIQDgCkIk8NDuXZKgSIhbfvTeBeDQvR4J2T
	vS5Q7AjlxP3qjc82ZY89TjlQ1VsxOxrwENv9GHWNBKBXaimlsNyJO59MUTSjxzpH7DotHQ==
X-Google-Smtp-Source: AGHT+IE29HCnAnqJs70fjiVznu2cWndCXxPM0MBn2LaCtm8l99A+94DcdAaY4Wmxo+5EpZLx6ztYiA==
X-Received: by 2002:a05:6830:6f44:b0:72a:45bf:18c2 with SMTP id 46e09a7af769-732269c4577mr9487337a34.9.1747065087378;
        Mon, 12 May 2025 08:51:27 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:25f1:2610:e3fc:c8ec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264dd290sm1579539a34.40.2025.05.12.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:51:27 -0700 (PDT)
Message-ID: <682218ff.050a0220.149fee.dd6e@mx.google.com>
X-Google-Original-Message-ID: <aCIY_ca5PEdgItxE@neuromancer.>
Date: Mon, 12 May 2025 10:51:25 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20250511104042.24249-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085128_951427_FFF7D06D 
X-CRM114-Status: GOOD (  18.16  )
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

On Sun, May 11, 2025 at 10:31:09PM +1200, Ryan Walklin wrote:
> Hi all,
> 
> v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.
> 
> As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.
> 
> Regards,
> 
> Ryan

Thank you Ryan, I will just defer to you moving forward to ensure no
further confusion on this series and will help out wherever I can.

-Chris

> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> Ryan Walklin (4):
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> 
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
>  .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  34 +++-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 +++
>  drivers/gpu/drm/sun4i/sun8i_csc.c             |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           | 168 ++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h           |  30 +++-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  27 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  14 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       |   6 +-
>  11 files changed, 252 insertions(+), 63 deletions(-)
> 
> -- 
> 2.49.0
> 

