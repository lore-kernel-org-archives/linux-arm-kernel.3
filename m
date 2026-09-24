Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73564C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juypI3VyS6Yw7SS8PxqHAP7Ts9fvCbUq7gyqGKnmZeI=; b=4GaVroJJ2aV+hqN8Ba5S2bWvGq
	clq7o4nMfeWWnwuIkQsd1DBJaHyYE81vQdT/a4Ww4P10vajij9mfO3OBDOclYYaTxlpGstkceA0Ff
	qDLbl6EgxCzeZ3CNxGUAVorUsYkaVAu6p/dz/KcnfyqMhpHe57/rE9xxHZyB3R/aiO/aKp3yeMYy1
	n5wuwchorzP82EwVh1X1wo83qRLIMAt6cSrsAP7S4qTLYqJLsarcMxbkxhvSONVeC8Cqz2dNIqoCS
	R5S7vXw99XDfH4Cw7c+luehXyLH0AEVTOYNCeAgejRDAvn7faS9xFQA0k0/LL4J6qas/LFkiTKFQb
	r47+f/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hAy-0000000Aneg-2CwC;
	Thu, 24 Sep 2026 10:59:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hAx-0000000AneS-13jh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:59:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB5CA41E4F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104281F00893;
	Thu, 24 Sep 2026 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790247578;
	bh=juypI3VyS6Yw7SS8PxqHAP7Ts9fvCbUq7gyqGKnmZeI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=OrOknPo8fAivgY+1vrSDamAFmulsG+msK8SQxKLt34pOOdKfKozPHlKnVSh0Bv5yE
	 txPDKc2nKicHAj92S0eAkCBkPb9HM2oOEpJA+5E+/jHhViQRACD39yaQ+SbIaZ8O+D
	 dDNmTzxZHruPSoMybXP5lCWyuzU+k6J1V8LXhR+qzaB/VpiWRFctHlXNmurM1HWSnh
	 FY4EkTW4grdsLmmBHgftZOVTPbq9Ug0XXmAZSPkLaIRooT+bPY2C0wVOJgTm4HVxtj
	 v2zDNVLWhh/dzWEZyNQaqD3rbtXvyWoDq4tF2+rEXvt6k+kmjiNwUFD8nNTDCNuoBP
	 /S9R9NX8pBDLA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 86C0F198005A;
	Thu, 24 Sep 2026 06:59:36 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 24 Sep 2026 06:59:36 -0400
X-ME-Sender: <xms:lwK1augzb2qu0GNZ24lx4riVXYJCbm7gyFsh41-s-tQQqWy4SNwUbg>
    <xme:lwK1ap1dah_TnCQf0m4_TlkFq3z1YBFP8kvxbeP0wvJvAROrRl_NwbYqQB_tumkCR
    XD9cz9aRBWVHph_IXlzjkeIlOmvoEI8oX_fxFWi_SFrmwQGlPUAXbkj>
X-ME-Proxy-Cause: dmFkZTE6rZdqXN4qa8FkjieE1x3hScRkftRAWF7BmlzfbJMgGB5QnQqnf6a0GBQ7xCOZKg
    ZahfAdekczfgzfx35Zd0RiU0FwShd4AwI92q6VjzVArHb+vbh7T3XdwedKVmgSsMgPBasP
    3AVFKS4w/QVp3T+4+pIllZXlZw9ouRr4qbGCfMz6+kyzellD81D1RRXSmmUBVa+xzH0wD+
    xawE0X4amtZTcBJDqHxWhqArE5o2w4XObnNCx0UlvMmFhu43r1P2KdAjw6dFcqAnIC2piE
    tY0aU4osNur12xSd7P+6eRzwYZSTvwqdWZlEpWWK0v8cdWd/cpcjFNSJxyOredr9mOsfWw
    +HSKx5TYhFZA8GGuBJnLmxcV+7LU5PLasbeVOXagP5RK5wFO5FnyTDcWlaDBSD0QTEmQ4o
    MX1x4Iu1cWAEay9Q93OFmQpxxupZgoqCXIo/8KLPPVmZwpPV7V/NOFtpMSVWV4yr/7g8Q6
    A2kDDAFzwgV+i90jhiYxFPm68cgmz1AkD+mhXYbadAREse5hD4CQ3L12nwfaRcfiUXvKXq
    6gjHyWzhjNCbtSLg2YaRGXNV7SR9E5OS+YHzkyeiMNYCh5qmixN/g4nElAxNazeuLyjLer
    i3kbHUBfwH+gjk4sJFXr5BxgwWlQbOtwk8Nd/ti1oVOi9Xz9rY/naWIP8lqQ
X-ME-Proxy: <xmx:mAK1aqMBFcb5U3BKTX-hTi6tFtUAyLAzX5XWcxaRAM3tZ7DzqhOzBA>
    <xmx:mAK1aiSUm_bR5L-6ikTSn5BeXS5ddyDMbQlt7SBZcJRRHOVmnOZieA>
    <xmx:mAK1aog6_Paha3JymlBiCUHBS2ImSKDCArKOYlFipJJKi-p66zmhSg>
    <xmx:mAK1ar86izrO6sYVD_d8_aM-7pNhjUAIU6J-pzuRIxp67TKrRnxE3Q>
    <xmx:mAK1avETLNxEzpr1CUQP-yv1tliuIIwCpMPf3_4Am0CUo4ae-fIM0qc1>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 62C13F80080; Thu, 24 Sep 2026 06:59:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 12:59:15 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 liulhong617 <liulhong617@gmail.com>
Message-Id: <7a6793e4-b2ef-46e0-a068-9166d3f10ea3@app.fastmail.com>
In-Reply-To: <arIXL3CeIvE5HdoF@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
 <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
 <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
 <aqv5MMXg45a_zEy-@kernel.org>
 <bdb4e693-883f-4b8f-9aa5-16649548b975@app.fastmail.com>
 <arIXL3CeIvE5HdoF@kernel.org>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped memory
Content-Type: text/plain; charset=utf-8
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



On Tue, 22 Sep 2026, at 07:50, Mike Rapoport wrote:
> On Thu, Sep 17, 2026 at 05:17:45PM +0200, Ard Biesheuvel wrote:
>> On Thu, 17 Sep 2026, at 16:29, Mike Rapoport wrote:
>> > On Thu, Sep 17, 2026 at 02:34:57PM +0200, Ard Biesheuvel wrote:
>> >>=20
>> >>=20
>> >> On Thu, 17 Sep 2026, at 14:26, Vladimir Murzin wrote:
>> >> > On 9/16/26 11:13, Ard Biesheuvel wrote:
>> >> >> (cc Mike)
>> >> >>=20
>> >> >> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
>> >> >>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping=
 of
>> >> >>> no-map reserved memory") removed sub-page no-map regions from =
the
>> >> >>> linear mapping. However, pfn_is_map_memory() can still report =
that
>> >> >>> such a region is mapped.
>> >> >>>
>> >> >>> For instance, with 64K pages, say we have
>> >> >>>
>> >> >>> normal:        ...=E2=80=930xa2007fff
>> >> >>> no-map: 0xa2008000=E2=80=930xa200ffff
>> >> >>> normal: 0xa2010000=E2=80=93...
>> >> >>>
>> >> >>> The range 0xa2000000=E2=80=930xa200ffff is not linearly mapped=
, but
>> >> >>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the addres=
s to
>> >> >>> page granularity and passes 0xa2000000 to memblock_is_map_memo=
ry().
>> >> >>> That address belongs to the preceding normal memblock region, =
so the
>> >> >>> no-map region is ignored and the function returns true.
>> >> >>>
>> >> >>> Fix that by checking if entire page is subset of memory block.
>> >> >>>
>> >> >>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping=
 of=20
>> >> >>> no-map reserved memory")
>> >> >>> Assisted-by: LLM
>> >> >>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> >> >>> ---
>> >> >>>  arch/arm64/mm/init.c | 3 ++-
>> >> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >> >>>
>> >> >>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> >> >>> index fbf215ecc7d0..5da80e1e1727 100644
>> >> >>> --- a/arch/arm64/mm/init.c
>> >> >>> +++ b/arch/arm64/mm/init.c
>> >> >>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>> >> >>>  	if (PHYS_PFN(addr) !=3D pfn)
>> >> >>>  		return 0;
>> >> >>>
>> >> >>> -	return memblock_is_map_memory(addr);
>> >> >>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
>> >> >>> +		memblock_is_map_memory(addr);
>> >> >>>  }
>> >> >>>  EXPORT_SYMBOL(pfn_is_map_memory);
>> >> >>>
>> >> >> memblock_is_region_memory() only tells you whether the range in
>> >> >> question is covered by a single entry in memblock.memory.region=
s[].
>> >> >>=20
>> >> >> memblock has other flags, which may or may not be set on sub-pa=
ge
>> >> >> regions too. So I don't think this is the right solution in the
>> >> >> general case, even if it fixes your example.
>> >> >>=20
>> >> >
>> >> > Ack.
>> >> >
>> >> >> Given that the no-map attribute fundamentally only applies to p=
age
>> >> >> granular regions, it would make sense to round those outwards
>> >> >> whenever they are created.
>> >> >>=20
>> >> >> --- a/mm/memblock.c
>> >> >> +++ b/mm/memblock.c
>> >> >> @@ -1119,6 +1119,10 @@
>> >> >>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys=
_addr_t size)
>> >> >>  {
>> >> >> +       phys_addr_t end =3D PAGE_ALIGN(base + size);
>> >> >> +
>> >> >> +       base &=3D PAGE_MASK;
>> >> >> +       size =3D end - base;
>> >> >>         return memblock_setclr_flag(&memblock.memory, base, siz=
e, 1, MEMBLOCK_NOMAP);
>> >> >>  }
>> >> >> =20
>> >> >>=20
>> >> >
>> >> > Should the same be applied to memblock_clear_nomap()?
>> >> >
>> >>=20
>> >> Yes.
>> >>=20
>> >> > This is indeed much nicer way to fix the problem! Now, when no-m=
ap is
>> >> > rounded outwards, do we still need 7ace06a01efa?
>> >> >
>> >>=20
>> >> Probably not, but there are some corner cases to consider before we
>> >> go down this route:
>> >> - what happens when marking a range no-map where the outward round=
ing
>> >>   would exceed the limits of the existing memblock memory range?
>> >> - what happens when removing a non-page aligned region from memblo=
ck
>> >>   that intersects with a (page aligned) no-map region?
>> >
>> > Another thing is that maybe we should force memblock.memory only to=
 page
>> > aligned ranges. x86 uses memblock_trim_memory() for that since, lik=
e,
>> > forever.
>> >
>>=20
>> Interesting. It would make sense to do the same on arm64.
>>=20
>> But if a NOMAP region ends in the middle of a page, that code will tr=
im on
>> both sides, and throw away the shared page entirely.
>
> Honestly, I think the whole sub-page NOMAP is firmware's problem.

Not entirely. The firmware does not know whether the OS will use 4k pages
or 64k pages, and rounding up all reservations to 64k just in case might
be wasteful.

So I think it is reasonable to require 4k alignment for NOMAP regions,
and the OS should decide whether to round outward or not. It does mean
that the firmware should avoid treating the misaligned pieces at the
edges as memory where it can place things like initrd etc.

> While
> rounding up in _mark_nomap() makes sense because we cannot "not map" a
> sub-page range, I would add a big fat WARN_ON("FIX YOUR FIRMWARE") if =
the
> rounding actually happens.
>

I don't think that is very productive for 4k -> 64k rounding.

> As for the trimming on arm64, I believe that's relevant, because again=
, we
> cannot really work with sub-page ranges in memblock.memory and they are
> anyway discarded by for_each_mem_pfn_range() that's used all over mm
> initialization.
>

Yeah I think the rounding is needed in any case, but I don't think it is
the firmware's job to mark unrelated adjacent memory as no-map only beca=
use
the OS might decide to use a coarser granule.


