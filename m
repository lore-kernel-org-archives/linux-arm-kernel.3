Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQhvgvLw0Ab8WRqkX0Q6owok1NJpwPhofznn4BvHFOA=; b=0k7ycDLNU//LFfzYKAkXwDkCjy
	vprivIoru4X2FIA6as+PgDcxvwvIIvIAxjjPLG5g7t8+S2udpVOKS8RHqExyX3cY/g5JGmaZGjieQ
	14k9cO4yaQEC6PmQ3qIx83j0DfarW1LQb4VczKmFIc+QngrYnrqab3bAmYqe8HlvUgKbLhC8Zvmjr
	pj1C9gi6n8uzvpjiWJl6/+L2c50xoOqg/pVL2f7ZnyjwGztVlg9uQBFOhGBOKH0vcV8LgZDfu217y
	WDW0FFX6V0wVcOIrJ7LmowTQqeW7j3H1W87jbEGLF5yHPwH6TCOUydfNkUbB3aOeC6rqxMO1ZgnOV
	Qj+8d/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGm1-00000008Ma7-1fen;
	Wed, 12 Feb 2025 17:43:45 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGTx-00000008JJs-2VyI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:25:08 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5fc8a0cb812so1714313eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381104; x=1739985904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jQhvgvLw0Ab8WRqkX0Q6owok1NJpwPhofznn4BvHFOA=;
        b=jd+8b/565BJy3BFMyRV8BG7nPVic6WKVEl/LtozSsH3yU7Den/EZbwi/eaiPa38Sbz
         1OqDXtwQpmLWOqawg65pJr8PZ7GmIYLUBMGho6M+vlads8cmGHeTFJDVwyKR+q2TBvqp
         6rbNVmA6Z0drSJvmwZvYpFJt8bPXVrY6Q0f+J4Z/B1tcpyL5XwpkqgA1vTnyDgdh/Qm2
         0pJ8HXO8fhQNyEuJ6nz7OjrhUH6P5JnwCBbeLQXuN2Ob/BMQPYt/ruia8H7W9YVfSQb/
         p+mvka4BSrn8icaADXxllp5uGEu3wUbqT6BcDtlqT9IxxTa5lxqYLNyVaUR5D0ItAXqG
         qxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381104; x=1739985904;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQhvgvLw0Ab8WRqkX0Q6owok1NJpwPhofznn4BvHFOA=;
        b=wXulPkepKUqeh9+ehR7aMF6+gSwvS8C7mo1p1Gl/Yubhcr8FlqQVRXXYhB7c7uyIqo
         JAWwKgjEw1AUG3NQ0xoUN20agxvfEVkziMQl1miOhFb0/gZdvoarbXLPYiZmjys/JTxS
         VPbQ/TGZ0eo8lVP8/Eubd0DVdR+or+YSu/y2TX0bygof9SJSjcWrV6Hc8hlnpqJxUx6N
         v1+pGTWIg0F2LrPMudVX58yUFxC4kxWadKaQ5SLQxPnRaI+UfZchb/a8wanZmx7aBNE+
         tjLz/fgL7UgtlRPBmfxfP1p34i3+YFJm6Ugh0QxwJBPziVBtHLApET7njvyI47fUaP4y
         dYXA==
X-Forwarded-Encrypted: i=1; AJvYcCVk13sIqsEx40Zkrt1kLYBOQDTonPaRga+H/sfzZtv4IOpVyjToBtPyE1KsxQTRMUeC+CKxHJ2HZG9K6Uv6jO1A@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+PMRXdrHfDdFAtJSXEXfdSEdMtLyTFt7DDtWW0GBBSm6FKoc
	cBy4SldSpMPWDw1e0qgYytO2Cjo+524ViIqRzTB6YaGS2gxifrl6
X-Gm-Gg: ASbGncvqoBcn+heQ/B1jo9Ja1qsU0p5QGUUtZfDfxRzOTanEBUPaNjJNsK00ox6TH5H
	oQYPHl60h3uBX5B8u5WbijeuJiPEMRVuD32ZooovaUjfTzCQ915XsLxPizF1DgMw8yEdGYM2zvn
	L5HMG3RFbceVr28yMPWeDV4yr4aWY/XUBCCJlW7yNLt+VpmLrz6rQurBWN0aB1P1ia8Lc/3Z7jR
	hmKubUHrJW+8TBtxzHnjpZ9+jiP3xL2Bhbn4xtFrI9mwHMx83/TGGJ0Givcn+KLH4WzRxxEovTn
	j76PZMdfnMJHawpLeAFxcw==
X-Google-Smtp-Source: AGHT+IFubc5w1GwArkfUm2wYuLBD6zhCQaR7Tbp8g3XURKKlpZTfkEzbGo2CJasy4U3o+foCvJ2C5A==
X-Received: by 2002:a05:6870:c69b:b0:29e:4a13:603f with SMTP id 586e51a60fabf-2b8d644c5efmr2872725fac.4.1739381104281;
        Wed, 12 Feb 2025 09:25:04 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b826262333sm5089109fac.37.2025.02.12.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:25:04 -0800 (PST)
Message-ID: <67acd970.050a0220.1eb03a.101e@mx.google.com>
X-Google-Original-Message-ID: <Z6zZbu5dABW8IrQC@neuromancer.>
Date: Wed, 12 Feb 2025 11:25:02 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
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
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 00/26] drm: sun4i: add Display Engine 3.3 (DE33)
 support
References: <20240929091107.838023-1-ryan@testtoast.com>
 <cfc66e71-4af8-43c8-8b86-0bf5208b5c42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc66e71-4af8-43c8-8b86-0bf5208b5c42@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092505_639059_F48E2426 
X-CRM114-Status: GOOD (  32.36  )
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

On Mon, Sep 30, 2024 at 03:30:45PM +0200, Philippe Simons wrote:
> tested on 6.12-rc1 with RG35XX-H
> 
> Tested-by: Philippe Simons <simons.philippe@gmail.com>
> 
> On 29/09/2024 11:04, Ryan Walklin wrote:
> > Hi,
> > 
> > V5 of this patch series adding support for the Allwinner DE33 display engine variant. V5 is rebased on torvalds/master as of today with the 6.12 drm-next patches included, with no code changes required. V3 and V4 were in turn rebased on top of the layer init and modesetting changes merged for 6.11. No functional changes from V4, fixes and reviews from previous V1-4 added, and relevant issues found by checkpatch.pl corrected.
> > 
> > Original blurb below:
> > 
> > There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.
> > 
> > This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.
> > 
> > 1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
> > 2. Add YUV420 colour format support in the DE3 driver (patches 5-12).
> > 3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 13).
> > 4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 14-17).
> > 5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 18).
> > 6. Add DT bindings for the DE33 engine. (patches 19-21).
> > 7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 22-26).
> > 
> > Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.
> > 
> > Regards,
> > 
> > Ryan
> > 
> > Jernej Skrabec (22):
> >    drm: sun4i: de2/de3: Change CSC argument
> >    drm: sun4i: de2/de3: Merge CSC functions into one
> >    drm: sun4i: de2/de3: call csc setup also for UI layer
> >    drm: sun4i: de2: Initialize layer fields earlier
> >    drm: sun4i: de3: Add YUV formatter module
> >    drm: sun4i: de3: add format enumeration function to engine
> >    drm: sun4i: de3: add formatter flag to mixer config
> >    drm: sun4i: de3: add YUV support to the DE3 mixer
> >    drm: sun4i: de3: pass engine reference to ccsc setup function
> >    drm: sun4i: de3: add YUV support to the color space correction module
> >    drm: sun4i: de3: add YUV support to the TCON
> >    drm: sun4i: support YUV formats in VI scaler
> >    drm: sun4i: de2/de3: add mixer version enum
> >    drm: sun4i: de2/de3: refactor mixer initialisation
> >    drm: sun4i: vi_scaler refactor vi_scaler enablement
> >    drm: sun4i: de2/de3: add generic blender register reference function
> >    drm: sun4i: de2/de3: use generic register reference function for layer
> >      configuration
> >    drm: sun4i: de3: Implement AFBC support
> >    drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
> >    drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
> > 
> > Ryan Walklin (4):
> >    dt-bindings: allwinner: add H616 DE33 bus binding
> >    dt-bindings: allwinner: add H616 DE33 clock binding
> >    dt-bindings: allwinner: add H616 DE33 mixer binding
> >    clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
> > 
> >   .../bus/allwinner,sun50i-a64-de2.yaml         |   4 +-
> >   .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
> >   .../allwinner,sun8i-a83t-de2-mixer.yaml       |   1 +
> >   drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
> >   drivers/gpu/drm/sun4i/Makefile                |   3 +-
> >   drivers/gpu/drm/sun4i/sun4i_tcon.c            |  26 +-
> >   drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
> >   drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
> >   drivers/gpu/drm/sun4i/sun50i_fmt.c            |  99 +++++
> >   drivers/gpu/drm/sun4i/sun50i_fmt.h            |  33 ++
> >   drivers/gpu/drm/sun4i/sun8i_csc.c             | 341 +++++++++++++++---
> >   drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
> >   drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
> >   drivers/gpu/drm/sun4i/sun8i_mixer.h           |  31 +-
> >   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
> >   drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
> >   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
> >   drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
> >   drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
> >   drivers/gpu/drm/sun4i/sunxi_engine.h          |  34 ++
> >   20 files changed, 1269 insertions(+), 205 deletions(-)
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
> >   create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h
> > 

I just wanted to add my Tested-By to this patch series. That said, I can confirm
that we also need to add support for the clock and reset before we activate the
display engine. I'll submit patches for that in a different series (it's a
pre-requisite of this but can be done independently).

Additionally, I do have a few comments on the yaml documentation.

Tested-by: Chris Morgan <macromorgan@hotmail.com>

Thank you,
Chris

