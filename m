Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B18CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13Lh/MJGuQyEFBuGKtOzxhjY59QJuViQArYZ+z8Orn8=; b=n+/rKO4Zc3XiNus83V+wfH8c0B
	b5DkNsM5/Z43cSGFiGL0IZDXrEES7Px1tF1byPEfA897A0Ww7NQcLsT7zUxGgQv4hf//+r1hT8zGt
	qmu3ycO1ebV5LPI0KhzPxEwxBOEPqdIGhkXzwsViL0Tt9M7DTom8NWtmqyVY+VADX4je8ekDjKShW
	StPKb6Mqkj74fjKRbCchS1UDCUhzhxEPPPnBiunmwoC0KMmwsSn9ZtMdyWALNNOYl4HkXuMyXoC8f
	fL9YJWogxcAXPo3z4gHx0hLGTLwVDW3UbBLKCi6ZfgkflY6V3asgZqElk5BNmEZS9KIFldQuf21hk
	ARMCpzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxL-00000003KRi-0Lco;
	Thu, 07 May 2026 09:23:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxJ-00000003KQW-0anB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:23:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48d1c670255so78035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145819; x=1778750619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13Lh/MJGuQyEFBuGKtOzxhjY59QJuViQArYZ+z8Orn8=;
        b=TmRe4dllcX09z78vzfEuIx7/pH60l+VBSZwHyOQKGehqFKsf3kUnz9TcqJmMVgLyqq
         rXWTSn4XTPd8803eocDi7SeQugNv4AUG7uYfJXaPzJBZkbqzueGcKsT0dIwyQ1fRAIfo
         Lk/pXJbttWiNkZ70lx2+EDCoJy+RIAuoNZoaqwYTIgHjlQefASg2tlKhUkNHK2RFex0n
         Q3OEB0lsuZ1ZbH/gDF0FXag6VgQGbHcma8z7MfHF4w3N2POKZFmhP5ZRVAjlcr7V2yOt
         Lg/kFW/IK0Pve2Y9wHaZe+n2I4WWdN3+1vNQ1yNPQu3R05H5ysKwY60K253sAnyCk/Ct
         +Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145819; x=1778750619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13Lh/MJGuQyEFBuGKtOzxhjY59QJuViQArYZ+z8Orn8=;
        b=WRMCvLbM1bUH08H7bEowULDYBZ2/jH9gNWVKyM4AGRY1TPkUp7a364BBWCx+Mp1iru
         0VqSUFnqARSSo2jZffBlHHwa3ZqidAckQMxxpldesvM9J8tkobIyPyXhpvAiOWMCrH9+
         Wp2phYQGIyKo4XT1sv+/8e8nitQmkmsyonlG1XBRkBHwy3OBdsWEPC+G8DwqBrXnNFj+
         DqKwFC3inOKnsMZK47DQC9pr7aidaI3Cq2f2WNAYZLFgNcM0Uzci92gy4L29CUEK3IpN
         0lrbXLc7DAaVcslT5aTI1tHv/MIpl5B6Qa2jlSDNEJrgiVq9jluvDXti9BxfOh5BPaII
         GeBg==
X-Forwarded-Encrypted: i=1; AFNElJ8BxQdlgWn1D3PowseXVD4UolT+zAjKYgnusYhgJyQiI6y2CGgNMfLU0siwdNQ0NuZSG6QGVi255PQxBLD6IBjW@lists.infradead.org
X-Gm-Message-State: AOJu0YxcwnWrfblvTOYCFbIi9IdFt7k5DszPZ9AnCC33zL+gjKKmT6BG
	OJ0+JNsEJC2I01yXANgyC9YvR2BjqYfouLkmm4oRFd7vOWUY51996umo3lArJvydqg==
X-Gm-Gg: AeBDietYXGLxQNwlB0rm9Sb/aQ/khAUoT1SMXccOeEZNImpnEWvtd+XwjkJAU+zGr0A
	iLZ95aCsEL/rdP3iPhreef/VgAi9wHlgtqXkrcdtBKcvYszSpYRIPKlrYyqCcIPWIjhUB8gPGwP
	1RaMfPAm5dsxmzT8pbAu4nyaGPMCEsj+2le1uwhNoYMnb1Q/9rZJb+Hl8G7JnOBKVaNYdsBO7lM
	TimJcxpeqTiK84sANEQt0OkadDOPxi1VRs7PmzwaNW3j6jAIsakpqy/TYjvB3wz3M9hd6v6oavu
	eYDp4UFpR+kcn9T8voLHRiB4E1z+N8jOzgOqtKkoGrNUCUk+IXvqXs/gDOnQq2I9yH+gEjzy3fC
	6p5aWhhcDEsnsp82AY998Ny3lZE5e3HEm7GMc0v83XDQsIA7pHJyGnev1d480Fxowb5MgtlXmUK
	L8YfGS4pyKJQUGCmowT6Yc+wwEsqYjyADXGjNwB43qTKPVBYG82OoqapaF6wnILRsCUaS53aap6
	K1LYA==
X-Received: by 2002:a05:600c:2284:b0:488:960f:60b8 with SMTP id 5b1f17b1804b1-48e5d64bc85mr781205e9.6.1778145818767;
        Thu, 07 May 2026 02:23:38 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5314b989sm36568205e9.30.2026.05.07.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:23:38 -0700 (PDT)
Date: Thu, 7 May 2026 09:23:34 +0000
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
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <afxaFjFf2c5R6jAc@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022341_217041_07685AAE 
X-CRM114-Status: GOOD (  25.42  )
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

On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> Add a new command make function and convert all the places using
> ATC_INV.
> 
> Split out full invalidation to directly make the cmd instead of
> overloading size=0 to mean full invalidation.

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 59 ++++++++-------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 27 +++++++---
>  2 files changed, 40 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index f9c25ca9a9e7b8..0cdf0752ff6d62 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -308,14 +308,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  	case CMDQ_OP_TLBI_EL2_ASID:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		break;
> -	case CMDQ_OP_ATC_INV:
> -		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
> -		cmd[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
> -		cmd[1] |= ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
> -		break;
>  	case CMDQ_OP_CMD_SYNC:
>  		if (ent->sync.msiaddr) {
>  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
> @@ -2371,9 +2363,8 @@ static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static void
> -arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
> -			struct arm_smmu_cmdq_ent *cmd)
> +static struct arm_smmu_cmd
> +arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
>  {
>  	size_t log2_span;
>  	size_t span_mask;
> @@ -2395,17 +2386,6 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  	 * This has the unpleasant side-effect of invalidating all PASID-tagged
>  	 * ATC entries within the address range.
>  	 */
> -	*cmd = (struct arm_smmu_cmdq_ent) {
> -		.opcode			= CMDQ_OP_ATC_INV,
> -		.substream_valid	= (ssid != IOMMU_NO_PASID),
> -		.atc.ssid		= ssid,
> -	};
> -
> -	if (!size) {
> -		cmd->atc.size = ATC_INV_SIZE_ALL;
> -		return;
> -	}
> -
>  	page_start	= iova >> inval_grain_shift;
>  	page_end	= (iova + size - 1) >> inval_grain_shift;
>  
> @@ -2434,24 +2414,25 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  
>  	page_start	&= ~span_mask;
>  
> -	cmd->atc.addr	= page_start << inval_grain_shift;
> -	cmd->atc.size	= log2_span;
> +	return arm_smmu_make_cmd_atc_inv(sid, ssid,
> +					 page_start << inval_grain_shift,
> +					 log2_span);
>  }
>  
>  static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>  				   ioasid_t ssid)
>  {
>  	int i;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmd cmd;
>  	struct arm_smmu_cmdq_batch cmds;
>  
> -	arm_smmu_atc_inv_to_cmd(ssid, 0, 0, &cmd);
> -
> -	arm_smmu_cmdq_batch_init(master->smmu, &cmds, &cmd);
> -	for (i = 0; i < master->num_streams; i++) {
> -		cmd.atc.sid = master->streams[i].id;
> -		arm_smmu_cmdq_batch_add(master->smmu, &cmds, &cmd);
> -	}
> +	cmd = arm_smmu_make_cmd_atc_inv_all(0, IOMMU_NO_PASID);
> +	arm_smmu_cmdq_batch_init_cmd(master->smmu, &cmds, &cmd);
> +	for (i = 0; i < master->num_streams; i++)
> +		arm_smmu_cmdq_batch_add_cmd(
> +			master->smmu, &cmds,
> +			arm_smmu_make_cmd_atc_inv_all(master->streams[i].id,
> +						      ssid));
>  
>  	return arm_smmu_cmdq_batch_submit(master->smmu, &cmds);
>  }
> @@ -2650,14 +2631,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
>  			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
>  			break;
>  		case INV_TYPE_ATS:
> -			arm_smmu_atc_inv_to_cmd(cur->ssid, iova, size, &cmd);
> -			cmd.atc.sid = cur->id;
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add_cmd(
> +				smmu, &cmds,
> +				arm_smmu_atc_inv_to_cmd(cur->id, cur->ssid,
> +							iova, size));
>  			break;
>  		case INV_TYPE_ATS_FULL:
> -			arm_smmu_atc_inv_to_cmd(IOMMU_NO_PASID, 0, 0, &cmd);
> -			cmd.atc.sid = cur->id;
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add_cmd(
> +				smmu, &cmds,
> +				arm_smmu_make_cmd_atc_inv_all(cur->id,
> +							      IOMMU_NO_PASID));
>  			break;
>  		default:
>  			WARN_ON_ONCE(1);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 10b3d95d9ee660..194f73cabef5c9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -552,6 +552,25 @@ static inline struct arm_smmu_cmd arm_smmu_make_cmd_pri_resp(u32 sid, u32 ssid,
>  	return cmd;
>  }
>  
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv(u32 sid, u32 ssid,
> +							    u64 addr, u8 size)
> +{
> +	struct arm_smmu_cmd cmd = arm_smmu_make_cmd_op(CMDQ_OP_ATC_INV);
> +
> +	cmd.data[0] |= FIELD_PREP(CMDQ_0_SSV, ssid != IOMMU_NO_PASID) |
> +		       FIELD_PREP(CMDQ_ATC_0_SSID, ssid) |
> +		       FIELD_PREP(CMDQ_ATC_0_SID, sid);
> +	cmd.data[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, size) |
> +		       (addr & CMDQ_ATC_1_ADDR_MASK);
> +	return cmd;
> +}
> +
> +static inline struct arm_smmu_cmd arm_smmu_make_cmd_atc_inv_all(u32 sid,
> +								u32 ssid)
> +{
> +	return arm_smmu_make_cmd_atc_inv(sid, ssid, 0, ATC_INV_SIZE_ALL);
> +}
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -630,14 +649,6 @@ struct arm_smmu_cmdq_ent {
>  			u64			addr;
>  		} tlbi;
>  
> -		struct {
> -			u32			sid;
> -			u32			ssid;
> -			u64			addr;
> -			u8			size;
> -			bool			global;
> -		} atc;
> -
>  		struct {
>  			u64			msiaddr;
>  		} sync;
> -- 
> 2.43.0
> 

