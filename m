Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CC0F43830
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=; b=PasQ3auLmJUNN+F9gvR4HV0EhP
	2GN5H1b9EBL3FYUKS2rKoq1L56cbL9N4EDc+RPhQiV9awhljoqdbaKaE212GqgAJxW3IoPJd6IVgb
	WbtW6QTW4V2dsYVsTmyfPrzN71b5nzRCGc6XSZA37cF2u2hAV3WE/reFCW7FRyNgeAQUneWo+0Dft
	gS33fdP+FiKAtSgrY/Rl/s6Hbo/1LHXd8RD6WoraTvfhRTHWkfi1s6dtAQWNLz+I6VRSvxACsjlD+
	mIloKkVfWF4uVGxj/2omspPQ4rcXYBS7Z6A56+jBvHMs4dxPG+TCSMEXGrNbAKPC177EevBy6Y0ei
	RVz98OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Ym-00000001GCU-0RiF;
	Wed, 15 Apr 2026 14:49:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Yi-00000001GAy-0Ziv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:49:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so61137165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264578; x=1776869378; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=hnwJd59LYICMyBlzY2Q/+GBuKYifhgdyjkZiBKJhGBvLvn3hgxgvCxoU7iuIKv+rYn
         bDXcT7z7UewBlqGxPr3UNGCyyuWR1df3kC3GN+LP68NFKxgnZcHLdSQlxiaiYqzmzTLu
         X4c/4nVriVCBatKlgsfb/zAwuuKpqxnkAH1dhuhbguQKrZ+gOf5b4qoUIfL56Ce8sHVg
         IUq2M/NEJJhrZdTdA9FAE7I5+sRufTffmFQ7ex6541/u6h8sf2vN6rc03LCw8GGBXbzE
         W4hFB+Zw2qZil+MxxKzRcE1TZRa/9CO24MuKRPpm7RvkaPVlXWS9o7Aihkp2XyHvwT4g
         cg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776264578; x=1776869378;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=NFwHdeIJkEBk5pHR+I27swcHMWDbSexMuugIGfkhQMs/l/jYnc14s46Ta8G7tZsiWx
         WdjRPU68UQrGKnsTAA7Z/THeC5uMBpVNbLVZC7ky/kcEdqqTzulUV69OJnFrY3Nnxy8d
         xY1hhcvQPXQUdszUQZ9uUqAxy7QSpusU0qKoxlXARY5iKLw+37z2978LJ11VbePVYbM+
         Ys123so3kkJ4N6c9C0DcuNDxbTDwglUIp3BRlGe907/QkPqOkPpvi6QSdNl4NcyhAyUk
         tUAS3RkbRrhztOvLQCRvWEgSmTtMRdhekMN/KwPr9LLy/oWGPpiyK7a8/rLVH5ieQl5J
         S63Q==
X-Forwarded-Encrypted: i=1; AFNElJ/h5V3w/zaXPjuhTBvuoOHibgPwmRg5jWJMKT/lL0z3ePV4cjg3AoSjyVhllvUoeUV6cpZ/bTi6k6bOWKZuZ49i@lists.infradead.org
X-Gm-Message-State: AOJu0YxphXDNJv5fgg1H75Y0OpK6IttOzYi19lKAwA96jJGUi3QFqkYD
	1IRZDTa3nitZcyiBLUzBpUZYWTXJ70OQtPsGz18SQMyXiFZ4g4UmsAUgQsZdQKNkJ5U=
X-Gm-Gg: AeBDieuF4X4hoJ76NheRmKNbKWJnXuBfCL8WJH9tDNbWmv1VYHMtY1tEpGjxKw8xovs
	iSmukfQ7kT8cJ35chaEKePSPIqyjs8fK0GhGxiu8cOZa2KnAHVlneMo6SQWZjLtZwUeq249Q0u0
	mJONEy5rCg1g8quDZXnIefGdgw3sMNEC7H+iqlIcBWpWo9k9t4FksyBncuQB3ZDzfWVLsnlEner
	pk4TP7KxOna4BjbnpsHVOARwRv6pqQ+TZC3z/m8PzXB5/ShRdkXxn6okqpt8IFRkrmkOIIjbwJS
	m20we6AdFGUxjChLgato7heR/pU2qB8L8FepeOGu3LcUgSm3pIGbqT2susDazY8tpUICcMYOebt
	ET7QalsfebHXCMpHUdNi20DXyeL117tkK7grQsxpcJci+Tw+XZUof2lbN3wnThe882T4m255vPm
	vHUqmqDxSsoCqG+4De9WuaU22fI92xHkdO
X-Received: by 2002:a05:600c:871a:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488d67f0b8fmr318861465e9.9.1776264578172;
        Wed, 15 Apr 2026 07:49:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f095e68dsm38307595e9.2.2026.04.15.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:49:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 00/11] Add support for AUDIN driver in Amlogic GXBB
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com> (Valerio
	Setti's message of "Sat, 11 Apr 2026 16:57:25 +0200")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:49:35 +0200
Message-ID: <1jh5pcs2gw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_074940_209753_8E49BFDC 
X-CRM114-Status: GOOD (  34.94  )
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

On sam. 11 avril 2026 at 16:57, Valerio Setti <vsetti@baylibre.com> wrote:

> This series adds support for I2S audio input (AUDIN) on the Amlogic GXBB
> platform.
>
> It has been largely reshaped compared to what proposed in v1. Instead of
> adding an HACK commit to allow AIU to export its clock so that also
> AUDIN can control it, now the design closely follows what was implemented
> in the Meson AXG platform. "aiu-encoder-i2s" becomes the shared interface
> for playback/capture and it controls pins and clocks; data formatting
> is implemented in formatters which are named "aiu-formatter-i2s" and
> "audin-decoder-i2s" [1].
> Formatters are DAPM widgets which are dynamically attached/detached to
> the streams when the latters starts/stop, respectively.
>
> As of now only I2S input is supported, because it's the only one
> I could physically test in my setup, but other input sources (ex: SPDIF)
> are also allowed according to the SOC's manual and can be added in the
> future.
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
> NXP SGTL5000 codec connected to its I2S input port.
>
> Since this work brings GX platform very close to the AXG one, once this
> series is accepted, follow up work will be done in order to unify
> GX and AXG formatters so as to minimize the number of implementations.
>
> The series a bit long and it includes changes to drivers, dt-bindings and
> device-tree. Of course this only happens because this is an RFC and I
> wanted to give a full overview of what will be the final design. If no
> objection is raised, this patch series will be split into 3: one for
> reshaping AIU and introducing formatters, one to add AUDIN driver and its
> dt-bindings, one for the device-tree changes.
>
> [1]: Different naming for the aiu part is related to the fact that
> "aiu-encoder-i2s" is already used for the interface and the goal
> of this series was to introduce the minimum amount of changes that allow
> I2S capture to work. Renaming can be implemented in the future as follow up
> activity.

Thanks a lot for this awesome work Valerio. I know this was a lot of
effort. With Mark and Krzysztof comments addressed

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

For the next revision, I think you can drop the RFC tag and split the
series.

You have spent a lot of time studying the existing amlogic audio driver
support. If you feel like it, you could add yourself as a reviewer or
maintainer of the Amlogic audio drivers. :)

>
> v1 -> v2:
> - Reshaped design so that GX platforms will use the same design
>   pattern of AXG ones. This helped removing the need for an HACK commit.
>
> --
> 2.39.5
>
> ---
> Valerio Setti (11):
>       ASoC: meson: gx: add gx-formatter and gx-interface
>       ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
>       ASoC: meson: aiu: introduce I2S output formatter
>       ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
>       ASoC: dt-bindings: amlogic: add schema for audin-formatter and audin-toddr
>       ASoC: meson: gx: add AUDIN I2S Decoder driver
>       ASoC: meson: gx: add AUDIN FIFO driver
>       ASoC: meson: aiu: add I2S Capture DAI
>       ASoC: meson: gx-card: add support for AUDIN FIFO
>       arm64: dts: amlogic: gx: add nodes for AUDIN decoder and FIFO
>       arm64: dts: amlogic: odroid-c2: add support for I2S audio input
>
>  .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  |  49 +++
>  .../sound/amlogic,meson-gx-audin-fifo.yaml         |  63 +++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  32 ++
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  34 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  26 ++
>  sound/soc/meson/Kconfig                            |  17 +
>  sound/soc/meson/Makefile                           |   6 +
>  sound/soc/meson/aiu-encoder-i2s.c                  | 219 +++++++----
>  sound/soc/meson/aiu-formatter-i2s.c                | 106 +++++
>  sound/soc/meson/aiu.c                              |  37 +-
>  sound/soc/meson/aiu.h                              |   4 +
>  sound/soc/meson/audin-decoder-i2s.c                | 218 +++++++++++
>  sound/soc/meson/audin-fifo.c                       | 432 +++++++++++++++++++++
>  sound/soc/meson/gx-card.c                          |  14 +-
>  sound/soc/meson/gx-formatter.c                     | 304 +++++++++++++++
>  sound/soc/meson/gx-formatter.h                     |  47 +++
>  sound/soc/meson/gx-interface.h                     |  50 +++
>  17 files changed, 1567 insertions(+), 91 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260410-audin-rfc-243bcbf95e43
>
> Best regards,

-- 
Jerome

