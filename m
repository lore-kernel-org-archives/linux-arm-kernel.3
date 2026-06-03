Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41494CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt4VB2QZ6kXZPvpRMEsc2JhePzg9ZBinVTHuJtUj3Fw=; b=IRsH1AofxmdaSQWnCiMVPd7Y8d
	jY4RcoIozMeBtJSh33nK6+1LyVVkrIUQMHsYeqnWoE+IDFMmSmsdiataZ0WEEN4LqNAP1kBnA9xx+
	/XfeVmWJ4mwrn1IPXgR88DlvU79m2l8N26YhwPEU6hCppZV0wMiqfDNNv1Ty1yVbQ+Rz7CnTgjUHC
	qRo/VxjE2OoHgQ/ZEll/Dsxx04VHK/32+U/bh+QRy3JWqReEBsuB3xEEQ8HMaYFB93CYygpLjLoh2
	cx68h0vjWkMr4lShO+r6j+63jBmlJXVwcz8UNw8icZvcP7nPpsO+VdGwkTBqfw2Y0d9IoIBlyxve7
	LWNzOz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjqW-0000000Ex7t-0MGm;
	Wed, 03 Jun 2026 11:33:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjqU-0000000Ex7K-29MF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:33:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2ECA60222;
	Wed,  3 Jun 2026 11:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9447B1F00893;
	Wed,  3 Jun 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486393;
	bh=wt4VB2QZ6kXZPvpRMEsc2JhePzg9ZBinVTHuJtUj3Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYj1OeatXLCV484XdUCXX8zzbFZDAk0AtrrE6hgwJQ8DzJK7D76B0qw7jOrJF12VM
	 leOB2ngCeC3I0clPplWVqhF0YGGOHJz5yfEXUsRB0vVgmdCG5M+5j6jaPVfDQLqYgy
	 ogjDZ0b6o0TDkKu2O3v0trPsRByLa8DIgtPGEYkG7b0BHjGqwsToSfQCcyV0xh3HsY
	 VywuBg0i2QIs+AGpxVq7B6ELKLkapHZFy7OlBd0gaBrr4mL4dU6l0aKga6lGyX2u+a
	 oxP5jlR0G+nbx8GpaOjKGvG0tONdvRortEnDkLPcQhN6WLYcB2J9KdnrRh7oSRecIR
	 HVTCeD50+H2KA==
Date: Wed, 3 Jun 2026 12:33:08 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <aiAQ9ApqfTsdweRg@willie-the-truck>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
 <20260603010114.GO2487554@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603010114.GO2487554@ziepe.ca>
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

On Tue, Jun 02, 2026 at 10:01:14PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> > > +	/*
> > > +	 * On Tegra264 (see ARM_SMMU_OPT_TLBI_TWICE) re-issue the same
> > > +	 * cmdlist with another CMD_SYNC to satisfy the erratum.
> > > +	 * Callers must ensure the batch carries a uniform opcode class
> > > +	 * so that checking the first command is enough; the iommufd
> > > +	 * VSMMU path enforces this with arm_vsmmu_can_batch_cmd().
> > > +	 */
> > > +	if (!ret && sync && arm_smmu_cmd_needs_tlbi_twice(smmu, &cmds[0]))
> > 
> > Can you move the arm_smmu_cmd_... part to the start of the conjunction,
> > please? If you make it a static key as I mentioned previously, then
> > hopefully that should mean everything else is moved out of line.
> > 
> > > +		ret = __arm_smmu_cmdq_issue_cmdlist(smmu, cmdq, cmds, n, sync);
> > 
> > Sashiko is also unhappy here if n == 0 because we probably shouldn't
> > be inspecting the command array in that case.
> 
> That seems like an AI mistake though, we shouldn't actually ever pass
> in 0 sized batches? 'zero streams' should fail probe, not get into
> this code, that might be missing but I wouldn't add checks here..

I was wondering about the case where the first command in a batch is
unsupported. Can we issue a bare sync in that case?

Will

