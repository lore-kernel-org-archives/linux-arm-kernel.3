Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0057FCC9A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 00:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqlnym1aoDpo4JzJeL6Wh0vGCyxqGMsiqXv+LsEoihc=; b=QrFnDrXs6fYW0y1J/ObosoGqUb
	Q0OAF+hJzO5DeapPpTCPtTxVfDZhy9e4BScXqf2jW6x2BQWa1QqEORqt/MVptIq8Pl8Tzb3pwdSyc
	ioV++XteWBdIA597hhuIOzZh+WJ2xRIFDYPB4++8/c4wbLzIxMtv0z8y1+AxqW9zest0vpavVw6EK
	uCwMye3SK1PjmOwU+FKjzE6K4QJzp5hFzEsQrNPZPFavKw0eCTcQXl/HTUwc2I4nduuGNdEmMxb2a
	2yPz+IW582kzhObcyiJ0rD9wuelXoVuzUBbracYWtW/FprKlsNnZydd3JMUqLgOdXswEm3b4gEXJQ
	Wclg+msw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlN1-00000008QtT-2x6v;
	Tue, 10 Mar 2026 00:54:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlMz-00000008Qru-0pW0;
	Tue, 10 Mar 2026 00:54:46 +0000
X-UUID: b90c5b8c1c1b11f1a6de359d7043e138-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rqlnym1aoDpo4JzJeL6Wh0vGCyxqGMsiqXv+LsEoihc=;
	b=oJO0HcmZOztiv31WaIcXG0w2K7doqrO9y7AHRFdWFgPBHp/S/IzbHNJzxZQl4Xar03yAbscrzxeBZHKc0mz6D75bJWUkAI/ZyOC88T+GJX6tQkgB2fVpGkaKGEgcYbYuXdHG7EIbZByp1y4n5xMvaBViTrIOMMcsCHjHfwAhQrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:2c16fe20-a691-4d1b-97d2-b6cd56954846,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7cd1b57b-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b90c5b8c1c1b11f1a6de359d7043e138-20260309
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189194998; Mon, 09 Mar 2026 17:54:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Mar 2026 08:54:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Mar 2026 08:54:39 +0800
From: <ed.tsai@mediatek.com>
To: <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
	<avri.altman@wdc.com>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>, <linux-scsi@vger.kernel.org>
Subject: [PATCH v2 1/2] ufs: core: Add quirks for VCC ramp-up delay
Date: Tue, 10 Mar 2026 08:52:28 +0800
Message-ID: <20260310005230.4001904-4-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260310005230.4001904-2-ed.tsai@mediatek.com>
References: <20260310005230.4001904-2-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_175445_243988_AA61094F 
X-CRM114-Status: GOOD (  15.09  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

On some platforms, the VCC regulator has a slow ramp-up time. Add a
delay after enabling VCC to ensure voltage has fully stabilized before
we enable the clocks.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 12 ++++++++++++
 include/ufs/ufshcd.h      |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 899e663fea6e..bea72e7c1d32 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9942,11 +9942,13 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 #ifdef CONFIG_PM
 static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 {
+	bool vcc_on = false;
 	int ret = 0;
 
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
 	    !hba->dev_info.is_lu_power_on_wp) {
 		ret = ufshcd_setup_vreg(hba, true);
+		vcc_on = true;
 	} else if (!ufshcd_is_ufs_dev_active(hba)) {
 		if (!ufshcd_is_link_active(hba)) {
 			ret = ufshcd_config_vreg_hpm(hba, hba->vreg_info.vccq);
@@ -9957,6 +9959,7 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 				goto vccq_lpm;
 		}
 		ret = ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, true);
+		vcc_on = true;
 	}
 	goto out;
 
@@ -9965,6 +9968,15 @@ static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
 vcc_disable:
 	ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
 out:
+	/*
+	 * On platforms with a slow VCC ramp-up, a delay is needed after
+	 * turning on VCC to ensure the voltage is stable before the
+	 * reference clock is enabled.
+	 */
+	if (hba->quirks & UFSHCD_QUIRK_VCC_ON_DELAY && !ret && vcc_on &&
+	    hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
+		usleep_range(1000, 1100);
+
 	return ret;
 }
 #endif /* CONFIG_PM */
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8563b6648976..ee5f1c60174f 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -690,6 +690,12 @@ enum ufshcd_quirks {
 	 * because it causes link startup to become unreliable.
 	 */
 	UFSHCD_QUIRK_PERFORM_LINK_STARTUP_ONCE		= 1 << 26,
+
+	/*
+	 * On some platforms, the VCC regulator has a slow ramp-up time. Add a
+	 * delay after enabling VCC to ensure it's stable.
+	 */
+	UFSHCD_QUIRK_VCC_ON_DELAY			= 1 << 27,
 };
 
 enum ufshcd_caps {
-- 
2.45.2


