Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64127FA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVsBs/Sg/FKmH5g1umI6qiAPrsA8d/ykaWlyZO4LU5Y=; b=R7Z8VMhwahyka3+XU3GTaDbVoT
	JdpDpRgso/oOLwXTGHMMc9k84BAGhvnuMfyGM2Z5DoRESST5ZQZVJbmURw35ujSHJuGwJ4SYyZUcl
	0ZIWe+nZEmTy7YikxNk4HiiH+BUtzkhGtn1E2Noaq6lIXKwEAgYx6AtQhSrBVJm7nRZ3tSWXFhKGn
	nkVm34+gFkzewf8oqcMCxyWVoVOYjotO26G7NV8Pi0tGP4f0Ebx3xOUOJrHEDFOwceNDfmv+6sBp6
	Djy5K7LOxBJG/eejF/2mcGU24040q+rM2RE7e6LeY3K2wC0M/txRv3SsgGELda+YPmeAH6CnAtcNe
	WVN0Eh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbg0e-00000008M0T-2HZV;
	Fri, 02 Jan 2026 14:20:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbg0a-00000008Lze-2oC9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:20:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F86C497;
	Fri,  2 Jan 2026 06:19:57 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B76A3F63F;
	Fri,  2 Jan 2026 06:20:01 -0800 (PST)
Message-ID: <99d00830-bca5-4734-be56-8c8b310574ea@arm.com>
Date: Fri, 2 Jan 2026 14:20:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/13] arm64: mm: Implicitly invalidate user ASID based
 on TLBI operation
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-4-ryan.roberts@arm.com>
 <20251216180118.00005085@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251216180118.00005085@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_062004_758823_CB2A636B 
X-CRM114-Status: GOOD (  12.48  )
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

On 16/12/2025 18:01, Jonathan Cameron wrote:
> On Tue, 16 Dec 2025 14:45:48 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> When kpti is enabled, separate ASIDs are used for userspace and
>> kernelspace, requiring ASID-qualified TLB invalidation by virtual
>> address to invalidate both of them.
>>
>> Push the logic for invalidating the two ASIDs down into the low-level
>> tlbi-op-specific functions and remove the burden from the caller to
>> handle the kpti-specific behaviour.
>>
>> Co-developed-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 27 ++++++++++-----------------
>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index c5111d2afc66..31f43d953ce2 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
> 
>> +#undef __tlbi_user
>>  #endif
>> -
> Hi Ryan,
> 
> It's trivial Tuesday so... Unrelated white space change.

Thanks, will fix!

> 
>>  #endif
> 


