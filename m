Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CBFD6A223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Syxv0FoOBB4h13UWKAEBadAMFf/B4eLwDIBKlC5H3k=; b=49jLZrFn5oHo2o6xjMqTlEylvP
	PLllCrIuNaAVG27q8gTaihSAeTpQ60xlztLQkprYN2/ZtsHMRrYYW/BCYgeB5Zdc5qALIo/AKjFQB
	hWpBH4lIAT8qJVYJIqxpsNCt82cO5SojIdi7uPh70bW6ZH8w+QAaeprQgv7yctjTFllP9eopfgbt8
	wq2LRzebF8xWILb15qPElBP8dL9qMkQ2TtHBcQY2ZczxaDGnOnSfO0j3/xUXkuNKXoLlURlx509yC
	0Xysf5UvQpydaYoiHucS13ocvWY0gNBHGhwaDnx0lYDmWZW/Vgyp7M9PleAuhC/j5prksWoZR8/q+
	4g5tLuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdtO-00000000Msi-2fNQ;
	Thu, 14 Nov 2024 17:44:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdri-00000000MWy-1LiF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94698A41815;
	Thu, 14 Nov 2024 17:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C09C4CECD;
	Thu, 14 Nov 2024 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731606165;
	bh=9i/rD6KyjgnD4YtBXzh1hFhiRin+Kv8Syn9HvXmZ8+4=;
	h=From:Date:Subject:To:Cc:From;
	b=F0IKid9b0r9yq0gsNzwJStnDQPVpLDz0ENj+poqsJpDsAv6m/YQR0WTR85gNRHj2V
	 jBRzJKznpg7+BmvJffWpwlSFqpYAzjb++/V6fzjOBO7/W6/OHPsKqxtcm4gjM5xte6
	 wyuAVF206wWhLzbjNrKbReYntMRXBNiwiYbTOzKpQVWa9AxkMpf6Q6NXcus3QSuZ+A
	 XhZTXCgTHiiMX2zKc0u5iddepUKaPAqnrsq0t7Qt1G6419A1OIT+gUPLD+Bw6UYPSm
	 jGsDIlnvMlaBbhZdS7fdRQu+7z1/TCIWGUpvAJ8zXqRLmMbcoMRRDlmatP31S8gcbg
	 ZrLtOQ98RciOg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 14 Nov 2024 10:42:29 -0700
Subject: [PATCH] iommu/arm-smmu-v3: Import IOMMUFD module namespace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-arm-smmu-v3-import-iommufd-module-ns-v1-1-c551e7b972e9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIQ2NmcC/x3NQQrCQAxA0auUrA2YcVTwKuKiNBkNmJmS2CKU3
 t3B5dv8v0GIqwTchg1cVg1ttYMOA0yvsT4FlbshHVMmooyjG4bZgusJ1ebmH9TWXRit8fIWrIG
 ZUyrMVK6XM/TU7FL0+9/cH/v+A6POpjl2AAAA
X-Change-ID: 20241114-arm-smmu-v3-import-iommufd-module-ns-4d22fdd1f765
To: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9i/rD6KyjgnD4YtBXzh1hFhiRin+Kv8Syn9HvXmZ8+4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlmZlOS6joeGd06s72Dp2xWnejDWSK7mGN6tttc6Fe9l
 pjfsuBhRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhI9D2Gf4q86sq5GRWLrouU
 B558esvJWPH/kTbz+49U/23SWeuYls3wz9hRLbNtQz+z0qprfCcsGA6d1pm/e9/CZ9V/z7Z96z4
 mzAoA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_094246_448657_92F4528C 
X-CRM114-Status: UNSURE (   8.23  )
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

Commit 69d9b312f38a ("iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC")
started using _iommufd_object_alloc() without importing the IOMMUFD
module namespace, resulting in a modpost warning:

  WARNING: modpost: module arm_smmu_v3 uses symbol _iommufd_object_alloc from namespace IOMMUFD, but does not import it.

Commit d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE
using a VIOMMU object") added another warning by using
iommufd_viommu_find_dev():

  WARNING: modpost: module arm_smmu_v3 uses symbol iommufd_viommu_find_dev from namespace IOMMUFD, but does not import it.

Import the IOMMUFD module namespace to resolve the warnings.

Fixes: 69d9b312f38a ("iommu/arm-smmu-v3: Support IOMMU_VIOMMU_ALLOC")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index c96cab6521a468d49a4c25566d08ea756211d545..6cc14d82399fa2666bd5374bb7d565171f6ce7ac 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -397,3 +397,5 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 
 	return &vsmmu->core;
 }
+
+MODULE_IMPORT_NS(IOMMUFD);

---
base-commit: d68beb276ba26cec47350a6d468e967673ee0c56
change-id: 20241114-arm-smmu-v3-import-iommufd-module-ns-4d22fdd1f765

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


