Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9886CD38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=; b=nSJRntpO1sckZz5SjbLSphbNPS
	w/LTsdFWyHdprYUtQLRRkVuBSidfYJZPOPpaFcNoD3WzHMf2p9dO5woqnykIhzjhgDGuq9tvDPR/j
	yP3myFI17j2OCgaYBe8FbQKs6/vq917ge9Rau9jckXzBSzSp9H7ncuQ1/DOA8326Hnt/2DrTUC5gC
	OwHkCad2fsrrC6mItjV7nUJH+pyTBTEoyNZvL+pYs3QZqSfF5+SOLw+PCK7eYZKZigOG8ZKE5ph9z
	XUbj1hYqLRrRaEjsOkTus0EaVkDwxDLViHysqNOMUsTQtop0xJBCxug9Rjs1vo6LkJib9FScjhLnV
	0UkquGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Mw-0000000A3JG-2BZy;
	Wed, 14 Jan 2026 17:09:18 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Mp-0000000A3GC-3hjr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso528945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768410550; x=1769015350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=v+29Sx3qQg7nNnvofvjDn7O4wha65xzI5dNI+07cT0focmkpSNQHCJt9/wOGJjszVF
         4oV3JpxUBd0Brn5UM6l+/WafQnnyJ02rTTcRA8q3DjcLpsm5I9Y/zipdEEpxjA63v1z6
         STwqHjSNvZoukNSa9J4jDhqxC3RCK2o9hN+OIJEODMGjPRUIfcjmqK3IslfKmsK7REGs
         tqxdUwUtIYN8bNqb+0a1QuidwNCn2L2k51P4e3EbFyPHP2VqlOxYzJXFqcpXlMvfvwTC
         TLelfQ+2huHLEGwxOsD24aeMb8s+Y+xZ5oDNo0VySaYiZOfTxs5XRVZmQS4aC8h089Fe
         yzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410550; x=1769015350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYBoGaWLHXCd8PqOgncqDf0BayRCOnmKkumvRRhT/88=;
        b=n6XxtyncovDQ+R2/pT5HHVFQUa2T65HgyUoeJpsETfnVOktYh4SP6E7LfOJFrrl6lF
         2YLbkXNnl4lawiQWqcgI5mL9709rLtCrTcgFeA3MYCqwbXPIERpNhhGzK/O8lav5wH/d
         65vwSV5/M6HbPo0wBi7Bbht42xk4mOEjqYFBdWwCwM/HGFao1RezjnMK4HnwMEqj/ByQ
         v5ob44Ow15cyRHZB2uhizZg2tiLqdp7VU3bTp1z1YGjQ57bCxX0fq0qqq++bUaTzEzs5
         pnKwJegDbVtrFGzTTahCNv/au/C5efTXKpKgVbYuin2g61Mduc34Vi9k+z7aGSTGiExe
         pp+A==
X-Forwarded-Encrypted: i=1; AJvYcCX8I8jVxoQxaHQN3yzL1k0TuBa7YokGS/cGtoFk434pH4N8ZlijNMNCriw67sZTzrSqlnOf8WLHdAbqVMDzxrLr@lists.infradead.org
X-Gm-Message-State: AOJu0YwDx6gsZuVbP6npUrixbr4TAhJ2YuUBqrghKHi1oiwBC1pefDmE
	/7XGV84nH1grPIwfUz69TX4Pg0NaxFGgPtmMoK23AzKzTpk22ooxVAGankWeZjIUzLc=
X-Gm-Gg: AY/fxX7JJdv8iqRvd35oEKYWr7iucbR7l9bu5kR1Ipjdxi3V2SBd6wvoihYrgh7orDy
	+LYdOlaDGzw/EznSVWNT+TaehushmpC4fokKcAfx5/IQ4L9IgnOWiKsEiJ6CYmU1h/KuPOaLhkK
	K+iJ6IaNxg6g4Eqt8IP9mYvuT5DE65eNq2coD6BLXQIqCzMuZRs/Z/Uh+pZTYYlV+uyfOmvsUhS
	uqVHPlgGo3zqpxMu2K7Gg3+AIzGl4EKEDUW8UZKZzxERmydWlBLXdwVY/wm3hV/Cf1+MwK3Yu+Q
	0FXo2rcAr856IHgVIE01kE6OD4OiXvYpnsSyOfTRb+eO1YooV0lwtYsOhbQuFllq2L3te5FTEFn
	jomrFkvLuXihwdC26VJh/72WceTkJh7sFLrPLivSdw/NRJJkkGAZq10s4gsDSi+QAFUN3v//BBA
	vqzQoIkPkUS6T1JA==
X-Received: by 2002:a17:902:c949:b0:2a0:992c:c54e with SMTP id d9443c01a7336-2a599e33f1dmr33469595ad.48.1768410550174;
        Wed, 14 Jan 2026 09:09:10 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c447:f90e:a227:47bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88d8sm231003025ad.80.2026.01.14.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:09 -0800 (PST)
Date: Wed, 14 Jan 2026 10:09:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v6 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aWfNsrpC5Rgiwwp3@p14s>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212194341.966387-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090911_945003_CB7D7D68 
X-CRM114-Status: GOOD (  23.60  )
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

On Fri, Dec 12, 2025 at 01:43:36PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>

NAK - I asked to use the virtio interface (in this case virtio-gpio), something
I do not see in the above summary and the first 2 patches in this series.  This
work will not move forward until that happens.
 
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
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: driver-api: gpio: generic gpio driver over rpmsg bus
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  49 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  54 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 232 +++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  16 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 490 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 143 +++++
>  include/linux/rpmsg/rpdev_info.h              |  33 ++
>  10 files changed, 1046 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>  create mode 100644 include/linux/rpmsg/rpdev_info.h
> 
> --
> 2.43.0
> 

