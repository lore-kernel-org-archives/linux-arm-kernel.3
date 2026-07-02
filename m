Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFCCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyxPIQyiRY94UmnatdvvXHm0PH6iQcFy569ksBi+Ngk=; b=vnNFFNWCf8bkcoMGV5Nx0l5vsa
	ZQruXanwhrdhPVaYJuS1BMdGsBFhj6fs2Pacz5oJsQfrJLkjNcvxmN/Ca6OdKbYHtWUatGLzSGj3G
	iuIUwJe/4C3BpETHYE7dm9Pr6c5szwWIhGHB+uPbeh0sSOCO1Re9mUUO6TBldRcicRFzQFN+FLcKT
	h1riBKGgTvN9QPJ+l4wcExtAQXzPmwYSPpmVfzJEeHsY6gEMKDqOaLmOP2iRvxnV86ZB13jrvLpFx
	Xg7VUKNVoFNZNe0lXqNFNHI5xvgHMpxL8Bxn/EV4MB8HBV4LHRI9E9EX4xREB/FWWJLBclm447skq
	rK/8+tnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCrz-00000003szE-0Qjo;
	Thu, 02 Jul 2026 08:34:03 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCrw-00000003sxv-2pWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:34:01 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782981227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyxPIQyiRY94UmnatdvvXHm0PH6iQcFy569ksBi+Ngk=;
	b=SJ0Y0AqyMS9M2n2QZLRzV1CPGIMZPLVfRQEKWNUmoYjG8lKgVlBsK23Sq7KAs/mmzgEz+r
	yA/YQ+R4wSRzWGwmuCE7yTqfBDSlerC0fAv8AtZef1qE5HYDgFwTX2JGVoxG7O1hdV5b/4
	JZKbHPW3AKseFmIiWCmAGoK0KJTfGys=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2 5/6] mm/page_vma_mapped: use huge_ptep_get() for
 hugetlb
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260702051341.126509-6-dev.jain@arm.com>
Date: Thu, 2 Jul 2026 16:33:06 +0800
Cc: osalvador@suse.de,
 akpm@linux-foundation.org,
 ljs@kernel.org,
 david@kernel.org,
 liam@infradead.org,
 riel@surriel.com,
 vbabka@kernel.org,
 harry@kernel.org,
 jannh@google.com,
 lance.yang@linux.dev,
 kas@kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 rcampbell@nvidia.com,
 apopple@nvidia.com,
 ziy@nvidia.com,
 matthew.brost@intel.com,
 joshua.hahnjy@gmail.com,
 rakie.kim@sk.com,
 byungchul@sk.com,
 gourry@gourry.net,
 ying.huang@linux.alibaba.com,
 j-nomura@ce.jp.nec.com,
 nao.horiguchi@gmail.com,
 ak@linux.intel.com,
 mel@csn.ul.ie,
 pfalcato@suse.de,
 jpoimboe@kernel.org,
 dave.hansen@intel.com,
 tglx@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 ryan.roberts@arm.com,
 anshuman.khandual@arm.com,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6518FA25-16CB-4BC3-B724-B075B0D1B425@linux.dev>
References: <20260702051341.126509-1-dev.jain@arm.com>
 <20260702051341.126509-6-dev.jain@arm.com>
To: Dev Jain <dev.jain@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013400_853595_FA07291C 
X-CRM114-Status: UNSURE (   9.42  )
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



> On Jul 2, 2026, at 13:13, Dev Jain <dev.jain@arm.com> wrote:
> 
> check_pte() is the final validation step in page_vma_mapped_walk().
> It reads pvmw->pte with ptep_get() to decide whether the entry maps
> the PFN range being walked. For hugetlb VMAs, that pointer refers
> to a hugetlb entry.
> 
> On arches which provide their own huge_ptep_get() to dereference a huge
> pte pointer, accessing via ptep_get() would cause pte_pfn(),
> pte_present() etc to misbehave.
> 
> It is not clear whether this has a trivially visible effect to userspace.
> 
> Use huge_ptep_get() to dereference a huge pte pointer.
> 
> Fixes: ace71a19cec5 ("mm: introduce page_vma_mapped_walk()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


