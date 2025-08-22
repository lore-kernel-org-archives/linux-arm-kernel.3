Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oUqMfc5Rr6TMbgE/wenfxbF6AVX4t+wpxIGqlOIW+c=; b=w84WdYG4WlhF05Mal0TJy8LuVE
	Qg1HpiKTzbRImm+6qXpOpNnh6+B8JJ68BV+uX+HjS1FErW3yiJEkebGIzZMgFFfKnYgbOzpXRnzIB
	ZMh+t/LmULdtusq5/tKwzBT3GtDBCo710BK4QGYtorkakTbxzgg/3aEUHRRrwXBynQ0GmoK2EzsFP
	tNkpsKz2OAx6JFDWRXrA4bc5+ZUqhaM6kAWBz+AekTjiz5DxxNnVnANUT2phUI/XwXSypZ2F2VwBt
	ctGlzw0dPs1qFlvRE69I1ckitYPV4vHI9TZmrx21DC9tgT7UnSJUDxOCpv2a0dFw49aSGg4apn9aL
	FbiO1NVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkeO-00000004T2O-0qnD;
	Sat, 23 Aug 2025 09:35:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTPe-00000002xRr-2ir3;
	Fri, 22 Aug 2025 15:10:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5905E44023;
	Fri, 22 Aug 2025 15:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA78EC4CEED;
	Fri, 22 Aug 2025 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875442;
	bh=CAY5DlsOHyGeAuJSXFXVAByj59QIAOw2AekVjj0R+b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfKWAMlWZSLolf5Er8IdYEE5zQV86o5SRIWNfuGwAevHaro0KNr+O0AUudzUFXmc3
	 fsRmTkuzMKyOWmo+8Ib/4pg6uAO607N85i/ZR6XdaP13USRH/bc4QgbG247YDVGntr
	 dIuimCsUgCJa1CldCgolX2CMa2bqt+CMes53Pgq69q6mqbsJBHuaoP74dMUUlUNsww
	 SqsEK32SbicopH2MuZVGLxcSstv41b7vIfL/1490jZeCkzm9ukqxF1GXRENu39XO4p
	 GF/7+asbsxkyC7LQAOGokPKRMO8cxy0hNc1JtEMo2NFHS86o6qSj3ySEtrOWX+tEVg
	 yHfXvZ0oyq//A==
Date: Fri, 22 Aug 2025 18:10:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 02/35] arm64: Kconfig: drop superfluous "select
 SPARSEMEM_VMEMMAP"
Message-ID: <aKiIYJoshnWwrJQ3@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821200701.1329277-3-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081042_707388_88FC8ADB 
X-CRM114-Status: GOOD (  15.21  )
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

On Thu, Aug 21, 2025 at 10:06:28PM +0200, David Hildenbrand wrote:
> Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
> is selected.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm64/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a64..b1d1f2ff2493b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1570,7 +1570,6 @@ source "kernel/Kconfig.hz"
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
>  	select SPARSEMEM_VMEMMAP_ENABLE
> -	select SPARSEMEM_VMEMMAP
>  
>  config HW_PERF_EVENTS
>  	def_bool y
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.

