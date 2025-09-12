Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjxju66cdgbuLH84lLr1f0aB2LRRyXTtvk+w4J2qi2Q=; b=ethHkxLu/f7VJ+StGXpT/Yh6Q+
	wzXNitTo6P86Xrhn/XBfDHUgT83sBbo9jVTVuhTPcw40uWkl81n0EoVAQZlnsfbE+SsAOH9doHGxb
	M/28FuMY2Ce5qcwdDr5SBKs2sf8KPU97dhjk4PE66yKLrsgXAWwGhygXHg3xTyCE5mCRpHFmE3gdd
	aNByKF2T3GO4qbCjqjjWzzUcRtGSJ1Jfih3FIRCYZYPsMUmWHW26dXdj7hj6oxxNndWfPBr8stG//
	GA8qKlF4TIeoftZLVOjfva+kHr5YJqJe3MY/qozeeVjlOnZmXeg32W2v0alwga2Zs+/2PgofyCrKs
	D2jgEu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5IV-0000000A5w1-3FEP;
	Fri, 12 Sep 2025 15:02:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5IR-0000000A5ul-3vyf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:02:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD5812FC;
	Fri, 12 Sep 2025 08:02:34 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 558333F694;
	Fri, 12 Sep 2025 08:02:36 -0700 (PDT)
Message-ID: <f9b0bf10-a531-484e-9679-08ec25ceb444@arm.com>
Date: Fri, 12 Sep 2025 17:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
 <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
 <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
 <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_080244_105334_BC2CB6B1 
X-CRM114-Status: GOOD (  22.17  )
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

On 12/09/2025 16:25, David Hildenbrand wrote:
>
>>
>> But I do not really expect it ever, since arch_enter_lazy_mmu_mode_pte()
>> is only to be called in PTE walkers that never span more than one page
>> table and follow the pattern:
>
> Well, the cover letter here states:
>
> "Unfortunately, a corner case (DEBUG_PAGEALLOC) may still cause
> nesting to occur on arm64. Ryan proposed [2] to address that corner
> case at the generic level but this approach received pushback; [3]
> then attempted to solve the issue on arm64 only, but it was deemed too
> fragile."
>
> So I guess we should support nesting cleanly, at least on the core-mm
> side.

Nesting remains a rare occurrence though. I think it would be plausible
to require this new interface to be used in a region where no nesting
can occur, just like pause()/resume().

In fact, I think this is a requirement if we go for the approach we have
been discussing, because nested enter()/leave() calls are not meant to
call arch_enter()/arch_leave(), and I really wouldn't want to use a
different logic for this variant.

>
> I guess we could start with saying "well, s390x doesn't fully support
> nesting yet but doing so just requires changing the way we manage this
> per-nesting-level state internally".
>
> s390 is trying to do something different than the other archs here, so
> that naturally concerns me :)
>
> But if it's really just about forwarding that data and having s390
> store it somewhere (task_struct, percpu variable, etc), fine with me. 

Yes I think this is fine, with the restriction above. The extra
arguments are directly forwarded to arch code and otherwise ignored by
core code, and unless the arch defines some __HAVE_ARCH... or CONFIG,
the extended interface falls back to regular enter()/leave().

- Kevin

