Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E42CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wu4xt2SoksscXk0W48QmnDjXSJs3uObhzvzFgCeYOU=; b=fVDh0ZsAiFAkcEXPY2Zv+hdvPK
	D8Mr6EJvvn3dbezoLA5CYmoPok+jp/q5Y4ImuExG5/yKDdAEckcrpa0Ky567J7ltd2jRns6kgRLyD
	xxYqVHMGeZhIcvCSTcCM45Hk8f0jMUWqhOTt0P5+d3RWLG4jIS65oBY/xXKO/qreA9OnID2q6MfcB
	ujlY/npt5Hv8WrDoGWu7Tdl9WLGWOdp/DWx+NHnRDPPE6iSRrq7ZyHYNPUvx79Njw4s+2quOfmMDf
	jG1CqF8H8EVnFhfOlYQahNYCjf3gHBlMCMfVStIQ08lZPTr6sI7tWpzyARszWa6DKIR6hxfIWrlXn
	nYrKPBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeY-0000000CoWT-1bav;
	Tue, 02 Jun 2026 10:47:22 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeT-0000000CoIx-36AU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397236; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6wu4xt2SoksscXk0W48QmnDjXSJs3uObhzvzFgCeYOU=;
	b=ZI26kRn7GUX7bKAaxqpqO7SHdqAlOnP429/OD2ySb9YeSB4YfBaIz5USwIp1Fo/x49f6AUGLxKi+f0kO0yRmjg04n+oltPrUIxHKVLOgJh01Edgfjn0R8rK4cfgHqAT1fyUz2WcLLcH2WXEjUNkbGBgzECaetskCia8a0SoJ1dE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E98x_1780397233;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E98x_1780397233 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:14 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Cc: alikernel-developer@linux.alibaba.com
Subject: [PATCH v2 26/30] iommu/io-pgtable: selftests switch to iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:33 +0800
Message-ID: <20260602104637.1219810-27-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034718_001695_5F7259C3 
X-CRM114-Status: UNSURE (   8.63  )
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

Migrate io-pgtable ARM selftests to use ops->iova_to_phys_length
instead of the deprecated ops->iova_to_phys.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm-selftests.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
index 334e70350924..78252344c3d0 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -72,13 +72,13 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 		 * Initial sanity checks.
 		 * Empty page tables shouldn't provide any translations.
 		 */
-		if (ops->iova_to_phys(ops, 42))
+		if (ops->iova_to_phys_length(ops, 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
-		if (ops->iova_to_phys(ops, SZ_1G + 42))
+		if (ops->iova_to_phys_length(ops, SZ_1G + 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
-		if (ops->iova_to_phys(ops, SZ_2G + 42))
+		if (ops->iova_to_phys_length(ops, SZ_2G + 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
 		/*
@@ -100,7 +100,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 					    GFP_KERNEL, &mapped))
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 				return __FAIL(test, i);
 
 			iova += SZ_1G;
@@ -114,7 +114,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != PHYS_ADDR_MAX)
 				return __FAIL(test, i);
 
 			/* Remap full block */
@@ -122,7 +122,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 					   IOMMU_WRITE, GFP_KERNEL, &mapped))
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 				return __FAIL(test, i);
 
 			iova += SZ_1G;
-- 
2.43.7


