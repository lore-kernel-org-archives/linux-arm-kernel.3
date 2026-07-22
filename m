Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF2C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+shRNGBj5Owp+uVGh3Xp8g/6GJInc0RvJCbh8LgO5Wo=; b=R2Q6S7BZx8TnaVL7oYdoF15x5x
	lm6w4Hzi88Ueo2lZTX6f3ohqxBeogX1akQOzXGtHRRWqgNthw/h91PR9IIX4pfv8S6NVCxYW+5gwg
	4WyS2aiTJNIWJxTdlDV1wllNAnUoo8wewbUE9eX/FFvUCoZiBERT2UAIg0svVbMGBq5dxbjuuz0z1
	IlviWwFejTj6twdy8iNPgBSxPteNzOqMi69luYGURNL7/wJ6Y9FK2ueYvDxlkDi8wbDilYZxK9D/p
	AmqtxLzqUbg4860J5Xs458dmuB3PawYZX4t42w41in88+SuAZLhhtJPkzgYhqmmJQCmHAXrMjyJvB
	AfGuQmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVAG-0000000BeVF-1KBw;
	Wed, 22 Jul 2026 11:31:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVAE-0000000BeUR-1pOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:31:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D764F60A68;
	Wed, 22 Jul 2026 11:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EB21F000E9;
	Wed, 22 Jul 2026 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719861;
	bh=+shRNGBj5Owp+uVGh3Xp8g/6GJInc0RvJCbh8LgO5Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZE6F3/01WTp/lAinJIxVK6/EsQhlrlX2KXOvzmSPlCZqP8jC5mFOR0S8xfvNvboG
	 bvasr1TP8hjB5AKJ2yqL620A8IOPAWztB0M6uRSv5QN6CUgciyncyHEhgwi5D87xGv
	 PV/LGb1KTBP6eWTCnPLpjbDOoM0A1PJyS8tRhaZDzNC2J6HSWvu9iY3kO94VT9XvX1
	 Zt6lJADr2o4/DNqbr7uW2s/Vk7eXpIeKf/PtMXaulg+1AHZMXQ6EIpYnrjX72DzBd/
	 UBzORVJqLtDpVMjV6m0bbfxLf9DHK8ynfE2gZUS9G4kWfPODKlapdihYaC6gzCx7+8
	 PZfGzSNPazBfQ==
Date: Wed, 22 Jul 2026 12:30:52 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
	david@kernel.org, liam@infradead.org, Dev Jain <dev.jain@arm.com>,
	catalin.marinas@arm.com, kernel-team@android.com, riel@surriel.com,
	vbabka@kernel.org, harry@kernel.org, jannh@google.com,
	lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, apopple@nvidia.com,
	rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
	nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
	pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Message-ID: <amCp7L1AxoeDH1Yg@willie-the-truck>
References: <20260703114202.365553-1-dev.jain@arm.com>
 <178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
 <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
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

On Tue, Jul 21, 2026 at 01:36:36PM -0700, Andrew Morton wrote:
> On Tue, 21 Jul 2026 18:18:38 +0100 Will Deacon <will@kernel.org> wrote:
> 
> > On Fri, 03 Jul 2026 11:41:53 +0000, Dev Jain wrote:
> > > There are various places which use ptep_get() to get the pte entry
> > > corresponding to a hugetlb folio. Some arches (like s390) have special
> > > handling to compute the pteval, so they provide huge_ptep_get(). Use this
> > > helper consistently.
> > > 
> > > Additionally, some code paths may provide huge_ptep_get with an unaligned
> > > address. This is a problem on arm64 (I checked other arches and it looks
> > > fine for them), which is fixed in patch 1. The fix is made to be
> > > to huge_ptep_get() - that is wider churn and we can do that later.
> > > 
> > > [...]
> > 
> > Applied first patch to arm64 (for-next/fixes), thanks!
> > 
> > [1/6] arm64: make huge_ptep_get handled unaligned addresses
> >       https://git.kernel.org/arm64/c/9175a8c7cfe88
> > 
> > I'm hoping Andrew can drop this from the mm tree to avoid a duplicate,
> > but I didn't hear back yet and I'd like to land the fix.
> 
> I can redo Dev's series to omit [1/6].  The patches apply that way, but
> there might be build-time or runtime issues running the other patches
> without [1/6] present, haven't looked.
> 
> Also, review indicates that the changelog requires updating
> (https://lore.kernel.org/all/2b9d60a2-8698-46b0-80ae-b8747a66a85b@kernel.org/)
> and I believe that Dev plans to do that.

There's been no update for two weeks, so I wouldn't hold your breath!

> IOW, it would be better to carry this in mm.git with your ack.
> 
> Do you plan to upstream this in 7.2-rcX?  If so then I can hang onto
> this patch until it appears in mainline.  Or something.

Yes, I'd like to get this (just this first patch!) in for -rc5 so I
picked it into the arm64 fixes branch.

Will

