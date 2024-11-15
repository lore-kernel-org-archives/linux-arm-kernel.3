Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5168D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMA/0XIqzR9LoU2Cc7Y8HMbr9bpwirJDpi7b2BPiwuA=; b=tfx/Yf1BGog6fu8/WKOt+ExC3b
	7bauOOW1ANWp+LZW8ul80GvFlR5ORGqRjdRbE1oUFW5YSaXuFP+Jg7TWRbx6SwHrVR1GIIAcTvtu+
	m9W8+h/XGfYyF75OchoC9WWNyjEnRc3ij4FdN56z8C/kqjqFV2YmdgJ6Qr054RiJ7QpEhFSv5rDIQ
	kS/EiSuizr9vDS1uupCZUS0AV75KvKx20lwsOyPRrg/i2RVl7H0ZEaoUMhKWsKAyeoiSdqaYUEvMc
	UN5AaK+AY6JA3fPNIBf2li4usqvC8qihVVfzGLM6VynWz8pgHliclBwASjXOgC0RCszk8R5YgfSiI
	jLQCXKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC15K-00000003hjT-3J4U;
	Fri, 15 Nov 2024 18:30:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC14P-00000003hbu-35Nk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 18:29:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E908153B;
	Fri, 15 Nov 2024 10:29:52 -0800 (PST)
Received: from [10.1.25.41] (010265703453.arm.com [10.1.25.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D50E3F66E;
	Fri, 15 Nov 2024 10:29:21 -0800 (PST)
Message-ID: <888e6542-2aa4-43f1-b31e-79432c1ad199@arm.com>
Date: Fri, 15 Nov 2024 18:29:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/io-pgtable-arm: Fix stage concatenation with 16K
To: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, joro@8bytes.org, Daniel Mentz <danielmentz@google.com>
References: <20241115172235.1493328-1-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241115172235.1493328-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_102925_820677_83D0B393 
X-CRM114-Status: GOOD (  20.56  )
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

On 2024-11-15 5:22 pm, Mostafa Saleh wrote:
> According to the Arm spec DDI0487 K.a, in:
> "Table D8-9 Implications of the effective minimum T0SZ value on the
> initial stage 2 lookup level"
> 
> Some combinations of granule and input size with stage-2 would
> require to use initial lookup levels that can only be achieved
> with concatenated PGDs.
> 
> There was one missing case in the current implementation for 16K,
> which is 40-bits.
> 
> Cc: Daniel Mentz <danielmentz@google.com>
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..9a57874a5cb8 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -1044,10 +1044,18 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   		return NULL;
>   
>   	/*
> -	 * Concatenate PGDs at level 1 if possible in order to reduce
> -	 * the depth of the stage-2 walk.
> +	 * Some cases where concatenation is mandatory after de-ciphering RSRKBC
> +	 * in the Arm DDI0487 (K.a):
> +	 * - 40 bits with 4K: use 2 table at level 1 instead of level 0
> +	 * - 40 bits with 16K: use 16 tables at level 2 instead of level 1
> +	 * - 42 bits with 4K: use 8 tabels at level 1 instead of level 0
> +	 * - 48 bits with 16K: use 2 tabels at level 1 instead of level 0

This confused me, since per R_DXBSH, that last one is the only one which 
is actually mandatory in general; the others may be valid per R_PZFHQ 
and R_FBHPY. The additional R_SRKBC constraints come from the PA size, 
not the choice of T0SZ (and thus ultimately start_level) itself, so 
although I guess this probably works out true in practice based on how 
the SMMU drivers happen to behave today, it's none too obvious why.

Thanks,
Robin.

> +	 * Looking at the possible valid input size, that concludes to always
> +	 * use level 1 with concatentation if possible or at level 2 only
> +	 * with 16K.
>   	 */
> -	if (data->start_level == 0) {
> +	if ((data->start_level == 0) ||
> +	    ((data->start_level == 1) && (ARM_LPAE_GRANULE(data) == SZ_16K))) {
>   		unsigned long pgd_pages;
>   
>   		pgd_pages = ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte);


