Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A1AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4Tb1oIjWwUxjFhTBFD/zWgNtoh6N0RIyHfctUTX0zA=; b=C/1bz4iVVqlZzSP/FSLmYlFfrX
	aWEE5DGiIvgOErxYLdxQ+hzmjZFwc4/lZxPVmQgHoiz7gwhc7o5JOIKvUJ4zIupWXlMRZK20Rv+c3
	iseeLy0L/kkgLX371hAyaDqweSib0WlMudydYb8hpDjxjvY6TA99XXF3l0VFXGRiT5V9DFeZaAMgJ
	FOmuWATFf3fFYLYcqwjWYHmhOK3vQYt1AwEo8HPX2h9wvkPMbkCPcPLYwLSebXjwQVHh6zRmikBPF
	E/YYn7rCZLT47SE3sCxbSSb+r9aFhD7lqgt6DjN1K6e4UgNNnFUdH4qyvg55VPYiZP1pkE4sYkGoN
	3X10pHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMyg-00000002ppM-0JtM;
	Tue, 04 Aug 2026 21:47:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMyf-00000002ppF-07o5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C770E600AA;
	Tue,  4 Aug 2026 21:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C651F000E9;
	Tue,  4 Aug 2026 21:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785880031;
	bh=b4Tb1oIjWwUxjFhTBFD/zWgNtoh6N0RIyHfctUTX0zA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=anIpDvCbLz1al5lEwizeQ9TRqV0GfEwS3ElIBSUJbK9mwo6IQiwKGEfx9O3lKpIe5
	 6rLdNm+ZejMW8uukRRb/U3GnkcSRU5N4Qgrcrbhej0DmvEgRPRShipVaDF+ifEO29O
	 un+yx37gRX/Ir3fQ5Occp8CBb7sXLKEvdaBZCGGb0EBsAiEBMJtcJ2rPre27JqQaow
	 j5dDnMSADfw7+CXmEYORzsAS3nPPS4nYt4Cs/K35WAbVCEZAfOOtMTVDYKH/DNuyCz
	 zcBZ3GzUGKJAdAqEAhdP1CCEk3DSYInSPWkW6cpK9Ae6V+Fn5ShxZOAaJZfpi5l3cq
	 q6FXjyJt6QDtQ==
Message-ID: <ea268481-d584-4744-99d6-0b05aade7d5d@kernel.org>
Date: Tue, 4 Aug 2026 23:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org,
 urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <63ea8156-a109-b2a2-6d35-1c17ad7f1a9d@gentwo.org>
 <84b31836-1d10-4bec-a469-468b91fd4645@kernel.org>
 <9f146ce0-4adc-0c00-a2d8-c01b47edc9d1@gentwo.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <9f146ce0-4adc-0c00-a2d8-c01b47edc9d1@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/4/26 23:25, Christoph Lameter (Ampere) wrote:
> On Tue, 4 Aug 2026, David Hildenbrand (Arm) wrote:
> 
>>> rather hacky restart logic. It relies on a long preemable and postscript
>>> to each per cpu operations.
> 
>> But I am sure you did you homework and have data to back up your claims. Please
>> share that data, because I am very curious.
> 
> The comparison here is a single instruction on one side and abnd the per
> cpu operation prefixed with a preeamble and another instruction / set of
> instructions on the other side.
> 
> Even if its only one before and one after then we are still looking at 3
> instructions instead of one. This is a frequently used operation in the
> VM.
> 
> You need data to show that one instruction  is faster than 3???

I want you to show that the difference *matters* in *practice* enough that we
should *care* about accepting the additional *complexity*.

No hand-waving about "3 > 1". IIRC people were asking that previously but
received no results back.

So to be clear: claiming that the additional instructions are unacceptable I'd
expect something minimal like: "removing these 3 instructions speeds up
micro-benchmark (a, b, c) by X% and macro-benchmarks (d, e, f) by Y% compared to
Mark's approach".

Maybe there really is a big difference.

> 
>> Mark's solution is the obvious improvement to the problem, doing it just like
>> s390 already does.
> 
> Well there is interest by the S390 folks to move to what we proposed from
> what I can tell.

Heiko said that as reply to v1, bit he's been replying a lot on Mark's patches.
Only Heiko can tell. (on CC)

> 
> 
>> If the proposed solution has a significant benefit over Mark's solution it could
>> be discussed as a next step; and it must be backed with sufficient data to
>> warrant all this complexity here.
> 
> You cannot accept that one instruction is faster than the same
> instruction prefixed with another and something else at its tail?

I am pretty sure that you got exactly what I meant, you likely just don't have
the data to back it up.

Proof me wrong!

-- 
Cheers,

David

