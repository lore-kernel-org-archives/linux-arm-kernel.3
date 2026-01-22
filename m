Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2B6D3EE6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnlhbM3eNcQ/ckO95S+wk1PoP4QciSKVPRu06xD3lfE=; b=auSETD0j0HHWfFtcmielMN9dCj
	g7akflkinh759QhOe6Iu1qZ33haifz2FCniVOSd/77unvQokv8gxW9HjuXUCLBt7d0HgwpKIzNSD9
	GTDJaopSKMf5XDUUpUOc6KhaYWrAJnqhdfyc/caYnkOQmxzlBsb5rDby88hS5Gr0nmaousQgwAv8h
	5hSM2MIWoNrIM5l450FX8cWZNp9g4bsfqoGo81w4l69uLOa8HbJTgb5XOXzBMSieFUJSpnHcBgm7d
	QB6Iroq0hOAptfec27fRrV/JbtKvibdfR/tTPSKlu/MY3HTNV2Hb77OgHm8RG5KnPaFpCYde2JgvJ
	h4d8DMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivUq-00000007DhF-1o7U;
	Thu, 22 Jan 2026 14:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivUm-00000007Dgo-2yIE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A02D42A6A;
	Thu, 22 Jan 2026 14:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D38FC116C6;
	Thu, 22 Jan 2026 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769091430;
	bh=lIfOPZSdVgQApVz2HFCXNthla9jzf7JmOcaDnitp0Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlVz7b3JVVn7pYjcwvd6YEnMJ5g7DRxJ3b3htjZM6QTJ1a2ldo1eruxkHWQ+O6xGV
	 HjaeTGcceKT5ECiBfocf/YiR4B58ZutUkdHB6OFTnhI5SpbgpF60imXNYrPhTYMBwq
	 M1+hkwQevPDQjUwRHvnNH0BE+5GGpfwgOHBxrEUk632AHQ2DqlXvMjLeYTuQZEu0rV
	 +SgqQUxlbLM+VDTeaOlDO+/JU03Fgpy/lkljfWikQmBFhgjqTPKHgFGlhYJkMpJiDK
	 mWrRxjGrxgiw34Pln9mO3+KC02NwxzrkorYZo+OgdX3JjXq9GwfJrXM0Hl0dUcO5yJ
	 PTcV9MUuS0Sdg==
Date: Thu, 22 Jan 2026 14:17:05 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aXIxYcAsbFZn3ZNU@willie-the-truck>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_061712_767556_137085D3 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Jan 22, 2026 at 10:39:25AM +0530, Anshuman Khandual wrote:
> Hello Yang,
> 
> On 07/01/26 5:59 AM, Yang Shi wrote:
> > Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> > rodata=full"), the direct mapping may be split on some machines instead
> > keeping static since boot. It makes more sense to show the direct mapping
> > use in /proc/meminfo than before.
> 
> I guess the direct mapping here refers to linear map ? IIUC it is called
> direct map on x86 and linear map on arm64 platforms. Then should not it
> be renamed as s/DirectMap/LinearMap instead ? This will align with names
> from ptdump as well.
> 
> Before the above mentioned commit, linear could get altered with memory
> hotplug and remove events as well.
> 
> > This patch will make /proc/meminfo show the direct mapping use like the
> > below (4K base page size):
> > DirectMap4K:	   94792 kB
> > DirectMap64K:	  134208 kB
> > DirectMap2M:	 1173504 kB
> > DirectMap32M:	 5636096 kB
> > DirectMap1G:	529530880 kB
> 
> If /proc/meminfo interface is getting updated via  arch_report_meminfo()
> why not add stats for all kernel virtual address space ranges including
> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
> those could change during system runtime. What makes linear mapping any
> special ?

tbh, I think compatability with x86 is a good argument in this case and
so the naming and formatting proposed by this patch makes sense to me.

I'm also not sure that it's particularly interesting to see these
rolled-up numbers for the vmalloc area. You really want information
about the area, so extending /proc/vmallocinfo to give information
about the granule size for each entry might be useful but I don't think
it should be part of this patch.

Will

