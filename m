Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92694CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6/FxwSPka5p8DLF5a7pAUL11onK6T+zgOvQ6IlI4aw=; b=lYifYF19VsVoy6Y5VPFQRA7DVM
	3hbTqa086tUowuG4nv6F70b0M2+yQmlsVQwi7i1hEMWwBHKVsA8/mymyu5rFLSliT7yJP7HAYOfRG
	D7uqy2HWtjNbyHWGaow3rZxQwds0ioR9Q+FRVqr9sxqHalznb/DNH0bkl8x1GdcOBPZjclb34Udxt
	a75+RGAApggqP8aFRVqjBBHjU/bNsW7rWf6b9iO00TijUJF4vGZr12ZuX+efplx8T4P2RRdLkTbQe
	UiYy2iFoxYrcPrG6ZgXQAS/TTfIgKakxBy8dvrQCRYeTEZsdCR3F87GFasXH5dmMY2qsduzy1o8jm
	gnAjO20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvd-00000003Jet-0kir;
	Thu, 07 May 2026 09:21:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuva-00000003Jdj-3nsA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:21:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48d1c670255so77615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145713; x=1778750513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6/FxwSPka5p8DLF5a7pAUL11onK6T+zgOvQ6IlI4aw=;
        b=vXOYFlfNrTA3u29Onr4PzW5u3LGG9I1Tfuuy0MRxbiLMx89xM/hlSI+mFHCunKaKKQ
         GW7zOMkpVvos/3p9jo5Tr9dm0aV+PkOJGih45wvltCdGC6Xs8/b9kaWVvPeFyhe5CiB3
         GXmYSWGQnZDuQTDIwqW2IAkklvO6elRQ2VMCPMNIPQ7TW1GgxGARfyoLu6M/xaGGZZkx
         s9I2jO5Gruphs/RbtMuFL1QnGoUOkE25+dSHkh4BnC4J1EDgT2rGXzOv/nrgjVqNHOwp
         Ivae41YiMc37zmxysMb7oxt18rqEZfXuV2MYqO2gXN5rC+hADgDVzY9cj0xekw277M6J
         kofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145713; x=1778750513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6/FxwSPka5p8DLF5a7pAUL11onK6T+zgOvQ6IlI4aw=;
        b=Pa2gacLqvxILHVCosW6oP4JVF4ignp6ylmhMU1+FuiccFDB607ELNCkbxcOC4LPI1B
         pBN27Egf9CpI4TTkrs1fa8cYfc5UJDZEyNzY0I3EQIdcjyn+5+yVg/LrM5OjdwCua87q
         Q8RO3+RTf+alRi81CrkqRokX61CgdIZmCX02W/y8f8/l0dcPm5EYBYBudd/PmcGhVU6h
         II6oXBm1S1dRcYxTk9lg0p6ZQGkNswOpr5dnkqwgihlK4scDkyNtxUTA6K2CyX/sriGO
         h3IlElaLv9wANvWKWQT7vx1i5nZlQZSCCdERzqdNGu/mA7pjswcLFvpCeoGL5Rid/7kb
         WfFA==
X-Forwarded-Encrypted: i=1; AFNElJ+FeOMnBvoY2ecMiEaO6/iaCjMW72tozhZh0HUsESXidnhukYkrFLk87MR8CD5dxYn0frBEoyCGIiOdFeuzOyIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzgUM5lys7Wlw9U6Zisf+e4441KV6YQvkwUW0x4xOAluk7JeGX9
	odlHmdGxIMTM9zNnwzt1KPWalUPjtDkqmKkIIBQ1dXYeD6lljwW3LfLmyZ2I8CnrdQ==
X-Gm-Gg: AeBDiev0V1WIktPKUN42TDvTUnsQFqo8wVr9TyjIY0YC0Zh04a2QYU6NIiJi3A7P/mD
	pKa93mpvMFGrLGMZ9eJrwE6Ojqrb8r1EJpo8rJilNEoRszfMG8qc7hMPp7wIqdPWBIMQLC0uTTu
	TegAzvOxi9m295WkVzy89W14XNj2EePVo4uVRrpHv9EUp51qFN6vQVleJ5gcf96YsQI4VWej4Gq
	B76BdM/mcy9vuOn6hK25UJRJM7CrejmBn4PEFUe//wvsp5EzdDc7ecY5aCzpdCb+T8is5WjmED0
	OaKtHoYFZbHlBaRxZYew1XiR0PdMDMwJdWTcLqSQq9ZH/QsaiLhvf6A5wkoJjJG8NiO6NmvQfBy
	nA5gY4yi1KWDNH5t1I3zMkKvA+PObGhupCPxv8Yr5VHOZdFmEqGLKZqIFoLWQxS1riFvnL2BK3f
	/04jAvYnMLiDyGpqhziEb9DMqZV8Y24/BvPjp3kjzjisPSn3Xx4f/2KbpMWCoqOuUpJOGCO1oWD
	AfCVA==
X-Received: by 2002:a05:600d:8450:10b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-48e52d0a34fmr1539495e9.3.1778145712369;
        Thu, 07 May 2026 02:21:52 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960973sm18969938f8f.30.2026.05.07.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:21:51 -0700 (PDT)
Date: Thu, 7 May 2026 09:21:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 submission functions
Message-ID: <afxZrBaz0YZ9XF2u@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022154_986484_239703C4 
X-CRM114-Status: GOOD (  25.18  )
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

On Fri, May 01, 2026 at 11:29:12AM -0300, Jason Gunthorpe wrote:
> Continue removing struct arm_smmu_cmdq_ent in favour of the HW based
> struct arm_smmu_cmd. Switch the lower level issue commands to work on
> the native struct by lifting arm_smmu_cmdq_build_cmd() into all the
> callers.
> 
> Following patches will revise each of the arm_smmu_cmdq_build_cmd()
> call sites to replace it with the HW struct.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 53 ++++++++++++---------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5cdeaec890592f..67d23e9c54804e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -921,31 +921,23 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  }
>  
>  static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				     struct arm_smmu_cmdq_ent *ent,
> +				     struct arm_smmu_cmd *cmd,
>  				     bool sync)
>  {
> -	struct arm_smmu_cmd cmd;
> -
> -	if (unlikely(arm_smmu_cmdq_build_cmd(cmd.data, ent))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 ent->opcode);
> -		return -EINVAL;
> -	}
> -
>  	return arm_smmu_cmdq_issue_cmdlist(
> -		smmu, arm_smmu_get_cmdq(smmu, &cmd), cmd.data, 1, sync);
> +		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd->data, 1, sync);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				   struct arm_smmu_cmdq_ent *ent)
> +				   struct arm_smmu_cmd *cmd)
>  {
> -	return __arm_smmu_cmdq_issue_cmd(smmu, ent, false);
> +	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, false);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmdq_ent *ent)
> +					     struct arm_smmu_cmd *cmd)
>  {
> -	return __arm_smmu_cmdq_issue_cmd(smmu, ent, true);
> +	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, true);
>  }
>  
>  static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
> @@ -1013,6 +1005,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
>  	struct arm_smmu_cmdq_ent cmd = {0};
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	int sid = master->streams[0].id;
> +	struct arm_smmu_cmd hw_cmd;
>  
>  	if (WARN_ON(!master->stall_enabled))
>  		return;
> @@ -1032,7 +1025,9 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
>  		break;
>  	}
>  
> -	arm_smmu_cmdq_issue_cmd(master->smmu, &cmd);
> +	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_issue_cmd(master->smmu, &hw_cmd);
> +
>  	/*
>  	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
>  	 * RESUME consumption guarantees that the stalled transaction will be
> @@ -1861,14 +1856,16 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
>  {
>  	struct arm_smmu_ste_writer *ste_writer =
>  		container_of(writer, struct arm_smmu_ste_writer, writer);
> -	struct arm_smmu_cmdq_ent cmd = {
> +	struct arm_smmu_cmdq_ent ent = {
>  		.opcode	= CMDQ_OP_CFGI_STE,
>  		.cfgi	= {
>  			.sid	= ste_writer->sid,
>  			.leaf	= true,
>  		},
>  	};
> +	struct arm_smmu_cmd cmd;
>  
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(writer->master->smmu, &cmd);
>  }
>  
> @@ -1896,11 +1893,13 @@ static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
>  	/* It's likely that we'll want to use the new STE soon */
>  	if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH)) {
>  		struct arm_smmu_cmdq_ent
> -			prefetch_cmd = { .opcode = CMDQ_OP_PREFETCH_CFG,
> +			prefetch_ent = { .opcode = CMDQ_OP_PREFETCH_CFG,
>  					 .prefetch = {
>  						 .sid = sid,
>  					 } };
> +		struct arm_smmu_cmd prefetch_cmd;
>  
> +		arm_smmu_cmdq_build_cmd(prefetch_cmd.data, &prefetch_ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
>  	}
>  }
> @@ -2328,7 +2327,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  		 evt[1] & PRIQ_1_ADDR_MASK);
>  
>  	if (last) {
> -		struct arm_smmu_cmdq_ent cmd = {
> +		struct arm_smmu_cmdq_ent ent = {
>  			.opcode			= CMDQ_OP_PRI_RESP,
>  			.substream_valid	= ssv,
>  			.pri			= {
> @@ -2338,7 +2337,9 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  				.resp	= PRI_RESP_DENY,
>  			},
>  		};
> +		struct arm_smmu_cmd cmd;
>  
> +		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  	}
>  }
> @@ -3446,6 +3447,7 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
>  static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  {
>  	struct arm_smmu_cmdq_ent cmd = {};
> +	struct arm_smmu_cmd hw_cmd;
>  
>  	switch (inv->type) {
>  	case INV_TYPE_S1_ASID:
> @@ -3460,7 +3462,8 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  	}
>  
>  	cmd.opcode = inv->nsize_opcode;
> -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &cmd);
> +	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
>  }
>  
>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4823,7 +4826,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmdq_ent ent;
> +	struct arm_smmu_cmd cmd;
>  
>  	/* Clear CR0 and sync (disables SMMU and queue processing) */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
> @@ -4870,16 +4874,19 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Invalidate any cached configuration */
> -	cmd.opcode = CMDQ_OP_CFGI_ALL;
> +	ent.opcode = CMDQ_OP_CFGI_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Invalidate any stale TLB entries */
>  	if (smmu->features & ARM_SMMU_FEAT_HYP) {
> -		cmd.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		ent.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  
> -	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	ent.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Event queue */
> -- 
> 2.43.0
> 

