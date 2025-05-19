Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73386C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jvOqIgHJQ3Ll/RHVA8cD9ICeCOfstAGBwUx57/J6p7M=; b=jZKHpm9kUz56tXMS5HH6EKmS7T
	OENSz/6QJaBWabDMMtxlXpGYrNJEYwSEdhC68+M1k5QGBJdzIQ6FO7LLIQMIFEmeocu/+TOwWUc/w
	GraSHlSB6hhAi9/euHFEaCd9AXD/g+UbvpnXtaKwNcpj9NZmuWXQOe5Xm4cgEVe3i3aCA8iJsNYD9
	eMpMu9dHm05yIpbN5WnC1s/PnoRfQQdJkPxzFQWBhVnUTvFvLvFwYTcT4SwMSiWNeSCUQ4Yb3z/TN
	iBVYlu7VI1ZtxANITVtEvj0qijtYULLLXp7WHCGfzqzmfBjnCGVAehHuLSB8uBauLlHA6XKPb0zxR
	B7iHI/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3La-00000009o9T-37pL;
	Mon, 19 May 2025 16:28:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Lj-00000009bWI-39pS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:24:21 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABn1MMZTStokbplAQ--.53700S2;
	Mon, 19 May 2025 23:24:11 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: sgoutham@marvell.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] net: cavium: thunder: Add log for verification fail in bgx_poll_for_link()
Date: Mon, 19 May 2025 23:23:48 +0800
Message-ID: <20250519152348.2839-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABn1MMZTStokbplAQ--.53700S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4xZryrWw1kKr13ZFyfCrg_yoW8GFWxpa
	17tasI9F97Aw1Uu3Wvvws8CrZ8WaykKF93AFW5Cwn3uF17try5ZrWDG3yayFsFqrW8KFWY
	qF1jv3s7CF98Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU1TqcUUUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgHA2grSfIIhQAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_082420_152196_D77D9B9E 
X-CRM114-Status: GOOD (  10.90  )
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

The bgx_poll_for_link() calls bgx_poll_reg() but does not handle the
return value. The link setting is not verified if the polling operation
times out. It helps to debug if the link polling fails.

Add a time out error log for bgx_poll_reg().

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 608cc6af5af1..eadc58de35ac 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1007,8 +1007,9 @@ static void bgx_poll_for_link(struct work_struct *work)
 	/* Receive link is latching low. Force it high and verify it */
 	bgx_reg_modify(lmac->bgx, lmac->lmacid,
 		       BGX_SPUX_STATUS1, SPU_STATUS1_RCV_LNK);
-	bgx_poll_reg(lmac->bgx, lmac->lmacid, BGX_SPUX_STATUS1,
-		     SPU_STATUS1_RCV_LNK, false);
+	if (bgx_poll_reg(lmac->bgx, lmac->lmacid, BGX_SPUX_STATUS1,
+			 SPU_STATUS1_RCV_LNK, false))
+		dev_err(lmac->bgx->pdev->dev, "BXG verification fail with time out.\n");
 
 	spu_link = bgx_reg_read(lmac->bgx, lmac->lmacid, BGX_SPUX_STATUS1);
 	smu_link = bgx_reg_read(lmac->bgx, lmac->lmacid, BGX_SMUX_RX_CTL);
-- 
2.42.0.windows.2


