Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A8AC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/tq6LrrxRI4HjyCL7aW8miot1l+ge0sIlibb8wrupQ=; b=DE7yRGDeOxrFRIG/m12zZDS3a+
	4NzaD4T9Lb7bmVI8+3mgjk7DNxF8suyRFWKPGL2qofItORETsDYcH/VqWblZZOfb/m5Z5p0869vFM
	zk2fpSJitkLX6pHRrpqmvmL6XiidIjBt0Rv4T5T4eTWKC/JKIP6rr33u1n9CCcscWRzL0nrAPQl2v
	yxmuwfsjlf9paxLryCePdg3+U2zf2jyyO+mNiZcQxNGwr7CZ8zojbOAARWktAf8iffRWR35cpNQUG
	8DM+dzs9OR83+xJzCTExMEguLKe8bb0Lk+cdi/PH++ajMDAbY6BFMg57nwzWqSit4Qna5h8hRX8ML
	k9kphsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6kC-000000016Cr-0ouL;
	Mon, 03 Mar 2025 14:26:08 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6Su-000000011sy-263R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:08:17 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 49CE440CE18C;
	Mon,  3 Mar 2025 14:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 49CE440CE18C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741010894;
	bh=e/tq6LrrxRI4HjyCL7aW8miot1l+ge0sIlibb8wrupQ=;
	h=From:To:Cc:Subject:Date:From;
	b=r1TdMit6+TLG+eMiHJdSUCRE9P5rh75vEJEB8mlvrOQ0laRWMK21/JLXn89Z1TrLJ
	 6hAA3RMAccZG5qqIODMYZLerMuQGIrPPe3l29Nohtu0XG4IwCZeg35PSQkWjyCVOhR
	 2glkB4lmMg/jG1Vf3lpPws5T5U6vn4Wv4KG/PViU=
From: Vitalii Mordan <mordan@ispras.ru>
To: Michal Simek <michal.simek@amd.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Harini Katakam <harinik@xilinx.com>,
	Wolfram Sang <wsa@kernel.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH] i2c: cadence: fix call balance of id->clk handling routines
Date: Mon,  3 Mar 2025 17:08:05 +0300
Message-Id: <20250303140805.644143-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060816_720324_59198256 
X-CRM114-Status: GOOD (  13.44  )
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

If the clock id->clk was not enabled in cdns_i2c_probe(), it should not be
disabled in any execution path. If the clock was not enabled, the probe
function should return an error code.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for id->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/i2c/busses/i2c-cadence.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b64026fbca66..07564a962dcb 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1541,7 +1541,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
 
-	id->clk = devm_clk_get(&pdev->dev, NULL);
+	id->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(id->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
 				     "input clock not found.\n");
@@ -1551,10 +1551,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
 				     "Failed to request reset.\n");
 
-	ret = clk_prepare_enable(id->clk);
-	if (ret)
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-
 	ret = reset_control_deassert(id->reset);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,
@@ -1617,7 +1613,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
 err_clk_dis:
-	clk_disable_unprepare(id->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	return ret;
@@ -1642,7 +1637,6 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-	clk_disable_unprepare(id->clk);
 }
 
 static struct platform_driver cdns_i2c_drv = {
-- 
2.25.1


