Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4625DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0frDGdFooC+g/U6iHz09eKdCwyFrLgKo5EElU/iS82U=; b=R63mpuIvv7WOTK6Bp+xOMcd8pw
	arg2mCvhPmYG5U9P/AEWY2dPPtns9Dpaq8F25Hb7XUvv3yvijONM6I4fWnH1caknpNGfOtz2hYIbZ
	m0aQ5ulhd0UzoAduMNA7nNCDk+dkGYSxpbUd5E4UODQyT8WBy+MIbZbEPLQMJqUnkcQhpjkCVocEK
	X0jCSwM15BrgGSs+YRyvN1A5MmCBF9j7cY2lFK1cjthYyb3mZnOPc1Q28QAOybkU8jQIGnifV2Fi2
	xcFz1mMYsswEyhQcvcz6zeo604EVEg/Ur9esrPze6G0qXTdwnpuSXRti5kNmCx7lUG9ytV8P7SCNi
	FMTbDUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfRu-0000000FYIn-1jIw;
	Fri, 21 Mar 2025 16:42:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfQE-0000000FXtZ-3pfL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 16:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1CE543690;
	Fri, 21 Mar 2025 16:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D976C4CEE3;
	Fri, 21 Mar 2025 16:40:35 +0000 (UTC)
Date: Fri, 21 Mar 2025 16:40:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: anshuman.khandual@arm.com, david@redhat.com, will@kernel.org,
	ryan.roberts@arm.com, mark.rutland@arm.com, ardb@kernel.org,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	quic_cgoldswo@quicinc.com, quic_sudaraja@quicinc.com,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com
Subject: Re: [PATCH] arm64: mm: Correct the update of max_pfn
Message-ID: <Z92Wf8SDt8lzFs7F@arm.com>
References: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321070019.1271859-1-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_094038_973396_B69B0D73 
X-CRM114-Status: GOOD (  17.26  )
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

On Fri, Mar 21, 2025 at 03:00:19PM +0800, Zhenhua Huang wrote:
> Hotplugged memory can be smaller than the original memory. For example,
> on my target:
> 
> root@genericarmv8:~# cat /sys/kernel/debug/memblock/memory
>    0: 0x0000000064005000..0x0000000064023fff    0 NOMAP
>    1: 0x0000000064400000..0x00000000647fffff    0 NOMAP
>    2: 0x0000000068000000..0x000000006fffffff    0 DRV_MNG
>    3: 0x0000000088800000..0x0000000094ffefff    0 NONE
>    4: 0x0000000094fff000..0x0000000094ffffff    0 NOMAP
> max_pfn will affect read_page_owner. Therefore, it should first compare and
> then select the larger value for max_pfn.
> 
> Fixes: 8fac67ca236b ("arm64: mm: update max_pfn after memory hotplug")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1dfe1a8efdbe..310ff75891ef 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1361,7 +1361,8 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  		__remove_pgd_mapping(swapper_pg_dir,
>  				     __phys_to_virt(start), size);
>  	else {
> -		max_pfn = PFN_UP(start + size);
> +		/* Address of hotplugged memory can be smaller */
> +		max_pfn = max(max_pfn, PFN_UP(start + size));
>  		max_low_pfn = max_pfn;
>  	}

I think this makes sense and also matches what x86 does. I'll queue it
at -rc1 as a fix.

Thanks.

-- 
Catalin

