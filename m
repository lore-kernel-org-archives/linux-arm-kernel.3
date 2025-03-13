Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD04C35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=96exPhiMMEiz/dW99y3Ne6bCsS1OF0dxgfufQB5Vo+0=; b=BiMNAYjE9pXCjYSnrwR6bNN4k/
	aLRLqeqpJRmSW7hUkaUO0E6UKoL3YobFj9TJ4OWSfxcrUoabu+UFshgPaeuzd9KssKO2Yy/YJskE3
	8yKdpe1Vki0LN/LR7rW6AhXVPHP8ZYsLODrrrkTLBuVEuYGIstZQmxjHQfcwlz8hyYWymYPUDsORE
	sgWIqzHl6L82sqOB+m89rVYPxiwpKVahQpKNyD9MCY/XzSrKt3COitL3tRj/2StwJlqr1XK7Uj9uk
	VwugOuH89I13omi5zf9WOUcxWIm+FnTi1vqOMbfXz5zWeOL/ENiOnTrCq5fNYoGl19kK4OWoLAbGO
	aG/F379A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu2-0000000C6Sm-3PCR;
	Thu, 13 Mar 2025 18:03:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmOn-0000000C31c-2k19;
	Thu, 13 Mar 2025 17:31:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F37021477;
	Thu, 13 Mar 2025 10:31:22 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3F973F673;
	Thu, 13 Mar 2025 10:31:11 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	heiko@sntech.de
Subject: [PATCH 0/3] Rockchip IOMMU fixes
Date: Thu, 13 Mar 2025 17:31:03 +0000
Message-Id: <cover.1741886382.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_103113_733236_02593D1F 
X-CRM114-Status: UNSURE (   6.08  )
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

I was expecting my DT probing change to flush out issues, and it seems
some weaknesses in rockchip-iommu were the first to show. The first two
patches here get things working again for me on my RK3399 NanoPC-T4
(with a console on HDMI exercising the VOP MMU), the 3rd patch just
finishes the cleanup since I was there and could test it.

Thanks,
Robin.

Robin Murphy (3):
  iommu/rockchip: Allocate per-device data sensibly
  iommu/rockchip: Register in a sensible order
  iommu/rockchip: Retire global dma_dev workaround

 drivers/iommu/rockchip-iommu.c | 61 +++++++++++++++-------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


