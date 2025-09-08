Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D37CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8zaQx18vqAAVaqHky442ptbdchvJx4GvBOWo1UiFbw=; b=V3/9Kyibt3emAPGPiEr5gYp2e8
	fqdK3zu1JXzd2F35Civn/viWMuxT7wPEYChirXKViVo4FYMJNuc5AyCY0OBjnA9FINqCkklBT6TcY
	1as/xxJEkCv1qGe3aXjJMdWch/6QBIRBLMvCrU4rH59cIz54TyKRjaaqWPYJlgZgV3aHUElThybDh
	QgAlFMCexQ3FYRAZQbmeyMZiVVtmEhYDDNQhHAYkZtggsi5CxL4fvqsH8zD1fimMSzyclCS6G47JQ
	K4uQAup9XFebL/ZEuyc1fif9LvhRbMNl5vZEaPcH4vC3imDBMNN+y38MmhJUCi/ZDUPbx2KsPxgRD
	hy+lUrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgoN-00000001csy-0gPG;
	Mon, 08 Sep 2025 18:41:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdkM-00000000PNr-1HXq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:25:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 623132C46;
	Mon,  8 Sep 2025 08:25:24 -0700 (PDT)
Received: from [10.57.91.39] (unknown [10.57.91.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57CEF3F63F;
	Mon,  8 Sep 2025 08:25:30 -0700 (PDT)
Message-ID: <11f84d00-8c76-402d-bbad-014a3542992f@arm.com>
Date: Mon, 8 Sep 2025 16:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: mm: split linear mapping if BBML2
 unsupported on secondary CPUs
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-6-ryan.roberts@arm.com> <aLnFd1Hl_FSHZR3z@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLnFd1Hl_FSHZR3z@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_082534_441973_0F45AE14 
X-CRM114-Status: GOOD (  24.06  )
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

On 04/09/2025 17:59, Catalin Marinas wrote:
> On Fri, Aug 29, 2025 at 12:52:46PM +0100, Ryan Roberts wrote:
>> The kernel linear mapping is painted in very early stage of system boot.
>> The cpufeature has not been finalized yet at this point. So the linear
>> mapping is determined by the capability of boot CPU only. If the boot
>> CPU supports BBML2, large block mappings will be used for linear
>> mapping.
>>
>> But the secondary CPUs may not support BBML2, so repaint the linear
>> mapping if large block mapping is used and the secondary CPUs don't
>> support BBML2 once cpufeature is finalized on all CPUs.
>>
>> If the boot CPU doesn't support BBML2 or the secondary CPUs have the
>> same BBML2 capability with the boot CPU, repainting the linear mapping
>> is not needed.
>>
>> Repainting is implemented by the boot CPU, which we know supports BBML2,
>> so it is safe for the live mapping size to change for this CPU. The
>> linear map region is walked using the pagewalk API and any discovered
>> large leaf mappings are split to pte mappings using the existing helper
>> functions. Since the repainting is performed inside of a stop_machine(),
>> we must use GFP_ATOMIC to allocate the extra intermediate pgtables. But
>> since we are still early in boot, it is expected that there is plenty of
>> memory available so we will never need to sleep for reclaim, and so
>> GFP_ATOMIC is acceptable here.
>>
>> The secondary CPUs are all put into a waiting area with the idmap in
>> TTBR0 and reserved map in TTBR1 while this is performed since they
>> cannot be allowed to observe any size changes on the live mappings. Some
>> of this infrastructure is reused from the kpti case. Specifically we
>> share the same flag (was __idmap_kpti_flag, now idmap_kpti_bbml2_flag)
>> since it means we don't have to reserve any extra pgtable memory to
>> idmap the extra flag.
>>
>> Co-developed-by: Yang Shi <yang@os.amperecomputing.com>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> I think this works, so:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

> 
> However, I wonder how likely we are to find this combination in the
> field to be worth carrying this code upstream. With kpti, we were aware
> of platforms requiring it but is this also the case for BBM? If not, I'd
> keep the patch out until we get a concrete example.

Cortex-X4 supports BBML2_NOABORT (and is in the allow list). According to
Wikipedia [1], X4 is in:

 - Google Tensor G4 [2]
 - MediaTek Dimensity 9300/9300+ [3]
 - Qualcomm Snapdragon 8 Gen 3 [4]

And in each of those SoCs, the X4s are paired with A720 and A520 cores.

To my knowledge, neither A720 nor A520 support BBML2_NOABORT. Certainly they are
not currently in the allow list. So on that basis, I think the require the
fallback path, assuming these platforms use one of the X4 cores as the boot CPU.

[1] https://en.wikipedia.org/wiki/ARM_Cortex-X4
[2] https://en.wikipedia.org/wiki/Google_Tensor
[3] https://en.wikipedia.org/wiki/List_of_MediaTek_systems_on_chips
[4] https://en.wikipedia.org/wiki/List_of_Qualcomm_Snapdragon_systems_on_chips

Thanks,
Ryan


