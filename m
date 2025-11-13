Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBBCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W24rXr9XTIjoWbBrgVjF1WMdWafKto7r84bSibgNW+k=; b=Deb+Kvd3KcIvnJdIkx6cNzOvrz
	UIKRX7Xihob6VjZqQndOC41g8JTbEQ8+aujn9/xjB1SHUUcdjkDXWK7xPuUtNZy9PxRLJOK8eqYBh
	xr1YMs94JR8ijGqm6wxAzJbRh6J6WcMAlldb2NghF/K3nit/217A3GRhU7sWb1SPcXLuLaFt3t9NV
	qs5PzcPhloUQrsf3P0bE6eY8bn4F7s6Xf+6wbUe/mu50ggvJVqiuYoMCtLYnOkPGItJJVafWxYssc
	qJc6HC1D8UcKWXbwiw0P5GV+g8LXb34iP4mZNzrtktZoC0cGq7dfOWBhoY0HL2DpT8DbLvCpVkxQd
	Ixs7Jd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcpr-0000000AzTY-1eJV;
	Thu, 13 Nov 2025 19:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcpq-0000000AzTQ-3kWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 554AA60122
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04370C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061502;
	bh=6UprQ8VPFTOJEJnrAk3c1+70Nbd/u85upyCo1jyU1qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W0X7qiriJx8qwv9BbYquHPo7dcdlB2adgQNwN+FfcpIdmW/AITZJ5Zpqm03CC/Dxr
	 6GnRSXQmfJ+W2vthEpzKITubGF74mnCc6WUcvin3uowyc8BT86f+//ZfLYv29g+BBF
	 lF+wiMxVq3NM9L1tiAzuG5XwvTH/cQqPOIPuH8Swojls+LSeWQiKJpBdWwsNkrHfoc
	 ViJlr54gGxXeICJKCHSvemTDsL0eAAUa1Kuky49BxecjyBAtJpJBy74zC1sU1paLFh
	 iEnE0JiwwGU2Q+ypXPimklXXrXm0/+3QIl6jESwwRiu7KL4wKdlkBy+NprPJA+WbMw
	 +qgnAYGxQ0H4g==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-657230e45e8so540909eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 11:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnAY3bt3MnEp2o0BYYISIHNmUad0mueMkA59QSuN2x5nWabmO4Ho3TN9KMHOhv+ech3htJFTajp7N+Gb6nVs5w@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbw6Q43BpRx8C8EFXS06LPpeytQX5nbkvLSGQsVKa3MbGVbIGm
	NOave+21Z25soTn2qMNsMrQmd2ldsNvoAWJBZy0UazCiQzwsPrPeYeoFiR0Cb7sVqAvjQ5wXrUi
	7fQQHvqHamY23h7FWD0G64CNKoUCJJho=
X-Google-Smtp-Source: AGHT+IEEkDRYf3o6eWh7An4Eb7oaPpWELLivUE1adLZQeit4rdCPvsjZcC3pPuLNVua35azYMW1z4kNGcBFvSY5y77M=
X-Received: by 2002:a05:6871:e324:b0:3d4:b889:7d65 with SMTP id
 586e51a60fabf-3e8674043b0mr485629fac.19.1763061501288; Thu, 13 Nov 2025
 11:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com> <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m> <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
In-Reply-To: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 13 Nov 2025 20:18:10 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
X-Gm-Features: AWmQ_bka8IUODzeQR5ggeX8uZbZXXCIST1G0sD3k8DJ8TOKe2Mgor6ApCD0oVpM
Message-ID: <CAJZ5v0gupHEg8ip+2R1wYAQ=BQn4Mk5EMMu==StRxwvXA0WwsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Nov 13, 2025 at 7:32=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> > On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.redin=
g@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Several drivers can benefit from registering per-instance data alon=
g
> > > > with the syscore operations. To achieve this, move the modifiable f=
ields
> > > > out of the syscore_ops structure and into a separate struct syscore=
 that
> > > > can be registered with the framework. Add a void * driver data fiel=
d for
> > > > drivers to store contextual data that will be passed to the syscore=
 ops.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >
> > > This change is fine with me, so I can apply it unless somebody has an=
y
> > > specific heartburn related to it (Greg?), but in case you want to
> > > route it differently
> > >
> > > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> >
> > I have a few follow-up patches for the Tegra PMC driver that depend on
> > this. 6.19 is what I was targetting, so if we could put this into a
> > stable branch that'd be the best solution. I can set that up via the
> > Tegra tree if you and Greg are okay with it.
> >
> > If that's all too complicated, I can probably wait until the next cycle
> > to merge the PMC changes.
>
> I've added this single patch to a branch based off of v6.18-rc1 that I
> plan to feed into linux-next so it can get some broader exposure.
>
> I can keep that branch stable so it can go through multiple trees if
> needed. If anyone's interested, the branch is here:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/l=
og/?h=3Dfor-6.19/syscore

You beat me to this, sorry about the delay.

