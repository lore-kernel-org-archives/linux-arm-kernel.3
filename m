Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FA3CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTbsn9ueX//BY69AI+6lqPyl2zCJvGI1tcc+SkL1r0Q=; b=4LhjL58V3Hij0LIC8FjOEWTsyl
	aCFyXyRRllU03LrznJ/l+6taUP6zc/3vqsquuQ1PzTuv3Nl1lNIm78uaQuCSpq9WY8estAZReHW27
	hoPAU8JM4L65wyGJE3ptQYQN1hlGM3pGzpFRVjCEHj0kPpoVoLh6RySMKkJV9D87m51yeCWhKMGFG
	+4ywYzRw/43fu6Z+qTEcY099zcmPcIcqoGuWwSh3SJOAvtaQQ2GXLBkt4cyTfGMS2MgTEjbcTGzab
	51obEuVcNedFX3R75jaInGOaGqlTurpBFiBdjtDIZd/3jREuuO0TnP8lYCCQaZaCmLLy8ufkkt8YM
	pqstziwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWbm-0000000FRM2-1OLu;
	Mon, 08 Sep 2025 07:48:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWMP-0000000FJle-11Vt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:32:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F1201692;
	Mon,  8 Sep 2025 00:32:10 -0700 (PDT)
Received: from [10.57.58.69] (unknown [10.57.58.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2713F63F;
	Mon,  8 Sep 2025 00:32:12 -0700 (PDT)
Message-ID: <16a63f8a-fe9f-4a65-be45-7260858734bd@arm.com>
Date: Mon, 8 Sep 2025 09:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/xen: support nested lazy_mmu sections (again)
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-5-kevin.brodsky@arm.com>
 <d3adc2a0-5888-411e-ac7c-9df45e3389c9-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <d3adc2a0-5888-411e-ac7c-9df45e3389c9-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_003221_333663_C0773642 
X-CRM114-Status: GOOD (  13.66  )
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

On 05/09/2025 17:48, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:33PM +0100, Kevin Brodsky wrote:
> ...
>> -static void xen_enter_lazy_mmu(void)
>> +static lazy_mmu_state_t xen_enter_lazy_mmu(void)
>>  {
>> +	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
>> +		return LAZY_MMU_NESTED;
>> +
>>  	enter_lazy(XEN_LAZY_MMU);
>> +	return LAZY_MMU_DEFAULT;
>>  }
>>  
>>  static void xen_flush_lazy_mmu(void)
>> @@ -2167,11 +2171,12 @@ static void __init xen_post_allocator_init(void)
>>  	pv_ops.mmu.write_cr3 = &xen_write_cr3;
>>  }
>>  
>> -static void xen_leave_lazy_mmu(void)
>> +static void xen_leave_lazy_mmu(lazy_mmu_state_t state)
>>  {
>>  	preempt_disable();
>>  	xen_mc_flush();
>> -	leave_lazy(XEN_LAZY_MMU);
>> +	if (state != LAZY_MMU_NESTED)
>> +		leave_lazy(XEN_LAZY_MMU);
> Based on xen_enter_lazy_mmu(), whether this condition needs to be
> executed with the preemption disabled?

AFAIU xen_mc_flush() needs preemption to be disabled. I don't think
{enter,leave}_lazy() do, but this patch doesn't introduce any change
from that perspective. I suppose it doesn't hurt that
xen_leave_lazy_mmu() calls leave_lazy() with preemption disabled.

> Or may be this_cpu_read(xen_lazy_mode) + enter_lazy(XEN_LAZY_MMU)
> should be executed with the preemption disabled?

Adding another this_cpu_read(xen_lazy_mode) in xen_enter_lazy_mmu()
shouldn't change the situation, i.e. preemption should still be safe. If
preemption occurs in the middle of that function,
xen_{start,end}_context_switch() will do the right thing to save/restore
xen_lazy_mode.

- Kevin

