Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE182CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T+bPLMZWoqhL8S/EBPqCG3UpNlA+kQUaLqUC5F3zUc=; b=RqYMvrC7iJDHVABkhZHYK+iGv8
	vb2fpowFzRipAmjfhEqbBNRzhvLtnone+W/HucUzXKe8mfjDFH4M3h60m7u4QlHwkEP7q2nftPUjp
	mr/07cJMKBfb0OBKajyZipWTVQxDkGTM9RgdTBTJYSeFjkA9ZekdJRTODicoMzxsXLg6dKNIibDC/
	JL82QSQa0+4WA4BfmwoXi8FvaoSgrLeZkKzIEWKVz3UrMR5SZouKrGJWKIZOq9vo5nJMJfg6CYpXH
	nf/G5hsL9RD/dZOa1cqAU2aC4HH9JNWAV3PZlVQyZ8Zw6MnalHtrYFjhfLdTl0Jbgxva/9o7O0Gaf
	qSNE1sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVeF-0000000Djmw-0Fvs;
	Tue, 02 Jun 2026 20:23:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVeE-0000000DjmV-0PbJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E6B060098;
	Tue,  2 Jun 2026 20:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118331F00893;
	Tue,  2 Jun 2026 20:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780431816;
	bh=8T+bPLMZWoqhL8S/EBPqCG3UpNlA+kQUaLqUC5F3zUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X05LjxQZt769CS8tATWOEckjc8NphbYyYX4uGe6WyqVEo+3s6MVlyIM4imZZL1qNR
	 ceg0IIsFvj4wyTQaeNQVN2SvJqIeNVtnftNTcos9M80cQocLwR4TE6dRDBbGqAEpbo
	 RIojHgU2XwPYBLGAHzgX9qzdOmKF3yIzvffInNeUOmPSTJLODYvIm9Vs7lzHRNCaag
	 WwcjVCefOP+M6EdM8PkYvzHQgJt54lObbGkYuv5aV57cMDRhaE30et5CYlC7S3ZLdp
	 HJOuwHvOnPsBTXaBDTk2cyz1scPJ34iKAhKbzMzbKisTJvGLTueoSlmYXARsFFK6Jz
	 gz8iUSM/muFtw==
Date: Tue, 2 Jun 2026 21:23:32 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch
 force-sync conditions
Message-ID: <ah87xDqLJ9bU5f1u@willie-the-truck>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-2-amhetre@nvidia.com>
 <ah81HhVW7_h9xyDM@willie-the-truck>
 <ah84OmisAm8805FT@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah84OmisAm8805FT@Asurada-Nvidia>
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

On Tue, Jun 02, 2026 at 01:08:26PM -0700, Nicolin Chen wrote:
> On Tue, Jun 02, 2026 at 08:55:10PM +0100, Will Deacon wrote:
> > On Mon, Jun 01, 2026 at 10:48:43AM +0000, Ashish Mhetre wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > 
> > > arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
> > > flushing the current batch with a CMD_SYNC before appending the
> > > new command:
> > > 
> > >   - The batch's pre-assigned cmdq does not support the new command.
> > >   - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
> > >     forces a SYNC at one entry before the batch is full.
> > > 
> > > Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
> > > so that adding another force-sync condition becomes a one-line
> > > addition. No functional change.
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++++++-----
> > >  1 file changed, 20 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index 9be589d14a3b..4d29bd343460 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -847,16 +847,30 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
> > >  	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
> > >  }
> > >  
> > > +static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
> > > +					   struct arm_smmu_cmdq_batch *cmds,
> > > +					   struct arm_smmu_cmd *cmd)
> > > +{
> > > +	if (!cmds->num)
> > > +		return false;
> > 
> > This check seems new?
> 
> You are right. Maybe the commit message should have mentioned that
> there is a slight behavior change to the unsupported_cmd path:
> 
>  - Before: if cmds->num = 0 && unsupported_cmd, it would issue an
>            empty batch (one CMD_SYNC)
>  - After : if cmds->num = 0, no issue on the empty batch
> 
> With that, I think it's good to have?

It just shouldn't be part of the refactoring patch with "no functional
change". Do it in the patch that needs it and explain why it's needed.

Will

