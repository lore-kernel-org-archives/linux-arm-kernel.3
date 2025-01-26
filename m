Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2AEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PjbT0CVv7OegZN4Y2eW6sFVAR3vBTL3OYyaOlcGMAk=; b=yYEUhVnCj1xoWK+GV6kYX+6QM4
	uW4omZo4pgJKL47YOUbSn4QpTGBK8mghhvCyKx0DziX6N7w5nvSGs+S/Rx6J7YyaXd6Iuvj1UDSP7
	c1vvPyTr9NSL5JiJ2S/7/mPTg4Caw5tH8n5PqWI4vsQLuLRs6rbh/hDHNzZdGCmR+//la7dZLxjTI
	kd9RaiZT4bS01tsLd4TDpVZAnQaMBGVo87wk+cZ33H3k/eW81rp6osvfZaD6sJxRtnq8gZPtcRKWB
	GFvkgX0YDDSVYRUnK25eq49QgO0KOPPFYG9FSejjlQnQLANWEzsLRuG0nbqzpN3Iig85D2apZdBH4
	NG+GvKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4NV-0000000006w-0SFD;
	Sun, 26 Jan 2025 15:16:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc4GA-0000000HZFH-32iU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 15:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13EEC5C5F3C;
	Sun, 26 Jan 2025 15:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83920C4CEE2;
	Sun, 26 Jan 2025 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904154;
	bh=4gxp0Us1gN/S3Gs0f8tqzA1wk8Sit8ldVbqMDRDe/5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NlFHeFzSJbfWv611mDiY2k1NJ8u2mq42nxMAwknG6go/po2QJbGB2YLfnjf8nntyg
	 d4+QnczWeaO+05n2gu8FPboT5XJcZp+pLDxayddaTth/6GadmoRWsl6ojTmttkHo/d
	 8R62nG8WuMkkZq/j2JJW4gT0xiC+0gQSUSCsSYslBcuZ8PCIuwsGV9oGNxRxBxwBBC
	 +phAr5gOPMNfSuSDP55vZQEWpRE3J0L0uM5pgoTxq8OhevX/dwGd6zIawitcZOV0zS
	 z+lEiu5ZItMU8l9WdGSZYLSWAIua05nlhIzyPKs+GhOAvEn7OUjVjT4caB41NoS6FG
	 HUHycjvQRMvow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	joro@8bytes.org,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	mshavit@google.com,
	smostafa@google.com,
	praan@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 3/8] iommu/arm-smmu-v3: Clean up more on probe failure
Date: Sun, 26 Jan 2025 10:08:55 -0500
Message-Id: <20250126150902.962837-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150902.962837-1-sashal@kernel.org>
References: <20250126150902.962837-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.127
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_070914_852427_5BD42E13 
X-CRM114-Status: GOOD (  12.87  )
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

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit fcbd621567420b3a2f21f49bbc056de8b273c625 ]

kmemleak noticed that the iopf queue allocated deep down within
arm_smmu_init_structures() can be leaked by a subsequent error return
from arm_smmu_device_probe(). Furthermore, after arm_smmu_device_reset()
we will also leave the SMMU enabled with an empty Stream Table, silently
blocking all DMA. This proves rather annoying for debugging said probe
failure, so let's handle it a bit better by putting the SMMU back into
(more or less) the same state as if it hadn't probed at all.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/5137901958471cf67f2fad5c2229f8a8f1ae901a.1733406914.git.robin.murphy@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 45b43f729f895..96b72f3dad0d0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3880,7 +3880,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
 	if (ret)
-		return ret;
+		goto err_free_iopf;
 
 	/* Record our private device structure */
 	platform_set_drvdata(pdev, smmu);
@@ -3891,22 +3891,29 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu, bypass);
 	if (ret)
-		return ret;
+		goto err_disable;
 
 	/* And we're up. Go go go! */
 	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
 				     "smmu3.%pa", &ioaddr);
 	if (ret)
-		return ret;
+		goto err_disable;
 
 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ret;
+		goto err_free_sysfs;
 	}
 
 	return 0;
+
+err_free_sysfs:
+	iommu_device_sysfs_remove(&smmu->iommu);
+err_disable:
+	arm_smmu_device_disable(smmu);
+err_free_iopf:
+	iopf_queue_free(smmu->evtq.iopf);
+	return ret;
 }
 
 static int arm_smmu_device_remove(struct platform_device *pdev)
-- 
2.39.5


