Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90891CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HLt/hxOkl7aSPqpAf1bFw2IFuOfV/t7jCK+Ije+pMc=; b=bwnryKtHN/z2EE+eL+tiJfS7sz
	yMjKVuZIokjZLntexQO2TZ8lblf6P8n4i+IJWnU8MRxyWTwYoMvUaLvVuFx/6JykhH2Dmiz+5SDiZ
	ACKbkf2wFxztQ35ieW+oF5OI9vY091C27dB3zt29GZeK5aqY5VcE+yyIwVv+BOsj/mRqn7F+UrEbn
	i+zuaQBDynGyso+UoO+5xDczC7wG8/aYRgaFRF5Jxltcnyhy3ZdzW5fHiDJbNkToqwv5JwM7RWGlP
	JlZoNDSnCaQWTQtDqccBWRQJw23mryGb9M3HVc12111emDF/SvcSrQ30M4G9PuCYA/JdPgI9hNaMT
	E+2wB0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJSh-00000006M2s-0g6H;
	Fri, 08 May 2026 11:33:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJSf-00000006M2P-1Z15
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:33:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso74125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778240020; x=1778844820; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HLt/hxOkl7aSPqpAf1bFw2IFuOfV/t7jCK+Ije+pMc=;
        b=l9ZnhQFX7N32tOvNkk02ivZ9Nqglw+303D8w2VqBlCaUiwb1RGearF1nPyoraWQXdJ
         8exEOcB87muEUkMstHXruNMQxYZ9o2IpOsYMWLaI9/F2mhdZ7hFgdLhpI7YN+9g7OfVl
         d4fXQPrXOQr++I27c8zTPYSa+PRzVUnSRaB6fjfdWhvbkM/+A81vsFzxWbL1kK9g3/1P
         n5vFhLCWAw8rdoHtOBd+iqCiJXcgk5MWHA6y8fxSKPjtY5yCvSS+vm9y9XaPxrt0OS5y
         odATMO+WJTLYLCmsc4Ss/ev/5fOwkK5tVo97JHv2Gjz9cMBFFPGQjG6ulWGQbdnWwiGG
         Yv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240020; x=1778844820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HLt/hxOkl7aSPqpAf1bFw2IFuOfV/t7jCK+Ije+pMc=;
        b=QQmZZrLgLGCjIh7z3VdZDTapZmZyX1jFG8sjP4L22LZ0Wujds2tLNhPTgkYxHnueR8
         mY8WHPNQGwFQ4gYutfARXjtePNzw39W2n9a6GPVGqH1BWq9NfsV3Q4zGSRhxY8vhEPvA
         3BUqbU6R2ZyCtWtObEgS91kpZimIQr8PEVE59VU+r6Bjrq8cCNwioI5ATGkIHS+Ny8wn
         OGUFbA7cS7VagQf2kxPmoAlTVj+Ac6DGjkz/ZtZudILK9KiVrbnG9HxauKhjkKEKQ1aI
         4z+QYwMym73VaMwpn3fe/h5l7qiz1aEcZYd7s595LCT/VbptG5jCUP93ZueXzanNq5CM
         hldQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4WhXPSk2Y6UhGwARKKcbDirMlGZRWJrBn4QEsNZ5skUvpszeTKz64KmudHqWOvn8RY5ERjIS0OVGIMlhQrmUV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhxhe3qTZE7KbHim8SgTrWHhCidhkdBahiYWgJSYZUp+tkpcXI
	nvpE9PCCnhIGjBT8ijKG1XgkLzFzuYeibDB1FexHiSXFFgazZQ5JH8XrazG7aVQnXg==
X-Gm-Gg: Acq92OEHAMSkAJ43SJ++xbO8EX4EGVz/okeh/Zc/l56glh5J0Q63r+tTIva3dw8fd/E
	iP/Imo1oGfJT4KhEuV/CI5Bt+SCAWv1GMmiNUEAkHqh+di3rTD7j+pkZnlIbno9K+f9i0cSQtQI
	scFyAxakOajt04AAtssg9b9tEQAmRUg/e9oPQJM1JWsJs+lnrH882SffAfJfsQ3mrjqRsVTNvEb
	bp4iSr2yf9UKK65Wmh6GtjAE9Qb3C3ZsNxUJNLD2azxH/ualAKSwuG0JxQLaU6bt4YkOtTG8KYE
	OChZOcSl52QmBKuC3K3v043VTzTLswcCWeYFASQYxxU2sdM56LklzhnuqXiAnQdpNToO6coY933
	SVxrfbMGKw3mX+DwByJ0fUuY6fjwM52Jj9SzAlKnZCL4qAaRRyf3Z4EniAVI9KCf+bY3UPZt66d
	8uN+CLe0bYNGxPSRoEiHiU7K8rTUeCCac8SAGwNU2oB9WXF85L6h0HGuaRUqgi2mxqyg9F
X-Received: by 2002:a17:903:2c9:b0:2ba:30f:33e0 with SMTP id d9443c01a7336-2bae9e99284mr2894105ad.20.1778240019615;
        Fri, 08 May 2026 04:33:39 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm14982546b3a.25.2026.05.08.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:33:39 -0700 (PDT)
Date: Fri, 8 May 2026 11:33:32 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 6/9] iommu/arm-smmu-v3: Directly encode simple commands
Message-ID: <af3KDBt8vhClSKEF@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_043341_468785_1241DE3D 
X-CRM114-Status: GOOD (  27.06  )
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

On Fri, May 01, 2026 at 11:29:15AM -0300, Jason Gunthorpe wrote:
> Add make functions to build commands for
> 
>  CMDQ_OP_TLBI_EL2_ALL
>  CMDQ_OP_TLBI_NSNH_ALL
>  CMDQ_OP_CFGI_ALL
>  CMDQ_OP_PREFETCH_CFG
>  CMDQ_OP_CFGI_STE
>  CMDQ_OP_CFGI_CD
>  CMDQ_OP_RESUME
>  CMDQ_OP_PRI_RESP
> 
> Convert all of these call sites to use the make function instead of
> going through arm_smmu_cmdq_build_cmd(). Use a #define so the general
> pattern is always:
> 
>    arm_smmu_cmdq_issue_cmd(smmu, arm_smmu_make_cmd_XX(..));
> 
> Add arm_smmu_cmdq_batch_add_cmd() which takes struct arm_smmu_cmd
> directly to match the new flow.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 213 +++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 109 +++++++---
>  2 files changed, 151 insertions(+), 171 deletions(-)
>

[----- >8 ------]

>  
> -static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				     struct arm_smmu_cmd *cmd,
> -				     bool sync)
> +static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
> +				     struct arm_smmu_cmd *cmd, bool sync)

Nit: I'm not sure why we need to rename this? We can still define the 
rest of the helpers like:

#define arm_smmu_cmdq_issue_cmd(smmu, cmd)                      \
	({                                                      \
		struct arm_smmu_cmd __cmd = cmd;                \
		__arm_smmu_cmdq_issue_cmd(smmu, &__cmd, false); \
	})

>  {
>  	return arm_smmu_cmdq_issue_cmdlist(
>  		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd, 1, sync);
>  }
>  
> -static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				   struct arm_smmu_cmd *cmd)
> -{
> -	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, false);
> -}
> +#define arm_smmu_cmdq_issue_cmd(smmu, cmd)                      \
> +	({                                                      \
> +		struct arm_smmu_cmd __cmd = cmd;                \
> +		arm_smmu_cmdq_issue_cmd_p(smmu, &__cmd, false); \
> +	})
> 
> -static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmd *cmd)
> -{
> -	return __arm_smmu_cmdq_issue_cmd(smmu, cmd, true);
> -}
> +#define arm_smmu_cmdq_issue_cmd_with_sync(smmu, cmd)           \
> +	({                                                     \
> +		struct arm_smmu_cmd __cmd = cmd;               \
> +		arm_smmu_cmdq_issue_cmd_p(smmu, &__cmd, true); \
> +	})
>  
>  static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
>  					 struct arm_smmu_cmdq_batch *cmds,
> @@ -962,14 +924,41 @@ static void arm_smmu_cmdq_batch_init(struct arm_smmu_device *smmu,
>  	arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  }
>  
> +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> +					  struct arm_smmu_cmdq_batch *cmds,
> +					  struct arm_smmu_cmd *cmd)

Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
that _p just means we'll aceept ptr.. but the name's kinda wonky.

> +{
> +	bool force_sync = (cmds->num == CMDQ_BATCH_ENTRIES - 1) &&
> +			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
> +	bool unsupported_cmd;
> +
> +	unsupported_cmd = !arm_smmu_cmdq_supports_cmd(cmds->cmdq, cmd);
> +	if (force_sync || unsupported_cmd) {
> +		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
> +					    cmds->num, true);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
> +	}
> +
> +	if (cmds->num == CMDQ_BATCH_ENTRIES) {
> +		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
> +					    cmds->num, false);
> +		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, cmd);
> +	}
> +
> +	cmds->cmds[cmds->num++] = *cmd;
> +}
> +
> +#define arm_smmu_cmdq_batch_add_cmd(smmu, cmds, cmd)               \
> +	({                                                         \
> +		struct arm_smmu_cmd __cmd = cmd;                   \
> +		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &__cmd); \
> +	})
> +
>

[----- >8 -----]

>  
>  static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> @@ -3464,7 +3405,7 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  
>  	cmd.opcode = inv->nsize_opcode;
>  	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
> -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
> +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, hw_cmd);

Nit: are we passing it by value here? This would be a 16-byte stack
copy? As with the macro expansion this looks like:

{
	struct arm_smmu_cmd __cmd = hw_cmd; // <-- Redundant 16-byte copy
	arm_smmu_cmdq_issue_cmd_p(inv->smmu, &__cmd, true);
}

Why not use arm_smmu_cmdq_issue_cmd_p(inv->smmu, &hw_cmd, true) ?
Although, I see this is eventually cleaned up in Patch 9.

>  }
>  
>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4827,8 +4768,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent ent;

Ah, we remove this unitialized thing here. I guess we should still init
it in the previous patch for consistency.

[---- >8 ----]

>  #define CMDQ_RESUME_0_RESP_TERM		0UL
>  #define CMDQ_RESUME_0_RESP_RETRY	1UL
>  #define CMDQ_RESUME_0_RESP_ABORT	2UL
> @@ -475,6 +481,77 @@ enum arm_smmu_cmdq_opcode {
>  	CMDQ_OP_CMD_SYNC = 0x46,
>  };
>  
> +static inline struct arm_smmu_cmd
> +arm_smmu_make_cmd_op(enum arm_smmu_cmdq_opcode op)
> +{
> +	struct arm_smmu_cmd cmd = {};
> +
> +	cmd.data[0] = FIELD_PREP(CMDQ_0_OP, op);
> +	return cmd;
> +}
> +
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_cfgi_all(void)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CFGI_ALL);
> +
> +	cmd.data[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);

Maybe this is a good opportunity to define "31"? We already have a 
similar definition for TLBI: #define CMDQ_TLBI_RANGE_NUM_MAX 31

Perhaps we could have: #define CMDQ_CFGI_RANGE_ALL 31

With the above nits:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

