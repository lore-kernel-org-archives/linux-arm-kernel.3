Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA77D715DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TO3+E3gSmoEer+wUEBmMZcLhWnkiVKWQshWXIMoQP/o=; b=EX/w4/7sc8UWhwGE2IqduOAf5C
	RNYGj+hdl/FPswcZQap2C47T4H7x9QmVu3MB6S65appNkgvv7ZDaMrlgAppLN5oAUb0JSn/ndxwAI
	rynZngDJgk3sKy2x1Bk9OULBOc+2bb7WkOsFwZEZlPHILn+jBllFsiOAkb5RWrkpY7Myi4NprPVLb
	2DwJMeAspsW4NJ3VzmBAgLAT4vQkE0kldlHWwTwTfzgGNGF0E/g6Hi7z0FGoyw+y8w09qF9ciyFip
	mjfmSdYhWNwKOvrnc5P467Z0HKpGftsOFlYPrW/UedIrWQRQVYaVIDIKK7nWm8l+BB1O33AgqYvdP
	YPyuYATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcLr-0000000AD5o-1qPS;
	Sat, 24 Jan 2026 12:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcLj-0000000ACy2-0McS;
	Sat, 24 Jan 2026 12:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TO3+E3gSmoEer+wUEBmMZcLhWnkiVKWQshWXIMoQP/o=; b=WLhXK9MKdDatEdWCxC2eCuVzjw
	gg3RbTwBHPuTRGSyE1CH8re9zZ/Bybdp6mRNVpeesAPswbW+7YGFgUq5E4pjqK3+XkkSqJ7M8gNso
	jYrToANlcy0EfAaVlnzmNlPSNThZvuVzP9UwLNS9EFIvrAJ0Do2iqNkShZMk6vc9MC2z0A18kEuU8
	MkMCAuIzp+xf5X3taEsDiIMb02iM473eFmnCZdi3bmSwtTL5vKoc8EVq1vJFXNqMOjgzI4Xvtt3Tz
	jkqE3MZejiOCots+EiMXqdwzt/kEbH/qwElUsf7GsPhZgQA46b0I17ifiQjYvbrtGmZKySSVM7s9g
	iYr3c5GQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcLe-00000003UoJ-0Snj;
	Sat, 24 Jan 2026 12:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769256142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A0DNq5Tu5vvecSc20JqO0j71kj0NsR3nB0SWkaRryZXHKYaG6/wxcUazOJG+lORN/JJGB84XjFfDx+lAOtHQyNlRhNVPfIk53oPoic8D1kYuib6CZ98/Gr1DTV9wSUBR0Yyl9b23geTFXqxFGNthCryi7Avq9GoMYoFP7PZIY98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769256142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TO3+E3gSmoEer+wUEBmMZcLhWnkiVKWQshWXIMoQP/o=; 
	b=hO8wvBfvJqcN6UVYfowSDyxpznGyLluM63/5xoXVKetay2ODa+bitmoOUusCCaJUBMgNHzUuIQBPKFyLLmOPcq45zxzuIY4ES0eR2SCgQMGXlPPOobB7BD+dxaAObWWwNjdxbQFSpGfedWOR3iMNsHz4U0PAXwPlIQ/q9+N/TPk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769256142;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=TO3+E3gSmoEer+wUEBmMZcLhWnkiVKWQshWXIMoQP/o=;
	b=Xjtgvgbrlo6sE6XbZ4LHciQwi9hs3LsC33/qRNeXwmcBki4ihhbLqpUSOe1IhD3f
	A0xiwu12sRiGEoQhLPxnHTg3kotLmR9N+aGt/CmnlgnUP5bg0KIQGL2MaMgsZho3JZa
	KdcwvjIZZQVu53M7/M57VgtMcRh9dZqJz681FfFo=
Received: by mx.zohomail.com with SMTPS id 176925614141982.60531836079974;
	Sat, 24 Jan 2026 04:02:21 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 24 Jan 2026 13:00:57 +0100
Subject: [PATCH v6 11/24] scsi: ufs: mediatek: Rework probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-mt8196-ufs-v6-11-e7c005b60028@collabora.com>
References: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
In-Reply-To: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_120238_651136_F2C62587 
X-CRM114-Status: GOOD (  18.71  )
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

Remove the ti,syscon-reset cruft, as it was never documented in the
binding, and is not modelling the hardware correctly.

Make PHY mandatory. All the compatibles supported by the binding make it
mandatory.

Entertain this driver's insistence on playing with the PHY's RPM, but at
least fix the part where it doesn't increase the reference count, which
would lead to use-after-free.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 87 +++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 55 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 954d6768aa64..fc72bf54ec2a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2382,74 +2382,49 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
  */
 static int ufs_mtk_probe(struct platform_device *pdev)
 {
-	int err;
-	struct device *dev = &pdev->dev, *phy_dev = NULL;
-	struct device_node *reset_node, *phy_node = NULL;
-	struct platform_device *reset_pdev, *phy_pdev = NULL;
-	struct device_link *link;
-	struct ufs_hba *hba;
+	struct platform_device *phy_pdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *phy_node;
 	struct ufs_mtk_host *host;
+	struct device *phy_dev;
+	struct ufs_hba *hba;
+	int err;
 
-	reset_node = of_find_compatible_node(NULL, NULL,
-					     "ti,syscon-reset");
-	if (!reset_node) {
-		dev_notice(dev, "find ti,syscon-reset fail\n");
-		goto skip_reset;
-	}
-	reset_pdev = of_find_device_by_node(reset_node);
-	if (!reset_pdev) {
-		dev_notice(dev, "find reset_pdev fail\n");
-		goto skip_reset;
-	}
-	link = device_link_add(dev, &reset_pdev->dev,
-		DL_FLAG_AUTOPROBE_CONSUMER);
-	put_device(&reset_pdev->dev);
-	if (!link) {
-		dev_notice(dev, "add reset device_link fail\n");
-		goto skip_reset;
-	}
-	/* supplier is not probed */
-	if (link->status == DL_STATE_DORMANT) {
-		err = -EPROBE_DEFER;
-		goto out;
-	}
-
-skip_reset:
 	/* find phy node */
 	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
+	if (!phy_node)
+		return dev_err_probe(dev, -ENOENT, "No PHY node found\n");
 
-	if (phy_node) {
-		phy_pdev = of_find_device_by_node(phy_node);
-		if (!phy_pdev)
-			goto skip_phy;
-		phy_dev = &phy_pdev->dev;
+	phy_pdev = of_find_device_by_node(phy_node);
+	of_node_put(phy_node);
+	if (!phy_pdev)
+		return dev_err_probe(dev, -ENODEV, "No PHY device found\n");
 
-		pm_runtime_set_active(phy_dev);
-		pm_runtime_enable(phy_dev);
-		pm_runtime_get_sync(phy_dev);
+	phy_dev = &phy_pdev->dev;
 
-		put_device(phy_dev);
-		dev_info(dev, "phys node found\n");
-	} else {
-		dev_notice(dev, "phys node not found\n");
+	err = pm_runtime_set_active(phy_dev);
+	if (err) {
+		dev_err_probe(dev, err, "Failed to activate PHY RPM\n");
+		goto err_put_phy;
+	}
+	pm_runtime_enable(phy_dev);
+	err = pm_runtime_get_sync(phy_dev);
+	if (err) {
+		dev_err_probe(dev, err, "Failed to power on PHY\n");
+		goto err_put_phy;
 	}
 
-skip_phy:
 	/* perform generic probe */
 	err = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
 	if (err) {
-		dev_err(dev, "probe failed %d\n", err);
-		goto out;
+		dev_err_probe(dev, err, "Generic platform probe failed\n");
+		goto err_put_phy;
 	}
 
 	hba = platform_get_drvdata(pdev);
-	if (!hba)
-		goto out;
 
-	if (phy_node && phy_dev) {
-		host = ufshcd_get_variant(hba);
-		host->phy_dev = phy_dev;
-	}
+	host = ufshcd_get_variant(hba);
+	host->phy_dev = phy_dev;
 
 	/*
 	 * Because the default power setting of VSx (the upper layer of
@@ -2458,9 +2433,11 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	 */
 	ufs_mtk_dev_vreg_set_lpm(hba, false);
 
-out:
-	of_node_put(phy_node);
-	of_node_put(reset_node);
+	return 0;
+
+err_put_phy:
+	put_device(phy_dev);
+
 	return err;
 }
 

-- 
2.52.0


