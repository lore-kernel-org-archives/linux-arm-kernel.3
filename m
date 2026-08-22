Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62BBC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFfxLl20kSDo3Us12fAFz2HuaUjJctM7H+QOcQs3ss4=; b=c7bPHJZdnWBupi
	co/w3i+MdFBPHIYUG2f6vhUCG3NwVZ1yglf1eMsktbBiHDomroY4aeaPVUJ5e2NH1tvt9K3R+f4yb
	SkmUe92qYiiQvtK8yN/9NFurZ7tuQCwYhw5vUk4meWr5Lpe1KM9bsrj7jWVFCZScFFSwmLs2mzblR
	FFllrdpdaK1QUaXSQY9vkb+sRcN9m1sFC7PubQcruFkKrN4xHcthxe6IU/z6Nhi5LO1erkWwOOwCT
	Zcs0WiCqj1qSuYKBfM2ZfwbG4OVu9Egv8EQFeOam0RdmQjekuGoLWq1ITzcOqWGwovWN+5Yh9ftbO
	1W3eiuSoOrmYCunqo5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxllu-0000000EXZo-43GU;
	Sat, 22 Aug 2026 13:28:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxllu-0000000EXZW-0Yml
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9649C43A98
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 13:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A03E1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787405309;
	bh=wFfxLl20kSDo3Us12fAFz2HuaUjJctM7H+QOcQs3ss4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=K8nMztk3bpWTmT0IBzm6kFw39YyuyOVYWi1fk1j82jcKJCHvqS5WDHzmEjBTSuMi+
	 MF/D8tsCYMVcbRJ+7Syxm7ZDNOx7NXLqjNZYpHhhE9tvaXJiY65xmtsSxYNSSscyiS
	 EK2/L1KQhqbTcJ4Zzq+FjS0zeBJk5h5IQBegTCNWIkbgk6CWF3x5aVpMKU/ipOfcIg
	 ESrWinwFW1oqkXo9ni3i6I5Z/+PUxPZRH8pA0M0M94Icozwnzw1ZUjJvkdz2SB9oyA
	 q305ZlMGiFnqwmo4O2ZigMmJ56kYnRgQd9jZ8YxVpilwIvcTZVa7NRSFvA4R/nMhl7
	 /iV4iRySjEYSg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a151eda82dso14284471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6nMfzVE021ia9692afzrct80SOJk6J6LbsbpiNIn7twZNXZGm3C34p3Dixloge8JCaXse2NWSFguYYBH3OeKM@lists.infradead.org
X-Gm-Message-State: AFuF++m3NmnmLzQBANxsAzi68cLcR1+E2IlfVvj9WpoYsHWPs2b/T6nt
	0dxEeyRndhq1NLjrGPhqyXqvO9e2HDK0V/0/TIJsAlPM0CVLqY+UaCcl6FDlcw/rHBOC9nmGhgC
	qwhUZmkiohuXZ5ri49sIAz4i1jyys35k=
X-Received: by 2002:a05:651c:1541:b0:39f:ef09:bc55 with SMTP id
 38308e7fff4ca-3a1aeba25e5mr35860871fa.3.1787405307864; Sat, 22 Aug 2026
 06:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
 <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
In-Reply-To: <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 21:28:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
X-Gm-Features: AcwNN1UAxn6NvziUzL3EQNY-lCnkxah-BXg-F8YFs2LgpelevGiVNkhT-XsLGVc
Message-ID: <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
Subject: Re: Bug: PHYS_OFFSET no longer points to DRAM physical starting
 address with CONFIG_ARM64_VA_BITS_52
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml@vger.kernel.org, 
	Jernej Skrabec <jernej@kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Aug 22, 2026 at 8:50=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> Hello Chen-Yu,
>
> On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On the Allwinner H6 & H616 SoC (and likely others), if running a kernel
> > compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
> > PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but inst=
ead
> > points to 0xfff1000040000000.
> >
> >
> > I've observed this for quite some time but hadn't really nailed down wh=
at
> > was going on. For context: the IOMMU on these SoCs can only do 32-bit
> > addresses, and that's pretty fine since the SoC only supports up to 4 G=
B
> > DRAM. However the DRAM starts at 1GB offset in the physical address spa=
ce.
> > We want to be able to map the highest 1GB I/O virtual address space and
> > thus need to check if the physical address is within 4GB without the
> > offset. Having only 32-bits addressing, the address will wrap around fi=
ne.
> > So we check the address against PHYS_OFFSE, which breaks with the mangl=
ed
> > address.
> >
> >
> > I suspect this is the result of the following commits:
> >
> >     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA to
> > VA translation
> >     9684ec186f8f arm64: Enable LPA2 at boot if supported by the system
> >
> > The first commit introduces a negative (wrapped around) offset to
> > memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and th=
e
> > second commit makes the offset dependent on hardware.
> >
> >
> > I hope that Ard and the maintainers can look into it and make PHYS_OFFS=
ET
> > always point to the physical start of DRAM.
> >
>
> On what basis are you claiming that PHYS_OFFSET must always point to the
> start of physical, non-secure DRAM?

AFAIK we've been using this since armv7 in our older drivers to deal with
PA <-> IOVA offsets. This was then concentrated into one interconnect
driver: drivers/soc/sunxi/sunxi_mbus.c

The driver applies PHYS_OFFSET as the DMA address offset for a class of
devices when the system is using an older device tree that lacks interconne=
ct
properties.


There's also Documentation/admin-guide/kdump/vmcoreinfo.rst which states:

ARM64
=3D=3D=3D=3D=3D

PHYS_OFFSET
-----------

Indicates the physical address of the start of memory. Similar to
kimage_voffset, which is used to translate virtual to physical
addresses.

> On arm64, PHYS_OFFSET is the physical address of the start of memory,
> where 'start of memory' =3D=3D PAGE_OFFSET, i.e., the start of the linear
> map. When running a 52-bit VA kernel on hardware that is not LPA2 capable=
,
> the hardware does not support mapping memory at PAGE_OFFSET, so it is mov=
ed
> upward in the linear map.

So it held true until 52-bit VA support was introduced?

> I don't quite follow why you need to compare with PHYS_OFFSET in your IOM=
MU
> driver: could you elaborate?

Our IOMMU only supports 32-bit of address space. On our SoCs, DRAM physical=
ly
starts at 0x40000000 (1 GB offset), meaning any physical DRAM above 3GB
would wrap around. However putting this number in drivers was discouraged
in the past and we were told to use PHYS_OFFSET (on ARMv7) instead. Also,
in the past there was this one chip that put DRAM at a different offset,
so using a fixed number in the driver won't always work.

Right now we're just blocking any physical address above 32 bits. Ideally
we want to allow up to "start of DRAM + 4GB". So we need to know the DRAM
start address. (And we probably want to block anything below start of DRAM
as well.)


ChenYu

