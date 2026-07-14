Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F657C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSMd5BPF4fYsYrSjBZEUKbIw8wpxukNBKTZpcMK3Duo=; b=Vs2HBru/tT5muzsL6vRCp59iDR
	IsfhISDbNqgpurv1P6ymSTY3pEICOzGGU8MHIvO2rDZmtkaPWJZoFHqlzKADjCQJpJl5ICrUlGwos
	BCJ/dgdvQziVdwFXGph5lYtF4p9pypesdlyxnMSBn/sURI2cxUpfi9EtwxdvB885EHbJT7qlFtALx
	vW6PHvnrN8nuqksJ8LaHOHQ54ogbfIBMl9soigq9V0cIX8WYWnhg0bSP9Pai9dPcDsXRJ4l6/Tfr6
	QQizSJCPUSXSrXG5SoaO8cpot88BwbOmGtTYoSWHmmSyHWNYfWw+uvzWrbeb6TXJatdbOKLuVPJ66
	ukO6w0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLT-0000000B0SB-0ao1;
	Tue, 14 Jul 2026 06:10:19 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLQ-0000000B0QS-2DfZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dS
	Md5BPF4fYsYrSjBZEUKbIw8wpxukNBKTZpcMK3Duo=; b=DdqhWYc66UcFUgEnhy
	cf1r+XH3UNq0EIYmW8zU6iHHiZf1TLAWcUBEyJQ221DA601xIR1WzSQzIU3abw4Q
	8DBC1TkBft4NfF7z0vtaHEMl3B2MhtPkj1zWtttsII1AyGQ5hZdxbvDz91Xtkfnd
	d8OJBbnJgKXcALciSuMVeZOs8=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S3;
	Tue, 14 Jul 2026 14:09:47 +0800 (CST)
From: weimin xiong <xiongwm2026@163.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	weimin xiong <xiongwm2026@163.com>
Subject: [PATCH v1 1/4] iommu/arm-smmu: Fix fwnode lookup lifetime handling
Date: Tue, 14 Jul 2026 14:09:27 +0800
Message-ID: <20260714060930.220277-2-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnwyab0lVqrG_HHA--.5129S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDZr43Ar15GF1ruw1fCrg_yoW8Xw15pF
	WUCFyYvrWUWF1jkr4DJw1rAF1Y9a10yas5CrW8C3s09w13ta45tFy8KFyagwn5CrZ5J3W3
	tr9Fq3yrCF98ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH6wtUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbC7wvOXmpV0qsbnwAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231016_921826_6FDE80CA 
X-CRM114-Status: GOOD (  12.66  )
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

bus_find_device_by_fwnode() returns a device with its reference count
incremented. arm_smmu_get_by_fwnode() drops that reference before
reading the driver data, which leaves the returned pointer derived from
a device after its reference has been released.

Read the driver data before put_device(). Also handle a failed lookup in
arm_smmu_probe_device() before dereferencing the returned SMMU pointer.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206..b70c307b8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1426,9 +1426,15 @@ static
 struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 {
 	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+	struct arm_smmu_device *smmu;
+
+	if (!dev)
+		return NULL;
 
+	smmu = dev_get_drvdata(dev);
 	put_device(dev);
-	return dev ? dev_get_drvdata(dev) : NULL;
+
+	return smmu;
 }
 
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
@@ -1451,6 +1457,10 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 			goto out_free;
 	} else {
 		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
+		if (!smmu) {
+			ret = -ENODEV;
+			goto out_free;
+		}
 	}
 
 	ret = -EINVAL;
-- 
2.43.0


