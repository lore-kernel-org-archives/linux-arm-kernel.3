Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EB7FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Xywz8beiXKigdPY0dCWJdyNA0g5/M/vRfZ/rmu5OqQ=; b=TZ7zUtjRTxsoFlqj6WZbVQ9Kvy
	F8rpIWRFq12r2uTKmGYn1IWCjCZkkcFUgADUp3wSx+6eubdDCQ/fsrROhS7LRWABjiKCk34Bg/hP1
	dfoiSukl57vBhOWx8qrd/6ljdZHl+qNPBbqqETm+S3HKIjgEtOcSGezxnhFtgKoVaIPxaCOGdpjOM
	LwNvtuJoYBqfN4N8CtyaW8AV0JEBAnHvLpC3mOsFYqOSmDHH2t0C+LGy8uuVgIomQOR07BEhQE/A0
	yFyHMwIGgmhubjLwp4UBdO5RqDfpiYkqM8X3dX/d4Q1MvaRQFVYlaeeyqsnClN9qgNW/tts2iLDN6
	bxwCSO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWn-00000005lE1-2iHG;
	Thu, 30 Apr 2026 16:46:17 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUWk-00000005lDC-1pD4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5X
	ywz8beiXKigdPY0dCWJdyNA0g5/M/vRfZ/rmu5OqQ=; b=TSQ3z0/ZEnuWWFf/4c
	0XiCngqtAQjhzo/tqnl6h5Fzow9rZB016nU+D9QOe5+0U17a9KxktgeKkFD66N0Z
	KChJ5SVC1l2pNaFFNqqayyZDHtL5gy4OQbkOhECezS6yKNjjVEg6kY5vICxW7rpU
	Br095kZa5cQomfXvXoU3XBhPM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S3;
	Fri, 01 May 2026 00:45:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] iommu/arm-smmu-qcom: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:45:44 +0800
Message-Id: <20260430164545.49637-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
References: <20260430164545.49637-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHWJ46h_NpWWQZCg--.13259S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Kr1UAw15uF1UZF13Arb_yoWkJFXEy3
	W8A3Z7J3Wjy342vry0vrs3Zr90vaykurykWw4SgFyrAr15K395uws5ZF1kGw4xAF40kFyI
	g3sxWr1rZFy7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKiiSPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBtH6mnzhzsbHwAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094614_866522_9070CC3E 
X-CRM114-Status: UNSURE (   8.95  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 65e0ef6539fe..99469c4ebac2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -208,8 +208,7 @@ static phys_addr_t qcom_tbu_trigger_atos(struct arm_smmu_domain *smmu_domain,
 
 	/* Set address and stream-id */
 	val = readq_relaxed(tbu->base + DEBUG_SID_HALT_REG);
-	val &= ~DEBUG_SID_HALT_SID;
-	val |= FIELD_PREP(DEBUG_SID_HALT_SID, sid);
+	FIELD_MODIFY(DEBUG_SID_HALT_SID, &val, sid);
 	writeq_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
 	writeq_relaxed(iova, tbu->base + DEBUG_VA_ADDR_REG);
 	val = FIELD_PREP(DEBUG_AXUSER_CDMID, DEBUG_AXUSER_CDMID_VAL);
-- 
2.34.1


