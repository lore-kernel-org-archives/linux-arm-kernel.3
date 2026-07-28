Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF9DC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuAXay5q35E10UL5YkQXMGluyZMpXm84zmks4oWbdUg=; b=zIA4e5I3Gly96nTYZhIkVHWMOj
	zO4bGxBAFbQXeAQ6FRpuZC13PEWXyZhAuw09PuEIgXLVS8jDBezD6p0FOULd7Hies+NOHDiHRMbB1
	+uQLwPknCdGJNWPcXDoQWVhrcwEVShMNKSV0N90sr2WKD9g8LcSjTayssFf5N7j9puSHR/sD7l++U
	562s5By+iTBuDqjGCQGF7CqCKhr/QrxYWXr9uIS8/yV1Y20gu0dni0fYB/GWTu47212PkMVSApyrb
	ZylJtrLxhI/jTa7bD+CLgtB23Bha/NdqNHTsSE8Ecy4MDJRtXGtkqp4YC+B7PVbIUxkrGDMV8NV3D
	vX78tcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodve-00000004mSk-0fqX;
	Tue, 28 Jul 2026 09:16:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodvT-00000004mOr-27xK;
	Tue, 28 Jul 2026 09:16:42 +0000
X-UUID: 04c05b348a6511f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6a9f690e-e496-4a73-b272-695dbc2bbecf,IP:0,U
	RL:0,TC:0,Content:100,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:125
X-CID-META: VersionHash:e7bac3a,CLOUDID:d6b7cd34311be6d9ab0bb9b23191ac42,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|136|850|865|898,TC:nil,Content:3|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 04c05b348a6511f1aa26b74ffac11d73-20260728
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 511392512; Tue, 28 Jul 2026 17:16:30 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Caesar Wang <wxt@rock-chips.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 1/2] mailbox: rockchip: disable pclk on probe failure and unbind
Date: Tue, 28 Jul 2026 17:16:22 +0800
Message-Id: <20260728091623.3691198-2-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260728091623.3691198-1-lilinmao@kylinos.cn>
References: <20260728091623.3691198-1-lilinmao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021639_868938_79E14B45 
X-CRM114-Status: GOOD (  12.56  )
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

rockchip_mbox_probe() enables the peripheral clock and then keeps going.
None of the later failure paths - platform_get_irq(),
devm_request_threaded_irq() and devm_mbox_controller_register() - disables
it again. The driver has no remove callback either, so the clock also stays
prepared and enabled once the device is unbound, and its enable count keeps
growing over bind/unbind cycles.

Use devm_clk_get_enabled() to tie disabling and unpreparing the clock to
the device lifetime. It is registered before the interrupts and the mailbox
controller, so devres releases it after both are gone.

While rewriting the error path, switch it to dev_err_probe() so that a
deferred probe is not reported as an error.

Fixes: f70ed3b5dc8b ("mailbox: rockchip: Add Rockchip mailbox driver")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/mailbox/rockchip-mailbox.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index a1a7dee64356..d55cbf7f2cb6 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -196,19 +196,10 @@ static int rockchip_mbox_probe(struct platform_device *pdev)
 	/* Each channel has two buffers for A2B and B2A */
 	mb->buf_size = (size_t)resource_size(res) / (drv_data->num_chans * 2);
 
-	mb->pclk = devm_clk_get(&pdev->dev, "pclk_mailbox");
-	if (IS_ERR(mb->pclk)) {
-		ret = PTR_ERR(mb->pclk);
-		dev_err(&pdev->dev, "failed to get pclk_mailbox clock: %d\n",
-			ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(mb->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable pclk: %d\n", ret);
-		return ret;
-	}
+	mb->pclk = devm_clk_get_enabled(&pdev->dev, "pclk_mailbox");
+	if (IS_ERR(mb->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(mb->pclk),
+				     "failed to get and enable pclk_mailbox clock\n");
 
 	for (i = 0; i < mb->mbox.num_chans; i++) {
 		irq = platform_get_irq(pdev, i);
-- 
2.25.1


