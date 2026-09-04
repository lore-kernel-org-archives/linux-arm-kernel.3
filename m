Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AA8C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MO4pXFcedS4dIGPS5osjZgGZ/rrJKJyCM5L1ro6VuTQ=; b=ebByVVZ6NciVNP2dfK3lzvqMMb
	uvFOhLHjalsf3Pb8oVFOSte1lcUCUVtrXPTLuBBcGmPrQX8KawalDKL6ZME0XSakFOWzHQLaKmeM6
	qz6BpEK92pg12Q0A+JJfPVoXz9PHD/11fTDncwfFdU5S4Fx6gglS75q/aj7B+JnUvIgvvOkjRo5dC
	J8/LaLRlVqf9XP562MvyonVkp+LPSJ4P2U8DST/CtEF9sFwQIKTppc8FmoaGLKHtOdnqaKUWYTT2q
	aTSEyHrWO+Zff9h4WO2kuo5x/kahpb1blaRxPkU6VaUFEb0I4MSdCoqoUxwtYYESSVLxmJfYDpxg4
	s44k42zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OyY-00000001KzC-1Xn4;
	Fri, 04 Sep 2026 08:08:42 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OyV-00000001KyA-1mFp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MO
	4pXFcedS4dIGPS5osjZgGZ/rrJKJyCM5L1ro6VuTQ=; b=NMKb0u7uyy3F22NI3E
	aiY6QZGK/jVPlW/3ITEC3qYdLhsgfyTtX31/7Z7KNBsyPJrM4taXLSRN0JDKvnGX
	r3GGj6WwnUGf0rufp8D3fY6JhBYUTFq8oUHiX1XXw5Vz0hhRAK13kR8jXDyKhS7o
	9WXMNQZou0RTrvdcjAOMRMhgY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wB37GlgfJpqs61iAg--.12312S2;
	Fri, 04 Sep 2026 16:08:01 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] net: sun4i-emac: fix missing of_node_put() for phy_node
Date: Fri,  4 Sep 2026 16:07:58 +0800
Message-Id: <20260904080758.2432748-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB37GlgfJpqs61iAg--.12312S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1Dury3uw4fXFyUKF4rZrb_yoWkJrc_Cr
	48ur93GFWkCrnYyw4Y9r45Zr4UAFyqgFZIqF1v9FWay34qvr43XrnY9rn3Kr9rXrW8KFn8
	GwnF9Fy3Aw1F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbVHq3UUUUU==
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+QJ4J2qafGKJQQAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_010839_767676_3F66DB5B 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Li Youhong <liyouhong@kylinos.cn>

of_parse_phandle() returns a node pointer with an elevated refcount.
Add the missing of_node_put() on the probe error path after
register_netdev() fails and in emac_remove().

Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -1067,6 +1067,7 @@ static int emac_probe(struct platform_device *pdev)
 	return 0;
 
 out_release_sram:
+	of_node_put(db->phy_node);
 	sunxi_sram_release(&pdev->dev);
 out_clk_disable_unprepare:
 	clk_disable_unprepare(db->clk);
@@ -1094,6 +1095,7 @@ static void emac_remove(struct platform_device *pdev)
 	}
 
 	unregister_netdev(ndev);
+	of_node_put(db->phy_node);
 	sunxi_sram_release(&pdev->dev);
 	clk_disable_unprepare(db->clk);
 	irq_dispose_mapping(ndev->irq);
-- 
2.25.1


