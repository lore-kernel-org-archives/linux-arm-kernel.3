Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DEAC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp8EhhgatT8Kblx3ble3/Lg3HcDYP9qvUjPKhX76G3Q=; b=1FoD5wzoXisQKpu42D4KzoCAKh
	A/KNq52vdOiWLoggg9zR/4aXkOidO3Wee45Fe85kLvSTdYbY0rhFBWCqWM7EOqRLPkf3EWiv+anyp
	xXdbkxFAvQiS1WKKJpIN291g+nZexU/eA+ckisuSgklnHQYmN9KGDU8WZne7riM0ApZOo/PSFAwvA
	t6Wk2wWmruuKhB74j/W4JFecX1hP4tWsSyPdoVRQ3mypqxPlxDaFw/4obxiOvZf3CtBJv1iPzpIK0
	s+tddKNOrkoE5UdK3B85i/A9hQBKc66Mf0VPVusuqX7tEzX1kTuSeRbc21QPS54jHpTT9vLiENhIE
	KT/XumxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x653E-00000003Jhl-1WKr;
	Mon, 14 Sep 2026 11:40:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6529-00000003Ihp-3cbW;
	Mon, 14 Sep 2026 11:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789385975;
	bh=TLJfFKrGCdAfrDs7f3DD9z/JDqxUYjNdYN2HUNY8vUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cp7oWr+41OZJaQLeblTpXkC1H9EaGPTTeWWtsjVyteS2smn9Wy1SyHK0vKka+Ko6i
	 SYNLmX43/bzqQsqw5a3+pb5ir98ip7UyhtBjDshFRjWFFDTO+45GqBnHG1gkU5N9/q
	 gY1w40CP3wqvWwke7GTS/ZfB8T+iva8poYezPJvJf2fguGsfWEkyJfkj+eMFUMMxZk
	 HVTtq1j52B7Jru5Q4aTcbPsF9HgpYFqikIb6e4KwypkYaz42rXktvsumT444sOSCqK
	 VfJ1z0HZ8G3N7lKiDiiyctRSSYKBSQSO/TJa6W7YezM1h/GxtBKbG8Po2bPKWwjXUi
	 vWb4bXDqYthRw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11A8C17E08A1;
	Mon, 14 Sep 2026 13:39:34 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 14 Sep 2026 13:39:01 +0200
Subject: [PATCH v12 15/24] scsi: ufs: mediatek: Remove
 mediatek,ufs-broken-rtc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mt8196-ufs-v12-15-9279d7ef814d@collabora.com>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
In-Reply-To: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
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
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789385943; l=2134;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=PczjgMmcaKTNxA6z4LyX4a1OHzDCTGb37OFBfGxdudc=;
 b=wihNWHGsJTNgE6M7CPfE1dJeaNiBjVAIRYNZKItQBKWM7zCmPuLPcrtlSSNNit3uGjYuuWEgZ
 kj/MTgNpGS0BFtxHFhTenTHsuse+Uy0eQdKBTVb7IPMS7j94YUtkKhR
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043938_255557_B7D2082B 
X-CRM114-Status: GOOD (  10.54  )
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
index 538009e3b1f1..8e2aeb877de8 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -691,9 +691,6 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-rtff-mtcmos"))
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
-	if (of_property_read_bool(np, "mediatek,ufs-broken-rtc"))
-		host->caps |= UFS_MTK_CAP_MCQ_BROKEN_RTC;
-
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -1234,8 +1231,6 @@ static int ufs_mtk_init(struct ufs_hba *hba)
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


