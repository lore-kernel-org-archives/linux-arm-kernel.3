Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLKlY/9PeNrYQbcXZyKTe3kjEHU+SQL+edhIEcfmNdA=; b=LTehlOm1xAYh+e1eXdNNkhmGNc
	DI3u7+QFlJ6F9tOnMimFR4xyBy0S89asncSzOsaQEwOz5KatZDxbjhOFiZQwVuLTae3qVU9yIqEey
	pZ1mgEOhh9RusyAcUmEiAzsqAxQ5U/0DD7EuYqune5f21Mj6TyIk2YjujFfP7bprybxeu3g+pxYy2
	dSb8fMkljbcAPOMk0OY//RSYtCkxgXT7csZfpuCzb5cWMEjRC2pHygKiTqr2GbccXYD1g+G7FlvuW
	NzwshlPANLC2v+2LSj0yPygrbs3PVfmlh7shpyEY4/hnQvB39dBRFRCZaTdtJ2ukH2iZhi/zheB47
	vTv3MtfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWwYZ-00000002cQv-0tmQ;
	Sun, 12 Jan 2025 11:55:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWwXI-00000002cHq-3c0e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 11:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9EC7A406CD;
	Sun, 12 Jan 2025 11:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49732C4CEDF;
	Sun, 12 Jan 2025 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736682822;
	bh=TR1c65Hv1ZAlN20+wMqF50NT5X4N66oVTcOztbvcE38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCziRxGaJkmz1OZBeNxanUZsrAB0FjX978nh1Bya32U64vRYAwIZ0zbdG9Va4Eltt
	 8weyffkrRYrR6jWFkdqq/4kjsUBulRiHvHyX/7lopkJHWjbuLSDe2dwov84r6Qd8oD
	 gKRBnR6mE2EqYRq88c1/hLLyYOwDph7dtwxRgOMg=
Date: Sun, 12 Jan 2025 12:53:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: stable@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Baruch Siach <baruch@tkos.co.il>, Petr Tesarik <ptesarik@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Baoquan He <bhe@redhat.com>, Yang Shi <yang@os.amperecomputing.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH stable 5.4] arm64: mm: account for hotplug memory when
 randomizing the linear region
Message-ID: <2025011217-swizzle-unusual-dd7b@gregkh>
References: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109165419.1623683-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_035345_051138_4D6062A2 
X-CRM114-Status: GOOD (  28.52  )
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

On Thu, Jan 09, 2025 at 08:54:16AM -0800, Florian Fainelli wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> commit 97d6786e0669daa5c2f2d07a057f574e849dfd3e upstream
> 
> As a hardening measure, we currently randomize the placement of
> physical memory inside the linear region when KASLR is in effect.
> Since the random offset at which to place the available physical
> memory inside the linear region is chosen early at boot, it is
> based on the memblock description of memory, which does not cover
> hotplug memory. The consequence of this is that the randomization
> offset may be chosen such that any hotplugged memory located above
> memblock_end_of_DRAM() that appears later is pushed off the end of
> the linear region, where it cannot be accessed.
> 
> So let's limit this randomization of the linear region to ensure
> that this can no longer happen, by using the CPU's addressable PA
> range instead. As it is guaranteed that no hotpluggable memory will
> appear that falls outside of that range, we can safely put this PA
> range sized window anywhere in the linear region.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Link: https://lore.kernel.org/r/20201014081857.3288-1-ardb@kernel.org
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  arch/arm64/mm/init.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index cbcac03c0e0d..a6034645d6f7 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -392,15 +392,18 @@ void __init arm64_memblock_init(void)
>  
>  	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>  		extern u16 memstart_offset_seed;
> -		u64 range = linear_region_size -
> -			    (memblock_end_of_DRAM() - memblock_start_of_DRAM());
> +		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> +		int parange = cpuid_feature_extract_unsigned_field(
> +					mmfr0, ID_AA64MMFR0_PARANGE_SHIFT);
> +		s64 range = linear_region_size -
> +			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
>  
>  		/*
>  		 * If the size of the linear region exceeds, by a sufficient
> -		 * margin, the size of the region that the available physical
> -		 * memory spans, randomize the linear region as well.
> +		 * margin, the size of the region that the physical memory can
> +		 * span, randomize the linear region as well.
>  		 */
> -		if (memstart_offset_seed > 0 && range >= ARM64_MEMSTART_ALIGN) {
> +		if (memstart_offset_seed > 0 && range >= (s64)ARM64_MEMSTART_ALIGN) {
>  			range /= ARM64_MEMSTART_ALIGN;
>  			memstart_addr -= ARM64_MEMSTART_ALIGN *
>  					 ((range * memstart_offset_seed) >> 16);
> -- 
> 2.43.0
> 
> 

You are not providing any information as to WHY this is needed in stable
kernels at all.  It just looks like an unsolicted backport with no
changes from upstream, yet no hint as to any bug it fixes.

And you all really have hotpluggable memory on systems that are running
th is old kernel?  Why are they not using newer kernels if they need
this?  Surely lots of other bugs they need are resolved there, right?

thanks,

greg k-h

