Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9DD6ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XOCA2Fip916bzcuN3Z/+09ZGEdeJC+mwMclvW4uRfs=; b=wmQVH9tQnKhSAHle6YNDluO7s2
	NvsMYaI+ORBp2gtYTDOIMPJvM0PNk+c4xAOwZmn1M7to525sCjtmohgi5ExzeNCb/VixYYX9hnnXa
	ZrNmdqjfvW0E3PtAz4FDgxPfDA6ZsyJDPZ+FBwRb7Z3zZJSEuDDIWRLWmbQ9FYQayvE3kqPus+1Pp
	rAOSjxi0s0vn0jKo2JDRo5Fe17NifDIaLMooLgGzJL7qJidqyMDMQ/ljSKBPVUUeLKYXRPf6QjmvH
	11G9SMkms0NAxMiz0hD25CwFmHVwBaPJQarAq3Zp4BpC4Q6CXTVivinC0nVDe0mFZHn6wcF/oaBMh
	qg+PbEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYx-00000008SaW-2S8u;
	Thu, 18 Dec 2025 12:56:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDYq-00000008SRt-0xty;
	Thu, 18 Dec 2025 12:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766062602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B4xFvxMRfMZ+woJvbXOf0ws5qVT7oEZ0XwL52K2MyufjIsN1HVYYyh1Rk4beLcreiumYvOkCY4cADgmFNqGdCGGgHfkPi1tiLe6IMVGlTBdzTr4JLAZL8cGUYosyBD/jC1l/uIa0VGuQG4MYLKMSJw6VkKg3aLDiXT5jgXZMsQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766062602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6XOCA2Fip916bzcuN3Z/+09ZGEdeJC+mwMclvW4uRfs=; 
	b=QuDuCiqRiNmR5kd4zw1hAJnRnHK0JVtjIraWHV5D1YjsicPmu3+vWUjdmh5WRYlmNc92JhizuFbjFtbUuvDoeOM/V5hSRX1VwQYdpm6Gpe+j7tZR9lJZnfNX82ShjSvMRQn8gbpTfbjfiDaWQ7bXWxsY8WDkm9lq0dJKGN3MJAs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766062602;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6XOCA2Fip916bzcuN3Z/+09ZGEdeJC+mwMclvW4uRfs=;
	b=ewml0xW1YctPdGEdbSSxUAw0FheoKoxAwkcbJt6U89TgIeJ0xZR5bHl8nnynCeNT
	Kl16X3E5x26VoEWp/l+4TPznhodb0PL8HJORHdHt82JunguP+hfa6BCzQOUe6dGP7UR
	6wsg8wGEnPF7li+Avq/2KDYbm+UzEiB49SE81GJ0=
Received: by mx.zohomail.com with SMTPS id 1766062601306820.1593929255353;
	Thu, 18 Dec 2025 04:56:41 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 18 Dec 2025 13:55:01 +0100
Subject: [PATCH v4 11/25] scsi: ufs: mediatek: Rework probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mt8196-ufs-v4-11-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
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
X-CRM114-CacheID: sfid-20251218_045652_348641_44AB8411 
X-CRM114-Status: GOOD (  18.16  )
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

Remove the ti,syscon-reset cruft.

Make PHY mandatory. All the compatibles supported by the binding make it
mandatory.

Entertain this driver's insistence on playing with the PHY's RPM, but at
least fix the part where it doesn't increase the reference count, which
would lead to use-after-free.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 87 +++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 55 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 10d6b69e91a5..cc6a3a4c9704 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -2406,74 +2406,49 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
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
@@ -2482,9 +2457,11 @@ static int ufs_mtk_probe(struct platform_device *pdev)
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


