Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1080D12683
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbC161uWLMKMLlOpOOas4QjEPtJhq4f1Zd7U4mjilZ4=; b=Hyp7syohN+XIftYiHw/50AyzZm
	ZHDqTjMX5ijbd20YcdZNazyaI1hGTd8n89eviAsqKFCawti3A3Qdp2rlwiHgh5QgARx/UWsEDcUNw
	nj+45LYzyALvxw2g009HEEA4sSCpmfSA5eAo4Z4eYKiFwqm5C09xVP/NWM31SBRlqT7YBUWzK9Fh2
	vzzc2iLu2WzP8eKhS0aSHwwyrHewOSJ8ea+FOM37HGiPhbIvNq7AsCdRWgAD0TgzRqt/L9nPmfijy
	GmBk1DRCjTewzV9VwElcTf9Nf8Ni91v6xP6PT3mKOohYRP0zC3zjUiqhiB87cB6XHDlzTGsRFFgAB
	zb0A++fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HG1-0000000GkMh-2BLv;
	Tue, 05 Nov 2024 10:57:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HCl-0000000GjUu-0106
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:54:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5C255C4AF5;
	Tue,  5 Nov 2024 10:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916C3C4CECF;
	Tue,  5 Nov 2024 10:54:31 +0000 (UTC)
Date: Tue, 5 Nov 2024 10:54:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, will@kernel.org, maz@kernel.org,
	mark.rutland@arm.com, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com
Subject: Re: [PATCH v4 3/5] arm64: Add support for FEAT_HAFT
Message-ID: <Zyn5ZQ3K6FRSjVLO@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-4-yangyicong@huawei.com>
 <ZykEUGdkyYClM8Zi@arm.com>
 <b851d802-ed2a-cad2-b96a-f7a9e3bb746e@huawei.com>
 <965cde16-c1f6-dcdb-7471-6cf95e7f51f8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <965cde16-c1f6-dcdb-7471-6cf95e7f51f8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_025435_114250_32B67FA4 
X-CRM114-Status: GOOD (  19.99  )
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

On Tue, Nov 05, 2024 at 06:38:51PM +0800, Yicong Yang wrote:
> On 2024/11/5 10:47, Yicong Yang wrote:
> > On 2024/11/5 1:28, Catalin Marinas wrote:
> >> On Sat, Nov 02, 2024 at 06:42:33PM +0800, Yicong Yang wrote:
> >>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> >>> index 3d261cc123c1..ed8c784ca082 100644
> >>> --- a/arch/arm64/include/asm/cpufeature.h
> >>> +++ b/arch/arm64/include/asm/cpufeature.h
> >>> @@ -838,6 +838,12 @@ static inline bool system_supports_poe(void)
> >>>  		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
> >>>  }
> >>>  
> >>> +static inline bool system_supports_haft(void)
> >>> +{
> >>> +	return IS_ENABLED(CONFIG_ARM64_HAFT) &&
> >>> +		cpus_have_final_cap(ARM64_HAFT);
> >>> +}
> >>
> >> I'm fine with this approach. If we ever get hardware with mismatched
> >> FEAT_HAFT and some secondary CPUs don't come up, we can revisit.
> >>
> >>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> >>> index ccbae4525891..0bc88df7cb35 100644
> >>> --- a/arch/arm64/mm/proc.S
> >>> +++ b/arch/arm64/mm/proc.S
> >>> @@ -498,6 +498,10 @@ alternative_else_nop_endif
> >>>  	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
> >>>  	cbz	x9, 1f
> >>>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
> >>> +
> >>> +#ifdef CONFIG_ARM64_HAFT
> >>> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
> >>> +#endif /* CONFIG_ARM64_HAFT */
> >>>  1:
> >>>  #endif	/* CONFIG_ARM64_HW_AFDBM */
> >>>  	msr	mair_el1, mair
> >>
> >> If you still want #ifdefs, I'd have left it outside the HW_AFDBM. We
> >> already have a dependency in the Kconfig. Anyway, I can fix this up.
> > 
> > yes it has already depend on the HW_AFDBM. And one asm won't cause much to the
> > Image size if user want CONFIG_ARM64_HAFT=n. I'll drop the #ifdef here.
> > 
> 
> I rethink it and maybe we still need the #ifdef here considering one case: the hardware
> supports FEAT_HAFT while user make CONFIG_ARM64_HAFT=n, in such case the HAFT will be
> enabled unexpectedly if no CONFIG_ARM64_HAFT protection here.

Yes, still keeping the #ifdef but outside of HW_AFDBM. I can fix it up
myself when applying the patches.

-- 
Catalin

