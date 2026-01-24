Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C37FD715DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZyuoBxgTeDQ4X+4RS0Rrin+WSXPRF/Xps8zmpFmJ0o=; b=ip6J26zEiJbownP/H+bEuWDyex
	nbqOEzCtA2VKSWg+6+op/pc6D1Ea/RhDka58VrTJE+MSc38ND5GOEUgvzt4SHU6c1bCnt5yPX/gEz
	h0ssVIgIAnZLyMrf1dfpxxkMzl/9ktuTsEr+DbEsSoXTQuFDMODoXpJgD1W7O2TIKsqeMIpcRZ2yk
	zYKx2wef6zbxyjs4UnGcfY1yr4JOvpUbSOTpWmWGaqkUQArNrRtmpLkxb1bORtlXS4xC9d4YdiFeH
	/o6Sbh+X/xTTY0+kR74CH0DYmopqgKk4ulYPL1oqWGyaYqU1u+V5h+f6L6wttWdLGzk05cy2dbwfq
	coNnTrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcNa-0000000AEOd-1a9C;
	Sat, 24 Jan 2026 12:04:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMc-0000000ADij-0hRj;
	Sat, 24 Jan 2026 12:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769256209; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nIpbV4NroEGaItGJSYUe87CifTj6uMBapOjLHlBy5mqplweJ6PS9XWWBqLZzVmOftSQlwPBTCkHT3XhnstmaC7FkFgU+Uclyh9emk4dNln5kk0ij9X4b5PZgyhcrN4i/4XJ0AQ61O/5i+5nM/JIWpP4eHQGJsdnGvYP4ou3NiUw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769256209; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zZyuoBxgTeDQ4X+4RS0Rrin+WSXPRF/Xps8zmpFmJ0o=; 
	b=Fa/sXq+WJRgaQChLH1dNq5jh3+EhTG8mwAIE2VCy/b1JfuItMJttTltxaueqBe6Q4tFgE+2mrdT8I2E+ddeAyekalQq5ENu3Z3RpBbwpJyI3BqQyXGUhVJSeFlA7EGADntVYzVKKh1mulDIN89rM8OvWRfU13m3QRIQdHJI11EY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769256209;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zZyuoBxgTeDQ4X+4RS0Rrin+WSXPRF/Xps8zmpFmJ0o=;
	b=O5v/LPLkXx6gWRqbdIvyd+peBH94QHmsj4yK8Ey9HNGXQSKFS/v9F6BoVZVBcEBC
	xpOjOKhumM0sGd61W/0tksL9HOBtcXrs26BWMJtezD76bgOmqlOH3/c+6x8HCKY/c4J
	eC3+OOO11h414RYjbfL/JNKNTGhMiux04m/He/ZM=
Received: by mx.zohomail.com with SMTPS id 1769256206837968.7228445455696;
	Sat, 24 Jan 2026 04:03:26 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 24 Jan 2026 13:01:07 +0100
Subject: [PATCH v6 21/24] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-mt8196-ufs-v6-21-e7c005b60028@collabora.com>
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
X-CRM114-CacheID: sfid-20260124_040338_557517_DABB09D7 
X-CRM114-Status: GOOD (  15.60  )
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

The MediaTek UFS driver uses a function-scope static variable to back up
a hardware register across a power change in the
ufs_mtk_pwr_change_notify function. This is dangerous, as it's only
correct if only ever one instance of the driver is loaded, which isn't
true if there's more than one device on a SoC that needs it, or it
otherwise gets loaded a second time.

Back it up into a member of the host struct instead, as this struct is
per-instance. Rework the function to not use a pointless "ret" local as
well.

Fixes: f5ca8d0c7a63 ("scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 20 ++++++++------------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ee677af6c700..046e2f9bb6c7 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1398,28 +1398,24 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
-	int ret = 0;
-	static u32 reg;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	switch (stage) {
 	case PRE_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba)) {
-			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+			host->hibernate_idle_timer = ufshcd_readl(
+				hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
 			ufs_mtk_auto_hibern8_disable(hba);
 		}
-		ret = ufs_mtk_pre_pwr_change(hba, dev_max_params,
-					     dev_req_params);
-		break;
+		return ufs_mtk_pre_pwr_change(hba, dev_max_params, dev_req_params);
 	case POST_CHANGE:
 		if (ufshcd_is_auto_hibern8_supported(hba))
-			ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+			ufshcd_writel(hba, host->hibernate_idle_timer,
+				      REG_AUTO_HIBERNATE_IDLE_TIMER);
+		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int ufs_mtk_unipro_set_lpm(struct ufs_hba *hba, bool lpm)
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index fa27ab4d6d6c..e5a3f70e7024 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -187,6 +187,7 @@ struct ufs_mtk_host {
 	u16 ref_clk_gating_wait_us;
 	u32 ip_ver;
 	bool legacy_ip_ver;
+	u32 hibernate_idle_timer;
 
 	bool mcq_set_intr;
 	bool is_mcq_intr_enabled;

-- 
2.52.0


