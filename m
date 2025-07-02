Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC466C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=; b=VnG0mJJIsxFsJO
	SXIp4jju3/Hk4PPITyKiuxuZJEt67vPZmEmXUHIh+KRyeXTb5w/2ulr5IOn2kgxOLbL08Sv7DIiLM
	H7wmjoefXpEj4t+1x6paTgmIWa43+1YmfTMvBmjOCpLLmWVnRC6U8Jap+6KJJNBUJhZRMsk4IY2xV
	MjzGrG62I6G44NY/Cc8QyVWiFCKVNnOV7CK+avYE19PySoht+FoaREO2ZBlFu+81rCTTUMgVAN5LG
	PhDWdaoirjpt0WDIMLaoo7OZrCWOm/e7uFmiu0O/1RirC+D86NdRnYKKu+fL2+6N//4W19g4/FXzM
	mYwGFfNAttUQgS6BS3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrqq-00000007UhS-1f7e;
	Wed, 02 Jul 2025 07:25:52 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrmx-00000007UNv-2rY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:21:52 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5561d41fc96so2561094e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440907; x=1752045707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hg/fpzh0iibuHgzu9OoE8pUDa3xBOZXjJIvugVRypCg=;
        b=lux5AUm8fkMj0j03FQE/8Rv5jcJV71jzUpYT7LuYLFM4h9R5CJTjvb2ktIcZPmPwiF
         j6gvtNzGzmjrCV1bkiKyKWcZtpi8xVVUxrgleeCCPkv4mxv+t9NOtA8xulb5LDS7tuaU
         IRxX+0FBnJq8eFjrPYeGZ4E6X2EXDoOmpoCLFFIXeFOXK72n6ZAsayz1glJ1SLxVpe6I
         56maom5/Bskzln26JM4xUfR9gm7FD8Vk2r8cZnhGyKbbGO0ul4XQlYu+WvE9L8IcOSQ0
         ozoGUaicigO4kiqLL2FJgRKantaJDC88UY/rfF0K9lljd6sdUp1pxUP99Lg8Iw/UHOF0
         Dj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWjdI+8Pk1nOddNbbV9A8Y54ePwVbM5ZOz6Z8b9Yi0bbJSfxO7YFfUoCjB5l9Z4QGY5luzJUfi+/WOTZnKWH1QC@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEF97ZTbtNCwVk5IOTzsdA2P/y5K/vltNDnd+5Pa8/Qek1FLw
	EQ8NKmIni+V/Ad2Yi1tooDrPWuB7SXj1Pm6KiC/RdGzeV/1v5Ol1DB+89NVZXalw
X-Gm-Gg: ASbGncskcatzriKAeR8SLhbUvyBUhkEhtiD3eCr3GsD4NGsXqWUNuIJfEJ8TuoPOc8x
	S7mYh6j7SuxhUUbIRzhffynrKUxau2lIfSNDxQGyO7apRhut7VRQn7EWUO8rULCGQKLHtclsj79
	uO/k9NaO9Y1UNtADvEvWVfM3EKY3CoUtCgk2RzFu8BJyM3lkwRdR6Cq+cotbPkxNjzyiCBzP9As
	/Uvg2HJ5HLql0hsZtQawBsZesEUnnmac9nAmJzrupcxA7evC6vABsVyq+YaM1ObbaCRf44/ib8y
	1iVx0THHwERfZzJm8ym3Gm3eYTqLaJH83WUcsjeVJ6QfsGOA8yfXMEuBdbR8cllLhYZYp4lET+6
	+Zsz4affrgfunkGF5fhP+sFoVUW6xRA==
X-Google-Smtp-Source: AGHT+IGL2Z7Go4YuKIXvkmrfuG/FRewSm4HqpDEu1KMwDntr2PZiglau672YNWgQuB0k224Veu09og==
X-Received: by 2002:a05:6512:1396:b0:553:aa2f:caa7 with SMTP id 2adb3069b0e04-5562831e54fmr615185e87.36.1751440906611;
        Wed, 02 Jul 2025 00:21:46 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ddf05sm2046070e87.230.2025.07.02.00.21.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32addf54a00so34283121fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 00:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF1/ImdDy+Er6kPskCS92CqIcnnsKIkMcfjWEfnXR3ls9Fp+Ae2D3hFMXm6hKzx7q1M6W2+IGSotskVJZIoYI3@lists.infradead.org
X-Received: by 2002:a2e:881a:0:b0:32a:6e77:3e57 with SMTP id
 38308e7fff4ca-32e00059701mr5163051fa.21.1751440904870; Wed, 02 Jul 2025
 00:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250701201124.812882-1-paulk@sys-base.io> <20250701201124.812882-2-paulk@sys-base.io>
In-Reply-To: <20250701201124.812882-2-paulk@sys-base.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 15:21:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
X-Gm-Features: Ac12FXzCUNmtlDRkeXVtg02FaWchFlhOllywrVEAHXAtLHX_qmyxYGIEnu1zURg
Message-ID: <CAGb2v65KrLwM+gQEWFVrzCcGPL+Fdhmb9b0FTJGkxrDqv4ucig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: v3s: Fix wrong comment about UART2 pinmux
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_002151_717417_543BF307 
X-CRM114-Status: GOOD (  10.12  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 2, 2025 at 4:13=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> The original comment doesn't match the pin attribution, probably due
> to a hasty copy/paste.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by Chen-Yu Tsai <wens@csie.org>

