Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B4EFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIvC+6gKKtd9UDWlaaA7tMyo7XSRTJh/W5Wsad50RKg=; b=wr6K3qMk4A4rAAVrkPinPA6jM7
	RR0TEnyVJsdk7JYnOEy8Hf+ymlkJT7s+L5rhwoL8dgALlJ2Tu2guNJzgk1IxvGF8ZluB5dzuqmqSy
	a9S81Hu3h1saHKf97YSoCf9RvpxEZn+MI2B6P5gDeRyZX8hbnYOyaJQzWyayK9Db70QFmIe8yeja8
	VyTM0XC1qOEIcviUWhwefjZ16n+7ZMgRfY30z94nMUReLsEWETkMl1mNiU1Yp7tOzhbByzPG153M5
	X+SjFnacXD3qvgXVFWbX6u+mYrp/fNK8B7SAymW6gNffEQtDtKgoH5YlbYAhjI24gpgzGTXNbNbK8
	n3yh/rWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwuQ-0000000FSN2-2n63;
	Sun, 26 Apr 2026 10:40:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwuO-0000000FSMQ-29jd;
	Sun, 26 Apr 2026 10:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1407240E90;
	Sun, 26 Apr 2026 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A8C2BCAF;
	Sun, 26 Apr 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777200014;
	bh=Hpm/RHjdQVWHP69xS9eePzzNeO07/UiUtBrVtlV/V5g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LfMTQ6VjKOLIduL9F9kUqMzrEhMqpJrqNy21O/BU8cJbFXiP0KJl3Tq057NxPRxba
	 jFYy7x3IRQk5sWfBrmtD0jfO1wkZdUF9ig83iR8pE49NhPF98GSxqCjbILsea1rEX7
	 PEU+VdL0euAY2xQjCeGOGUyOQKwF8v2tZTChNMOM7aR3t6Ndita8cZ1fBbtCz/ttZH
	 OwydDmDJZcGMMXPId0T+WtdUBnRAD7P9Sy1Vzd+4xihzIpyOmOfBUoPEoYMDkKortz
	 etxi6Qe7gW1DktXjDp9KsPgK9pv8h2G8d5NhZqTNb8QPGN4J+X8DeUAo2GPK0fmf6B
	 digQyHqCw1Lww==
Date: Sun, 26 Apr 2026 11:40:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260426114005.72fdbc49@jic23-huawei>
In-Reply-To: <CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
	<20260425194412.1872eff8@jic23-huawei>
	<754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
	<CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_034016_575971_D5BA83FC 
X-CRM114-Status: GOOD (  14.08  )
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

On Sun, 26 Apr 2026 11:54:47 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> On Sun, Apr 26, 2026 at 7:16=E2=80=AFAM David Lechner <dlechner@baylibre.=
com> wrote:
> > I just updated iio/testing today and I see return without kfree().
> >
> >         priv->tsc_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_no=
de, "amlogic,hhi-sysctrl");
> >         if (IS_ERR(priv->tsc_regmap))
> >                 return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
> >                                      "failed to get amlogic,hhi-sysctrl=
 regmap\n"); =20
> > >> Should `#include <linux/cleanup.h>` though rather that relying on it=
 being
> > >> included through another header.
> > >>
> > >> With that fixed...
> > >>
> > >> Reviewed-by: David Lechner <dlechner@baylibre.com>
> > >> =20
> > > =20
> > =20
> Hi Jonathan,
> This code was merged into linux/master yesterday, perhaps you haven't
> updated the code base.
Ah.  My bad.  I tend to be lazy and use elixir to check stuff like this
and had completely forgotten I merged the patch that broke this :(

J
>=20
> Best regards,
> Felix
>=20


