Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CCCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTgYbgF6UFHSOJDcNP/wCN8RzXCVJ9ITuwbb2IjoIGA=; b=Ev7jI1A22r4Yl/SMzD1AQ4ex3n
	1n2W4zf51o6mnzi0M+1Tyi76x4fiXpqN2v2s6VnaeRVfjLgItEeIckOPdi4QkoTS2VatZgcXUl2yw
	C6gtBgRrTe60B8bA7fvQXKXIDaJ45NDpYFOnHME4CCkLYz2vUiXMGlJFTGy+BWnH1yyEHKAW8OBmF
	p/8jQdv7mdwC7UYjioSdQ7kJt1w8nVyXrSClqj2rZG8bj24OLmsC/7sP4JAR4DCHP/jmMP+9gJSuD
	+n4olJsls1CDKRvHzjbKmlCDzDCNIxkfgNY8kvunsStXJt5Dd1nngvnSDvHnKNtHncwDOEogDSjn6
	qzD1mo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESIe-00000002aCg-2bWk;
	Wed, 07 Oct 2026 14:07:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESId-00000002aCP-188E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:07:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1EA460218;
	Wed,  7 Oct 2026 14:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9F21F0089B;
	Wed,  7 Oct 2026 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382034;
	bh=xTgYbgF6UFHSOJDcNP/wCN8RzXCVJ9ITuwbb2IjoIGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZB2l6kiV8XGXAUPBhLGz1SEtJPO17Av5Uo8TSCRxN1HLyL+9D7TNV3t1OKwhUa4M0
	 K32VRRowwnpGQ1ulwbOwTdqVkzCkhNcKvavBTvzv+wKRAHLzy8x7wVMBEruUjnT+we
	 N1ij5qq9Xd974+pTO1vg7wx65XaqA4EVR8TibpDPNVW2G5AA+tSixvrgXzmjVaSliF
	 KFi4WxQ5tO4YNt7kd1DUjGUkY86tQOHx8tEljH5SM3iUkAveZgBSkwy+g4M8q+wt7Z
	 kIVGfGWAmUPe1LiDjo3j8pyq7fop7aTaBDkEvxELUKchvTrp1utmHlbIRRycQvT2ez
	 ukDUqcyvcOo3A==
Date: Wed, 7 Oct 2026 15:07:08 +0100
From: Will Deacon <will@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 09/16] iommu/arm-smmu-v3: Restore MSI config on resume
Message-ID: <asZSDFkTby9Dj__C@willie-the-truck>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-10-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-10-praan@google.com>
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

On Tue, Sep 29, 2026 at 03:45:03AM +0000, Pranjal Shrivastava wrote:
> The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
> address, data and memory attributes lose their state when the SMMU is
> powered down.
> 
> Introduce arm_smmu_resume_msis() to zero the *_IRQ_CFG0 registers (which
> reset to unknown values) and restore the cached MSI messages across the
> device's MSI domain via msi_device_domain_restore_msi_msgs().
> 
> In addition, clear ARM_SMMU_FEAT_MSI if MSI setup fails and the driver
> falls back to wired IRQs, preventing spurious MSI resume attempts.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index dc2fc02b5163..7347d3ecdae8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4779,6 +4779,19 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
>  	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
>  }
>  
> +static void __maybe_unused arm_smmu_resume_msis(struct arm_smmu_device *smmu)
> +{
> +	/* Clear the MSI address regs as they reset to unknown value */
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> +	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);

Please can you factor this out into a separate function (e.g.
arm_smmu_reset_msis()) that can also be called from setup_msis()?

Will

