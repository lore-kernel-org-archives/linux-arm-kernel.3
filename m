Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B456CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNz3Z9f2tJsQ5aZC7t1gAI6Kv7GBAdi6bR3npFQlL00=; b=yrD4W7SLeuprxkMyci3e6NmxhW
	AhBwSqArdYgkS6ZN6JCTdHE9xDaGPXA5i5lwZQ/h+xeK0yEl5HFp6ccTrxcakMkuSzOFusvrR8JXy
	wlZ2vt+XYXTez8n3ch+/rrS0SNX/zM9KFMhuuSTGZGnq8xRlYelC6rhrpb/CYEH2iHbrKr8NQzbhM
	Dyt5Ww+e8JwMZQrOVpAhbZqe7fJxX2a49RVg2R+/DbgDnvEMChV35IyiQJs73ZhqOL4UMqx+3wSnO
	A0e/mc8xkWxEDWnmJkXdLWx7Cawg6cd0x0zPA+YIluaC95dSdRFsLccqMUyp0dy4c13w9HSUz6z1M
	5d+XiMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz905-0000000GXIe-19JJ;
	Thu, 18 Sep 2025 07:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz902-0000000GXHc-1IOg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:24:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4DA1176C;
	Thu, 18 Sep 2025 00:24:02 -0700 (PDT)
Received: from [10.57.71.56] (unknown [10.57.71.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 111D83F66E;
	Thu, 18 Sep 2025 00:24:08 -0700 (PDT)
Message-ID: <ddc84d24-8bb6-48ca-9cab-cee8d4e0eca6@arm.com>
Date: Thu, 18 Sep 2025 09:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Move KPTI helpers to mmu.c
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250912073908.404924-1-kevin.brodsky@arm.com>
 <aMrVOmOro930Bgob@willie-the-truck>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aMrVOmOro930Bgob@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_002414_468655_737404AA 
X-CRM114-Status: GOOD (  19.56  )
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

On 17/09/2025 17:35, Will Deacon wrote:
> Hey Kevin,
>
> On Fri, Sep 12, 2025 at 08:39:08AM +0100, Kevin Brodsky wrote:
>> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
>> mmu.c without matching declaration in a header; instead cpufeature.c
>> makes its own declaration. This is clearly not pretty, and as commit
>> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
>> function signature") showed, it also makes it very easy for the
>> prototypes to go out of sync.
>>
>> All this would be much simpler if kpti_install_ng_mappings() and
>> associated functions lived in mmu.c, where they logically belong.
>> This is what this patch does:
>> - Move kpti_install_ng_mappings() and associated functions from
>>   cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
>> - Remove create_kpti_ng_temp_pgd() and just call
>>   __create_pgd_mapping_locked() directly instead
>> - Mark all these functions __init
>> - Move __initdata after kpti_ng_temp_alloc (as suggested by
>>   checkpatch)
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> v1..v2:
>> * Removed create_kpti_ng_temp_pgd() instead of making it a wrapper
>>   [Ryan's suggestion]
>> * Added Reviewed-by's.
>> ---
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Kees Cook <kees@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>  arch/arm64/include/asm/mmu.h   |  6 +++
>>  arch/arm64/kernel/cpufeature.c | 97 ----------------------------------
>>  arch/arm64/mm/mmu.c            | 96 +++++++++++++++++++++++++++++----
>>  3 files changed, 93 insertions(+), 106 deletions(-)
> Thanks, this looks fine to me. However, it conflicts with ceca927c86e6
> ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function
> signature") which landed after -rc1 so I'll either queue this late
> (after merging in for-next/fixes to for-next/core) or we can defer it to
> -rc1.

Ah yes, this patch is based on -rc5 so it depends on that commit (also
mentioned in the commit message above). Didn't realise it caused trouble
for merging!

> If we get to -rc2 and it's not in Linus' tree, then please repost
> because it means I forgot about it :)

Sure I'll prod you if I don't see it by then - I don't think I'll need
to repost a new version though, unless that code changes again in the
meantime.

- Kevin

