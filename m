Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA0FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5cTxyzfA4ndNAmljGG+/u3GWayPcC8LwkyYeMDZxfo=; b=nbjGw156vOXtTK8Xc2pZainp1i
	IZ35r/E2KkAfXKwAPJgCI8iAVUbEM1CDJ+dX6kxtTeKZljqsDvK5YdcAORYmyYPutLMLyO1SaFsBK
	J4M73Xua03fWUThIVRG/6wHmbnNhPNyrJ1pLP/Sh5zie+zSztdJ/4ZZ5N40W3HLuO+xgBsODDmiS1
	baJvs7ovb4WnNkqyq+qldHF/QmtfkdRKW2kyCOwEwN768dGZq0mBKxGNai8sV4wI2wIZ4tavMblk8
	mcFWgFycLfE2U0Gp3Vmhp0EHSsgSnPWeJ0qIAUku6NfOpZx6lY2K4l70mBr5MLtIvpnCqGoEBm/Mi
	LbCusWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DJq-00000007EWH-0av5;
	Tue, 22 Apr 2025 13:05:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CE5-000000071fx-3PKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA2F35C5B4F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D248C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745322944;
	bh=NlxnJ6QRk+KEGJ5mZ2Iy2KNh2FSE+5CpEr+p6ovAt4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ooAnSbsGb4rZ8inSne9/zF+Osgsv+6NoZCHqJVOevRbY9dX8M3m1NVNr8BqkbSGxu
	 OVG8MILftJ3yywfzBzIGVqhJ4Wmeicabb9zxTiAW/wR/O14C1ymvHE2qtZ/wLuN1iw
	 0S9ydqDUBRPil54VC8ko5JEEiS4vZlnGDDf75g+jDoW4NwozoF6ws7B+SabDXbD89s
	 qniCgonrpIqOJFpgZIm3brEVRy/61e/FY0iR9k8+xfJlKkPOppbO4ldS4jZe2Q8u5f
	 naez/wbrPiPYzDA9BHxWrh1SdZqnocOFl/KqmDOxzQ9XSvLu7Q5yiCJUZ7SPhTgwcp
	 R1x2lojf7M9lA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb2faa9f55so597306566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4prwKPMfVznp4qAeCIWGeaZnPencEbUlzUILYoX2jxao3uq+6IzTc34Ts5ed8UNISuwy6lsovO01tjwBCOnmu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Dzv5httaDfKiPJ+ASKS1Z5cfpKjMH+2BLDYzta4cu2WBwlTv
	LF/WfmPSuDB+rbpnLkfsJLMfj0tVvJRhxlMzxBMKSCI/c/cfLuq7KuS6SijmK+WUBArN1yd/vCm
	1E1ReaFUoIjGkEN+AaUedW/WtDA==
X-Google-Smtp-Source: AGHT+IFn37a9Lg5i1NLvKHUiFOA39/tRQAT5so5RWqSl5qnZ1/wD62oMMBHhUmLumBZxGZih5sHb7VxtlPiC76dcmq0=
X-Received: by 2002:a17:907:d643:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ace35b7110emr80983166b.18.1745322943158; Tue, 22 Apr 2025
 04:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250414083243.59664-1-bsz@amazon.de> <CAL_JsqJdk_UtCEEVrakO8azjxWeLLDGTfWAVqtoPS99VQz3jWQ@mail.gmail.com>
 <61efdf178da04ab6ae0d3feb70852cfe@amazon.de>
In-Reply-To: <61efdf178da04ab6ae0d3feb70852cfe@amazon.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Apr 2025 06:55:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLpKvw73ry+Dmy=uzOopQ4BgbH3qn7gsuj4+RGAD3UY4A@mail.gmail.com>
X-Gm-Features: ATxdqUEX_x7RxEl9s0a2hkcgXDQqjmKuHr3HtqIWITgbJIlhkckjpH2Ojah3cCs
Message-ID: <CAL_JsqLpKvw73ry+Dmy=uzOopQ4BgbH3qn7gsuj4+RGAD3UY4A@mail.gmail.com>
Subject: Re: [PATCH] fdt: arch/arm64: Delete the rng-seed property after use
To: "Szczepanek, Bartosz" <bsz@amazon.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Graf (AWS), Alexander" <graf@amazon.de>, 
	=?UTF-8?B?U2Now7ZuaGVyciwgSmFuIEgu?= <jschoenh@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_045545_963751_69B6F4AA 
X-CRM114-Status: GOOD (  52.98  )
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

On Tue, Apr 15, 2025 at 3:52=E2=80=AFAM Szczepanek, Bartosz <bsz@amazon.de>=
 wrote:
>
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, April 14, 2025 4:22 PM
> > To: Szczepanek, Bartosz
> >
> > On Mon, Apr 14, 2025 at 3:33=E2=80=AFAM Bartosz Szczepanek <bsz@amazon.=
de> wrote:
> > >
> > > As a part of platform boot, device tree is being read to extract
> > > randonmess bits. The 'rng-seed' property is used for that purpose.
> > > After reading the value, the field was overridden with NOP instead of
> > > being deleted or zeroed. The problem is that NOPed fields are later n=
ot
> > > reused, and kexec code appended this property every time DTB is prepa=
red:
> > >
> > >   /* add rng-seed */
> > >   if (rng_is_initialized()) {
> > >           void *rng_seed;
> > >           ret =3D fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED=
,
> > >                           RNG_SEED_SIZE, &rng_seed);
> > >           if (ret)
> > >                   goto out;
> > >           get_random_bytes(rng_seed, RNG_SEED_SIZE);
> > >   }
> > > (source: arch/arm64/kernel/machine_kexec_file.c)
> > >
> > > Taken together, DTB grew at each kexec by 140 bytes ie. size of the
> > > newly added (and not overwritten) rng-seed property. ARM64 sets a har=
d
> > > limit on FDT size at 2MB, which means that after at most 14,979 kexec=
s
> > > DTB exceeded the limit causing catastrophic (but silent) failure in
> > > setup_machine_fdt().
> >
> > Just like 2MB should be enough for anyone, 14979 kexecs should be enoug=
h. ;)
>
> I'm actually glad it wasn't more than that, I'm afraid if it were 149790 =
I would
> be still scratching my head about the occasional crashes out of nowhere (=
:
>
> >
> >
> > > This commits addresses the issue as follows:
> > >  1. Call to fdt_nop_property is replaced with overwriting the rng-see=
d
> > >     value with zeros.
> > >  2. Zeroed rng-seed gets special treatment and is not accepted as val=
id
> > >     seed. Warning is emitted on zeroed value.
> >
> > How do you get a zeroed seed if you delete the property when zeroed?
> > Sure, any random bootloader could do that, but that has nothing to do
> > with kexec. And does it really hurt to add 0s to the random pool? A
> > warning is fine. In any case, none of this is specific to DT seeds. It
> > all belongs in the core if it is a problem.
>
> You're right that zeroed property should never get to early_init_dt_scan_=
chosen.
> If the outgoing kernel can't give us randomness, it removes the previousl=
y
> zeroed "rng-seed". So it's an extra check and we could perhaps do without=
 it.
>
> As for whether it hurts to add zeros to random pool, I actually wanted to=
 avoid
> any doubts about security by handling that case explicitly. We can make i=
t a
> mere warning if you like but I thought that illusion of randomness is wor=
se
> than lack of randomness from a security standpoint. If we bail out on zer=
os,
> we are sure that under no circumstances we get misguided by "rng-seed" th=
at is
> there but doesn't bring us actual entropy.

My point is your reasoning is true for all other callers of
add_bootloader_randomness(), so shouldn't all of them be handled the
same way? What guarantee do we have that UEFI implementation doesn't
give us all zeros too? We know it can happen since we're also
implementing the bootloader in this case, but that's not much better
than not knowing. And there is the 'trust_bootloader' flag too. Do we
want to warn about the bootloader seed if trust_bootloader=3D=3Dfalse?
There's also the minor issue that in 1-in-a-gazillion times, the
random value is all 0s. Does that matter? IDK. Really, you should ask
the folks that implemented this feature in the first place.


> > >  3. Kexec_file code is modified to delete the zeroed property if it
> > >     can't fill it with valid seed.
> > >  4. Proper error handling is added for the case when DTB exceeds 2MB.
> > >
> > > The change was tested in QEMU arm64 environment. To do so, kernel
> > > containing the change was built and included in buildroot initramfs.
> > > Subsequently, kernel was started in QEMU. Using kexec_file, new kerne=
l
> > > was loaded and kexec reboot was issued. DTB size was noted in this st=
ep.
> > > After new kernel has booted, another kexec_file was issued. DTB size
> > > was confirmed not to change.
> > >
> > > Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
> > > ---
> > >  arch/arm64/kernel/machine_kexec_file.c |  5 +++++
> > >  drivers/of/fdt.c                       | 18 +++++++++++++++---
> > >  drivers/of/kexec.c                     | 12 +++++++++++-
> > >  3 files changed, 31 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kern=
el/machine_kexec_file.c
> > > index af1ca875c52c..af0e39f6c96d 100644
> > > --- a/arch/arm64/kernel/machine_kexec_file.c
> > > +++ b/arch/arm64/kernel/machine_kexec_file.c
> > > @@ -170,6 +170,11 @@ int load_other_segments(struct kimage *image,
> > >         /* trim it */
> > >         fdt_pack(dtb);
> > >         dtb_len =3D fdt_totalsize(dtb);
> > > +       if (dtb_len > MAX_FDT_SIZE) {
> > > +               pr_err("DTB exceeds the maximum size: 0x%lx > 0x%x", =
dtb_len, MAX_FDT_SIZE);
> >
> > You can't check restrictions of the kexec'ed kernel in the current
> > kernel. That restriction could be removed at any point and might not
> > be a problem for the kexec'ed kernel.
>
> Fair point.
>
> What would you say then for making it a warning? That could be a middle g=
round
> that would 1) allow us to kexec into more capable kernel without restrict=
ion,
> but also 2) help avoid lengthy investigations about early_init_dt_scan_ch=
osen
> failures. Keep in mind that the function is so early that early consoles =
are
> not plugged in, so from reader perspective it's "Bye!" from the outgoing =
kernel
> followed by eternal silence.

Well, I checked DTBs in the tree and the biggest is 178K, so we are a
lot further off from this being a problem than I thought. So I guess a
warning would be fine.

Rob

