Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A7BD609A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFrFoKsKHi5MKf5l5656b7lBtyZwulDZhSgVO40faJg=; b=O0amYWL4BKKtKzIP1v4k+Q0kp1
	FbjdBORsEuDR8H6iAkVTdT/coiuCHBNIH0kcSicwvp2KwT7QK+NPjmloyqRyw8BZ0Qy/UschTLe2W
	zkLrtNdnaQLoiav9e6LM8YsKVBM8UyhzDclscJKicnwai4VlaxXPN6KzPHCJwuWnirItZL5Dlvyht
	nlefxm9iI++1Tcm6VJpAR+I5LNoYmWyObZvieOqVSLKQ+jUuRMEcG5YbWvjrTLZvQqYSzHs3YW6IQ
	73COy14S9w4jRGu2o8JbE/DzaTqc4TY2yP6bu3J7Km5sKedxp3w0QYCkiakF949q1G1YLMgEWJnAL
	0XkHtvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWeh-00000005Pfw-1R8t;
	Tue, 16 Dec 2025 15:08:04 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWee-00000005PeM-2MOl;
	Tue, 16 Dec 2025 15:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=LFrFoKsKHi5MKf5
	l5656b7lBtyZwulDZhSgVO40faJg=; b=FQiBv0oU4iOMxeVwCtJMGf2KyQSORP2
	gHvglybFUQQoljHVroWHfpdTXJ3JvlhKMzwFvobSwi4xzFRiMrZ3AsRTLbyCpeu4
	zvdj9OV98YqVPqrjZNZwizTrK8KJU73ihYkavw2Stxadnzc88H2fxyiwiht0fs+5
	aJ49EBKvt00k=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3X_ukdUFptVRoHQ--.1199S2;
	Tue, 16 Dec 2025 23:07:31 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: heiko@sntech.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH 2/2] [PATCH net-next v2 2/2] net: stmmac: dwmac-rk:return actual error from phy_power_on
Date: Tue, 16 Dec 2025 07:07:15 -0800
Message-Id: <20251216150715.3672-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: PCgvCgD3X_ukdUFptVRoHQ--.1199S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47Ww4UKr43Zw1UCw48WFg_yoWfCFX_W3
	WjvFnaqa1UtFW0yrn8Aa13ZryS9Fs8WrZ3ArsFga93Cay7uw1DA34DurZxAr4DWw40vF9r
	Gr13tF4Iyw1xJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMOzVUUUUUU==
X-Originating-IP: [223.65.97.179]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbC3RQ14GlBdbRwhAAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_070800_965762_BA182FBB 
X-CRM114-Status: UNSURE (   9.98  )
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

The function phy_power_on currently always returns 0, even when
regulator operations fail. This patch modifies it to return the
actual error code from regulator_enable/disable operations

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 2f5a65c235aa..fa989cb96714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1514,7 +1514,7 @@ static int rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
 			dev_err(dev, "fail to disable phy-supply\n");
 	}
 
-	return 0;
+	return ret;
 }
 
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
-- 
2.17.1


