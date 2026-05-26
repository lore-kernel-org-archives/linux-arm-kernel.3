Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1EBCD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 06:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4Q6K7bbOoVpU1MwP5UtVcbQqMSK8GB1uvqgVWAyIgA=; b=KLVvdZqWdzbWKPTfXcmOPIlejg
	AGNjBT0b8+qzAk5gPDLj6QsmqGi1YChsPE+TOepq9nzK28Nh2WcifRdyzWyDSbYxuW31j3hsb55Jj
	rVWDPyyCX2aTj3twkBP3XUKBQWVeQkm6/1+gciPmI6MTgH4pXH4OpwzLESd1jaRGNuuQ0qNhf9jUw
	R+oV1507iV6yuv81LNIBGnQdGq8YZocC2iPp5LNL28NHjI1eyKDgopQSKfbNzhyCf0e7auQ+JAS4y
	iWkWn/7VFCOgETDh3Bo5+YYDJKPsuLtesqOvGO+QNQb9Xdz8M740cVEz/XQUGVYSLNb/MTgDqVxrb
	WyXcIlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRl1l-000000018ek-0Stx;
	Tue, 26 May 2026 06:12:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRl1h-000000018e0-2GuW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 06:12:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77E7A437B8;
	Tue, 26 May 2026 06:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D341F000E9;
	Tue, 26 May 2026 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779775948;
	bh=C4Q6K7bbOoVpU1MwP5UtVcbQqMSK8GB1uvqgVWAyIgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PaNxY70+YMonEMLTIazGO/O55U8XOU9hI8Sd6x+lIwRz+krY7I2MIFVP2TtWHQRk6
	 oLs6o/MlXIoueCpSrWzl4/TP61gPF+HN/xvzZ2vYpOcuWB0Dm95zHR9huRUsF9V+Hf
	 YnTyB9za+3uCaHbFr+R2wcRewXry6G17iicxgZkjKeAXoiSONhiO8kf+vbI4ljsIDR
	 1fy3F+EBJAgg0t5T5mg4+PsdSDHbAEaAyRvnVetK1IwZ8UztJCg6MOoYJa1oLvRi7m
	 9dhRl/AKdtuVr7cjGvsAMXrJhl9YyIGQK1PcdmnOV19LefKY14Nezbe0MAE8vRqjtb
	 Xzj2xjTt805IA==
Date: Tue, 26 May 2026 08:12:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, 
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v15 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Message-ID: <20260526-finicky-crafty-hare-eae27c@quoll>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_231229_753826_68CFEA23 
X-CRM114-Status: GOOD (  19.12  )
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

On Wed, May 20, 2026 at 01:32:39PM +0530, Vijayanand Jitta wrote:
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

So there is no real user for that. That's unconvincing. I would assume
that at least you have real user where you test it.

If you want to speed up acceptance of your patches, then also I would
prefer to see at least one more user, beside Qualcomm. IOW, show how you
solve other people problems, not only yours.

Best regards,
Krzysztof


