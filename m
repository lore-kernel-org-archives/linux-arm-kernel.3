Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DE9C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fZfIR0xEAZOFXbzSMIDRPOwa8N9R3psoROjzWoX6L34=; b=UD5U3pzoLS7pJ+kL7MVEAlwnw3
	+PdBQYvImDyPgkBB/NC3AHFmDGjgeqUri/eIdX4NFhtF2g5BnSZpMs6vIDMCd7dN7uzU4ZBPdEpxD
	rLKxe4rQ68TWwX1gD+P91vVp0bYomWtgR6BfAm4jn+LjRwAugqLRTyTAK5O/hlvc+mufJIet82L7w
	RDah56wMJtFfSxDcm34OS2YTO08R/e/aFehAFDlDBxC4mYDzcm3Dw4lav/hJlv9IDmr1eLwSdupwH
	BjxPMk9aPbTf945rG4HEEx2ZtQNmDKQKLksBdOG0xuiM0l2qGo9RiEaoGRUmJyf0Uud/OhIXsvAzg
	pUJRi3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmYq-00000006duS-2KWt;
	Mon, 20 Jul 2026 11:53:28 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmYn-00000006dtd-1S8V;
	Mon, 20 Jul 2026 11:53:27 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADHND8yDF5qtcmIAA--.52459S2;
	Mon, 20 Jul 2026 19:53:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: mediatek: jpeg: retry HW selection after successful wait
Date: Mon, 20 Jul 2026 19:53:22 +0800
Message-ID: <20260720115322.89784-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHND8yDF5qtcmIAA--.52459S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rWFyftryxJF1fXFyftFb_yoW8ZFWxpr
	W5K39IvrW8Gr4qgr48Aa1UAF15Gw1rCa1xWrnxZw48ArsIqF1Dt3WUta48tFyxAFy2ka45
	JF1FvayfCrW2yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUOuc_DUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_045325_751697_3418E75B 
X-CRM114-Status: GOOD (  10.24  )
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

wait_event_interruptible_timeout() returns a positive value when its
condition becomes true before timeout. mtk_jpegdec_worker() treats every
nonzero result as failure, so a normal decoder wakeup can finish the
mem2mem job as though no hardware became available.

Handle an interrupted wait and exhausted timeout retries separately, and
retry hardware selection after a successful wakeup. The encoder uses
wait_event_interruptible(), whose successful return is zero, so this change
does not alter its separate no-timeout waiting policy.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
- split interrupted waits, timeout exhaustion and successful wakeups
- use distinct diagnostics and explain why the encoder path is outside this
  fix
- rebase onto v7.2-rc4

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..9634c95aaada 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1697,9 +1697,15 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		ret = wait_event_interruptible_timeout(jpeg->hw_wq,
 						       atomic_read(&jpeg->hw_rdy) > 0,
 						       MTK_JPEG_HW_TIMEOUT_MSEC);
-		if (ret != 0 || (i++ > MTK_JPEG_MAX_RETRY_TIME)) {
-			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
-				__func__, __LINE__);
+		if (ret < 0) {
+			dev_err(jpeg->dev, "decoder HW wait interrupted: %d\n",
+				ret);
+			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+			return;
+		}
+
+		if (!ret && i++ > MTK_JPEG_MAX_RETRY_TIME) {
+			dev_err(jpeg->dev, "all decoder HW are busy\n");
 			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 			return;
 		}


