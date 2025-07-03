Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9584EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAuFhUzGxPd53TCxsNUAOI1LX6lnGTmE1lmkrDmMJNE=; b=20z67UQxJDfXjPzAb44+MeO1my
	SNVEWyU6v4IvR6S1Go4TW4lgbU9aYsYAEOH7RgHikv8RkmtjKJR7e8CD0ymBxmZNbNUfbzE8l+XKM
	K0HuWHitLo1McDoa0vrAZN8guPG7KBmcGyydJ+Lh4byJRZdb6eG/lSgHX5CWWIWWZ8pmoxyNeRlxk
	qHA0GYkcJx+tK9lsn2LRgx9/ebN5AZ1bQOURgarZKl3hVQgGWgzGfssPAKDZB7RAC569mWz23nEnq
	JAVNyX+imA9quRmNrMevTNkXFxNHQRrILacf0nWaNQ0hcPU8v5TbcXIX3KgPOuOj9Npq+l3n1BjlO
	FpRqKjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMwp-0000000C18O-1zRa;
	Thu, 03 Jul 2025 16:38:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKqE-0000000BeJS-43Mp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:23:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25EF3A53886
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 14:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CC3C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751552589;
	bh=l5n7kXhvAGrOm9NphwOIVtuuLX/5c5Et3Q8TUpS+US4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OrYJfjdzly7hPsRweQ3SxWicKOQlByqTvJPo5H1+ZM/N5bmTiM8qVtGxGW4NYt8A+
	 Fyz0yGwWWpkaZ4sgwJmFYUk+yz4WfV0i7qSLr6tBpaR7dXG9e/UM0wYwEJhkICRAng
	 IHpjNSGaAqQDgSxx/4S58S5DElJBTJsx4dX6SImkDMUeOXVVWUzMxfFkUfpwOjecIx
	 /RWBD44O5sNPErwj9Ni9rPCi7yyz+8V+VGNdc/UvtaAKu+jCDp1/c+wRxeEgQbSBbd
	 0exGF6Yc9SzMNScAAOQ5SH5P4ZAyiunRZcMX1dagjGrfiYuKIjfygTdK6DDbX4osQ5
	 RAClFYHJRB/0Q==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6138aedd718so135135eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEXr6u7VfzrfETW2TPGdllAaA31Bxdxae143mxfQG/kAOR+Ax9wQ0LKKb8lxfkakkrNgTaJmphptEk4Z0649tc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5vZZxfJZVrH86trbZAcmYyBvXpBYVCiEzHDTwqbsnpfxJEmHN
	ASSioTe895RU3AMolT+5fin8/hSHXG1eojoGLA4EaKUJ6dw/d25AWTFYaimj5zyeZiN5q6m7/mn
	aP0e7xQV8RAz7UjTGi9uma45V0xSl/ig=
X-Google-Smtp-Source: AGHT+IFsH0aSRQp7wu8IXYaHCIuiI4gj2e6MChKhmc3gfYwOzlI7yDPtPCwjVxuHnUkhcxa7iNP0U4E8pr0r21y0m7k=
X-Received: by 2002:a05:6820:2d0b:b0:611:a5f4:42c0 with SMTP id
 006d021491bc7-613835b96e9mr1676596eaf.2.1751552589091; Thu, 03 Jul 2025
 07:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
 <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com> <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
 <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj>
 <e635l6gfpg7amck2hnu4l47tnc54lr6e26v7y3ohaywil6pjwr@4trxzfdigo62>
 <CAJZ5v0gsLCpGnA5fNSSVLOoPL6Qinw=o_fBGG-0iFKeWyQtFZQ@mail.gmail.com> <lhqjjycgtiap37ckghkyovdyosxxo5ugdep6t7jjtxidk3rws4@re2x2rom7chc>
In-Reply-To: <lhqjjycgtiap37ckghkyovdyosxxo5ugdep6t7jjtxidk3rws4@re2x2rom7chc>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Jul 2025 16:22:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hNsHsuo=RCxJ2Egm5v6Sarao5QCguLKov0sWBcvNQ3xg@mail.gmail.com>
X-Gm-Features: Ac12FXwxCTmB0vY3edGbSK2DrfllNGxUqVpq9I-NJoPzzzT1x_r9hV2kLxvt_Vo
Message-ID: <CAJZ5v0hNsHsuo=RCxJ2Egm5v6Sarao5QCguLKov0sWBcvNQ3xg@mail.gmail.com>
Subject: Re: Forcing devices into idle
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Oliver Neukum <oneukum@suse.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072311_146567_3E023C9F 
X-CRM114-Status: GOOD (  57.79  )
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

On Thu, Jul 3, 2025 at 4:14=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 03, 2025 at 03:46:03PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Jul 3, 2025 at 3:32=E2=80=AFPM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Thu, Jul 03, 2025 at 02:06:00PM +0200, Thierry Reding wrote:
> > > > On Thu, Jul 03, 2025 at 01:12:15PM +0200, Rafael J. Wysocki wrote:
> > > > > On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@su=
se.com> wrote:
> > > > > >
> > > > > > On 03.07.25 12:08, Thierry Reding wrote:
> > > > > >
> > > > > > > Any thoughts on how to solve this? Is the pm_runtime_{put,get=
}_sync()
> > > > > > > method acceptable? If not, are there other alternatives to ac=
hieve the
> > > > > > > same thing that I'm not aware of? Would it be useful to add a=
 new set of
> > > > > > > APIs to force devices into an idle state (which could be sema=
ntically
> > > > > > > different from runtime suspend)? Or is this all too specific =
for any
> > > > > > > kind of generic API?
> > > > > >
> > > > > > Basically what you need is what happens when the system prepare=
s to
> > > > > > do a snapshot for S4. However, if you just perform FREEZE and t=
hen THAW,
> > > > > > devices will assume that user space has been frozen. You need a=
 way
> > > > > > to substitute for that assumption.
> > > > >
> > > > > Well, you just need to freeze user space beforehand.
> > > >
> > > > Freezing userspace seems a bit heavy-handed. There's only a very fe=
w
> > > > devices that need to be put into reset (such as the GPU), so most o=
f
> > > > userspace should be fine to continue to run. For the GPU the idea i=
s
> > > > to block all incoming requests while the device is forced into idle=
,
> > > > and then to resume processing these requests after the VPR resize.
> > > >
> > > > But maybe freezing userspace isn't the heavy operation that I think=
 it
> > > > is. Ideally we do not want to suspend things for too long to avoid
> > > > stuttering on the userspace side.
> > > >
> > > > Also, I think we'd want the freezing to be triggered by the VPR dri=
ver
> > > > because userspace ideally doesn't know when the resizing happens. T=
he
> > > > DMA BUF heap API that I'm trying to use is too simple for that, and
> > > > only the VPR driver knows when a resize needs to happen.
> > > >
> > > > Is it possible to trigger the freeze from a kernel driver? Or local=
ize
> > > > the freezing of userspace to only the processes that are accessing =
a
> > > > given device?
> > > >
> > > > Other than that, freeze() and thaw() seem like the right callbacks =
for
> > > > this.
> > >
> > > I've prototyped this using the sledgehammer freeze_processes() and
> > > thaw_processes() functions and the entire process seems to be pretty
> > > quick. I can get through most of it in ~30 ms. This is on a mostly
> > > idle test system, so I expect this to go up significantly if there
> > > is a high load.
> > >
> > > On the other hand, this will drastically simplify the GPU driver
> > > implementation, because by the time ->freeze() is called, all userspa=
ce
> > > will be frozen, so there's no need to do any blocking on the kernel
> > > side.
> > >
> > > What I have now is roughly this:
> > >
> > >         freeze_processes();
> > >
> > >         for each VPR device dev:
> > >                 pm_generic_freeze(dev);
> > >
> > >         resize_vpr();
> > >
> > >         for each VPR device dev:
> > >                 pm_generic_thaw(dev);
> > >
> > >         thaw_processes()
> > >
> > > I still can't shake the feeling that this is sketchy, but it seems to
> > > work. Is there anything blatantly wrong about this?
> >
> > There are a few things to take into consideration.
> >
> > First, there are 4 tiers of "freeze" callbacks (->prepare, ->freeze,
> > ->freeze_late, ->freeze_noirq), and analogously for "thaw" callbacks,
> > but you only use one of them.  This may be fine in a particular case,
> > but you need to ensure that the other tiers are not needed and, in
> > particular, the _noirq ones need not be involved.  Also ensure that
> > they don't assume that PM notifiers have run (or that they will run on
> > the resume side).
>
> I think that's something we can accomodate in this case. The primary
> device that needs this in the integrated GPU on Tegra, so it's very a
> narrow set.
>
> > Second, if there are dependencies between the devices being frozen and
> > other devices, they will have to be taken into account.
>
> Fortunately, as far as I know the only dependency, if any, would be via
> the userspace. There's no relationship between the devices from a PM
> point of view.
>
> There might be a video decoder that decodes images into the VPR and the
> GPU would then read data out of the VPR and composite onto the screen.
> So as long as userspace is frozen, there should be no issue.
>
> > Also note that kernel threads are generally not affected by
> > freeze_processes(), but I guess this is not a problem in your use
> > case.
>
> I had read through some of the documentation around this, and yes, the
> kernel threads shouldn't be an issue.
>
> In any case I'll make sure to add comments where necessary to point out
> the peculiarities of the whole thing.
>
> So this sounds like a workable solution. If for whatever reason freezing
> the entire userspace doesn't work out, would it still be possible to
> "abuse" the freeze() and thaw() callbacks like this? The way I imagine
> this would be for freeze() to include code that effectively suspends all
> userspace submissions to the GPU (i.e. effectively suspend all GPU
> related operations).

If you can effectively prevent user space from interacting with any of
the affected devices, directly or indirectly, even via mmapped memory
regions or some such, then this should work.

The freezing of tasks is basically all about getting user space out of the =
way.

