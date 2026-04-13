Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAD3F34C5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JhUja+jY7Hvs14nTFQKfonq29ce0Ud13IFze0Y80M0=; b=nsF28I3pah0Z2nAa+aEqfVBftO
	yzbDkKvbWE7ecVG2GQpVtxB8Y2vIpaD1II5oSJ8GLSgbxk4yCd8/JtAoA3A1VgR+zUEgD8o+k9zMa
	/VMMOOEEZnKgVQEl0x4IaAWaV21RuMaHJpFI2cGWDqqF5uNscM+NL2nwsbI+FrMtPajxvuCWL81jo
	6dsXFei5SB6LmR+w3GQAM3OEXgNvuMJ9wrOk0nH2FJxytcjlSHDSzwvNfhuu0pM1z6gHxg2JeEvZT
	XLFpOh1w7grYCqAVPHS3ElxXY02l4JyWdvZsEvRY85JeXk/fcTRdpio+Ni1E26amCA455RfrETD0e
	X4YPwHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIjc-0000000FuTy-2Cmx;
	Mon, 13 Apr 2026 14:57:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCIjZ-0000000FuTO-1yAz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32BCE32F9;
	Mon, 13 Apr 2026 07:57:46 -0700 (PDT)
Received: from [10.57.62.88] (unknown [10.57.62.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBBE43F641;
	Mon, 13 Apr 2026 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776092271; bh=6JhUja+jY7Hvs14nTFQKfonq29ce0Ud13IFze0Y80M0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6VNZfs0a1qju11zbgRgB8TIewKUGm0YuGrXo3YGW2Ykr8aKPTMCRtDpT1c7RmAOM
	 Mgj1mtBgLT0dI5YSEbwsqSHB6nV90OLLCu7JIsmSNkSV8m75E7uj7mLaQvzeLRo8LP
	 lH10czl6YjEmHqbLwsdGW9RTPIeo8XaYIJb232SE=
Message-ID: <315131b7-237b-4705-ba84-e03a484128da@arm.com>
Date: Mon, 13 Apr 2026 16:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
References: <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com> <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com> <adTPFrlVCEt-hioX@arm.com>
 <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com> <adTh8d9k3y5ybemL@arm.com>
 <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com> <adfDoatH8hj6zN7_@arm.com>
 <07054475-6b07-4b19-a393-cbe037adef8b@os.amperecomputing.com>
 <adfw_hNDsIWwSAIv@arm.com>
 <e4682b9a-9c18-44c5-a892-b12ce4745474@os.amperecomputing.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <e4682b9a-9c18-44c5-a892-b12ce4745474@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_075753_649676_F2722F33 
X-CRM114-Status: GOOD (  17.43  )
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

On 10/04/2026 01:08, Yang Shi wrote:
> On 4/9/26 11:33 AM, Catalin Marinas wrote:
>> On Thu, Apr 09, 2026 at 09:48:58AM -0700, Yang Shi wrote:
>>> On 4/9/26 8:20 AM, Catalin Marinas wrote:
>>>> On Thu, Apr 09, 2026 at 11:53:41AM +0200, Kevin Brodsky wrote:
>>>>> What would make more sense to me is to enable the use of
>>>>> BBML2-noabort
>>>>> unconditionally if !force_pte_mapping(). We can then have
>>>>> can_set_direct_map() return true if we have BBML2-noabort, and we no
>>>>> longer need to check it in map_mem().
>>>> Indeed.
>>> I'm trying to wrap up my head for this discussion. IIUC, if none of the
>>> features is enabled, it means we don't need do anything because the
>>> direct
>>> map is not changed. For example, if vmalloc doesn't change direct map
>>> permission when rodata != full, there is no need to call
>>> set_direct_map_*_noflush(). So unconditionally checking
>>> BBML2_NOABORT will
>>> change the behavior unnecessarily. Did I miss something?
>>>
>>> I think the only exception is secretmem if I don't miss something.
>>> Currently, secretmem is actually not supported if none of the
>>> features is
>>> enabled. But BBML2_NOABORT allows to lift the restriction.
>> Yes, it's secretmem only AFAICT. I think execmem will only change the
>> linear map if rodata_full anyway.
>
> Yes, execmem calls set_memory_rox(), which won't change linear map
> permission if rodata_full is not enabled.

That is a good point, AFAICT set_direct_map_*_noflush() are only used by
execmem and secretmem. excmem only modifies the direct map if
rodata=full, so the proposed change would only be useful for secretmem.

The current situation with execmem is pretty strange: if rodata!=full,
but another feature is enabled (say kfence), then set_memory_rox() won't
touch the direct map but we will still use set_direct_map_*_noflush() to
reset it (directly or via VM_FLUSH_RESET_PERMS). Checking BBML2-noabort
in can_set_direct_map() would make these unnecessary calls more likely,
but it doesn't fundamentally change the situation.

It's also worth considering the series unmapping parts of the direct map
for guest_memfd [1], since it gates the use of
set_direct_map_*_noflush() on can_set_direct_map().

I think it makes complete sense to enable secretmem and the guest_memfd
use-case if BBML2-noabort is available, regardless of the other
features. The question is: are we worried about the overhead of
needlessly calling set_direct_map_*_noflush() for execmem mappings? If
so, it seems that the right solution is to introduce a new API to check
whether set_memory_ro() and friends actually modify the direct map or not.

- Kevin

[1] https://lore.kernel.org/lkml/20260317141031.514-1-kalyazin@amazon.com/

