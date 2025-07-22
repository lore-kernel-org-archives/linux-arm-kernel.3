Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8791DC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H3aL3J5QKU6HBuDByY/UW+lE2nn5BioSsTT5BMQW2Gw=; b=BS5LRM3XCep5cMbKhtO0fRYzPY
	iSSCQmOwDFlxaAjYEth7IVTcsGdGnl7UUW3L2KyL0vMN3ItGsOn93FHqwhAOp5BrLK3KcSwOHtVRX
	Cg2IQ/mrxnVC83z4N1k/7alrwqOanL+4otwJZEAVdhTnc8rPluGj4AwlrCOpZdldH/vm7Bdq+PU+U
	nOQL3iNzHl74G6dq3D04Tz+WK2DpRUWMZIF73mLjciGUjTB3C4/nDduxwBLjv4w8sfdwSzUsvBWnN
	IqXMIVLb8UKn5goe0/V3brCK0E4+aeKBcKjAUybYoiGa+dT6uAUnevBip7fLPrlAFbD9cFj70Td+Y
	8vj/bWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Zh-000000023Qn-2Ppp;
	Tue, 22 Jul 2025 09:46:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Hq-000000020yZ-0fZF;
	Tue, 22 Jul 2025 09:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 867AD44712;
	Tue, 22 Jul 2025 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65517C4CEEB;
	Tue, 22 Jul 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753176469;
	bh=VTOBb6nBpFUj+KE94TVU4rw/yZM3+SNTYOwcbQSppQk=;
	h=From:To:Cc:Subject:Date:From;
	b=fZfm9RJRju+Gpg+NyeURunZ6YiGhcnGfuCO8h42Yt4aULE8qFDRd8xlxe2mIo+EWs
	 4to72BKo0RmUSeM53nqddAMDXTqIZTJQ9c9yEF5Wm/hHhrBqz+L743AbsT00c+Nut9
	 bwIsZCVwM2krBfhDKFP2QrbPqTp5DMMeaQLxXTsdltvtrcP9i83X45RRDl+09qc9f0
	 LceOfe6B+gfLLR7qyY4ZB7870VzlI/9TIMcp/6m7a64XEFscAOKCAVKQAoVkFIYAjA
	 /H9RxmjBREAZxIysVW5rv89rZXoSfsyg2ggakyCJTQgYbcGJvsWrekNoSl6+7yBkr9
	 XSBHkJtyBfnMQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1ue9He-0000000007G-3858;
	Tue, 22 Jul 2025 11:27:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	"Nancy.Lin" <nancy.lin@mediatek.com>
Subject: [PATCH] drm/mediatek: fix device leaks at bind
Date: Tue, 22 Jul 2025 11:27:22 +0200
Message-ID: <20250722092722.425-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_022750_215293_A0F50551 
X-CRM114-Status: UNSURE (   9.04  )
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

Make sure to drop the references to the sibling platform devices and
their child drm devices taken by of_find_device_by_node() and
device_find_child() when initialising the driver data during bind().

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Cc: stable@vger.kernel.org	# 6.4
Cc: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7c0c12dde488..33b83576af7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -395,10 +395,12 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
+		put_device(&pdev->dev);
 		if (!drm_dev)
 			continue;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
+		put_device(drm_dev);
 		if (!temp_drm_priv)
 			continue;
 
-- 
2.49.1


