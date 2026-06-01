Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0009FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcWE6mDbZONHA9UBQ7OVFkxGgaAMM1rGCH/MHcIvc3U=; b=drXCytn0ZFyVZxcL7wouU+aN6H
	Oypxeu0fwLc69U3lZx5b2psexBsB26gV2jTlAk7frirbopF3XbQ4eWNoMUvpQjKzfs/SFbod6E/DW
	mor2ZHcIvkGfI5hEMRTHkmh8QrtCVitomne/sDjKfIXUyF22euRRrwRcJfWWinmWUU9tQWbzafDBO
	hYJtEvnGDh52K+wzE8wcCLHPgUcfyZmccl+RQkY0y+LBpPCbq2T0bCSpX17ocYKwYfxZWOY9rKgH9
	4SqJwlaxfGKg73v3y1ry9HIbJDPeJwdIAzkPcVtjfcNjyu48aieTDWz0wO4an2iXcwQaD5aU3mhko
	2vA9GDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvKD-0000000A9XH-3WwT;
	Mon, 01 Jun 2026 05:36:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvKB-0000000A9Wq-0Up9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 05:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723D11E8D;
	Sun, 31 May 2026 22:36:24 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 644843F905;
	Sun, 31 May 2026 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780292189; bh=BXihrI+kDpZcwsjIhEFPnSR9hYiTEZguWIRQRr0syf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vm2kSx94I5qkogPVURWrrhH7aXHNfLmUGrxjiD+wnWosJeMfjbh5y2H7ia0qhyyQG
	 ugqsgzAcfZSIg2Dw6IILnixHWf73Cv9uOSh+8NxrMK4tlJxUtvIMoprfHWx+JwX8Fr
	 iXiG6LVFDVIPWd/sjZBPtJitP/i+ldzWRllI02oY=
Message-ID: <fc7e1e8b-a0fd-4d11-8056-cc9664cdf45e@arm.com>
Date: Mon, 1 Jun 2026 11:06:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 13/14] arm64/mm: Add an abstraction level for tlbi_op
To: Linu Cherian <linu.cherian@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-14-anshuman.khandual@arm.com>
 <37917d56-ae26-4789-ac4c-15f8ee12398b@arm.com>
 <ahkP7IWLX-0QCoul@a079125.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <ahkP7IWLX-0QCoul@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_223631_204773_F651B898 
X-CRM114-Status: GOOD (  12.32  )
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



On 29/05/26 9:32 AM, Linu Cherian wrote:
> Hi Ryan,
> 
> On Wed, May 27, 2026 at 03:50:10PM +0100, Ryan Roberts wrote:
>> On 13/05/2026 05:45, Anshuman Khandual wrote:
>>> From: Linu Cherian <linu.cherian@arm.com>
>>>
>>> With FEAT_D128, a new instruction aka TLBIP is being introduced for the TLB
>>> range operations which has an argument size of 128 bit.
>>
>> nit: TLB range operations -> TLBI-by-range operations ?
> 
> Ack.
> 
>>
>>>
>>> Add an abstraction level to void (*tlbi_op)(u64 arg) helpers to support the
>>> D128 variations when applicable.
>>>
>>> No functional changes are introduced with this patch.
>>>
>>> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>  arch/arm64/include/asm/tlbflush.h | 70 ++++++++++++++++---------------
>>>  1 file changed, 37 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>>> index c0bf5b398041..361d74ef8016 100644
>>> --- a/arch/arm64/include/asm/tlbflush.h
>>> +++ b/arch/arm64/include/asm/tlbflush.h
>>> @@ -162,49 +162,53 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
>>>  
>>>  #define TLBI_TTL_UNKNOWN	INT_MAX
>>>  
>>> -typedef void (*tlbi_op)(u64 arg);
>>> +typedef u64 tlbi_args_t;
>>
>> nit: tlbi_args_t -> tlbi_arg_t ?
> 
> Ack.

Accommodated both the changes.

