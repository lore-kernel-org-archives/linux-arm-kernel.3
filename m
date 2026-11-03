Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF69606EE9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SZVlo2at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kjNW/BEZIJiWpD0QSBrblYoaP+4qh7Pt18KlmN+Uc64=; b=SZVlo2atNjzn/nam8e+4/tNX52
	BhWyRFSSOT0nMP2Z8s88hqZRKr5culQvhGMPYlROwrZ+l/3BHFtYO7P6He/MUaHjIrEws+NI2qsP3
	16uOtOIj4oknRok6ANOPRRM63h15Vagp8mpo6WfQr0+d1Ef1nj29Ibnfpr08Yi4TqjSfI33yYlDcP
	0N1f8JMFNvdIsqiI5UfrL1YswI39G+y436TPRLxBDQf1I5n54uUUiFPumF8DowONQ4g3kQPDUotrm
	nfxmPhbtDhvjFoTCDGOoQwS54oPz4InQweOacuQm3Gf8Elh8t7qIn/dkOJqQlkG2Y1tqwmp27O1MC
	gICv8SHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB5n-00000001niF-0O3i;
	Tue, 03 Nov 2026 09:46:11 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB5j-00000001nde-1f34;
	Tue, 03 Nov 2026 09:46:09 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADX4JFbrelqmk47AA--.2367S2;
	Tue, 03 Nov 2026 17:46:03 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: Release the decoder device on job completion
Date: Tue,  3 Nov 2026 09:46:12 +0000
Message-Id: <20261103094612.1289250-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX4JFbrelqmk47AA--.2367S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1xGF4rCr1kury5AF1kKrg_yoW8tw1Dpr
	W5K3yjkryUGr4jqF18WF1UZFyYkrZ3JrWY9FW7X34xW39xXF1rtry09a4IqFZ2yrWI9a4D
	Jr1jqa97CF4jyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU7TmhDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAAA2rpnIRROAAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014607_933680_0645BE03 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_jpegdec_worker() resumes the component device represented by
comp_jpeg[hw_id]->dev.  When the job completes,
mtk_jpegdec_hw_irq_handler() drops a reference to the master device
ctx->jpeg->dev instead of the component device.  The component's usage
counter is never decremented, so the component and its power domain stay
powered, while the master's usage counter is decremented without a
matching reference.

Release jpeg->dev, the component device that was resumed, and disable
the clock before dropping the reference as the timeout work already
does.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 32372781daf5..017c9b5401c6 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -547,7 +547,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	enum vb2_buffer_state buf_state;
-	struct mtk_jpeg_ctx *ctx;
 	u32 dec_irq_ret;
 	u32 irq_status;
 	int i;
@@ -557,7 +556,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 
 	cancel_delayed_work(&jpeg->job_timeout_work);
 
-	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -580,8 +578,8 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
-	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
+	pm_runtime_put(jpeg->dev);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
-- 
2.34.1


