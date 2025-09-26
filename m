Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C845BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyUN7D6oZLV2X/YWbDl0e3kNyNSwtLIuXnqd3Bdkc2E=; b=FOMnghxpaFDX1gnGjqgrPT2zu2
	UN9bLn6hGHgLWzcEicFauljwZ2Jmn/8/S4KwLfqKA5tQMF+2pHHUQs06aP+pTk3UoOuk/7kWvtYuI
	2uDZKCzXgNc7aHSOTxHSOIXz+/tUmE1h/OqXDvEErv+hLyCwlY3OpzSBVI6aTa8kSywztMMjsPx3k
	gqOE4DKSNbk3BSHXkVlqvdezD+L8aSbk5LAx1BSCtgFS+JfJcBPL5I6u3bemeKjW/kvLmPfNY9V4o
	iDhOV+wKqKr9QRo4fwx2qto5jG6M/Wlrl+7i+GfutYkVIKTjIvEeIhFShaJpfayu2qsEVv1niETUz
	z07q4IBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Bvq-0000000373m-34YN;
	Fri, 26 Sep 2025 17:08:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Bvq-0000000373f-05V6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 17:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64B1361EFD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 17:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1655AC116C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758906509;
	bh=2k2hTdvMUMCBLwcaMUYR14NEFrjKaCrWCdwr1BF81Cg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CMiEpzTZJcual83j5hUldPV7+sHvWuKekiGZpRbf8yW4eWpZHbUvLCpeOt9NV/nMh
	 uJm8f2PXJmUdV4iu+E3DBbVyZpz9pPQqHgtys75AFnCO0IxcaLjqe7xfqcGNjEiFjV
	 YuFElmU8ijUO12SEIBM6QEJbwj35Sx0W0Fgh/HiOvxTCULZMcH6D7qa2LnJLvu5Cd+
	 2OUW3yVplKehk2pkpNswf4pNDZWD5Mj7RG2VujP4oj4R+1mz0VVyQqDmkSa5o0zl7O
	 bo0GN3l/Ptt4bCS4mZm8C9BVeh/Qrs1TLSHmQjeWnqB5J38yPud+FBazAD8qBsInWE
	 yv6YTFw+LbHqw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3627a1979a0so2034111fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 10:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3woS1epyspGVKsUUQJhL6B8AsQTJKjqbFmrIlzO4vqpYj34WFUdpzMFpu09b0NDuBGgEKF6v24WUAwzhGDrM8@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsH11cBUB/oTuIji8gflBZeK/6cTyN/9SAHAWW6EgzPPyD3Oe
	PjnxZmZ7pPTUvFbb4O5lQUmDWfGt6/XvzPm6WOZWUYFaY2zSyLgzgEbfTYDDnEsR61CFniXpERp
	bcwQccEW7ZSN9Si/NSQx1E9NuTSP5bLE=
X-Google-Smtp-Source: AGHT+IH2mRpZIU8ZaEbNdZwTO1VJh8Q624WlaeOlz908V4Q1o4tThzIUzp9Web59JAo2CF5s+jg+70n4pfAm8Y+ST1k=
X-Received: by 2002:a05:6870:f609:b0:35d:45c7:4a83 with SMTP id
 586e51a60fabf-35ee837d602mr4724817fac.23.1758906508329; Fri, 26 Sep 2025
 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
 <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org> <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
 <DD22MGF3HNLM.Q7S70RX4NZXS@cknow.org> <CAGETcx-WY1x_ud8Ef1jbpYQVtFv7MZHMpHfSVKA9R9tya0Lxjw@mail.gmail.com>
 <CAPDyKFp0uV2WaQGjwsO8JG1zF_1oXj7-GVnaejih+dN9RAdykg@mail.gmail.com>
In-Reply-To: <CAPDyKFp0uV2WaQGjwsO8JG1zF_1oXj7-GVnaejih+dN9RAdykg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 26 Sep 2025 19:08:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g_QHQzYTN4Sra_gGQXmRDxUPEjDMyOMB4+PxHcD6vfsQ@mail.gmail.com>
X-Gm-Features: AS18NWAipPCw_sbfz1uZIP7ywHKnNEbuCNxO6eGIBb1HO8SG50NvmitiB8SDjLc
Message-ID: <CAJZ5v0g_QHQzYTN4Sra_gGQXmRDxUPEjDMyOMB4+PxHcD6vfsQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Diederik de Haas <didi.debian@cknow.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter <jonathanh@nvidia.com>, 
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

On Fri, Sep 26, 2025 at 2:05=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Thu, 25 Sept 2025 at 23:49, Saravana Kannan <saravanak@google.com> wro=
te:
> >
> > On Thu, Sep 25, 2025 at 10:52=E2=80=AFAM Diederik de Haas <didi.debian@=
cknow.org> wrote:
> > >
> > > On Thu Sep 25, 2025 at 4:26 PM CEST, Ulf Hansson wrote:
> > > > On Thu, 25 Sept 2025 at 15:59, Diederik de Haas <didi.debian@cknow.=
org> wrote:
> > > >> On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
> > > >> > Due to the wider deployment of the ->sync_state() support, for P=
M domains
> > > >> > for example, we are receiving reports about the messages that ar=
e being
> > > >> > logged in fw_devlink_dev_sync_state(). In particular as they are=
 at the
> > > >> > warning level, which doesn't seem correct.
> > > >> >
> > > >> > Even if it certainly is useful to know that the ->sync_state() c=
ondition
> > > >> > could not be met, there may be nothing wrong with it. For exampl=
e, a driver
> > > >> > may be built as module and are still waiting to be initialized/p=
robed.
> > > >>
> > > >> "there may be nothing wrong with it" doesn't sound very convincing=
.
> > > >> So there *can* be something wrong with it, so warning sounds
> > > >> appropriate? If there is (certainly) something wrong with it, I ex=
pect
> > > >> an error.
> > > >
> > > > Sorry if I was too vague. See more below.
> > > >
> > > >> FWIW: most of my drivers/modules are built as modules.
> > > >> I do seem to run into 'problems' more then average because of that=
, but
> > > >> to me it just signals there is something wrong ... which should be
> > > >> fixed. Not silenced.
> > > >
> > > > Well, why is it wrong to have drivers being built as modules? They
> >
> > IIUC/Remember Kconfig correctly, FW_DEVLINK_SYNC_STATE_TIMEOUT should
> > be off by default? (if I don't give any default, what ends up
> > happening?)
>
> As "FW_DEVLINK_SYNC_STATE_STRICT" is default, the "sync_state()
> pending due..." print gets printed for a lot of consumer devices that
> have not been probed yet.
>
> >
> > If we can assume, timeout won't happen by default, then the only
> > people seeing this warning are people setting the flag or setting the
> > command line param. So I'm okay with making it an info.
>
> I think you got this wrong. It's the default behaviour that triggers
> lots of prints.
>
> >
> > But the "sync_state() pending due to" is for the default behavior. I'm
> > assuming without the sync_state() supported added to power domains,
> > the ones getting this warning would have been powered off? But after
> > the sync_state() support, it's not powered off anymore. That can cause
> > increased power usage. Seems like something worth warning about.
>
> Yes, I certainly agree, but...
>
> To me, it kind of sounds like we should change to use
> FW_DEVLINK_SYNC_STATE_TIMEOUT as the default behaviour. In that case,
> I don't think there is a need to change the log-level for
> "sync_state() pending due to..".
>
> >
> > Also, another thing I want to understand is, for all the reports you
> > are getting for "sync_state() pending due to", is it actually correct
> > to have them pending? Or can fw_devlink do better in those cases and
> > turn them off? It could be a driver fix/fw_devlink fix depending on
> > the issue.
>
> There are some cases that we potentially could fix, in particular for
> when a genpd-provider, provides multiple power-domains per device-node
> (#power-domain-cells =3D <1>;). But let's discuss that separately.
>
> >
> > TL;DR:
> > 1. For timeout messages, since timeout isn't default behavior, I'm
> > okay making it an info. But
> > 2. For pending sync state messages, I think it should remain as a warni=
ng.
>
> See above.
>
> This means drivers being built as modules will trigger a lot of
> warnings, in the default behavior. Is this really what we want?

No, at least I don't.

Printing a warn level message about anything that is not a clear
functional issue is seriously problematic IMV.

As for whether or not the messages should be info level or debug
level, it also depends on the amount of noise generated by them.  IMV,
generating a lot of noise at the info level is not really useful and
may cause some actually useful information to be missed.

