Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40321F589C4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=; b=IuLDfKRmTfOrH6JffNKQaaQPX1
	cG9PF2/naQm+XJtBn8tCsOrWAS6hhgGM1WwC07bsX3PbVeTY07qGROxi6k2jfV0g4BGfz7e3kO2O4
	2nZ3hPblK03qP+V7HqMMJjwvbX04iO+XM02ZlPYunTnJpEkEcvQNwfz8DDU1UUJY7IRwr8CjZnbUn
	S7n1Q2Orxe2STue8U2TGyEACOO9s21+zNwWnI2oH/4uR1a02p5FjMN3Vw2kkrALuiBvkqaQxUpiug
	NEyO9/xxRGFHQNoDL74yzYpX1p9DaBBqZaxdFHTY63LOC/Ryg8YyKHRFG735rO7ED4N1l/dDsTu1H
	lXyeKmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtYi-0000000BgkL-1RHy;
	Thu, 23 Apr 2026 12:53:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtYc-0000000BghQ-1sGZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:53:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8f97c626aaso119697366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948804; cv=none;
        d=google.com; s=arc-20240605;
        b=PIEMDj0e/58/xwuEuI99SJKLqBGRe5S2J31tZA1gIFySf16FlFgyA3PT9bN76bkxFS
         YyokUYQRtlxATTqxkkY4Rwf4x9JkdqxSZQXV5pH93/cewGOwLJB8IBaLgec/lJx4EjJu
         +wKSj4QaV0JxYiHBSXmO3fOVIYnT/K8a7j6GAvc5wmMvooG+tZig+d8ptuhpq/OG5Xy7
         PpP1cJVyJoKw+QaeYwDA3H0gkzBbmbAUDtdAi2g7HwxD63b7XiEym7hSeYob/wNCvExE
         KjhuP7MRKrMGWw5WKhnSWbL4CqMoCkvjEhYiIjt0j158R5yn8NnR3mtKCJoNxwAEgusK
         jOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        fh=deNXQsJiK979deoaO0ZEkrhINNJld02rJj0mCvAPZ+U=;
        b=cHcApY3hru+adHA0F6RzrGUbEHYs/9t/t7U9aorlVWJuRPLwwLFV7Ibvdf7Blwahdr
         nhMxN1RMQV/ZPtHdZvZdqg6uqqkRQP69x58vdLdahqk/Kh1cONoYBNrtIJMu33U99xTM
         u5l6ADLr93CzdnwXhIOxc1lWsXK/++zDev4WB0hpUD2dNQzO5xveuW80bUuoEk/MrPKO
         Ne951tsCug77QTPzhnC/HkjbyGYFqx8s9hjreuL8TV0zXjtuz8Gx6WcXxjCREdiLPnam
         8d9shHTgOi4ubCqOBzqv1qSbnrBAL4WtFZJvY1emnLyPcC4SIdBGcANmMofJDvwr3aqa
         Y3TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776948804; x=1777553604; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=ffdHxetVRTcCEghXBma9R24WlBBAZEvmAyflbO9wbd8bBXvKIHo+dohPUlmU/O+yp8
         YuNp3FBUU+mt02D8IcBiJY+rXDFuAjpaijX5hZASYOQ9FOgR03QytCtRdpEvk56wauLa
         hh9MMvfgF12/CgdQjBkU17OPhDiOz/GTtCwVwp6STY/oe86P4hMW+dZEVlUTEM1kivDs
         T2fR02/cRLRmsXBGeDTYfVmbWgLCaAJrRaeLzu7Ipt0CMbCeJNzA2XNJCqIuy+akHWXO
         QY3BQBX27bLQl/5VrmB24IZRfU7ZgiNL5OgADPwT5GR9uGCPaoV5UqRkh0smBbwX99Bf
         5HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948804; x=1777553604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=LltALfvA13uC52bwXoAyxSlfMQ5G/qMl1aA74cJGLNKI6V2FeWWyPLGXBbummmq4bY
         7UjEe6om32nFc5a+R6nqf9B+VNnRbOByZ3DiQKfbKXVo5a0o+tlZbBprR4qsXX0o+Vmi
         OKiJNbsmWpCklMAJB+muHQpZOk+OICUr8UYS5G7D9snVav4bolq3OjR54m1cOL/ZXk17
         wEedbfYAUuGTtQJ/jhtfl6AV152dh40sSem6PdvkIUmEbP0s/bRXoLzyHlP0kg13Zm7S
         meGXNf++70v9SuyaTCPh0BohwVkOlGmOkMFVwnmxeXvsFZkQ0ZhpjMSUqr403aG/M7eE
         5/0g==
X-Forwarded-Encrypted: i=1; AFNElJ9ppZL0JwGFry/X1+kSLmRQKqgziV4Acjyjml08l/XlRmlu7gIU9o2MsGtcIzTkbCYYqlAswRCKfpvG6rO+hUrh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq/kvAkJl7hjhQkEA5CTedV/a3C+U+YYX85JSFu4/8V+mMH9Su
	u1VUcnyMoPSZ0h5/FWdXYRwSruK6f4Fv+eDuh+qhW6//UY5D9f0MIJMPd3JXMdNV3Y1iBtdFtzN
	oVH+wpjyO+uC3EyS167G5sRMOS5CbjDZTn5SY0KRO/g==
X-Gm-Gg: AeBDiet8zhlO+nj7neolFPF5fNM5s68uF7TmenTx0elgSSCt5qvAIe4j8TkLEkCH51n
	K9gJtrnWKD5cMDeOIBQUVQYi8nWRnjmg5zKliVLH08HtsSVZrEJQR5P3C5g9ezz7R+1thakQvr8
	oTEYIdukiadij0IkW1X2BKp6EWgCHWlHpFqNWbHAheoUrSLLvMnZ7eT4gHvvohxeMGH5MZ3+zaH
	P4pAr19su2eSgtRKtsqyh0v8paIGU1ArJYufXtroJa4axoYJuv5hrkVAUszQYc9W+u+JpQ5lru9
	ynbbxzUnZvqLMlskoqWj/SFaxE5rELDdKUK5zWUVT6fStrlorp2g
X-Received: by 2002:a17:907:72c5:b0:ba5:bef2:2aa9 with SMTP id
 a640c23a62f3a-ba5bef2333fmr1133294666b.35.1776948803573; Thu, 23 Apr 2026
 05:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Apr 2026 06:53:12 -0600
X-Gm-Features: AQROBzBDIr-bn4DX0ExOJm0nVY72516bKXS1r-ubIMnAcS6p_qKbuXjU_FLZ6Pw
Message-ID: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_055326_540572_E43C57F3 
X-CRM114-Status: GOOD (  26.57  )
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

Once again Andrew Lunn was left out.

On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
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
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
>  8 files changed, 991 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>

