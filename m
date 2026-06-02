Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C3CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bNLFBK1Y83+hE+EiqlLfrxOTlslRiR1hkYndMhTlvg=; b=H0PQdTOgaKmJNDXLBuEDXOyJYB
	QjPAuFRROo8RuhqEzEHxCXUQNxovNDNzklBJLfXBYZ/Ogdb6wzHDzIvJmZiypppYdGeWpt2I3Ua+J
	3MwigHTlTg/4xGyOKJ2Jp329Sf8wFrK/bqYPqO+UnfNiZHe5yON/Mq4tb67uI+40Jlpzdzq5HYl/e
	GrUqTkxnVR7xcJj6QG/8fzaSmtyg1Lod82nZbqRU7D2Lx0Ba9FMUG1Wh7tAnz7do25mbX1g2B6Lls
	C3cADixY3tI+8VJ0ATHTdQ4ULBSBmQxZ7OEn9Iv+koc9/5Y93Vm138quXVod0eMj9hZO+O3TRnxl0
	9CVo9Kiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVd1-0000000DjdQ-3kUP;
	Tue, 02 Jun 2026 20:22:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVcy-0000000Djcv-3KqJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:22:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B69944292;
	Tue,  2 Jun 2026 20:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E481F00893;
	Tue,  2 Jun 2026 20:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780431740;
	bh=9bNLFBK1Y83+hE+EiqlLfrxOTlslRiR1hkYndMhTlvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YwSdXW7cgnumKHsL2ls94fDm0wGSWGzWSpmU2MLe5+MQFCIAkhvHQyWNTs1p39mel
	 y0vHjbwfzuduF1D9kPwsnrlD6ImBpsNO1kFgUV2QJSMVOCOeEI3w/SyuKDY04vrskB
	 rpgJOepJv3JLAXXXNucWh3++hSreJMAWapJ348o5EVLLCJcix0nPNdvVg482BkPQij
	 X3alDB6kCkon9Ga07H8LCUpFT8FkOmchDx1nqNmUS088fUT9A45ionY00LUKO5/vw/
	 bxN+JhCzsIWhxxZ24z6enT4/5JcG/g7xfng9ffpoG047duBPVviWNwoKyDHnrgRkgm
	 d4rHqDr562sbw==
Date: Tue, 2 Jun 2026 21:22:15 +0100
From: Will Deacon <will@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <ah87dzHOOTNGBBmt@willie-the-truck>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601104845.995005-4-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_132220_878888_25C1A745 
X-CRM114-Status: GOOD (  28.95  )
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

On Mon, Jun 01, 2026 at 10:48:45AM +0000, Ashish Mhetre wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 1e9f7d2de344..78c96a2b652b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -350,6 +350,26 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
>  	return 0;
>  }
>  
> +/*
> + * On Tegra264, arm_smmu_cmdq_issue_cmdlist() doubles every CFGI/TLBI
> + * submission (see ARM_SMMU_OPT_TLBI_TWICE). The doubling decision is
> + * taken once per cmdlist based on the first command, so a single
> + * batch must not mix commands that need doubling with commands that
> + * do not. Split the iommufd batch whenever the next user command
> + * crosses that boundary.
> + */

Again, I wouldn't bother with this comment. You probably _should_ update
Documentation/arch/arm64/silicon-errata.rst, however.

> +static bool arm_vsmmu_can_batch_cmd(struct arm_smmu_device *smmu,
> +				    struct arm_vsmmu_invalidation_cmd *last,
> +				    struct arm_vsmmu_invalidation_cmd *next)
> +{
> +	struct arm_smmu_cmd next_cmd = {
> +		.data[0] = le64_to_cpu(next->ucmd.cmd[0]),
> +	};
> +
> +	return arm_smmu_cmd_needs_tlbi_twice(smmu, &last->cmd) ==
> +	       arm_smmu_cmd_needs_tlbi_twice(smmu, &next_cmd);
> +}
> +
>  int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
>  			       struct iommu_user_data_array *array)
>  {
> @@ -382,7 +402,8 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
>  
>  		/* FIXME work in blocks of CMDQ_BATCH_ENTRIES and copy each block? */
>  		cur++;
> -		if (cur != end && (cur - last) != CMDQ_BATCH_ENTRIES - 1)
> +		if (cur != end && (cur - last) != CMDQ_BATCH_ENTRIES - 1 &&
> +		    arm_vsmmu_can_batch_cmd(smmu, last, cur))
>  			continue;

FYI: Sashiko is unhappy with the existing code here, so somebody should
check that out:

https://sashiko.dev/#/patchset/20260601104845.995005-2-amhetre@nvidia.com

>  		/* FIXME always uses the main cmdq rather than trying to group by type */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 08684bd40a6d..f38c21b56f28 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -698,10 +698,10 @@ static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq,
>   *   insert their own list of commands then all of the commands from one
>   *   CPU will appear before any of the commands from the other CPU.
>   */
> -int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> -				struct arm_smmu_cmdq *cmdq,
> -				struct arm_smmu_cmd *cmds, int n,
> -				bool sync)
> +static int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> +					 struct arm_smmu_cmdq *cmdq,
> +					 struct arm_smmu_cmd *cmds, int n,
> +					 bool sync)
>  {
>  	struct arm_smmu_cmd cmd_sync;
>  	u32 prod;
> @@ -820,6 +820,26 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  	return ret;
>  }
>  
> +int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> +				struct arm_smmu_cmdq *cmdq,
> +				struct arm_smmu_cmd *cmds, int n,
> +				bool sync)
> +{
> +	int ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
> +
> +	/*
> +	 * On Tegra264 (see ARM_SMMU_OPT_TLBI_TWICE) re-issue the same
> +	 * cmdlist with another CMD_SYNC to satisfy the erratum.
> +	 * Callers must ensure the batch carries a uniform opcode class
> +	 * so that checking the first command is enough; the iommufd
> +	 * VSMMU path enforces this with arm_vsmmu_can_batch_cmd().
> +	 */
> +	if (!ret && sync && arm_smmu_cmd_needs_tlbi_twice(smmu, &cmds[0]))

Can you move the arm_smmu_cmd_... part to the start of the conjunction,
please? If you make it a static key as I mentioned previously, then
hopefully that should mean everything else is moved out of line.

> +		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);

Sashiko is also unhappy here if n == 0 because we probably shouldn't
be inspecting the command array in that case. Generally, it's a pity
that we can't handle this all a bit further up in the stack when we know
exactly what operationg we're trying to perform, but I suppose with all
the different users of the invalidation commands that's hard to catch in
one place?

> +
> +	return ret;
> +}
> +
>  static int arm_smmu_cmdq_issue_cmd_p(struct arm_smmu_device *smmu,
>  				     struct arm_smmu_cmd *cmd, bool sync)
>  {
> @@ -863,6 +883,14 @@ static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
>  	    (smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
>  		return true;
>  
> +	/*
> +	 * Tegra264 erratum (see ARM_SMMU_OPT_TLBI_TWICE). The batch holds
> +	 * a uniform opcode class, so checking the first command is enough.
> +	 */

Again, please drop the Tegra264 mention and just refer to the option.

Will

