Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC92CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xAUvOUV3gFHnesCfh2XcNr/cWherRMTVqtwTY/kK+k0=; b=3u3SMFFBrQu+8qGGWs8za/eth2
	w3GYYPwLhJX5W2wXOPbsDDFgg1H2j4IkUxR8hqbKs53oWjPmWpn6tYNCKiXN7B8IrL8FnFOh8xTc8
	Sdhvl47b/nTtdfAKsIoe/Q0sJLh+KGEhvf+93WJPER5SKEoyD4ldmUNP+0+rzWZC9EIINh4B7lV1Z
	QjP8OZMh+r+zC1hAfIuWC+4LugTOETno0ZUDSBH7qHlg1qbICqzTKi3YmymzLUg5ifhvfNUfYBG4u
	KMLtHCnRrwmwAVKcIPSJpqikgU4jTzt8rQtyqa0K+yM+AezILMJUFx/ZbXzzM4uIKN4NoAVYHtYUI
	RrjdWWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Q3y-00000003X4z-27dS;
	Wed, 08 Oct 2025 09:02:22 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Q3w-00000003X49-0VkC;
	Wed, 08 Oct 2025 09:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=xA
	UvOUV3gFHnesCfh2XcNr/cWherRMTVqtwTY/kK+k0=; b=C8+wn5Y0YY+GdfcPMh
	YfUzG8+cedQbz8nRkNLrv7avUJChkPFhhX59OJzm2dKyWjpOXTue4PLLKxyAOCRB
	J79JYBuIMTuwOya/+qeXZLSwXmcent9n7vnBQT9lAFCJV/eBh8Vmi5X2r0wsi95b
	uISMKKHtBrhcoblUHoynfcMo4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDXz2+GKOZozDEcCw--.44898S4;
	Wed, 08 Oct 2025 17:01:59 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: minghsiu.tsai@mediatek.com,
	houlong.wei@mediatek.com,
	andrew-ct.chen@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hans.verkuil@cisco.com,
	christophe.jaillet@wanadoo.fr,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
Date: Wed,  8 Oct 2025 17:01:56 +0800
Message-Id: <20251008090156.14224-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXz2+GKOZozDEcCw--.44898S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4kXF1fuF4rtFy5Gw4fuFg_yoWDurX_Jw
	1v9FZ3Xr1fCFnYkr18trna9ry7tFZ3Kr4FyF1fKrsxX3yruF1jgrnFvFZ8Wr4DXanFvFyU
	JFWDWFWxurZxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGtCcUUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/1tbiOxDgbmjmIYqTMwAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_020220_476264_43587993 
X-CRM114-Status: UNSURE (   7.76  )
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

In mtk_mdp_probe(), vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put()
to prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0..eb212ca1a083 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -242,6 +242,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.25.1


