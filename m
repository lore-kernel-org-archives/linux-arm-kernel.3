Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 02:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pht+H/kaQ/+X/l6EE9OCpbBV+oSMnlhN9E5QSgzooDk=; b=0HH90CgNVgUVQKvl5CrxCM5ccL
	DwL1EYveQmyaEwn3Y0qoJOgfo9DRhWcx53AWfGrOxngudD/Njk92s2RTQPctwCDvy9kXZO9WWvVCr
	RViNRHPVpJQKyBfIPCRrxiZ0cso9wkmsF8C5juttIFQ3zxw4CH/FhSIor2tnEs/1phpAs4xXcacMU
	GscN2cfdYQPCtyV1A4ZchlMxfW7XXmfvfX0N/TUXn7VPQP7y6HRB2WDDJ6NhRbgNJvLR1krzHyUE/
	bzZsU/DjlWHdxf+rseFQxUjcUDcuI+PhGCeDxptjA12KcsgnSBv/Erb53bBDGPKa5TFeEvotP50lM
	+uvA82Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNMq-000000068SA-0GGn;
	Sat, 11 Jul 2026 02:23:00 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNMm-000000068Rm-3Qib
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 02:22:59 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783736570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pht+H/kaQ/+X/l6EE9OCpbBV+oSMnlhN9E5QSgzooDk=;
	b=DZZvjHhAgI9ZYO4a6QbqqXey86PHlAJIPVOYc9sV3WjVSnHsr5E2vkAY4NYPPhxS/Wjzzf
	zdTrPn3Dj8PvY5SFi0uiE3xJ2rw25wDaa8+y4kYFopFw8cWzHXGJf06IsEYEfGCOoM/rdp
	vHGqX5ANgOvp1NPVK4onmnEwML2Ilqw=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
Date: Sat, 11 Jul 2026 10:22:02 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <674EC6D6-B1F7-447D-B462-861ECA5A99B7@linux.dev>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev>
 <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev>
 <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_192257_645717_9F0FE713 
X-CRM114-Status: GOOD (  34.28  )
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



> On Jul 10, 2026, at 03:04, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Thu, Jul 9, 2026 at 2:55=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>> On Jul 9, 2026, at 00:49, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> On Wed, Jul 8, 2026 at 1:41=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>>> Do you mean that the support for AF might vary across different =
CPUs?
>>>> I'm not that familiar with arm64, so it seems a bit strange to me =
that
>>>> such basic hardware features can differ so much from one CPU to =
another.
>>>=20
>>> Yes, hardware updates of the Access Flag is a per-CPU feature. It is
>>> available for a CPU to use if TCR_EL1.HA is set. TCR_EL1 is a system
>>> register; each CPU has its own. (Linux will always enable HW AF for =
a
>>> CPU when it is onlined[1] if support is advertised, so we simply =
need
>>> to check if support is advertised to know that it is in fact =
enabled.)
>>>=20
>>> These days it is not uncommon for a system to have two (or more?)
>>> different core implementations, like with "fast" cores and =
"efficient"
>>> cores.
>>>=20
>>> [1] See the CONFIG_ARM64_HW_AFDBM bits in arch/arm64/mm/proc.S
>>=20
>> Thanks for your detailed explanation. When enabling HVO via the =
cmdline,
>> can we simply prevent CPUs that do not support AF from coming online?
>> Would implementing it this way be much simpler? In practice, =
developers
>> definitely know whether the current system is suitable for enabling =
HVO.
>> If some CPUs do not support AF, they would just need to evaluate the
>> trade-off between memory savings and having fewer online CPUs than =
expected.
>>=20
>> For scenarios where HVO is enabled via sysctl, we simply need to =
check
>> if all CPUs support AF. If any do not, the system should return an =
error.
>>=20
>> Then, we can proceed with the Pre-HVO.
>=20
> I don't think it makes sense to try to implement pre-HVO.
>=20
> We cannot do HVO if any boot CPUs do not support HW AF, as HW AF will
> be required to free the HugeTLB pages later, which we should continue
> to support. Pre-HVO (today anyway) happens before all boot CPUs are
> onlined. IMO it is not okay to prevent boot CPUs from onlining.
>=20
> Let's say for a moment that HVO cannot be toggled at run-time, then
> the best we can do is:
> - If a user does not specify hugetlb_free_vmemmap=3D1, we can always
> allow onlining of late CPUs
> - If a user specifies hugetlb_free_vmemmap=3D1 but not all boot CPUs
> support HW AF, we can always allow onlining of late CPUs.
> - If a user specifies hugetlb_free_vmemmap=3D1 and all boot CPUs =
support
> HW AF, we must not allow onlining incompatible late CPUs.
>=20
> HVO compatibility has to be modeled as an Arm system feature. To
> support conditional onlining of late CPUs based on whether or not "HVO
> is being used", we still need the extra cpufeature.c logic.
>=20
> So if HVO cannot be toggled at run-time, we can simplify the
> definition of "is HVO being used?" (for the purposes of determining if
> late CPUs can be onlined). We can simplify it from what it is now
> ("are there any optimized pages?") to
> "vmemmap_optimize_enabled=3D=3Dtrue?". That allows us to drop patch 15

I believe this conversion logic is sound. If a user proactively enables
HVO via the command line, it clearly indicates they intend to use it.
Otherwise, there would be no reason for them to enable it and then leave
it idle.

> (which then needs a slight change to patch 17), but that's about it.
> So this is a slight simplification, which is nice.
>=20
> If you (or the Arm folks) feel strongly, I'm happy to write this =
simplification.

I really like the simplification here. To keep this series as simple as
possible for the first step, we also could focus strictly on bringing =
HVO
support to ARM64 by making it depend entirely on BBML2_NOABORT. This =
keeps
the initial scope highly contained, which should make it much easier to =
review.

Muchun

>=20
>>> I'm hoping you can look at patches 1-3 anyway. I think they're the
>>> right thing to do, even without the arm64 changes.
>>=20
>> Yes, I've looked it over. I think that making modifications across
>> several areas will be much simpler on top of my refactored codebase.
>> For example:
>>=20
>> - In patch 2: There is no longer a need to move vmemmap_get_tail().
>> - In patch 3: Handling partially-HVOed pages becomes straightforward
>>               because vmemmap_restore_pte() no longer relies on
>>               ->vmemmap_tail to detect whether a restoration is =
needed.
>> - In patch 4: I have updated the ->remap_pte callback to return an =
int
>>               as well, making it easy to adapt your changes.
>>=20
>> Overall, the implementation is significantly cleaner, so I won't list
>> every detail here.
>=20
> Thanks! Good to know I can basically drop those patches. :)
>=20
> Please CC me on these HVO simplifications when you send them out, =
thanks!


