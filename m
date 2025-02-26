Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1079C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaSCtLwB02gaMWwhhPJc48F8mHtFuOzBifryg25kIJg=; b=BEuZdSG6NjDODa01JJfkIWpx+z
	8paoHcHyEi06l/ALj5EsJMWOE/BZ5Pr/rBkVV1cie+fiwFqD8wLHgEb1OtWXHTi4u65CboMqKdrih
	zwpRmmZTKoDJybbAGv5EZPZNIuGznlOQDyuk1jFnE8jg/1wJi5kOplhxdI1yfJ8jO6YAg2ah34wNX
	+5oeCrSJAAHCkYI3xpDTTkIU5kHp4348Y8X3g18iflXX/MGJG8WeylTsQKZS9glp7wqv5pTeylE6I
	QaVOdtxaKP3GCgD5KxZRt0f7GEnD3nRIn8KxLGPbvsZceaFSj/kkkszjvo/BM5hZUCPwwG/JKK5sd
	Ascv6jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMpw-000000056na-12Gw;
	Wed, 26 Feb 2025 19:12:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMgW-000000055Gw-2Kuw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 177AB5C74BD;
	Wed, 26 Feb 2025 19:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D290C4CED6;
	Wed, 26 Feb 2025 19:03:04 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:03:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <Z79lZdYqWINaHfrp@arm.com>
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-10-steven.price@arm.com>
 <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_110308_683709_4B05CE27 
X-CRM114-Status: GOOD (  30.90  )
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

On Wed, Feb 19, 2025 at 02:30:28PM +0000, Steven Price wrote:
> On 17/10/2024 14:14, Steven Price wrote:
> > From: Suzuki K Poulose <suzuki.poulose@arm.com>
> > 
> > Use the memory encryption APIs to trigger a RSI call to request a
> > transition between protected memory and shared memory (or vice versa)
> > and updating the kernel's linear map of modified pages to flip the top
> > bit of the IPA. This requires that block mappings are not used in the
> > direct map for realm guests.
> > 
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Co-developed-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> [...]
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 547a9e0b46c2..6ae6ae806454 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -5,10 +5,12 @@
> >  #include <linux/kernel.h>
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> > +#include <linux/mem_encrypt.h>
> >  #include <linux/sched.h>
> >  #include <linux/vmalloc.h>
> >  
> >  #include <asm/cacheflush.h>
> > +#include <asm/pgtable-prot.h>
> >  #include <asm/set_memory.h>
> >  #include <asm/tlbflush.h>
> >  #include <asm/kfence.h>
> > @@ -23,14 +25,16 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
> >  bool can_set_direct_map(void)
> >  {
> >  	/*
> > -	 * rodata_full and DEBUG_PAGEALLOC require linear map to be
> > -	 * mapped at page granularity, so that it is possible to
> > +	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
> > +	 * map to be mapped at page granularity, so that it is possible to
> >  	 * protect/unprotect single pages.
> >  	 *
> >  	 * KFENCE pool requires page-granular mapping if initialized late.
> > +	 *
> > +	 * Realms need to make pages shared/protected at page granularity.
> >  	 */
> >  	return rodata_full || debug_pagealloc_enabled() ||
> > -	       arm64_kfence_can_set_direct_map();
> > +		arm64_kfence_can_set_direct_map() || is_realm_world();
> >  }
> 
> Aneesh pointed out that this call to is_realm_world() is now too early 
> since the decision to delay the RSI detection. The upshot is that a 
> realm guest which doesn't have page granularity forced for other reasons 
> will fail to share pages with the host.
> 
> At the moment I can think of a couple of options:
> 
> (1) Make rodata_full a requirement for realm guests. 
>     CONFIG_RODATA_FULL_DEFAULT_ENABLED is already "default y" so this 
>     isn't a big ask.
> 
> (2) Revisit the idea of detecting when running as a realm guest early. 
>     This has the advantage of also "fixing" earlycon (no need to 
>     manually specify the shared-alias of an unprotected UART).
> 
> I'm currently leaning towards (1) because it's the default anyway. But 
> if we're going to need to fix earlycon (or indeed find other similar 
> issues) then (2) would obviously make sense.

I'd go with (1) since the end result is the same even if we implemented
(2) - i.e. we still avoid block mappings in realms.

> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index ce4778141ec7..48a6ef0f401c 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -126,6 +126,10 @@ void __init arm64_rsi_init(void)
>  		return;
>  	if (!rsi_version_matches())
>  		return;
> +	if (!can_set_direct_map()) {
> +		pr_err("rodata_full disabled, unable to run as a realm guest. Please enable CONFIG_RODATA_FULL_DEFAULT_ENABLED\n");

It's a bit strange to complain about rodata since, in principle, it
doesn't have anything to do with realms. Its only side-effect is that we
avoid block kernel mappings. Maybe "cannot set the kernel direct map,
consider rodata=full" or something like that.

-- 
Catalin

