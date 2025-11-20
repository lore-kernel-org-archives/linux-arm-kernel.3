Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DB6CF9C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=; b=lt0McwUXbgkdTY6C2mbYmSbwgM
	VCbOSqbqMcNacF9QQNzL1ttVtHRr2RlLqWO4bAZepVJ/KY5Iu4TD9ZHtNxkG7txZAzA7PYj2LNCGq
	feMlnLRPXiTqlyDayDQAirKP0SuOSFv1H5GmlsxUJocz1a1U976pHWahz2+9ODOocmz9OCBP5AY/+
	VZm2WzdFLA3IMYhpmInHJ4hi9O4f+jHR6lh0hcpIzkk5qjpcR+jshAS/e8gnA52EUopMNchPanDNb
	crN3l9zuVW96nJ0utA1mIXq1Ok/z34NMRIKJ14UwIKUccmcLAD/E/iC5pkUu7ulU21HiZAoQ1ItLd
	pdY2lbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9G5-00000007DeS-45fN;
	Thu, 20 Nov 2025 18:19:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9G3-00000007Dde-3wMB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:19:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5958931c9c7so1334420e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763662789; x=1764267589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=mcWhCA2owtGiL7Bgznr9aStFBgZD1/F3o+DX0mJ5dD40Vd6Y96or/UEIF8R7qHHmC9
         wDQsvqZzTPMbjvrdUCZIiLoaGGLZjAvNMBJQPsyJUhUqklnoRaG4is0W8xADPC+m9etG
         lo93x5PzIke8pWrFSfz03FgmviAbsrFy2rpA2PZD9paap1mNZ6iOqaO4fm+hjskOeNXw
         0qV7wJlPBN8QaQT3XhyEdpZIfSuXYwfL/iFOAel+jFizjgg5S3Gzlbgx5f1cJNOOxVhe
         WPLg8Vyds413QyOh5fYWbQCK1m7eTXFcsMbbOBK8UWHWZ6Nzyp2icS5D3AELr0ZkdLxn
         3lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763662789; x=1764267589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnYALWaCSwb3tCzOH7sb75PPH0v2Pj24u8FmC4zAj8Q=;
        b=RJ75bVMvn2U9cS8O9MMsdzvdnJFCDOYGk8pSxXmIdHL/9g2QgVf7ULYxYG7edTn6YG
         0YL2I2tZVfOUXHbj5cTZYSRxJDdlZpMV5Q4znZ3UsbrGUzBMJfn9UBmSBZVWMf6hKXlp
         atTtnHcjxVtQsS0MwGsHyh3dYyKjSYpCCwa9z7B6U0JFwgC7uowP37uxj0oTdwiIoTXx
         h7KqKaj0pIkRKGWopKsy6xPDpmE056QFjow3jOtPsKSEZ8eMjrzTECfzMB8nfJvHp4Ir
         bCMMWgwORZkta0wCQ/RgFdEMV2FoPvNMQ2/0QZrSTvOnPuMC2HwlGfrMBWcGy0FV69+s
         iusg==
X-Forwarded-Encrypted: i=1; AJvYcCVq7gwEjUUnwUC6OAaTCuSJsq/ryueVNFBq7bzjptC1WQmSzgIhmk4xOC1C4GlmkPrFk1S88Rs65AeBOg4Bo9lx@lists.infradead.org
X-Gm-Message-State: AOJu0YxAOL/1DgHkMb2h3J0pPBAACmlNIoBOXe7uB9oNNVGQvDNs3byi
	bO3vHxuqslTFXQRM9bq6dFiz/q+DX6dVYjq7rvkY43UAeb4gVODv3HQ9zGrr/gXE24X31/4bR+g
	E9ti5AdI6j8qQOB+HXXKMGTjZDYSDra7cVj9SOEzhUA==
X-Gm-Gg: ASbGncuFIBXtGo4VUbzAva6+5GGKg+TttQglA5q9qiMNraO1O+sDxbjjZetL0KTKJts
	XWi2ck9k0HJn0lWNmJ4urs1Bo8p0fbXydUYHKKeKNXRPIKXRLAmn3p1+L8oVyhu9QFEfgb+ooTc
	Y87zaazqGvYsic6akBuyuvg/Jn8oRnBtpC+PKWgsYkwpdO5oUHNqWwdzbYEgxqrR9HPkK0gr1SD
	ESjIK15iKu8XsO/rSNvAi9+VG8QigzlDjwRLLNb3OD1MoD6c1uC1NeL4mY6tNWJFQ0aV5/2H5Nz
	K2R/HDPYv2CfQrogFOSqIJL9zu7SkJcMybOg
X-Google-Smtp-Source: AGHT+IFJUK59m9cV2hdaMboMdwCuLYZSd6vorsTLduT0KYUQfG8bYza6yPNSkEBgztU1V5kaircoAsMSf6iO5hTasWc=
X-Received: by 2002:a05:6512:b01:b0:594:34b9:a7f4 with SMTP id
 2adb3069b0e04-5969e2f421cmr1562911e87.29.1763662788999; Thu, 20 Nov 2025
 10:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20251120163252.34760-1-p.zabel@pengutronix.de>
In-Reply-To: <20251120163252.34760-1-p.zabel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 19:19:36 +0100
X-Gm-Features: AWmQ_bkWVGFSZn3FalnS_qvDgjI51sEMsJrOYvZkmui2vXqgrMxEN-ruhSsnp2s
Message-ID: <CAMRc=Mfzzgx2JcBa1iG9L9ztF+S55cSNHgNurubPBsDteoLraQ@mail.gmail.com>
Subject: Re: [GIT PULL] Reset/GPIO/swnode changes for v6.19
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_101952_241944_802F88AE 
X-CRM114-Status: GOOD (  20.55  )
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

On Thu, Nov 20, 2025 at 5:33=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Dear arm-soc maintainers,
>
> The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a=
7c:
>
>   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
>
> are available in the Git repository at:
>
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-gpio-for-v6.19
>
> for you to fetch changes up to 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8:
>
>   reset: gpio: use software nodes to setup the GPIO lookup (2025-11-20 16=
:51:49 +0100)
>
> This tag is separated from reset-for-v6.19 because it may also be merged
> into the driver core, GPIO or SPI trees, if needed.
> It contains a single series [1] with changes to swnode, gpio, and reset
> code.
> It is based on v6.18-rc5, which includes the prerequisite commit
> e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the key for
> GPIO lookup").
>
> [1] https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493=
a0f4b@linaro.org/
>
> ----------------------------------------------------------------
> Reset/GPIO/swnode changes for v6.19
>
> * Extend software node implementation, allowing its properties to referen=
ce
>   existing firmware nodes.
> * Update the GPIO property interface to use reworked swnode macros.
> * Rework reset-gpio code to use GPIO lookup via swnode.
> * Fix spi-cs42l43 driver to work with swnode changes.
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (8):
>       software node: read the reference args via the fwnode API
>       software node: increase the reference of the swnode by its fwnode
>       software node: allow referencing firmware nodes
>       gpio: swnode: allow referencing GPIO chips by firmware nodes
>       reset: order includes alphabetically in reset/core.c
>       reset: make the provider of reset-gpios the parent of the reset dev=
ice
>       reset: gpio: convert the driver to using the auxiliary bus
>       reset: gpio: use software nodes to setup the GPIO lookup
>
> Charles Keepax (1):
>       spi: cs42l43: Use actual ACPI firmware node for chip selects
>
>  drivers/base/swnode.c         |  30 +++++++--
>  drivers/gpio/gpiolib-swnode.c |   3 +-
>  drivers/reset/Kconfig         |   1 +
>  drivers/reset/core.c          | 146 ++++++++++++++++++++++++------------=
------
>  drivers/reset/reset-gpio.c    |  19 +++---
>  drivers/spi/spi-cs42l43.c     |  40 +++---------
>  include/linux/property.h      |  13 +++-
>  7 files changed, 141 insertions(+), 111 deletions(-)

Pulled into the GPIO tree. Thanks everyone for reviews and patience!

Bartosz

