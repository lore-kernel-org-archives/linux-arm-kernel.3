Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D9C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prxJuUSE8fevIr/DHvhqqrbFA9h0A7CHVLzUycKX/Po=; b=PSedgvcGwEgoveo9usNhjqdsZQ
	+O0i5fwHGygHpURYXLDZCmY5cz8A23hRty4EGjzS4HIhizQXIWQ6kJL+5pzdkICxpuXPVKOGwTdZR
	PD6FpfdSnqG6BqwLAt0rqprxMx5gYALB8gvz4oW7rHqgWjfTQswBbguyLN9BHDqkARrmQjJurL99a
	pUD3Y1uHM6e3sIpq4yFiOAt92iaaqnRytYFfBAZYGKZ23fLRKjDT4I7IpH8SQyatTNnjRzO/Oa3nm
	d0Yi4atlmMrDhyTrBh2ZHJMBNwse3bB8rrQJhusqs2txXXqzHbVBmYX9VEE7ivTF8xbmVtxj9idun
	xoIxwcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPDs-0000000D6kD-01M6;
	Fri, 07 Mar 2025 04:22:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOe2-0000000D23N-0Iks;
	Fri, 07 Mar 2025 03:45:07 +0000
X-UUID: 8cd56c52fb0611efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=prxJuUSE8fevIr/DHvhqqrbFA9h0A7CHVLzUycKX/Po=;
	b=CbvezRpMVUsqogrQzAuv4SlM4VmXgn6Zs1G+a3d3cyCujs/boEzkjbwlEHQeQEAfqQoeRE9Lz+Yaln+I3qBmcjpbfUbi8h8IshJiOAIFWsgaq4TU3nozlyMFQJloOUMH57DPWWrb1XUvFv3gcgMAchsyemZ1k0LPY3zE/hLENTc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a82b30a3-27d7-4ace-ae40-e2ae21639ac7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8c51cc49-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8cd56c52fb0611efa1e849db4cc18d44-20250306
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 776162275; Thu, 06 Mar 2025 20:45:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:44:59 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 04/13] pmdomain: mediatek: Support check power on/off ack
Date: Fri, 7 Mar 2025 11:44:28 +0800
Message-ID: <20250307034454.12243-5-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194506_112982_4E8A0E0E 
X-CRM114-Status: GOOD (  11.51  )
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

Support check ack bits for pmdomain on/off.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 50 +++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index 3c8b5d8e7ee9..2f75c606f7ba 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -22,12 +22,14 @@
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
+#define MTK_ACK_DELAY_US		50
 
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
 #define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_SRAM_SLP		BIT(3)
 #define MTK_SCPD_BYPASS_INIT_ON		BIT(4)
+#define MTK_SCPD_IS_PWR_CON_ON		BIT(5)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -61,6 +63,8 @@
 #define PWR_CLK_DIS_BIT			BIT(4)
 #define PWR_SRAM_CLKISO_BIT		BIT(5)
 #define PWR_SRAM_ISOINT_B_BIT		BIT(6)
+#define PWR_ACK				BIT(30)
+#define PWR_ACK_2ND			BIT(31)
 
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
@@ -200,6 +204,20 @@ static int scpsys_domain_is_on(struct scp_domain *scpd)
 	return -EINVAL;
 }
 
+static int scpsys_pwr_ack_is_on(struct scp_domain *scpd)
+{
+	u32 status = readl(scpd->scp->base + scpd->data->ctl_offs) & PWR_ACK;
+
+	return status ? true : false;
+}
+
+static int scpsys_pwr_ack_2nd_is_on(struct scp_domain *scpd)
+{
+	u32 status = readl(scpd->scp->base + scpd->data->ctl_offs) & PWR_ACK_2ND;
+
+	return status ? true : false;
+}
+
 static int scpsys_regulator_enable(struct scp_domain *scpd)
 {
 	if (!scpd->supply)
@@ -360,12 +378,25 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	val = readl(ctl_addr);
 	val |= PWR_ON_BIT;
 	writel(val, ctl_addr);
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IS_PWR_CON_ON)) {
+		ret = readx_poll_timeout_atomic(scpsys_pwr_ack_is_on, scpd, tmp, tmp > 0,
+						MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret < 0)
+			goto err_pwr_ack;
+
+		udelay(MTK_ACK_DELAY_US);
+	}
+
 	val |= PWR_ON_2ND_BIT;
 	writel(val, ctl_addr);
 
 	/* wait until PWR_ACK = 1 */
-	ret = readx_poll_timeout(scpsys_domain_is_on, scpd, tmp, tmp > 0,
-				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IS_PWR_CON_ON))
+		ret = readx_poll_timeout_atomic(scpsys_pwr_ack_2nd_is_on, scpd, tmp, tmp > 0,
+						MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	else
+		ret = readx_poll_timeout(scpsys_domain_is_on, scpd, tmp, tmp > 0,
+					 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 	if (ret < 0)
 		goto err_pwr_ack;
 
@@ -428,12 +459,23 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	val &= ~PWR_ON_BIT;
 	writel(val, ctl_addr);
 
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IS_PWR_CON_ON)) {
+		ret = readx_poll_timeout_atomic(scpsys_pwr_ack_is_on, scpd, tmp, tmp == 0,
+						MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret < 0)
+			goto out;
+	}
+
 	val &= ~PWR_ON_2ND_BIT;
 	writel(val, ctl_addr);
 
 	/* wait until PWR_ACK = 0 */
-	ret = readx_poll_timeout(scpsys_domain_is_on, scpd, tmp, tmp == 0,
-				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IS_PWR_CON_ON))
+		ret = readx_poll_timeout_atomic(scpsys_pwr_ack_2nd_is_on, scpd, tmp, tmp == 0,
+						MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	else
+		ret = readx_poll_timeout(scpsys_domain_is_on, scpd, tmp, tmp == 0,
+					 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 	if (ret < 0)
 		goto out;
 
-- 
2.45.2


