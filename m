Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B096BF3092C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaGVklJM6+vPIj268YCQDL+2pOq40VD8YhdiP3Qx7ns=; b=kaEpxDhCjiwzqcC/tGqTGlEr0l
	c29IzfpyTxE+O9usY8zLIX12O0YKT0uvAKdvnv2zRdtS3kWyPbYJXoV1xZxhjlk08cv7G1t+W3CFn
	0inMWn4Pq1Fn3iR2/ZzpLutMt38iWwRP1iANzCuicGdd6PrTUyjJbkyVNJEzWNU1QBj9GX5CWMYff
	4rkANd/gb5I5kkkslxL2RH+tQj1BNrbSmmq6k3b+ZAsjm8Ao5qm7Pw8D1V6fdweyJ3AqNBFfGNG3W
	uV0TS+8UAJajPlyysOCkxrYPUDncmfHyJGMsQDvwOhoMTxlinqXCV9JZC/s3l28YoSoavitfjCvlq
	EPyf48ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8IP-00000001pbW-1hhr;
	Thu, 05 Mar 2026 12:59:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8IN-00000001pb9-2ErD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A83496184C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEEDC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715554;
	bh=YaGVklJM6+vPIj268YCQDL+2pOq40VD8YhdiP3Qx7ns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iZq1Z6aAZsNPTZUWXayW2+CZWMYispH1xOGtx8AYAJla15to9gh69vT9bGXLGCuVv
	 jmt74rVorEON70lhZrHcxV04hXq3jfVaXVygsecWQXnpZfeR3SKWhbro7eO6+ixCDn
	 XfO6yrM1lWVa7hExX5d0+cXkODNVF94RuzrAlPo/LGVl2vFYI9HPihWieynuIWZnQD
	 8zxRxXnOc5MAJYmrba88RchU7dWioPCRMtHkdt/sGSO3cBOArdpy3/nj04DwRMfFcU
	 lxgz2H2dRssYWFoSCKO0Qt5Gn/Rh3m6hAKFMSD+Fz6utd9yc4iMXolceOcUmodt6jK
	 YCzToqoeLdULg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ca6595c8aso7737746d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:59:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI30yhXKNF7aa04Cd5+SxBCnUo81Uw4QD7aynMnXLgKg4M3A4HSXfVJutGV+2zBBiwT25oPOPvPTxjXpV5zGio@lists.infradead.org
X-Gm-Message-State: AOJu0YxaRkK7Om8OHmdzc3d9orBC5TAcUDhUp6jFLfa0bHWvZNyGblAG
	pJNcdWZ0a9yd45RYYgEto+acFTHNzPr4c/Yi9xsylePt9Uf7Vo0rWXQ2Mk0JiisdpGKb8IeqfuX
	LuBKlrdAyEYkBQmotQMUDJCvWmYLIpzE=
X-Received: by 2002:a05:690e:1a8d:b0:645:591a:cb6a with SMTP id
 956f58d0204a3-64cf9bdb7admr3241706d50.70.1772715553372; Thu, 05 Mar 2026
 04:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com> <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:59:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLnhYc2YN2zmPG1zz8DLG1bFNFrWSL23SL1frvPDWnWMxQ@mail.gmail.com>
X-Gm-Features: AaiRm50ObTyChLnzlvD-tHjXe2KnZ0D-eRgdIfSDib-lDXFEA4x4oaLfvc_xPUI
Message-ID: <CAD++jLnhYc2YN2zmPG1zz8DLG1bFNFrWSL23SL1frvPDWnWMxQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] gpio: move hogs into GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 5, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
>
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

It's a work of art.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

