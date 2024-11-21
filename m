Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB68D7877B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP6pOE3po/1ziJMcsJhojsNldXrvD7NcZzZfzxDnn2Q=; b=wawBl3yiLcfnbCKrxeG/POFAXw
	we/Ej/S+vR2BIjNZmvKORaaH9M7/QSPwGzL9FYlpJgpRbOuFLQWWeeRdykaaweq+MCiYf+Whg+XU5
	inVOkm18EKi3U5MAREN0CiqooCSqXaG85QRkjCN4te3zQcKG72bmxMPyj7a6VDjpECmv/wDbuP7Nu
	0/T9D+RGXNNaNsxekfOvEEPiZDuYWONuUrX4/AbIk1/71oK+/DWYJRPD/blbBdXmWx0Kbpt77vJdJ
	w/YaUleDQoVrApmaplciZl9lri8Uiovk62IvAlyMEWHGL5WJOeYV59YEMBhSXFrXlIpxjhVPziwpY
	W5C2c1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9G8-00000000Lol-49p6;
	Thu, 21 Nov 2024 15:38:20 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9FA-00000000La6-1qSY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 15:37:22 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6ee8e894deeso10298957b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732203439; x=1732808239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kP6pOE3po/1ziJMcsJhojsNldXrvD7NcZzZfzxDnn2Q=;
        b=V6etmKaF0mvRm82MfY+kXTMnJoobzKH7isxILcvDqss6usce8LAlJePoRbi9rDNo+I
         K1LLuTO+NJ00dnY2xg2guWKejopc9KaZouhBlm9Gf2E6v8gTtY6Zlrgrx95cjEgj23iI
         1RcarJeMv4HgqIvGJkszfHL9Ps9FYpFTPz8Af+DuDGNmP97BsEgu9pKv7JebeQD3LN4h
         iGQ6gKfU+WgGNZk3YG91R6a/WkB4EPPkzBrfYcyJ6gnofRxOGHYw9ppF+DZJB5/vdB+X
         30x9PEKOsrwU1euN8EP9y0fpaY1v9To2fI6jLTVxYMrtiLgMeLpaLxu5+NMEdgnHvAG6
         xEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732203439; x=1732808239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP6pOE3po/1ziJMcsJhojsNldXrvD7NcZzZfzxDnn2Q=;
        b=baum5oO8n+Ebu6ZIv9vgdPhM+CTbRs2pfeiWlAZwMCeoI6FZIdE5K2SOrPlFHhynyh
         d1jz3IgdEIuhAus95xnuefhm0zQDmTSo5B19IWoI0IEXb1fldXaedBy3eSaVobYHdWi2
         npR9j7PHMs/dVGdtozavlOHUEA+LHgs+0I/4KzZg9irdP8DRLluKBeveyZq35Yb+8yo1
         9wbbIX7nAb7kdg14r52oAImTxODoBgVXzLprGKx0y4uSzSmuRMo7z3RQXTnvl/W2sVI5
         TrQyTEmjf9X11t4T14SLgxiEGK/Xq/x+tnH4RTwu1cdkbamiFxYaDr50B78wcepXRjoH
         UD4g==
X-Forwarded-Encrypted: i=1; AJvYcCUn7hJfweqWFOk4EzYhYwEHzGeUEaC1qwhCYKSaJzzzZUFm0FnxsbjqhH5IBfwvJ60CtsmfPCLM6RWggQLaImZr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzahl6eiwbU5SS8iS/2tkfbvs/4V4iObYl1cSMKHAsSz4cZo+Nl
	23xKyMW54dfDtynjeuyWA0Zs5Z0tgcwd9jLePjXHvJlb6qNl+34jeDzLu4FyT2WtEijbE5yOyOj
	KKfL/fdbexLrsrQotKMEmFp1NAhe41KaBinLKrQ==
X-Gm-Gg: ASbGncvrusj2zwaVcqcx3wSJRJHQdh02yqfQSr2LXFMr22YzUZ6ynQxhmTmIbNrngzK
	SWZ3tArze8lEgGTYcOrwCsjF+lsA7QCU=
X-Google-Smtp-Source: AGHT+IF8UTnU+5p7nKbdKVjbrthoiYcBYTuLfXNVkQGbQk0KfLyktr9CA5uLVCOTpHwOyzUd5aASTSTl99WTmj5pohI=
X-Received: by 2002:a05:690c:6283:b0:6ee:9cb7:dc24 with SMTP id
 00721157ae682-6eebd2b24cemr74692547b3.38.1732203438928; Thu, 21 Nov 2024
 07:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 21 Nov 2024 15:37:00 +0000
Message-ID: <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display hardware
To: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Dom Cobley <popcornmix@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_073720_542987_5CE67C8D 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, 23 Oct 2024 at 17:50, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> This series adds the required DRM, clock, and DT changes
> required to support the display hardware on Pi5.
> There are a couple of minor fixes first before the main patches.
>
> Many of the patches were authored by Maxime whilst working
> for us, however there have been a number of fixes squashed
> into his original patches as issues have been found. I also
> reworked the way UBM allocations are done to avoid double
> buffering of the handles as they are quite a limited resource.
>
> There are 2 variants of the IP. Most Pi5's released to date
> have used the C1 step of the SoC, whilst the 2GB Pi5 released
> in August is using the D0 step, as will other boards in future.
>
> Due to various reasons the register map got reworked between
> the steps, so there is extra code to handle the differences.
> Which step is in use is read out of the hardware, so they
> share a compatible string.

A gentle ping on the patches for clk-raspberrypi (patches 29-33) and
Broadcom DT (patches 34-36).

All the DRM and dtbinding ones are reviewed or acked (thank you!).

Thanks
  Dave

> Thanks!
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dave Stevenson (12):
>       drm/vc4: Limit max_bpc to 8 on Pi0-3
>       drm/vc4: Use of_device_get_match_data to set generation
>       drm/vc4: Fix reading of frame count on GEN5 / Pi4
>       drm/vc4: drv: Add support for 2712 D-step
>       drm/vc4: hvs: Add in support for 2712 D-step.
>       drm/vc4: plane: Add support for 2712 D-step.
>       drm/vc4: hdmi: Support 2712 D-step register map
>       drm/vc4: Enable bg_fill if there are no planes enabled
>       drm/vc4: Drop planes that are completely off-screen or 0 crtc size
>       arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
>       arm64: dts: broadcom: Add display pipeline support to BCM2712
>       arm64: dts: broadcom: Add DT for D-step version of BCM2712
>
> Dom Cobley (3):
>       clk: bcm: rpi: Add ISP to exported clocks
>       clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
>       clk: bcm: rpi: Enable minimize for all firmware clocks
>
> Maxime Ripard (22):
>       dt-bindings: display: Add BCM2712 HDMI bindings
>       dt-bindings: display: Add BCM2712 HVS bindings
>       dt-bindings: display: Add BCM2712 PixelValve bindings
>       dt-bindings: display: Add BCM2712 MOP bindings
>       dt-bindings: display: Add BCM2712 MOPLET bindings
>       dt-bindings: display: Add BCM2712 KMS driver bindings
>       drm/vc4: drv: Support BCM2712
>       drm/vc4: hvs: Add support for BCM2712 HVS
>       drm/vc4: crtc: Add support for BCM2712 PixelValves
>       drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
>       drm/vc4: txp: Introduce structure to deal with revision differences
>       drm/vc4: txp: Rename TXP data structure
>       drm/vc4: txp: Add byte enable toggle bit
>       drm/vc4: txp: Add horizontal and vertical size offset toggle bit
>       drm/vc4: txp: Handle 40-bits DMA Addresses
>       drm/vc4: txp: Move the encoder type in the variant structure
>       drm/vc4: txp: Add a new TXP encoder type
>       drm/vc4: txp: Add support for BCM2712 MOP
>       drm/vc4: txp: Add BCM2712 MOPLET support
>       drm/vc4: Add additional warn_on for incorrect revisions
>       clk: bcm: rpi: Create helper to retrieve private data
>       clk: bcm: rpi: Add disp clock
>
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
>  .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
>  .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
>  arch/arm64/boot/dts/broadcom/Makefile              |   1 +
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 +
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 188 +++++
>  drivers/clk/bcm/clk-raspberrypi.c                  |  34 +-
>  drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
>  drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
>  drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 112 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 ++++++
>  drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 ++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_kms.c                      | 102 ++-
>  drivers/gpu/drm/vc4/vc4_plane.c                    | 866 ++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
>  drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
>  include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
>  25 files changed, 3464 insertions(+), 204 deletions(-)
> ---
> base-commit: 91e21479c81dd4e9e22a78d7446f92f6b96a7284
> change-id: 20241002-drm-vc4-2712-support-9ad3236e3caf
>
> Best regards,
> --
> Dave Stevenson <dave.stevenson@raspberrypi.com>
>

