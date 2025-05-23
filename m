Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98737C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3aX8PUAXDaemiEQ3IrgJbnTZwuocxLWzcQByTZDngOU=; b=VTtSbL2uu0COGP3Z0KcGyPGs/j
	hhhcX/Rj2f2NgBP/UY57kUI5FdiKUDGFwB/upYg1kCEgtOnx/kKDAmGads3KXmtLUEsbhazVaJcVn
	sFewjIuTP/L8JO7KMo9oe/JC0u0MQ2cFFuyK1zRXn6BGmmDnUcbi4bW5OOrDRNW+PZXnFrWSYVFPK
	q3sTmAzoFwKZuRMjMeWg+Ij7ehZcCNpqhy6VxbTDSSP6Mt+2phdYHvSJac6j5bsNXSz7pH2XFyHcM
	51xgGyasU8V8Avn13ZBW/7Ff0aTQoscSIKYXlo1Cazcx0gRdzb+mNmZA61IVs1vL6xrDw/60Oxxax
	/gcg7OZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIURk-00000004Gi8-15B8;
	Fri, 23 May 2025 15:36:32 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU94-00000004E1v-35Cq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=3aX8PUAXDaemiEQ3IrgJbnTZwuocxLWzcQByTZDngOU=;
	b=bBwVXnXV47gzp2czYWTvmcMKEgZrPMUK9feAAVxOgG4AOljD7u1FtJ/gbID3wl
	5TC1szaWCRf19jfCuTR/VW5SEF5Epmr+km/g05ps82PrudkZ4Yvhzmc8Mt1TrWCD
	6Jebflm7/aV9n/B/b9GcMaoiXetu2Kn3b8KGIMA2T9/L4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXbyELkTBoFV96Bg--.59745S2;
	Fri, 23 May 2025 23:15:35 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk,
	david.wu@rock-chips.com,
	wens@csie.org,
	u.kleine-koenig@baylibre.com,
	an.petrous@oss.nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
Subject: [PATCH] net: dwmac-rk: MAC clock should be truned off
Date: Fri, 23 May 2025 08:15:21 -0700
Message-Id: <20250523151521.3503-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCXbyELkTBoFV96Bg--.59745S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1kXry3Kw4Dtr4DKr4Uurg_yoWkWFbE9w
	1Ivrn3XF45XF40kF1DGw13Zr9agFs8ZFs5Ar42gFWSvFW7Zwn8Zr4kWrsrArn5Ww48AF9r
	Gr1xAF1Iyw1xtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-Originating-IP: [112.20.94.209]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMR9Wq2gwKoMmeAABs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081715_289168_9A4EB8FD 
X-CRM114-Status: GOOD (  11.85  )
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

if PHY power-on fails, clockassociated the MAC should
be disabled during the MAC initialization process

Signed-off-by: 李哲 <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..036e45be5828 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1648,7 +1648,7 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
-	int ret;
+	int ret = 0;
 	struct device *dev = &bsp_priv->pdev->dev;
 
 	if (enable) {
@@ -1661,7 +1661,7 @@ static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 			dev_err(dev, "fail to disable phy-supply\n");
 	}
 
-	return 0;
+	return ret;
 }
 
 static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
-- 
2.17.1


