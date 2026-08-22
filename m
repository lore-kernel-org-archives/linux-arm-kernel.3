Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470F3C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNiQIaeGv6fReKS3E9ERO5rwoY38CfVv6u8jPT0yorY=; b=vYVPYbtiJ5HDHB
	y6aG3EvIjiyiGFeCG6bHR/QKrCeAPjchUffi2OSCOvTBEHKblcSB8na1OpFCxQfgk8Zo/oA2Q11mN
	4VTtWNTrgsVmuCyDcwDCHXx6t4VJAi4FmzAkapGCxOlq3hcD28Y9RzjIllT0OooPgpFtIBV82P0bI
	hWgvkIoAjB4Ik5ZIKloTj8cZGYD2vE7C5uIkzpbEMuvmUXmx8synTF2j4dFI2kEirCxTm/jatAuk9
	7iIoFMvX4ahEd4zOYezRcvIju7Y2u3zOmhBUx0vsG7cB/Cv2FK/kPZO89q4UeQ1z/cB5JHftkE6SV
	b5SJ8J/Kp7KU6kLZqBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxm4G-0000000EYHS-3sjk;
	Sat, 22 Aug 2026 13:47:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxm4F-0000000EYH9-0DN5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DC5243FA6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 13:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E22E1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787406446;
	bh=rNiQIaeGv6fReKS3E9ERO5rwoY38CfVv6u8jPT0yorY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=EAF9SGgHh0o7b487yXWY0fnEE04QhjEINRhOUokxAGEjoCtrbopZvCkSMz1tLxDJB
	 Gavm/Eie5QkLNWyDU1xqwgs3qZJvI9aqTNk+f1Abv+fVsQP+sIf6WosDYd3kC9G3RH
	 rMNVymsr56znMOnjfLXSzAXog42hjbCCpWbnsfSvJE0D3mhnDTs0B9oSQfV5oK0VlM
	 kkZkZseAaEoOu4fsqdTM9kFP7FyFLdK77bGjvzKc0bz+pH5wb4SKB6jYo3gdiEg3lH
	 t1+f6TOy96PFnh1dTAWonX+IbuLQ0MJq+fgCARYEEo+elIXw/wjRAZaHQfHo0H6xJU
	 bXkSIFIRGtPQg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39ca300db70so18358211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrvf0cgbRDX5+FNyJs4eVSkmttJEXrlWDpJHWqxWIvtHyyN15EZ6BHTlhSJ1IE4c2OvfU91+ZouzKytEU0jmEys@lists.infradead.org
X-Gm-Message-State: AFuF++kEiuGDCp3u+mFMmw01/FM03FdKkZ1R2P4iO8X2kh8uwgLkZ0Rz
	Xuv84rmmv7+ZMD71dkY7K+3rJ0oyz1wmMP5421t5ChqvvWRTIayLg1+dYIBAXbNcnH7B5FaL4lS
	JkKP3ID74VcoB6eJ4GAOi5FnV2eeXcB0=
X-Received: by 2002:a2e:bd11:0:b0:39f:bc94:eba6 with SMTP id
 38308e7fff4ca-3a1c1ec43d8mr13126731fa.14.1787406444589; Sat, 22 Aug 2026
 06:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
 <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com> <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
 <c599d74d-81e9-4310-b739-7bdb2c43de2c@app.fastmail.com>
In-Reply-To: <c599d74d-81e9-4310-b739-7bdb2c43de2c@app.fastmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 21:47:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v656c+7VfPhA6K58qXJvMJRm2geXD8GEzdUQvO5ApCSMbA@mail.gmail.com>
X-Gm-Features: AcwNN1WQyLFHbedA4lod8DRY1tPmbNPgs9n1CtBruCA_2842ze7QlHzyCfr7Irs
Message-ID: <CAGb2v656c+7VfPhA6K58qXJvMJRm2geXD8GEzdUQvO5ApCSMbA@mail.gmail.com>
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

On Sat, Aug 22, 2026 at 9:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Sat, 22 Aug 2026, at 16:28, Chen-Yu Tsai wrote:
> > On Sat, Aug 22, 2026 at 8:50=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >>
> >> Hello Chen-Yu,
> >>
> >> On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
> >> > Hi,
> >> >
> >> > On the Allwinner H6 & H616 SoC (and likely others), if running a ker=
nel
> >> > compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
> >> > PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but i=
nstead
> >> > points to 0xfff1000040000000.
> >> >
> >> >
> >> > I've observed this for quite some time but hadn't really nailed down=
 what
> >> > was going on. For context: the IOMMU on these SoCs can only do 32-bi=
t
> >> > addresses, and that's pretty fine since the SoC only supports up to =
4 GB
> >> > DRAM. However the DRAM starts at 1GB offset in the physical address =
space.
> >> > We want to be able to map the highest 1GB I/O virtual address space =
and
> >> > thus need to check if the physical address is within 4GB without the
> >> > offset. Having only 32-bits addressing, the address will wrap around=
 fine.
> >> > So we check the address against PHYS_OFFSE, which breaks with the ma=
ngled
> >> > address.
> >> >
> >> >
> >> > I suspect this is the result of the following commits:
> >> >
> >> >     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA =
to
> >> > VA translation
> >> >     9684ec186f8f arm64: Enable LPA2 at boot if supported by the syst=
em
> >> >
> >> > The first commit introduces a negative (wrapped around) offset to
> >> > memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and=
 the
> >> > second commit makes the offset dependent on hardware.
> >> >
> >> >
> >> > I hope that Ard and the maintainers can look into it and make PHYS_O=
FFSET
> >> > always point to the physical start of DRAM.
> >> >
> >>
> >> On what basis are you claiming that PHYS_OFFSET must always point to t=
he
> >> start of physical, non-secure DRAM?
> >
> > AFAIK we've been using this since armv7 in our older drivers to deal wi=
th
> > PA <-> IOVA offsets. This was then concentrated into one interconnect
> > driver: drivers/soc/sunxi/sunxi_mbus.c
> >
> > The driver applies PHYS_OFFSET as the DMA address offset for a class of
> > devices when the system is using an older device tree that lacks interc=
onnect
> > properties.
> >
>
> That sounds like a hack to me tbh.

There was little documentation around the actual interconnect, and the offs=
et
only really caused issues for devices with 2 GB DRAM, which was quite rare
back in the day. So the driver "workarounds" were added as issues were foun=
d.

> >
> > There's also Documentation/admin-guide/kdump/vmcoreinfo.rst which state=
s:
> >
> > ARM64
> > =3D=3D=3D=3D=3D
> >
> > PHYS_OFFSET
> > -----------
> >
> > Indicates the physical address of the start of memory. Similar to
> > kimage_voffset, which is used to translate virtual to physical
> > addresses.
> >
>
> This information is inaccurate. kimage_voffset is the offset between the
> kernel mapping in the vmalloc space and the associated physical memory.
> It has nothing to do with PHYS_OFFSET or with the start of memory.
>
> >> On arm64, PHYS_OFFSET is the physical address of the start of memory,
> >> where 'start of memory' =3D=3D PAGE_OFFSET, i.e., the start of the lin=
ear
> >> map. When running a 52-bit VA kernel on hardware that is not LPA2 capa=
ble,
> >> the hardware does not support mapping memory at PAGE_OFFSET, so it is =
moved
> >> upward in the linear map.
> >
> > So it held true until 52-bit VA support was introduced?
> >
>
> It still holds true.

Well, yes. I guess I meant the physical start of the linear map =3D=3D PHYS=
_OFFSET.

> >> I don't quite follow why you need to compare with PHYS_OFFSET in your =
IOMMU
> >> driver: could you elaborate?
> >
> > Our IOMMU only supports 32-bit of address space. On our SoCs, DRAM phys=
ically
> > starts at 0x40000000 (1 GB offset), meaning any physical DRAM above 3GB
> > would wrap around. However putting this number in drivers was discourag=
ed
> > in the past and we were told to use PHYS_OFFSET (on ARMv7) instead. Als=
o,
> > in the past there was this one chip that put DRAM at a different offset=
,
> > so using a fixed number in the driver won't always work.
> >
> > Right now we're just blocking any physical address above 32 bits. Ideal=
ly
> > we want to allow up to "start of DRAM + 4GB". So we need to know the DR=
AM
> > start address. (And we probably want to block anything below start of D=
RAM
> > as well.)
> >
>
> Should you be using memblock_start_of_DRAM() instead perhaps?

That seems like the thing we want. Thanks for the pointer, and sorry for th=
e
noise.


ChenYu

