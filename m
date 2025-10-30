Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGsanynM+bveV70EQ4nqT1sLG5kUc3lKFttAynF/olU=; b=2cfTUETQfDHCB0a04bkZ2ffi/c
	TCGU3QGgMh+dZpQb6Ub2BFUckH7Wk/1LbzPOpq31O3m5bRT1xM6tUoZY+TDnq3ItbmYlrONeo9KaQ
	WykC5qvBDut9onWFnjNY5aybBNCsYFmlRWrBoH8Xy00ylIHSWP8yLA+dHZ6l1oy9E7kGneyCDDY28
	LlksXXZdw7DA0oJZ6hlIg9zIKjF5/WckVtVVdIp3i5U3a4eQevfhozB5qSkyNd1b3FCRMvcSBoVu0
	X5XQSWHHFXuT7wLWo26l8tHTl8K4xI6rvezwmjPqxg9+jm6anGntbTx99I7he9goJzCShyLRGMdtF
	PEiQW2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPu3-00000003zJP-0FTG;
	Thu, 30 Oct 2025 10:29:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPtz-00000003zIZ-2X4i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:29:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E08BE1EDB;
	Thu, 30 Oct 2025 03:28:56 -0700 (PDT)
Received: from [10.57.69.77] (unknown [10.57.69.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D363F66E;
	Thu, 30 Oct 2025 03:28:56 -0700 (PDT)
Message-ID: <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
Date: Thu, 30 Oct 2025 11:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032907_951736_53F35E56 
X-CRM114-Status: GOOD (  12.37  )
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

On 29/10/2025 17:41, Alexander Gordeev wrote:
> On Wed, Oct 29, 2025 at 10:09:04AM +0000, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +static inline bool in_lazy_mmu_mode(void)
>> +{
>> +	return current->lazy_mmu_state.active;
> Whether (nesting_level > 0) is more correct check?
> Otherwise, it returns false while in paused mode.

That's exactly the intention. Lazy MMU is disabled while paused. The
users of that helper want to know if lazy MMU is currently enabled (to
decide whether to batch updates for instance); whether this is because
we are paused or not in any lazy_mmu section (nesting_level == 0) makes
no difference.

> May be check both nesting_level and active and also introduce
> in_lazy_mmu_paused_mode() right away to avoid any confusion?

Can you think of any situation where a caller would specifically want to
know that lazy MMU is paused?

- Kevin

