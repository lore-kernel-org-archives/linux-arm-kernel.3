Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044CDF364DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bka1cw1Qi/26a2+Jc2kZb2RQ89wlOuzga7814xjpSI=; b=hqcn7sY1KQ8TJDcRkV7UYKXSDi
	K66lSoB3i6Gwm4HtAiz1NHTdcdloAwys8nn8LNmTcfvgIb0EhQKzdNqg5t5LQKG7id0mDHT0yuxWW
	yujkb8LhJc9roiicBnN1hRoo2nxruJhWgA7Su43pUD5NewLZZLfDC8fb/fJqKVqKippf8sA/KXVyr
	b23hxlB8YT887eAg6rz6hWONfGIjlbcnE4KxyPOEfzDy9RoEeENTIi+vCmHD+ak3o5/m7Zm70EDK6
	s0dHzUwBznfLfwBmTc+HUE3lkNtlNF1c+TLD90gYSfzWm8/XOwZ6emML4vZQWxM19ypEzHMdnV5bw
	XGvZ8Sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9eM-0000000C3Ko-1BZY;
	Fri, 10 Apr 2026 11:03:46 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9eJ-0000000C3JJ-0yRR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:03:45 +0000
Message-ID: <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775818995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bka1cw1Qi/26a2+Jc2kZb2RQ89wlOuzga7814xjpSI=;
	b=iJoGufjQVaQA6OgKeg5PcAsyZ8KZg1ybHyCC/iI7k/7xV/aIhUEg2lF1iVeMxXrG9M077+
	EoC6fgrcjKXP0ZjKnjkT1Yvi28Vfmm6jVAR3ASkUYQ/Z0Ldz7JnJE9po7D5M3BnsWEuBwm
	p8XAjefEGV13yARmt8akLWTc9caFn4g=
Date: Fri, 10 Apr 2026 12:03:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org
Cc: r@hev.cc, jack@suse.cz, ajd@linux.ibm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org,
 kevin.brodsky@arm.com, lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com,
 rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com,
 vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com,
 hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 leitao@debian.org, kernel-team@meta.com
References: <20260402181326.3107102-1-usama.arif@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260402181326.3107102-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_040343_422999_BAE059AC 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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



On 02/04/2026 19:08, Usama Arif wrote:
> v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
> - Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
>   to HPAGE_PMD_SIZE limited to 2M (Rui)
> - Reviewed-by tags for patch 1 from Kiryl and Jan
> - Remove preferred_exec_order() (Jan)
> - Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
>   otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
>   do_sync_mmap_readahead().
> - Change exec_folio_order() to return 2M (cont-pte size) for 64K base
>   page size for arm64.
> - remove bprm->file NULL check (Matthew)
> - Change filp to file (Matthew)
> - Improve checking of p_vaddr and p_vaddr (Rui and Matthew)
> 

Hello!

Just wanted to check if there was any feedback/review on the latest
revision? 

Thanks!


