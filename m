Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB44CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1NwL7C4TUXiy0IqMMrn3WpIg+m5YuGpDASE8HR118U=; b=qPHE+I0SojgM6JExHMYaN5MfGY
	NROQRIAbzB1Q3+L6fxHycK4/Msx+Ii0kDNTktX0DCANXP3wkxCcpICh4q0u1B520I9BiIrSkyNHLn
	r12OL7KKrniwlGdTsRKZzohTgZO4YgHrUcaXQJ/sDkHkiOCHN0EBUOMhA8oRKZw9ZV043ULq6H52O
	KwDnSmSNa0lFxrE5IQ+1nc1sEwRbsOT3oYAIS7Z7JCjD4TnfRdyS8gWG9LgWPOa1YgNKhgNBzX6lI
	prnOftqfzVYUZGDiIVY0iCViqLgqa0JKaHoTZ1KK8mXHZzh+C2DXBUao764sShY7PcYIBP6eVq8D7
	wIQ7/gNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQmd-0000000Dl8t-2Gh1;
	Mon, 11 May 2026 13:34:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQmb-0000000Dl8D-1qsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC5084445C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C960C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506492;
	bh=r1NwL7C4TUXiy0IqMMrn3WpIg+m5YuGpDASE8HR118U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CY1zmRAv/Ku8mbJt4v6JYur71VvXUxbPvCoe1xXRVF9B3F6gu+fmOley5laUHiwCG
	 extjOR7/YS2xIQD8BEzYdA9lyWONIr6U0M0ZbPVoKwDFQd1T7bHwkrYorKd4qG+i0d
	 0NyDNQ1y55OaK0E1yIBilPr71rkX7HVuDO1vRRlLqbWWavLej0icZOI+0xODaf6B01
	 uEqdaqo4t0yPUT96/tEylp0NISrg6t0XIJli4QK6f0z7LYVqCxziIU89lJriPvoFo2
	 ev1Rt9JCtlWduoD5wsvx8DH2xebwPrTbIZZSRaFXRz5HRCvRHYnzmF6nib5sSGRS8b
	 EEAeIkqXYcEuQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso34650851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+5VRzs6y0GRiRzSvwKw5AZ4i/nbTGFYerLpJzL+p8OvaqDHhpVhabZ+qLDONhJciFTfmMhklG+yaac1J9PYSy/@lists.infradead.org
X-Gm-Message-State: AOJu0YzA+kQYVKgosehgHc/e2ptqp/teeuYDNG1X7RWZSHwKCAP3gCop
	UWACq2nVEQhzMQuv4qGWHThq+i9bvecCuQruH2Bp4CbWitJTiPo5Btf+HSqDKnESvcBh+n0TVQi
	cBeXwsOnjIXnCCeJxJUWHGaYdW+/+nzSTzT5TYobYpw==
X-Received: by 2002:a05:651c:2229:b0:38e:15d9:d60d with SMTP id
 38308e7fff4ca-393dad5f88bmr64043021fa.3.1778506491219; Mon, 11 May 2026
 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 15:34:39 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
X-Gm-Features: AVHnY4LqUFEpLtkv3mOskgVKC1lucSnvu3DKdQtMuet6VRvxpZSBsuokLGXn78E
Message-ID: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063453_500293_9F94882A 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 30, 2026 at 9:31=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This converts Nokia 770 to using real firmware node lookup for GPIOs by
> attaching the software nodes describing GPIO controllers to their target
> devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi!

Gentle ping, can this be queued now for v7.2?

Thanks,
Bart

