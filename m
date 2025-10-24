Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF9ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFsntFKm3sLCSsUTazR6Zz09gRvrPjOBy+0/EZ6kZlE=; b=tnNo4mGbUL6X862PDr1kCqpLvP
	ZAHPHh0Ah6O2jyl9SPSKPnoN3i1YF9BluPWPZDUZsyRMp+il1BOpIIOPHS//wpTsmT4rYIoB1rJAL
	Mtgb3UES+ZZn6Np+1p3xdqUBbgSZyaP2TwavDzzeJ+f0rUl1YkwU7TmrgxVOfUxSCImrZHLR0UIDw
	1zxnz9qa7bLeGa/cTGart8w9TaaT5mlvZhYvuhOFwmZMiAlBDIHbOphTl7LEuqjd7C6YwF7WKCSpY
	4fLsxFP0uJrkzWhS/Ph+GAhm7EXQT+gwKB1BSLxzfWPCH72H0TC/uu7SF6LvZTpTv1pdVcbzcLeyS
	eAvpgjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJM1-00000009l73-3Ghv;
	Fri, 24 Oct 2025 15:05:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJLz-00000009l6Q-1DRn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:05:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D6E14BF;
	Fri, 24 Oct 2025 08:05:10 -0700 (PDT)
Received: from [10.57.67.38] (unknown [10.57.67.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519063F63F;
	Fri, 24 Oct 2025 08:05:10 -0700 (PDT)
Message-ID: <6ed9f404-9939-4e9f-b5aa-4253bef46df1@arm.com>
Date: Fri, 24 Oct 2025 17:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_080519_377169_7CF55D60 
X-CRM114-Status: GOOD (  15.42  )
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

On 24/10/2025 16:47, David Woodhouse wrote:
> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> We currently set a TIF flag when scheduling out a task that is in
>>> lazy MMU mode, in order to restore it when the task is scheduled
>>> again.
>>>
>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>> state when switching to the new task, instead of using a separate
>>> TIF flag.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>
>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>> folks.
>
> I know tglx has shouted at me in the past for precisely this reminder,
> but you know you can test Xen guests under QEMU/KVM now and don't need
> to actually run Xen? Has this been boot tested?

I considered boot-testing a Xen guest (considering the Xen-specific
changes in this series), but having no idea how to go about it I quickly
gave up... Happy to follow instructions :)

- Kevin

