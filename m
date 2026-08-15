Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1748C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ouaHJhplnHCADze6y8BxHpbB8lgiZlHM7mqdl+IZ2ZY=; b=NBnzsptWSg8u7mGtCHALF1q2a4
	MPqRARCo/wKLgOoHavnzO3uVEN989cyjgtUOmkcSDjetcOyGnPUiY3+I89AZiiw13Dz9ez+k4xEUy
	vAM8fQLuSYyXd/xzPJv4WfPKfcqfVX/oOUCn94/qTyYHmu2JplrIAoA0DHCsPYc7UqOz9fJV3yi+c
	R61qut5UoniK/QwTUN7HSpc5wCHN7r+RpBle9LPFefajGj0RMXWaTalhzJRkZidKjZ5UVOadia+0C
	MXtlp6fIa5Jd6F7u5RNEM4VaSu/3QpoIx/45r4QA7yV+xEdWZjQyVT052KDaDX47vXlqv64y9qSOf
	DvScrbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvElp-00000003rRX-0lsW;
	Sat, 15 Aug 2026 13:49:57 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvEll-00000003rR3-2P4B;
	Sat, 15 Aug 2026 13:49:55 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowADnUDt9boBqQGPRBQ--.3894S2;
	Sat, 15 Aug 2026 21:49:50 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: bin.liu@mediatek.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Irui Wang <irui.wang@mediatek.com>,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] media: mediatek: jpeg: retry HW selection after successful wait
Date: Sat, 15 Aug 2026 21:49:49 +0800
Message-ID: <20260815134949.49042-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADnUDt9boBqQGPRBQ--.3894S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rWFW8ury5ury8XFykuFg_yoW5JFW5pr
	WYg39I9rW8KrsFgrW8Aa17ZFy5Gr1rCF4xGrn8Zw4xA3yaqF1DJw1UAa40qFWxAr12kay3
	JF1Fg393AFWjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_064954_325664_24949DE9 
X-CRM114-Status: UNSURE (   9.94  )
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

wait_event_interruptible_timeout() returns a positive value when its
condition becomes true before the timeout. mtk_jpegdec_worker() treats
every nonzero result as a failure, so a normal decoder wakeup finishes
the mem2mem job as though no hardware became available.

Handle interrupted waits and exhausted timeout retries separately, and
retry hardware selection after a successful wakeup. Increment the retry
count only for actual timeouts. The encoder uses
wait_event_interruptible(), whose successful return is zero, so its
existing check is correct; leave that separate no-timeout policy
unchanged.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
https://lore.kernel.org/all/20260720115322.89784-1-pengpeng@iscas.ac.cn/
- add the Fixes tag
- revalidate the decoder-only change against current mainline
- add the required coding-assistant attribution

Changes since v1:
https://lore.kernel.org/all/20260625003142.99598-1-pengpeng@iscas.ac.cn/
- split interrupted waits, timeout exhaustion and successful wakeups
- use distinct diagnostics and explain why the encoder path is unchanged

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

base-commit: dac3e89a2c90c2feeb471e1f22a2512ad424b792
-- 
2.50.1 (Apple Git-155)


