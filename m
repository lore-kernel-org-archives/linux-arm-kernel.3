Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BA2103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRe3+W2n2fG8F2HBagQfFXDlHaZMpeWqaE/ZfB5jUeg=; b=euff9fXRF/LDHr0WfvPHC6TWx7
	GHyn65732TM2pz9yDZSHikkeNSsjgsD5FByle/iOCdxWb5CnADFNNGfemyRAjJLYWtK4qvtJGAcIE
	0aQ7gL/pp5vrKHxEu50QvDXtJaNW/Zb978U0abpJemk+JqeAZXdMtuATvpfhFDDMGdwnWiTiVW/1Y
	v8S3G7BXL/eRUaeYOc27XCLH3z1Skz33lCBtdQdjh414YtzJOgVBs+OoYUOjFJX/F/VZFgY2HPUhI
	3msLIfebYLt61VGkBzgrBIMCU09LTdfFYRoSNHA1p2n9Ksnx+e3NbjMxfg9gvtcr9SkVJfQSKSaTg
	+s1qHGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oVe-00000008F0N-1Hd0;
	Wed, 18 Mar 2026 10:52:18 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oVb-00000008Eza-3ETt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:52:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773831132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRe3+W2n2fG8F2HBagQfFXDlHaZMpeWqaE/ZfB5jUeg=;
	b=HTzulNC7TmnoRRs81XeJFxHqGip8FTuymoI1DL0IeQSI2urpVw4z8Yds5eUbtWbitD7AfQ
	4EtgZC0aqRllbSOqqRhQLeFV/zJTTD0u4hAtvwR4X9cBj41pHsg3RpEVHY+APSS0Gg2CO5
	5ZLnpP2D2M1KH0x8QDQGurlvmjDExu4=
From: Usama Arif <usama.arif@linux.dev>
To: ryan.roberts@arm.com,
	r@hev.cc
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Wed, 18 Mar 2026 03:52:00 -0700
Message-ID: <20260318105203.3288727-1-usama.arif@linux.dev>
In-Reply-To: <20260313205541.3830595-1-usama.arif@linux.dev>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_035216_059849_4F99DDC0 
X-CRM114-Status: GOOD (  19.42  )
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

On Fri, 13 Mar 2026 13:55:38 -0700 Usama Arif <usama.arif@linux.dev> wrote:

> On Fri, 13 Mar 2026 16:33:42 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
> > On 10/03/2026 14:51, Usama Arif wrote:
> > > On arm64, the contpte hardware feature coalesces multiple contiguous PTEs
> > > into a single iTLB entry, reducing iTLB pressure for large executable
> > > mappings.
> > > 
> > > exec_folio_order() was introduced [1] to request readahead at an
> > > arch-preferred folio order for executable memory, enabling contpte
> > > mapping on the fault path.
> > > 
> > > However, several things prevent this from working optimally on 16K and
> > > 64K page configurations:
> > > 
> > > 1. exec_folio_order() returns ilog2(SZ_64K >> PAGE_SHIFT), which only
> > >    produces the optimal contpte order for 4K pages. For 16K pages it
> > >    returns order 2 (64K) instead of order 7 (2M), and for 64K pages it
> > >    returns order 0 (64K) instead of order 5 (2M). 
> > 
> > This was deliberate, although perhaps a bit conservative. I was concerned about
> > the possibility of read amplification; pointlessly reading in a load of memory
> > that never actually gets used. And that is independent of page size.
> > 
> > 2M seems quite big as a default IMHO, I could imagine Android might complain
> > about memory pressure in their 16K config, for example.
> > 
> 
> The force_thp_readahead path in do_sync_mmap_readahead() reads at
> HPAGE_PMD_ORDER (2M on x86) and even doubles it to 4M for
> non VM_RAND_READ mappings (ra->size *= 2), with async readahead
> enabled. exec_folio_order() is more conservative. a single 2M folio
> with async_size=0, no speculative prefetch. So I think the memory
> pressure would not be worse than what x86 has?
> 
> For memory pressure on Android 16K: the readahead is clamped to VMA
> boundaries, so a small shared library won't read 2M.
> page_cache_ra_order() reduces folio order near EOF and on allocation
> failure, so the 2M order is a preference, not a guarantee with the
> current code?
> 

I am not a big fan of introducing Kconfig options, but would
CONFIG_EXEC_FOLIO_ORDER with the default value being 64K be a better
solution? Or maybe a default of 64K for 4K and 16K base page size,
but 2M for 64K page size as 64K base page size is mostly for servers.

Using a default value of 64K would mean no change in behaviour.

