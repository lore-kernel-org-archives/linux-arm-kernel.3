Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5CD715E5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjSLvwTgrrP3mUBEhIBlXKbE0FaKi8bZDGULITLn1ns=; b=Qy55QB5Asm01DO80y/mqF50dwP
	s1zttPai5O8Yf8MBAiyHoGyQhwY2jG2SMgkjeKwke24eJU9U7f3htiBpTe+3UbFtNCjMUHHUXuO6+
	vJTMYVtayRfk4dJtAUZH/wqS1XEIrc+RWOqhwOW++eUINdYn5O3m8qmJblCm/y9NmsNKkOpSSyB/Z
	X2GdlbkniGibE9D9kkooJfrlydRluGqZ8Fhxuu7uHUIQ9RNRqdBscOMlgdWms8jR+XRJlxnHWM15H
	2BK5HdEi78sSu239UUre3F/71e1JmggBbcJJgiI9Hr/Otg2bI0QMBd5mIDPAfRBdjaVuZ5Iq61M27
	askQ4n1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMo-0000000ADoZ-1KyE;
	Sat, 24 Jan 2026 12:03:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMN-0000000ADX0-3Mmt;
	Sat, 24 Jan 2026 12:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gjSLvwTgrrP3mUBEhIBlXKbE0FaKi8bZDGULITLn1ns=; b=hjKHJXbXC+96N/9qmkaPgf+mBD
	xomU4bqgPfr1bdkQs0SCjhIcjfq6q7oXp4s3gX+SbRHpsNHLhvYah+s0j7JX8SUdViFVww8HjWktF
	x/fM0TDJC4CoULCE4SzRkGcjaqzWVLP4rWpWdcg2F67uiBQEuLWvvyodIebb0E2PO3nkFqF/zdZXf
	Okp7heCYCe27tf8DJ+rZSkFDGVQT76D15uk3vRYeZ3GqgXABNISvItlsqbSDMhz4dY/f+J7hlH8Av
	fagpQBKBH9afUK12BSSzD0bc8BVwHcyBIPqbAIzFqwOL89IqA9tUVzVf1lvb5RqacTV/zu4k/2H1J
	gjk2y8FA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcMK-00000003V0c-38bt;
	Sat, 24 Jan 2026 12:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769256189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YbikC+ALrBSQocWHTuLrH23sKxTB+si5p4/aJtDHa77DggWIr9rsweZO3g9l8KG3U7OCZ7Cugrp2tqCKcRW6XS/QHA5hL58GQPVFdvnZGVx3SporTEkrO1HkDS0+esxIybHD88noWj6xgIYR9xpDfhQQsxuWH5Gu0HrqatM5iRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769256189; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gjSLvwTgrrP3mUBEhIBlXKbE0FaKi8bZDGULITLn1ns=; 
	b=l/FsYEE+HjHR7XD4QA1Hqmg1Jxk6KdS8Y5U4ISPP0J8n2D4kgfAfK5c4jZkZaGs/6BqTaavnzx20DS7SoZk4CyZrD5s4zWFP807Qz3u96VQeqrCyKwx6qmjYZEGp6vO5uyhfXeX0eUYhQx1TwmSw+IHEmuZQ6GGmuNa3nj6KdVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769256189;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=gjSLvwTgrrP3mUBEhIBlXKbE0FaKi8bZDGULITLn1ns=;
	b=NHMrDp75Hd1Q6Crs52h7Cm902/BigAaK05tO1883aFNM/l6Gt8iXO5zaNYkZy8Bf
	wzvsyBO51fEIQVqQKkdVA0csvgxdrl4wyU36LjVNkPo3+/2PSg5f5fQbL/xJ+zCxKA8
	YKSTQeY8wGkGJQ6ixwYX8YMiKaM3qhtFREn6suKc=
Received: by mx.zohomail.com with SMTPS id 1769256187122724.0072043219542;
	Sat, 24 Jan 2026 04:03:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 24 Jan 2026 13:01:04 +0100
Subject: [PATCH v6 18/24] scsi: ufs: mediatek: Rework
 ufs_mtk_wait_idle_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-mt8196-ufs-v6-18-e7c005b60028@collabora.com>
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
X-CRM114-CacheID: sfid-20260124_120321_185890_15052601 
X-CRM114-Status: GOOD (  19.00  )
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

While ufs_mtk_wait_idle state has some code smells for me (the
VS_HCE_BASE early exit seems racey at best), it can still benefit from
some general cleanup to make the code flow less convoluted.

Use the iopoll helpers, for one, and specifically the one that sleeps
and does not busy delay, as it's being done for up to 5ms.

The register read is split out to a helper function that branches
between new and old style flow.

Every called uses the same 5ms timeout value, so there is no point in
making this a parameter. Just assume a 5ms timeout in the function.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 71 +++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 2b1f26b55782..b5c75d228c85 100644
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
+	/* If the device is already in the base state after 10us, don't wait. */
+	udelay(10);
+	if (ufs_mtk_read_state(hba, old_style) == VS_HCE_BASE)
+		return 0;
 
-	if (wait_idle && sm != VS_HCE_BASE) {
-		dev_info(hba->dev, "wait idle tmo: 0x%x\n", val);
-		return -ETIMEDOUT;
+	/* Poll to wait for idle */
+	ret = read_poll_timeout(ufs_mtk_read_state, val,
+				(val < VS_HIB_ENTER || val > VS_HIB_EXIT), 50,
+				5 * USEC_PER_MSEC, false, hba, old_style);
+	if (ret) {
+		dev_err(hba->dev, "Timed out waiting for idle state, val = 0x%x\n", val);
+		return ret;
 	}
 
 	return 0;
@@ -1389,7 +1378,7 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
 
 	/* wait host return to idle state when auto-hibern8 off */
-	ret = ufs_mtk_wait_idle_state(hba, 5);
+	ret = ufs_mtk_wait_idle_state(hba);
 	if (ret)
 		goto out;
 
@@ -1593,7 +1582,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 		return err;
 
 	/* Check link state to make sure exit h8 success */
-	err = ufs_mtk_wait_idle_state(hba, 5);
+	err = ufs_mtk_wait_idle_state(hba);
 	if (err) {
 		dev_err(hba->dev, "Failed to wait for idle: %pe\n", ERR_PTR(err));
 		return err;

-- 
2.52.0


