Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89601D6C2BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4roe1uOrMlMXfDLEUiS1htJOky9bJXMb1BjJs0uBvqY=; b=YBiB7fkJnRd4Fwe57a01gEo+Nf
	YOP/v7ixyFsGda+M46TqXJ6sdOx1TDP5DcJMeznLh7lecsPBSC/0iRD9j1qM2K3HZxzxT7Jxrf6dd
	BsM2I7gi1X7Z8hgiyYhOr15hbBoCb2R4wJYB4oqid/syHGPLcx+HojOtPRTgJu5OUiYmChxD3i6Mj
	pab+Vd42frX2licW+hUdzWjEIK6KC4PMP7e2AXl0q2uOr8zuPQKLgUwnS1N9kCUM9oT2S3buv+H6N
	KgIsnWUS/Eq0CDupmvtmX5EYsgweZ/lU7y/GC4mOJb27GqVUFnsCqvsQ/7K4p3EBP2nvhSel3JrLl
	OqASnVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDZRA-0000000E8jt-1d72;
	Wed, 20 Nov 2024 01:23:20 +0000
Received: from mail-m60110.netease.com ([210.79.60.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDZQD-0000000E8dZ-21Er;
	Wed, 20 Nov 2024 01:22:23 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33e51e23;
	Wed, 20 Nov 2024 09:22:10 +0800 (GMT+08:00)
From: Jon Lin <jon.lin@rock-chips.com>
To: broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	jon.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: rockchip-sfc: Support ACPI
Date: Wed, 20 Nov 2024 09:22:08 +0800
Message-Id: <20241120012208.1193034-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxDTFZKH0NCHUlIS05ISkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a934729a09809d9kunm33e51e23
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRw6Tww6HDIeT0gqFTwySy8s
	IzwaFDpVSlVKTEhJS01OTEhKTUxLVTMWGhIXVREUFVUXEhU7CRQYEFYYExILCFUYFBZFWVdZEgtZ
	QVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0lPNwY+
DKIM-Signature: a=rsa-sha256;
	b=SIKkUbqd1UD6wg4Ir2CWDFg9eY5xS3C5QaInroY38GsKPx2HWyGq315zqKv3nAQmmVjk2d1e3zp+Q9VdoXxGhV8/ep98jWVAFAvrqlG+yUSrCnSEhHEXiLMol95k181NauvT+QssWMHVPE4lnYVDtU77hD3vcS7XZZSX8es/stQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4roe1uOrMlMXfDLEUiS1htJOky9bJXMb1BjJs0uBvqY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_172222_060709_44B52234 
X-CRM114-Status: UNSURE (   9.24  )
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

Compatible with ACPI.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

 drivers/spi/spi-rockchip-sfc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 69d0f2175568..138508d2c736 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -491,7 +491,7 @@ static int rockchip_sfc_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op
 	u32 len = op->data.nbytes;
 	int ret;
 
-	if (unlikely(mem->spi->max_speed_hz != sfc->frequency)) {
+	if (unlikely(mem->spi->max_speed_hz != sfc->frequency) && !has_acpi_companion(sfc->dev)) {
 		ret = clk_set_rate(sfc->clk, mem->spi->max_speed_hz);
 		if (ret)
 			return ret;
@@ -579,16 +579,24 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	if (IS_ERR(sfc->regbase))
 		return PTR_ERR(sfc->regbase);
 
-	sfc->clk = devm_clk_get(&pdev->dev, "clk_sfc");
+	if (!has_acpi_companion(&pdev->dev))
+		sfc->clk = devm_clk_get(&pdev->dev, "clk_sfc");
 	if (IS_ERR(sfc->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sfc->clk),
 				     "Failed to get sfc interface clk\n");
 
-	sfc->hclk = devm_clk_get(&pdev->dev, "hclk_sfc");
+	if (!has_acpi_companion(&pdev->dev))
+		sfc->hclk = devm_clk_get(&pdev->dev, "hclk_sfc");
 	if (IS_ERR(sfc->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sfc->hclk),
 				     "Failed to get sfc ahb clk\n");
 
+	if (has_acpi_companion(&pdev->dev)) {
+		ret = device_property_read_u32(&pdev->dev, "clock-frequency", &sfc->frequency);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret, "Failed to find clock-frequency\n");
+	}
+
 	sfc->use_dma = !of_property_read_bool(sfc->dev->of_node, "rockchip,sfc-no-dma");
 
 	if (sfc->use_dma) {
-- 
2.34.1


