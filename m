Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B7CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai1mjdaGlVBkCBIP9diG+ogiRNDiO8yYkk2TUIEuBxM=; b=shFntNpowjnyLrUMNpnTOrti6v
	a70OPm8ie4iKFnzA/6QU3MquK+HPhViRsmHp1o4SYMM4Vzix1yEL0yuX61G/BdHibiaXs9fQXxRlt
	l0eYkJXqKAIjlDR7aPeGPdDLfvcUWbwa65ohbPw7x1M9VmWrjuE3CcihcQF3Mo5sD/7oZScfHUs2v
	spm9AP7WGFdNeadbRG9sP5r/8RrQcIIN6F4gKdqZNF8a5qDwqbuw1lVGlAFNmsZ3gd+WKIkio/xbE
	QVEv9tiV0d/i12g4s0ul5jgeWURQiBd1ava83RVoD4Rhd/vMBeGIaguw4YiOXtSVIdFDTkjZBai7Y
	CsmeY7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxl-00000003KY7-0pDM;
	Thu, 07 May 2026 09:24:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxj-00000003KXP-2C32
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:24:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48d1c670255so78135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145846; x=1778750646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai1mjdaGlVBkCBIP9diG+ogiRNDiO8yYkk2TUIEuBxM=;
        b=u+5o5T0KS4gPb2TFdyzmUN8yoY+00IcHahleEP+rGiTn+lNgvIcYbVTDaeS1p/6M81
         la4so8FJTVt8vk1Il3g26/DLimQL7p+5Y566s+dT+I19wQwwWUnnPwru++zIl9bft89L
         2cb8tMIcoVDKxUW5znXoykvQCEccTKIeVZPi5P3IfBCe04be4awwokwDnE2M0Xc5Z2jC
         PewcqpMrhSjOuLtildkDJvHw/ou58llEmjQiucOWjIxhq81XWI8UpgQxZR/7o7Cle/CR
         +j3tY4oEQhuzmI3qRywd4DbTsCGSATB5W9D0ajnRoro1pswP0GsB/nMkpocVvCRYW5F4
         BBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145846; x=1778750646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ai1mjdaGlVBkCBIP9diG+ogiRNDiO8yYkk2TUIEuBxM=;
        b=B6zeoQlv7f+62eY4S83ec9lQhDHhMODIVcPxR95GAZ66Qgq2NH/PcxQUZcUZwZUyAI
         KmuL0t9e82YRah6EnXRxNSDw3nyOfWL6ZkvvOfpgdLK/FGuGhRDg4TnJyNRDoaTHsugF
         k8tA2uRoEsuQEVo0cYJepfX0VHqRhXKDk5U6iy+a9kpQBUihIV2HOpQxebkZBHCfiJ4X
         Rp40UWyZuxnihp9kcAu0cdBD/tssY8aWhi+8jXbXOvnWAx5Few2sCTLbIBaxlWif3b6r
         BZWd/cGVk8nkDyQv7E5kN8pc6vsE+HKY27o90fNCOtw3R5VRWN9D7dKit4QcFWcF+4yl
         ydWw==
X-Forwarded-Encrypted: i=1; AFNElJ+7VnMPXHL4NanP4Gxfz1UcMhU4yDojJherZcy6lr0JQYXZruucxRVDFw9Ps6PXHiUJmTGQcFe6KGi6h+z5cJ0+@lists.infradead.org
X-Gm-Message-State: AOJu0YzTO1s8Y+fTEsowQwFcASOFXfA8E9V8N/NpMdjJ3MHhMm26+zEX
	a1CBL72z7v1yKM2frB1Q0PNw9rFiUeDX23prV4+bd4oLeiBNXpbkKl3zeObr8b3ZfQ==
X-Gm-Gg: AeBDiesdz5uUJRI1jTTcI4q3ku+N7/r58FleCNGUtnfzvni4Ztc8xZFR2lEmABz9Ky3
	ooEcubpLN/uzxmo/JjBQOHNQJfId8087/LroJV3FQZHlpwpzDnXkKq2ZpSfjuT2UBGL9v81jMoP
	JyW4fe7EniGIAr6mDrK1rx3Utahr2Hq8Xw8JhfjWSG0PxVDTanhXW2jVj44FMa6lNzFVP+ulAHb
	+3E1+00iuvrY6OFL/C7ScQ/qw1ZAdbh9dTBbQVxbmu3j9MmIWHagRKLNDhMdOa8hZZ/hsM8D2Qr
	1DILt0etwZGaUKXg0fx2SrsnHj3GPS3TOiH+nPUEy6Jogi9Kih1TBCr24zmscyhbne35b7ZH2M0
	AvuqyKxOE7PADqnh3/itEM56XMieah+zMOF2bLdj4goA/lNpfD9XNqSnfOrdIdk0lkGFFtRndtx
	OTA89Tq+GGh3On6JAcQucYDdAdQQ2lJxXHwmGYM1zpriJEJm3JxdjcCkTfPYyjZReC8D0DlUf75
	TzuXw==
X-Received: by 2002:a05:600c:290b:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-48e5d44ad60mr815245e9.2.1778145845209;
        Thu, 07 May 2026 02:24:05 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e531578c8sm38692025e9.34.2026.05.07.02.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:24:03 -0700 (PDT)
Date: Thu, 7 May 2026 09:23:58 +0000
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
Subject: Re: [PATCH 8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
Message-ID: <afxaLqckXhW_BUnw@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022407_589836_67C4CB4B 
X-CRM114-Status: GOOD (  24.74  )
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

On Fri, May 01, 2026 at 11:29:17AM -0300, Jason Gunthorpe wrote:
> Change the flow so the caller controls the CS field and remove the
> weird u64p_replace_bits() thing to override it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 42 ++++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 16 ++++++--
>  2 files changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0cdf0752ff6d62..8147b9cdcc6b99 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -308,16 +308,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  	case CMDQ_OP_TLBI_EL2_ASID:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		break;
> -	case CMDQ_OP_CMD_SYNC:
> -		if (ent->sync.msiaddr) {
> -			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
> -			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
> -		} else {
> -			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> -		}
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> -		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> -		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -350,23 +340,24 @@ static void arm_smmu_cmdq_build_sync_cmd(struct arm_smmu_cmd *cmd,
>  					 struct arm_smmu_cmdq *cmdq, u32 prod)
>  {
>  	struct arm_smmu_queue *q = &cmdq->q;
> -	struct arm_smmu_cmdq_ent ent = {
> -		.opcode = CMDQ_OP_CMD_SYNC,
> -	};
> +	u64 msiaddr = 0;
> +	unsigned int cs;
>  
>  	/*
>  	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
>  	 * payload, so the write will zero the entire command on that platform.
>  	 */
> -	if (smmu->options & ARM_SMMU_OPT_MSIPOLL) {
> -		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
> -				   q->ent_dwords * 8;
> +	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq)) {
> +		cs = CMDQ_SYNC_0_CS_NONE;
> +	} else if (smmu->options & ARM_SMMU_OPT_MSIPOLL) {
> +		cs = CMDQ_SYNC_0_CS_IRQ;
> +		msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
> +			  q->ent_dwords * 8;
> +	} else {
> +		cs = CMDQ_SYNC_0_CS_SEV;
>  	}
>  
> -	arm_smmu_cmdq_build_cmd(cmd, &ent);
> -	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
> -		u64p_replace_bits(&cmd->data[0], CMDQ_SYNC_0_CS_NONE,
> -				  CMDQ_SYNC_0_CS);
> +	*cmd = arm_smmu_make_cmd_sync(cs, msiaddr);
>  }
>  
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
> @@ -383,9 +374,6 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  	struct arm_smmu_cmd cmd;
>  	u32 cons = readl_relaxed(q->cons_reg);
>  	u32 idx = FIELD_GET(CMDQ_CONS_ERR, cons);
> -	struct arm_smmu_cmdq_ent cmd_sync = {
> -		.opcode = CMDQ_OP_CMD_SYNC,
> -	};
>  
>  	dev_err(smmu->dev, "CMDQ error (cons 0x%08x): %s\n", cons,
>  		idx < ARRAY_SIZE(cerror_str) ?  cerror_str[idx] : "Unknown");
> @@ -419,10 +407,10 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd.data[i]);
>  
>  	/* Convert the erroneous command into a CMD_SYNC */
> -	arm_smmu_cmdq_build_cmd(&cmd, &cmd_sync);
> -	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
> -		u64p_replace_bits(&cmd.data[0], CMDQ_SYNC_0_CS_NONE,
> -				  CMDQ_SYNC_0_CS);
> +	cmd = arm_smmu_make_cmd_sync(
> +		arm_smmu_cmdq_needs_busy_polling(smmu, cmdq) ?
> +			CMDQ_SYNC_0_CS_NONE : CMDQ_SYNC_0_CS_SEV,
> +		0);
>  
>  	queue_write(Q_ENT(q, cons), cmd.data, q->ent_dwords);
>  }
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 194f73cabef5c9..538380de7d48a0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -571,6 +571,18 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv_all(u32 sid,
>  	return arm_smmu_make_cmd_atc_inv(sid, ssid, 0, ATC_INV_SIZE_ALL);
>  }
>  
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_sync(unsigned int cs,
> +							 u64 msiaddr)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_CMD_SYNC);
> +
> +	cmd.data[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, cs) |
> +		       FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH) |
> +		       FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +	cmd.data[1] |= msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
> +	return cmd;
> +}
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -648,10 +660,6 @@ struct arm_smmu_cmdq_ent {
>  			u8			tg;
>  			u64			addr;
>  		} tlbi;
> -
> -		struct {
> -			u64			msiaddr;
> -		} sync;
>  	};
>  };
>  
> -- 
> 2.43.0
> 

