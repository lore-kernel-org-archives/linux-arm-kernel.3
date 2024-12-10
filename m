Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87750E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLGNJTaE0IeDdRBSN5nklAb66/bE0PthV8TWw8s13Fo=; b=pzFvRwwIPfRSLaGtzxnEM+Sgaw
	NOwxVu4i1F+YilIom2oHKmTXw2oAnJmNTjoFBgYvWuXa2XQKTShzj3gKE/otX7ZeDsYfNQwyYAY00
	6rVM97OHajn5BWnyl3ZSfQJU0wLOy6TKchm5GlM1yPAkc5S/v8E4WSWAQ1hBjMPi+U//Yih+moC4z
	J3IyUiL7Qws14iLfxSeFByfXBPsUALWHKLam5AH3rOdWExFZyC7aCDkWXuWm76aL88BIjfMdLk5iF
	8uh+eLFJGj99rEslX8t3iggjqvzMAcj0yKz1iBWh59nzyu5WqT1wjaKCUVOyB4LLhpeseMdAAYQOF
	UNZDX7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Ee-0000000BlL7-0wma;
	Tue, 10 Dec 2024 14:29:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL13r-0000000Bif3-03hC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5186A41796;
	Tue, 10 Dec 2024 14:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0502C4CED6;
	Tue, 10 Dec 2024 14:18:00 +0000 (UTC)
Date: Tue, 10 Dec 2024 14:17:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <Z1hNllCWa4u-IxrH@arm.com>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061803_114228_A30E5765 
X-CRM114-Status: GOOD (  12.90  )
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

On Tue, Dec 10, 2024 at 12:42:53AM +0000, Mark Brown wrote:
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..83ea7e5fd2b54566c6649b82b8570657a5711dd4 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -39,7 +39,7 @@
>  #ifdef CONFIG_ARM64_GCS
>  #define GCS_SIGNAL_CAP(addr) (((unsigned long)addr) & GCS_CAP_ADDR_MASK)
>  
> -static bool gcs_signal_cap_valid(u64 addr, u64 val)
> +static bool gcs_signal_cap_valid(unsigned long __user *addr, u64 val)
>  {
>  	return val == GCS_SIGNAL_CAP(addr);
>  }
> @@ -1094,15 +1094,15 @@ static int gcs_restore_signal(void)
>  	/*
>  	 * Check that the cap is the actual GCS before replacing it.
>  	 */
> -	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
> +	if (!gcs_signal_cap_valid(gcspr_el0, cap))
>  		return -EINVAL;
>  
>  	/* Invalidate the token to prevent reuse */
> -	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
> +	put_user_gcs(0, gcspr_el0, &ret);
>  	if (ret != 0)
>  		return -EFAULT;
>  
> -	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
> +	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);

Would we now get a warning here?

-- 
Catalin

