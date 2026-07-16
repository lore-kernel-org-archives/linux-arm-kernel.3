Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58262C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLa4Y9oCLhD0V2Rt7KIBS5b+RVo2eDD9o+6QuNN2N2k=; b=zroCQJcoUvXTJwP26yW0QEgfuJ
	+bf3RiO782SAfP8xuNw84BqFgfNzTEQCfZU9/lexdrr6+EgAJmd7yQ7nutFnx6//4kanHK+mCFP1T
	yfKT6UBg7uJdGd5LuwnB+g8f+comhso1Aia9bdzmxTgx/EPK4eWdsmXTA4DQ6FGlIQOuZOberQBQ8
	KImzfyKbHB7/h3qf9CGzjax0fafJ74VMg3gTsbmYJdW1lbmZ44UDD+Zqr/hU0NfQF1OGsJYS5Bjhv
	LVMj0d1dZrO3DrU3OA+pXXvDGFdr02kFKZ/0kRBrQy8ImoNeooksUeaQqDjYRUrOwrxfypwtpaZo0
	BNAGN6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIJm-0000000Gqpi-1EaV;
	Thu, 16 Jul 2026 09:23:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIJe-0000000GqoG-2XMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:23:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46DF82B;
	Thu, 16 Jul 2026 02:23:33 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 354103F905;
	Thu, 16 Jul 2026 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193817; bh=hG1AAdfCvqq1PEpYDQg4tcJcHBug5oUPy4nkfJ+JHPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M2gNlSD06Eo/0bw4AaGfsOUvnQlmNgn1GcyuFBqxEOACl3lhlk7M+BaPXceu+15lh
	 OCFObqwONsxAK9j0DLse+RoEpz2oGSgxC2iNd/V5BYfVZc5/lsUkesDcQPX8n2hgOs
	 JKTEe/TsrdZ/g6txCyOaseoRiccmPvNxqWeWVtFA=
Message-ID: <c3bccaed-e11f-4f00-8cdc-2d51b55f38e9@arm.com>
Date: Thu, 16 Jul 2026 10:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/37] KVM: arm64: CCA: Check for LPA2 support
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-6-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260715142841.80544-6-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022338_728867_1057AB93 
X-CRM114-Status: GOOD (  20.36  )
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

On 15/07/2026 15:28, Steven Price wrote:
> If KVM has enabled LPA2 support then check that the RMM also supports
> it. If there is a mismatch then disable support for realm guests as the
> VMM may attempt to create a guest which is incompatible with the RMM.
> 

We may be able to relax this in the future with the UNPROT MAP/UNMAP
RMI ABIs now accepting the OutputAddress and Attributes separately
and gracefully handle cases where the requested IPA size exceeds
the RMM limit.

But practically I don't see why we should support it. So :

> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
> v15:
>   * Extend rmi_has_feature() to take the register number and check the
>     presence of SHA-256 support which is default.
> v13:
>   * New patch
> ---
>   arch/arm64/kvm/rmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 384991d69f78..247c4f033945 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -5,9 +5,31 @@
>   
>   #include <linux/kvm_host.h>
>   
> +#include <asm/kvm_pgtable.h>
>   #include <asm/rmi_cmds.h>
>   #include <asm/virt.h>
>   
> +static bool rmi_has_feature(int reg, unsigned long feature)
> +{
> +	return !!u64_get_bits(rmi_feat_reg(reg), feature);
> +}
> +
> +static int rmm_check_features(void)
> +{
> +	if (kvm_lpa2_is_enabled() &&
> +	    !rmi_has_feature(0, RMI_FEATURE_REGISTER_0_LPA2)) {
> +		kvm_err("RMM doesn't support LPA2\n");
> +		return -ENXIO;
> +	}
> +
> +	if (!rmi_has_feature(1, RMI_FEATURE_REGISTER_1_HASH_SHA_256)) {
> +		kvm_err("RMM doesn't support SHA-256 measurements\n");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
>   void kvm_init_rmi(void)
>   {
>   	/*
> @@ -20,5 +42,8 @@ void kvm_init_rmi(void)
>   	if (!is_rmi_available())
>   		return;
>   
> +	if (rmm_check_features())
> +		return;
> +
>   	/* Future patch will enable static branch kvm_rmi_is_available */
>   }


