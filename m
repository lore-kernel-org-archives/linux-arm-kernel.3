Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA2CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG99HlWhyZXcqOdGeYv6wixfX5/qOmpG/GGY4yf80rg=; b=lVuAmi+QooD8OH0oCQzDJnSQTa
	/ifb3+rxttDbIIS5T2+X32vrwL4PuSBRlT2CKTqPsKwH7Yece3wJINuU3Iz6Rob3eGLOL2w4oF/1T
	Wvirv3X6Srz7AvSSnu4OvRdttbpBeTgrAGM6NPMk4pAhNwvfKJE1XcAKS4wIZLOjQEPd7b0tACFBh
	HoioeJ+D8vsYc3osDoc4mwpf5UjzTCL2UKBZcWiMCG+dfw4yS05ul6D4Jf4ofrqZ3JIS85XdtSYyw
	8VrrnOZURtEe+sM/QmJv5n/8w3Quywz34PtgHIMPx4o/SCq0zLhv6hdYBb+pu1rhofkYWEFfO/kNY
	qaeFE8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnex-00000004P3p-2U2a;
	Thu, 08 Oct 2026 12:55:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnev-00000004P3U-0lrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 12:55:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3DB71477;
	Thu,  8 Oct 2026 05:55:36 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5E043F66F;
	Thu,  8 Oct 2026 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791464140; bh=3QdpwgfvX6sQmV3QX7F2pJoLE3Y/GJ9239PkdjVkR/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DkXEzDU31uC0dYxOkRVh+wR9Y2Jsc46vC/kxrGo9RjXZjwEVDiYzU1xr8xcMcb7HV
	 FcvEyng6+7pjkY1QBhYL6ix+o9Tmk0LkIzWjtkZbQ3xjf1pFB4LwNx3dzurE928/VL
	 mGwWqUTkZOKmjHIvDoQ6Z0W/PCTOx1yxeyykH3DE=
Message-ID: <d0e80505-b36f-40a9-a45f-957fff428c2a@arm.com>
Date: Thu, 8 Oct 2026 13:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 3/6] iommu/arm-smmu-v3: Delay stream allocation to
 inside the mutex
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jean-Philippe Brucker <jpb@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thierry Reding <thierry.reding@kernel.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20261006-smmu-shared-sid-v5-0-169a59c671d3@nxp.com>
 <20261006-smmu-shared-sid-v5-3-169a59c671d3@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261006-smmu-shared-sid-v5-3-169a59c671d3@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_055541_348078_4CFFBEEF 
X-CRM114-Status: GOOD (  26.95  )
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

On 06/10/2026 1:19 pm, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Move arm_smmu_stream allocation from upfront (before the mutex) into
> the mutex-protected loop in arm_smmu_insert_master(). Instead of
> pre-allocating all stream objects and then inserting them into the RB
> tree, first look up whether the SID already exists in the tree. Only
> allocate and insert a new stream when no existing entry is found, then
> avoid unnecessary allocations when bridged PCI devices produce duplicated
> IDs. Prepare the code for a subsequent patch that will reuse existing
> streams when stream IDs are shared across masters.
> 
> The sort is also moved after the mutex section, since streams are now
> populated inside the loop rather than beforehand.
> 
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 102 +++++++++++++++-------------
>   1 file changed, 53 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9d34eac196a65..69c2c3596b06a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4110,52 +4110,29 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>   		return -ENOMEM;
>   	}
>   
> -	for (i = 0; i < fwspec->num_ids; i++) {
> -		struct arm_smmu_stream *new_stream;
> -
> -		new_stream = kzalloc_obj(*new_stream, GFP_KERNEL);
> -		if (!new_stream) {
> -			ret = -ENOMEM;
> -			goto out_free_streams;
> -		}
> -		new_stream->id = fwspec->ids[i];
> -		new_stream->master = master;
> -		master->streams[i] = new_stream;
> -	}
> -
> -	/* Put the ids into order for sorted to_merge/to_unref arrays */
> -	sort(master->streams, master->num_streams,
> -	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> -	     NULL);
> -
> -	/*
> -	 * Clear after sorting: RB_CLEAR_NODE() records the node's own address,
> -	 * which sort_nonatomic() invalidates by relocating the entries.
> -	 */
> -	for (i = 0; i < fwspec->num_ids; i++)
> -		RB_CLEAR_NODE(&master->streams[i]->node);
> -
>   	mutex_lock(&smmu->streams_mutex);
>   	for (i = 0; i < fwspec->num_ids; i++) {
> -		struct arm_smmu_stream *new_stream = master->streams[i];
> +		struct arm_smmu_stream *stream;
>   		struct rb_node *existing;
> -		u32 sid = new_stream->id;
> +		u32 sid = fwspec->ids[i];
>   
>   		ret = arm_smmu_init_sid_strtab(smmu, sid);
>   		if (ret)
>   			break;
>   
> -		/* Insert into SID tree */
> -		existing = rb_find_add(&new_stream->node, &smmu->streams,
> -				       arm_smmu_streams_cmp_node);
> +		existing = rb_find(&sid, &smmu->streams,
> +				   arm_smmu_streams_cmp_key);
>   		if (existing) {
>   			struct arm_smmu_master *existing_master =
>   				rb_entry(existing, struct arm_smmu_stream, node)
>   					->master;
>   
>   			/* Bridged PCI devices may end up with duplicated IDs */
> -			if (existing_master == master)
> +			if (existing_master == master) {
> +				master->streams[i] = rb_entry(existing,
> +					struct arm_smmu_stream, node);

If we're now making the whole stream allocation and tracking business 
more dynamic anyway, could we not just skip inserting duplicate entries 
entirely, and save all the hassle elsewhere?

IIRC, the only real reason for not actively deduplicating originally in
563b5cbe334e ("iommu/arm-smmu-v3: Cope with duplicated Stream IDs") was 
to keep it to the simplest fix that was easier to backport, and at the 
time it was easy to get away with since it only mattered at that one 
particular point. If we have to start copying the double-loop bodge 
around to multiple places, it rather stops looking like the neatest 
option...

Thanks,
Robin.

>   				continue;
> +			}
>   
>   			dev_warn(master->dev,
>   				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
> @@ -4163,45 +4140,72 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>   			ret = -ENODEV;
>   			break;
>   		}
> +
> +		stream = kzalloc_obj(*stream, GFP_KERNEL);
> +		if (!stream) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		stream->id = sid;
> +		stream->master = master;
> +
> +		rb_find_add(&stream->node, &smmu->streams,
> +			    arm_smmu_streams_cmp_node);
> +		master->streams[i] = stream;
>   	}
>   
>   	if (ret) {
> -		for (i--; i >= 0; i--)
> -			if (!RB_EMPTY_NODE(&master->streams[i]->node))
> -				rb_erase(&master->streams[i]->node,
> -					 &smmu->streams);
> +		for (i--; i >= 0; i--) {
> +			int j;
> +
> +			if (!master->streams[i])
> +				continue;
> +			/* Skip duplicated SID pointers already freed */
> +			for (j = 0; j < i; j++)
> +				if (master->streams[j] == master->streams[i])
> +					break;
> +			if (j < i)
> +				continue;
> +			rb_erase(&master->streams[i]->node, &smmu->streams);
> +			kfree(master->streams[i]);
> +		}
>   		mutex_unlock(&smmu->streams_mutex);
> -		goto out_free_streams;
> +		kfree(master->streams);
> +		kfree(master->build_invs);
> +		return ret;
>   	}
>   	mutex_unlock(&smmu->streams_mutex);
>   
> -	return 0;
> +	/* Put the ids into order for sorted to_merge/to_unref arrays */
> +	sort(master->streams, master->num_streams,
> +	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
> +	     NULL);
>   
> -out_free_streams:
> -	for (i = 0; i < master->num_streams; i++)
> -		kfree(master->streams[i]);
> -	kfree(master->streams);
> -	kfree(master->build_invs);
> -	return ret;
> +	return 0;
>   }
>   
>   static void arm_smmu_remove_master(struct arm_smmu_master *master)
>   {
>   	int i;
>   	struct arm_smmu_device *smmu = master->smmu;
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
>   
>   	if (!smmu || !master->streams)
>   		return;
>   
>   	mutex_lock(&smmu->streams_mutex);
> -	for (i = 0; i < fwspec->num_ids; i++)
> -		if (!RB_EMPTY_NODE(&master->streams[i]->node))
> -			rb_erase(&master->streams[i]->node, &smmu->streams);
> -	mutex_unlock(&smmu->streams_mutex);
> +	for (i = 0; i < master->num_streams; i++) {
> +		int j;
>   
> -	for (i = 0; i < master->num_streams; i++)
> +		/* Skip duplicated SID pointers already freed */
> +		for (j = 0; j < i; j++)
> +			if (master->streams[j] == master->streams[i])
> +				break;
> +		if (j < i)
> +			continue;
> +		rb_erase(&master->streams[i]->node, &smmu->streams);
>   		kfree(master->streams[i]);
> +	}
> +	mutex_unlock(&smmu->streams_mutex);
>   
>   	kfree(master->streams);
>   	kfree(master->build_invs);
> 


