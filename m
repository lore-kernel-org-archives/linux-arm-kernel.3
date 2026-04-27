Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3254FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDL00mNehTnU03tGXQ5syJNde/P/tKrMirMV7wN+H8o=; b=3BcicPVA23vw5vGBqNpfHFuYS4
	AjIJZsFMQH+D31JK6JcyjAZ+KI2CN6e2ow9JOo7zPpXIJ4HOCHjadjdHB1gxJ3xw8P/dHRygtmHir
	6IRU1rx7ZgyfXRFGzyHhMCkZUdr0tDKAHZB5EQB5l5dEH5p/dXN5RevxZlSjMoLZzBvHGO3bOq+In
	kl8Ei1qoGHPwpkWeti5PhBDKqJnozroRd026Lcko/lVFgMT9HuKhkPnTbHuW3XU6Lr+zN4clzGlPd
	1cmGe5rbAgaH2jq8+V9wzt1mnXENBFwRQgjMvRE96iymJHjTBDB6eiNP1/tB4AKGj2dwnRGyqABL8
	yALNp3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIg0-0000000GcHw-2nq5;
	Mon, 27 Apr 2026 09:54:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIfy-0000000GcHC-463n;
	Mon, 27 Apr 2026 09:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2902260145;
	Mon, 27 Apr 2026 09:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD6DC19425;
	Mon, 27 Apr 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777283689;
	bh=3GJbd01BMV46KOqmSsQTOMiZH5IiF+nQeyc2rgr2Oy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N0e1xCma1Yv/JFQEVHz6rAqbo4SzecdgubW5eAeuFBxPfZLFcSpHZifv3smJyUZL4
	 wLX+78hNXVoT6Us5dXRipin+RcIYZEnW0Nc87BCRW7eJGKnV+3E46tVwFrj672qevA
	 cBfkymnQOHyjd7cH5I+NxJHloek91K2y156YPIVQ9g07CgGrd/RBlJS5tVYNmVJBwH
	 0LL49GtkSA7wTOsuTxWqeCgpW6da9FIc3lwpnrt7SSpHsDlUEvdjULzHYeX7safi59
	 T4hMOD87cDj4NWOjQ0hA6Xxs5AmhqbAaDaxj3AvBdtKD7jE11dz222IpZr0ITdM/6I
	 XD1R17oZGM81g==
Date: Mon, 27 Apr 2026 10:54:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rosen Penev <rosenp@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
Message-ID: <20260427105438.2a9541f6@jic23-huawei>
In-Reply-To: <CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
	<CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
	<20260426114118.7ad8b130@jic23-huawei>
	<CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sun, 26 Apr 2026 23:26:33 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> On Sun, Apr 26, 2026 at 6:41=E2=80=AFPM Jonathan Cameron <jic23@kernel.or=
g> wrote:
> >
> > That is the minimal fix, so we should probably do that first
> > even if we then circle back to consider if __free() magic is worth usin=
g here.
> >
> > J =20
>=20
> Hi Jonathan,
> You prefer a minimal fix here?
Yes please.  Then if you like we can carry on discussion about whether
__free() is a good change here as a follow up.

That can include the fact that it would have avoided this bug ever being
introduced.

Thanks,

Jonathan

>=20
> Best regards,
> Felix


