Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/08m4WiVs71pwfy4afzILVd589TmeFYKjVShkpd/6Xk=; b=CRxLDpuRALN7e4JcxZUFwgxoD1
	1zMbRJMtmSu9k5Pkoy0kGgrTnzO28PrJYtZFHFNwgwVIh8nTtO+wuL1NRgGSTmdoYsR9ZL+muQPza
	e0hboIrFkfkqt2i9GhOtwO1SZO2BYxCuuporw4llKEbD69W7uhL/9w1aDNWOle5gr8fLew6eQI0bj
	keHOx9KgmTAwlak74pX3aZ42pEBgwscqp9ACr9KMr+J+5T8ULiNu1iylYGjzqMsFZADho/n1O1Col
	0ezCRW2Nn9hFrtdmhpqwm2ilVWygIgX8hZPSWvIxn917dAVJgJW0ZDM5jmSwQ6OJsSN/lsuiitOVf
	Me8UWKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaab-00000009E0D-3HQP;
	Mon, 26 May 2025 16:22:13 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaW7-00000009DOr-3cQf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 16:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=/08m4WiVs71pwfy4afzILVd589TmeFYKjVShkpd/6Xk=;
	b=cOo+iE3dQ+XGIYC67LTJgRXrsxVcskrIamUspAxWNOfw8IHx5/c/BsJdxWpP0b
	hFyZpPd4mGHUNdODYM2R7dnnA+06xICpaWTakAoVHN5KaXSKJFTROQ7AKmYU9Qbk
	Hl+uhPbipikJOoBURZqbbS4fCK0F9+F8oUyWvbCVXLpUU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3v1DYkzRowdzVEA--.46087S2;
	Tue, 27 May 2025 00:16:36 +0800 (CST)
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
	jan.petrous@oss.nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E6=9D=8E=E5=93=B2?= <sensor1010@163.com>
Subject: [PATCH] net: dwmac-rk: No need to check the return value of the phy_power_on()
Date: Mon, 26 May 2025 09:16:21 -0700
Message-Id: <20250526161621.3549-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v1DYkzRowdzVEA--.46087S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw13Wr1rCFWfAryUKF43GFg_yoWfXwcEga
	17ZFsaqa15GF4jyF98Cw45ZrWSvF4DWrs3ZFsxKayfCF47Xwn8XryDursxArnrur45AF9r
	Gr1fJFyxZ34xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtCJPDUUUUU==
X-Originating-IP: [112.20.94.209]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMR5Xq2gyA7BOhAADsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_091736_293699_5E105342 
X-CRM114-Status: UNSURE (   9.93  )
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

since the return value of the phy_power_on() function is always 0,
checking its return value is redundant.

Signed-off-by: 李哲 <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..6e8b10fda24d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1839,11 +1839,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = phy_power_on(bsp_priv, true);
-	if (ret) {
-		gmac_clk_enable(bsp_priv, false);
-		return ret;
-	}
+	phy_power_on(bsp_priv, true);
 
 	pm_runtime_get_sync(dev);
 
-- 
2.17.1


