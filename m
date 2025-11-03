Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906E8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2ss4O/i4KxhkbN9o8nJ4rRjGt4fkGep+vaOCctZv7Y=; b=a7BmGFendkVaVNpb/XY4BgFT5E
	pzxDPSaM4j96j3uxMi0Eh9JtR0f+biZFrSM4/kWW6E4EJ50DQ/K+hkeig2jfpKF3Jxpiy9fiBgD5f
	ywuduG5/vyWjMaODQ3AwQf9BRdO+/38NjTwhukf87WKg5rG+d+XN4AXKhk+Gr2RRsfHVBCGI/418c
	iyYp6zwZPp22jNi0w+rcap7YVJirF50W4V38u8ZkjybM2kg0s5HfYgB3v+5Xko/AdYWLrPEC6O6ji
	fu12ek9aGtIt09WnKpC4YAcgTgSeR9M9DkGFTM+4savPu+gRYkzMIRfgX8uB2LXhdY8HWIix9ylB3
	aXh7dKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvZ1-0000000A1E7-0zLB;
	Mon, 03 Nov 2025 14:29:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvYz-0000000A1Dm-2bRg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:29:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2959197b68eso279145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762180180; x=1762784980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2ss4O/i4KxhkbN9o8nJ4rRjGt4fkGep+vaOCctZv7Y=;
        b=zx+rgGDkdTjPTkXwxX7IgTV6xkO1+mBrVurqGHVvrDlhmzrU27lIWi7u1qcR4sGqNG
         LZlCj+nfaxbnMvPgr5wD7CNZlRLa224B9J4Cu4jqbEEmidoNNWo3tTv3GYToc+YEMoIQ
         f20GytPzXkZsnUxfqLkI1Zp863FrL4hwoBRz3DNJvV10lVGjfLubvPKvfwL3mxbv2X0k
         UfnWYarErEfDo8GHrsW/xsRA/F/Kf3vP1JpLTLD3RGmSdaL7bt98XQP5gAh9PJDUMrfT
         5jUw5CmWrGiO1pe3LSbEb2f1li5Dt7+Sh0sePyjy1gWDvdk1RoLxE9XYWMKaWit2pO1H
         paRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762180180; x=1762784980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2ss4O/i4KxhkbN9o8nJ4rRjGt4fkGep+vaOCctZv7Y=;
        b=nti85RMKiAIbwaSPZDGPbxrfs3mOduT42akQwerMCEL37xf2ylN+nzWOb0R5Iq2lB+
         3TskbTjBQfR5+CAwoIA4u9hXlXVzJfys4QrqX5UYhzbS6qmBMhy5YSR7jJzQjdBAWiqe
         rVxl4etGOSFkTrEQPDQmlU9nAzzfUZe3L46SarVsfEr1t8XcupOcO5EEV8HmrlYrWPvo
         SK4QOw4gsnid6x57QuOtgZQFnKGbGhdoUcWKk+YPRc/RdOwFxobiL/rsILX6RLz9hOSe
         lKx7qTs290cDVPz9VoNo3CrCoqGdZ+90epZllqMsK6yVLDHztzHcOkWt/xSv+qadc7BU
         8gsg==
X-Forwarded-Encrypted: i=1; AJvYcCWjGUd/aawayVxFNgQL1Lt1nsz//PyamoORGFog0OQaVYBKmSKhF1fN3PMBsSuxjH7mf3tBuOUOVXmFlqOOdtDS@lists.infradead.org
X-Gm-Message-State: AOJu0YxVLGzQeJXKDTQrwZ8V/YHT+HdsJDDgDRaVzFdVOOfZMtmQP0gL
	7VebLZPRSus56bPQCI5BL8vx/7AwsuW7j7kIYS34UG33ZxqT4Ed2GjKUY/AwjIvs9Q==
X-Gm-Gg: ASbGnctrUE7E2x312btTHq/IOov7OsJpDUc7ee663mgdvyhk8GPRSGnQ0HU4O+NbFKR
	+BZmr1WBLE4rKAK9KlkFO/28/AJvOOCs/0rMhTbj8RnnezLjTqy6pXa7QK01ni3zycUhzDk8YWu
	6j00P9PXOUmsu94rC4bG4/CWXDrymYT+6TRR8Qyca8H9YOEV6/TIYZFlCRzQgnRPkh9tIlSNc5Z
	1jUQl5IqM+eEQZbZdIGF+wnr2p/sRPCL1DQOak0JgUxQQepwRHkkMTWWM6HjTwMfsP4p15A74KK
	8W+rI5c6C+xr9nYdkqS7YeseqmVQlKJa9GBvGemQzqO/6KEb6QOIqGunTsb46sJku1Q18IkrVW3
	PC3dLMJ4pRlDCIaKsNspNHEop60G3OYAFvd9Y9s0lw+DI5BftTMr8QwmwHV4B0lcuwokr7RYEuI
	O7r2qOr6+mQWk5W9OlPpDnsq2u+kLTHPcyGcuBfQ==
X-Google-Smtp-Source: AGHT+IGgprIYvEObzhmjpC9qpNiNgXC4S+j2D9xeUV3N2fiXTSvqkcZt/SDTOp4IK0p25zBW1FXM7Q==
X-Received: by 2002:a17:902:e548:b0:26a:befc:e7e1 with SMTP id d9443c01a7336-29554bab74amr6694685ad.12.1762180179869;
        Mon, 03 Nov 2025 06:29:39 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29556d61c4dsm87954645ad.56.2025.11.03.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:29:39 -0800 (PST)
Date: Mon, 3 Nov 2025 14:29:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	skolothumtho@nvidia.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-iommufd: Allow attaching nested domain
 for GBPA cases
Message-ID: <aQi8TivdgmtAyb7v@google.com>
References: <20251024040551.1711281-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024040551.1711281-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_062941_686674_16583CE6 
X-CRM114-Status: GOOD (  33.04  )
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

On Thu, Oct 23, 2025 at 09:05:51PM -0700, Nicolin Chen wrote:
> A vDEVICE has been a hard requirement for attaching a nested domain to the
> device. This makes sense when installing a guest STE, since a vSID must be
> present and given to the kernel during the vDEVICE allocation.
> 
> But, when CR0.SMMUEN is disabled, VM doesn't really need a vSID to program
> the vSMMU behavior as GBPA will take effect, in which case the vSTE in the
> nested domain could have carried the bypass or abort configuration in GBPA
> register. Thus, having such a hard requirement doesn't work well for GBPA.
> 
> Add an additional condition in arm_smmu_attach_prepare_vmaster(), to allow
> a bypass or abort vSTE working for a GBPA setup. And do not forget to skip
> vsid=0 when reporting vevents, since the guest SMMU in this setup will not
> report event anyway.
> 
> Update the uAPI doc accordingly.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    | 14 ++++++++++++--
>  include/uapi/linux/iommufd.h                       |  7 +++++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Overall, the approach seems fine as it adds value since we can't have
vSMMUs with ABORT / BYPASS config with the current code.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 8cd8929bbfdf8..7d13b9f55512e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -99,15 +99,22 @@ static void arm_smmu_make_nested_domain_ste(
>  int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct arm_smmu_nested_domain *nested_domain)
>  {
> +	unsigned int cfg =
> +		FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
>  	struct arm_smmu_vmaster *vmaster;
> -	unsigned long vsid;
> +	unsigned long vsid = 0;

I'm a little confused here, can we not have a vDEVICE allocated with
vSID = 0 ?

IIRC, vsid is given the value of vdev->virt_id, whereas vdev->virt_id is
allocated in iommufd_vdevice_alloc_ioctl() using the user-provided
cmd->virt_id.

Thus, should we mention this in the uAPI that vdev->virt_id 0 is reserved?

Because otherwise, a VMM may actually allocate a vDEVICE with vSID = 0
(which iommufd currently allows) and we'll start dropping its events
due to the if (!vmaster->vsid) check below. This would be a functional 
regression for such a VMM.

Perhaps a separate bool has_vdevice flag in struct arm_smmu_vmaster
would be clearer and avoid this ambiguity, allowing vsid = 0 to be a
valid ID for an allocated vdevice when user-space explicitly requests it?

>  	int ret;
>  
>  	iommu_group_mutex_assert(state->master->dev);
>  
>  	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
>  					 state->master->dev, &vsid);
> -	if (ret)
> +	/*
> +	 * Attaching to a translate nested domain must allocate a vDEVICE prior,
> +	 * as CD/ATS invalidations and vevents require a vSID to work properly.
> +	 * A bypass/abort domain is allowed to attach with vsid=0 for GBPA case.
> +	 */
> +	if (ret && cfg == STRTAB_STE_0_CFG_S1_TRANS)
>  		return ret;
>  
>  	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
> @@ -460,6 +467,9 @@ int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
>  
>  	lockdep_assert_held(&vmaster->vsmmu->smmu->streams_mutex);
>  
> +	if (!vmaster->vsid)
> +		return -ENOENT;
> +
>  	vevt.evt[0] = cpu_to_le64((evt[0] & ~EVTQ_0_SID) |
>  				  FIELD_PREP(EVTQ_0_SID, vmaster->vsid));
>  	for (i = 1; i < EVTQ_ENT_DWORDS; i++)
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index c218c89e0e2eb..a2527425f398b 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -450,6 +450,13 @@ struct iommu_hwpt_vtd_s1 {
>   * nested domain will translate the same as the nesting parent. The S1 will
>   * install a Context Descriptor Table pointing at userspace memory translated
>   * by the nesting parent.
> + *
> + * Notes
> + * - when Cfg=translate, a vdevice must be allocated prior to attaching to the
> + *   allocated nested domain, as CD/ATS invalidations and vevents need a vSID.
> + * - when Cfg=bypass/abort, vdevice is not required to attach to the allocated
> + *   nested domain. This particularly works for a GBPA case, when CR0.SMMUEN=0
> + *   in the guest VM.
>   */
>  struct iommu_hwpt_arm_smmuv3 {
>  	__aligned_le64 ste[2];
> -- 
> 2.43.0
> 

Thanks,
Praan


