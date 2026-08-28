Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF1AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAhC5u+X8qtlB8wYqtu9QCaLKjFEwuCvzDdatq9xa+w=; b=lOgotFrR6bvZs/C244o5s5k/z2
	XgXhiGodAeZ1TDJolgDIE+p5KeDfVB575I99+MZ1BESg/a3eiZMG/2POZQprDaz7pmZjRXS+KveVC
	QbOWJKppfaRwGENJzqbe6x3MWDL9iOqXXrRUrMKpARv+IynLL0orEcUqXSvjJjBP1z19JqeLTagQ+
	Ym3Hv+hcMVAG1A42q2fDGbuclxRTv45wnHWoniCuveIltZlUtAHkyS3TOvcx1bKvuJJP/18w58m/z
	3qfhpD0DQRd0HBL0d3KHfjUEM5pZrzdUzswGSEfms8/y8PL13Rj4UUga99juHgmKyStCjYemE2BKi
	zOBdtHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsnu-00000005Ss3-1dZA;
	Fri, 28 Aug 2026 09:23:18 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsnr-00000005SrL-4C3S;
	Fri, 28 Aug 2026 09:23:17 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAC3wT+BU5Fqb1d1Bg--.60494S2;
	Fri, 28 Aug 2026 17:23:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Peter Wang <peter.wang@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] scsi: ufs: mediatek: Handle mPHY power-on failures
Date: Fri, 28 Aug 2026 17:23:11 +0800
Message-ID: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3wT+BU5Fqb1d1Bg--.60494S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr45WF1rGr1kGw4xtF1fZwb_yoW5JF1Dpa
	ykKrWqyr1kWayI9F42gF4293WFg3yrGrW8Gr13Cw1I93ZxKrZFqFykKa4xWF1ftryrAa47
	tF4xta47GanI9wUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUDOz3UUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_022316_397389_748DA078 
X-CRM114-Status: GOOD (  12.29  )
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

ufs_mtk_mphy_power_on() enables the optional VA09 supply before powering
on the mPHY.  The PHY result is ignored, so a failure leaves VA09
enabled and records mphy_powered_on as true, suppressing later retries.
The initialization path also ignores the helper result and continues
setting up the host.

Check phy_power_on(), turn VA09 back off on failure, and leave the state
flag unchanged.  Propagate the helper error from initialization as well
as the existing resume caller.  Keep regulator and mPHY diagnostics on
separate paths so regulator errors are not mislabeled.

The issue was identified via static analysis and manually reviewed.

Fixes: 561e3a8726b2 ("scsi: ufs-mediatek: Fix unbalanced clock on/off")
Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/ufs/host/ufs-mediatek.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 814c1b7343b9..9d481147ea38 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -509,6 +509,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct phy *mphy = host->mphy;
 	struct arm_smccc_res res;
+	int rollback_ret;
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
+				rollback_ret = regulator_disable(host->reg_va09);
+				if (rollback_ret)
+					dev_warn(hba->dev, "failed to disable va09 after mphy failure: %d\n",
+						 rollback_ret);
+			}
+			dev_info(hba->dev, "failed to enable mphy: %d\n", ret);
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
-- 
2.43.0


