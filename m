Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1187C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGH1/2toPHVIOQa+jK5UNhDmHBD0aRC5mQRDqAj3tYU=; b=JOOoZnrjjVhTk4TIMMA7Z99yK9
	JT/bOY7RITE3QwYehslgFy1a0uk2pRok4vjytPTX2jCL2XCfGzXF3B13lNz908v5KMODoobsk9ZqI
	Eg7EQc+IuAbI9sEwzJEFTdV2FDSP0Im2uRqX57VToMC3UNxv82XyNObF2Q9Q/mEwjfYcenVSPd186
	9yyC6xjPXk/dwFdj4fGqq8Ab7rSht6iLsjmaAXUPHLN4QaCueNGidt00ZOLHyfVgbnR/czZxv5/NG
	1HYPaptEniL2xD2kSrfGME3w9u3Qwre2KEY1FQcTi0uKT7ulZbgI7dlNVdgzghAcYyepLWL0FCMAp
	SJ5ThhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO9T-0000000HIGG-2ZKq;
	Fri, 24 Jul 2026 22:13:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnO9S-0000000HIFh-0yUU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:13:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AA3843A93
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEB91F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931232;
	bh=aGH1/2toPHVIOQa+jK5UNhDmHBD0aRC5mQRDqAj3tYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FXgNPEcmyUE0kVHZ6djQa3bjOde7CyAnqB+vHKouxeko1ahVwngW3hfMx0OV/00uO
	 HTYf+nqinj93C3ZO4JmCihblplGsmzaB+1X09ObmzLe/jQAnsj5fmB7N2CXsQ4IDIp
	 oVBdD67TFc1L+Kzvxy80Kzz06UpCRGGeo55FJfDOPxX/fT91s1ciW6DdBjhpWxwtWB
	 4QYkwupmYgdeA3zTakFLJIqWH5qK/LX4dd2FDrFNMQ7hiM5YoSPTuIDU2C2IGTnu08
	 7rBLejOy04THX/qe59JSaPVVOIHTCzOsocUcOnIAUp3vOPi+f1p12IOeI9TOE9vcKh
	 E7SDad10HXS3A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b015532f7bso905943e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqCYhpBZqY7s/qfBa+TopsoNxgKT4+3oU9L/jHe9491HbKBjllcyb5/vYXB4M/FcX84SuJifoyVjNGGKCBt9VrY@lists.infradead.org
X-Gm-Message-State: AOJu0YzmAQ7FCT/fxGwoKqEp1rY0OmvKzCrFsPJOwnoNasN5R5+E2Yw0
	+txY+yjA8Swp0rsyWXilH9c9XphV6q4Iokb2EwM0e81i9mOWN2Y+ieRC6vi3rAPD0oLjCBNkokV
	m9p0xwHlkSjm7IQJ0Go/DyrS7NDJpL3c=
X-Received: by 2002:a05:6512:6699:10b0:5ae:bbd3:27e3 with SMTP id
 2adb3069b0e04-5b2b2e52e52mr1247043e87.5.1784931231294; Fri, 24 Jul 2026
 15:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260717075918.1869879-1-hugo@ahdrone.com>
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:13:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
X-Gm-Features: AUfX_mxV3lAJSNoJIi5Cr9GxwAU_Lyd6F8eQg8jRexuVpOK8BgTgzF15KgMIbjM
Message-ID: <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
To: hugo@ahdrone.com
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dmitry Yashin <dmt.yashin@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>
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

On Fri, Jul 17, 2026 at 9:59=E2=80=AFAM Hugo VALTIER <hugo@ahdrone.com> wro=
te:

> The RK3308B is a silicon revision of the RK3308 with a different iomux
> register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
> GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
> the original 2-bit fields. I believe the bootloader enables the new
> registers via the sel_src_ctrl bits, after which the kernel's writes
> to the old iomux registers are silently ignored. Whatever the exact
> mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
> SPI1, I2C3 and other peripherals on the affected pins are
> non-functional without this series.
>
> This is a continuation of Dmitry Yashin's series from 2024 [1], which
> was never resubmitted after review and got dropped. Following the

No reactions for a week so patches applied.

Any remaining snags can likely be fixed with follow-up patches.

Yours,
Linus Walleij

