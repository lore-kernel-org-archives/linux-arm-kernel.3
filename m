Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E7CCF2E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=; b=JONT/+bN9FD3DgmCMm809iwd/a
	pmXLP9sTaArqYsOtKOessoRk0JUrSk1kgpRrbXuLjTaYlrshhIxLx8xWa4MihxVioaqF+yInoJ5jq
	sH4exnkloOFRUfAGzHEaAU6JHtm3H0tnHmDbCkb3ii+O0ZrKuyNEX3isYlT1EAfvle1yyDNsjFmKY
	BAziGmOMjZJhfeTfnaaxgyPviHOgBk/xTUz/sLZSJx6uZFSP5YLCJSh4YQwc/8QaVdxyaKVe+//Mz
	3s1zc8TECbt19bxprCFwZRytw2jHYrabRWLVlPHgmlag+73tiwLbpoBRgENsewlCm+iG7bUCBNOJF
	OaOkY0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnGn-00000001s8g-2M3V;
	Mon, 19 Jan 2026 11:18:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnGm-00000001s8C-1EgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5090960159
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B99C19423
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821483;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QAecoarNHChls3V/koML1MoTCmcSstaYu6upGx1rM+y2j9tIJYU4WTCmdLhQZYH4h
	 a4/BwXPwDJJAVFiOUjFL94sLogU6+CewqpY1d2U7WGQtBh5UxNkp3sSwB8mZLTUy/h
	 aIXwVLQ/TsMOaytrWRvocvl4GxT7Q3f51HgfKLpxD7gMkaRqIdlsjTnOJQhlZZnycE
	 swC9Stg16nZ8vSF/dX47WLNuytsZiPXn4T7iNJ/6r6z+t9yogQ7iJSWp6hF7KzuUfk
	 P3RyHi+AUOyAGxk+e9lBkvwbkmYunPIGftM/YgflqYAooqm8QfGwSgrT4Xibf3DWdv
	 +PSVXMc4/1OuQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso6487178e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZDTvXWUTxk3UglmSA5oNMJt1g0ydNHuviymgF9Ja6KfnSSflPvsZGuMVvmvpYEpnJ6YcBv7XhhlCOQ+nJ4KdY@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3VJAz7G//+XZnXuiVqlZLhBYeDHE6WsKnpy4KtFrgjMdd8s9
	qaah4evY0pWcR/J7B/1QWz25Tk/U9hYaTr58f93yp4HFNtjrYhrTcdPuMJE7TZtCXXywd2Po4y7
	pM4Dne3doCwf+Qwt3fz5m+a63IZlwPmyCc2Y+PNgQqQ==
X-Received: by 2002:a05:6512:234a:b0:59b:73b9:1f49 with SMTP id
 2adb3069b0e04-59ba71a21a4mr5663497e87.26.1768821481438; Mon, 19 Jan 2026
 03:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com> <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
 <aW4PajoKqmyjkciY@hovoldconsulting.com>
In-Reply-To: <aW4PajoKqmyjkciY@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 12:17:49 +0100
X-Gmail-Original-Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
X-Gm-Features: AZwV_QhTOAeF1zNPvjVLJF6GJlUC44HwEM3vIZ8FNKt6qikN3ueMCqdY3a7S--s
Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
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

On Mon, Jan 19, 2026 at 12:03=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > > It's been another year of discussing the object life-time problems =
at
> > > > conferences. I2C is one of the offenders and its problems are more
> > > > complex than those of some other subsystems. It seems the revocable=
[1]
> > > > API may make its way into the kernel this year but even with it in
> > > > place, I2C won't be able to use it as there's currently nothing to
> > > > *revoke*. The struct device is embedded within the i2c_adapter stru=
ct
> > > > whose lifetime is tied to the provider device being bound to its dr=
iver.
> > > >
> > > > Fixing this won't be fast and easy but nothing's going to happen if=
 we
> > > > don't start chipping away at it. The ultimate goal in order to be a=
ble
> > > > to use an SRCU-based solution (revocable or otherwise) is to conver=
t the
> > > > embedded struct device in struct i2c_adapter into an __rcu pointer =
that
> > > > can be *revoked*. To that end we need to hide all dereferences of
> > > > adap->dev in drivers.
> > >
> > > No, this is not the way to do it. You start with designing and showin=
g
> > > what the end result will look like *before* you start rewriting world
> > > like you are doing here.
> >
> > The paragraph you're commenting under explains exactly what I propose
> > to do: move struct device out of struct i2c_adapter and protect the
> > pointer storing its address with SRCU. This is a well-known design
> > that's being generalized to a common "revocable" API which will
> > possibly be available upstream by the time we're ready to use it.
>
> Revocable, as presented in plumbers, is not going upstream.
>

Oh really? :)

https://lore.kernel.org/all/2026011607-canister-catalyst-9fdd@gregkh/

> > You know I can't possibly *show* the end result in a single series
> > because - as the paragraph before explains - we need to first hide all
> > direct dereferences of struct device in struct i2c_adapter behind
> > dedicated interfaces so that we when do the conversion, it'll affect
> > only a limited number of places. It can't realistically be done at
> > once.
>
> You can post an RFC converting one driver with a proper description of
> the problem you're trying to solve.
>

It's not a one-driver problem. It's a subsystem-wide problem requiring
a subsystem-wide solution. Wolfram explained it really well in his
summary, I'm not going to repeat it here.

I also don't agree that i2c-specific helpers make code harder to read.
Is device_set_node() harder to read than

dev->fwnode =3D fwnode;
dev->of_node =3D to_of_node(fwnode);

?

Even if you answer yes - it at least helps hide the implementation
details of the OF layer where fwnode-level is preferred. We do it all
the time in the kernel. This kind of helpers allows easier transitions
when some implementation detail needs to change - as is the case here.

Bartosz

