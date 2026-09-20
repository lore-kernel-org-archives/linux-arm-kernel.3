Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DDFC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elh06BPvOR+aqBWG+a9YMejfiEndb0cqDcnnH29KM38=; b=WZU1SGcZBurbRu5hvqaXvqe7yH
	uVgJLMml7YYEyjTXphNJvn1uuuCRkwbuU7BsY677JwcwHg1MgMRgI+HD4Jym7RM57EAeHp18rQrDc
	zNTZoXmCx4XaqZWPjcAuz98dPNNXxYOBdrzu7g39g/QV9u3BWDwiJFO9eh0MdFwFOXsQzYxaFroXf
	jsW8L9FwHgQ+Hn7H0yaVtNRTUXAEe8kUPupRkS/rVfkD+KTWYFihe6ZpdbRE02sh6yVaAYFlVGprd
	gI8MrE4SqwhuNoj2DXGOfZgGSRXXQnS/E+ylqXfPtludYwoS8WZejDV1NuzO98A4ftV1I1Fz2x1Jf
	wcjMUUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Zq-0000000Gq7E-0Gyb;
	Sun, 20 Sep 2026 03:50:54 +0000
Received: from mail-proxy49146.mail.163.com ([45.254.49.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Zn-0000000Gq6i-2rg0;
	Sun, 20 Sep 2026 03:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=el
	h06BPvOR+aqBWG+a9YMejfiEndb0cqDcnnH29KM38=; b=Rogi/3MPytkdsgRYNH
	vE6a4yjT61PA14Mi1gV6dkVW6rzhPLimfOI8jsPvEYLyFGHVYFawAEjv4AUPBxuD
	vqPav87lekW35xCb/izz1WNazgxoYbYDtvmTku3rRlfyFLtOOufdRYB/SXHJ6D0F
	mPV54ZP7vsJVD3gXaPweDTNzs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXJ4jiV69q2YnYBg--.30633S2;
	Sun, 20 Sep 2026 11:49:55 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: peter.wang@mediatek.com
Cc: chaotian.jing@mediatek.com,
	chu.stanley@gmail.com,
	james.bottomley@hansenpartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	stanleyjhu@google.com,
	hppiscas@163.com
Subject: [PATCH v2] scsi: ufs: mediatek: handle mPHY power-on failures
Date: Sun, 20 Sep 2026 11:49:53 +0800
Message-ID: <20260920034953.19535-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXJ4jiV69q2YnYBg--.30633S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4xKw43JrW5tr1fJw43Wrg_yoW5GryDpa
	93K3yqkr1kGrWIvF429FsF93WrW3yfGFy8Gr13Cw1I93W2gr9FqFyvkryfWF4SyrZ5A3yj
	qF18ta47GanIvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRY0PhUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgOUXWqvV+O6XwAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_205051_947582_E79EADCE 
X-CRM114-Status: GOOD (  11.31  )
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

The MediaTek helper enables VA09 before powering on the mPHY, but
ignores the PHY result. A failure can leave VA09 enabled and publish
mphy_powered_on as true, so a later power-on attempt is skipped.

Check phy_power_on(), attempt to unwind VA09 on failure, and leave the
state flag unchanged. Propagate the helper result from host
initialization as well as its existing resume caller. Keep the original
PHY error if the supply rollback also fails, and report that rollback
separately.

The issue was found by our static-analysis tool.

Fixes: 561e3a8726b2 ("scsi: ufs-mediatek: Fix unbalanced clock on/off")
Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260828092311.10774-1-pengpeng@iscas.ac.cn/
Use err for the rollback result and dev_err() for operation failures, as
Stanley requested.

 drivers/ufs/host/ufs-mediatek.c |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 814c1b7343b9..12a6d4138e44 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -509,6 +509,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct phy *mphy = host->mphy;
 	struct arm_smccc_res res;
+	int err;
 	int ret = 0;
 
 	if (!mphy || !(on ^ host->mphy_powered_on))
@@ -523,7 +524,18 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 			usleep_range(200, 210);
 			ufs_mtk_va09_pwr_ctrl(res, 1);
 		}
-		phy_power_on(mphy);
+		ret = phy_power_on(mphy);
+		if (ret) {
+			if (ufs_mtk_is_va09_supported(hba)) {
+				ufs_mtk_va09_pwr_ctrl(res, 0);
+				err = regulator_disable(host->reg_va09);
+				if (err)
+					dev_err(hba->dev,
+						"failed to unwind va09: %d\n", err);
+			}
+			dev_err(hba->dev, "failed to enable mphy: %d\n", ret);
+			return ret;
+		}
 	} else {
 		phy_power_off(mphy);
 		if (ufs_mtk_is_va09_supported(hba)) {
@@ -1295,7 +1307,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	 *
 	 * Enable phy clocks specifically here.
 	 */
-	ufs_mtk_mphy_power_on(hba, true);
+	err = ufs_mtk_mphy_power_on(hba, true);
+	if (err)
+		goto out_variant_clear;
 
 	if (ufs_mtk_is_rtff_mtcmos(hba)) {
 		/* First Restore here, to avoid backup unexpected value */

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)


