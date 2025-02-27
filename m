Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93779C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKvilTlJUfYFmL3xuqFtESB8dT5JxVgk5avZ5dOv2Gs=; b=Rf1M3CpLUogWzge1QbbUUaCBzB
	GZCwm41VDH4oVbhBwrMfYoSptLa+SnlEQlBxZAsDwWUKLXLl4bfO2xH5uRl8feAGtCB4RmVVJY4tG
	P1JwR9vGjm0ZTS7MO9949pitQaOQm8Oks+LhwaATWripESJZk7yH/j9CNr3Cr8L/MJHG7HlDOqSq4
	m3J07iyc0hX0rNuogP4d3u+S6WGO/+eKjckZQi0pFp0oemgTb/x9sSRmlWkPkHSVdMdvrRKty1vLi
	iEHrQxdr/xx8m7fv+Bu3B0TunSupeNMoOx27WlJdlIyHWQvQBT4165bgvSnmV3vzHSgKRJVv3pDYG
	r46unNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkt-00000008ajb-3ENH;
	Thu, 27 Feb 2025 19:41:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhbG-00000008CUk-3dGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6CD65C6202;
	Thu, 27 Feb 2025 17:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C098FC4CEDD;
	Thu, 27 Feb 2025 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740676982;
	bh=JkGpybMCuNUorSQNS9AQSV0Uqu4j4/+ypLnwebjcqLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLlli9RCpdQCuAsBdWqfHmp7qixapnVQZ/yolrYRPuNVwSLv2DoIEnneEWgeJ0nj4
	 kzslxwyRk4X5rONRKO1bqgqSt9C3pC9FU+Dw5jqRoegd3rg9l1CUAmQ1OuaG7KeJc6
	 miM13dNF1MOvnEIBQo4iLOJv/M89KGdRvYKH0JQ9WAmgtq8oVlFge2R6aLoYdrh1uc
	 ZUDwQIzQhGwRdkR9Y79KCrgmF6zl0wVlq4LvDI2EyxTmbe+bq1PXrGqbnKdO3ZjJqI
	 dQ7uWYdutGW1tJU1mc/f27f8ak/hFR6odrvuxZfzbqaEidm4f3FdDLn/LWlXP8GFbc
	 SA8lIAmdy0sxQ==
Date: Thu, 27 Feb 2025 17:22:55 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v7 09/11] arm64: Enable memory encrypt for Realms
Message-ID: <20250227172254.GB25617@willie-the-truck>
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-10-steven.price@arm.com>
 <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com>
 <Z79lZdYqWINaHfrp@arm.com>
 <20250227002330.GA24899@willie-the-truck>
 <Z8BEhK8P7FXgG11f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8BEhK8P7FXgG11f@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_092306_992147_0174237E 
X-CRM114-Status: GOOD (  33.42  )
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

On Thu, Feb 27, 2025 at 10:55:00AM +0000, Catalin Marinas wrote:
> On Thu, Feb 27, 2025 at 12:23:31AM +0000, Will Deacon wrote:
> > On Wed, Feb 26, 2025 at 07:03:01PM +0000, Catalin Marinas wrote:
> > > On Wed, Feb 19, 2025 at 02:30:28PM +0000, Steven Price wrote:
> > > > > @@ -23,14 +25,16 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
> > > > >  bool can_set_direct_map(void)
> > > > >  {
> > > > >  	/*
> > > > > -	 * rodata_full and DEBUG_PAGEALLOC require linear map to be
> > > > > -	 * mapped at page granularity, so that it is possible to
> > > > > +	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
> > > > > +	 * map to be mapped at page granularity, so that it is possible to
> > > > >  	 * protect/unprotect single pages.
> > > > >  	 *
> > > > >  	 * KFENCE pool requires page-granular mapping if initialized late.
> > > > > +	 *
> > > > > +	 * Realms need to make pages shared/protected at page granularity.
> > > > >  	 */
> > > > >  	return rodata_full || debug_pagealloc_enabled() ||
> > > > > -	       arm64_kfence_can_set_direct_map();
> > > > > +		arm64_kfence_can_set_direct_map() || is_realm_world();
> > > > >  }
> > > > 
> > > > Aneesh pointed out that this call to is_realm_world() is now too early 
> > > > since the decision to delay the RSI detection. The upshot is that a 
> > > > realm guest which doesn't have page granularity forced for other reasons 
> > > > will fail to share pages with the host.
> > > > 
> > > > At the moment I can think of a couple of options:
> > > > 
> > > > (1) Make rodata_full a requirement for realm guests. 
> > > >     CONFIG_RODATA_FULL_DEFAULT_ENABLED is already "default y" so this 
> > > >     isn't a big ask.
> > > > 
> > > > (2) Revisit the idea of detecting when running as a realm guest early. 
> > > >     This has the advantage of also "fixing" earlycon (no need to 
> > > >     manually specify the shared-alias of an unprotected UART).
> > > > 
> > > > I'm currently leaning towards (1) because it's the default anyway. But 
> > > > if we're going to need to fix earlycon (or indeed find other similar 
> > > > issues) then (2) would obviously make sense.
> > > 
> > > I'd go with (1) since the end result is the same even if we implemented
> > > (2) - i.e. we still avoid block mappings in realms.
> > 
> > Is it, though? The config option is about the default behaviour but there's
> > still an "rodata=" option on the command-line.
> 
> Yeah, that's why I suggested the pr_err() to only state that it cannot
> set the direct map and consider rodata=full rather than a config option.
> We already force CONFIG_STRICT_KERNEL_RWX.

rodata=full has absolutely nothing to do with realms, though. It just
happens to result in the linear map being created at page granularity
and I don't think we should expose that implementation detail like this.

> But we can also revisit the decision not to probe the RSI early.

Alternatively, could we predicate realm support on BBM level-3 w/o TLB
conflicts? Then we could crack the blocks in the linear map.

Will

