Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1E3C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9i4OYB+q7BpCsYObhysRPX8oFYfjOP1GPggNmlpjjEQ=; b=O3q3lVPCFVUfWX
	C4yy85Eu9eyGxD+7m2Lp0ozxzMn8RJJlYWj84FzQUlkjrWB6iNcZRsgmiL30Cg3p4OyP7UYn3g7y4
	CzuqioTldrAZNcF/tiN/qdCEhOVYdpNXMJnLTSRqAKk1/Y/ueyhb92x8z8xLx+6zkjU3QnGnxknVA
	rDVauISaSW/dLi1nIoUFCaTyFIiCmHP2jXbUdc5AdEtXdx6WLGEQ+Txy/rOnSWvC0No0BqZlHIa/V
	fZXM0dT7KTviBInnwNx0HkZSfv/bdZkYvIf+RLfiXXopLfbgDaWJ/Z8fPOlJkmdzuXf5gQhKQ+0MD
	ACBoAVTzlfbwf3FKQc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPVF-0000000APqv-2DZS;
	Thu, 30 Jul 2026 12:04:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPVC-0000000APpb-0lad
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:04:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FA501684;
	Thu, 30 Jul 2026 05:04:36 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D45B3F86F;
	Thu, 30 Jul 2026 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785413080; bh=94KvrpdqZCT41H1B9dUsZ2ZIG0PQ1N/78xwtbnNt9wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iMBGTocuJfn1iRKh3+xhufyOqq972tGhZvvKqJahwEe1iyFk7E4Jcnk9BB1ler2lW
	 FtJINy0uhHl2GNoIYbmEVuLrEVxYfIsL5WERGO593bQ+sAtgPdiMPzbOyF83IXhSId
	 qFuFdSZcqnnR7cixqtQxz3Z4vvGsbqaikdchNigo=
Message-ID: <53120347-2926-4d02-9e90-2c0c489b33bd@arm.com>
Date: Thu, 30 Jul 2026 13:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
To: Mark Rutland <mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <ea269924-b563-44b9-bdf3-31072ec93375@arm.com>
 <amsudrskKg6uOUSf@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <amsudrskKg6uOUSf@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_050442_317758_5D7AC6D9 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/30/26 11:59, Mark Rutland wrote:
> On Wed, Jul 29, 2026 at 03:25:52PM +0100, Vladimir Murzin wrote:
>> On 7/28/26 13:38, Mark Rutland wrote:
>>> +#define __VAL_PCPU_GPRS(pcp, off, addr)				\
>>> +	"("							\
>>> +		"(.L__gpr_num_" pcp  " << 0) | "		\
>>> +		"(.L__gpr_num_" off  " << 5) | "		\
>>> +		"(.L__gpr_num_" addr " << 10)"			\
>>> +	")"
>> Later in the patch, there is a comment stating that these registers
>> are not expected to overlap. I can also see that early-clobber
>> constraints are applied to the output registers later in the patch
>> series, so the code is correct.
>>
>> However, would it be possible to add assertions that detect register
>> overlap, perhaps something like:
>>
>> ".if (.L__gpr_num_" pcp "== .L__gpr_num_" off ") ||"	\
>> "    (.L__gpr_num_" pcp "== .L__gpr_num_" addr ") ||"	\
>> "    (.L__gpr_num_" off "== .L__gpr_num_" addr")"	\
>> ".error "inline asm registers overlap"			\
>> ".endif"						\
> That's a good idea. I've added the following:
> 
> | #define __ASSERT_PCPU_GPRS_UNIQUE(pcp, off, addr)                       \
> |         ".if ("                                                         \
> |                 "(.L__gpr_num_" pcp " == .L__gpr_num_" off ") || "      \
> |                 "(.L__gpr_num_" pcp " == .L__gpr_num_" addr ") || "     \
> |                 "(.L__gpr_num_" off " == .L__gpr_num_" addr")"          \
> |         "    )\n"                                                       \
> |         ".error \"PCPU GPRS overlap: {" pcp "," off "," addr "}\"\n"    \
> |         ".endif\n"
> | 
> | #define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)                       \
> |         __DEFINE_ASM_GPR_NUMS                                           \
> |         __DEFINE_ASM_GPR_ALIASES                                        \
> |         __ASSERT_PCPU_GPRS_UNIQUE(pcp, off, addr)                       \
> |         "       mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"   \
> |         "       strh    w" off ", " gprs "\n"                           \
> |         __KERN_ASM_CPU_OFFSET(off) "\n"
> 
> With that, we have enough ".L__gpr_num_" string concatenation that we
> should probably have:
> 
> | #define __GPR_NUM(r)		"(.L__gpr_num_" r ")"
> 
> ... so I'll go add a preparatory patches adding that and cleaning up
> existing usage.
> 
> Mark.
> 

Awesome!

Cheers
Vladimir

