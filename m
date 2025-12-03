Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C5ED1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=; b=JcqXU5wskExDSw+FJFAaDoWyj0
	WgzXP1pp+mddPuu2WCaHYpg9JJkzBlduhqIjKhkrCzOMUifrAQIGvfP6iDmi+wcBUU6uXrbrt7rou
	ZuYOWgeLi8M2oOeNu3LFH08GZNwt3IKYLuz1WHTeQwgyJXNjm8a7MjwgdopitkJcGLYEt3pnconwO
	wNrpQaBkHBhjUtJ0ZFv0pF1R3dXiG0DXWRBqOkvqTWqRejOSfRYrBsAtNx6cqxVZAEmuVhY8ROssh
	8TilkIdkA4fyvq7Wr8SM2PareznMUCotgXDcc4u6z4R4aoCMvoFY+dE2wjo9KoZWOn+JoI2e4hYTg
	AkC6jHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsET-00000006y4C-1p0w;
	Wed, 03 Dec 2025 19:09:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQsEQ-00000006y3X-3R4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 19:09:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2956d816c10so1368885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764788981; x=1765393781; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=CavZtT3R0b8Fl8kwr5O/D3vrC0GXHUL8ziqKFWdvkcisKqlKtp0M4DCgDHTitORHWa
         GDoQ2ytVzrp7IrmiOuqM0Wf8rpFBE1HHSGSRa67TQtSBv4UnQPjCpGEdSB6s49R378oA
         mtABhz62ztCkVYZ59wD+BhKqWa+D4oW18haXT94Iz2B+VbpXRnxpUXSMrg08GjRq0RH/
         nGNhaDCCgUjGewtB0uVXxYk6Nuv6s4Q7aKX4G2sgC1T0WniCL4clrcKbLb0xrTm71Lp6
         GvhQWWPvgrqikGqtYhV4u1qsAbR/wL502jBTN6bjjBr0uZuXLhijxwz39ySgJY6XslpE
         lvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764788981; x=1765393781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3IRsPmCpiCqjml1bQ7Q4E8Gj2zFoNTCEFI1NKqRplI=;
        b=rPycfPYLq1WnpMdpK5MsiukdLKXKRM1+LpoOXg5xlRnQL2QNuy1PQeW4fKjT3aSqT3
         bklxPZlcZr05DCoOQf/pvms/sBe1hgnVxtuMwHBy0Tkl+CbyJjsEK5n3jKxzRH27cG9C
         KO3EgAPKihwc+flABZHpr2/uBkA/Fw/XZNpmME1KYypTHbQjovbxTUDnb//Cq3cAkJZj
         +6wKa9/2i31KnLXJEjFa+hstiNShCpqWgdQCaxzRA7shhPx84dOt76GiP56kvrulFuKh
         Y3jCsY/d+o3tZosfhaPkHFCIKIOTCcrlw4xuit20KnhizOR1GTHMp5SzvTsMThUQlD8k
         481Q==
X-Forwarded-Encrypted: i=1; AJvYcCX75b7pLQDPfyiwnENd/zpjaCIZjBi+MZiY/XAvjqSLBrX0nGBRWBVJgZXHQM563KxnOKxoNOhMyV2UmOoP1r/4@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ6rguD5R9zhvvk1YtF9np81iiAcgl8aoHI4Bwm5paZpe9tweG
	Hvz7LvcrAbZbp/F/VOSleh3xWJFgjfvhMUIrLduGdUvj/akG1ZzUJyDbWRop91rfUN0=
X-Gm-Gg: ASbGncubNsTMMGYSGiWK1MMfQWJHWy5cEfz/f10S7Gix+rAL90NkweVpScD8penBxhQ
	SUUaqx2mlJEnQYnI8M8O3b11e1WRwCPSxaHDgeXVoOoWSOF9gBYOzDksdsGopjtP8/42CGifKC8
	82hKoefouFxgRJaPX4oKsWLNM7XGEuamZ64CBMPEf/FoHTTXF8Jyy3CX+1dOAkX+xAlwIWaGCQQ
	Q1VtG9/r6pLtAcazBp86ZQesj7qj5pQV2VWu3qrealD7p0chZwh7Iabo7LMKvDh+2KmpNWEeOUk
	EmqHhrvrtgwUy1SpnW2AyhnfLO/mZtc/TNPoT13wtFv9Z0/WIw7MbDWFmzd/zXW4hLMvGimurrX
	eBX4sjIvrMK9ITxTWHB40e/mEkztV1muXdlFdWwNBHTVBWRGqTtQvhMZDrIslgEfusxmlIHjpq0
	p3/qJNi496FOV9tJi5cAE8tJMY
X-Google-Smtp-Source: AGHT+IF06RISZgnSJBztNS3j4oN16EtI84xL0/NkOjF0OCvNrCJXb3n/r6sR5sNc/4qd+kbVJVFsEA==
X-Received: by 2002:a17:903:94f:b0:29d:73cc:c9f6 with SMTP id d9443c01a7336-29d73cce8bdmr29319365ad.1.1764788981186;
        Wed, 03 Dec 2025 11:09:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:dc26:2c67:b58f:e40a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7f69asm190635605ad.102.2025.12.03.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:09:40 -0800 (PST)
Date: Wed, 3 Dec 2025 12:09:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aTCK8e1SJA7Uh3wL@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_110942_904558_7A38352F 
X-CRM114-Status: GOOD (  24.35  )
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

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)
>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
>

After reviewing this patchset I come to the following conclusion:

(1) Other people have pointed this out multiple time and I will do the same: the
only way this work will move forward is by adopting a generic solution.  This
proposal is not (no need to try to convince me otherwise).

(2) The right way to do this would be to have a separate set of virtqueues for
each component that sits behind the remoteproc, instantiated using the content
found in the resource table.  This would follow the same approach as the
namespace, with their own VIRTIO IDS as published in [1].  That way we could
re-use a lot of the work already done for other components, such as virtio-i2c
and virtio-gpio.

(3) Some environment may be too memory constrained for option (2) above, hence
using rpmsg as a transport protocol.  But as with option (2), that way also
needs to look like virtio devices to the kernel.  It also means that protocol
to interact with components need to follow the OASIS specification.  As such
you'd have platform drivers for rpmsg-i2c and rpmsg-gpio that would register
rpmsg_drivers.

I don't mind which approach is taken as they both represent the same amount of
work.  Lastly, your next patchset should contain an implementation for GPIO or
I2C, not both.

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v6.18-rc7/source/include/uapi/linux/virtio_ids.h#L38
 
> --
> 2.43.0
> 

