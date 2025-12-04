Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FAD1F9B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fJcygxJ8ktEMFPvVfhD1h7orWfXdouaakmxwB4pUxs=; b=g/GIvz57hdJjOyphW22ZDsgrkH
	1LmH7dLaFDfVo6EI9kE8++s/QzLYwo/6ptanWnaDHANipZcMswS7vPIXv/cVPpvWCxLKjr2uoF9rc
	fbZhAC62kMlD7HGsj8vXpBqBlVi/KK9ABbw9ssPrJKQF2sX8twKB9vi6D8XyehtVfmBEnB37sv+YO
	9TVTtBdkoOScpWnTXZ/o/Lr/zWlRSkv+1sDvcmtJTcPj9Dch5McY3XJiOBbxJzsX645F7BZ8BJzSH
	Ku1AotKyM3hNia8DwEBq7a4MydvNYyKGcGYrLs2MwH3HGEBar8BFH5iqD28/IDPTejLhfWzXzfHZ/
	gFNB0kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR79C-00000007tTU-17HR;
	Thu, 04 Dec 2025 11:05:18 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR798-00000007tRU-0Yjk;
	Thu, 04 Dec 2025 11:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1f
	JcygxJ8ktEMFPvVfhD1h7orWfXdouaakmxwB4pUxs=; b=OA0zEY7/4TPdJ25Cut
	alV6aIG2a/7/USN59kLCRmdrNByPTLnLhF6VG18YOXU1pQTY/wMCdh4QhLgo6h3F
	VQWYF1UWixF6LJmkMQI2v+Db0/TSZRDiLiKjnwXX54n6xxnqdajmGoGJm8oeZXLi
	AIrzjpJ1/iJXJc2/FX8DnMYrs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wB36w7WajFpT_14EQ--.41851S4;
	Thu, 04 Dec 2025 19:04:55 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	roger.lu@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: SVS: Fix a reference leak bug in svs_add_device_link()
Date: Thu,  4 Dec 2025 19:04:52 +0800
Message-Id: <20251204110452.93867-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB36w7WajFpT_14EQ--.41851S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW3GryUuFW8Wr43ur4DJwb_yoWkCrX_Gr
	9FvFy7Xrn8Jr1fKF4xtF13AryS9Fs7t3ykGFy5t3WSqrW5WFyjqF90vrZ0qFZru3y8CFyU
	XF1UWF4xKF4rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM4E_DUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxhd25GkxatfZEgAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_030514_566225_0EBB8762 
X-CRM114-Status: GOOD (  10.66  )
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

svs_get_subsys_device() increases the reference count of the returned
device, if error happens, put_device() is required to drop the device
reference.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/soc/mediatek/mtk-svs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index f45537546553..c8f15bb139c6 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2155,12 +2155,15 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 	sup_link = device_link_add(svsp->dev, dev,
 				   DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!sup_link) {
+		put_device(dev);
 		dev_err(svsp->dev, "sup_link is NULL\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND) {
+		put_device(dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	return dev;
 }
-- 
2.25.1


