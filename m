Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC6C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54ct1BtcUapGHVq4wWvZ4zz+MIrUcIPkwqhDJ5i7gwo=; b=IEEV5Jjz/C9IQ4+V5MoHsHkcmR
	B+E2XPzaIK6puK8hN4vKXPqJxbNlXnny1l+Hcx88wm6irqR93K9Lh2gcH3NtFVWIJK1qvjgzUferA
	pOF91TWRmFmnwGVUQS+l2UpRCR2h5AAVurlE+Way6EwRB6GHjCwj8CH1jJL0Tqruyysm9Zcpp8bVc
	dnLZxAdU3dI2hfL1WlbsmuP52Q9wpBZPyAfvGnbGzR3hl5Ag5ISYluJ9sdXsXAA2uAg0S6CvFtXUi
	7oD34pmHZzlgF44pd0CEtpZ4NBiTOU3tBigRlCb3CEhtjNOHIwLHth+8x99YarMy3hcX7+b6yzHBs
	dyH0W0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDmM-0000000FXO3-40L8;
	Wed, 14 May 2025 15:12:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDRr-0000000FTgA-199x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E9495C5F6D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 14:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D4DC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234266;
	bh=54ct1BtcUapGHVq4wWvZ4zz+MIrUcIPkwqhDJ5i7gwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ue5b80FW1wgF10U3Zifd1J6tz1VUWPPruy+wYjhUfUFL7wgmvz9Ve7usUqmllE13D
	 XqnpNS7aG/OZDNydIG+NM8uXNlx9EPKVuY8sCe0ZuW8GJQH8mIGTOtDUvOnHijxZtg
	 UMvgYXv02ahv6dztYnj3H3Vz1BQoatO+E+WQeCDmEY8FIA7aur1JPUrxHC+k0kTy5q
	 fiXipjK2NmvHaIQaLAeqFwvOsoaxFJUi4Edi5g8MwzX5pXHf9iIooBDY3lyc+UVn22
	 o25u6hS9Q01oX89k0s96W/DewWp2sqZ80CexAig5+E8uK9RxhTkYXD/Ga/kcBJgDBV
	 zLADSA7z85c1w==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad212f4030aso1025404266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 07:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURsTY7/46C/ISPGDu8mtnYbIx1YyJ8bc1IBq2bWPmbCpZkKihtQKVAnPtuxRlxfh8XPzB+NmRII4qV90Qu1NQX@lists.infradead.org
X-Gm-Message-State: AOJu0YyBttue+pXuBOXMTOnWMOVE08rh1Y/y4zrElcqcwm82GA5AGdkG
	X1qeracU2gUw5ioPjKzNzY6JUqrRg7oUiL2//HzJqP2m9MhGFKIPFaur0lywcdxfm6b29lJWMZV
	eMOIq5kxQwrFJZQScnPhkEkNi+w==
X-Google-Smtp-Source: AGHT+IHHwEKl6KCMBqy7rgmxXmuTIh8nZgXRMqUStX7VUuXrxOdp1iOj4RjhCEheh3CMMCyM4wWF2NCrG5d6xK07Gug=
X-Received: by 2002:a17:907:a2cb:b0:ad2:39f2:3ab3 with SMTP id
 a640c23a62f3a-ad4f728f90fmr409018766b.48.1747234264928; Wed, 14 May 2025
 07:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla> <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3> <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
In-Reply-To: <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 May 2025 09:50:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+TUife95L3hgafAujsHF9O81+YYV1gwq17AR_e63x0vg@mail.gmail.com>
X-Gm-Features: AX0GCFv0K4Z03fSgxYvGWe0EVE0kgIwLZ5h7urcrmE_VdP42VE4V5alJb709t7I
Message-ID: <CAL_Jsq+TUife95L3hgafAujsHF9O81+YYV1gwq17AR_e63x0vg@mail.gmail.com>
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_075107_395661_964416DB 
X-CRM114-Status: GOOD (  33.19  )
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

On Mon, May 12, 2025 at 11:27=E2=80=AFAM Sean Anderson <sean.anderson@linux=
.dev> wrote:
>
> On 5/12/25 11:36, Mark Rutland wrote:
> > On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> >> On 5/10/25 03:04, Sudeep Holla wrote:
> >> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> >> Cache geometry is exposed through the Cache Size ID register. There=
 is
> >> >> one register for each cache, and they are selected through the Cach=
e
> >> >> Size Selection register. If FEAT_CCIDX is implemented, the layout o=
f
> >> >> CCSIDR changes to allow a larger number of sets and ways.
> >> >>
> >> >
> >> > Please refer
> >> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache in=
formation probing")
> >> >
> >>
> >> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for =
use
> >> | in conjunction with set/way cache maintenance and are not guaranteed=
 to
> >> | represent the actual microarchitectural features of a design.
> >> |
> >> | The architecture explicitly states:
> >> |
> >> | | You cannot make any inference about the actual sizes of caches bas=
ed
> >> | | on these parameters.
> >>
> >> However, on many cores (A53, A72, and surely others that I haven't
> >> checked) these *do* expose the actual microarchitectural features of t=
he
> >> design. Maybe a whitelist would be suitable.
> >
> > Then we have to maintain a whitelist forever,
>
> There's no maintenance involved. The silicon is already fabbed, so it's
> not like it's going to change any time soon.
>
> > and running an old/distro
> > kernel on new HW won't give you useful values unless you provide
> > equivalent values in DT, in which case the kernel doesn't need to read
> > the registers anyway.
>
> Conversely (and far more likely IMO), running an old/distro devicetree
> on a new kernel won't give you usefult values. Bootloaders tend not be
> be updated very often (if ever), whereas kernels can (ideally) be
> updated without changing userspace.
>
> > The architecture explcitly tells us not to use the values in this way,
> > and it's possible to place the values into DT when you know they're
> > meaningful.
>
> Well, maybe we can just use these registers for the hundreds of existing
> devicetrees that lack values.

If the lack of values is a problem, add a schema to require them. Just
adding them as required globally isn't going to work, but nothing
prevents someone from having additional schemas for platforms they
care about or we could figure out a way to opt-in to specific schemas.

Rob

