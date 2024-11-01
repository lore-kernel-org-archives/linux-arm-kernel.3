Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6EAE6B254
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=At+S6wE0V9O5zyvhQw7Zl6P3OJqjmHMiN55xCBEbOio=; b=VhrBawUSZPz7TpfnTbExFqA5yv
	omuy/R5FQZwIiF/NoLYsEq00wjO9wvkLYMcPpDstk8fJU1flleuZKdrAr8e0Mz/J1F2Fa0O28hVet
	OInxz713NvtMH4FHC0LpNDhSXaUgR/mUMGkWpuoMWXJNo2o/mks2De8gjOkhQ82VPq9jqPBVLNddz
	QPoXrsS4yEGeqhigV7psWinrSTaZPTGANPOpsUDRXLRWqg+NFvFb5X+XBVl9oUW4+IvTTN6CEGezs
	G7ElieQZWhcUiKqueo+hUFStZTgWSGYfm51JwP4Dbe7ya+gG1Mqw8XO5r6STp03Jpt3MNO+Y9e1f5
	LKdOObjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qs1-000000073NR-3ByJ;
	Fri, 01 Nov 2024 12:35:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qU5-00000006the-3qxN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 820F1A4373B;
	Fri,  1 Nov 2024 12:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC898C4CECD;
	Fri,  1 Nov 2024 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730463032;
	bh=ySUK7o6teyrYbnl0BIFkuIKX0AiOQDli2AQwIAKrHfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBbWahXKaEhqbxmFmpER4pQdWKXJ27x6/HOTTa58y/NPcim3IMqLlZgMsSiqbDa08
	 RIgswhOwZr7BmOjGB/5uZbyOTEjLAskpsHmhSIl6GovL/g2dpYf6u7VPCVWNYvAcOU
	 7FRQmwsg4p7jEKkpOlOdd8oxqfgPCeacOIp1VZwV3iyP4PzFuVDmhbb3ItU1eNFRa9
	 jwZE2dPH51oAz5qR8ukw4E8kY5XFKoihnxHUAbCPcySlVG+ejMDG8UFG6G8T6MwVht
	 Wo5caq/vDRMqLWrQ2T2M50cOaUmqQLYiKA5u2xsVQyFm/ilWtmpRTiRhg8eb9en3x6
	 PzyePC+0xvo7A==
Date: Fri, 1 Nov 2024 12:10:25 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <20241101121024.GC8518@willie-the-truck>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
 <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_051034_049231_2B77B522 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, Oct 30, 2024 at 05:00:13PM +0530, Bibek Kumar Patro wrote:
> On 10/29/2024 6:17 PM, Will Deacon wrote:
> > On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > If you want to gate the errata workarounds on policy, then please follow
> > what we do for the CPU: add a Kconfig option (e.g.
> > ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> > the relevant errata aren't all "rare") and update silicon-errata.rst
> > accordingly.
> > 
> > Then you can choose to disable them in your .config if you're happy to
> > pick up the pieces.
> 
> This seems to be a good idea to me . I am thinking of this approach based on
> your suggestion,
> i.e. we can bind the original workaround in
> arm_mmu500_reset implementation within ARM_SMMU_WORKAROUND_BROKEN_CPRE
> config (defualts to on, CPRE would be disabled) and in QCOM SoCs default it
> to off
> (when ARM_SMMU_QCOM=Y -> switch ARM_SMMU_WORKAROUND_BROKEN_CPRE=N).

ARM_SMMU_QCOM is enabled by default, so please don't do that. People who
want to disable errata workarounds based on a hunch can do that themselves.
There's no need to try to do that automatically in Kconfig.

> In silicon-errata.rst would updating ARM_SMMU_WORKAROUND_BROKEN_CPRE be okay
> , as the config names are based on erratum number.

In this case, the Kconfig option covers a variety of errata so how about
we go with:

	ARM_SMMU_MMU_500_CPRE_ERRATA

and then you can list all of the numbers in the "Erratum ID" column?

Will

