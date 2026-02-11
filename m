Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7D8E9E303
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECY4SrJPSqDkIQ4i6WcKtyKEPZ0FhwYjfRkaSNPqFK8=; b=FY7By72fwLQ7HCztvaINIaB6CA
	fIilaKaJ6eWRmQhHtdzSh9o+pPv5MUtrQJPspAYpw0q3Q9SgoCsc+hr9wOrUYgCehwwoOJG0hLkYo
	uH5eCcyrcr02QYadqO16EIJbwynTuZHXctkgszqn3xTL6ISPgM3M2i+9+cmZzhOuKrYWfMbrwkmuw
	7a/jXR1V7xcmQsrlIdcUKEujn5u7YDVYwvUvzM3GmV5C2BzwM6XnYSJvp5N7A+6hut16TqiaPJFYR
	dknabwUR2klYPywWjylNWANMcLLsSQDWJXgPu/5mQ9/t52H55/YyEASWgvNNRF5H7GNnCvsd/ixOD
	92ovUPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9ie-00000000eH1-2X4P;
	Wed, 11 Feb 2026 12:53:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9id-00000000eGE-2TyS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97E1860053
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 12:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0B8C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770814402;
	bh=ECY4SrJPSqDkIQ4i6WcKtyKEPZ0FhwYjfRkaSNPqFK8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NgZ3TLGhJRe+d7bCq02qVPhgkVZMtqwFY8Eiey7YWW5mTf6yy4GfxXlEmE+7buqrW
	 9KqdfVGy/kz+M6cTF83RucUSwPlohnClSSA+srnYdbJiT4g8KsOM5s7PfHEfnvOnGR
	 wlR/24q6ow9Z3xXF9QYG4I+UjespQpp5Ju+cTAbtYpuQ5DLFwsOjlPGsnWP9Pg8b18
	 Pc7SOAtSKJDO/W/QR0iVjXExAYItLvT4GrzV9OcGVvA9n0zyKr7EfOdE9MsCSUUPX1
	 myNDhYbYEz7WtgRaQwHqyJedrjRlGnArvGFa6yzPLXOLivI5eaYfaocQSa2SReoB/Z
	 ERFMq5xmvq4Vg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870dec27f4so124471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 04:53:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwCJKuTvM7PqKsrni6v7V+iVe4J/hhRFS+rZf74hdfNXnUZUuCvHr7JQhApKMsKHBZwG1YO3yV5yNLZnJsj7o3@lists.infradead.org
X-Gm-Message-State: AOJu0YwfILl328dZzAzpmDOeRxAUMXnRhf+QJbhQBKkcsPcfg2LWraRK
	H0Nrmg0U3JfPMOoHRFE3bv+BfgbXc2vqMvKuSB97WRW0UoAIV4G13KY0TVqW9mk1Ndq6WdhNa74
	3sYIKByzuUISdJQ6T9mEvfGBY4ULbu+orYrRSUJ9YZw==
X-Received: by 2002:a05:651c:1442:b0:386:fd3b:f911 with SMTP id
 38308e7fff4ca-386fd3bf989mr11619741fa.8.1770814400911; Wed, 11 Feb 2026
 04:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20260211111449.122593-1-bartosz.golaszewski@oss.qualcomm.com> <aYxrQDFxcQ6G-tbB@darkstar.musicnaut.iki.fi>
In-Reply-To: <aYxrQDFxcQ6G-tbB@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Feb 2026 13:53:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MddAA6+=rT1WO3ttGLLN0WqXhStoEBFUWW-fsCjUMWkJQ@mail.gmail.com>
X-Gm-Features: AZwV_QgfmOgTu8_Ue1SXKCoMiqcbhAje3Iezhin27cUQawGgl0nfdhO1O13SMss
Message-ID: <CAMRc=MddAA6+=rT1WO3ttGLLN0WqXhStoEBFUWW-fsCjUMWkJQ@mail.gmail.com>
Subject: Re: [RFT PATCH] ARM: omap1: enable real software node lookup of GPIOs
 on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Feb 11, 2026 at 12:43=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:
>
> Hi,
>
> On Wed, Feb 11, 2026 at 12:14:49PM +0100, Bartosz Golaszewski wrote:
> > Currently the board file for Nokia 770 creates dummy software nodes not
> > attached in any way to the actual GPIO controller devices and uses the
> > fact that GPIOLIB matching swnode's name to the GPIO chip's label durin=
g
> > software node lookup. This behavior is wrong and we want to remove it.
> > To that end, we need to first convert all existing users to creating
> > actual fwnode links.
> >
> > Create real software nodes for GPIO controllers on OMAP16xx and
> > reference them from the software nodes in the nokia board file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > This is a follow up to the following discussion[1]. I don't have the
> > hardware for testing so only build-tested it.
>
> I won't build with CONFIG_I2C_CBUS_GPIO - the CBUS is mandatory, otherwis=
e
> the board will power off 30 seconds after the reset.
>

Ah, dang it, that's why I didn't see the build failure. Let me send a
v2 shortly.

Bart

