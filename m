Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93102C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTPqg6M8Ko+eWA1x4uzY034xIoexgUFIOYMQiyIO0Kc=; b=n0XaU8/G0Su3UDYDpscuWIB/lg
	6oleDCBLfbDGsgcjbx/dSQhW4KV6v61iZEQblgshOP4i7KUZ57xesjYJL8TdUJHxE2FKfaTCH4nA8
	lF+ETx+0bTDhlqdLIdhO21qx9TUWGiaZXW4DcHA5ZTH1dKymVEdQ5IvmvXp508pMtUpM7wbEaKsOj
	afol1L/ih1p6ya7TFVZM7wwzxlqtLJP98o1FM3OCJr23dQx356aEKhZJPog9uTQvtL3zLQUkWPeUO
	qu734F22X9KJJ0Rm06m4m+G15Q98trY32qIkx6S0+kN/9y7zKEUPt9euzDFnoNrg/Yl/aZkbFHk08
	NloHMtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74i3-0000000Abcv-0BJH;
	Thu, 17 Sep 2026 05:30:59 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hx-0000000AbVR-3jMx;
	Thu, 17 Sep 2026 05:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FT
	Pqg6M8Ko+eWA1x4uzY034xIoexgUFIOYMQiyIO0Kc=; b=oJkj6VtL70kUeVhAOm
	QvilvnZErYcMQWnXdEHBjpgHlsk3BYXadAVxmUJCKHflqo4V5WE3xqPGVDhU0VbE
	uu5RYAfzmUSgzlAGMhs2R3C6DwwriGOuqUkFWsQi/gJeSoEUPYajWJd64uN66rW6
	mmzRw1cWg5pvWwgJa+XCuUnEk=
Received: from dfae2b116770.home.arpa (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHr5rqeqtqolkDPg--.25683S2;
	Thu, 17 Sep 2026 13:30:20 +0800 (CST)
From: Wentao Liang <wentao_liang_g@163.com>
To: heiko@sntech.de
Cc: iommu@lists.linux.dev,
	jeffy.chen@rock-chips.com,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robin.murphy@arm.com,
	will@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] iommu/rockchip: Fix platform device reference leak in rk_iommu_of_xlate()
Date: Thu, 17 Sep 2026 05:30:15 +0000
Message-Id: <20260917053015.2133503-1-wentao_liang_g@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDHr5rqeqtqolkDPg--.25683S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWkXrWrZF43JryDXFWfuFg_yoWktFb_W3
	W09rnrWr40yFs0kr1jq34I9rZ7K3ZI9r4xXayUK3Wftr98Wr1I9r1rXrs8Ja9rWw4j9F9r
	trykCr4fG347WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OBMtUUUUU==
X-CM-SenderInfo: xzhq3t5rboxtpqjbwqqrwthudrp/xtbC7A1fjmqreu0tPQAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223055_087195_92A7DC92 
X-CRM114-Status: GOOD (  10.05  )
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

From: Wentao Liang <vulab@iscas.ac.cn>

of_find_device_by_node() returns the platform device with an elevated
reference count, which is dropped on the success path only.  If the
devm_kzalloc() for the per-device data fails, the error return leaks
that reference.

Put the device reference on the error path too.

Fixes: 5fd577c3eac3 ("iommu/rockchip: Use OF_IOMMU to attach devices automatically")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/iommu/rockchip-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0013cf196c57..05a4fa227847 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1165,8 +1165,10 @@ static int rk_iommu_of_xlate(struct device *dev,
 	iommu_dev = of_find_device_by_node(args->np);
 
 	data = devm_kzalloc(&iommu_dev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	if (!data) {
+		platform_device_put(iommu_dev);
 		return -ENOMEM;
+	}
 
 	data->iommu = platform_get_drvdata(iommu_dev);
 	dev_iommu_priv_set(dev, data);
-- 
2.34.1


