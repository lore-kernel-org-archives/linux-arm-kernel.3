Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33994CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HigbfdhjwD2UMz4gq5kN4d1TQ2vXtHCF+rIKePduGY=; b=CU/V1sj4gZtA9+hEse5yDgnZ9m
	C8IPrabfJNBB+H0nrujEUd1zaOPihtUz3eoSeKmm0aKpmCj47RXqyPhEsz9d6RRXRtpXLGD+xuHd6
	IpfsuoGSpZswbGCiOQFS9baYWKjGMFrPFJuvDgYmn3K9//X7d5+CC4SajmN4WEMMW8EUpEPT/bjyr
	Pn973MQr8hug6lJE7WHks6xLmAYZ1bHx67rBRCPxCc9ZXQS5e++fC3sO3utChb7+CJEHFLq604oa8
	vZLqnevTt7bDLa/NkfYrlfF8YEMm3I92MoVhMoaOyCsOSj5tV3Wnhe9d3GUr4/FmrAqvM6FYG+tIR
	8urguVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P2o-0000000Hamb-1wlK;
	Wed, 24 Sep 2025 12:56:26 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P2m-0000000HajI-0OhL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:56:25 +0000
Message-ID: <87bc9c70-a464-4990-947a-faacd4959595@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758718581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HigbfdhjwD2UMz4gq5kN4d1TQ2vXtHCF+rIKePduGY=;
	b=Ntp/hWrrKFsBbDV2r+8W5nmoNNCDxDHPUgfKBqzrHXJvbdDhASAGZkRvJjuvLw/MyMZrBg
	f14jn2QyB4KtB8LXtGNYUNpgyHfKf7umVHoBv/lbtqjESmXAbb2wjPnXijYaFqRXcCV2T8
	4KHr6uA7MfTwsFQW8R8GBt/DEV3D3+Q=
Date: Wed, 24 Sep 2025 20:55:16 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: mte: Do not flag the zero page as PG_mte_tagged
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Gergely Kovacs <Gergely.Kovacs2@arm.com>, Will Deacon <will@kernel.org>
References: <20250924123528.1536835-1-catalin.marinas@arm.com>
 <c07073f2-96b7-4044-94e2-b41a2f8ca633@linux.dev>
 <8006c8c3-8e62-47c2-9d0d-9c7183dcdcf9@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <8006c8c3-8e62-47c2-9d0d-9c7183dcdcf9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_055624_536373_DF668143 
X-CRM114-Status: GOOD (  10.73  )
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



On 2025/9/24 20:49, David Hildenbrand wrote:
> On 24.09.25 14:48, Lance Yang wrote:
>>
>>
>> On 2025/9/24 20:31, Catalin Marinas wrote:
>>> Commit 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to the
>>> zero page") attempted to fix ptrace() reading of tags from the zero page
>>> by marking it as PG_mte_tagged during cpu_enable_mte(). The same commit
>>> also changed the ptrace() tag access permission check to the VM_MTE vma
>>> flag while turning the page flag test into a WARN_ON_ONCE().
>>>
>>> Attempting to set the PG_mte_tagged flag early with
>>> CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled may either hang (after commit
>>> d77e59a8fccd "arm64: mte: Lock a page for MTE tag initialisation") or
>>> have the flags cleared later during page_alloc_init_late(). In addition,
>>> pages_identical() -> memcmp_pages() will reject any comparison with the
>>> zero page as it is marked as tagged.
>>>
>>> Partially revert the above commit to avoid setting PG_mte_tagged on the
>>> zero page. Update the __access_remote_tags() warning on untagged pages
>>> to ignore the zero page since it is known to have the tags initialised.
>>>
>>> Note that all user mapping of the zero page are marked as pte_special().
>>> The arm64 set_pte_at() will not call mte_sync_tags() on such pages, so
>>> PG_mte_tagged will remain cleared.
>>>
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Fixes: 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to 
>>> the zero page")
>>> Reported-by: Gergely Kovacs <Gergely.Kovacs2@arm.com>
>>> Cc: <stable@vger.kernel.org> # 5.10.x
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Lance Yang <lance.yang@linux.dev>
>>> ---
>>>
>>> For reference, discussion on page merging here:
>>>
>>> https://lore.kernel.org/r/aNKJ5glToE4hMhWA@arm.com
>>
>> Cool. LGTM.
>> Acked-by: Lance Yang <lance.yang@linux.dev>
> 
> 
> Likely you can provide even a Tested-by? Just saying :)

Right, so:
Tested-by: Lance Yang <lance.yang@linux.dev>

