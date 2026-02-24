Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19781E9B25F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCCbF7zHdk06kA7PRqjz5GJ0NMMsMNJZQgWKWakcSfQ=; b=W4JXg9lqdnzLBlNeSJoubKMOKn
	pk/pYzcMmomLQptCTL3V9VEqctTGpikBq/W4Q/rKee/+S6oU22V8Pw3jHBpWiETK9UFklGsMxuqdN
	n678ehq+FCHUltztQE3/jACzPTTnkp8RlybRT0JqgspcjdCOBKuwaP20sxIIoco4RLD6XBplyzLMl
	DJPewZIYhqDx295gWx5Vrf8wVMbpNgfFROeUahZkv0rnAY1aAmC+Ui8u2Gbh2ZobdSsbOI3UN2nPP
	p4hrCzpM42rgdGyIuQGs+MKHWSwJoHH7jmU8tswFy/5QIjd3UtgVvBQNTg7O3VvpIZaNLNPliMKfE
	BOxeo8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurhq-000000023a3-42n5;
	Tue, 24 Feb 2026 12:40:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurho-000000023ZG-3LiZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:40:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC973339;
	Tue, 24 Feb 2026 04:39:52 -0800 (PST)
Received: from [10.163.172.181] (unknown [10.163.172.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF7683F62B;
	Tue, 24 Feb 2026 04:39:53 -0800 (PST)
Message-ID: <99e06029-7738-4275-829d-6d96867785be@arm.com>
Date: Tue, 24 Feb 2026 18:09:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 04/16] perf/events: Replace READ_ONCE() with standard
 pgtable accessors
To: Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-5-anshuman.khandual@arm.com>
 <aZ14lUwuA86aiOH-@J2N7QTR9R3>
 <20260224104134.GW1395266@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260224104134.GW1395266@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_044000_885006_0AFAC967 
X-CRM114-Status: GOOD (  16.40  )
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



On 24/02/26 4:11 PM, Peter Zijlstra wrote:
> On Tue, Feb 24, 2026 at 10:08:21AM +0000, Mark Rutland wrote:
>> On Tue, Feb 24, 2026 at 10:41:41AM +0530, Anshuman Khandual wrote:
>>> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
>>> anyways default into READ_ONCE() in cases where platform do not override.
>>
>> For each of the patches where you make this sort of change, please
>> explain in the commit message *why* it is necessary to do this.
>>
>> IIUC the entire point of this is that in subsequent patches, arm64 will
>> need to use something other than READ_ONCE() for all pXX levels in order
>> to support D128 translation tables.
>>
>> Spelling that out in the commit message makes it much easier for
>> reviewers to see what's going on, and to focus any discussion/questions,
>> e.g. *why* won't READ_ONCE() work?
> 
> That, and only being sent *one* patch, I have no clue what the rest of
> them are doing. Didn't even get 0/n.
> 
> I hate people sending me just one patch; just send the whole series
> already.

Sorry about that. I normally gather emails from all individual patches
in the series while creating the Cc list for the cover letter, so that
every one receives the entire series regardless of the subsystem.

But this was the only patch that did not belong either to mm or arm64.
Hence some how missed adding your email. I have already sent the entire
series to your inbox.

