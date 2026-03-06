Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD8EFCC04D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5CiRKQ0iFjb+yZmoCiuGH5ayfkkNl11+lDvC+/dz2M=; b=eFwyx08QKbzg53l8tssXZ2qRbY
	QPtzr5YZnaZbCIJuKLxmC7pkYw0c99Ha8retPhn80mPhFWo2QyfaDLrsKxNgE9ffyAtEe6hNnCqlJ
	bzKxETdihMPY2oAksZn3n1yUG/MLSa6+99eFX63IWFOQZb+hjhCVXZI2xd6w9Pn1wx8xxqVWqx2Ee
	ruFX6AacAASUMsrYkmM7KhPKWMdCrYqewhIZkiyIYS63hMS3ohssh7kapAf7A3+Gi7hdqnUTiUUIf
	uJ7Hn9jxUFXfEUPJnQGcV5IFblwyXVKFxbIMwo5ipTiY6FcIHNyhqRHgokaSGhFE8N49vt6kUY0i9
	r4NSEmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZ4m-00000004Hb1-2IUz;
	Fri, 06 Mar 2026 17:35:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZ4j-00000004HaE-47j6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69A3A44403
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 17:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F4AC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772818497;
	bh=SR+mdgLhlOhUS2wbF1s2i9ovITikFxXdvE5yE1P9YdI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsUF/XTycn0CKydUrnqYikvqNO9ZMczOJtjO7TCzrOjWyt7xzMh8RLVcJR9Kcb+5q
	 p1bmm3B7gLT9FCdqdxb2Mh4JrPsGdbFgezfpW2UGKyugg6Nmr2CsN753l7cMgg+0G8
	 H97kSflQSfMoro7L5rGmLF+7FdVRGSAANOX0sfJI0pd/isMPuBj6paL/J0Tc1PmQiW
	 x+SUG5lzK1HO6XXo9imEvaZGYe5GqG5j85GzWaIbRqlE/hAJybSxzOI+gdUO33z6WM
	 I11kDz4Q6EEuhM7PS6k8a4ub5XAvMDUtyeRl66FGf1nxsF1KbxA7IjCRs4GuM0pJw3
	 KpEjmfBqp9QNQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-386fb2c31e2so153796421fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 09:34:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULljXth2qapzEAGNyvDYm7UZ1eqhzKSh9exIOe0UraIgencgIttnwGcxTLn81o7Rt/djOEu071fGtU+0dA/aa2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8cUqESetFjQnhI7UgAhhmP/2w5FTuwsUHrnyW2JNYsemf62N8
	MggtywGBlGVkknjCsH8mJnUDRtYzHhqKy31676ZAANDn/nHHqsVjK85SdjnxNeVUpESo4XQxoU9
	Oe34n08zNxTxVIAL7M/6sdOHBPNbX7RY/DUHSIITynQ==
X-Received: by 2002:a05:651c:893:b0:38a:519:f788 with SMTP id
 38308e7fff4ca-38a40b388d2mr12029891fa.2.1772818495778; Fri, 06 Mar 2026
 09:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com> <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com> <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
In-Reply-To: <aar1PDUB2t7DgEP6@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 18:34:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
X-Gm-Features: AaiRm50UrSeiyZ4TiR6fS-QYqCuucHSEPqczNWdyNSw2yOiisqheMyZnUWDBliw
Message-ID: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_093458_059231_F963BAD1 
X-CRM114-Status: GOOD (  42.88  )
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

On Fri, Mar 6, 2026 at 4:39=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Wed, Mar 04, 2026 at 01:55:14AM -0800, Bartosz Golaszewski wrote:
> > On Tue, Mar 3, 2026 at 4:57=E2=80=AFPM Johan Hovold <johan@kernel.org> =
wrote:
> > >
> > > On Mon, Mar 02, 2026 at 12:03:19PM -0600, Bartosz Golaszewski wrote:
> > > > On Fri, Feb 27, 2026 at 5:41=E2=80=AFPM Johan Hovold <johan@kernel.=
org> wrote:
> > > > >
> > > > > On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@ke=
rnel.org> wrote:
> > > > >
> > > > > > > It seems all that is needed is to decouple the struct i2c_ada=
pter from
> > > > > > > the driver data and have core manage the lifetime of the form=
er using
> > > > > > > the reference count of the embedded struct device.
> > > > >
> > > > > > This is a weird pattern you sometimes see where a driver alloca=
tes
> > > > > > something and passes the ownership to the subsystem.
> > > > >
> > > > > It's not weird at all, this is the standard way to handle this. W=
e have
> > > > > these things called reference counts for a reason.
> > > >
> > > > I wouldn't say it's *the* standard way. There are at least several =
different
> > > > ways driver subsystems handle resource ownership. And even so: the =
fact that
> > > > something's done a lot does not make it automatically correct.
> > >
> > > It's the way the driver model works.
> >
> > No, it does not impose any specific pattern to use for subsystems other=
 than
> > requiring each device that's been *initialized* to provide a .release()=
 callback
> > called when the last reference is dropped.
>
> Reference counting is a core part of the driver model and this is
> reflected in the way subsystems manage lifetime.
>

Seems like we've reached an agreement and can stop arguing but you
make it sound here like I'm somehow against reference counting. I've
never said anything like that and here, I just explained how reference
counting works and what it imposes on users.

> > > > I'm advocating for a hard split between the subsystem data (referen=
ce-counted)
> > > > and driver data (living from probe() until remove()). A logical str=
uct device
> > > > managed entirely by the subsystem should live in a separate structu=
re than
> > > > driver data and be allocated - and freed - by the subsystem module.
> > >
> > > It doesn't really matter what you think. You can't just go around
> > > making up new subsystem specific rules at your whim. The linux driver
> > > model uses reference counting and that's what developers expect to be
> > > used.
> > >
> >
> > And I've never said that it should not use reference counting. I'm not =
sure
> > what you're implying here.
>
> You have posted changes that will prevent driver from accessing the
> struct device of core i2c structures. This is unexpected, non-idiomatic
> and subsystem specific and therefore a bad idea.
>

That's not true, the changes provide a helper to that end.

> > > > Let's put aside kernel code for a minute and work with an abstract =
C example,
> > > > where the equivalent of what you're proposing would look like this:
> > > >
> > > > struct bar {
> > > >      struct foo foo;
> > > >      ...
> > > > };
> > > >
> > > > struct bar *bar =3D malloc(sizeof(*bar));
> > > >
> > > > ret =3D foo_register(&bar->foo);
> > > >
> > > > And the corresponding free() lives who knows where because foo_regi=
ster()
> > > > automagically introduces reference counting (nevermind the need to =
calculate
> > > > where bar is in relations to foo).
> > >
> > > No, that's not what I'm suggesting here, but it would be compatible w=
ith
> > > the driver model (ever heard of struct device which works exactly lik=
e
> > > this?).
> >
> > I know how struct device works. I'm pointing out that this is a bad API=
 (just
> > to be absolutely clear: not the reference counting of struct device its=
elf but
> > using it in a way tha looks like it's not refcounted but becomes so aft=
er an
> > API call) because it's confusing. I'm not buying the argument that if i=
t
> > confuses you then you should not be doing kernel development because it=
's not
> > the goal of API design to make it as complex and confusing as possible =
- quite
> > the contrary. And it *is* confusing given the amount of misuse present.=
 I've
> > heard Greg KH say on multiple occasions during his talks that we try to=
 offload
> > complex code to subsystems so that drivers can remain fairly simple. I =
agree
> > with that.
>
> Again, this is a core feature of the driver model. You can't just ignore
> it and come up with random ways to work around just because you disagree
> with design decisions that were made 25 years ago.
>

It absolutely *can* be done differently. There's nothing that imposes
a certain API design on susbsystems. If you design the subsystem code
well, provider drivers don't need more than one reference (taken in
probe(), released in remove(), for instance via the
register()/unregister() pair) so the counting can be hidden within the
subsystems that control them.

Bartosz

