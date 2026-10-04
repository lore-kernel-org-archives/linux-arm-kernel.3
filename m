Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65576CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55nP/rLqMARhythDBN1wq7/XRWHuJqh11vtjRhmv9+A=; b=MYJGUq8AlVS24zng/GKemKHjww
	fG83+jwMg4fav1CPOryGjlLhgMyd78KGYRnwPbThMw3tOnvVfxLIlDlpstp9RmzlVpIK1e+cZLG1S
	mQ5Kpu7ueNS3gdddYjnz6uS4ePp/rarzSrV1iOEJ/b8Bob6o7AzehU2tSj7bsA6KinozR/szc6gZh
	H7KnF3Chzs7QXB6xMUehvOq/pk3d+srCfJ5i081bMvu7lBxetLPt/140quJFHMEmbRmia8GwSV7Dh
	cjYn+b+GWb0Sq4YRMc9WGW6/gGRfVoIBIKPi8WcZTltcWrkX+w2tUbwx4zjmLgvCD4OeLLjTJtH6x
	X9PQYg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQX-0000000F2tq-3uyb;
	Sun, 04 Oct 2026 16:51:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQW-0000000F2tH-2skX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 16:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2632760120;
	Sun,  4 Oct 2026 16:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC0A1F0089B;
	Sun,  4 Oct 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132663;
	bh=55nP/rLqMARhythDBN1wq7/XRWHuJqh11vtjRhmv9+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MBx/4WEXKcMxf6R5/9sXX0HSxs3JWH+RhmfeFAFe2wVEMuoBiUShUG448gQGx8Jq3
	 xP/xj0P5FBVV4+ALsBsbt+rreALw2nPMOQwRrGXM/GS+dRkQxqeRPqSXfNGywdsX4S
	 PL+W4y8KglAPp7WcHkUX/a8x+uvAe6RZWfEUm6qXG8AuyOuioPsVCbCuT/cADEVtkD
	 rBR1hiOCxQ7CauuJtrrMwNKV5t1DTIabNSU+bSzZlwuYMB/oSSmTlKYAZg+hvsioFo
	 Ozw34Q11B/EoiCo2zr7k2innJrUuDR7BIpe2uHIDLZoWTdABnE+Ug59s3XBPDQ9IMu
	 W26mvZNwUpigw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	vsethi@nvidia.com,
	Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v6 00/17] iommu/arm-smmu-v3: Quarantine device upon ATC invalidation timeout
Date: Sun,  4 Oct 2026 17:50:43 +0100
Message-ID: <179112990410.2366640.1873231809749459726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790188510.git.nicolinc@nvidia.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 23 Sep 2026 13:11:19 -0700, Nicolin Chen wrote:
> This series addresses a critical vulnerability and stability issue where an
> unresponsive PCIe device failing to process ATC (Address Translation Cache)
> invalidation requests leads to silent data corruption and continuous SMMU
> CMDQ error spam.
> 
> [ As Jason pointed out, because this series fundamentally introduces a new
>   RAS feature to quarantine and recover from hardware faults and relies on
>   a recently accepted SMMU driver rework, it is not treated as a standard
>   bug fix. Thus, most of the patches here don't carry a "Fixes" tag. ]
> 
> [...]

Applied SMMU rbtree fix to iommu (arm/smmu/updates), thanks!

[06/17] iommu/arm-smmu-v3: Don't rb_erase() a never-inserted stream node
        https://git.kernel.org/iommu/c/2888520bdcbe

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

