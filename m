Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D244DD29FA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=; b=HVm+QzmIT2E8mP26YfcZmjJXls
	pY/HnUL1l9oTKFdvFGm/lsP7C8dJBiRHQ326Mfgg3CvTAJ5sQxOKUPI63+g6SLaIx+4yrhXfH2Jgx
	NWzQGoy67DDuscunIpOeVaPGCznOI6FQw8K8yOtsyXR9BrX+VF2ufqVvpNdr6WRgkNyCGKEaL9doC
	rbeXZ1iRvtHHvkD3KDg69Sjjq+5+C/UePI8BR+/fDozOe7zTMcayjOETicb4SIk6Hm3uDl67LZjB6
	MchJVPYvUMvFCbbOV5IHD9qcVv2Pu/OWcQBHE8+BWyLd70dzAjRKWfaQYUEfqmufw92ozN464yjTH
	gVypY1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDxV-00000008R2O-2NWd;
	Thu, 04 Dec 2025 18:21:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDxQ-00000008R1c-3pBg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 18:21:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b2de74838so79923f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764872495; x=1765477295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=;
        b=mhpbC7/R1GFmePTZhaRf2w9O+J1mEz0YO+3oHoeoJn14ZhGMiqEwP5QmAubKRPnqnT
         8C7CiRDz0yM1b3jLbGRJsiBaQfEE8OvITo7NdLeqt/aEiV59xLaoTRgAhtDcPH/LVGNt
         O7szyy2bMA9rB1hJkOWSGJYOjYivVG8SSivBnnlkB4rdbL+qClv3ldilz+AUGDb8mFMP
         yDzHEu4xzAh5TNi4UlghPKqLW9l5PVID0L8ejHws1qw0GeJtijifaGcONA4CqHWLZVdi
         nErRPWZX/oEswfbQzn0Q52tUuU0dKZ6UA3RD0Pdib975AFVsA5yLaLASyquN91s3vI8i
         Ki1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872495; x=1765477295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv8P+6IVWvIL0bC+f9n0QNbXSqmfD+me3uZoZ0RY/2g=;
        b=W5LiC+7X6WeVE2qEb47lPqZqeop80T/n/hynVaoBS2uyLLAr9K5XFsMCBloqiLQmSa
         2gG0wkIFsBpt6/NzjXsSQ+oRVR/uREIXWTh44R/0+X2YJz+uoZQ30QqUF1Ok3rG8UJj1
         kZXd8ll7+r5lRbwrO4VP4tZ3b/Ivsw2x8lK9P8ne8YDArBrZUotcsFyE75Y4qvSUFyG4
         SdUb4gXI2WpWpHuFh4BDBwpRQHhRlW8k7D0zMSf18ZBOMKt7DCVUYH3eur+jzdzEOgII
         znGV1xK1Fzs5BO36dWbxS3d4qnrMr2E5mHIe4/NVaD93I7/aJrUbWNwNYqguOthhxGdC
         AvRw==
X-Forwarded-Encrypted: i=1; AJvYcCVXqnL++w31+Yc4vQMxyFmbqj74w9gPTrueJIMFopzXNuq1SoaWRGM5XDdAle4bDOvaoL3CEc0dReHIbdA9/Ziu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtelq0EY/bXsj6kT0uHoslJqg2Tao5W39w+FUxVOlTBMXZhHsj
	hPHvMZelyCrZbIndRXR6f+or9aET9y5xuSQvmMK4/qPIW0NcI+nv94ni
X-Gm-Gg: ASbGnct9teXfgHP7P5yMxHAq+iV/zPYzRWmhWZyjivE4ScKB4j9eoPVMbT8Tpnso7YN
	HkKyDtOMPZhPM/QetlCbTwVXeiH0p8JshaZXvh8typB4YQJk94T8SQsBAmR7t2GiWbN5fCOTJLw
	82Z3GV09UkPBOQ2owM/WWO+1nkNntJLEqiTP7pRB2E+sF9Bcr/4llYaYY7+zHeDVVUWgjWYvoPv
	3qTBFr5y256KAnFtRv2DS5z1GAuQe0MpqD8dn22VZt6ZuGLYNCj7fs9EXvSV6aLDghQBI4i0wTc
	b1WILcBNLbJl0b55qaQHFneacbXnLq97qghtNiEjr0eYrXhMM+FjFwm2rm1k5IGxMgT44Ae64Rx
	Cm1Ir7Odc667Q/y28P3QagwrvLr4aSyvHk0KwevtvDj62Vnqcm9pM/Zx1dJ695YF5aWWOUPxY6C
	0Ujjg=
X-Google-Smtp-Source: AGHT+IEzgG4TzCJXxABGuutxcIrI+o/G6IuaOtE2bigp/vNM2WwpcI6tNhb5bLyGJf4XeLf7rYmrFA==
X-Received: by 2002:a05:600c:8b42:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-4792ae634e8mr38393335e9.0.1764872494836;
        Thu, 04 Dec 2025 10:21:34 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm45669115e9.0.2025.12.04.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:21:34 -0800 (PST)
Date: Thu, 4 Dec 2025 20:21:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frankwu@gmx.de>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204182131.gfqwy566gjzd7dbx@skbuf>
References: <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
 <20251204160247.yz42mnxvzhxas5jc@skbuf>
 <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
 <20251204171159.yy3nkvzttxecmhfo@skbuf>
 <178afbeb-168f-4765-bb0b-fad0bcd29382@kernel.org>
 <aTHIulPW055AyLW_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTHIulPW055AyLW_@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_102139_082659_B6B55E8B 
X-CRM114-Status: GOOD (  26.89  )
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

On Thu, Dec 04, 2025 at 05:45:30PM +0000, Russell King (Oracle) wrote:
> It would make sense if a single GPIO pin is used for resetting
> several devices, some of them with an active-high reset input and
> others with active-low.
> 
> What matters for a GPIO pin used to source a reset signal is "what
> is the active level at the GPIO pin for the reset to be asserted to
> the connected device(s)."
> 
> If we have a device that requires an active-low reset input, but there
> is some form of inversion in the path to that input from a GPIO, then
> the GPIO _should_ be marked active-high. If the same active-low reset
> input is connected directly to a GPIO, the GPIO _should_ be marked as
> active-low. Thus, to assert reset, writing '1' through
> gpiod_set_value() _should_ assert the reset input on the target device
> in both cases.
> 
> This is why gpiolib supports software inversion - so software engineers
> can think in terms of positive non-inverted logic when programming
> GPIOs.

Thanks for this message, to me it brought new info which I didn't
consider before, which is that if there are *future* boards where some
sort of inversion on the reset signal (likely due to it being shared as
you say), they should be described as GPIO_ACTIVE_HIGH, but this patch
locks us out of that possibility.

If I may bring one more data point into the discussion: the switch
binding specifically requests not to describe shared reset lines
(because unrelated drivers might reset the switch after it probed):

  reset-gpios:
    description: |
      GPIO to reset the switch. Use this if mediatek,mcm is not used.
      This property is optional because some boards share the reset line with
      other components which makes it impossible to probe the switch if the
      reset line is used.

so I guess that the probability for a reset signal inversion, even if
it exists, to cause problems in the GPIO_ACTIVE_HIGH reinterpretation,
is still low, albeit for a completely different reason than the one I
initially claimed (which is bogus and Krzysztof was right to challenge it).

> Sadly, we keep having people mark active-low signals as "active high"
> in DT, and then have to write '0' to assert the signal. These people
> basically don't understand electronics and/or our GPIO model.

This is the case we seem to be in.

On a scale of safety, having quirks for the affected device trees still
ranks a bit higher, though.

