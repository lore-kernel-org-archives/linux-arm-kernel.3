Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7DEE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pPnBnrpoX4jcNc+2VNFCuGVvd47YHo00XLBNJ9dyTc=; b=FG/s0r7juUlej2cKT7VptekeAc
	1Kh8Z+evQCOK4aP2rLoxAyXwJj+i8BNUa/VsrkNjQbAhyfRUFkFbihcBIyI8Zw8G0x3ipG+1rEFCf
	/uRxR872aEVuqRS/rmCS93pNlV/UoymD21WdQrYA63arNMBNHMWHd1F7CJYvG/329oSBfd15QqGqK
	vVeGbXnbMo/JR6PP7LtVMTGYh1veO0Xb7tE6ExNCij1n93ZEpKsq4LgpGnTvrW1xIp5B1QiwBcP+r
	ZfOGEj/1376iMEmkLLcxu4iTyEdtmiNB6eyHPjPWikCGg0uKpUd8VNJBRoVFgj9iZNv+zt9dTDgAb
	z7zFe2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIskY-0000000DGlw-3y74;
	Wed, 04 Dec 2024 17:01:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsjY-0000000DGbH-0Ppt;
	Wed, 04 Dec 2024 17:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8963F5C633E;
	Wed,  4 Dec 2024 16:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C56C4CECD;
	Wed,  4 Dec 2024 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331615;
	bh=PrS5dMApRuvYtyE1/G9FbY88WGrmssJalLtkRCLFrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ni5wsxV7DiLLTobBia7tM2LkD/0vkHhNBmNQrL8U+FSNr8LHr23Xt1NsQUE5VRvxg
	 D3Jf7PAo9vR2IvNiodpwx0T0zLRBX8193m9BGijJTGeiJzjwQbY8puCi9D7Qpg4YTi
	 L7RHgp9HK3wiXcHui7VD80Xz6BJtJt7d7F99O7kqEK+H3QbUngbq54x98PRvXdsA0/
	 5VqwMUdADkZ7J4gIGrknoWX/MGanqWbawSIFiQ/jWuJEjwY5ZjvlR4Ejo+/MDkV9ln
	 ty5ZNs/p4DRkveCOMp7z+COn3QLLc+rJpDcSDcK+ebNCSsRvwf9N3A4qoMj83B5tNQ
	 13S3Y7GvlYEoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <Avri.Altman@wdc.com>,
	Peter Wang <peter.wang@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	yoshihiro.shimoda.uh@renesas.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	avri.altman@wdc.com,
	manivannan.sadhasivam@linaro.org,
	ahalaney@redhat.com,
	beanhuo@micron.com,
	quic_mnaresh@quicinc.com,
	ebiggers@google.com,
	minwoo.im@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 13/33] scsi: ufs: core: Make DMA mask configuration more flexible
Date: Wed,  4 Dec 2024 10:47:26 -0500
Message-ID: <20241204154817.2212455-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154817.2212455-1-sashal@kernel.org>
References: <20241204154817.2212455-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_090016_229756_4F80850D 
X-CRM114-Status: GOOD (  17.00  )
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

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 78bc671bd1501e2f6c571e063301a4fdc5db53b2 ]

Replace UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS with
ufs_hba_variant_ops::set_dma_mask.  Update the Renesas driver
accordingly.  This patch enables supporting other configurations than
32-bit or 64-bit DMA addresses, e.g. 36-bit DMA addresses.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/r/20241018194753.775074-1-bvanassche@acm.org
Reviewed-by: Avri Altman <Avri.Altman@wdc.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c      | 4 ++--
 drivers/ufs/host/ufs-renesas.c | 9 ++++++++-
 include/ufs/ufshcd.h           | 9 +++------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 03490f062d63a..5c64ef7334546 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2398,8 +2398,6 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	int err;
 
 	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
-	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
-		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
 
 	/* nutrs and nutmrs are 0 based values */
 	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS_SDB) + 1;
@@ -10314,6 +10312,8 @@ EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
  */
 static int ufshcd_set_dma_mask(struct ufs_hba *hba)
 {
+	if (hba->vops && hba->vops->set_dma_mask)
+		return hba->vops->set_dma_mask(hba);
 	if (hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
 		if (!dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(64)))
 			return 0;
diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 8711e5cbc9680..3ff97112e1f6d 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -364,14 +365,20 @@ static int ufs_renesas_init(struct ufs_hba *hba)
 		return -ENOMEM;
 	ufshcd_set_variant(hba, priv);
 
-	hba->quirks |= UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS | UFSHCD_QUIRK_HIBERN_FASTAUTO;
+	hba->quirks |= UFSHCD_QUIRK_HIBERN_FASTAUTO;
 
 	return 0;
 }
 
+static int ufs_renesas_set_dma_mask(struct ufs_hba *hba)
+{
+	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
+}
+
 static const struct ufs_hba_variant_ops ufs_renesas_vops = {
 	.name		= "renesas",
 	.init		= ufs_renesas_init,
+	.set_dma_mask	= ufs_renesas_set_dma_mask,
 	.setup_clocks	= ufs_renesas_setup_clocks,
 	.hce_enable_notify = ufs_renesas_hce_enable_notify,
 	.dbg_register_dump = ufs_renesas_dbg_register_dump,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 0fd2aebac7286..3fee38029bfee 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -298,6 +298,8 @@ struct ufs_pwr_mode_info {
  * @max_num_rtt: maximum RTT supported by the host
  * @init: called when the driver is initialized
  * @exit: called to cleanup everything done in init
+ * @set_dma_mask: For setting another DMA mask than indicated by the 64AS
+ *	capability bit.
  * @get_ufs_hci_version: called to get UFS HCI version
  * @clk_scale_notify: notifies that clks are scaled up/down
  * @setup_clocks: called before touching any of the controller registers
@@ -340,6 +342,7 @@ struct ufs_hba_variant_ops {
 	int	(*init)(struct ufs_hba *);
 	void    (*exit)(struct ufs_hba *);
 	u32	(*get_ufs_hci_version)(struct ufs_hba *);
+	int	(*set_dma_mask)(struct ufs_hba *);
 	int	(*clk_scale_notify)(struct ufs_hba *, bool,
 				    enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
@@ -622,12 +625,6 @@ enum ufshcd_quirks {
 	 */
 	UFSHCD_QUIRK_SKIP_PH_CONFIGURATION		= 1 << 16,
 
-	/*
-	 * This quirk needs to be enabled if the host controller has
-	 * 64-bit addressing supported capability but it doesn't work.
-	 */
-	UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS		= 1 << 17,
-
 	/*
 	 * This quirk needs to be enabled if the host controller has
 	 * auto-hibernate capability but it's FASTAUTO only.
-- 
2.43.0


