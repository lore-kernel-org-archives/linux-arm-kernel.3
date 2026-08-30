Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E162DC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/uyWwAcSWtJ953qIkShDcLqeW5T13kceQvolIuNIxU=; b=1HsnYQimmR9VLEvyWo1o7EsgnA
	eVPoa08j9gmo5zx8zYM9xj/C5qTFlB3wGBCEGJ7am/+VgETTkJR221hyjPXW/XE16RwFTCoETvY1Y
	jWazn8sYAdpn8unfJEJeocbSBYnaBwMS50CVLqNvlgbKmChUFZYrHdYPePJY5YIPRBv1HYJrLIuTd
	mWoo06G1xm3zYoBhnE5n1fz0wl98JEM5vw3WQ8tWzbuJmFPryzMAsy/ueEArV4YA3ETveLqc5VYyw
	/3X357USJ8LGNSKeIIPTSeBCxXYw7QodtpI4yR4p0tf9cwH59J8kZgnYrUI66sx2OWrCNEWpY3xOM
	oDle3L0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fZM-00000007ku5-0bIg;
	Sun, 30 Aug 2026 13:27:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fZJ-00000007ktj-2ohp;
	Sun, 30 Aug 2026 13:27:31 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABHUD6+L5RqwBebBg--.40350S2;
	Sun, 30 Aug 2026 21:27:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	"Martin K . Petersen" <mkp@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ufs: rockchip: propagate controller reset errors
Date: Sun, 30 Aug 2026 21:27:23 +0800
Message-ID: <20260830132723.5855-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABHUD6+L5RqwBebBg--.40350S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1xAF4fZrWkuF18AFWrXwb_yoW8KF45pF
	s8C3y3tr1DKF43XFZ7trn3A3WFqan3Kw47J397Ga4fAw1xtw1UWa4vkF1FqF4Dtry5ZFy5
	uF43Ja48uanFqrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbo5l5
	UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_062730_074945_2F303391 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

The Rockchip UFS reset helper discards reset-controller errors before
probe, HCE enable, and runtime resume continue as if the controller were
reset.

Return reset errors from the helper and unwind the resume clock on failure.

Fixes: d3cbe455d6eb ("scsi: ufs: rockchip: Initial support for UFS")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/ufs/host/ufs-rockchip.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
index bac68f238e1c4..3b9661befe6ae 100644
--- a/drivers/ufs/host/ufs-rockchip.c
+++ b/drivers/ufs/host/ufs-rockchip.c
@@ -20,11 +20,16 @@
 #include "ufshcd-pltfrm.h"
 #include "ufs-rockchip.h"
 
-static void ufs_rockchip_controller_reset(struct ufs_rockchip_host *host)
+static int ufs_rockchip_controller_reset(struct ufs_rockchip_host *host)
 {
-	reset_control_assert(host->rst);
+	int ret;
+
+	ret = reset_control_assert(host->rst);
+	if (ret)
+		return ret;
 	udelay(1);
-	reset_control_deassert(host->rst);
+
+	return reset_control_deassert(host->rst);
 }
 
 static int ufs_rockchip_hce_enable_notify(struct ufs_hba *hba,
@@ -46,9 +51,7 @@ static int ufs_rockchip_hce_enable_notify(struct ufs_hba *hba,
 	}
 
 	/* PRE_CHANGE */
-	ufs_rockchip_controller_reset(host);
-
-	return 0;
+	return ufs_rockchip_controller_reset(host);
 }
 
 static void ufs_rockchip_set_pm_lvl(struct ufs_hba *hba)
@@ -167,7 +170,9 @@ static int ufs_rockchip_common_init(struct ufs_hba *hba)
 		return dev_err_probe(dev, PTR_ERR(host->rst),
 				"failed to get reset control\n");
 
-	ufs_rockchip_controller_reset(host);
+	err = ufs_rockchip_controller_reset(host);
+	if (err)
+		return dev_err_probe(dev, err, "failed to reset controller\n");
 
 	host->ref_out_clk = devm_clk_get_enabled(dev, "ref_out");
 	if (IS_ERR(host->ref_out_clk))
@@ -291,7 +296,11 @@ static int ufs_rockchip_runtime_resume(struct device *dev)
 		return err;
 	}
 
-	ufs_rockchip_controller_reset(host);
+	err = ufs_rockchip_controller_reset(host);
+	if (err) {
+		clk_disable_unprepare(host->ref_out_clk);
+		return err;
+	}
 
 	return ufshcd_runtime_resume(dev);
 }

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1


