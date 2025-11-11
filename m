Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62597CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+WmW7yNqD2aweWk296ozfzQ200USyv416afCxbmVnk=; b=FZHRZJ0UAVfiXOGT/PzlrOrfvY
	CgmYis261g7Ygp1w+Hj8mGuhMUfr2aopoUbBBnw/wT5IBMGv/Lm/VwW4bDxF0wWum9z6iXMt+xAaJ
	CAAkflYpXFgmRzIpmMeLgwB98huW7lDvme47yRTYIv34YJ6x/Be5FKxTqw+TxcJYl3dOGk7AOb/C6
	SoJJmncI7elWhyqGxICPWWSGVpI8QWNsW94KIN4rzes/rlKKS2bhBGInCaL31Q9okkNPyyvTxvqca
	UGxDmdNsEKjCxDAOV10qEgcxAaQHqIY1fL16XxMF2kPjS0IfE42pIiFG5YKKVGaEge3epKLR1VU7k
	XWvvcnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlIX-00000006uE0-3Sde;
	Tue, 11 Nov 2025 10:08:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlIV-00000006uDQ-1gmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:08:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACCFF2F;
	Tue, 11 Nov 2025 02:08:11 -0800 (PST)
Received: from [10.57.88.30] (unknown [10.57.88.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E443F63F;
	Tue, 11 Nov 2025 02:08:13 -0800 (PST)
Message-ID: <e2497863-8cbf-42b2-8f83-2c7b46fd1f47@arm.com>
Date: Tue, 11 Nov 2025 10:08:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
 <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_020823_486518_F60E4319 
X-CRM114-Status: GOOD (  16.25  )
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

On 10/11/2025 10:36, Kevin Brodsky wrote:
> On 07/11/2025 12:31, Ryan Roberts wrote:
>> On 29/10/2025 10:08, Kevin Brodsky wrote:
>>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>>> pgtable operations must be completed immediately. There should
>>> however be no need to leave and re-enter lazy MMU completely. The
>>> only part of that sequence that we really need is xen_mc_flush();
>>> call it directly.
>>>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> This looks functionally equivalent to me, so:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>> But I don't think this tidy up is strictly necessary for your series to work?
>> (perhaps I'll change my mind on that as I go through it).
> 
> I initially thought it might be, but in the end I think you're right -
> it should still work fine without this patch.
> 
> Still, I'd rather avoid unnecessary calls to arch_enter() and
> arch_leave() as it makes it harder to reason about what is called where.
> Namely, keeping them here means that a nested call to
> lazy_mmu_mode_disable() would cause arch_leave() then arch_enter() to be
> called - rather unexpected.
> 
> The only calls to arch_enter() and arch_leave() that are left after this
> series are the ones in <linux/pgtable.h> and the Xen context-switching
> logic (the one case where calling arch hooks directly is justified, see
> discussion on v3 [1]).

OK yeah, sounds reasonable.

> 
> - Kevin
> 
> [1]
> https://lore.kernel.org/all/390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com/


