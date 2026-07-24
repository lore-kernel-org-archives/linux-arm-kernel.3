Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE43C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdO7KCyyIro+bfenb1xkDQljGGt5dLLkhErcCFsE/Qg=; b=RY7PggYj7pF/itpHAxFKSLBiuQ
	bXfMyX+4Ai+/s4qQSS3U1/hW6FRBLn3Gixg1BT+oUrw1P8KciJt8j2LRmTXvMM9YCyPQucn/N1c/h
	AMXh7MoSyrBeY+vjkqRAkM6B3A+BRbzSM94/0SMFm/gv7rWo+pjOPHLWmNy0bVPXIX1mhicweaCuS
	e846+KgeuwfY7/7e+97o8ET/cLFuPE+Lsed+JS+Rrt2adulzZMoP28S6kamvRO+6WQcoMAfZUw0Q3
	WDWV4yOzXyt0dC33aWVIeidqK75uwUEiW0/FjOamAFEGKcJBXXeCbsKbousWL4FEIECP+HXBFEb3X
	AxQJqDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHRW-0000000GdYl-2Z0K;
	Fri, 24 Jul 2026 15:04:06 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHRT-0000000GdY4-30KY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:04:05 +0000
Message-ID: <253f7ac0-205b-42f1-9fb5-d19eceb581b6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784905439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdO7KCyyIro+bfenb1xkDQljGGt5dLLkhErcCFsE/Qg=;
	b=n5/Rd4evPANGbx1Hmm1azC85wU0nheG46FNmmGZJPiYVUUuGaxBTO3RHHaSsxBQmXrEiYH
	w9WBY2Cs+toTZTVSry5TJuqptsIkQ9usv7g3oI2qlLAi3yC1kjAzyk0KK+DRltA6b8/OHH
	0wfJYfPBAYVBhVVxrB7ixiXxNmqIs70=
Date: Fri, 24 Jul 2026 16:03:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] mm/parisc: constify ptep_get() argument
To: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
References: <20260724102017.141532-1-pfalcato@suse.de>
 <20260724102017.141532-4-pfalcato@suse.de>
 <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
 <amNzLXuwflIZFKtI@casper.infradead.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <amNzLXuwflIZFKtI@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080403_978260_977BAE77 
X-CRM114-Status: GOOD (  13.23  )
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



On 24/07/2026 15:14, Matthew Wilcox wrote:
> On Fri, Jul 24, 2026 at 02:36:59PM +0100, Usama Arif wrote:
>>
>>
>> On 24/07/2026 11:20, Pedro Falcato wrote:
>>> ptep_get() does not need write access to the PTE.
>>>
>>> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
>>> ---
>>>  arch/parisc/include/asm/pgtable.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>> hmm I think you might break build bisectibility if
>> you separate out the patches, you should squash patch 3 and 4,
>> with patch 1.
> 
> I don't see how this breaks bisectability.  Can you elaborate on what
> you think would break?

Patch 1 does:

-static inline pte_t ptep_get_lockless(pte_t *ptep)
+static inline pte_t ptep_get_lockless(const pte_t *ptep)
 {
 	return ptep_get(ptep);
 }


ptep_get() takes a non-const arg till patch 3 for example for parsic.
I don't think you can pass a const variable to non const function arg?

So parsic won't compile in patch 1 and 2, powerprc wont compile
for patches 1, 2 and 3..





