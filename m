Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C3C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXhWQw22vhXAQ2gomRzDVD1jyGqiKml9QCCpuAJzC6k=; b=080SbixusTk+7bfU3OZ0tOHrsH
	+4zMdA8upvpn8khG3xbsaKzMQZOupsI431sh9Mlt82cHCe0cSKnSTVdrJ8CZpUGA6ssBeaedfutkr
	GqIwbKuLSqwggBUSC0jmbVIPGoYRm7LecbqIFr6sb1UxJSyEvunEeHdOKp7k7Z7J+jzybTePXLM/u
	TC851FUaIZt3b0vblCPAQhndk1Xko7nvedA0hCgyzYlpbclWghDCY0egpaj3S48zS263dNiBQ8q3o
	yRkH9YuX7xrDJbHy98YEVuKJNllvbpwgh9QRk1I7leUdaKU+6h3OECg9Q0cYDmG/ZFvnwnYQAgdF6
	0MwkJvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41vr-0000000A7HN-2Mbt;
	Tue, 08 Sep 2026 19:56:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41vp-0000000A7HF-3gyt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:56:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5108340A2C;
	Tue,  8 Sep 2026 19:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7725C1F00A3A;
	Tue,  8 Sep 2026 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897397;
	bh=vXhWQw22vhXAQ2gomRzDVD1jyGqiKml9QCCpuAJzC6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ei5MZjQhnv1BJZ4J4jb+4yGVs4QfDIeXmSd/v+LcQAbS04thRvfCeILdLXHdDOo5l
	 cB1cEzL4ZurUh5asediffjsprVN3X6WBt7/6JezEycGc5SvgBN5ywWYRCYJAobIwGR
	 EvwzGcSvoLr74k8E3DDlGgJ9Ys+xyEBEfTdRxVEnBoz+H5WdPhhL8ID5XsK4kGv4XS
	 p3f1JVoI+nWUkaHlynnHrITNae9llhsy44HndAPOvYcwjMWk221vRFffnsFXDEvoG7
	 UEgpkq7u2iC6Lhz6GkyhOJYm2R66XREDjqkp6y6YLdWa0RuKxJPfKmX2S/sK3OkxxB
	 ggHUaEijiRGYg==
From: Thomas Gleixner <tglx@kernel.org>
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin
 Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa
 Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>, Daniel
 Mentz <danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, driver-core@lists.linux.dev, Pranjal Shrivastava
 <praan@google.com>
Subject: Re: [PATCH v10 08/15] iommu/arm-smmu-v3: Cache and restore MSI config
In-Reply-To: <20260908171712.356645-9-praan@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-9-praan@google.com>
Date: Tue, 08 Sep 2026 21:56:33 +0200
Message-ID: <87pkyn1pqm.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Sep 08 2026 at 17:17, Pranjal Shrivastava wrote:
> +static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
> +{
> +	/* Clear the MSI address regs as they reset to unknown value */
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
> +
> +	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> +		return;
> +
> +	if (!smmu->dev->msi.domain) {
> +		dev_err(smmu->dev, "msi_domain absent during resume\n");
> +		smmu->features &= ~ARM_SMMU_FEAT_MSI;
> +		return;

If dev->msi.domain == NULL then arm_smmu_setup_msis() already cleared
the MSI feature bit. Has it magically been set again or does resume run
before init or does dev->msi.domain magically disappear during suspend?

I'm all for defensive programming, but this is voodoo and not structured
defense.

Aside of that dev->msi.domain is the patently wrong condition. For
devices which instantiate a MSI device domain dev->msi.domain points to
the MSI parent domain and not to the actual relevant device domain.

You can't query that easily by chasing pointers (for a reason), but
there is no point to do so. See below and the patch I sent you.

> +	platform_device_msi_rewrite(smmu->dev, smmu->gerr_irq, arm_smmu_write_msi_msg);
> +	platform_device_msi_rewrite(smmu->dev, smmu->evtq.q.irq, arm_smmu_write_msi_msg);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		platform_device_msi_rewrite(smmu->dev, smmu->priq.q.irq, arm_smmu_write_msi_msg);

And that's exactly the point I made about sprinkling this stuff all over
the place and thereby violating all layering rules.

Done correctly this whole function boils down to:

static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
{
	/* Clear the MSI address regs as they reset to unknown value */
	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);

	if (smmu->features & ARM_SMMU_FEAT_PRI)
		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);

        msi_device_domain_restore_msi_msgs(smmu->dev, 0);
}

It just works simply because the function returns early when there is no
domain or the domain is not a MSI device domain, which is correct
because there is nothing to do when nothing is set up.

But that results in too comprehensible code I fear.

Thanks,

        tglx

