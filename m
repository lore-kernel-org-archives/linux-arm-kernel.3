Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705FFC44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 04:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQIaw6RUIl9sIBDtTmFb37A91uvQrFJH4fhuTcF8/Xg=; b=OUNr09grNd+DZ6XsOKtBuLAdfV
	keQ8XbJpoW6VsRe8gCBIly44OdCQrTM076d76HLmbC9LDBkbmqiJvyAzjVqet35JjV+IBujt8g3+l
	XQVbF57cdjMdSUZVJCTeysE+CDSHF6nKKSPpBiz6knBsFxffB7BtNuMjsOpCiXO9WvDEkZ7zSzMNf
	dLKIl0yoOgrNzgZ48zGSaJ29Vmb8TZOjt2D3MvD+4MtmlSGS19m+aC3T3OXO+5sUk28TS0HSUw7s+
	CT/NZQ0Pafn7jcwr6K/W6EPDsSr4oyGDJE0yYY97JbRmFc8GA70LnYeIEJRRYQfjIfSXtdomQsyQE
	3vB4lD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOe2-0000000AtI5-2RTP;
	Wed, 22 Jul 2026 04:33:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOdz-0000000AtHZ-24wf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 04:33:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9867152B;
	Tue, 21 Jul 2026 21:33:11 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00E363F86F;
	Tue, 21 Jul 2026 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784694796; bh=qUwOyYyxJlbMFmKAIAJ1m806FYR7SWozC8Yg9pfLJo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J8StVHGQbtg0VuqzhPoahZpWhk3VEW2Mz09ov6/YpK0U9xNEaJP1SMI4FmTGve2Bn
	 QM1KpqpA8kfKdVYel3jLY3MRJe/jEQ/78fiS12mJC5DaucwegF2PT1QHl7fPSxpQAf
	 vDWwsyVfBfFS2O1trdUQ6CxFX2XwDPaJhRfGK+z0=
Message-ID: <4bb234f7-5f3a-452d-92dd-a1e62b6f39aa@arm.com>
Date: Wed, 22 Jul 2026 10:03:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
To: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, catalin.marinas@arm.com,
 kernel-team@android.com, riel@surriel.com, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
 nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
 pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
 jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20260703114202.365553-1-dev.jain@arm.com>
 <178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
 <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_213319_864369_73582772 
X-CRM114-Status: GOOD (  21.65  )
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



On 22/07/26 2:06 am, Andrew Morton wrote:
> On Tue, 21 Jul 2026 18:18:38 +0100 Will Deacon <will@kernel.org> wrote:
> 
>> On Fri, 03 Jul 2026 11:41:53 +0000, Dev Jain wrote:
>>> There are various places which use ptep_get() to get the pte entry
>>> corresponding to a hugetlb folio. Some arches (like s390) have special
>>> handling to compute the pteval, so they provide huge_ptep_get(). Use this
>>> helper consistently.
>>>
>>> Additionally, some code paths may provide huge_ptep_get with an unaligned
>>> address. This is a problem on arm64 (I checked other arches and it looks
>>> fine for them), which is fixed in patch 1. The fix is made to be
>>> to huge_ptep_get() - that is wider churn and we can do that later.
>>>
>>> [...]
>>
>> Applied first patch to arm64 (for-next/fixes), thanks!
>>
>> [1/6] arm64: make huge_ptep_get handled unaligned addresses
>>       https://git.kernel.org/arm64/c/9175a8c7cfe88
>>
>> I'm hoping Andrew can drop this from the mm tree to avoid a duplicate,
>> but I didn't hear back yet and I'd like to land the fix.
> 
> I can redo Dev's series to omit [1/6].  The patches apply that way, but
> there might be build-time or runtime issues running the other patches
> without [1/6] present, haven't looked.
> 
> Also, review indicates that the changelog requires updating
> (https://lore.kernel.org/all/2b9d60a2-8698-46b0-80ae-b8747a66a85b@kernel.org/)
> and I believe that Dev plans to do that.

Oh I was banking on you to do that : )

@Will if you could edit the commit message with the following userspace visible
effect:

"On systems where CONT_PTES != CONT_PMDS (meaning page size is 16K), we could collect
excess a/d bit state, meaning extra work for the kernel. Even worse, we may iterate
beyond the PTE table and dereference a garbage ptep pointer to access physical
memory we don't own. Since the ptep pointer is a linear map address, we may run off
the end of the linear map, dereference a VA not mapped into the kernel pgtables and
cause kernel panic."

> 
> IOW, it would be better to carry this in mm.git with your ack.
> 
> Do you plan to upstream this in 7.2-rcX?  If so then I can hang onto
> this patch until it appears in mainline.  Or something.


