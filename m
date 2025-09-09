Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B725ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LeUDwQ1TQcxoiiJ+B3yhPNPi07lHBnO96DM93lKFxs=; b=KLabbj7JLWV1nHXFCKM1G7Er9e
	4iuVVhfiEYRWHnMJWBDvBk/PaLzDF1XjVVl7RDmf0TGWlSz12z2Dx9qSf+nel2Uhe22QqJHAvy7ks
	GYoQz7m4+zvkujbNdYKuy5rOnDuIEXRyBZVtNzTPdGN0n0UHU/VzxTWAZWaCbWupVDFPdalHzQaRh
	D2UQ4DArGbtDJyXHWndZJ/ZxZCTW/VJ0/8KBFcaZTOhMP0gJYWAUVUZDKoZz+QBIs5e4rYk96YBVy
	MtkVuxnItgmHwnMvkpKnJh04UcuUqDfWSTRKN2VkxoZyE0GIWAzFg4TI+cAYiPhGgSa698xYK8uRb
	/8qMp+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21T-00000008wtw-0bH2;
	Tue, 09 Sep 2025 17:20:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvz84-00000007flz-1sFT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C94C1424;
	Tue,  9 Sep 2025 07:15:18 -0700 (PDT)
Received: from [10.44.160.77] (e126510-lin.lund.arm.com [10.44.160.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C5F63F66E;
	Tue,  9 Sep 2025 07:15:15 -0700 (PDT)
Message-ID: <f27a2684-6656-4eb0-8255-e7bc4811ce87@arm.com>
Date: Tue, 9 Sep 2025 16:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Juergen Gross <jgross@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <f6965a43-c299-4726-896e-6cccd0a23ae5@suse.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <f6965a43-c299-4726-896e-6cccd0a23ae5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_071528_601574_0F3E8BA8 
X-CRM114-Status: GOOD (  25.82  )
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

On 09/09/2025 12:57, Juergen Gross wrote:
> On 09.09.25 11:07, David Hildenbrand wrote:
>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>> [...]
>>>
>>> Note: it is difficult to provide a default definition of
>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>> that definition would need to be available in
>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>   #include there is very tricky due to the existing header soup.
>>
>> Yeah, I was wondering about exactly that.
>>
>> In particular because LAZY_MMU_DEFAULT etc resides somewehere
>> compeltely different.
>>
>> Which raises the question: is using a new type really of any benefit
>> here?
>>
>> Can't we just use an "enum lazy_mmu_state" and call it a day?
>>
>
> The comment about the "header soup" made me look into this problem:
>
> It seems some of the "#include <asm/paravirt.h>" instances in the code
> base can just be dropped.
>
> For the remaining cases I'd like to suggest a reorg of the related
> headers:
> Instead of having the non-paravirt definition in one header and the
> paravirt
> ones in paravirt.h, maybe it would be better to have only the paravirt
> generic definitions in paravirt.h and the specific functions in the
> header
> defining the non-paravirt variant. This would probably resolve the
> problem
> with the "soup", as paravirt.h wouldn't rely on so many other headers.
>
> I'm just preparing a patch doing the removal of the not needed
> includes, but
> I'd be willing to address the disentangling as noted above.
>
> Thoughts?

I don't know enough about these headers to express an informed opinion,
but it does sound like a useful cleanup. Do you think it would allow
<asm/paravirt_types.h> to include <linux/mm_types.h>? This is what we
would need to have a generic definition of lazy_mmu_state_t (which could
be overridden by defining some __HAVE_ARCH macro in <asm/mmu.h>).

- Kevin

