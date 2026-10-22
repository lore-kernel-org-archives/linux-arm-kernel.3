Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=17kTmams;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwIAuW2x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PIP2wew2boNsbO2jCY9QS6pi4IH2031MB32CXAZbJYY=; b=17kTmamsi+vFCB
	ZZ7ylsrHkMORLWLw9F+a/Z/mVQHA5P3LWiqQ/UUqMUhmgvcNdSR2N9GAqCm4a24Bno5VaJDxwUExD
	tQ5xqlhzaaGefT+H5mMZoK1FOeM8OIrc0kUW0GszJ3dlzKHvJrCqaNVWK0IP18XISXUWPhEYJazRu
	8eXsZVBtDco+i3Xxs2Nvxry95fASIprwbbvQlaS3TftBfz5lBPV0OWh391S8Pbi36Q8hu+w90Cipv
	koKSS4e7Sfb8D3l5d++ceHQBYjTUAG3uEuVBujW6h8lfTUwfnrkCIlGPimePYAfZwRGIdI7B0422b
	3u31nSOf23e5bcUyRw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJowf-0000000Dohk-2d3Y;
	Thu, 22 Oct 2026 09:18:45 +0000
Received: from out-143.mta1.migadu.com ([2001:41d0:203:375::8f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJowd-0000000DohE-0zog
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:18:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PIP2wew2boNsbO2jCY9QS6pi4IH2031MB32CXAZbJYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792660717; v=1; x=1793265517;
 b=PwIAuW2xhT18typ6yIM2xFYWQglrpK0p4byP0s6wMqy348GHuH0JbMddiYT7vUFqlBO8fl0/
 Tu61RLV0d9rSQf3MBJT6j+9trRlxHdpa+gnL6+mhkWJHqMUaJNZU9xOOm+MXDSVp7T0bMSot3k7
 xLd9Ty8MtW1EEAoJI7nIT0H0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 59d4a31ee7773685;
	Thu, 22 Oct 2026 09:18:37 +0000
X-Mizu-Trace-ID: 59d4a31ee7773685
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
Date: Thu, 22 Oct 2026 17:18:15 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com>
 <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
 <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_021843_483069_E855E34B 
X-CRM114-Status: GOOD (  27.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Oct 22, 2026, at 05:59, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>> Hi James,
>>=20
>>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> vmemmap_remap_range() can potentially leave the vmemmap in a =
partially
>>> optimized state. In this case, a TLB flush should be done if the =
walk
>>> caller asked for it, even if the optimization was not fully applied.
>>>=20
>>> A follow-up patch will more completely deal with partially-optimized
>>> folios.
>>=20
>> Why are we dealing with partial optimization cases right from
>> the start?
>>=20
>> I know that in patch 12, you try cmpxchg 16 times, and if it
>> fails, it leads to the partial optimization state. What I want
>> to ask is, why do we limit the maximum number of attempts? Is
>> it because during testing you found that this kind of failure
>> is very common? If we did not limit the number of attempts,
>> was it because during testing you found that the scheduling
>> latency caused here is very large? Or is this just defensive
>> programming? In my view, scenarios with such intense
>> concurrent access to these struct page structures should be
>> very rare.
>=20
> This was done defensively, yes. With 16 retries, I never hit this
> without fault injection. (Perhaps I should try with no retries...)
>=20
>> If your testing did not find any problems, my suggestion is
>> not to set an upper limit on the number of cmpxchg attempts.
>> This should be able to simplify the design of the initial
>> version of the code to a certain extent. If we want to
>> determine whether an upper limit should be added in the
>> future, I think we can add timing monitoring in the arm64
>> try_update_vmemmap_pte function and trigger a warning when
>> the measured time exceeds a certain threshold. If someone
>> reports this kind of warning to the community in the future,
>> then I think we can improve it at that time.
>>=20
>> What do you think?
>=20
> =46rom userspace, you could use kpageflags or page_idle to =
continuously
> access a single struct page over and over again. I think that's a

page_idle does not support HugeTLB pages, right? We should only consider
/proc/kpageflags; reading this file requires privilege =E2=80=94 unless =
a privileged
user intentionally creates malicious software.

> pretty good reason to have a bound. Also, the AF can be set even
> without an architectural memory access (so a mispredicted branch can
> still set AF, for example); that also makes me want to have a bound.

However, I don't think this scenario would cause a significant amount of
concurrent reads.

>=20
> Catalin also said wanted a bound here. See the bottom of this reply at =
[1].

I see, but I'd still like to explain my reasoning and see what everyone
thinks.

>=20
> So I think we should leave it in. The extra complexity is pretty much
> entirely in patch #4[2], and I don't think it's too large of a change.
> I hope you agree. :)

Because I personally feel that having only part of the vmemmap optimized
is a somewhat awkward intermediate state =E2=80=94 the all-or-nothing =
semantics
seems more natural to me. At least until a clear problem actually =
arises,
I'd prefer not to consider it. At the same time, we can also keep the =
design
simple.

Thanks,
Muchun

>=20
> [1] https://lore.kernel.org/linux-mm/aoRn3Fn1dhTdsk6d@arm.com/
> [2] =
https://lore.kernel.org/linux-mm/20261003002123.505555-5-jthoughton@google=
.com/



