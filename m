Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43821D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0fZRPnKHv/GB6K6IE+/LRbzPa3fJJ+5riClleB5YiM=; b=sqGNtBwwW+AnkTPrdU7iXsSMNN
	iE4trwz/k34K5hsqYfdtt1W5gSw/wF1NdM3lwkreQTOPMF+WDNYirntd8yX8713SYeQ0hHk+cFS4H
	qxyfv3sGLa70e1fijFx/YRTUl6tY8CiggMvXsDMrXC54SPP0JyTbSNKYuzPisoQNTnjZ2SOLLytMN
	fupd8Tk+9WjSkc5TdAFz2WSIUbMhRPNNYdj8ZY0lRbTNM+eFEPjvh6yMkFKxh6imSNKWrtq6pfKAz
	4+uX77bjiaN6YDNNq+A9eGP8Tap5/jcv2K6PDhyOXjSxmvYrI9K7c9xunr2E+biOsY6DHpjYis7O6
	/d8bmOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxqb-0000000EJvy-3bh0;
	Tue, 09 Dec 2025 13:33:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxqY-0000000EJva-2ceM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:33:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E181691;
	Tue,  9 Dec 2025 05:33:33 -0800 (PST)
Received: from [10.57.46.210] (unknown [10.57.46.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7773F762;
	Tue,  9 Dec 2025 05:33:38 -0800 (PST)
Message-ID: <498bbad4-ea64-4a24-a63f-e131d271990a@arm.com>
Date: Tue, 9 Dec 2025 13:33:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
 Tomasz Nowicki <tnowicki@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com> <aTgX9qhaLyrQ5iye@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aTgX9qhaLyrQ5iye@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_053342_705604_4FE1E74B 
X-CRM114-Status: GOOD (  23.52  )
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

On 2025-12-09 12:37 pm, Mostafa Saleh wrote:
> On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
>> On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
>>> arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
>>> correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
>>> as IAS would be 40 bits.
>>
>> But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
>> SMMU architecture is talking about the maximum IAS that an SMMU
>> implementation needs to be able to accommodate based on its configuration,
>> but it does then attempt to clarify that the actual IPA size in use by any
>> given context should depend on the VMSA format in use:
>>
>> "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
>> and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
>>
>> Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
>> AArch32/AArch64 detail.
> 
> I see, thanks a lot for the explanation, I got confused by the this
> statement:
> Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.

Indeed, that appears confusingly contradictory; I've filed a bug.

> However, I think this is still a bug but somewere else, as at the moment
> the SMMUv3 dirver will use the SMMU IAS (40-bits) as input for AArch64
> stage-2 page tables, so we need either to limit the IAS as:
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..d21153156daa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2561,7 +2561,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
>          case ARM_SMMU_DOMAIN_S2:
>                  if (enable_dirty)
>                          return -EOPNOTSUPP;
> -               pgtbl_cfg.ias = smmu->ias;
> +               pgtbl_cfg.ias = min(smmu->ias, smmu->oas);
>                  pgtbl_cfg.oas = smmu->oas;
>                  fmt = ARM_64_LPAE_S2;
>                  finalise_stage_fn = arm_smmu_domain_finalise_s2;
> 
> Or, don't populate IAS depending on AArch32 support as the driver
> doesn't support it, effectively reverting:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0c453dbcce7767cd868deb809ba68083c93954e

It does appear we've missed the detail here. TBH I'm not really sure why 
we're bothering to consider the theoretical maximum IAS at all when it 
only makes any difference to a format we've never cared about supporting 
anyway. Frankly I'd be inclined to just remove smmu->ias altogether - 
even if we did ever want to support LPAE format, it would be just as 
trivial for that to hard-code pgtbl_cfg.ias = 40 based on the 
architecture rules.

Thanks,
Robin.

