Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F2FD2F038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLP5WPSJ4MT6lYx0a9IOsqeVgLkh+TkHWnXIWRvaeXg=; b=Gd46vCR6BmabZkn3hWC0bBNIfE
	CzDJosKbjFV+LtPOvK4tCacJh9NCmCHTPMLQYJLbChtOVJAco/yn/ZPPob6gksnin3Bhkb0W85be/
	UBwAmJukqLBOvnTnQDhZoNvVVNIzwLIuKi9X0tAHJID38sb24xLtfZZPMGIHNmSMsF1MKM6GyVmhh
	Gqg9oh8tqvHRishQFzKL3nhGdizf95pL7jcAHu0F2vfeHOx3yHvcwinHXG4EhVvG4RCWOU0pIdEBl
	RTFOmH97lysEiqR89PPVo80J2sdWjFVJOA1F4G5oiua5/p4Raz7YpnsAJ6Kc4DmadXDwJWqkxr+ra
	qeC75jRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk95-0000000EPA5-2zD6;
	Tue, 27 Jan 2026 14:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk93-0000000EP9z-47WQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 084DE6013B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3394C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769524456;
	bh=nLP5WPSJ4MT6lYx0a9IOsqeVgLkh+TkHWnXIWRvaeXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cFQ8eKypCxJneIg4jM9c7+W0y87mV9/GiLxNnhaswgztLBP78Vz/06/PbHJdEzzEY
	 aHF4Z9GTm3cTSjU/wQbAeKE6rQWSexI5MfvM78RJ0ot1doS6Db9RBwS/xxGuGpOBju
	 yPeL8c4QTVuKxU7VsBz1cmo3NX9+1zle0SN969vtt/Gb0zid/QrFxhBwb6B4Dsq4du
	 ME69Q+CuXcxq+PHoKzNBiNW3uGRf9wF7mgTbK+bGWKPyhCPeGj5dPDSMuHQI0Z+Jl0
	 0UZinsUPOrdT+E8ETs5KgZZaXT7POvxYtjjLi3QYSPO81xkQ3YJBcENqVtpM9UGJwf
	 Y7nzhsgWCmJAg==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45c96b175baso1939673b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5pwti5vJ9fQnAiS+8rx/xr48odd63mCnwmiCNAhUyc86rfUWDAdqBhz6apcS9+qO4PwdUKWUtwrnVccTgdU1t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4j62WDhgkjNmf3sf3WU1sN8FO8051XG0NaE4ktuWEviE0BD00
	lqvYOZVaO3dZJ15xGvWBUoP8NHPxrtVeVRqzhjUXJ29uqhLl2fczSxOZdag9jHj3Jnx2EHuh/Xl
	jN837/UpSyMy+AvaC1YkkB0Y0DMbsjnU=
X-Received: by 2002:a05:6820:498c:b0:65f:564f:34b1 with SMTP id
 006d021491bc7-662f2021f39mr972139eaf.16.1769524455545; Tue, 27 Jan 2026
 06:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi> <87sec30yhk.ffs@tglx> <aW3pALPxn4i9fiDO@lpieralisi>
 <87pl751zeh.ffs@tglx> <aW9V4A7lTGZWTO9e@lpieralisi> <aXM0dVthp33yUqj8@lpieralisi>
 <CAJZ5v0hOVO7N77nnyWsh_vhGcm-TzavrGBgci=a+o_-LKhkuXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hOVO7N77nnyWsh_vhGcm-TzavrGBgci=a+o_-LKhkuXg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 15:34:04 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jotTEm87Ks70_EHUs68T_3fPvG04GAxoC3gueiS-askw@mail.gmail.com>
X-Gm-Features: AZwV_QgMPgceilNqa1ohd2X40nvwnD9QGS8uSFdUczKAi0SenvBlTvAaDiWKd9M
Message-ID: <CAJZ5v0jotTEm87Ks70_EHUs68T_3fPvG04GAxoC3gueiS-askw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org
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

On Mon, Jan 26, 2026 at 9:42=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> Hi Lorenzo,
>
> On Fri, Jan 23, 2026 at 9:42=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@ker=
nel.org> wrote:
> >
> > On Tue, Jan 20, 2026 at 11:16:00AM +0100, Lorenzo Pieralisi wrote:
> > > On Mon, Jan 19, 2026 at 02:54:14PM +0100, Thomas Gleixner wrote:
> > > > On Mon, Jan 19 2026 at 09:19, Lorenzo Pieralisi wrote:
> > > > > On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> > > > > I think the simplest way to sort this out is for this series to g=
o via
> > > > > the ACPI tree if that's OK for Thomas, given that the ACPICA code=
 will
> > > > > go via the ACPI tree anyway and there are other dependencies on i=
t there
> > > > > I assume (this series is fairly self-contained).
> > > >
> > > > I'm fine with that
> > > >
> > > > Acked-by: Thomas Gleixner <tglx@kernel.org>
> > >
> > > Thank you Thomas, Rafael I hope that works for you too, please let me=
 know
> > > if there is anything I can/should do.
> >
> > Hi Rafael,
> >
> > forgive me for another ping, can you please let me know whether you can=
 pull
> > this series on top of acpica changes for v7.0 or it needs to take a dif=
ferent
> > route ?
>
> Sure, I can queue it up.

Applied as 6.20/7.0 material now, thanks!

