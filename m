Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95D9CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov574hmILB3pdxYdVww1k57wi7RZAzJuxmEZc5khEpc=; b=Vf/7n4psXXKvaMP5/cW6RsrTAh
	hoSne5dY0FCJI8G9frkG3ZGiyUc4kZqq8oUwdyFCZlVTLRv12gJ1T0co4uCQcH9JRpv7LjgArmhN9
	XMxif9f733QHMJ3wpMjIcpmONP+Nf2PSi2wTv3paTqx2JG52UXgsPsX2TQJpDCjQBT3IWx1pR/I9C
	BcBc2qLcVxF8BJPYsUCnW6+k2cMyx8pBg/Y0akG/QeizOHOucuk+U84ZycUzOibpj+dfX2IgRrHgi
	/SsepbeAtOIthhgaCsJV20SRsmo46wg+sprdpMdW11iC1QSyKqYUsXLcKYNspsOzcIgtSt5Bh3J+y
	W8WT+hQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXboy-000000098Ip-46dB;
	Thu, 11 Jun 2026 09:35:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbov-000000098IV-2rhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C77846001D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F501F00893
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781170528;
	bh=Ov574hmILB3pdxYdVww1k57wi7RZAzJuxmEZc5khEpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A1/pVACiTZRAyvqSvqEomemy4em1jq1mn10xf+YddyDmO+LQsyXzcnpO+6OdkAUdi
	 yt34E2hgTuHynVkbQ+G7v+YhIYRTHl0CedAwB54FM/vhiIG2jKUJde3lnJAjtuutTM
	 nbOC+ZA9BDBl9yKwb6CLfM/2miWpqts62qkiO5uoMkBFw5qMVp+gNi9r4ypV7ZdXXy
	 utPeojc90hX3TyUAtfygwQFWHYpvCz7deOF+NgKmVqcR3EJtoPqp+B54tJBAAkZYgF
	 poIqSVcChK12wjfXWVIP8xYLTHrHTRdakNyGwz6XbRWEH9G1GPXNksQKqmu5S1kjSx
	 kOI/cBXt1aO1g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3965eab14cfso59318161fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UV8BFMshy0wxhz0cPaxClm6dR2eDwmuLpcqVq4knE9CleGa84RQhEtOqkf9KCqcfwE1cMgpYljmMlZdwFhlQt@lists.infradead.org
X-Gm-Message-State: AOJu0YyMu2a0W481LxzD8u4gDxyIb0BOiW4eNIaZBY6j7qcZZA5sHr1G
	KSrcmrhKmIVH9Yoeqrfu3h0EUwkbxICGlIcsSqDtKBRj0a1EyjJU5Wj55aImrBYJKd/7R0tVbbx
	ZmsLwllrZu5zverhaVvrVEapBN7sB6ELUQcKKx+1bIw==
X-Received: by 2002:a05:651c:248:b0:395:6085:a15f with SMTP id
 38308e7fff4ca-3991a037f82mr5814191fa.9.1781170527256; Thu, 11 Jun 2026
 02:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local> <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local>
In-Reply-To: <aipz2zMFcdnZYTxS@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 11 Jun 2026 11:35:13 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
X-Gm-Features: AVVi8CfSg10E0UvFAW373K-Jcv4BNuLaPDP9X_vJcmiaG1CmuHb8KO5g7-SqyaM
Message-ID: <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>
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

On Thu, Jun 11, 2026 at 10:37=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote:
> > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > >> When a USB hub port is connected to a connector in a firmware node
> > >> graph, the port itself has a node in the graph.
> > >>
> > >> Associate the port's firmware node with the USB port's device,
> > >> usb_port::dev. This is used in later changes for the M.2 slot power
> > >> sequencing provider to match against the requesting port.
> > >
> > > Okay, would this affect ACPI-based systems? if so, how?
> > > Can you elaborate on that, please?
> >
> > Is it possible that there's an ACPI device node associated with the por=
t like
> > on some DT systems? I don't think so and there should be no impact IMO =
but I
> > also don't know enough about ACPI.
>
> The API is agnostic. There is a possibility to have software nodes associ=
ated
> with the port. I think the best is to be sure that ACPI-aware people who =
are
> experts in USB will check this (Heikki?).
>

Even if there is a software node - it shouldn't really matter. It will
just be assigned to the port device.

Bart

> Also note Sashiko complain on reference count leakage.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

