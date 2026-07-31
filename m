Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C207C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=; b=tjgY8IEUs8W01Wtyss2pmz2rOF
	TsEQTu8pB7D5/fg9uFJMm0Fsq9gHujCN3aNIVEn60Ta7A5bE5gNRayu6UTdMpdcVsOhDiQzZEypXz
	zA51TjbgSOYqWcGVzgZTmuEEGjXMDXe9YKkaoYZvQcd58iitRTucFHJIgUGqIiYPylfGD0UX7+zqK
	NahIOVJ7kGAvkNeKkqyJG7I7YG+qPirBiqqXOn3x0vqWUeuai74/7x/Bs7xahdT6TRZoJZ7p8mZDM
	oeK5VEG4pa/7QkRhfVrpNmwk9UWByAwGC6Llo/vcXKWHXQL6Jap5CscP1i+ADkLXZ5AzNTaXL1rTP
	mQQQ0P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqll-0000000DEyn-1n4T;
	Fri, 31 Jul 2026 17:11:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqli-0000000DExu-2mas
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:11:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso2164640a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=AUnPg21PfgMHv7dcvY0rC1XCoEKfp+REDOusvZ7vuECo+TJ7qWwbnkAsJqIhcfkrtl
         tjOS4gpwrADZl/wrNlEOo3eXbUFWU+Z4RA4YuPDDlSFoyrin07Eo8XyLNuMW/wGF7Enl
         bWIOerWEf9j+AnVj/PMZcFWwUFqVhR9e5EUvQsCDJEUH9jzyt1lhhdkBWNLNvVog4uQ9
         IGUa9LByfNxVpap/FB8ZTOg2tjBLF01xfkIkgNowR19o1GHU7eM1Upbkq0oMeVH8QBtq
         8mR0TQxafKzy6mqzKUdrfbvXGrMJRph048wCgeT3tAxktiDRoLiqfMYVCb1xp4xapIGM
         VgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=HPr9bEN0ZgQ0g22aYzXeVkUT0/dJAU1Xn6lZyeEUIas=;
        b=ca8LHN7JhZlqHsAt9m3gYxTt20s27/uGTSbsR+A8+k37rd+zfY6WqNLSBtzKWw/9yr
         Wv91mc6TkQF+/r8P9L76Z9qcf9dkr5g4g9pRGKL+wdexEySKw/1G2sFZuCxRmALhioTd
         gNsIUJp7b5pdq0wAediGAzGMKg+mglbLEABO8kN3qmW76C2Q9xpYHHNf7J3GCRQjr4Ih
         bjkWqR6gc/Cu6TQ6J1udR3ot0K9DdqmbxuYBBmMcFjkVLB9p8BHFcvFUFNmzJcbAfoKf
         ux9sySkKZQOLp1kApF8tfn25OQkSSI2bkoczvBqbR64FDyarElIvxMAvhsaPObZFKLRq
         CSNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=hH9eampWIE+cO6sqeCzVxYBIqUanJfqh7SlnQ7AswHqI4KaPEliGWKmegA83WJYXJC
         TEV01mUXuepgDP6lunKsNc0CYXp9fcu6Pq5EvsA4xlt7w10or9YPoKcD6Too2zB+XiEo
         yyp+BBSvpRlG4oBFJ+sptQ3ZZ/DyTftiG6DHpPalVEJIy6eIxK7GwIOFzEilv+rmEV7c
         SGRep0wKSmRx/zMiPHD2lNZ9HPRH/k+NfVU1U6afP0PV/CJ/3iY1tu1oW5ZUTq4hQH5L
         3Y6NvPD+04xVVgl0IOpexsraTmr5OaR3rCTd6tBohVklo9t5MzBbnEtNOnNbk+KxTsg+
         V1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=gfOmtdPDST2F/Mp/Z9cbN3h9QYWMZDYmZ14yHFVPKI+QGQMVMrWCGsXlyC40ihYexL
         Pn9JnFn53a6pnOvALvKg82M/Hf9BTFv5SJpthwIKe50wNlmNvepUrQv19yv9+YHRb2cT
         axF1wImW4KPwzAJYI7VjIgQxrBuf1/y9sWADEAFuV+U7FF3kMNKFA01U3ZuDm7bur4mv
         R/w0Oca+U6N3n1dS4wCtNJvSL5egvLor7kB1pIaUaBv/g1KlxFQCREs7TU5pwcu7j3cM
         vqQhRZByPPPJNLtVIRbuJBGQIoQOr/1qFsBKxJnbvYU+u9Vg0xlkfhtxGCTDZAPxkNm4
         wPcw==
X-Forwarded-Encrypted: i=1; AHgh+RqI51SQ2sWMYhrhNlmWk2Wzn+fPi96dvUV6hxzF2gkqChAGui2vQxUkmuyT6e2yFIq+AOgeGUu7CzjhAdjq85zK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz87WmUm+QcGnCHXvqgVrT7m20tPw5X6K9lXF/edRMXvMybPF4I
	VOLL/vXcXmiaEgUtfyXnct6DdA5JUn1YR0mAiI+V4qdTS1IjooNVyf1QelsDNUVF9uQ7dVOMbZf
	O1xDDJSh9pxKOJmp98uO1Am7ULRsHiFyLZoaQpdKH3g==
X-Gm-Gg: AR+sD10bx6ClA8ZXyEkddbBn3r0PoHnLjndsUwtCUrTyHFyDd0h5dvlEg49N1h+h8Jo
	KZSnZtK9Ge58XuLq5/pQXuX7xJA89YBIHfe95jKco0IYZdi3XEypCc0gfu0Is6hFkt53CJamFru
	KGUIQtYgwaRKNyMpEdMrkeQqTJYKM9ZpOiib1DkH1bbIN2/BmxQmPFO8QThXXFalym9IarMaKgA
	hd2It24ukFftNs0sHOiTZ3Bcaq3KbelxU4R3/f0HTunoFpnZeexNVFIxusZjjhNsiR6HvXMLowv
	iriYiuegMAGO3hFZi4fgvQLfVjuRkqKIvL3MR3wx9fKoRYsn2/ILft8pBE05yvCKaMVQRIdrdTt
	Nt/IlSOhdU9QfLA==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_101134_750471_3A29AFE8 
X-CRM114-Status: GOOD (  29.56  )
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

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
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
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>

