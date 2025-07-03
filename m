Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D66C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IivRk5GlnKWePlP7UJ4Y0/E4K2dP4HjS3F1bQnNamjc=; b=x4NZK0enmFqj4Qgtfxmay/En5n
	e3A/3EH1zPQoBlSymGl6PYj1McUWwHvCD7jLucdhjVYh9pdys9gOUXxWocYU42Cza65bSNMx+Am8V
	3OozgYSkqCj+48bLrPrUTc3E18DMuAdCpQabXDo73LMMSOg7rxJjBmBX7wz+LNxZlc6lGxeB+1qMj
	IZN28/F3aV040yiW3ply37uqfMIUPH1cVvQjUKQE66ii7wwkHP3jQs1aZlgxN4h9lND4ak+Mrrfrz
	0dCUakLlVEoccmOGOu+Na6AquYpOYlrdXoDkG9GnR0SPgK6lVpyItpVfQQ6ZcokUrR/y49JBcBOlH
	VRswwEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM5L-0000000Brzx-2M6g;
	Thu, 03 Jul 2025 15:42:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKGW-0000000BXYD-3YnP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBF214598E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 13:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A95C4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751550375;
	bh=KfUSNGQ37UCIpa1WbY7nTzUA43ohR2bW2z8Jpfr5BKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q3LvqclkARsqKciZGJOJT7P26FiQtVqc05WYWQZiBpUjn5a82y8E3aL0vg2u300l5
	 yt50ByR9EoUThOSkXQGpnbTHtPnoG4fuCpm1hup/KH/mEsqTn4K0/zsJdzn8UMd+J8
	 jk0wLOtHtulIXi4tZAwURuLchdpZPDCV+0wSHE9etKSWPwTfcerzTluGT+89/up91i
	 EID7d4jDubkd4OupVaEkp3ZG3DcFwppAINTX3dlLggrates+h3j52k6WbEfe/Q48E3
	 uS6xJeszHNBqYUW+yP8xcp/AENv1Ly8gQeh8vJedw7zQbDVgwwZCnXGjvfl7vPf8t7
	 GG3iPeG9yKOhA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-611a7c617b4so2383642eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRcVPUid+9+wS4tizURmIBVtsOGvck7soRuvqOoC9IGQ+5PWkX4zj9F5Y2D2DCBHOGgzzkmVyIAgizcWwhEMfM@lists.infradead.org
X-Gm-Message-State: AOJu0YxilJ0Fe8ZHI1l4ML3FslyXNARuWKcszH2htX7FK2WjkROZj8TO
	yPsbaeOsJ8X/PV/su60FK2wsfsYIENGWiYpxdgHcgfnbnbnTRLgVN9q6IT0A6KbJd/KAKFvMXeo
	0rxeNSbpq4Hkz9c3lAFeqPQXq5oEgskc=
X-Google-Smtp-Source: AGHT+IFRGzpNAwgOZYcA9ML7MvvQBl1ZOes81gaH7XnaiyMopbp7+DoCLDWZ2ljxNjM14Z1CdAkyQT97LqNFXudCjGU=
X-Received: by 2002:a05:6820:2483:b0:613:87ee:10e with SMTP id
 006d021491bc7-61387ee02d3mr627853eaf.5.1751550375080; Thu, 03 Jul 2025
 06:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
 <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com> <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
 <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj> <e635l6gfpg7amck2hnu4l47tnc54lr6e26v7y3ohaywil6pjwr@4trxzfdigo62>
In-Reply-To: <e635l6gfpg7amck2hnu4l47tnc54lr6e26v7y3ohaywil6pjwr@4trxzfdigo62>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Jul 2025 15:46:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gsLCpGnA5fNSSVLOoPL6Qinw=o_fBGG-0iFKeWyQtFZQ@mail.gmail.com>
X-Gm-Features: Ac12FXyvXICzxs9Gum-bU5T0wa6naIqz0g09M3W8Ukt8GohaVls9utaM8cGw-Ws
Message-ID: <CAJZ5v0gsLCpGnA5fNSSVLOoPL6Qinw=o_fBGG-0iFKeWyQtFZQ@mail.gmail.com>
Subject: Re: Forcing devices into idle
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Oliver Neukum <oneukum@suse.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_064616_933615_55A5E72D 
X-CRM114-Status: GOOD (  44.38  )
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

On Thu, Jul 3, 2025 at 3:32=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 03, 2025 at 02:06:00PM +0200, Thierry Reding wrote:
> > On Thu, Jul 03, 2025 at 01:12:15PM +0200, Rafael J. Wysocki wrote:
> > > On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@suse.c=
om> wrote:
> > > >
> > > > On 03.07.25 12:08, Thierry Reding wrote:
> > > >
> > > > > Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sy=
nc()
> > > > > method acceptable? If not, are there other alternatives to achiev=
e the
> > > > > same thing that I'm not aware of? Would it be useful to add a new=
 set of
> > > > > APIs to force devices into an idle state (which could be semantic=
ally
> > > > > different from runtime suspend)? Or is this all too specific for =
any
> > > > > kind of generic API?
> > > >
> > > > Basically what you need is what happens when the system prepares to
> > > > do a snapshot for S4. However, if you just perform FREEZE and then =
THAW,
> > > > devices will assume that user space has been frozen. You need a way
> > > > to substitute for that assumption.
> > >
> > > Well, you just need to freeze user space beforehand.
> >
> > Freezing userspace seems a bit heavy-handed. There's only a very few
> > devices that need to be put into reset (such as the GPU), so most of
> > userspace should be fine to continue to run. For the GPU the idea is
> > to block all incoming requests while the device is forced into idle,
> > and then to resume processing these requests after the VPR resize.
> >
> > But maybe freezing userspace isn't the heavy operation that I think it
> > is. Ideally we do not want to suspend things for too long to avoid
> > stuttering on the userspace side.
> >
> > Also, I think we'd want the freezing to be triggered by the VPR driver
> > because userspace ideally doesn't know when the resizing happens. The
> > DMA BUF heap API that I'm trying to use is too simple for that, and
> > only the VPR driver knows when a resize needs to happen.
> >
> > Is it possible to trigger the freeze from a kernel driver? Or localize
> > the freezing of userspace to only the processes that are accessing a
> > given device?
> >
> > Other than that, freeze() and thaw() seem like the right callbacks for
> > this.
>
> I've prototyped this using the sledgehammer freeze_processes() and
> thaw_processes() functions and the entire process seems to be pretty
> quick. I can get through most of it in ~30 ms. This is on a mostly
> idle test system, so I expect this to go up significantly if there
> is a high load.
>
> On the other hand, this will drastically simplify the GPU driver
> implementation, because by the time ->freeze() is called, all userspace
> will be frozen, so there's no need to do any blocking on the kernel
> side.
>
> What I have now is roughly this:
>
>         freeze_processes();
>
>         for each VPR device dev:
>                 pm_generic_freeze(dev);
>
>         resize_vpr();
>
>         for each VPR device dev:
>                 pm_generic_thaw(dev);
>
>         thaw_processes()
>
> I still can't shake the feeling that this is sketchy, but it seems to
> work. Is there anything blatantly wrong about this?

There are a few things to take into consideration.

First, there are 4 tiers of "freeze" callbacks (->prepare, ->freeze,
->freeze_late, ->freeze_noirq), and analogously for "thaw" callbacks,
but you only use one of them.  This may be fine in a particular case,
but you need to ensure that the other tiers are not needed and, in
particular, the _noirq ones need not be involved.  Also ensure that
they don't assume that PM notifiers have run (or that they will run on
the resume side).

Second, if there are dependencies between the devices being frozen and
other devices, they will have to be taken into account.

Also note that kernel threads are generally not affected by
freeze_processes(), but I guess this is not a problem in your use
case.

Thanks!

