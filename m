Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B77C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtIyI3ekYzzrVbzFXfKJNoVPZ+6IwfdqtepO91kM++E=; b=ORHkUk7uFkSk4N2bKBJqZR1f8Y
	5Kser0GivEjnPo5XN2RgfoYpmYcs2YfR//OEGQrHhJldvnTEtwsmivJcIlTcNKSyrpMjSzCVCLT9/
	fkHEOw0KpLjCET5x6+2PQElETr30KP5btePAxFRhOVIeacWV6dwPVzk+aj2oNyugrVx+6tUbqOXiz
	E22pS2WFRSzKhVr6+KX2UaC5+Fj1irF3PDTARzMKuEwRdR1WlXm0KujtptVG5Yqq4sLs8NP/tb9vn
	WGtkAMXoGe48BY2UtYabz3wLI7OpxbI0qcuEpHgPe4Ys8RIa01/jtZSe4ovcpIq/7IOabFMN2utot
	x/wxtAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCIC-0000000BiDu-0skL;
	Thu, 20 Mar 2025 09:34:24 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCF9-0000000Bhcd-0aId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 09:31:16 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id BC3445F9AD;
	Thu, 20 Mar 2025 10:31:10 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] iommu: make inclusion of arm/arm-smmu-v3 directory conditional
Date: Thu, 20 Mar 2025 10:19:12 +0100
Message-ID: <6164975.lOV4Wx5bFT@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <12652899.O9o76ZdvQC@devpool47.emlix.com>
References: <12652899.O9o76ZdvQC@devpool47.emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_023115_322155_5113AC5E 
X-CRM114-Status: GOOD (  10.23  )
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
=2D--
 drivers/iommu/arm/Makefile             | 3 ++-
 drivers/iommu/arm/arm-smmu-v3/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/Makefile b/drivers/iommu/arm/Makefile
index 0f9efeab709f..35a7e13eef34 100644
=2D-- a/drivers/iommu/arm/Makefile
+++ b/drivers/iommu/arm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
=2Dobj-y +=3D arm-smmu/ arm-smmu-v3/
+obj-y +=3D arm-smmu/
+obj-$(CONFIG_ARM_SMMU_V3) +=3D arm-smmu-v3/
diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm=
=2Dsmmu-v3/Makefile
index 493a659cc66b..6cc7c8557b9e 100644
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



