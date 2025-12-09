Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE9D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+aJx470lPhjqscv3Q9t5wWat3nCUTMJCuucsJzEtm0=; b=wz9XE2/SiokNYTu1r3TRBv+mRf
	wQ6on4N7EHZjQHbVeE2X4n/LbxL8xWgD/HJ5WCukdGKE5JilGiidcRJ+Nrs0OcKN3irj6ul6Bwoqe
	MWOh4SSQS+zmvj7nr9vbgPwNiaFxdqzWaAQqSe+ypFPMgK+cgH+JL9Cy6belHU3ZNvT3pXLBOtrD7
	2Q2c9Y65m5HJnpEWAbXNrKlnMrwLxFkSv+tQirEw5+CAj2mMzFXA6j+i0tZPs0z/dtps/ExtQ392g
	Lizyi5vkLzBg+eqNi7C2YinCg8bihI4sp7E9hy4/E3BvsgDxx/Qvb2ue1KoKNxrvwAAeLlfd9b4bL
	cpd2Aqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvzW-0000000EC1D-3xJ1;
	Tue, 09 Dec 2025 11:34:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvzU-0000000EC0e-0deR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 11:34:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9218A1691;
	Tue,  9 Dec 2025 03:34:37 -0800 (PST)
Received: from [10.57.46.210] (unknown [10.57.46.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2FD3F762;
	Tue,  9 Dec 2025 03:34:43 -0800 (PST)
Message-ID: <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
Date: Tue, 9 Dec 2025 11:34:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: will@kernel.org, joro@8bytes.org, Tomasz Nowicki <tnowicki@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251130194506.593700-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_033448_312666_9E1B7470 
X-CRM114-Status: GOOD (  19.94  )
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

On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
> arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
> correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
> as IAS would be 40 bits.

But that is only when *using* AArch32 format. The bit in chapter 3.4 of 
the SMMU architecture is talking about the maximum IAS that an SMMU 
implementation needs to be able to accommodate based on its 
configuration, but it does then attempt to clarify that the actual IPA 
size in use by any given context should depend on the VMSA format in use:

"VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas 
VMSAv8-64 and VMSAv9-128 limits the maximum IPA size to the maximum PA 
size."

Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with 
this AArch32/AArch64 detail.

> In that case, concatenation is mandatory in some cases.
> Document those and add the checks, this can be simplified; instead
> of adding extra checks we can say that concatenation is mandatory for:
> - 4K, start level = 0 and OAS <= 42 bits.
> - 16K, start level = 1 and OAS <= 40 bits.
> Which cover all the missing cases.

AArch32 uses a fixed 4K granule, so this cannot impact 16K. Note that we 
don't support AArch32 for SMMUv3 anyway, and while this does technically 
apply to SMMUv1/2, Arm's MMU-400/401/500 implementations all have OAS 
fixed at 40/40/48 bits respectively, so I'd imagine it's quite a rare 
case to encounter in practice.

Thanks,
Robin.

> Reported-by: Tomasz Nowicki <tnowicki@google.com>
> Fixes: 4dcac8407fe1 ("iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index e6626004b323..ecf27e86b429 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -223,6 +223,8 @@ static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
>    *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 tables for ias = oas)
>    *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables for ias = oas)
>    *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables for ias = oas)
> + *   f) 32/36 bits PA size with 4K and 40 bits IAS: use level 1 instead of level 0
> + *   g) 32/36 bits PA size with 16K and 40 bits IAS: use level 2 instead of level 1
>    */
>   static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
>   					     struct arm_lpae_io_pgtable *data)
> @@ -234,13 +236,13 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
>   	if ((ARM_LPAE_GRANULE(data) == SZ_16K) && (data->start_level == 0))
>   		return (oas == 48) || (ias == 48);
>   
> -	/* Covers 2.a and 2.c */
> +	/* Covers 2.a, 2.c and 2.f */
>   	if ((ARM_LPAE_GRANULE(data) == SZ_4K) && (data->start_level == 0))
> -		return (oas == 40) || (oas == 42);
> +		return (oas <= 42);
>   
> -	/* Case 2.b */
> +	/* Case 2.b and 2.g */
>   	return (ARM_LPAE_GRANULE(data) == SZ_16K) &&
> -	       (data->start_level == 1) && (oas == 40);
> +	       (data->start_level == 1) && (oas <= 40);
>   }
>   
>   static dma_addr_t __arm_lpae_dma_addr(void *pages)


