Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D40CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CnSgnNA0hMubCrJhiT7jVUAm7Vyf++O7TFQWPZMuzJA=; b=V8rNxIt2lw9/mduYkzakYu/JmR
	08bdtisTHy3UEGEHiC+oA5wl1a65fFOHnbGbw0fGNkQIJdK7PUolj/tQDsZXnNiC79PX7DjxpnPTn
	YlEwrOcRgPOf8q6jm8DmMbYXzmnAPuERWOwTFFAq2Ibs8oGFjJ87SuTUioRDkmnwPSBxxm6DGvPAz
	06sj/Ml9/yKa/GZgQ5NnxlGqOvD+piqquuaw4mRKQUYHm7EuBnmG39raU0YPe+A0rNx3lX7suaC7+
	16+V7Zvw5e/bgqTYDhp9BWgYI3hH6ekQYwQxHsbXxEVjfm4aHPu5lM+7AcSydZ16WV1CP9Qy2qgQW
	4uqJ47qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUqG-0000000BhWo-2mMW;
	Fri, 22 May 2026 18:43:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUqD-0000000BhWA-3SsF;
	Fri, 22 May 2026 18:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=CnSgnNA0hMubCrJhiT7jVUAm7Vyf++O7TFQWPZMuzJA=; b=p2ekR4DKpYWIAobDNwopGJBeGQ
	D/Kh6/wKWBwyxMcJwp1ZgBj4gK5AIFZfN1aulnX1Z8w4hSD9YCkFwpEVs2JeuKrROdJP6ek94el1f
	W9oUzwsUSXvp4ZNHvNeA7Q5dpIATU0aHOkGOc71MWOCsjkxYBMFWHJCQvquGo6kOY6LwA/82JUv3g
	Pv1hWCQ6L1V5vjkEEvQTvJOXfiMnxv93r2GUcqf4lNHPuZrSp8y0g15ov4tC5vUPUAh+xFMZXbMNF
	AepjagtA8rzxG0r1GfX9MpccglvI2Fk4i1UlMJK3YLbXpd+YRX2d6fJTwVccj/EsYz00+hkFC8QPL
	f3c9QZrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: ulfh@kernel.org,
	shawn.lin@rock-chips.com,
	jh80.chung@samsung.com
Cc: heiko@sntech.de,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mmc: dw_mmc-rockchip: Add missing private data for very old controllers
Date: Fri, 22 May 2026 20:43:07 +0200
Message-ID: <20260522184307.2979579-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_114325_864108_9BFA87F1 
X-CRM114-Status: GOOD (  12.74  )
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

The really old controllers (rk2928, rk3066, rk3188) do not support UHS
speeds at all, and thus never handled phase data.

For that reason it never had a parse_dt callback and no driver private
data at all.

Commit ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating
support") makes the private data sort of mandatory, because the init
function checks whether phases are configured internally or through the
clock controller.

This results in the old SoCs then experiencing NULL-pointer dereferences
when they try to access that private-data struct.

While we could have if (priv) conditionals in all places, it's way less
cluttery to just give the old types their private-data struct.

Fixes: ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating support")
Cc: stable@vger.kernel.org
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/mmc/host/dw_mmc-rockchip.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index c6eece4ec3fd..75c82ff20f17 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -441,6 +441,22 @@ static int dw_mci_common_parse_dt(struct dw_mci *host)
 	return 0;
 }
 
+static int dw_mci_rk2928_parse_dt(struct dw_mci *host)
+{
+	struct dw_mci_rockchip_priv_data *priv;
+	int err;
+
+	err = dw_mci_common_parse_dt(host);
+	if (err)
+		return err;
+
+	priv = host->priv;
+
+	priv->internal_phase = false;
+
+	return 0;
+}
+
 static int dw_mci_rk3288_parse_dt(struct dw_mci *host)
 {
 	struct dw_mci_rockchip_priv_data *priv;
@@ -514,6 +530,7 @@ static int dw_mci_rockchip_init(struct dw_mci *host)
 
 static const struct dw_mci_drv_data rk2928_drv_data = {
 	.init			= dw_mci_rockchip_init,
+	.parse_dt		= dw_mci_rk2928_parse_dt,
 };
 
 static const struct dw_mci_drv_data rk3288_drv_data = {
-- 
2.47.3


