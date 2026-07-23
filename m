Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C7C531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+hmPlSmIlhY7Usf2sojZTZDoy+FFqdHv2OD7jWVlbI=; b=nCwYFWZuvFZN/6Uexq8wUKQ777
	Gj6CBAOVe7jUXoYIceQlbks+f0RT/PPYBj3En7pO+12OMctvRyFsO2JyTwNKG4D0UGHapmb783xnn
	vPrv/8FSk/yGlFttS/sfBqZrOXmkrOqowrtJsLCwCRo8AzaCZOxKCFgR5otSVPnO9U2GVhucv97qt
	tPKG3jbFotCs9lM+A3gP0JvlRykB2cPMNObt03sBuMvxRlACnVcrC+naAcva5d2QbhgcbQq2HMRQr
	phg7jmrOO2vs2D0WKcikTTTP9DARnLtYBbrE8XRgi81raU/XUpknHuFIx56j5y7nHvWDkBfYxDl5U
	mgSLyDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuHB-0000000ETxK-07QK;
	Thu, 23 Jul 2026 14:19:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuH9-0000000ETvy-0lwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:19:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07B471477;
	Thu, 23 Jul 2026 07:19:46 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 091D03F59E;
	Thu, 23 Jul 2026 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784816390; bh=xotGZCcqGk4Abt5amgAtbtEB69CUE008GfZhtAtUor8=;
	h=From:To:Cc:Subject:Date:From;
	b=vTsWg/h+6NaqsdqnazNd81BA5VKVRkVpxobgONsG0oHUSLSI7QJZRRM3uUKG7XOpl
	 O0BqmyIr2Y5SqrV1ITi890y+nUIEvHiHl2o40kuE6r/YBOvx4gXuS/6VAktN+VEDsv
	 fLCgQwEX2sgTtE547hUgAlXJ1owsHwvWTYoZ7FII=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: jpb@kernel.org,
	jgg@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] iommu/arm-smmu-v3: Fix SVA vs. HAFT issues
Date: Thu, 23 Jul 2026 15:19:42 +0100
Message-ID: <cover.1784814923.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_071951_268497_ACBC6DB4 
X-CRM114-Status: UNSURE (   8.70  )
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

v1: https://lore.kernel.org/all/878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com/

Per the discussion on v1, the aim here is just to make things safe and
functionally correct for now, and now with a command-line option for
distro users to get themselves out of a corner if they really need to,
I think that's reasonable enough for HAFT being a very new feature.

Thanks,
Robin.


Robin Murphy (2):
  arm64: Add override for MMFR1.HAFDBS
  iommu/arm-smmu-v3: Add HAFT support for SVA

 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 9 ++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.54.0.dirty


