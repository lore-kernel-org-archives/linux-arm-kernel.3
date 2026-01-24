Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E829DD715C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2ImRJ75pZduojZEXoZjZ2G3lk/uDGjJ8V1tW99jraA=; b=paSAlrZ34oGBuIYRDqYJDH/zk/
	EOAqf+KFbZyguFq42j2BkKdcyhZo+dBNpKtGZ7VyOs5L3CGExGrzA1g4H/1E5wh4c5jbJ5hylycW/
	Xjtw6dt+0u0HiCp6JyFjiLUKpUCdxwawp1QMRW5924JNUu0F8rBTdqOUbgxA/UmMikJAQCIfiqyU4
	HJGu6m0WboDj//bVVbZ8UZLbPTyy2/JNZdV3L1gOd89RwB3V0z+9J4091WDZk6SEr7iowG/n6SVNJ
	vr59ftFdzxuFVjv8N2b5D/8f7bJZgC5xvRGbvsaCXkSpm18VZ4AzrToEEgvFcCysuh6CwXx850Nj+
	XAvVJW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcNd-0000000AES5-2SgM;
	Sat, 24 Jan 2026 12:04:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMo-0000000ADoa-31HL;
	Sat, 24 Jan 2026 12:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769256221; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gkvlXziP+lgOfKPzBoot3qqY3Nw2rn6fYHXYBSlEBNdlICA0ExaZRoK9SdLCbbq7lxYq/54OktdIa0QHhsuVltHgXgRV2JwGMqdVf8H3JE3CQe1ghXKLgTCrDLAj34emx6pIvP+KMcoFuyvwKXT6BxPp5S7Izx7kVH7LLq3gIF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769256221; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d2ImRJ75pZduojZEXoZjZ2G3lk/uDGjJ8V1tW99jraA=; 
	b=X7AHvEeT/KeUQNbUPTUCPSDxDKPbNiCy+X0tvK0R+Fj3ThWHjdfcLUO+qMvA1PLabu+b7Jj/2jLXiz12CTgmojR/gWmUYn4NqhMyAtZRSwVWSfWfoiJ+/YWUkSJVl7FWdJlx1M7005MU9aKEOIOO7q4i5DVQC7nTQ8ufN6f8jAs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769256221;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=d2ImRJ75pZduojZEXoZjZ2G3lk/uDGjJ8V1tW99jraA=;
	b=NPkA+uq7VOYQMnrPLgNxDnMPFtUwLxyGCMXl1qAVTXxvmnpksVAo4z6/7tKIDoVN
	2La/lY3Wnd9tDoCPWfli/KDA2eNOQLunuR3WRIWbxrnKKpaWgx2QISyxLgVvAKMnija
	U2foZIhOH/zSUpM7b+b+y5jmW+s+dBNnNSWnCtbQ=
Received: by mx.zohomail.com with SMTPS id 1769256219717617.1320721102721;
	Sat, 24 Jan 2026 04:03:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 24 Jan 2026 13:01:09 +0100
Subject: [PATCH v6 23/24] scsi: ufs: mediatek: Remove undocumented
 "clk-scale-up-vcore-min"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-mt8196-ufs-v6-23-e7c005b60028@collabora.com>
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
X-CRM114-CacheID: sfid-20260124_040355_523411_011DF344 
X-CRM114-Status: GOOD (  12.48  )
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

The MediaTek UFS driver contains support for an undocumented,
non-vendor-prefixed u32 property named "clk-scale-up-vcore-min".

Since it is not part of any binding, and would not pass a bindings
review in its current form, remove it.

To return this functionality, it needs to be resubmitted in a series
that also introduces it to the binding, and justifies what it is used
for. Compatibility with downstream device trees is not a valid
justification for its existence.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index e863e4f8af55..dfa104207cc6 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -880,8 +880,6 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
 	struct ufs_clk_info *clki, *clki_tmp;
-	struct device *dev = hba->dev;
-	u32 volt;
 
 	/*
 	 * Find private clocks and store them in struct ufs_mtk_clk.
@@ -918,24 +916,7 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	if (!ufs_mtk_is_clk_scale_ready(hba)) {
 		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
 		dev_info(hba->dev, "%s: Clock scaling unavailable", __func__);
-		return;
-	}
-
-	if (!host->reg_vcore)
-		return;
-
-	if (of_property_read_u32(dev->of_node, "clk-scale-up-vcore-min",
-				 &volt)) {
-		dev_info(dev, "failed to get clk-scale-up-vcore-min");
-		return;
 	}
-
-	host->mclk.vcore_volt = volt;
-
-	/* If default boot is max gear, request vcore */
-	if (volt && host->clk_scale_up)
-		if (regulator_set_voltage(host->reg_vcore, volt, INT_MAX))
-			dev_err(hba->dev, "Failed to set vcore to %d\n", volt);
 }
 
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)

-- 
2.52.0


