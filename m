Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4473AFB5EA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 02:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPCYiL0SJ0HcNfxq3puv5GUglVzy0Ba/jOg8Z+huBBM=; b=T5AMsuLlobVzBxk5008KLoxcQ0
	yMh2vYHRdROoYgY9OjBc6llTQ2kU/G0xHWU9wbQlV+shnbvG3esrPc0U1xDp2BPa9qJgbQSA2iIYp
	fhlNxe1/3QJNRgle0oTE50sxKqh2IzPfCyi5ckYcQNDKpd9l3jE49mCKRiYUounScO2lDqWIRECVf
	8o/nugwqR4mVYic1IcF6zRBrU6u5QP+7x3XdiQpwmgLaJvazWjhhOKZmkWzu3FQoXi52rgunZDK/Z
	sY4BdBH0c289MPCDgf4VRiCmDFNg358IagmZVlMWx/UzpFUfrfVefuafZLIJdpTdwqgFBRpf0Gp44
	tL66FCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KSQ-00000005GSd-2XKn;
	Tue, 17 Mar 2026 02:46:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2KSN-00000005GRC-1De1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 02:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73A7A1476;
	Mon, 16 Mar 2026 19:46:43 -0700 (PDT)
Received: from [10.164.18.71] (unknown [10.164.18.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A0293F7BD;
	Mon, 16 Mar 2026 19:46:47 -0700 (PDT)
Message-ID: <3dc3f358-7f4a-4950-b8f7-f3b3c284166b@arm.com>
Date: Tue, 17 Mar 2026 08:16:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] arm64: Clear VTCR_EL2 in __init_el2_stage2()
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260313053857.1277828-1-anshuman.khandual@arm.com>
 <abPgAi2oDd_jFK_s@J2N7QTR9R3>
Content-Language: en-US
In-Reply-To: <abPgAi2oDd_jFK_s@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_194655_404320_8F730985 
X-CRM114-Status: GOOD (  19.80  )
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

On 13/03/26 3:29 PM, Mark Rutland wrote:
> On Fri, Mar 13, 2026 at 05:38:57AM +0000, Anshuman Khandual wrote:
>> Clear VTCR_EL2 along with VTTBR_EL2 register in __init_el2_stage2(), which
>> ensures that MMU stage-2 translation remain disabled.
> 
> As Marc noted, that's not true -- whether stage 2 is enabled is governed
> entirely by HCR_EL2.VM.
> > The only reason to initialize VTCR_EL2 here would be if some field in
> VTCR_EL2 applies when stage 2 is *disabled*.

Understood. Something similar to VTTBR_EL2.VMID field which
gets into tagged TLB entries for EL0/EL1 translation regime
even when stage-2 is not enabled via HCR_EL2_VM.

But wondering if VTTBR_EL2.VMID gets cleaned up should not
it also be followed by a "tlbi vmalls12e1 --> dsb --> isb"
sequence to clear existing stale TLB entries ?

> 
>> Although clearing out VTTBR_EL2 probably should have been sufficient
>> but adding VTCR_EL2 improves overall safety.
> 
> It's unhelpful to send patches like this with unclear or non-existent
> rationale, and vague statements about what the patch might do. Was there

The commit message could have been more detailed and explicit
about its rationale. Although the intent here was to ensure
improved safety during S2 MMU context initialization.

> some specific reason to send this? e.g.
> 
> * Did you have any specific reason to believe that setting some field in
>   VTCR_EL2 was necessary? e.g. is there some misleading documentation,
>   or comment elsewhere in the kernel?
> 
> * Are you trying to fix some problem you've encountered, but haven't
>   managed to debug?
> 
> * Was this purely from inspection?

This was from code inspection while navigating S2 MMU context
initialization and management.

> 
> Mark.
> 
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oupton@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/el2_setup.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index 85f4c1615472..2c88033591bb 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -189,6 +189,7 @@
>>  /* Stage-2 translation */
>>  .macro __init_el2_stage2
>>  	msr	vttbr_el2, xzr
>> +	msr	vtcr_el2, xzr
>>  .endm
>>  
>>  /* GICv3 system register access */
>> -- 
>> 2.30.2
>>


