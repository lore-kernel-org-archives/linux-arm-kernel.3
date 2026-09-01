Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871A7C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSg9ZjwCxXjRi5P5MJnI0BzRNadAuT0Xu1SEJw5ShmI=; b=K99a8XDoq5ynJKr4t1tw4jN1Ao
	UZDiwkITdEq2x125v/osguHMiKYh0+yMHXoijJMeWEH+G3C5zhFvd4LeDiqbjPp4z/EZTfEAOpo2d
	l5fOSv4uBWV4xtLr00TbzKUxcgK7wW0WWgJ/iLGgODBf7yZoGgcvC8WTjPFk80H53U981h5iI94ec
	ene1+f4Ffb9LNJmLPpp5jRGYHcuChclG16Ens0pZE4Xq6flAtuegLJpjz5dR3vqdC3ZLmJ8T9UumA
	FypI7jGMVUTrt4TUjUMuAon8z21DFr65nEcY+eps4DUR+stu9DsS27fW/susQ+eo1bJB1/VRE16n2
	F8cJckDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaV-0000000CXf0-31N5;
	Tue, 01 Sep 2026 15:39:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaN-0000000CXCj-1aWe;
	Tue, 01 Sep 2026 15:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788277181;
	bh=hDLmPmzyXSsHzKx7g4NI8YUWs5fKSEiY9RsT5ITJWfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MSwMYSQcIZNhgdDIx9HJmMd4iuZsI5W+ABSyKMRH2pxO7uyyGA9ictaxGnLYNCc9e
	 LcHPIB9kzHUeGRsAj9p2cAXVYGpvs0EypFq+D9eP1q5iipxfEqx7FGe3RJW9h4jP4P
	 0YxMwV/1qpBfKwGLV97M1AyADpDEkh+yaCSeb0uIai2eCxA53w4bRRE4zDoWbI9UUS
	 vVzdxi9aTGy7ZNVbYnSrPZF0e2qvVIxgyY4CP4+HfRbQ1PJQ4ngpQC4jYUIGwDRQBl
	 7YnFK+/Zxe25CETajFovTHE2gFGtp1AvMrjhJ1frrDHYCCW/DMnsxDrXG6dDX2v6Li
	 XJF5SYQVHJz8w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A01A17E0934;
	Tue, 01 Sep 2026 17:39:40 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 01 Sep 2026 17:39:03 +0200
Subject: [PATCH v11 15/24] scsi: ufs: mediatek: Remove
 mediatek,ufs-broken-rtc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mt8196-ufs-v11-15-dbd007704490@collabora.com>
References: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
In-Reply-To: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788277163; l=2134;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=JMEyQZm9mztqyjWLzyrw20bJKmXDPQGwgKTDP2yACkw=;
 b=IY3OPhC4PuVuRaRLm6DQ9S7nhW6avTtuGHIUl51Vv9m6GKBtxCO29J3RkUD9qUqDv6HdkSu2A
 smr4QlcZvjbBZ1Hkbq2IuQUBuVrRrbh1nc1kGtfKBYrwx3ZBgHsWjiE
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083943_618409_2362015B 
X-CRM114-Status: GOOD (  11.10  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This flag property was never described in the binding, and its
capability wrapper seems pointless.

If one of the MediaTek SoCs needs the ufshcd quirk applied, then this
can be done per-compatible, without needing to give the device tree
author the option to forget to set it.

Remove it and the associated capability flag wrapping code.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 5 -----
 drivers/ufs/host/ufs-mediatek.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1df16ce29ea4..5d8c02b7a857 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -684,9 +684,6 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-rtff-mtcmos"))
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
-	if (of_property_read_bool(np, "mediatek,ufs-broken-rtc"))
-		host->caps |= UFS_MTK_CAP_MCQ_BROKEN_RTC;
-
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1225,8 +1222,6 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
 
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
-	if (host->caps & UFS_MTK_CAP_MCQ_BROKEN_RTC)
-		hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
 
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index bde2b53f5798..d97951ee1f4e 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -138,8 +138,6 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_DISABLE_MCQ                = 1 << 8,
 	/* Control MTCMOS with RTFF */
 	UFS_MTK_CAP_RTFF_MTCMOS                = 1 << 9,
-
-	UFS_MTK_CAP_MCQ_BROKEN_RTC             = 1 << 10,
 };
 
 struct ufs_mtk_crypt_cfg {

-- 
2.55.0


