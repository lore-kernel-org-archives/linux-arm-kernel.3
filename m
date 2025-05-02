Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075DEC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhko857kR5bUe5cV3YF9vwzpcEfOXA2lccf1nX9GXNQ=; b=GA1ZgD7TisDCWW99aYPO0fcumu
	1o3MJHtxgWxj3AXyVfEQHeUs1+f1AZ3dcpNYKlvFsCMCDkCpgKw/gna0Y7NBPeFxPv5LcimTdIfSY
	b89cACs0W4sJ8YrIvwgKSRtta9XaEOlcUh0K3ptqVtCZEE9V3iMNvfMJp02IrF0yRrZWRUq1E91Hg
	bO9krb8nIhZCbmg6c3CLm8T04EQWREPFS40wAOVmOabn29FGapVDKEAXR5wdODhzntRpABzrzLbFy
	UFG5TUGZfkMZ9/sB30JeeX0bJQff2SGn7HtmzliNr1NOEoEcYEhCVZ5GKC9crIs2g35NZxo1gCyn5
	KcCeihuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6e-00000002eWW-1GyG;
	Fri, 02 May 2025 17:23:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtsC-00000002bpm-3ZWL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1B775C5C6F;
	Fri,  2 May 2025 17:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3984C4CEF2;
	Fri,  2 May 2025 17:08:23 +0000 (UTC)
Date: Fri, 2 May 2025 18:08:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Peter Collingbourne <pcc@google.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 2/3] arm64/mm/fault: use original FAR_EL1 value when
 ARM64_MTE_FAR is supported
Message-ID: <aBT8BWqoljvcAU_w@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_100828_943687_4F37E8E8 
X-CRM114-Status: GOOD (  21.57  )
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

+ Peter Collingbourne as he added the SA_EXPOSE_TAGBITS flag.

On Thu, Apr 10, 2025 at 08:47:20AM +0100, Yeoreum Yun wrote:
> Use the original FAR_EL1 value when an MTE tag check fault occurs,
> if ARM64_MTE_FAR is supported.
> This allows reports to include not only the logical tag (memory tag)
> but also the address tag information.
> 
> Applications that require this information should install a signal handler with
> the SA_EXPOSE_TAGBITS flag.
> While this introduces a minor ABI change,
> most applications do not set this flag and therefore will not be affected.

It is indeed a minor ABI in that a tag check fault resulting in a
signal will report the bits 63:60 as well, not just 59:56 of the address
(if the signal handler was registered with SA_EXPOSE_TAGBITS).

I don't think user-space would notice but asking Peter.

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/mm/fault.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..f21d972f99b1 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	/*
>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
>  	 */
> -	far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
> +	if (!cpus_have_cap(ARM64_MTE_FAR))
> +		far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
> +
>  	do_bad_area(far, esr, regs);
>  	return 0;
>  }
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

