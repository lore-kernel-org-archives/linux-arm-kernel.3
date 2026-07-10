Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE35C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 03:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT+E5E9n47vACYHi/SVeCwzS+f47nvPEFd7PhC0qToA=; b=i7vANFfqUKzXcR8Ruy+XCO53dy
	qNIACzvw3RKiCaVl96K4aXKmiz2OwkeU1fW+121YCac1N4paNit7bovZ7JazF5QKljorVEEWQJeRc
	sZ/fOK5XXKnyi+Kz8i3oQ9LGAJeKZXvkoqmHGB0rAb3YTf/1W29fC2l7PEKRsMzZgzYyNxoLkBf4D
	N3RLLW/HlnIrg5E7wacHaAkpJBohU3jz3KUEzkzbDrmjRVSenlXlHb8WOZnUvrbqdH1AVdCXofYxv
	uCR2h1tcdhljxeGYKRKQPJ/r6KeUm5IuEbLF03gOwOOhLuQ6lQg6gy2uxBmENYLVMY/H2peTULANg
	3i6ScnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi270-000000043Gs-2zx6;
	Fri, 10 Jul 2026 03:41:14 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi26x-000000043GC-18Hd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 03:41:13 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783654866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dT+E5E9n47vACYHi/SVeCwzS+f47nvPEFd7PhC0qToA=;
	b=L5nIoJYeemj6cziwYQ+w0kGI/cJG5cb7TAiIiYmixAHOtBjE71QaTmOoYtquMkdnefmccV
	ZsSDe8sqIhk9NjdVJMCFyGsO+7W+NBqb9ky4nF+CWhgl+SPl8/RvCxuCVhzGwKsOWGHWpq
	+hPtlQ3byDkxV1RAmYaNtRB0FuqvP08=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
Date: Fri, 10 Jul 2026 11:40:10 +0800
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
Message-Id: <F2693104-180B-44CF-9F3D-CBDE26151EA3@linux.dev>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev>
 <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev>
 <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_204112_338852_26A59B99 
X-CRM114-Status: GOOD (  37.53  )
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

When the boot CPU starts, it first checks if the hardware (the current
boot CPU) supports AF (The selection of the Boot CPU is critical here
If the user really wants to enable HVO). If AF is supported and HVO is
enabled via cmdline, we perform a Pre-HVO. Subsequently, any CPUs that
do not support AF will be prevented from coming online.

If the boot CPU does not support AF, enabling HVO is not =
permitted=E2=80=94neither
via cmdline nor sysctl. All CPUs are allowed to be online.

Once the system has started, there is only one way to enable HVO, and
that is through sysctl. 1) If the current system includes any CPUs that =
do
not support AF, enabling HVO is not permitted (unless the user chooses =
to
take these CPUs that don't support AF offline). 2) If all online CPUs in =
the
current system support AF, then HVO can be enabled. In this case, the
system must also block any CPUs that do not support AF from coming =
online
in the future. Of course, if a user specifically wants those CPUs to be
allowed to come online, they can choose to disable HVO first (At the =
same time,
this means that the HVO-optimized HugeTLB must be freed first as well).

My proposal assumes that even though the system supports different types =
of
CPUs, their support for AF (I suppose this is a very basic feature =
nowadays)
is generally the same. I believe that for servers (Only servers stand to
benefit more from HVO), there shouldn't be a mix of those that support =
AF
and those that don't. At the very least, such a situation would be =
extremely
uncommon. I believe this may be acceptable. That said, if we go this =
route,
is there a way to simplify the code implementation even further?. Of =
course,
this is just my personal speculation. Please let me know if I've missed
anything.

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
> (which then needs a slight change to patch 17), but that's about it.
> So this is a slight simplification, which is nice.
>=20
> If you (or the Arm folks) feel strongly, I'm happy to write this =
simplification.
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

No problem. Will do.

Thanks.



