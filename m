Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E12CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCsF6+6rsyoeEkomxCYenaMEwQl7TAch1XQafxbYovE=; b=4qd97uzjwbFvzqNd8odQz+Muhc
	LD3WBkeW3pAzgIUvB4o40F1SkMrHcN/ptFHhhSxSg+r0ZLAcKNsQf34TKgIceYunsDwrCC/7lcVl+
	XOztc941amWpChN5zzKF2TUnonHEsxVK/27m2Gu5/JylwMFpVFYk0Jq2eA2Ge7qe8U+z+BwmqkWEi
	CF+nE2bvcNIPMnPoQC/BF6OskeMJMhkgbh6ZtQ0dWUrIFkmVNrkYQDCv+x8SRZdvCblMjXp2SQaLr
	oNnnomkrrgtuMNZfFDK4Kh3oAJT2tz7WdgvFz/4rL64pxE7CNqIbzWx7n7ZmKvYVgGfCO36d1lELS
	Z1MnN8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkaO-00000002B5w-0X6b;
	Wed, 06 May 2026 22:19:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkaM-00000002B5n-2abS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C9096013B;
	Wed,  6 May 2026 22:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5ECC2BCB0;
	Wed,  6 May 2026 22:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105957;
	bh=gysC/lx1i73eA4zP8jwgbWYpicdKVkkAq/If5SfmOvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UF/aj9HS2SYPYHTIXkOa8lL3owagoxJHzGMhyRFSAxj+GJL8gP8yC5+XoLLz6s1x5
	 X9cL5R+VcjnFIjQexqIW2yM4i2kvMQEHMnTIu0Lb82lcqBkA1Hg3vvTFnYScS91BuS
	 2N40C7auuO3CTglHzgoaPeo24WGlW/+zx0190iYZVTD6bGYt2OnLQxGXS+Zi31QbCo
	 BSVOloj3oH2LafE2j6H0SnRWGMGyru24IxEPo4APpEHqlKdF+7EKoOV6XhFqOa+f3G
	 bqbSLPeKNIjTZdxVJ1+2t3TbHL1Z+PbeCe39zAx2EWiABfykEikLE4KgvyrMiahx6n
	 +1VGvBd4tB8Jw==
Date: Wed, 6 May 2026 17:19:15 -0500
From: Rob Herring <robh@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v14 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Message-ID: <20260506221915.GA3290640-robh@kernel.org>
References: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-parse_iommu_cells-v14-0-fd02f11b6c38@oss.qualcomm.com>
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

On Fri, Apr 24, 2026 at 11:26:07AM +0530, Vijayanand Jitta wrote:
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use[1] in being able to map at least
> single input IDs to multi-cell output specifiers (and properly support
> 0-cell outputs as well), add support for properly parsing and using the
> target nodes' #cells values, albeit with the unfortunate complication of
> still having to work around expectations of the old behaviour too.
> 							-- Robin.
> 
> Unlike single #{}-cell, it is complex to establish a linear relation
> between input 'id' and output specifier for multi-cell properties, thus
> it is always expected that len never going to be > 1.
> 
> These changes have been tested on QEMU for the arm64 architecture.
> 
> Since, this would also need update in dt-schema, raised PR[2] for the
> same.

Sashiko has some thoughts on the series:

https://sashiko.dev/#/patchset/20260424-parse_iommu_cells-v14-0-fd02f11b6c38%40oss.qualcomm.com

Rob

