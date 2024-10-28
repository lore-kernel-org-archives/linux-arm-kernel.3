Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE52D339B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3caiOEyyqpKPSJqqFA2rXjqrWT0E3bBDl+mODs76KKo=; b=uu+PhIl71GNpU+LP1X/P2qTRaZ
	FC7IGwqYz6Xr0m89ZMEabAqqtcpu2AiYi0v/xEJLLILR+h5zTzqGhcB2v2iiuUnyjfxflLeV68aj7
	/AIdOYxUE+NqoU0nOtM15sXloh0OpJ37WGE7OC6M7/9B0wdfWfjwwCqcLKTWEi9UC8WqLyQuHJKCK
	dXDUOeb3ozHH/pXc0FUv+4HpIzODdmU/FqifhF46OXoLgkuiv1R0nU9tGRyHtaXa2OM6UEQjxQMfy
	IKtK0lr4bMIA1sd1SH8hj/VrFNHo38W0PqqrnRgj6+o8lCNdWxEU7TVcHg0oXXIA/LP+F+MMhFRA6
	xaErfT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGE-0000000BmFG-3kqo;
	Mon, 28 Oct 2024 18:14:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5U0u-0000000BjLz-0eLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:58:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1D29497;
	Mon, 28 Oct 2024 10:59:16 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A5BB3F66E;
	Mon, 28 Oct 2024 10:58:44 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: hns@goldelico.com,
	b-padhi@ti.com,
	andreas@kemnade.info,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/4] Fix omap-iommu bitrot
Date: Mon, 28 Oct 2024 17:58:34 +0000
Message-Id: <cover.1730136799.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_105848_265607_3379EADE 
X-CRM114-Status: UNSURE (   7.70  )
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

It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
through the more recent evolution of the IOMMU API internals. These
patches attempt to bring it and its consumers sufficiently up-to-date
to work again, in a manner that's hopefully backportable. This is
largely all written by inspection, but I have managed to lightly boot
test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
working again.

This supersedes my previous patch[1]. Patches #1 and #2 are functionally
independent, and can be applied directly to their respective trees if
preferred.

Thanks,
Robin.

[1] https://lore.kernel.org/linux-iommu/c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com/


Robin Murphy (4):
  remoteproc/omap: Handle ARM dma_iommu_mapping
  media: omap3isp: Handle ARM dma_iommu_mapping
  iommu/omap: Add minimal fwnode support
  iommu: Make bus_iommu_probe() static

 drivers/iommu/iommu.c                    |  3 ++-
 drivers/iommu/omap-iommu.c               | 26 +++++++++++++++---------
 drivers/media/platform/ti/omap3isp/isp.c |  7 +++++++
 drivers/remoteproc/omap_remoteproc.c     | 17 ++++++++++++++++
 include/linux/iommu.h                    |  1 -
 5 files changed, 42 insertions(+), 12 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


