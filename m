Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACCBCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4Q1eWfw8uO06O3f0d5ochR+epxjNtDwxTshSdkC+mc=; b=LT3+SkijD0tUN+PjpTOph9COfx
	1rAb9bTxFXPV1no5loYhEu3tLr+kaoNXkMcHc3n4Si7FU52SYkgBF0F/CutFwJPvbNodt9vO66klG
	tmymcHQX7yQtBaF4zwnPxPlAS71iPxZuLA27Vzj1YaCGAKzi9SapH8KwZIwa7mPcNtWG6E8NQ6xpg
	R6VXyCE1r7nzghd26YveQMfT61Eh3ai3HsFpD6OL6e7VXUstszB1OHh23EoLS58jby2MP76jrWTm2
	2/H6E1ng9yo3G9/Z7A0Y22TlOhaM8qrgD+Ih3kD5Cm6xeCILIDMQqFiLcabvcMRLtUtwUmkMC0hCh
	x8LEe2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOX7-000000073UD-33dg;
	Fri, 08 May 2026 16:58:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOX4-000000073TN-0wIk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:58:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba180a022dso114355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778259513; x=1778864313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Q1eWfw8uO06O3f0d5ochR+epxjNtDwxTshSdkC+mc=;
        b=djFCotCqwhFxMCm04c3GEiRZpSH6e3So/K2mejT7avTxs9HYiYHfhhg5Sjvvchsgux
         7QbIxTrUyA66eTIQyBrltjqkder1KPid5RTwA9IeqodZvDd4h+rEIT7tcIvckzDdodzI
         l69F2bQSltcNyenvwFwNhKAHFqu34o08N5C6swGRq/lijXOS/J+PMsN+uFfzVYKx/nxT
         oMwPb55eedbYHITeCbWDyk9cziSauRep64iBUsRgWgGj0PcwIlwnhGPg8TOB+rR1zRmq
         znTExsH1nV84pA3xp0cPIx7qkrTrW/wpXeNtKOKGLdwidPJziNYj/xaaN2o9nw6YwR/8
         urDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259513; x=1778864313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Q1eWfw8uO06O3f0d5ochR+epxjNtDwxTshSdkC+mc=;
        b=Q+RPUzK7/AeEPn4mdeoLgV/LQHGrdliii7faf80eSTRZqjVKOmCYi57Tlm7qVSay+o
         26F2/relfOOLDsc2a0UH/6mgnRX2Cqdbk2zNgNfwgO5nKiqyV1HUZdW/0XD3IiwOYzWq
         ER/428QKmu8pAF/mzxPRK3MQPioWvPrftXNES93kHfvyq9Mjkq07W4CdHn0qDZdb10Xk
         4/YbtGminQo3+uE7nL5IIXT4F/LRgdbR8wUuyZ6RSJy7Slwl4DvDIxl77ZAOYDltzxp2
         i/zs1o0WxBScyrs9BYgxPj5fiLhcF2ozx777sI8mA3YaLDQGU+7Fwn6qY+52OBsJspiq
         ha0w==
X-Forwarded-Encrypted: i=1; AFNElJ+zltr1FKrUlRKrZuMbEAFHUObdOTK7Bzx/8/3PxK6LS4A084UVRbyoRc5pgaxqID78DBuLvIwKTnWsSomK0Tyl@lists.infradead.org
X-Gm-Message-State: AOJu0YyPmZART7Qu+NplPEFShYa1DNkPk0H78SLEL8y8Wo0LEdJx1Cb4
	TiC1Ufl27BYZMJQJ4dsSB6SMGe0xYN/kkzzCUc5+l9u/gpJMKbi6AP03QXoiYJAbIw==
X-Gm-Gg: Acq92OHYZ/mYx84hdPd7x3aRRTfI3eqAZoxKNm8MXKP7xszTbgRZmmBcFgBJTWUvdnD
	vV1J096mYRI54wa/1w2HZWBXUX0rgUI/rbPtXy6Xn5xHgGaT3WtSe3tBKMetQvjMfoHANtdHG+W
	8e9n2LlZ3HeezgMwMUy1YU3ArHJSG8RDqhsG65qLq+Oqqpx3YNzqlVS0cRn0ooa272cTDHz/gnO
	63Sv+p+tknIisIvXFEfcXqGxnDCCZDQjwckCXmJdsTRRTtPJrBEGBpuUkUsQ5FxOPWvke2h2Orn
	1sjuxRvh+bmMbC9IunX1CyIVCApAuLZrJ42G5SNQonwPk0qmAhi3WP0uef/RbeDHw7tkpnO7+Lu
	Oq7NArRIEfE0MrSlFHgWZCsD6ok2+8HNo8wiGHA1L3O5bIgK49zkv25p/zwmhN5FVtLWsrSRJvO
	11Li14Q5CJIHcA+y9uVj5t9M0mN9mso+RW+rXvPQ/4BvWJf0j3Gjei8tadNGkiuYBH3BMy
X-Received: by 2002:a17:902:da87:b0:2ba:f71:57a8 with SMTP id d9443c01a7336-2bae9e663eamr3999045ad.10.1778259512872;
        Fri, 08 May 2026 09:58:32 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm29924885ad.2.2026.05.08.09.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:58:31 -0700 (PDT)
Date: Fri, 8 May 2026 16:58:25 +0000
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
Subject: Re: [PATCH 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 selection functions
Message-ID: <af4WMaG8sSJeNkb2@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af2VIXhI0ryEbWn7@google.com>
 <20260508155432.GE9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508155432.GE9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_095834_270552_D6CDFF51 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, May 08, 2026 at 12:54:32PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 07:47:45AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:11AM -0300, Jason Gunthorpe wrote:
> > > Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> > > lower levels of the call chain. Change the functions that determine what
> > > cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 47 ++++++++++++-------
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ++--
> > >  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 ++--
> > >  3 files changed, 38 insertions(+), 25 deletions(-)
> > 
> > [...]
> > 
> > >  	index = cmds->num * CMDQ_ENT_DWORDS;
> > > -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> > > -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> > > -			 cmd->opcode);
> > > -		return;
> > > -	}
> > > -
> > > +	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
> > >  	cmds->num++;
> > >  }
> > 
> > The memcpy is a temporary step and goes way in Patch 4.
> 
> To be clear patch 4 still has the memcpy:
> 
> -	index = cmds->num * CMDQ_ENT_DWORDS;
> -	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
> -	cmds->num++;
> +	cmds->cmds[cmds->num++] = cmd;
>                            ^^^^^^^^^^^
> 
> The compiler just builds it.
> 
> The flow evolution is:
> 
> Now:
>  struct arm_smmu_cmdq_ent (stack) -> arm_smmu_cmdq_build_cmd (batch) -> memcpy (queue)
> Here:
>  struct arm_smmu_cmdq_ent (stack) -> arm_smmu_cmdq_build_cmd (stack) -> memcpy (batch) -> memcpy (queue)
> Done:
>  struct arm_smmu_cmd (stack) -> memcpy (batch) -> memcpy (queue)
> 
> So the net result is the same before/after this series, we just carry
> an extra stack copy till the last patch.

Right that makes sense. N

Thanks,
Praan

