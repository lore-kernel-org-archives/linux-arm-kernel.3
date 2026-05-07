Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA7BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdQjfHOoudoTP4zNLEK0/rz6Fm5ioqi3GcaesyNPhbA=; b=n1wj2sL6gJW60HxK69RRsFWmqi
	6yAJK8wTmCqDzbNqmVjW0aJqsACwW1ufgltiOQa8mzELaHnGMeJ09wUa7AJCi29SvrrJ/BPu3HpUP
	AL9TlKJHpeRacZcREURq1TitvrbRlI3SODl+ccGK1FTooDrFRLTU74AEVJhJrkoeZgfDjUyE524xP
	lgohnGSTxOE8guwvUsK5g+T+MTqomTZB8vzZpsM6yDeQAZ3HL/BhJK6n3dkmhPUBgQfnx4ikE2wUh
	IzsGhMYOTwPkkgKkpvVIyVBXze7ypJworgXOJfRR1skqRyRdJTUUCkZ5zf3bP+MZuJxy4DO17U3jo
	cDNCWzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvv-00000003JnF-2Dqi;
	Thu, 07 May 2026 09:22:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuvs-00000003JlS-3R6C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:22:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48d1c670255so77705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145731; x=1778750531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdQjfHOoudoTP4zNLEK0/rz6Fm5ioqi3GcaesyNPhbA=;
        b=S10ZIovAAHe5NPLVR9a7gSLUZUUKTghQ6BMYsT6UinPR6NllRAVLSnUX5NDllHraly
         TQo4pBc9w5R+s48NcdreYTSwlt7KV+ltRmmEjpb8CN/eoNjyzrhM6v75OxJCoIYjSUKN
         BnZeOH7+pdaIFIjdn+GJD0/71p/mDm2Fx4iLjPa52dEbc155ZEciYridzA1BqeN/Mm38
         8PoyKafmGlB2HbrGr9r2QGISri8uaVVGBkLz1g1NfmlZ3tedFtVh9UVC6SDIoGghmc/Q
         KkWo5GtxcLAjr/pLJQ+S4uPAhMsM/IAA3K10gxcv4UlZyOW2rHB1JEACIXfkc2bHDUwN
         zoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145731; x=1778750531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdQjfHOoudoTP4zNLEK0/rz6Fm5ioqi3GcaesyNPhbA=;
        b=pVp3ycuz9jFuy7EU2H/AWE5ZwCHHzHXAIdH/EOh0YALZP9TF2tf5HIxfwFSpfyrwrV
         nw2sr2LCkbbwfsZQzqzx1qh+urzUu4L5+UtGuq76pxKLWUO/FXlx+4E3V0HQozevi8yX
         mxFgRtqVp3pM24bqI6i0yNEUK5MVSK7repJZrtFGtvBM2SnTRvplFrXX+CcDRDlUKAbT
         ZsuNpoz3HDLIz8mIqs82/Jn9h2bC4cfYJJSdX6pzfF+qXM7/2Qauwva8xa8yCJNXI9Tr
         gohkzXFvM3dWQ3qZLOe67gzBOX+f574GQ+iaz+NhzhY6jdkKooTrFMoUxuX0v640zlCA
         wdqA==
X-Forwarded-Encrypted: i=1; AFNElJ/yhyXeXPywFgAH1WqrcNJ9tu68+ETh1Bage0yEWOoMGmLPmIUNTBUU1Oy4sObaxaG8gk0/yiuGv/SMeoN1eXS/@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ0qWBQdD/wOdIzAMyDhGL3elO04CTOS2KpXM9jUUIawGSWqP3
	+Yvz/aeElZtmsvljo+LJZH0SUZFp68MtgxTo1e5CKjF4FgdoRjEgoT8E3boiiABtbg==
X-Gm-Gg: AeBDies9qW8vjhkZs8oe35OsngF0h3zmGVIpfWcYzYmux8ID+uyGxTfOWGjMZ452nQ7
	dV3xJv+Q5E+qJzIktK2eEEWKUrcvGV5Ssw7B5miIQmwreLLnCR7zinJX31dFiHpmwK2pZdr5Cd0
	jtAjV5/N3JPLx3CTwmO6NFSJoKf4BMcfoATnCYuYBeHUsnLwCT/9K3UPbVtS8CEqUPjJSzv+2Zf
	Uw3TlIUIryQqvaB0Uj1R57dLbyGMKFkzNqpPsnZ18Dz3LXYApbpmYz6dzkdkqrdcEvu95tp1Q9I
	jQWaxAiHITJsV0s4e8uRtRwTWyIiwoM/ReamPOK2H7l71PZj7TIGyAjS+FMdExzlG8PWjdH0xpq
	lCnptMlG3lqLWfZ483bXrcHq6BG22/JM4PDhZoXaT11cfDNROS17TaQTdvFpcfMzH39pvoQc54S
	gS25m4KVDUUZzupZN5fTLFf5SVgK3udZ/SbLiiNP2Qe2WqtewL1AOPsyV+NsF29+DohI5yPijlz
	CbFSw==
X-Received: by 2002:a05:600d:8450:10b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-48e52d0a34fmr1539695e9.3.1778145730457;
        Thu, 07 May 2026 02:22:10 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5311f891sm56514085e9.4.2026.05.07.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:22:09 -0700 (PDT)
Date: Thu, 7 May 2026 09:22:05 +0000
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
Subject: Re: [PATCH 4/9] iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds
 to struct arm_smmu_cmd
Message-ID: <afxZvSt2uuW5OEU9@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022213_002977_744F4F18 
X-CRM114-Status: GOOD (  30.48  )
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

On Fri, May 01, 2026 at 11:29:13AM -0300, Jason Gunthorpe wrote:
> Convert the batch's type to also get the remaining helper functions to
> use the new type and complete replacing naked u64s with the new struct.
> 
> The low-level queue_write()/queue_read()/queue_remove_raw() functions
> remain u64-based since they are shared by event and PRI queues which
> have different entry sizes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 24 +++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 74 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 +-
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 +-
>  4 files changed, 58 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index ddae0b07c76b50..1e9f7d2de34414 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -300,7 +300,7 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
>  /* This is basically iommu_viommu_arm_smmuv3_invalidate in u64 for conversion */
>  struct arm_vsmmu_invalidation_cmd {
>  	union {
> -		u64 cmd[2];
> +		struct arm_smmu_cmd cmd;
>  		struct iommu_viommu_arm_smmuv3_invalidate ucmd;
>  	};
>  };
> @@ -316,32 +316,32 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
>  				      struct arm_vsmmu_invalidation_cmd *cmd)
>  {
>  	/* Commands are le64 stored in u64 */
> -	cmd->cmd[0] = le64_to_cpu(cmd->ucmd.cmd[0]);
> -	cmd->cmd[1] = le64_to_cpu(cmd->ucmd.cmd[1]);
> +	cmd->cmd.data[0] = le64_to_cpu(cmd->ucmd.cmd[0]);
> +	cmd->cmd.data[1] = le64_to_cpu(cmd->ucmd.cmd[1]);
>  
> -	switch (cmd->cmd[0] & CMDQ_0_OP) {
> +	switch (cmd->cmd.data[0] & CMDQ_0_OP) {
>  	case CMDQ_OP_TLBI_NSNH_ALL:
>  		/* Convert to NH_ALL */
> -		cmd->cmd[0] = CMDQ_OP_TLBI_NH_ALL |
> +		cmd->cmd.data[0] = CMDQ_OP_TLBI_NH_ALL |
>  			      FIELD_PREP(CMDQ_TLBI_0_VMID, vsmmu->vmid);
> -		cmd->cmd[1] = 0;
> +		cmd->cmd.data[1] = 0;
>  		break;
>  	case CMDQ_OP_TLBI_NH_VA:
>  	case CMDQ_OP_TLBI_NH_VAA:
>  	case CMDQ_OP_TLBI_NH_ALL:
>  	case CMDQ_OP_TLBI_NH_ASID:
> -		cmd->cmd[0] &= ~CMDQ_TLBI_0_VMID;
> -		cmd->cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vsmmu->vmid);
> +		cmd->cmd.data[0] &= ~CMDQ_TLBI_0_VMID;
> +		cmd->cmd.data[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vsmmu->vmid);
>  		break;
>  	case CMDQ_OP_ATC_INV:
>  	case CMDQ_OP_CFGI_CD:
>  	case CMDQ_OP_CFGI_CD_ALL: {
> -		u32 sid, vsid = FIELD_GET(CMDQ_CFGI_0_SID, cmd->cmd[0]);
> +		u32 sid, vsid = FIELD_GET(CMDQ_CFGI_0_SID, cmd->cmd.data[0]);
>  
>  		if (arm_vsmmu_vsid_to_sid(vsmmu, vsid, &sid))
>  			return -EIO;
> -		cmd->cmd[0] &= ~CMDQ_CFGI_0_SID;
> -		cmd->cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, sid);
> +		cmd->cmd.data[0] &= ~CMDQ_CFGI_0_SID;
> +		cmd->cmd.data[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, sid);
>  		break;
>  	}
>  	default:
> @@ -386,7 +386,7 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
>  			continue;
>  
>  		/* FIXME always uses the main cmdq rather than trying to group by type */
> -		ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, last->cmd,
> +		ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &last->cmd,
>  						  cur - last, true);
>  		if (ret) {
>  			cur--;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 67d23e9c54804e..b3ef001ce80d23 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -268,9 +268,12 @@ static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
>  }
>  
>  /* High-level queue accessors */
> -static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> +static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
> +				   struct arm_smmu_cmdq_ent *ent)
>  {
> -	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
> +	u64 *cmd = cmd_out->data;
> +
> +	memset(cmd_out, 0, sizeof(*cmd_out));
>  	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
>  
>  	switch (ent->opcode) {
> @@ -390,7 +393,8 @@ static bool arm_smmu_cmdq_needs_busy_polling(struct arm_smmu_device *smmu,
>  	return smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV;
>  }
>  
> -static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
> +static void arm_smmu_cmdq_build_sync_cmd(struct arm_smmu_cmd *cmd,
> +					 struct arm_smmu_device *smmu,
>  					 struct arm_smmu_cmdq *cmdq, u32 prod)
>  {
>  	struct arm_smmu_queue *q = &cmdq->q;
> @@ -409,7 +413,8 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
>  
>  	arm_smmu_cmdq_build_cmd(cmd, &ent);
>  	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
> -		u64p_replace_bits(cmd, CMDQ_SYNC_0_CS_NONE, CMDQ_SYNC_0_CS);
> +		u64p_replace_bits(&cmd->data[0], CMDQ_SYNC_0_CS_NONE,
> +				  CMDQ_SYNC_0_CS);
>  }
>  
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
> @@ -422,9 +427,8 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  		[CMDQ_ERR_CERROR_ATC_INV_IDX]	= "ATC invalidate timeout",
>  	};
>  	struct arm_smmu_queue *q = &cmdq->q;
> -
>  	int i;
> -	u64 cmd[CMDQ_ENT_DWORDS];
> +	struct arm_smmu_cmd cmd;
>  	u32 cons = readl_relaxed(q->cons_reg);
>  	u32 idx = FIELD_GET(CMDQ_CONS_ERR, cons);
>  	struct arm_smmu_cmdq_ent cmd_sync = {
> @@ -457,17 +461,18 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  	 * We may have concurrent producers, so we need to be careful
>  	 * not to touch any of the shadow cmdq state.
>  	 */
> -	queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
> +	queue_read(cmd.data, Q_ENT(q, cons), q->ent_dwords);
>  	dev_err(smmu->dev, "skipping command in error state:\n");
> -	for (i = 0; i < ARRAY_SIZE(cmd); ++i)
> -		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
> +	for (i = 0; i < ARRAY_SIZE(cmd.data); ++i)
> +		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd.data[i]);
>  
>  	/* Convert the erroneous command into a CMD_SYNC */
> -	arm_smmu_cmdq_build_cmd(cmd, &cmd_sync);
> +	arm_smmu_cmdq_build_cmd(&cmd, &cmd_sync);
>  	if (arm_smmu_cmdq_needs_busy_polling(smmu, cmdq))
> -		u64p_replace_bits(cmd, CMDQ_SYNC_0_CS_NONE, CMDQ_SYNC_0_CS);
> +		u64p_replace_bits(&cmd.data[0], CMDQ_SYNC_0_CS_NONE,
> +				  CMDQ_SYNC_0_CS);
>  
> -	queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
> +	queue_write(Q_ENT(q, cons), cmd.data, q->ent_dwords);
>  }
>  
>  static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
> @@ -767,7 +772,8 @@ static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
>  	return __arm_smmu_cmdq_poll_until_consumed(smmu, cmdq, llq);
>  }
>  
> -static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64 *cmds,
> +static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq,
> +					struct arm_smmu_cmd *cmds,
>  					u32 prod, int n)
>  {
>  	int i;
> @@ -777,10 +783,9 @@ static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64 *cmds,
>  	};
>  
>  	for (i = 0; i < n; ++i) {
> -		u64 *cmd = &cmds[i * CMDQ_ENT_DWORDS];
> -
>  		prod = queue_inc_prod_n(&llq, i);
> -		queue_write(Q_ENT(&cmdq->q, prod), cmd, CMDQ_ENT_DWORDS);
> +		queue_write(Q_ENT(&cmdq->q, prod), cmds[i].data,
> +			    ARRAY_SIZE(cmds[i].data));
>  	}
>  }
>  
> @@ -801,10 +806,11 @@ static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64 *cmds,
>   *   CPU will appear before any of the commands from the other CPU.
>   */
>  int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> -				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
> +				struct arm_smmu_cmdq *cmdq,
> +				struct arm_smmu_cmd *cmds, int n,
>  				bool sync)
>  {
> -	u64 cmd_sync[CMDQ_ENT_DWORDS];
> +	struct arm_smmu_cmd cmd_sync;
>  	u32 prod;
>  	unsigned long flags;
>  	bool owner;
> @@ -847,8 +853,9 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  	arm_smmu_cmdq_write_entries(cmdq, cmds, llq.prod, n);
>  	if (sync) {
>  		prod = queue_inc_prod_n(&llq, n);
> -		arm_smmu_cmdq_build_sync_cmd(cmd_sync, smmu, cmdq, prod);
> -		queue_write(Q_ENT(&cmdq->q, prod), cmd_sync, CMDQ_ENT_DWORDS);
> +		arm_smmu_cmdq_build_sync_cmd(&cmd_sync, smmu, cmdq, prod);
> +		queue_write(Q_ENT(&cmdq->q, prod), cmd_sync.data,
> +			    ARRAY_SIZE(cmd_sync.data));
>  
>  		/*
>  		 * In order to determine completion of our CMD_SYNC, we must
> @@ -925,7 +932,7 @@ static int __arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>  				     bool sync)
>  {
>  	return arm_smmu_cmdq_issue_cmdlist(
> -		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd->data, 1, sync);
> +		smmu, arm_smmu_get_cmdq(smmu, cmd), cmd, 1, sync);
>  }
>  
>  static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> @@ -954,7 +961,7 @@ static void arm_smmu_cmdq_batch_init(struct arm_smmu_device *smmu,
>  {
>  	struct arm_smmu_cmd cmd;
>  
> -	arm_smmu_cmdq_build_cmd(cmd.data, ent);
> +	arm_smmu_cmdq_build_cmd(&cmd, ent);
>  	arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  }
>  
> @@ -966,9 +973,8 @@ static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>  			  (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC);
>  	struct arm_smmu_cmd cmd;
>  	bool unsupported_cmd;
> -	int index;
>  
> -	if (unlikely(arm_smmu_cmdq_build_cmd(cmd.data, ent))) {
> +	if (unlikely(arm_smmu_cmdq_build_cmd(&cmd, ent))) {
>  		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>  			 ent->opcode);
>  		return;
> @@ -987,9 +993,7 @@ static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>  		arm_smmu_cmdq_batch_init_cmd(smmu, cmds, &cmd);
>  	}
>  
> -	index = cmds->num * CMDQ_ENT_DWORDS;
> -	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
> -	cmds->num++;
> +	cmds->cmds[cmds->num++] = cmd;
>  }
>  
>  static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
> @@ -1025,7 +1029,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
>  		break;
>  	}
>  
> -	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
>  	arm_smmu_cmdq_issue_cmd(master->smmu, &hw_cmd);
>  
>  	/*
> @@ -1865,7 +1869,7 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
>  	};
>  	struct arm_smmu_cmd cmd;
>  
> -	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
> +	arm_smmu_cmdq_build_cmd(&cmd, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(writer->master->smmu, &cmd);
>  }
>  
> @@ -1899,7 +1903,7 @@ static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
>  					 } };
>  		struct arm_smmu_cmd prefetch_cmd;
>  
> -		arm_smmu_cmdq_build_cmd(prefetch_cmd.data, &prefetch_ent);
> +		arm_smmu_cmdq_build_cmd(&prefetch_cmd, &prefetch_ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
>  	}
>  }
> @@ -2339,7 +2343,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  		};
>  		struct arm_smmu_cmd cmd;
>  
> -		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
> +		arm_smmu_cmdq_build_cmd(&cmd, &ent);
>  		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  	}
>  }
> @@ -3462,7 +3466,7 @@ static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
>  	}
>  
>  	cmd.opcode = inv->nsize_opcode;
> -	arm_smmu_cmdq_build_cmd(hw_cmd.data, &cmd);
> +	arm_smmu_cmdq_build_cmd(&hw_cmd, &cmd);
>  	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &hw_cmd);
>  }
>  
> @@ -4875,18 +4879,18 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  
>  	/* Invalidate any cached configuration */
>  	ent.opcode = CMDQ_OP_CFGI_ALL;
> -	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
> +	arm_smmu_cmdq_build_cmd(&cmd, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Invalidate any stale TLB entries */
>  	if (smmu->features & ARM_SMMU_FEAT_HYP) {
>  		ent.opcode = CMDQ_OP_TLBI_EL2_ALL;
> -		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
> +		arm_smmu_cmdq_build_cmd(&cmd, &ent);
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  
>  	ent.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> -	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
> +	arm_smmu_cmdq_build_cmd(&cmd, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Event queue */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 6d73f6b63e64a9..1fe6917448b774 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -651,7 +651,7 @@ static inline bool arm_smmu_cmdq_supports_cmd(struct arm_smmu_cmdq *cmdq,
>  }
>  
>  struct arm_smmu_cmdq_batch {
> -	u64				cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
> +	struct arm_smmu_cmd		cmds[CMDQ_BATCH_ENTRIES];
>  	struct arm_smmu_cmdq		*cmdq;
>  	int				num;
>  };
> @@ -1148,7 +1148,8 @@ void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
>  				  const struct arm_smmu_ste *target);
>  
>  int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> -				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
> +				struct arm_smmu_cmdq *cmdq,
> +				struct arm_smmu_cmd *cmds, int n,
>  				bool sync);
>  
>  #ifdef CONFIG_ARM_SMMU_V3_SVA
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index b4d8c1f2fd3878..67be62a6e7640a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -427,16 +427,16 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
>  static void tegra241_vcmdq_hw_flush_timeout(struct tegra241_vcmdq *vcmdq)
>  {
>  	struct arm_smmu_device *smmu = &vcmdq->cmdqv->smmu;
> -	u64 cmd_sync[CMDQ_ENT_DWORDS] = {};
> +	struct arm_smmu_cmd cmd_sync = {};
>  
> -	cmd_sync[0] = FIELD_PREP(CMDQ_0_OP, CMDQ_OP_CMD_SYNC) |
> -		      FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_NONE);
> +	cmd_sync.data[0] = FIELD_PREP(CMDQ_0_OP, CMDQ_OP_CMD_SYNC) |
> +			   FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_NONE);
>  
>  	/*
>  	 * It does not hurt to insert another CMD_SYNC, taking advantage of the
>  	 * arm_smmu_cmdq_issue_cmdlist() that waits for the CMD_SYNC completion.
>  	 */
> -	arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, cmd_sync, 1, true);
> +	arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, &cmd_sync, 1, true);
>  }
>  
>  /* This function is for LVCMDQ, so @vcmdq must not be unmapped yet */
> -- 
> 2.43.0
> 

