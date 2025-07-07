Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951AEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjcFyRrahTR3lql/P+Aw5X6u9lYKjBOawoYq6NWUrgo=; b=vvHL/UbuFt3DKN5bhCnHqInSXF
	qZz9XVhynQAe9SECMT7h/FoRgWWr0rTeSQAeDlsnaoF1zbPVoxwZxXE4IBE0chWq29jCKAu7Ke7ZF
	TP5Hxur3ej4QWDg6YdkTT1DLCvIvz4QXZtql4QgY28669JBglwVyJyXcdAZuL5OxOPOLobl/OHmBp
	GoQGQVdZ/CzR8fvFp6ZLie1d+YpBqmXnWhekSzEeuB1qd+Ast96hqzCJIBx89nB7ZuxW70HTkhKeR
	bEx9BCtjKVAsfpU3DlFKiYV6RAnXjlgoWzXkPuR/EphHFoxbZKaPHucNs77MB0ydvWLRWMDJp4+/P
	VmwrdYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqne-00000003L52-2N6t;
	Mon, 07 Jul 2025 18:42:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpqz-00000003CLN-04A1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BE615C5B70
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 17:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2261C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751910127;
	bh=JjcFyRrahTR3lql/P+Aw5X6u9lYKjBOawoYq6NWUrgo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KLmxcgljqZJJuWHIQdNWYp32nG1VdWTucoUweH91V/3vZ8ibazhQjvbh3hPwzM9HS
	 wgWdaOd1x0PPUpbxdOgvqeNz9ZF3wuJ0WU4Kh5OU+e5uzNO5LtIRURfLqInHpO5JAy
	 uV1hcUcTRY+L4N2WcoEOQ3Jz+zBfIsLSY1ZuSjKBEgGsyVnzzYq48/Ev7E3ghqdfcr
	 P8Eai1maaSwnei4/fKdyeGDm3Zg+sbII7WHHogV/G5bRmrkTsEBrYy+mV9GF0hpfpN
	 /Iksiv3rdwxF8US0urxy7dlIGDx4nRTGp+Ar4btEphEtEnSOL5sJlVranTWVXRrYPa
	 z2lUayafJ4r5Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso686884066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 10:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlMTPe1VJOBT/V3qzZ3u3hNnkRIs/prbJR3gLCesUC9GeBAVPN4Yra0sB8KhOZy3SdOjhc+xMrl5xgjNdjuBJF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9lzc6LI4Y1CgacCvaAzQLtvU2lPCDhdcWx9rgEeH08w6cmYzX
	VSX98WZUuxM3DLd1fKaE7rLbSGqS4S/b7A84bPrG6sCNYGmBHuz6/kqyCHA9njQvHzwF3Pwh9bq
	TpeA/JCqZqP+JpOZ4wUQGN2wCXsxCtQ==
X-Google-Smtp-Source: AGHT+IHTcM0JnByHeq4MedyhnFwe4AFxPnH7yKd9fTihgH8Pzvw2kSQALvXe0x4/H1xWzMllpvEn2C30/rLvA9N9Py4=
X-Received: by 2002:a17:907:d7cc:b0:ad5:4806:4f07 with SMTP id
 a640c23a62f3a-ae6b0049633mr12678366b.2.1751910126238; Mon, 07 Jul 2025
 10:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-3-james.morse@arm.com>
 <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
 <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com> <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
 <642f2fa8-cd61-47ed-9d63-a15de263d36d@arm.com>
In-Reply-To: <642f2fa8-cd61-47ed-9d63-a15de263d36d@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Jul 2025 12:41:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXPCZ+2SpFHemGw_AbOVRncN=jxp9ewCDm=XeJeTWegw@mail.gmail.com>
X-Gm-Features: Ac12FXzxO3KqSyYuZVqJZt4aWPXxn7EfT1o9rzq3q7UL-u1Cceph7Eobu-DlXQw
Message-ID: <CAL_JsqJXPCZ+2SpFHemGw_AbOVRncN=jxp9ewCDm=XeJeTWegw@mail.gmail.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_104209_134859_ED26C001 
X-CRM114-Status: GOOD (  47.83  )
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

On Fri, Jul 4, 2025 at 12:39=E2=80=AFPM James Morse <james.morse@arm.com> w=
rote:
>
> Hi Rob,
>
> On 30/06/2025 20:43, Rob Herring wrote:
> > On Fri, Jun 27, 2025 at 11:38=E2=80=AFAM James Morse <james.morse@arm.c=
om> wrote:
> >> On 23/06/2025 15:48, Rob Herring wrote:
> >>> On Fri, Jun 13, 2025 at 8:04=E2=80=AFAM James Morse <james.morse@arm.=
com> wrote:
> >>>> Filesystems like resctrl use the cache-id exposed via sysfs to ident=
ify
> >>>> groups of CPUs. The value is also used for PCIe cache steering tags.=
 On
> >>>> DT platforms cache-id is not something that is described in the
> >>>> device-tree, but instead generated from the smallest CPU h/w id of t=
he
> >>>> CPUs associated with that cache.
> >>>>
> >>>> CPU h/w ids may be larger than 32 bits.
> >>>>
> >>>> Add a hook to allow architectures to compress the value from the dev=
icetree
> >>>> into 32 bits. Returning the same value is always safe as cache_of_se=
t_id()
> >>>> will stop if a value larger than 32 bits is seen.
> >>>>
> >>>> For example, on arm64 the value is the MPIDR affinity register, whic=
h only
> >>>> has 32 bits of affinity data, but spread across the 64 bit field. An
> >>>> arch-specific bit swizzle gives a 32 bit value.
> >>
> >>> What's missing here is why do we need the cache id to be only 32-bits=
?
> >>> I suppose it is because the sysfs 'id' file has been implicitly that?
> >>
> >> Yup, and its too late to change.
> >>
> >>
> >>> Why can't we just allow 64-bit values there? Obviously, you can't hav=
e
> >>> a 64-bit value on x86 because that might break existing userspace.
> >>
> >> It's the same user-space. Users of resctrl should be portable between =
architectures.
> >> Resctrl isn't the only user, of the cache-id field.
> >>
> >>
> >>> But for Arm, there is no existing userspace to break.
> >>
> >> libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virre=
sctrl.c#L1588
> >
> > Looks to me like AMD wasn't even supported til v10.8.0 (2024-10-01)[1].
>
> 'when mounted with [a particular option]'
>
> AMDs bandwidth controls count in 1/8ths of 1GB/s - and you have to know y=
ou're running on
> an AMD machine. I'm aiming for the arm64 support to be portable between I=
ntel and RISC-V.
>
>
> >> DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vitha=
nage@arm.com/
> >
> > Is that even applied yet?
>
> No idea, but its equally likely that I haven't found all the places this =
gets parsed by
> user-space. I don't think we have a way of telling people using stable-ke=
rnels that we
> might change the size of that field. It's pretty clear people don't antic=
ipate it changing!
>
> This is just the downside of exposing anything to user-space!
>
> [...]
>
> >>> It is obviously nice
> >>> if we can avoid modifying userspace, but I don't think that's a
> >>> requirement and I'd be surprised if there's not other things that nee=
d
> >>> to be adapted for MPAM support.
> >>
> >> The whole multi-year effort has been to make existing user-space work =
without any ABI
> >> changes. The effect is some platforms have features that can't be used=
 because resctrl
> >> expects things to be Xeon shaped.
> >> But if your platform looks a bit like a Xeon (cache portion controls o=
n the L3, memory
> >> bandwidth controls somewhere that is believably the L3), then resctrl =
works as it does on
> >> Intel. The only thing that has come a little unstuck is the 'num_rmid'=
 property where MPAM
> >> doesn't have an equivalent, so '1' is exposed as a safe value.
> >
> > Fair enough, but I'd be rather surprised if there doesn't end up being
> > changes to support Arm platforms.
> >
> >>> Also, what if an architecture can't swizzle their value into 32-bits?
> >>> They would be stuck with requiring userspace to deal with 64-bit
> >>> values.
> >>
> >> Remap them in a more complicated way. Chances are there aren't 2^32 CP=
Us.
>
> > What about using the logical CPU number instead? That's stable for a
> > given machine and firmware.
>
> Hmmm, if you offline CPU-0 then kexec, then CPU-1 becomes the new CPU-0 a=
nd the numbers
> get doled out differently.

Ah, I thought they were more stable than that, but indeed there's a
special case for the boot CPU.


> > And then instead of having 3 sets of
> > numbers (MPIDR, compressed MPIDR, and logical CPU), we'd still only
> > have 2. And logical CPU is what sysfs already exposes to userspace.
>
> I don't think the linux allocated CPU number is robust enough.
>
> We could use the CPU number as seen when walking through the DT to make i=
t stable, but
> that would still be a third type of number. It would save the arch hook t=
o swizzle the
> bits, but changing the DT would change the numbers which doesn't happen w=
ith this scheme.
>
> Let me know if that is what you prefer.
> (I'll summarise this on the cover-letter/patch-1 of the incoming series)

Let's leave it with what you have...

Rob

