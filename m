Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36ACC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QNqDz7+fyo1hY4ldh6Vv+Mpnt1WXdUVRp9SJriXBn7o=; b=l7ax8RUf6X8VKUeYwcWCsijMSm
	Qn1aYKpaEJkue0kdbGcKMOcTVn3AtfS7UoQgmNamGemWjZlqIOsORaVZ91w5l9bEPp7sIWWZMQMPM
	X0hilJhVpd4cVfvQTSZlS9ntY9nMxwHjhxhs4CubmM7Fy3yBrzzfExU/BJPzNIja/FxteT0TeOYrL
	2nf08cuQGe69X//vD6tU/kwq+hxVGYTlxT1CcPM3n3tmHx1TnNkxwL5oujPRYPoJ8Pj6ShDbL1bVj
	RMnOXEOqnaiBShZiOE0PIAsUFQ/opc08g8daIp24Gy1bF2FbnFO/u66Z306QQtuOIjR256vppon0E
	5ZGujY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK3Z-00000002ce5-0mxi;
	Mon, 27 Jul 2026 12:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woK3X-00000002cd2-06ft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:03:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17DC3143D;
	Mon, 27 Jul 2026 05:03:32 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3847A3F86F;
	Mon, 27 Jul 2026 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785153816; bh=UuZ5SNCWn87Voxt+QpWuTLGoK25xwa8suwRocSvq+Hk=;
	h=From:To:Cc:Subject:Date:From;
	b=dCinzq0CNKlyA2GBwBXlZL1JJGGe8RTvzTBN4JxAwVMBbKgSn1lIqxfhnsfiDgoR0
	 s/Cq6FpE9cCv62ZQsXlc5n/Zo0XOOCN7SJj7KHYKeNpGGVA6aLDsNgqiNTE5VpU2HM
	 QTobcbGVRIJ8ZsEwhiF1PKXYeSVVx2hTc4T8nnaQ=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: jpb@kernel.org,
	jgg@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] iommu/arm-smmu-v3: Fix SVA vs. HAFT issues
Date: Mon, 27 Jul 2026 13:03:27 +0100
Message-ID: <cover.1785153415.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_050339_189367_7322813D 
X-CRM114-Status: UNSURE (   7.42  )
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
v2: https://lore.kernel.org/all/cover.1784814923.git.robin.murphy@arm.com/

Further to v2, work around the contentious CD update.

Thanks,
Robin.


Robin Murphy (2):
  arm64: Add override for MMFR1.HAFDBS
  iommu/arm-smmu-v3: Add HAFT support for SVA

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/kernel/pi/idreg-override.c         |  2 ++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 24 +++++++++++--------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  9 ++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 +++
 5 files changed, 30 insertions(+), 11 deletions(-)

-- 
2.54.0.dirty


