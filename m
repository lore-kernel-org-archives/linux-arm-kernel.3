Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCC9D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VSgfSNTqRyoyVh/XNSiQoSg0HDbr6lC4PmFEpKLbtZ8=; b=srw/1zv2g87dTbr/pmuIiKPO4H
	F7AqUTogsP+qkwFrmeH5KO2QZcN0zTNPY5idScP+No0fYPNIRE5x5X1KrTk7GwL0eTx1DgVdMQd4U
	alnbmbRBn5KmLeHuVqGdBAmGBANU5bnOKzxvR9G5pnAUqHWJyrQTsAJGlnBZKWQw+aa620cShfEE/
	l5kgdlXKgr7S0PMXuPeujlfeW5bJSPVhV6s3PHBAOhQNR8Ibj6PNEJothnOINk3cU8qKWGtSnd+q1
	/i9FUIHEwBeqngA1pSDhhMNEoVBGAX+XkBCDnJEvXw2bC5AzUYp7f3fTOw0BNT1oZxXd2521qfrGV
	8ElRg/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9To4-0000000BbqQ-46QK;
	Fri, 08 Nov 2024 18:34:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TkZ-0000000BbJe-1BGn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:30:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0D2A497;
	Fri,  8 Nov 2024 10:30:53 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2DF633F6A8;
	Fri,  8 Nov 2024 10:30:23 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] iommu/arm-smmu: Minor probe_device related improvements
Date: Fri,  8 Nov 2024 18:30:14 +0000
Message-Id: <cover.1731088789.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_103027_434406_59F2C5F8 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi all,

Just a few tweaks to the SMMU drivers and core code which have fallen
out of some hacking on the __iommu_probe_device() path.

Cheers,
Robin.



Robin Murphy (3):
  iommu/arm-smmu: Make instance lookup robust
  iommu/arm-smmu-v3: Clean up iopf queue on probe failure
  iommu: Manage driver probe deferral better

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 19 ++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 31 ++++++++++-----------
 drivers/iommu/iommu.c                       |  2 +-
 drivers/iommu/of_iommu.c                    |  2 --
 4 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


