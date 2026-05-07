Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE9ACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZOdgNov1BxqyJ4K4hjZNDZI6MstUmVOQY9xgpKGQf0=; b=uS91qKAgvLJOWmQGkUxEXJmUEZ
	9N0UaCrOIgyx9Rt9CY8R1P+GB+bFEdUOTK/b8oZFyNLCUwaaqGGTAngkJE5Q8vfsyxkMn7kji+lop
	hGXyN+aEDH8HiZlDYPIx1iux12atCubnwHjLcoIAUjcpbZnNUhy34mNQ4WyGa8OF6nWwh7PPC8p0R
	BnLnqBUN/CCup7+FywE/YA2b+WGNTdsp+JsOQmmSXKBUAmmRRrMD6IeD3CM8VPuI/439yHQseXhGU
	fPQ46XjGw4M1Nw5YUA2RFxYEIo7F8Kg6S6ehZtelkGiMqhWOfEoUYakpZq8YOHq71NYkICZVeO77M
	a+AIXNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvJ-00000003JYX-4ANr;
	Thu, 07 May 2026 09:21:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvH-00000003JXW-3FRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:21:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48d1c670255so77545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145694; x=1778750494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZOdgNov1BxqyJ4K4hjZNDZI6MstUmVOQY9xgpKGQf0=;
        b=ujWE+Kkwc2JPftGxW1QAVoJ2LsFDrAdZJ8xnCp9pH3CvefdD1J2k8bdlwnbJuOGYy2
         a1xlnZrrYcL5toW2c3+qm+v04f+tPATnP0/esJxrvNWNwWLev2HH8YRc1MknjcFZCOW8
         xgdcbueiYsILgbWOFYodVjpUBy/dApTXZWtl4lzape/yGl5/7MuGOVLBkoD5kg3vCAhL
         MPp48uW7W4BTDYSHzsKRlDkh8mJZN1lqSTBIjUoz0CmTatiNS1gI8AHhs4XpINCXU3UF
         1CS1p31SuZms0SNV1xZlfZ8qr4CU5XSuq1mSsn3wzi/HOX4zjMZ0dP2RM/UEL9a939w6
         I0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145694; x=1778750494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZOdgNov1BxqyJ4K4hjZNDZI6MstUmVOQY9xgpKGQf0=;
        b=Ml5sdV0Fx7eMczDQsDQJA+T/z7FMyiYfwM7rLi4mhSVCF+TEQ79+tKwEYVSQH+AvcV
         T5gsTh1cQRHI6itbxlEnhI+ZMDdofdNehW/Qs5NQVfYZ5nO/nw6e9y5s/kvXH0DTZpfU
         LQBAgwAF6XlCIhibSl9WC/T039I19GTKq+edlv/eKtmN/kquOeSeWkhgXM4P5wX0n3GB
         Nd04/nwLq3WjzneXB5Fw0lxXMGKmZibrg/cArD2rs4IhtQL2Mz408O7zzU3cp9/NH4og
         gAlmrbbSD0EKUYubQ7WOr8iVewdKO8v7pPvclg1iSoGavfWRfF7Nqzu0+x8B7OLHh54S
         yrlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DdNBWCnlS/8JukZnowRa8lLvopH2R2URNF0JPoAOzUgpzzA6pzUrO3fvVI3XKTL9qMUrgFM1SrPXh5/GTqmg9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6fZJCgf3tENOnfrE7nS/zs5u9hgHQ9HkaNM9uL/7QHAisMpd
	D6FoEX6RRXcM5xGi46Ycqai1jFOEg+jk47mUC2e5/Pdyg3BFVQn5vWL6QVV/Z5AYew==
X-Gm-Gg: AeBDiesr+1lnafm5vF08FSah13pmBVVAp8HA1sya+Rh3bnOdOmRdB+iKVZTytB+AqW0
	rbe8Z7iCeZrR0kc+tOqNS3NfBDvWTAHY8oCveaA2pWhpkCP3Uy8qhZHzHr0CLFN5MZB1OGb8hCK
	R7RByLSPrJwfpw+j5m0xjqr4viNQIZsIqOz3U1uY0ZWtlhfd1lQc8n+y0l1wNZ6XCW1OEF7lVnj
	f7I2LyfaTFkftGEtVJMWowd/Xy2ZwtH6RdfdrEiNuVSrqeg58+QActJHF1VWO59+nR8bpbtJqAs
	cRcw8Q0Yf9OMBY7GnfioHh5jRRBFEAk2mds5fza/wI4ScoHqMLdq3Ax4ufsMMYYpVjcsMzj6Qjn
	54cfhtcSoduANeIpYxTeUR6aDvjWWGZCt6WvOgz2KLdUi5MJMKgjgJgXv08fk8xdM8ZS8ruMFnG
	z+Bo3sKCzH9wXZyylTB3kvbAwVRNWfV0Z870WfVbgoH7wlKZjEkGk7TXKds9XRI4CNjDl+3nQKM
	vjisA==
X-Received: by 2002:a05:600c:2284:b0:488:960f:60b8 with SMTP id 5b1f17b1804b1-48e5d64bc85mr779165e9.6.1778145693237;
        Thu, 07 May 2026 02:21:33 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-453509db3ccsm2354347f8f.36.2026.05.07.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:21:32 -0700 (PDT)
Date: Thu, 7 May 2026 09:21:28 +0000
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
Subject: Re: [PATCH 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 selection functions
Message-ID: <afxZmOP6m_Khatj8@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022135_852585_45DE916B 
X-CRM114-Status: GOOD (  27.37  )
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

On Fri, May 01, 2026 at 11:29:11AM -0300, Jason Gunthorpe wrote:
> Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> lower levels of the call chain. Change the functions that determine what
> cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 47 ++++++++++++-------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ++--
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 ++--
>  3 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f030..5cdeaec890592f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -371,12 +371,12 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  }
>  
>  static struct arm_smmu_cmdq *arm_smmu_get_cmdq(struct arm_smmu_device *smmu,
> -					       struct arm_smmu_cmdq_ent *ent)
> +					       struct arm_smmu_cmd *cmd)
>  {
>  	struct arm_smmu_cmdq *cmdq = NULL;
>  
>  	if (smmu->impl_ops && smmu->impl_ops->get_secondary_cmdq)
> -		cmdq = smmu->impl_ops->get_secondary_cmdq(smmu, ent);
> +		cmdq = smmu->impl_ops->get_secondary_cmdq(smmu, cmd);
>  
>  	return cmdq ?: &smmu->cmdq;
>  }
> @@ -924,16 +924,16 @@ static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>  				     struct arm_smmu_cmdq_ent *ent,
>  				     bool sync)
>  {
> -	u64 cmd[CMDQ_ENT_DWORDS];
> +	struct arm_smmu_cmd cmd;
>  
> -	if (unlikely(arm_smmu_cmdq_build_cmd(cmd, ent))) {
> +	if (unlikely(arm_smmu_cmdq_build_cmd(cmd.data, ent))) {
>  		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>  			 ent->opcode);
>  		return -EINVAL;
>  	}
>  
>  	return arm_smmu_cmdq_issue_cmdlist(
> -		smmu, arm_smmu_get_cmdq(smmu, ent), cmd, 1, sync);
> +		smmu, arm_smmu_get_cmdq(smmu, &cmd), cmd.data, 1, sync);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> @@ -948,42 +948,55 @@ static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
>  	return __arm_smmu_cmdq_issue_cmd(smmu, ent, true);
>  }
>  
> +static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
> +					 struct arm_smmu_cmdq_batch *cmds,
> +					 struct arm_smmu_cmd *cmd)
> +{
> +	cmds->num = 0;
> +	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
> +}
> +
>  static void arm_smmu_cmdq_batch_init(struct arm_smmu_device *smmu,
>  				     struct arm_smmu_cmdq_batch *cmds,
>  				     struct arm_smmu_cmdq_ent *ent)
>  {
> -	cmds->num = 0;
> -	cmds->cmdq = arm_smmu_get_cmdq(smmu, ent);
> +	struct arm_smmu_cmd cmd;
> +
> +	arm_smmu_cmdq_build_cmd(cmd.data, ent);
> +	arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  }
>  
>  static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>  				    struct arm_smmu_cmdq_batch *cmds,
> -				    struct arm_smmu_cmdq_ent *cmd)
> +				    struct arm_smmu_cmdq_ent *ent)
>  {
> -	bool unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd);
>  	bool force_sync = (cmds->num == CMDQ_BATCH_ENTRIES - 1) &&
>  			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
> +	struct arm_smmu_cmd cmd;
> +	bool unsupported_cmd;
>  	int index;
>  
> +	if (unlikely(arm_smmu_cmdq_build_cmd(cmd.data, ent))) {
> +		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> +			 ent->opcode);
> +		return;
> +	}
> +
> +	unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, &cmd);
>  	if (force_sync || unsupported_cmd) {
>  		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
>  					    cmds->num, true);
> -		arm_smmu_cmdq_batch_init(smmu, cmds, cmd);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  	}
>  
>  	if (cmds->num == CMDQ_BATCH_ENTRIES) {
>  		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
>  					    cmds->num, false);
> -		arm_smmu_cmdq_batch_init(smmu, cmds, cmd);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  	}
>  
>  	index = cmds->num * CMDQ_ENT_DWORDS;
> -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 cmd->opcode);
> -		return;
> -	}
> -
> +	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));

Maybe this would be better squashed with other arm_smmu_cmdq_batch
patch to avoid this memcpy, but no strong opinion.

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa
>  	cmds->num++;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 092179f689e9f1..6d73f6b63e64a9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -641,13 +641,13 @@ struct arm_smmu_cmdq {
>  	atomic_long_t			*valid_map;
>  	atomic_t			owner_prod;
>  	atomic_t			lock;
> -	bool				(*supports_cmd)(struct arm_smmu_cmdq_ent *ent);
> +	bool				(*supports_cmd)(struct arm_smmu_cmd *cmd);
>  };
>  
>  static inline bool arm_smmu_cmdq_supports_cmd(struct arm_smmu_cmdq *cmdq,
> -					      struct arm_smmu_cmdq_ent *ent)
> +					      struct arm_smmu_cmd *cmd)
>  {
> -	return cmdq->supports_cmd ? cmdq->supports_cmd(ent) : true;
> +	return cmdq->supports_cmd ? cmdq->supports_cmd(cmd) : true;
>  }
>  
>  struct arm_smmu_cmdq_batch {
> @@ -815,7 +815,7 @@ struct arm_smmu_impl_ops {
>  	void (*device_remove)(struct arm_smmu_device *smmu);
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
> -		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +		struct arm_smmu_device *smmu, struct arm_smmu_cmd *cmd);
>  	/*
>  	 * An implementation should define its own type other than the default
>  	 * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 83f6e9f6c51d6b..b4d8c1f2fd3878 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -367,9 +367,9 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
>  
>  /* Command Queue Function */
>  
> -static bool tegra241_guest_vcmdq_supports_cmd(struct arm_smmu_cmdq_ent *ent)
> +static bool tegra241_guest_vcmdq_supports_cmd(struct arm_smmu_cmd *cmd)
>  {
> -	switch (ent->opcode) {
> +	switch (FIELD_GET(CMDQ_0_OP, cmd->data[0])) {
>  	case CMDQ_OP_TLBI_NH_ASID:
>  	case CMDQ_OP_TLBI_NH_VA:
>  	case CMDQ_OP_ATC_INV:
> @@ -381,7 +381,7 @@ static bool tegra241_guest_vcmdq_supports_cmd(struct arm_smmu_cmdq_ent *ent)
>  
>  static struct arm_smmu_cmdq *
>  tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
> -			struct arm_smmu_cmdq_ent *ent)
> +			struct arm_smmu_cmd *cmd)
>  {
>  	struct tegra241_cmdqv *cmdqv =
>  		container_of(smmu, struct tegra241_cmdqv, smmu);
> @@ -409,7 +409,7 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
>  		return NULL;
>  
>  	/* Unsupported CMD goes for smmu->cmdq pathway */
> -	if (!arm_smmu_cmdq_supports_cmd(&vcmdq->cmdq, ent))
> +	if (!arm_smmu_cmdq_supports_cmd(&vcmdq->cmdq, cmd))
>  		return NULL;
>  	return &vcmdq->cmdq;
>  }
> -- 
> 2.43.0
> 

