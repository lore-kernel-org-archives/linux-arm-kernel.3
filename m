Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D9DC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vz0gst0zM0zA/cG9CcgJd4aazGq5n75R+kcCVIucFW4=; b=gpJ7SZfm6/05MFea/0ZjknmKm2
	Zcr+FYLMAhrll2UxSs+XuNg4X745/ylTG5/wL75Gai/s5VOf4K/+1C8QI8XyTk6W6+QtsmQ/adb1r
	Qnevri1v7wgR4LiW6l7E9XEMvBal1I9vm1+2yWEFMjEOjH9dmbNQ9U5DeOy4ir5S6qxkqeU0XhLRU
	ZHD4A3ib+toh4clo7GxkIoOOGqUnLUpkSgODJv1ukN1ucfHCk12RMazu8zvNPU1x0vFTiv3G+RtE6
	MRn0H9kw361Z01Wjys5VxDamqPBregf44f76NFJ2uKbYRaqgi30bwPzmCC0m+RbWp5lKl0Olr3X2h
	bP1PaJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FOD-0000000E5pm-0cTe;
	Fri, 11 Apr 2025 14:29:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F4L-0000000E2Jc-05uo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:09:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12CA8106F;
	Fri, 11 Apr 2025 07:09:20 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84E8D3F694;
	Fri, 11 Apr 2025 07:09:19 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jgg@nvidia.com,
	nicolinc@nvidia.com
Subject: [PATCH] iommu/arm-smmu-v3: Fail aliasing StreamIDs more gracefully
Date: Fri, 11 Apr 2025 15:09:14 +0100
Message-Id: <39d54e49c8476efc4653e352150d44b185d6d50f.1744380554.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_070921_102223_812FD079 
X-CRM114-Status: GOOD (  12.35  )
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

We've never supported StreamID aliasing between devices, and as such
they will never have had functioning DMA, but this is not fatal to the
SMMU itself. Although aliasing between hard-wired platform device
StreamIDs would tend to raise questions about the whole system, in
practice it's far more likely to occur relatively innocently due to
legacy PCI bridges, where the underlying StreamID mappings are still
perfectly reasonable.

As such, return a more benign -ENODEV when failing probe for such an
unsupported device (and log a more obvious error message), so that it
doesn't break the entire SMMU probe now that bus_iommu_probe() runs in
the right order and can propagate that error back. The end result is
still that the device doesn't get an IOMMU group and probably won't
work, same as before.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b4c21aaed126..c06459f7077b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3400,9 +3400,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		/* Insert into SID tree */
 		if (rb_find_add(&new_stream->node, &smmu->streams,
 				arm_smmu_streams_cmp_node)) {
-			dev_warn(master->dev, "stream %u already in tree\n",
+			dev_warn(master->dev, "Aliasing StreamID 0x%x unsupported, expect DMA to be broken\n",
 				 sid);
-			ret = -EINVAL;
+			ret = -ENODEV;
 			break;
 		}
 	}
-- 
2.39.2.101.g768bb238c484.dirty


