Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EB6CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5duRQLCA/bGKWwNVui3NRidvUDd3JmBN2G/gYGjz9A=; b=sQHNOEmKYdbezdLRaBkoETcTnm
	EXsb20mrVpqb2SR97zniL9QIbFj69sJ1kG8DG2hWKmaefEIucBTG5o0FN7p6gJu5ZIeJhCqLf0jF7
	Hj/1Jo1J9ZYzmJqI4mHUsNWxWwGSy31pj8VuOH3eSsqK5Vi7UmSyVExUrjs1jpQqjF8cinCH0W7hf
	/CgEe1f+cNhhTTEdafHTnw/yxS/CbHHhEAIUlPSG2P8pa+jqoWOHdVZB9g0kyDLopPIvoNCQBHYmX
	TyGG8zzDYRiAbsC0IlwxJ/Gajo0MgKwuA0B+5lfdOUjsLL3QJnHUKe+uAHPMPHRr7S3AiVFfZXSvY
	CLnAbVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvK8-00000005oa6-0p9z;
	Tue, 23 Jun 2026 07:13:32 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvK5-00000005oZc-2F5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=T5
	duRQLCA/bGKWwNVui3NRidvUDd3JmBN2G/gYGjz9A=; b=c6tNc/HPuqMUhEDXmf
	/VVWy7uRnqL2jjFAecWpsx6ALh02YXw6LIFvf8lp7aTWUbjmsAvXbVN+1tyRIOxn
	5lQqIPn8ZGa78IKop3ao8gw6Hm9p8gpgsc6SRhS5nZBsD8iGpZiimJNAz+zW6Nmh
	202+BVorehsvURByiLx3NEorE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCn5MjwMTpqH6DKFQ--.10651S2;
	Tue, 23 Jun 2026 15:12:50 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: robin.clark@oss.qualcomm.com,
	will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jroedel@suse.de
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
Date: Tue, 23 Jun 2026 15:12:45 +0800
Message-Id: <20260623071245.1985938-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn5MjwMTpqH6DKFQ--.10651S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruF45AryDZFWrAr1kAr4xZwb_yoW8Jr45pa
	yUGFZIgrWUWF1rtFyUJ3Z7ZFy8KwsFva4S9r4fG3yYgw1UAryUKFyxtFySgr1rJFWDG3W3
	A3s3XryqvF15G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimhF7UUUUU=
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxRKxIGo6MfL+YQAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_001329_925277_FCCA7C1B 
X-CRM114-Status: GOOD (  10.76  )
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

In qcom_iommu_device_probe(), if iommu_device_register()
fails, the sysfs device created by iommu_device_sysfs_add()
is not released. Add a goto label to do the cleanup.

Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a1e8cf29f594..32efef69e72d 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -855,7 +855,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		goto err_pm_disable;
+		goto err_sysfs_remove;
 	}
 
 	if (qcom_iommu->local_base) {
@@ -866,6 +866,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 err_pm_disable:
 	pm_runtime_disable(dev);
 	return ret;
-- 
2.25.1


