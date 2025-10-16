Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E98CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35pKL8y6sVV6eicjFty67Z4D36n8YFsT4Z4mcrz0njI=; b=ZarCEG1Jvhz+cO+PO2kh9nlaul
	Na9BWziWwvJJ7uJkGiaPI8SUqaJ5nQsXLGTYq1r9z5iRuxgplyiz3l9RQ6/KzhgEXZlaC7ExYemgG
	k5vH1AgJf5IpqsqQ4SZDSiGOh5DRUNnGSHR2D1Iw79naKfgGafaTwrgV9IPI7j9LxvUqwABrlWIzu
	uv25nUEih8nRUiqasVlX7lH0BuQE4uB+zEec/SgIAqkQ/dJ29Zm9NUc4aanfR6ZLovMGhWlzyJ8f9
	9RqOjJuGoq6a5zHTCt90iKHkkMaqmd6jmkmAVcGBqwHULKe0e80Z8Jyx2Is1bHr0DeNkkLYZF1XFG
	hbE4hiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mln-00000004gjW-2BFo;
	Thu, 16 Oct 2025 12:07:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mlm-00000004ghe-1fi0;
	Thu, 16 Oct 2025 12:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=35pKL8y6sVV6eicjFty67Z4D36n8YFsT4Z4mcrz0njI=; b=L6CjNunFrIRh6oVMotzuiYadC8
	Lp5NgZCsY0Ln+U2jUnYONIT8ANjj7TNX3MIzN9QsW8JR6qwsMT/6X1CobKoWb8z2qLioEYIEcyFS7
	cdOI+bf/EWETk3lDMILa3MaEVnFxRotXfkOAWTtX0mF82YabZmjZPKVu4UWryHXjYBvcNX7lDcopm
	UXxENJjR4Muocj8dWY1s0C/ZlQboQOgi82r23LKMT4u9mO/TEKtcie2jNkUg7IZyk22vQZ9fEojGM
	aL1ux/ESJ6O2nWvTAm34fFKkz5wjcJH9tdlGLgyBOkRHa2y+H2lYh/CS6OAcW2NjI+b3GXpFzDnyo
	WlSSRE1Q==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mlh-00000006j34-1BAJ;
	Thu, 16 Oct 2025 12:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760616440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iUgaJdml3R9oANBzA+nWzo0Njzk85MU/k7Yu833VG0rAb3WXe7z+kta3nJTwjiqVH8UfDXV/BoDCm804IkO4cJBf6xRjcHLWkzrDfiQZgTITDhokLfFtusgIBuo16atz3zUdqkZlYZZL96O1eR4vPb8M34RMy5Tp4NUADjE6kBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760616440; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=35pKL8y6sVV6eicjFty67Z4D36n8YFsT4Z4mcrz0njI=; 
	b=XosJG5c0/zZ04Fao6kWeDfh/gkJ8xOPIDeJ4BMW9GxWlLrhTHsNwHLuBq6gtDThH86IT7P5zS2EblPKO8mZ/TcqcA2IzY25bzZJadTiR0JuAxGDdbMDSDlBEVkgFwL+X+OrMjFlelmmdoAEZ4R+JTPcgyjLupHTdmYr443e3lQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760616440;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=35pKL8y6sVV6eicjFty67Z4D36n8YFsT4Z4mcrz0njI=;
	b=MU4o4Ccwt9OfwsIM/399L3fWzpz7rngO6Kw1PO/8qCyKf/NT/en7w4YDxG5k8BCT
	YKjpCuauisMR5fNVWEMEFgZtTWDba8uoKBSJzMbmm07abkwBuvtNhyD3/nKZhoGgX3Q
	HkDRj/fuFipcNSZgK0xg1PtN0/6jO0NWyuZwYae0=
Received: by mx.zohomail.com with SMTPS id 1760616437872627.3422914489329;
	Thu, 16 Oct 2025 05:07:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 16 Oct 2025 14:06:46 +0200
Subject: [PATCH v2 4/5] phy: mediatek: ufs: Add support for resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-mt8196-ufs-v2-4-c373834c4e7a@collabora.com>
References: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
In-Reply-To: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_130742_012425_080CFDA0 
X-CRM114-Status: GOOD (  19.45  )
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

The MediaTek UFS PHY supports PHY resets. Until now, they've been
implemented in the UFS host driver. Since they were never documented in
the UFS HCI node's DT bindings, and no mainline DT uses it, it's fine if
it's moved to the correct location, which is the PHY driver.

Implement the MPHY reset logic in this driver and expose it through the
phy subsystem's reset op. The reset itself is optional, as judging by
other mainline devices that use this hardware, it's not required for the
device to function.

If no reset is present, the reset op returns -EOPNOTSUPP, which means
that the ufshci driver can detect it's present and not double sleep in
its own reset function, where it will call the phy reset.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-ufs.c | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 0cb5a25b1b7a..d77ba689ebc8 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -4,6 +4,7 @@
  * Author: Stanley Chu <stanley.chu@mediatek.com>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -11,6 +12,8 @@
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "phy-mtk-io.h"
 
@@ -36,9 +39,17 @@
 
 #define UFSPHY_CLKS_CNT    2
 
+#define UFS_MTK_SIP_MPHY_CTRL       BIT(8)
+
+enum ufs_mtk_mphy_op {
+	UFS_MPHY_BACKUP = 0,
+	UFS_MPHY_RESTORE
+};
+
 struct ufs_mtk_phy {
 	struct device *dev;
 	void __iomem *mmio;
+	struct reset_control *reset;
 	struct clk_bulk_data clks[UFSPHY_CLKS_CNT];
 };
 
@@ -141,9 +152,59 @@ static int ufs_mtk_phy_power_off(struct phy *generic_phy)
 	return 0;
 }
 
+static int ufs_mtk_phy_ctrl(struct ufs_mtk_phy *phy, enum ufs_mtk_mphy_op op)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, UFS_MTK_SIP_MPHY_CTRL, op,
+		      0, 0, 0, 0, 0, &res);
+
+	switch (res.a0) {
+	case SMCCC_RET_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_INVALID_PARAMETER:
+		return -EINVAL;
+	default:
+		return 0;
+	}
+}
+
+static int ufs_mtk_phy_reset(struct phy *generic_phy)
+{
+	struct ufs_mtk_phy *phy = get_ufs_mtk_phy(generic_phy);
+	int ret;
+
+	if (!phy->reset)
+		return -EOPNOTSUPP;
+
+	ret = reset_control_assert(phy->reset);
+	if (ret)
+		return ret;
+
+	usleep_range(100, 110);
+
+	ret = reset_control_deassert(phy->reset);
+	if (ret)
+		return ret;
+
+	/*
+	 * To avoid double-sleep and other unintended side-effects in the ufshci
+	 * driver, don't return the phy_ctrl retval here, but just return -EPROTO.
+	 */
+	ret = ufs_mtk_phy_ctrl(phy, UFS_MPHY_RESTORE);
+	if (ret) {
+		dev_err(phy->dev, "UFS_MPHY_RESTORE SMC command failed: %pe\n",
+			ERR_PTR(ret));
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
 static const struct phy_ops ufs_mtk_phy_ops = {
 	.power_on       = ufs_mtk_phy_power_on,
 	.power_off      = ufs_mtk_phy_power_off,
+	.reset          = ufs_mtk_phy_reset,
 	.owner          = THIS_MODULE,
 };
 
@@ -163,8 +224,18 @@ static int ufs_mtk_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->mmio))
 		return PTR_ERR(phy->mmio);
 
+	phy->reset = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(phy->reset))
+		return dev_err_probe(dev, PTR_ERR(phy->reset), "Failed to get reset\n");
+
 	phy->dev = dev;
 
+	if (phy->reset) {
+		ret = ufs_mtk_phy_ctrl(phy, UFS_MPHY_BACKUP);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to back up MPHY\n");
+	}
+
 	ret = ufs_mtk_phy_clk_init(phy);
 	if (ret)
 		return ret;

-- 
2.51.0


