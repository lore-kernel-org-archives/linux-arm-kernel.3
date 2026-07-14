Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F952C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOrVLDpGjRjUa+f8VzrtP6B9hFELin8qYtwTJlLmQHk=; b=U/xuMssz6nLIkuxWiygvUjc9i6
	uWx9jAW8lxCbzP+mN1HQvIlJec5pWBz7N5Fzmvbka2tchgQhzEXHE+DgLDbT19H3B9IK1xeBowmtf
	0p2u33xLvLK2b1HkkYK/hMTztjyv0q+F25Q4ILakrqO+sRrSbC+H7xZM4DFumBULPWq5hFIz4t0KQ
	5reSk/Uzud4tSs+25dCBSISq+hoGAQ/cQjk8l/Iza6CB+F6VSIEDmPn/2PuaD8O3sgxe5m/iyYDzD
	feHljNG1MI047/oWLgRX6ZtpUwa+mRpbRnZ3TYJCOhVctx0NPTWLCZEzf1Plw1kHhCag2YWuPNCK2
	kOH6xWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLX-0000000B0TD-2o3T;
	Tue, 14 Jul 2026 06:10:23 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLQ-0000000B0QR-2Vk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fO
	rVLDpGjRjUa+f8VzrtP6B9hFELin8qYtwTJlLmQHk=; b=iqI/ShWLN0QGPUqjSJ
	HV4sJ1rtMWL3tWOLVElIvwBK6ZSAS4vfu0sssBfLo/bYGEpI3L73sIP+ni1SSqUT
	CmAr7QEESbFj+puJ3v3C2uYKuvXUwn8posOU/mE9sIfmLZjymxF95WZIUJm21bsD
	UnPKkFa6CVRl/0wW+XDTRAaMM=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S5;
	Tue, 14 Jul 2026 14:09:48 +0800 (CST)
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
Subject: [PATCH v1 3/4] iommu/vsi: Fix fwnode lookup lifetime handling
Date: Tue, 14 Jul 2026 14:09:29 +0800
Message-ID: <20260714060930.220277-4-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnwyab0lVqrG_HHA--.5129S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyrGF1DJw1fCw47uF45Jrb_yoW8Ww45pF
	WUGayYkrWUXF10gF47C3W5CFyYvws2va4I9rW5tw4v9w1rtrW8ta4UJryjqryrCFZ5J3W7
	Kw13ta97CFy5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeg4fUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzgzPX2pV0qyd0gAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231017_008083_59B2F373 
X-CRM114-Status: GOOD (  12.05  )
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
incremented. vsi_iommu_get_from_dev() drops that reference before
reading the driver data, which leaves the returned pointer derived from
a device after its reference has been released.

Read the driver data before put_device(). Also make
vsi_iommu_probe_device() fail with -ENODEV when the IOMMU cannot be
found instead of dereferencing a NULL pointer.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/vsi-iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
index 42c424496..d19db561e 100644
--- a/drivers/iommu/vsi-iommu.c
+++ b/drivers/iommu/vsi-iommu.c
@@ -220,10 +220,15 @@ static struct vsi_iommu *vsi_iommu_get_from_dev(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct device *iommu_dev = bus_find_device_by_fwnode(&platform_bus_type,
 							     fwspec->iommu_fwnode);
+	struct vsi_iommu *iommu;
+
+	if (!iommu_dev)
+		return NULL;
 
+	iommu = dev_get_drvdata(iommu_dev);
 	put_device(iommu_dev);
 
-	return iommu_dev ? dev_get_drvdata(iommu_dev) : NULL;
+	return iommu;
 }
 
 static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
@@ -619,6 +624,9 @@ static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
 	struct vsi_iommu *iommu = vsi_iommu_get_from_dev(dev);
 	struct device_link *link;
 
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
+
 	link = device_link_add(dev, iommu->dev,
 			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 	if (!link)
-- 
2.43.0


