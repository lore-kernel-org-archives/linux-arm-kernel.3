Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAEBCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzfafLrMIPWU1uCMoM0mHCI24IB19rl5qj1B8HXqG0o=; b=EzKXZ0jRXq23krVw3UIruReILL
	JAgn4PkMGuDuiMw+orxIkcDfCRQyP50fjzNvDqewZr3ZNrZIRXRt2T3A0MpF/A1YGuXfgbmEkgh6X
	ZmPnft2CIbMvqu64neNoltU/xZeVj76rZG1VCUjiptVrqVpzhnXrFa13f0b2HcYeVXYKThsuWpem2
	F3jVDQnAQy9/WE3Lf0hkpmdaV1Dty/N3QfK0sNB0/K9YtdXstVaLeiZZ/ccC66We2tWtiVSL6VfTx
	/AHxUUC0Y9QK+thW1XIPnKBLHteBwP0E8zRgMyBopNm7MjHRfl4mng+8Ev0JH8SJ1Zl9tz6YkAbcm
	3jI/vvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuyF-00000003Kio-2jcp;
	Thu, 07 May 2026 09:24:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuyD-00000003Khm-0ya0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:24:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48d1c670255so78195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145875; x=1778750675; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzfafLrMIPWU1uCMoM0mHCI24IB19rl5qj1B8HXqG0o=;
        b=powmMFzIOoaQil9V/HjNVtj3mNxBUDDt/eu67szDwtjlZ6MMyX9vpM+jrck4X+jDYk
         MJHh39T1hHw9nI7pFKdQYri+1kFEas7mi56PqkIBuvL/3GbhkF54g7BBjc+2zRF2HVMP
         HI4nYbeG4xudChkvIlZf7jLyfOzxc7Jy+7tC2luF2cYLFh66+7EJv9hJNYfIIPFMS9h9
         7qnIP03kepPNOwPJQ/4noNjITgfD2LZlRgOmQ+IzkAmxIXM6E3UAWgX3DrQf+rXhtYfI
         I7rl2N5dixcHE7wp3uWgcYglABG1AqxJjYDytjrhq6oSoLPol0B896Ncn5u6yLtuwGfQ
         amnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145875; x=1778750675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzfafLrMIPWU1uCMoM0mHCI24IB19rl5qj1B8HXqG0o=;
        b=BuyIBwnTNWV5WwtKLVvgNLRA+H6o1b45TBeypQU0iO9+6ckXZ3UVkeYRagz0uHOeMr
         SoyRPK+jnk37bKMNijbnxKNoJn9SCtZxHeSrrwaBtRpUjXJr3t+S0SEE2lH0MEXoseDa
         GMcogxek9L8eJ1UQ69HJztMXsLVNWgWTFmQRh2R/bwcwVOmU+avMQkAp5NZn9XQbYjWJ
         J40qjONap5ohUVF5z3G98/VqXUBzUJh95yPVbOcRmngYWlxlFG80vvhqqwripE2/dHt5
         YXtN6E+jWzOPoNIjWOrM1EYSRflxHMNNMD8WsXVzwWZDkAt/ElHGQiNAMacHnqnqZ3wW
         Xhhw==
X-Forwarded-Encrypted: i=1; AFNElJ+uZqUxkaGKYqp8ZaIpCo0BTQJhZkUgjx2Y9tfmHKJNdN0yRuSLv+j9cI0uCPSiT+GMta5yzYRhOpLOuJhrd5jq@lists.infradead.org
X-Gm-Message-State: AOJu0YwqcecTLmInlbx/ktVJDrPsUhSX/urTYFjWyNhDbZTaY1T0ncc+
	TyCwn7zM5yzCM/OBUcTvyoCNJSX+XniDVNurvFRGq62tyN6PV9rKdTqA4gcFkzjuTw==
X-Gm-Gg: AeBDieumcGp7FXauayxOjduHe1fBLjTUsvZciRGAmRVBcMDuKXiJFKXaXQdcK6aNsa3
	jYQOWD03UVjnw1qyMVeQCpBFPcFN3q6X3KPobtHUD4OS3apyvCjtEz2nL/vBXhQhlePQIfnHNFw
	qEwHRa7e+3dSlUizPvr9D7PbeGDtTINdEMq7v6oVnJWm117mNI/kFiat+NQUyXumpYd3aQwHlvu
	UiUTSMHDnWE4IJwLHLLaMrH3exu1Q5wZp1/jZse3rAglffAwwlcyrudU+8sUuFSCL8idOLlmzKf
	8DfsWjFp3siGUhn9eZMKKvYZWwsbWFOqaae2qMpXtYfBu63z6FX7f0+tzbl+CLBvyv+l9EI587C
	ErfRgLPM0yZOxcPhscLpvzEubR7jkJlkR3r/foMmGIEHrjbwt4IggycwpRxZw7m9k22KxO8eCgb
	Lan628psiKXHjJfaAvS3FylGmkBjZTu61KC4u7SfW/uvAVer1Pj9M1eMsw3+vTgk9oDl1wUaQCI
	8QakA==
X-Received: by 2002:a05:600c:686:b0:485:b6e4:9808 with SMTP id 5b1f17b1804b1-48e52d0a2b6mr1541565e9.1.1778145875033;
        Thu, 07 May 2026 02:24:35 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f2487dsm19179164f8f.35.2026.05.07.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:24:34 -0700 (PDT)
Date: Thu, 7 May 2026 09:24:30 +0000
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
Subject: Re: [PATCH 9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
Message-ID: <afxaTs-RK_8hbMLO@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022437_333804_4B8FCE88 
X-CRM114-Status: GOOD (  33.01  )
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

On Fri, May 01, 2026 at 11:29:18AM -0300, Jason Gunthorpe wrote:
> TLBI is more complicated than all the other commands because the
> invalidation loop builds a template command from the struct
> arm_smmu_inv which is then expanded into many TLBI commands for the
> invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 170 +++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  35 ++--
>  2 files changed, 71 insertions(+), 134 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8147b9cdcc6b99..9be589d14a3bd4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -268,53 +268,6 @@ static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
>  }
>  
>  /* High-level queue accessors */
> -static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
> -				   struct arm_smmu_cmdq_ent *ent)
> -{
> -	u64 *cmd = cmd_out->data;
> -
> -	memset(cmd_out, 0, sizeof(*cmd_out));
> -	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> -
> -	switch (ent->opcode) {
> -	case CMDQ_OP_TLBI_NH_VA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> -		fallthrough;
> -	case CMDQ_OP_TLBI_EL2_VA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
> -		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
> -		break;
> -	case CMDQ_OP_TLBI_S2_IPA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
> -		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
> -		break;
> -	case CMDQ_OP_TLBI_NH_ASID:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> -		fallthrough;
> -	case CMDQ_OP_TLBI_NH_ALL:
> -	case CMDQ_OP_TLBI_S12_VMALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> -		break;
> -	case CMDQ_OP_TLBI_EL2_ASID:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> -		break;
> -	default:
> -		return -ENOENT;
> -	}
> -
> -	return 0;
> -}
> -
>  static struct arm_smmu_cmdq *arm_smmu_get_cmdq(struct arm_smmu_device *smmu,
>  					       struct arm_smmu_cmd *cmd)
>  {
> @@ -894,16 +847,6 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
>  	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
>  }
>  
> -static void arm_smmu_cmdq_batch_init(struct arm_smmu_device *smmu,
> -				     struct arm_smmu_cmdq_batch *cmds,
> -				     struct arm_smmu_cmdq_ent *ent)
> -{
> -	struct arm_smmu_cmd cmd;
> -
> -	arm_smmu_cmdq_build_cmd(&cmd, ent);
> -	arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
> -}
> -
>  static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
>  					  struct arm_smmu_cmd *cmd)
> @@ -934,21 +877,6 @@ static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
>  		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &__cmd); \
>  	})
>  
> -static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
> -				    struct arm_smmu_cmdq_batch *cmds,
> -				    struct arm_smmu_cmdq_ent *ent)
> -{
> -	struct arm_smmu_cmd cmd;
> -
> -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmd, ent))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 ent->opcode);
> -		return;
> -	}
> -
> -	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &cmd);
> -}
> -
>  static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
>  				      struct arm_smmu_cmdq_batch *cmds)
>  {
> @@ -2450,12 +2378,14 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  
>  static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
> -					  struct arm_smmu_cmdq_ent *cmd,
> +					  struct arm_smmu_cmd *cmd, bool leaf,
>  					  unsigned long iova, size_t size,
>  					  size_t granule, size_t pgsize)
>  {
>  	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
> +	u64 orig_data0 = cmd->data[0];
>  	size_t inv_range = granule;
> +	u8 ttl = 0, tg_enc = 0;
>  
>  	if (WARN_ON_ONCE(!size))
>  		return;
> @@ -2464,7 +2394,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  		num_pages = size >> tg;
>  
>  		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
> -		cmd->tlbi.tg = (tg - 10) / 2;
> +		tg_enc = (tg - 10) / 2;
>  
>  		/*
>  		 * Determine what level the granule is at. For non-leaf, both
> @@ -2474,8 +2404,8 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  		 * want to use a range command, so avoid the SVA corner case
>  		 * where both scale and num could be 0 as well.
>  		 */
> -		if (cmd->tlbi.leaf)
> -			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
> +		if (leaf)
> +			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
>  		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
>  			num_pages++;
>  	}
> @@ -2493,11 +2423,13 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  
>  			/* Determine the power of 2 multiple number of pages */
>  			scale = __ffs(num_pages);
> -			cmd->tlbi.scale = scale;
>  
>  			/* Determine how many chunks of 2^scale size we have */
>  			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
> -			cmd->tlbi.num = num - 1;
> +
> +			cmd->data[0] = orig_data0 |
> +				FIELD_PREP(CMDQ_TLBI_0_NUM, num - 1) |
> +				FIELD_PREP(CMDQ_TLBI_0_SCALE, scale);
>  
>  			/* range is num * 2^scale * pgsize */
>  			inv_range = num << (scale + tg);
> @@ -2506,8 +2438,17 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  			num_pages -= num << scale;
>  		}
>  
> -		cmd->tlbi.addr = iova;
> -		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
> +		/*
> +		 * IPA has fewer bits than VA, but they are reserved in the
> +		 * command and something would be very broken if iova had them
> +		 * set.
> +		 */
> +		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
> +			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> +			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
> +			       (iova & ~GENMASK_U64(11, 0));
> +
> +		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
>  		iova += inv_range;
>  	}
>  }
> @@ -2538,19 +2479,22 @@ static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
>  /* Used by non INV_TYPE_ATS* invalidations */
>  static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  				       struct arm_smmu_cmdq_batch *cmds,
> -				       struct arm_smmu_cmdq_ent *cmd,
> +				       struct arm_smmu_cmd *cmd,
> +				       bool leaf,
>  				       unsigned long iova, size_t size,
>  				       unsigned int granule)
>  {
>  	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
> -		cmd->opcode = inv->nsize_opcode;
> -		arm_smmu_cmdq_batch_add(inv->smmu, cmds, cmd);
> +		struct arm_smmu_cmd nsize_cmd = *cmd;
> +
> +		u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode,
> +				  CMDQ_0_OP);
> +		arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, &nsize_cmd);
>  		return;
>  	}
>  
> -	cmd->opcode = inv->size_opcode;
> -	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, iova, size, granule,
> -				      inv->pgsize);
> +	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, leaf,
> +				      iova, size, granule, inv->pgsize);
>  }
>  
>  static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> @@ -2585,38 +2529,39 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
>  			break;
>  	while (cur != end) {
>  		struct arm_smmu_device *smmu = cur->smmu;
> -		struct arm_smmu_cmdq_ent cmd = {
> -			/*
> -			 * Pick size_opcode to run arm_smmu_get_cmdq(). This can
> -			 * be changed to nsize_opcode, which would result in the
> -			 * same CMDQ pointer.
> -			 */
> -			.opcode = cur->size_opcode,
> -		};
> +		/*
> +		 * Pick size_opcode to run arm_smmu_get_cmdq(). This can
> +		 * be changed to nsize_opcode, which would result in the
> +		 * same CMDQ pointer.
> +		 */
> +		struct arm_smmu_cmd cmd =
> +			arm_smmu_make_cmd_op(cur->size_opcode);
>  		struct arm_smmu_inv *next;
>  
>  		if (!cmds.num)
> -			arm_smmu_cmdq_batch_init(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_init_cmd(smmu, &cmds, &cmd);
>  
>  		switch (cur->type) {
>  		case INV_TYPE_S1_ASID:
> -			cmd.tlbi.asid = cur->id;
> -			cmd.tlbi.leaf = leaf;
> -			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
> -						   granule);
> +			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
> +						     cur->id, 0);
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
> +						   iova, size, granule);
>  			break;
>  		case INV_TYPE_S2_VMID:
> -			cmd.tlbi.vmid = cur->id;
> -			cmd.tlbi.leaf = leaf;
> -			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
> -						   granule);
> +			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
> +						     0, cur->id);
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
> +						   iova, size, granule);
>  			break;
>  		case INV_TYPE_S2_VMID_S1_CLEAR:
>  			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
>  			if (arm_smmu_inv_size_too_big(cur->smmu, size, granule))
>  				break;
> -			cmd.tlbi.vmid = cur->id;
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add_cmd(
> +				smmu, &cmds,
> +				arm_smmu_make_cmd_tlbi(cur->size_opcode, 0,
> +						       cur->id));
>  			break;
>  		case INV_TYPE_ATS:
>  			arm_smmu_cmdq_batch_add_cmd(
> @@ -3359,24 +3304,21 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
>  
>  static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  {
> -	struct arm_smmu_cmdq_ent cmd = {};
> -	struct arm_smmu_cmd hw_cmd;
> -
>  	switch (inv->type) {
>  	case INV_TYPE_S1_ASID:
> -		cmd.tlbi.asid = inv->id;
> +		arm_smmu_cmdq_issue_cmd_with_sync(
> +			inv->smmu,
> +			arm_smmu_make_cmd_tlbi(inv->nsize_opcode, inv->id, 0));
>  		break;
>  	case INV_TYPE_S2_VMID:
>  		/* S2_VMID using nsize_opcode covers S2_VMID_S1_CLEAR */
> -		cmd.tlbi.vmid = inv->id;
> +		arm_smmu_cmdq_issue_cmd_with_sync(
> +			inv->smmu,
> +			arm_smmu_make_cmd_tlbi(inv->nsize_opcode, 0, inv->id));
>  		break;
>  	default:
>  		return;
>  	}
> -
> -	cmd.opcode = inv->nsize_opcode;
> -	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
> -	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, hw_cmd);
>  }
>  
>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 538380de7d48a0..16353596e08ad8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -583,6 +583,21 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_sync(unsigned int cs,
>  	return cmd;
>  }
>  
> +/*
> + * TLBI commands - the non-sized variants just need opcode + asid/vmid.
> + * For sized variants the caller sets up data[0] with the immutable fields
> + * (opcode + asid/vmid) and the range loop fills in per-iteration fields.
> + */
> +static inline struct arm_smmu_cmd
> +arm_smmu_make_cmd_tlbi(enum arm_smmu_cmdq_opcode op, u16 asid, u16 vmid)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(op);
> +
> +	cmd.data[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, asid) |
> +		       FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
> +	return cmd;
> +}
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -643,26 +658,6 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_sync(unsigned int cs,
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
>  
> -struct arm_smmu_cmdq_ent {
> -	/* Common fields */
> -	u8				opcode;
> -	bool				substream_valid;
> -
> -	/* Command-specific fields */
> -	union {
> -		struct {
> -			u8			num;
> -			u8			scale;
> -			u16			asid;
> -			u16			vmid;
> -			bool			leaf;
> -			u8			ttl;
> -			u8			tg;
> -			u64			addr;
> -		} tlbi;
> -	};
> -};
> -
>  struct arm_smmu_ll_queue {
>  	union {
>  		u64			val;
> -- 
> 2.43.0
> 

