Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9354C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhfslcpHdUhNNXRQ4ogp+r7QeP4J398JLM+1yQpy6jY=; b=ISsjEifcL07kHMg0PxKFzbiiZY
	zt6kLWCLi2xQDzEqe5b8Bj0YCAgJNKI68HmVMwUFNWoRTp5lKY1Sno9418i1/Pjl86HHw58g19jPo
	AF8HgUg1kMrr1slqZs9ig75sbbpA46Ce/SCubFLY19sZFZLZYvbrJBPBd/NTyrz+9egIqxcik+Ekq
	/io0b4GtCIrQuwgJdvKS1Jl/8dJD699Yvwtzb0QusI2O8u6vtbht0Y1z+E/x3Kur5gF+7U7GV7d+M
	CjBGbqPaKyu/+qKs6P4ks9HU1IQ77qPqKvjwYLwencusAxfULwabwppHrxnz1CaUSyFoJT34GbH6g
	qcE6xtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETfb-00000009e4h-09IU;
	Mon, 12 May 2025 13:58:15 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uET11-00000009VPw-2yEB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:16:21 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 54AF75F954;
	Mon, 12 May 2025 15:16:15 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] iommu: make inclusion of arm/arm-smmu-v3 directory conditional
Date: Mon, 12 May 2025 15:14:46 +0200
Message-ID: <2434059.NG923GbCHz@devpool92.emlix.com>
Organization: emlix GmbH
In-Reply-To: <1926170.CQOukoFCf9@devpool92.emlix.com>
References: <1926170.CQOukoFCf9@devpool92.emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_061619_891005_0789DA90 
X-CRM114-Status: GOOD (  10.16  )
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

Nothing in there is active if CONFIG_ARM_SMMU_V3 is not enabled, so the who=
le
directory can depend on that switch as well.

=46ixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their ow=
n subdirectory")
Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
=2D--
 drivers/iommu/arm/Makefile             | 3 ++-
 drivers/iommu/arm/arm-smmu-v3/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/Makefile b/drivers/iommu/arm/Makefile
index 0f9efeab709ff..35a7e13eef344 100644
=2D-- a/drivers/iommu/arm/Makefile
+++ b/drivers/iommu/arm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
=2Dobj-y +=3D arm-smmu/ arm-smmu-v3/
+obj-y +=3D arm-smmu/
+obj-$(CONFIG_ARM_SMMU_V3) +=3D arm-smmu-v3/
diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm=
=2Dsmmu-v3/Makefile
index 493a659cc66bb..6cc7c8557b9ea 100644
=2D-- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
=2Dobj-$(CONFIG_ARM_SMMU_V3) +=3D arm_smmu_v3.o
+obj-y +=3D arm_smmu_v3.o
 arm_smmu_v3-y :=3D arm-smmu-v3.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) +=3D arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) +=3D arm-smmu-v3-sva.o
=2D-=20
2.49.0


=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner



