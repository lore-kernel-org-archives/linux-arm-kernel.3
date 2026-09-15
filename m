Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A0BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 03:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cg7BjXQsPJW6OHMuCBfATLvuEeL8ik/U3coKCoyf238=; b=AP51b3mtFNtL7tEvR2j+o2nCSz
	bHVjXsvOGvvWojs7XKK63y41FdwU54TGx335bwgifYJjtZIuYO3dzWckOHh0vH2VgHqUV3crFG7BF
	8tDjK0BKJ2B5gHVeuqppFwHJMfPZTVA0j1pTUa1G6oPc/Oj6j7uJ5kh5LFVeZ20Rwg4qadOU5q2HS
	lGmxVcRqIe8GkGRbQVzVDGEhx0upEAwOvVlm5zcCasCp3MflFBFk9Yomhvu+GOR/F5+2z21c+k4gc
	Bfe7gDZuAKpxBeOy0/LlPHqNVFZw+bPpgKDOKbOPmT+RRO9vfgqY8l+gIKaGhTriuqoc1A2oozDbY
	kT04nkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KF8-00000005A0p-2lps;
	Tue, 15 Sep 2026 03:54:02 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KF3-00000005A03-3uam;
	Tue, 15 Sep 2026 03:54:01 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXLvJSwahqw9QHCA--.5267S2;
	Tue, 15 Sep 2026 11:53:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] Bluetooth: btmtksdio: Fix runtime PM leak in btmtksdio_shutdown()
Date: Tue, 15 Sep 2026 03:53:25 +0000
Message-Id: <20260915035325.1724227-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXLvJSwahqw9QHCA--.5267S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GFW3JFy5CF13Kw47Jr4ktFb_yoW8Jryfpr
	Wq9FyayFZavw42yFn7JanaqFWYv34YqrW8Kry0934rur4rJayIyF15tryYq3WSkrWkCw45
	A3Z2qFWfGFnFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU19Xo7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMLA2qoi9j4JwAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_205358_342001_9A249A26 
X-CRM114-Status: UNSURE (   9.32  )
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

btmtksdio_shutdown() takes a runtime PM reference with
pm_runtime_get_sync(bdev->dev), which leaves the device's usage
count incremented even when it fails.  If the WMT func-ctrl command
fails to send, mtk_hci_wmt_sync() returns a negative error and the
function returns immediately, skipping the pm_runtime_put_noidle()
at the ignore_wmt_cmd label, so the reference is leaked.

Drop the reference with pm_runtime_put_noidle() before returning
the error to keep the usage count balanced.

Fixes: 7f3c563c575e ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/bluetooth/btmtksdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 243215a81fa7..dfb61653a878 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1231,6 +1231,7 @@ static int btmtksdio_shutdown(struct hci_dev *hdev)
 	err = mtk_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+		pm_runtime_put_noidle(bdev->dev);
 		return err;
 	}
 
-- 
2.34.1


