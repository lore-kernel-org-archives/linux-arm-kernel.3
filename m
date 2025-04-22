Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB789C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7n+eTgRYkRc7sw4rcBQVahvjNwHqO8QdYQ27fp5lL5k=; b=jmP8xeQsbQJcRX8pVJkhl4nLOG
	8fIaLOPeplfKDFLOkbO2RV3f+Mrk/FdqvPlnRUTAZAJahZ/FxZ5SN8iUhD/2z+bZPlCuuYnw8hN9p
	hQVQBL8TYjKKMCH2212Di1CBV3H9VAoWzgMQrxDecrrMeLA/xPr7rQ62fc4LfD+WFwQL9RedJAbfK
	dafy6oUzunQfT+9mGMjqKgazg6BSxmtFrt69wfq6WR64WboiZthPcGb7CR7ab3MAta/BefnKB44Eg
	gDYBpRv0y5irrmpF9g669X9wOD6OnNqbPU6XHKol7mb/CvAyP9sYWLwg40YXiUJkoFCN+wSZxTjVO
	6YpWNU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CQT-000000073dI-3OEE;
	Tue, 22 Apr 2025 12:08:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BpG-00000006wjG-2Jgk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:30:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Zhg3q5Rrvz1d0R7;
	Tue, 22 Apr 2025 19:28:55 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 611751400CD;
	Tue, 22 Apr 2025 19:29:53 +0800 (CST)
Received: from localhost.huawei.com (10.90.30.45) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 19:29:52 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<wangzhou1@hisilicon.com>
CC: <linuxarm@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <xiaqinxin@huawei.com>
Subject: [PATCH] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
Date: Tue, 22 Apr 2025 19:29:51 +0800
Message-ID: <20250422112951.2027969-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043006_735444_B1F8F6E1 
X-CRM114-Status: GOOD (  11.61  )
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

An error is introduced in commit '48e7b8e284e5'. When the smmu
does not match with domain,an error code is not returned.
An example of an error scenario: In vfio_iommu_type1_attach_group,
vfio will try to match an existing compatible domain. During this process,
iommu invokes the attach_dev interface.The mismatched dev and domain
does not return an error code as expected.
As a result, an exception occurs when the vfio operates the smmu.

Fixes: 48e7b8e284e5 ("iommu/arm-smmu-v3: Remove arm_smmu_domain_finalise() during attach")
Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 358072b4e293..cb2698325809 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2932,7 +2932,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	smmu = master->smmu;
 
 	if (smmu_domain->smmu != smmu)
-		return ret;
+		return -EINVAL;
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cdptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
-- 
2.33.0


