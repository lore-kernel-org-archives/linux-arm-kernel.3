Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6287D6AAF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Qsw5fix1P+p4g7Vtv0/6ybBGhDHugan5tG7NBJtN3Y=; b=t+79JSUD5CYnOF5Rhmjb6QINtV
	FkEE9UK1YJ/i1CgMd+9bBpyAn+0dR0bt3knqhzo5abCrimZ5bxyMNfVbFF7dPZ0HsGh3Yh+rEHZ8+
	HtZ8nzzZA3iMrxuOrS6GczpBz27awGhJMY0VqJB2ayY8oQsWyZXGCFWH3pG6WOZBDOosczoUHLuqI
	jFmYu8F0UDNbKyc3HynOEjSo8zkpQzZkiRKEZ8YsWGHiSRXfGg4WHvbSTLg3qDzLoe9sayBLMcHu2
	DzgRc+L5he5+uFpmroSHFfXgzjGYYjkopR8EntTqo0+76CP+FKSIq8uTzcQ+V51HyxuxrqGnwwO5S
	Pa9iiMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L5t-00000000X3N-1oTq;
	Thu, 02 Apr 2026 16:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L5q-00000000X2u-1FOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FB3A41922
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 16:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BE7C2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775148028;
	bh=PHhMkTf2PU2A/KjRZXugaP//8msg3BdPHebsYhl2y/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mF6kwc+p9V7x0nJpfO2bEhRtd30slN9Y2SwYnaMv2mYDLT5AXW5aUTpXTf/Kab68h
	 r1Ta022jhAlos8uBUmml3ML+JG5zvZKir5k9wK/PXnqkJ2ZOR1YX2fV1jNVeFb7en1
	 59TD747G2nHVZh4/aEyneAR2GddgjDEkvRpNn/blOeG2bkaUlpbwZiB+uFQxgH3Qrq
	 gSHi8Xl2FBa6EYaVPPlC/cpi8WGa8q7sHBU4DKEV67rRwnrcLG0EIl4tOeVl/z6pLp
	 zSNNrxU2Eja0UafZ8c+LAhasyw8Sogn/FgR5jOt9WSoVud79carFhBV5aL1DQHqZby
	 DgbH4z4P8M8Yw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c500750dso1632133e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmvUKiVWniVKtJ4O0PNKRtPXckR+hEholiL3+TJQTqZuPtHq/2X1isymS9EvAOKtQO31eRU5N7irLvjR80HZjC@lists.infradead.org
X-Gm-Message-State: AOJu0YzJmxI2PgcZT+9YMwrsb/gjwABAsu3aV/z3XskXMb3dGyoNMywJ
	DSkIPm7pJCkkiv6hJZQ9uXOJZ2fMRC0RCFJ0j16pk1mHUzVSOKgq1UlxqWxwaZoQVE85rRq5LM7
	QC6vIyCE64G4TuIMQsagHsZjRCMSUkB8GW4YHpPo2NA==
X-Received: by 2002:a05:6512:3d0f:b0:5a2:ad98:366f with SMTP id
 2adb3069b0e04-5a2c1f195c1mr2697582e87.20.1775148026537; Thu, 02 Apr 2026
 09:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com> <DHITFGL3J4IE.2WZU3K2CSYL7I@kernel.org>
In-Reply-To: <DHITFGL3J4IE.2WZU3K2CSYL7I@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:40:13 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfAet449-uH9P-wz1FMLbsmNGCwtwWLRh7=RBrO+v3p-g@mail.gmail.com>
X-Gm-Features: AQROBzAduHOivprlKvhzUpkoRpQrf9dg2jV6hNu93i72s7Oqo9MWAkjXkw22YpE
Message-ID: <CAMRc=MfAet449-uH9P-wz1FMLbsmNGCwtwWLRh7=RBrO+v3p-g@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] kernel: ksysfs: initialize kernel_kobj earlier
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_094030_374251_100E7543 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Apr 2, 2026 at 6:39=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu Apr 2, 2026 at 4:15 PM CEST, Bartosz Golaszewski wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0f258aeeacba184d2025b932d90280cf2aabf4b0..8bc934162e712cf8ddf033e=
53bf3481054cfb7fe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7843,6 +7843,7 @@ F:      include/linux/debugfs.h
> >  F:   include/linux/device.h
> >  F:   include/linux/fwnode.h
> >  F:   include/linux/kobj*
> > +F:   include/linux/ksysfs.h
>
> Currently, kernel/ksysfs.c is not listed in the driver core entry (it is =
not in
> any entry), but I guess that would make sense.
>
> So, we should probably also add kernel/ksysfs.c. :) But this can be a sep=
arate
> patch independent of this series.

Ok, I take it no need to resend this?

Bart

