Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16683FF495E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mIIEb1EA+uewi2wstHd8yBhZNS073zT/E0vuu7ZcMk=; b=K8lGzAosdxSd070Eh2/9wVzIfh
	WScgr10gGbms3qXFtlaP+13bGdpGInVK32lkK3SMmHpedbfZImxhJAePQcBuJ145STE4oM0y81oB/
	/wBQgrlT93b+e8E7fMztzo6olFOR6S/SfDaE7SmDeao6uLUKSEWb8hUkxf0gvzYzzRMR8LKE7FlQw
	L9vfLNeBeQBs4Gta0B+ph45SJJYsHBp9aZ14AoHrHG+bm8mdLNYt/W/FdITanNNIRaCHBv9uibFaV
	MrrHwd30qGw/tJm//Uc+NH9vMR3mYNsCTAhM1P8GWnYaAyfz2wn//E7GhWA3z0TebtD5/22/kufT5
	PV9WLfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DIT-0000000BOFi-0ujk;
	Mon, 30 Mar 2026 14:08:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DIQ-0000000BOFH-104F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0EBF44579
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CA3C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879729;
	bh=UBMvKa6530vLa0XbCReC9z5oa2AyiAgd7zjDJyxTv74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuP7Z1KsMgAA6tSsPe2Z5q0aw+WmtfZ+YM3g7RqLtOGZbCjBUCFDGPXKx1sZgMUTW
	 5Bv24X1+9iOsLr8H5S0AxGPl5YVOjUUerA2gE4NkPS6v+P8//CqoiKR3akGiuY/9nn
	 lfPWH9fALC2uJtMI7+dGs+kcW4lLy1bGguXutCbJffPStgYy71J8RZrhVBGFGPQ/D5
	 F22RwOEq+Vly6dJixo51icP4mdgf9gnXn3g/rAQ04jobWUTbFQ8h/DfIOkctYqrTt/
	 clayt7zBzx5tFb6Osuqcdlzia+Eccuc4WB2rwJE9J9TxMCXDdnVPdarIcRLwkCgrRr
	 pd1UrbPCRMpEw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38b13652c87so38265591fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFcFSdy8Og8KW6KCJfI34sIjDdbtWyBQOThw8krC82kGCijGG1R9LVbDgWuQFT2+PJsdXe1soUqoci48S/BzpB@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWEZtiomNOuobWw25UZ4LE/BIacgBP+uiRzA5ake7dAbgjiJt
	YQGDinhsX/9mh+IQTyToxAquKnLhME9fBYmPDiSCaT5v/2b9DoARrrOr7/V+GMo2B1hz5TINr40
	wC0eES7gdu6Ku6aNMJlA4mhWGZy0LdxaMFYDh48sR7w==
X-Received: by 2002:a2e:a548:0:b0:38a:43eb:239e with SMTP id
 38308e7fff4ca-38c73192b65mr45193471fa.13.1774879728025; Mon, 30 Mar 2026
 07:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <DHG5OX85I4LL.39U0RRBS0JXFP@kernel.org> <CAMRc=MfG1ZF=4T2WAw71Zb+4BFD2_4VSNRQZQsoGLE8gZxWcHg@mail.gmail.com>
In-Reply-To: <CAMRc=MfG1ZF=4T2WAw71Zb+4BFD2_4VSNRQZQsoGLE8gZxWcHg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 16:08:35 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md4gD+9Rkg9MSe0OiYw-bS53nMAarFq_MZZHEq=yxYwVQ@mail.gmail.com>
X-Gm-Features: AQROBzCZ3sn6YhqN7BcNEXBcWbVXRGN722aFgaQTZcIuW6VGsXjtEbj0I4HGOcQ
Message-ID: <CAMRc=Md4gD+9Rkg9MSe0OiYw-bS53nMAarFq_MZZHEq=yxYwVQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
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
X-CRM114-CacheID: sfid-20260330_070850_468971_0AE4CD8D 
X-CRM114-Status: GOOD (  16.26  )
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

On Mon, Mar 30, 2026 at 3:52=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Mar 30, 2026 at 3:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > On Mon Mar 30, 2026 at 2:40 PM CEST, Bartosz Golaszewski wrote:
> > > Bartosz Golaszewski (3):
> > >       kernel: ksysfs: initialize kernel_kobj earlier
> > >       driver core: make software nodes available earlier
> > >       ARM: omap1: enable real software node lookup of GPIOs on Nokia =
770
> >
> > Looks good to me overall (one minor nit in the first patch); which tree=
 should
> > this go through?
>
> If the first two patches can make v7.1 then I'm fine with postponing
> patch 3 until v7.2. Maybe Dmitry's changes allowing passing
> unregistered software nodes to new platform devices (where are we with
> this?) would also make it in and patch 3/3 could be smaller as a
> result.
>

In other words: patches 1 and 2 can go though the driver core tree
into v7.1 and patch 3/3 will be respun next cycle.

Bart

