Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFC1C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/j+cCLQgw8CkO/5jflyJ3G3GxgwxCAPGU/GP8tBtTg=; b=H7l5lZg3ABhTAzuk0NiDFfG/cv
	DytX3cC7pBpc1ctcqhCopQmRgbumItqTyCbV/ONGv6B0tfTzgbim909ySb+mhNVYLvTJTQTPES0EH
	YXKg61DUYINGefLkTVecQhgilYleBcP+/zI15soJzv/dByxS2Rr4J+YhHTbHREmEgcit4eQmyGraD
	SZxuHkfe+kyGrBc7Hwsf5A0cPvU65QqKVmpRmZVmwYtiuBLPKVyJLlcHzhVmNFY3hMdEYOYKxRtyx
	F1U0/0tAKek1doSL7axqATLSZ/BCgOGhM/ePgkozOqdcTfwGdvQrmrkFEixqOGlAHb3+IdfckZDBx
	phXx05vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNRY-0000000A5O1-3OjL;
	Thu, 30 Jul 2026 09:52:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNPD-0000000A3dz-0faq;
	Thu, 30 Jul 2026 09:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785405021;
	bh=PldlQ0KDDrj7Pp2nJ0tTvE40PVJeyn7nxxcvV6YgwG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BI3UqSgSKckSQkNfBIc2SghPXtBWzMkNxewXVzCH9/ERMAyxuZEkXAL5XcYoTVd01
	 7ueX3KPMPavNveOy1WeiU2pyCatKmVTvDCproQcfbSizya+l2L/wj8rthwoITPFk57
	 ukWxVM49Ds8jo3hsrSIiMip11LzizjXSyj55NxLOU23Ti5yENZrDSUOpG0z2hFeBw7
	 pu14nU3JDuqxKBf0wf3FlxBaSwE14qVvKNkFzky28D9E5NJMPbZByaDW5HaaD144AH
	 12EdDjK9LqU2JVDhmkEQx0vQdS/kLi2IAZoznSHgDAaC822jEFIMjEmxCSpgoRGdZe
	 6s7BUkxClL3Ww==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE64717E095D;
	Thu, 30 Jul 2026 11:50:19 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:49:13 +0200
Subject: [PATCH v10 17/26] scsi: ufs: mediatek: Rework
 ufs_mtk_wait_idle_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-17-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
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
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=4342;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=KOF7838plKaZV9k9BZBCNC4SR0msgY3QdpkMzk5+TjQ=;
 b=H2ekgPewVzoNWpvXzlqvwdWdsjFsuJJJVdkMEoPqL0i20veXE67dqBmJ99tqeqXCb29bJoD2t
 PUj06YiMP6QD3uYTwD5d6GHdkvrqOAChmYP9NwZuaEIeY27UGVoYRiX
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025023_966134_46517015 
X-CRM114-Status: GOOD (  18.78  )
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

While ufs_mtk_wait_idle state has some code smells for me (the
VS_HCE_BASE early exit seems racey at best), it can still benefit from
some general cleanup to make the code flow less convoluted.

Use the iopoll helpers, for one, and specifically the one that sleeps
and does not busy delay, as it's being done for up to 5ms.

The register read is split out to a helper function that branches
between new and old style flow.

Every called uses the same 5ms timeout value, so there is no point in
making this a parameter. Just assume a 5ms timeout in the function.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 71 +++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 33917c345b29..0821de5b8a8f 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -380,51 +381,39 @@ static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
 	}
 }
 
-static int ufs_mtk_wait_idle_state(struct ufs_hba *hba,
-			    unsigned long retry_ms)
+static u32 ufs_mtk_read_state(struct ufs_hba *hba, bool old_style)
 {
-	u64 timeout, time_checked;
-	u32 val, sm;
-	bool wait_idle;
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-
-	/* cannot use plain ktime_get() in suspend */
-	timeout = ktime_get_mono_fast_ns() + retry_ms * 1000000UL;
-
-	/* wait a specific time after check base */
-	udelay(10);
-	wait_idle = false;
+	u32 val;
 
-	do {
-		time_checked = ktime_get_mono_fast_ns();
-		if (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899) {
-			ufs_mtk_dbg_sel(hba);
-			val = ufshcd_readl(hba, REG_UFS_PROBE);
-		} else {
-			val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL);
-			val = val >> 16;
-		}
+	if (old_style) {
+		ufs_mtk_dbg_sel(hba);
+		val = ufshcd_readl(hba, REG_UFS_PROBE);
+	} else {
+		val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL) >> 16;
+	}
 
-		sm = val & 0x1f;
+	return FIELD_GET(0x1f, val);
+}
 
-		/*
-		 * if state is in H8 enter and H8 enter confirm
-		 * wait until return to idle state.
-		 */
-		if ((sm >= VS_HIB_ENTER) && (sm <= VS_HIB_EXIT)) {
-			wait_idle = true;
-			udelay(50);
-			continue;
-		} else if (!wait_idle)
-			break;
+static int ufs_mtk_wait_idle_state(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	bool old_style = (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899);
+	u32 val;
+	int ret;
 
-		if (wait_idle && (sm == VS_HCE_BASE))
-			break;
-	} while (time_checked < timeout);
+	/* If the device isn't in a hibernate state after 10us, don't wait. */
+	udelay(10);
+	val = ufs_mtk_read_state(hba, old_style);
+	if (val < VS_HIB_ENTER || val > VS_HIB_EXIT)
+		return 0;
 
-	if (wait_idle && sm != VS_HCE_BASE) {
-		dev_info(hba->dev, "wait idle tmo: 0x%x\n", val);
-		return -ETIMEDOUT;
+	/* Poll to wait for idle */
+	ret = read_poll_timeout(ufs_mtk_read_state, val, (val == VS_HCE_BASE),
+				50, 5 * USEC_PER_MSEC, false, hba, old_style);
+	if (ret) {
+		dev_err(hba->dev, "Timed out waiting for idle state, val = 0x%x\n", val);
+		return ret;
 	}
 
 	return 0;
@@ -1392,7 +1381,7 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
 
 	/* wait host return to idle state when auto-hibern8 off */
-	ret = ufs_mtk_wait_idle_state(hba, 5);
+	ret = ufs_mtk_wait_idle_state(hba);
 	if (ret)
 		goto out;
 
@@ -1594,7 +1583,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 		return err;
 
 	/* Check link state to make sure exit h8 success */
-	err = ufs_mtk_wait_idle_state(hba, 5);
+	err = ufs_mtk_wait_idle_state(hba);
 	if (err) {
 		dev_err(hba->dev, "Failed to wait for idle: %pe\n", ERR_PTR(err));
 		return err;

-- 
2.55.0


