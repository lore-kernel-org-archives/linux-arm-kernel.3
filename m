Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C82C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 02:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wW387liaDfKgRKlT0p7gipr9d1CvSHvK4paGXsiSkps=; b=gz/C0QMkyML4hFsIEGxI0pQ8b9
	vpwOsd7IkRbzLt9eKaQfVpski4t59Wi8xVYRABMMKVOHvh16XUUU2Ytdz2Qiw0BRlTirpkcNuQOM+
	pNcg5vPAdNT7YUJKQwZ6Rxd4U+WJmPvfku1u8UXrLnzH0wHGtRiGzQMkUG+1nsVvO5m907h0xLImK
	G/a2mxhZ4Ts+etAlYHN8xAdFISHmxlkUL7bVjgZWO0/2e79rsMpTD99Yn1WYsQdWxzqPHnSLaaUz8
	fPTg07i4m8xhyfNhoYi7DgNY8YAxksW6orsYHNlwkTjGdTRZC1Q/PaQEHcT35rw4OLSskhzlzND0X
	3WjKjNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfq92-000000086bn-3vL3;
	Sat, 04 Jul 2026 02:30:16 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfq8y-000000086bC-2MjU;
	Sat, 04 Jul 2026 02:30:16 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wDnRGUccEhqcfwAAA--.2374S3;
	Sat, 04 Jul 2026 10:29:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app3 (Coremail) with SMTP id zS_KCgBHX3EccEhqsXnSAg--.57888S2;
	Sat, 04 Jul 2026 10:29:48 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: jacob-chen@iotwrt.com,
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m state
Date: Sat,  4 Jul 2026 02:28:53 +0000
Message-Id: <20260704022853.77291-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zS_KCgBHX3EccEhqsXnSAg--.57888S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?1fenegXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnZPoDCNGYdHSfuFmYJL54WMW8oo9eGBl9HV1ffwa75uvyjPqD135tOeKyPoHGu9vCRko
	yEpxb8kBGLspYd32l0yp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxCF1fKr47uw1rAF4DAr4xGrX_yoW5Xw4rpa
	n8AayIkFWUGF4UWw1DJa1DuFZ5twnayay5GF4fG34xCF9akryqq348AFyFvr9xXr97AFW2
	vw45t3yrXF4jqFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Cb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjx
	CEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAF
	wI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwACjcxG0xvY0x0EwIxGrVCF72vEw4AK0wCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_193013_366606_E6CE37F8 
X-CRM114-Status: UNSURE (   9.73  )
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

rga_probe() requests the interrupt with devm_request_irq(), so devres
does not release the IRQ until after rga_remove() returns. rga_remove()
currently releases rga->m2m_dev before that point.

rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
leaving a window where an interrupt can run after the m2m device has been
released.

Unregister the video device first to stop new userspace submissions, then
free the devm-managed IRQ explicitly before releasing the m2m device. Move
the command buffer release after the IRQ teardown as well, so it is not
released while a completion interrupt can still arrive.

Store the IRQ number in struct rockchip_rga so rga_remove() can free the
IRQ without looking it up again.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

---
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 43f6a8d..118887a 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -828,6 +828,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	rga->irq = irq;
+
 	ret = devm_request_irq(rga->dev, irq, rga_isr, 0,
 			       dev_name(rga->dev), rga);
 	if (ret < 0) {
@@ -919,13 +921,21 @@ static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
-	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
-		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
-
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
 
-	v4l2_m2m_release(rga->m2m_dev);
 	video_unregister_device(rga->vfd);
+
+	/*
+	 * The IRQ was requested with devm_request_irq() and is freed by devm
+	 * only after this function returns. Free it explicitly here, after the
+	 * video device is unregistered, but before v4l2_m2m_release() frees
+	 * rga->m2m_dev, which rga_isr() dereferences via v4l2_m2m_job_finish().
+	 */
+	devm_free_irq(rga->dev, rga->irq, rga);
+
+	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
+	v4l2_m2m_release(rga->m2m_dev);
 	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(rga->dev);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 72a28b1..f76c45b 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -81,6 +81,7 @@ struct rockchip_rga {
 	struct device *dev;
 	struct regmap *grf;
 	void __iomem *regs;
+	int irq;
 	struct clk *sclk;
 	struct clk *aclk;
 	struct clk *hclk;


