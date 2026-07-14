Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgKBOpsQ6v0plaOyS+PBWO+c7M1uIEDREuFLY6J4zik=; b=y43v5JjIGMUcCuIhjdGXzSQD+t
	X33OWyLEj6rn5u+JGSyJmpjGFfE4USiSPJs6icJiZ660nOQCkhHMVAsK5huQSNf0+03T7ABwkTZ0m
	Fr4gs9BWPHogchR+7P5rSgOQsTBHCbl45cLMRrJfwrlmlAA8S5JQJG3ys6zAVj5hpPtSHlk6z4qvU
	t7SVANq+SREezFiRL31jWotQkuL/14ZVcTQ+8c5L6ejxvkosuhJ5FXbQOQDlEHRz2Vdc6nrnBhluV
	9eXXqxI+Eh6w/TpnefpurN31I8c3RTsUgdboILWsgpgbHJChybEzr0b/kBaXgKFpGwo5NXTMPiH0+
	LO3mTTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLX-0000000B0Ti-3eHg;
	Tue, 14 Jul 2026 06:10:23 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWLS-0000000B0Qd-0nMC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qg
	KBOpsQ6v0plaOyS+PBWO+c7M1uIEDREuFLY6J4zik=; b=eAVwSu2R1PeW98TO1z
	HbKR78s3Gp2nH32r/6OXX2wxmQXBkkFuPfbaEg8n8+L7WLyA18yG3ZhgvNPSRkC0
	P5lN1Lxdfp8vwGxv2Ziz6R/yuEMAwwdFeqkwnnXiwSOBh8opXdsDuXJwc9VfTDUm
	7rk8iTcMKZWoHYD870tzUMsxw=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S6;
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
Subject: [PATCH v1 4/4] iommu/msm: Clean up probe state on registration failure
Date: Tue, 14 Jul 2026 14:09:30 +0800
Message-ID: <20260714060930.220277-5-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnwyab0lVqrG_HHA--.5129S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww48JFy3tF4kCFW5ZFW7CFg_yoW8XrWxpF
	47W3909r1kK3WfKF47AF18uFn0krZFya45uF4fWa9F9r15ArWUXFZ3KFW5tr45GrWkGa17
	Aay3Jr4S9F15Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVlk3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzgzPX2pV0qyd1wAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_231018_853189_8509F848 
X-CRM114-Status: GOOD (  12.60  )
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

msm_iommu_probe() adds the IOMMU to qcom_iommu_devices before creating
the IOMMU sysfs device and registering the IOMMU. If either of those
later steps fails, the function returns without undoing the list
insertion. The iommu_device_register() failure path also leaves the
sysfs device behind.

Add shared error labels so the list entry and sysfs device are unwound
in the reverse order of setup.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/msm_iommu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431..d0d926be7 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -784,19 +784,25 @@ static int msm_iommu_probe(struct platform_device *pdev)
 				     "msm-smmu.%pa", &ioaddr);
 	if (ret) {
 		pr_err("Could not add msm-smmu at %pa to sysfs\n", &ioaddr);
-		return ret;
+		goto err_remove_list;
 	}
 
 	ret = iommu_device_register(&iommu->iommu, &msm_iommu_ops, &pdev->dev);
 	if (ret) {
 		pr_err("Could not register msm-smmu at %pa\n", &ioaddr);
-		return ret;
+		goto err_remove_sysfs;
 	}
 
 	pr_info("device mapped at %p, irq %d with %d ctx banks\n",
 		iommu->base, iommu->irq, iommu->ncb);
 
 	return ret;
+
+err_remove_sysfs:
+	iommu_device_sysfs_remove(&iommu->iommu);
+err_remove_list:
+	list_del(&iommu->dev_node);
+	return ret;
 }
 
 static const struct of_device_id msm_iommu_dt_match[] = {
-- 
2.43.0


