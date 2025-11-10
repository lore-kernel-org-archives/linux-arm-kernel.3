Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DBACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e61PmBuBpKPW0kEFbYkXrje4f08ptI1Bgty+XwFb8EM=; b=uU4WQCBe+lcJ2urofRFx4xzq4e
	+P2uUSBNH/nk6tCwIYIXZ+RYp3Hm7p323w4VApRomlQd35yCb4cY6tQVvUpbY2dE1PfIusLJekYcr
	eWb2RPfZYalbBBmU2aZMAkZz5p5n+OLprzuujrSdM9+/txXe6ExPPRYChyQ1wXdXMvVBevPyWyLD2
	iBlkls4XBmx0+Ju7eQN7adHpOTIc9kdy3u3mNo1ttV5TaSCeuOfZKyNCOrOkUhYLilzKzb4s/byGa
	0W0ReM0oyA2rhhF+o3Z2Cfb/KJJvlJQxQta+CMjjd84xFThNciE+J/yeXx6DruNSWPVv9oNtxnJP2
	dzZJYHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRn0-00000005Tld-2NBi;
	Mon, 10 Nov 2025 13:18:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRmx-00000005Tkl-2saD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:18:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B25497;
	Mon, 10 Nov 2025 05:18:22 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D493F3F63F;
	Mon, 10 Nov 2025 05:18:22 -0800 (PST)
Message-ID: <d0ce35ad-bfcd-496b-996d-17e59a1d5a73@arm.com>
Date: Mon, 10 Nov 2025 14:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB
 flush
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-2-kevin.brodsky@arm.com>
 <87qzud42n1.ritesh.list@gmail.com>
 <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
 <87cy5t4b0a.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87cy5t4b0a.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_051831_767005_694C77E8 
X-CRM114-Status: GOOD (  15.31  )
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

On 08/11/2025 00:35, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> [...]
>>
>>> With this analysis - the patch looks good to me. I will give this entire
>>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>>> let you know the results of that)!
>> That'd be very appreciated, thanks a lot!
>>
> I did give this patch series a run on Power10 with Hash MMU. I ran the
> following stress-ng tests and didn't observe any issues (kernel warnings) so far.
>
> stress-ng --all 0 -t 60s --perf -v --verify \
> --tlb-shootdown 0 \
> --fault 0 \
> --userfaultfd 0 \
> --fork 0 \
> --exec 0 \
> --memfd 0 \
> --numa 0 \
> --pkey 0 \
> --remap 0 \
> --vm 0 \
> --rmap 0 \
> -x swap,pagemove
> (Note not all options shown here will work with --verify)

That's great, many thanks!

> Let me know what else I can run for validation?
> Do you know of any specific tests for validation of lazy mmu feature?

I don't think there is - lazy MMU is not supposed to have any observable
effect, all we can do is exercise the paths that use it and check that
nothing explodes.

That said it wouldn't hurt to run the mm kselftests:

    make -C tools/testing/selftests/ TARGETS=mm

Thanks!

- Kevin

