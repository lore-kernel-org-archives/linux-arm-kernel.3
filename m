Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B43CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVAxdJW7jC5jS/EGdsY03Ok8EVfqupezCmX7jIRIDTo=; b=DjvW2FZ1ctsm/fyvGW5iaRONws
	Rnekv0HWOQqDpvUkUrUYdX+hfGZWJnsL6f/zrn/OKcRPG1dzYLqS7Xk4MappEGcENjoWspQGsgYO2
	uVPuzhvMvv//tebHqJ9mtwHX5/r0DVRBUwVPvsPsfAiY6YIa7r4QdcItqDVRONC8EW2wDI64jGaWb
	g1GwPjNdtTT/VeGPusClGPcfOI7dSsn7WNtG/HF8hfGArPK+fEgptSL213F5w+p8bk5ue9xzfnPf2
	SrmSU2RZnCIx8n/SZlKsg5UUUitAKBqOVXJzUc5i2mk0C87Ox65cERyddKdeKJq3HC9FPyo4FkdBt
	y0GG5g+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDNR-00000001PKc-059v;
	Thu, 18 Jun 2026 14:05:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDNO-00000001PKE-3m8B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10C4160008;
	Thu, 18 Jun 2026 14:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2409E1F000E9;
	Thu, 18 Jun 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781791549;
	bh=tVAxdJW7jC5jS/EGdsY03Ok8EVfqupezCmX7jIRIDTo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=guRgYMnh8lVzlhkg5QOvp9HmCWhWuAtur1nhXuuAxmi6OyIatGXW/4AAMLdpMjQZ1
	 BuGWAcPIdh4D25J9fv4Shd3xBjt3f8rffxUrUvc9J/ZnbB2f7lgqId/h2fm1RM/uL0
	 g8VGGkSgiqmlL1jFWg468nX031Kwq6ZlSCQ5LfUfSZ8/stVkSvSFM4Tqe1gYl5N6Mp
	 dg/VYKXQiT3K05iCarleYoF4Pmr61oApqv8o7lJKdF7Ryl6YiVZ6HerRjgVQgjfpQS
	 SypMSRxtr5kFuPKLlZgazCm+kz//yoP5XVt+o4fkAcCQgpWwLZCY6wsKabtoZnhzIQ
	 rasK12Ot6W1Bw==
Message-ID: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
Date: Thu, 18 Jun 2026 23:05:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
From: Harry Yoo <harry@kernel.org>
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Language: en-US
In-Reply-To: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 6/18/26 10:35 PM, Harry Yoo wrote:
>=20
> Hi Dev,
>=20
> On 6/12/26 1:44 PM, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects.=
 This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>=20
> I think most of overhead when enabling MTE comes from loading and
> validing tags for every memory access (either in SYNC or ASYNC mode),
> rather than from storing tags.

Is there any reason not to use STGM instead of STG + DC GVA when
setting/clearing tags for large sizes when we know they are properly
aligned?

>> Now, when a memory object will be freed, it will retain the random tag=
 it
>> had at allocation time. This compromises on catching UAF bugs, till th=
e
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catch=
ing
>> "double-free" will be the compromise for reduced KASAN overhead.
>=20
> I doubt users who care about security enough to enable HW_TAGS KASAN
> are willing to compromise on security just to save a few instructions
> to store tags in the free path.
>=20
> To me, it looks like too much of a compromise on security for little
> performance gain.
>=20
>> This is an RFC because we are not clear about the performance benefit.=

>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++-=
-
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
>=20

--=20
Cheers,
Harry / Hyeonggon


