Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF41C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4ZKConExH9t+sZf4SwZM6mks80+wm+m2CJUcgWA0BA=; b=0yzpvcbv972QEQPuWg7f/pCjIP
	1HlowmQ9Bo/k7CfnGCeo7IK4myVdOV68FQhsWg3KgbaDO7UMDnwIvrvlhO/v5iJd/od5fh9/6jWgZ
	7/GMuP/CRB6cgsJ5BtjxnD7izXFGfMGqjdt/mmyPKKksi76yzm+v/mqbBLrPxvB/cbfRmT2fKUhoc
	bl/0Ez38eHsJujKEudpR/yx4dsHjxn9IEQTV+SW2lXqrp5bEp5uSn8XaLXszBerYP2njKHmAM3HR3
	+bc2BWH7vFwqRv+a/50af2V0LA3tmF1pB2lqq7KNfvWu4ohYIxArKCZzxZt5eCPlgq4kOvOJbmIK4
	7SKWrw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCWv-00000001zv0-0pBy;
	Mon, 30 Jun 2025 11:18:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWC1N-00000001w5J-0THx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:45:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8E0B1F60;
	Mon, 30 Jun 2025 03:45:40 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A96E03F58B;
	Mon, 30 Jun 2025 03:45:52 -0700 (PDT)
Message-ID: <7eaee53b-d538-4991-addd-379a380b8ee2@arm.com>
Date: Mon, 30 Jun 2025 11:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
 <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_034557_190563_D366B2A1 
X-CRM114-Status: GOOD (  10.09  )
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

On 30/06/2025 04:33, Dev Jain wrote:
> 
> On 30/06/25 4:35 am, Andrew Morton wrote:
>> On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:
>>
>>> This patchset optimizes the mprotect() system call for large folios
>>> by PTE-batching. No issues were observed with mm-selftests, build
>>> tested on x86_64.
>> um what.  Seems to claim that "selftests still compiles after I messed
>> with stuff", which isn't very impressive ;)  Please clarify?
> 
> Sorry I mean to say that the mm-selftests pass.

I think you're saying you both compiled and ran the mm selftests for arm64. And
additionally you compiled for x86_64? (Just trying to help clarify).


> 
>>
>>> We use the following test cases to measure performance, mprotect()'ing
>>> the mapped memory to read-only then read-write 40 times:
>>>
>>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>>> pte-mapping those THPs
>>> Test case 2: Mapping 1G of memory with 64K mTHPs
>>> Test case 3: Mapping 1G of memory with 4K pages
>>>
>>> Average execution time on arm64, Apple M3:
>>> Before the patchset:
>>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>>
>>> After the patchset:
>>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
>> Well that's tasty.
>>
>>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>>> introduced by ptep_get() on a contpte block. And, for large folios we get
>>> an almost 74% performance improvement, albeit the trade-off being a slight
>>> degradation in the small folio case.
>>>


