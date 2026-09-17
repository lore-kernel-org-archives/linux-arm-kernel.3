Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA124C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQmsXHkyLnX5yKeoBTfYaDJiPt271pBw/Gkr9aSfAug=; b=hu574dxzBSDyC/pPUB7cM/gvJ9
	Rv+w7zezhCPlSooNLNpzZtTt0oRht4SXAy0UU0xDz9677Rk3Xf1DN5kLbF7UuGven5uSREbqR4WNH
	X8BZ7sHNlrXY1ZepX8EEozg27qUly5kykx9mx+SzOITxVzOzAVlK4S+1h5Uxn5Rn7tggdJfObUFJN
	Xi3StS4qQNBdCJ66ydXySHiHXje9sFUagXRNtXpG+rwQ8kAjrKBA1zIfL0CsyQ+Y7YSa0MIhetuKy
	0WVv8BrT2Gc9g7iOfr2v2jHfG1VIGpygs4KQ/rPCUUdq8GqOISChGus5dXJlqCIYuU5MPImsM7jrs
	ZH7zrNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DsK-0000000Betk-0Kwe;
	Thu, 17 Sep 2026 15:18:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DsI-0000000BetT-2A6J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:18:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F117760233;
	Thu, 17 Sep 2026 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F091F00893;
	Thu, 17 Sep 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789658289;
	bh=UQmsXHkyLnX5yKeoBTfYaDJiPt271pBw/Gkr9aSfAug=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Hh1ft+RBeb8+cILB42wykSswh8wVNweC2Q4v2XoCZUBipe4ExsjUjY5b7EQwfahd/
	 PRJo7qzwHf8DuaUlbv5pCRIKNQEqJlclEg6gjiiHfcNurqi2BY82gPdTW2uRdjRQ7V
	 SKVskJZbpMUGqNtW4rZmt73QJuljakbohHvhxnig+Nc9ajJVuM4kKwRuibQXycGxqn
	 Bzo9yTblwFyX0MdF9qTyj0dUKb6fN7n3RiI6V+HNoeCbUs2zxaRoTpa8aA0BsCdaDL
	 9F3kNoriDtNiHPPH9JajC394ux/7+9Y36QUF7ARW9sOMsxvqZDtxxFTpozXyyyxBti
	 4oIyLOg7QScwg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8F6121980050;
	Thu, 17 Sep 2026 11:18:07 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 17 Sep 2026 11:18:07 -0400
X-ME-Sender: <xms:rgSsaniSwNlvDkMq69nsK2nZJyIIEJ9nz5-SUje-bRNUOjOJqc2Tuw>
    <xme:rgSsau0AxaxMOTDCj3Y-QY_-zwXJLLtnTPoHHb3LDsjDjkoRBpRxoDaF-qxFsBjgm
    W6t0lm9M36GsZbzJUS9dOlNcBOodx2yUBiGqW5L-ndSyUv7IWUt_n_0>
X-ME-Proxy-Cause: dmFkZTG2NBhYUlxhEVd/LppIxbMdjnG8rezChXVKWch/tSwvXQq2FMxz7htuChHTqZBcgr
    2mU/z725fX3dWEnxRisEuC40Dirmbp1aEG9eNBtsK9KSNavbpP9OTYTcVsJuDKfJH8/YkK
    MvW56veLsHwZXgEzJ9KQsUr7h3IPw6E9HQQB+wTViEotn6K5R5XhC9QGFVFJSf67uk56JM
    d6HRWBIXHXZvrIAMGPbXLNkz50uD6bCTD+mpju3SN5AyZkwEFXZRXjWJibw/uSZ5rjzj3a
    aI9IK7E6dhKnssSbD3X35XF6KwNroip1BEUchAmKQPnT+9J9fB3TEmlofMlbEsXsicLHh4
    BMqUYJL79lkQAqSvJK8KaIAJT5iyEIbZIeVeEm1iSHLUNmEYelDPekNnkc6+r1mYgXz1JE
    gRQknaFuNeR+fU11aVDTcpCw10oa/kpmnDPNib6s4ZajmHq5E99k5YfbgZxwb1dXePsCsr
    HipAysYy1rlMxILvE8wiqcNWqvN8WDBwycNhvJcHqhEUiFN8GQR2Y2Wqa24JgrBVGG+z3y
    rsLEGEvqNo3Cv+GZmYoF7M6ZYphPbkvc6c0M5o7RhiTEOSmdz11HGWrXlL/avEOLY4Nhnf
    G8ZhOpBArhs3nh/4jwXgM5PA1Q6z+NDHdR1JaUYL5CbyVWze45r56wfMP0lw
X-ME-Proxy: <xmx:rwSsajMqSbpB2nBciBtKFnkbJgiTZy4Zbr8OI3Y86vFcKi7FOdz2Rw>
    <xmx:rwSsanQ5AhJhOXnQt4CozefcxjibrP7F-KnRkOgf4V5j_OaOKInZog>
    <xmx:rwSsaph99p9e9qn9t0M8NMQMEMPNlFoefTTRUuIPKqyLOt4upbHGbw>
    <xmx:rwSsao8oGriA-cHHLKftqmRCJUXpuQazk-DpYR3EtnpBD9cYZcypqA>
    <xmx:rwSsaoE1cFe_o-YY6jjc9NdHRgNu0-UCbSgkgMIJfpfj9Dn3_CJOINuH>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 04843F8007E; Thu, 17 Sep 2026 11:18:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 17:17:45 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 liulhong617 <liulhong617@gmail.com>
Message-Id: <bdb4e693-883f-4b8f-9aa5-16649548b975@app.fastmail.com>
In-Reply-To: <aqv5MMXg45a_zEy-@kernel.org>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
 <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
 <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
 <aqv5MMXg45a_zEy-@kernel.org>
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



On Thu, 17 Sep 2026, at 16:29, Mike Rapoport wrote:
> On Thu, Sep 17, 2026 at 02:34:57PM +0200, Ard Biesheuvel wrote:
>>=20
>>=20
>> On Thu, 17 Sep 2026, at 14:26, Vladimir Murzin wrote:
>> > On 9/16/26 11:13, Ard Biesheuvel wrote:
>> >> (cc Mike)
>> >>=20
>> >> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
>> >>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
>> >>> no-map reserved memory") removed sub-page no-map regions from the
>> >>> linear mapping. However, pfn_is_map_memory() can still report that
>> >>> such a region is mapped.
>> >>>
>> >>> For instance, with 64K pages, say we have
>> >>>
>> >>> normal:        ...=E2=80=930xa2007fff
>> >>> no-map: 0xa2008000=E2=80=930xa200ffff
>> >>> normal: 0xa2010000=E2=80=93...
>> >>>
>> >>> The range 0xa2000000=E2=80=930xa200ffff is not linearly mapped, b=
ut
>> >>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
>> >>> page granularity and passes 0xa2000000 to memblock_is_map_memory(=
).
>> >>> That address belongs to the preceding normal memblock region, so =
the
>> >>> no-map region is ignored and the function returns true.
>> >>>
>> >>> Fix that by checking if entire page is subset of memory block.
>> >>>
>> >>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of=20
>> >>> no-map reserved memory")
>> >>> Assisted-by: LLM
>> >>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> >>> ---
>> >>>  arch/arm64/mm/init.c | 3 ++-
>> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> >>> index fbf215ecc7d0..5da80e1e1727 100644
>> >>> --- a/arch/arm64/mm/init.c
>> >>> +++ b/arch/arm64/mm/init.c
>> >>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>> >>>  	if (PHYS_PFN(addr) !=3D pfn)
>> >>>  		return 0;
>> >>>
>> >>> -	return memblock_is_map_memory(addr);
>> >>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
>> >>> +		memblock_is_map_memory(addr);
>> >>>  }
>> >>>  EXPORT_SYMBOL(pfn_is_map_memory);
>> >>>
>> >> memblock_is_region_memory() only tells you whether the range in
>> >> question is covered by a single entry in memblock.memory.regions[].
>> >>=20
>> >> memblock has other flags, which may or may not be set on sub-page
>> >> regions too. So I don't think this is the right solution in the
>> >> general case, even if it fixes your example.
>> >>=20
>> >
>> > Ack.
>> >
>> >> Given that the no-map attribute fundamentally only applies to page
>> >> granular regions, it would make sense to round those outwards
>> >> whenever they are created.
>> >>=20
>> >> --- a/mm/memblock.c
>> >> +++ b/mm/memblock.c
>> >> @@ -1119,6 +1119,10 @@
>> >>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_ad=
dr_t size)
>> >>  {
>> >> +       phys_addr_t end =3D PAGE_ALIGN(base + size);
>> >> +
>> >> +       base &=3D PAGE_MASK;
>> >> +       size =3D end - base;
>> >>         return memblock_setclr_flag(&memblock.memory, base, size, =
1, MEMBLOCK_NOMAP);
>> >>  }
>> >> =20
>> >>=20
>> >
>> > Should the same be applied to memblock_clear_nomap()?
>> >
>>=20
>> Yes.
>>=20
>> > This is indeed much nicer way to fix the problem! Now, when no-map =
is
>> > rounded outwards, do we still need 7ace06a01efa?
>> >
>>=20
>> Probably not, but there are some corner cases to consider before we
>> go down this route:
>> - what happens when marking a range no-map where the outward rounding
>>   would exceed the limits of the existing memblock memory range?
>> - what happens when removing a non-page aligned region from memblock
>>   that intersects with a (page aligned) no-map region?
>
> Another thing is that maybe we should force memblock.memory only to pa=
ge
> aligned ranges. x86 uses memblock_trim_memory() for that since, like,
> forever.
>

Interesting. It would make sense to do the same on arm64.

But if a NOMAP region ends in the middle of a page, that code will trim =
on
both sides, and throw away the shared page entirely. So all flag manipul=
ation
occurring beforehand should be rounded outward (not just NOMAP, although=
 I'm
not sure if there are others that may get set on non-page granular regio=
ns)





