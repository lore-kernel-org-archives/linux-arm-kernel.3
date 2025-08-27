Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FIZ5aJCiTKj3kPm7g09Z5KJppD3cqCl82AjidiHnlo=; b=BZhQpSaxgd5TYJYRdHD3/fhTuI
	GIjIAzNoYy2WGmOw/3zlW819unpmK96EH73z0Dqbtag5uLeNWZYOObtlNCr01aXw9rRX8w3w0q6LJ
	NlC+fjSRc+K3I5SYuBZt/vnrlqvfpEKrLxvJz7qv0EPofg76EFVsKWCSzN2zFBiPQ+Ob8mej6AjAn
	wLc1i0dAe5BX+AEZ43U4CKy93KhfYMNMt72d6KQhxDCQjaR1JMIQgr74342nELN/jknedJNM9qTxX
	3LHedg99dMLbINVOQKJRBxJf2G1ssshvtFGCTThZJvBA7KE6rNMHpbLdCRNnp9Nnb7AJOly3Ad5Gl
	mUW9+sLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKX3-0000000GPoM-0BQm;
	Wed, 27 Aug 2025 18:06:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIi4-0000000G8Ss-2N87
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 16:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2FIZ5aJCiTKj3kPm7g09Z5KJppD3cqCl82AjidiHnlo=; b=Kn5jP8ddL2jIrB8qMHSoYQD4ec
	bmfxD+yB6qFR0oyAL08msmDnOrlDdETS88rtoMYwGEj4VwFL6/pRquFkl08o7idRdCyr0/fPcHEGp
	VCS+wXPaEjnVLS5mm/SvIbw0gFsSyjOdy5TdlPGs+UGQ7w1+H1+q8U5BQ6X0cLizHUatpciLtczrS
	JxPGHtZdUBGqUv5PdTkYr0C91f5DSUckTjR9dJESQMxqiMXBoD6B3yLe+Fr5loATSE4fmQ1LkVxf6
	u3hFNzm7mG10cY2yleyAaehiPMO/wYKNRspeajS4xZtsJ1tOFBIT4N1q3lFvu3hjuRCxcdgSmVYaU
	TKp7XDkA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIi1-00000002T7N-1a6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C752B2720;
	Wed, 27 Aug 2025 09:09:02 -0700 (PDT)
Received: from [172.31.18.237] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CF663F738;
	Wed, 27 Aug 2025 09:09:05 -0700 (PDT)
Message-ID: <b9212134-0efa-422d-8cbf-4761e39ce8d6@arm.com>
Date: Wed, 27 Aug 2025 18:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 00/18] pkeys-based page table hardening
To: Yang Shi <yang@os.amperecomputing.com>, linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
 <98c9689f-157b-4fbb-b1b4-15e5a68e2d32@os.amperecomputing.com>
 <8e4e5648-9b70-4257-92c5-14c60928e240@arm.com>
 <939ac25a-096f-46b3-90c1-d8cd6a9e445e@os.amperecomputing.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <939ac25a-096f-46b3-90c1-d8cd6a9e445e@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_170913_688331_22B3CFBD 
X-CRM114-Status: GOOD (  20.84  )
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

On 26/08/2025 21:18, Yang Shi wrote:
>>
>>>> from a contiguous cache of pages could help minimise the overhead, as
>>>> proposed for x86 in [1].
>>> I'm a little bit confused about how this can work. The contiguous
>>> cache of pages should be some large page, for example, 2M. But the
>>> page table pages allocated from the cache may have different
>>> permissions if I understand correctly. The default permission is RO,
>>> but some of them may become R/W at sometime, for example, when calling
>>> set_pte_at(). You still need to split the linear mapping, right?
>> When such a helper is called, *all* PTPs become writeable - there is no
>> per-PTP permission switching.
>
> OK, so all PTPs in the same contiguous cache will become writeable
> even though the helper (i.e. set_pte_at()) is just called on one of
> the PTPs.  But doesn't it compromise the page table hardening somehow?
> The PTPs from the same cache may belong to different processes. 

First just a note that this is true regardless of how the PTPs are
allocated (i.e. this is already the case in this version of the series).

Either way, yes you are right, this approach does not introduce any
isolation *between* page tables - pgtable helpers are able to write to
all page tables. In principle it should be possible to use a different
pkey for kernel and user page tables, but that would make the kpkeys
level switching in helpers quite a bit more complicated. Isolating
further is impractical as we have so few pkeys (just 8 on arm64).

That said, what kpkeys really tries to protect against is the direct
corruption of critical data by arbitrary (unprivileged) code. If the
attacker is able to manipulate calls to set_pte() and the likes, kpkeys
cannot provide much protection - even if we restricted the writes to a
specific set of page tables, the attacker would still be able to insert
a translation to any arbitrary physical page.

- Kevin

