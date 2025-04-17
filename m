Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA26C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wzWuo5un/VoEiUbJIqgpO6MbHgKyRnpdAXSEcODxI0=; b=YLB4ivwFpgzySLdmI2TEB2oQUO
	5xV3mxiGy63429NSIcfuQsMay7684C4lV+bAt1Rmiph26PcW/RmU9jtsRwhlxXmL+WJKB4rierT+A
	5jjun2kXBgPXxePO8w+deGf5HxV4mgtlmo4CiglveNBR68KyO6jp7QyL8SIxgPhYPuwupHfdoeT9y
	+Lu+rFf6/4J9egeLPnSWUfjVPASs9wQwVA+m0L5WPRh7OymjLEx9qjW/gkJlr6xCCDtpvNGOdZ1k3
	Mhh2/xZLzQn6mBOD99xOYtttxwg6qczj+zaCt5cX78WnFGeaUzVpJuYIRvQnERAqGdXg806Bj8dON
	yT1Pe1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5REP-0000000DWzB-17JQ;
	Thu, 17 Apr 2025 15:32:49 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QPu-0000000DMAW-2UR7;
	Thu, 17 Apr 2025 14:40:39 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 06A4448658;
	Thu, 17 Apr 2025 16:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744900837;
	bh=ZkCqmSbXt1v3PVfUXnyy4jP63qsdkBbj3FBpkdPeHH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=3uWpx2LX4TTFi1PE/0XADmLNcMTSSgp6V32+y7Jg9w1nRQrdFpRAshKO/MlaYKmzl
	 Kttyj0sv2jvWQoOp8zotVwqMMlAQCKmYCNbPML6UF1D5se9TmoU4CvIYYUB7WJ29Hh
	 YCuyKsNnf2Mmo3OXZNrQmDlvgN/8GOUwV5PxfpzWW4NZ7ojBC28SJ+XuDZZa64pU9V
	 LdeFxt+6nerOumveCriRC80bM6PcRXDa7RXPSV0aZTjN7pRdclEJwA0TMtL9zXx/XR
	 PfZwVAfOpjAzu7vbS5fzJ8u/XVNitcdYRjWNcN+VNsc8QUkdsVvI5kkKABr62vC1De
	 GOaeG/ITg6e7w==
Date: Thu, 17 Apr 2025 16:40:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neal Gompa <neal@gompa.dev>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4 00/23] iommu: Further abstract iommu-pages
Message-ID: <aAES47w6yaRDFsLg@8bytes.org>
References: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
 <aAEPWXaBocqgsvbR@8bytes.org>
 <20250417142752.GH823903@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142752.GH823903@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_074038_770963_092F0355 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 17, 2025 at 11:27:52AM -0300, Jason Gunthorpe wrote:
> I haven't had much trouble rebasing it, so fingers crossed, thanks

Forget the iommu-pages branch, this just makes it worse. I put it
directly into the core branch now for everyone to rebase on in case of
conflicts. This should avoid some of the potential trouble :)

Regards,

	Joerg

