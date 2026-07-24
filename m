Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5449DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtkHIMsEHxohdqGiQq6BVLpCvEimV8PjsiIPAtDV6MA=; b=40v/OSwBmdY3y4dA6524dUOUJC
	W/GWmQmoQomt6jk90bOn21Q06Wbpm4CK/W1omvdz6oaVmrhlgMZ8zzjmJwYN7LXzgauUx7E/4cJyx
	fszAbbsz0AIdMyKONxmoWhVziPWKca63c3PLuqXb7WHh+ucYqhtRRRORnErbAv1R+1GskKAxzDpvL
	aEZhdBIApNVOP6CbHH2bhoUbyWuiXpUBuP91MkcmhOWyKKAk+c/jCZK1woIx7qJc24ph2gCdGOn2X
	ht8h03Izxa6zGGlIEO0RBrjt4+dAhncvzZohWAOtyAUillO7xGkaKeTR9L7pH0N2HwoGJhZq1HAW4
	UwNKIR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG7b-0000000GV8G-0Ycm;
	Fri, 24 Jul 2026 13:39:27 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG7X-0000000GV34-2Gtz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:39:25 +0000
Message-ID: <d2e1d8ae-74d1-4f46-9871-5f7f3e69ccb2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784900360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtkHIMsEHxohdqGiQq6BVLpCvEimV8PjsiIPAtDV6MA=;
	b=eDTwShkhPSDeT8mihmnbGk+NrbBCBLhM+nD1HZW+oBfEZrqFb6NjOtIaESZOxn77AzFWdg
	9LeWIw0KQXz1l4VXonWtM/pdvX0EyV+ApzI/ikSYzaE5jld3fucFcDwwx4pVOTJwrOXqOe
	MSEbodEKd6e5fXXMD4SFUOkiXzv7YrQ=
Date: Fri, 24 Jul 2026 14:39:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] mm/parisc: constify ptep_get() argument
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
To: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
References: <20260724102017.141532-1-pfalcato@suse.de>
 <20260724102017.141532-4-pfalcato@suse.de>
 <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
Content-Language: en-US
In-Reply-To: <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063923_734520_8D90DB30 
X-CRM114-Status: GOOD (  10.60  )
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



On 24/07/2026 14:36, Usama Arif wrote:
> 
> 
> On 24/07/2026 11:20, Pedro Falcato wrote:
>> ptep_get() does not need write access to the PTE.
>>
>> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
>> ---
>>  arch/parisc/include/asm/pgtable.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> hmm I think you might break build bisectibility if
> you separate out the patches, you should squash patch 3 and 4,
> with patch 1.

* squash patch 2, 3 and 4 with patch 1.

