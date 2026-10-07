Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE02CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfrGI8jbXGpVFXqniKyw95lNwNeVBlr5DYqdOuibDxk=; b=yxziesWHTw1kgqORTIuNitP4ac
	fEhciXkCSykt40TWi/nPexsJM6sdvSVx6s/RiOdidrOOrMZeVRFvnAYJRtK6NaS8S6h1ezUAoEFBn
	obPUMWYh7DCO0nv6yergwyOpmVLMX6WYqc4GHgKAayywzzBhXCabMDpaMGb/8NmQcNtJ2GVEak0fB
	vZVRKPg64RQVZFxhgbLsjnciP8ReSN7qZQeVSzjiLoyg0hMjlgyLGidVqCBpfGyO2fq94L/j0Rjbt
	1w6nyfGHECWiiLX3kn7l5wjXmjOmwUy4jiRk+6FCRKhv+I0BsdfoK+hqEe9g+yV8rwoZPKUWF0rRG
	oGCZD08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESIK-00000002a8Z-3Vqy;
	Wed, 07 Oct 2026 14:06:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESIJ-00000002a8M-2Iar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0741343A4F;
	Wed,  7 Oct 2026 14:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F0E1F0089C;
	Wed,  7 Oct 2026 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382014;
	bh=HfrGI8jbXGpVFXqniKyw95lNwNeVBlr5DYqdOuibDxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AJ6QOUqUmtGukhveI/7CsjnHSPjsK+MEQfJxYLt0j0XldjymCYxDDo2fKyavES0x8
	 ohxUp6DSaEz11DMr4uJEeCJCqeujx+dj+O2QguDFLNJirqEyiqIGTTmQBmPhUKe/Jn
	 0+JIx6XBqgV4y1UIKl7l3HhCCozfB0loCS1wYqcgXXVoczBzMxCk37DBjcQ+D2yD+o
	 CGcsCZ6q3bD6HvPp5Jj1ba4t5VQI1faZjSEcDGR4ySb3q/kUmEMspBpb2kbcosUX13
	 EO5zZqmBXP1OSbz2aSUDvM5JP3BuqQUCLKwCwqNe1Go2naiSdlk9Hn9cX+WpGF05wT
	 dXEJp0lz6cONA==
Date: Wed, 7 Oct 2026 15:06:47 +0100
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
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v11 01/16] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
Message-ID: <asZR98gl3FTgnn9G@willie-the-truck>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-2-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-2-praan@google.com>
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

On Tue, Sep 29, 2026 at 03:44:55AM +0000, Pranjal Shrivastava wrote:
> @@ -5594,7 +5631,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	arm_smmu_rmr_install_bypass_ste(smmu);
>  
>  	/* Reset the device */
> -	ret = arm_smmu_device_reset(smmu);
> +	ret = arm_smmu_device_reset(smmu, false);

It's a minor thing, but I have an irrational dislike of 'bool' paramaters
because they're so opaque at the callsite. One way to tidy if up would
be to rename arm_smmu_device_reset() to __arm_smmu_device_reset() and
then have wrapper functions around that (e.g.
arm_smmu_device_reset_resume()) but I actually wonder wheter you need
the bool at all. Why can't you figure out the resume state from the 'struct
device' instead?

Will

