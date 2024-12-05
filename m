Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D929E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PHav4kkhud3prW/PAD08b26MNM5KWfuvVPusdpV5xgk=; b=FgUY3r7dVuexheMns7HOh9IsFG
	k2f4iLrKBbSDfXg9pA33sfaw5ziBoMQOJodM/BoKJ0NIb9YykKHQbS3B7W5uv12LFdSpDnJ+7OnRl
	cTzxTH+YvpliNv3EoHVII9j+ZAtIxtWQtPIRxSY+pqbmx4WBg61dFkOXjv3gD1tBQwrMi4MzB69+2
	kE2F1xDP10ZkCykdl3Ak417nMf6foWUMmIKCk6uMcu1bp2GFe3GWvWxckOMKLTr868nQ9EN7UuwaQ
	M/5JlbZDaORZ4nFnF/bzNp9T8e0hJsnrnlisI7pgLuAoIQrYtvaiyurK0mzrLEwBQzrCrynIY5pr4
	M6dJs2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEop-0000000GljJ-2ZyU;
	Thu, 05 Dec 2024 16:35:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEnn-0000000GlYj-49jh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:34:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B857C1063;
	Thu,  5 Dec 2024 08:34:34 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C55593F5A1;
	Thu,  5 Dec 2024 08:34:05 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	quic_pbrahma@quicinc.com
Subject: [PATCH v2 0/4] iommu/arm-smmu: Minor probe_device related improvements
Date: Thu,  5 Dec 2024 16:33:54 +0000
Message-Id: <cover.1733406914.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083408_069092_91E286B0 
X-CRM114-Status: UNSURE (   6.88  )
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

v1: https://lore.kernel.org/linux-iommu/cover.1731088789.git.robin.murphy@arm.com

Hi all,

Here's what I probably should have sent instead of rushing v1 out
earlier, now rebased and polished :)

Cheers,
Robin.


Robin Murphy (4):
  iommu/arm-smmu: Make instance lookup robust
  iommu/arm-smmu: Retire probe deferral workaround
  iommu/arm-smmu-v3: Clean up more on probe failure
  iommu: Manage driver probe deferral better

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 +++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 42 +++++++--------------
 drivers/iommu/iommu.c                       |  2 +-
 drivers/iommu/of_iommu.c                    |  2 -
 4 files changed, 29 insertions(+), 38 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


