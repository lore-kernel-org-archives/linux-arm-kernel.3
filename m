Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0395CCA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1/kWln4aguinhSKJL+sRTc11ExP8I158//lpEFf0hFk=; b=3V4tFmHK4CIh37p1BHo4xl79Dx
	GOn/KduZIF5bSPUiqipmee+JmyS8xC+TYIOjzGbRjsGtPe2ghk8x2rJKWYGYXoAepVBHP3WlX8RLq
	6MIj2oWFvh/KwltQtdm/N2Fu3TGjX4/l7lIgfiAB0ZQXb6nLL+GaosgccbAc/5ZJnBx7wUHAtDxgO
	QkuyjFaL7BkUtpvpMyRuDYDKviYSYHk64n6KnvJzn0STb/kIRky9bZM0r5fZfvgwtJ0mg5tP3pVGZ
	Hr+rIkQBXoMLO+YkrDUJei8EKN8l3ueExGHW8924C6PodmsMD7BjyaE52nyrdaZDiDzy1BVgu8pLs
	EbbivOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsAC-00000004o8R-13tL;
	Thu, 08 Oct 2026 17:44:16 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsA8-00000004o82-33SX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:44:14 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADX3Dpp1sdqpZYPCg--.13859S2;
	Fri, 09 Oct 2026 01:44:10 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/mchp-eic: fix clk reference leak on probe error paths
Date: Fri,  9 Oct 2026 01:44:12 +0800
Message-Id: <20261008174412.2740045-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX3Dpp1sdqpZYPCg--.13859S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFykCw1ktryrXr4fKrWUXFb_yoW8Wr1xpF
	W7Ja9avFZ7GFWF9r4DJw4kZry5Kw4ayFWxG3yfC3ZFqwnxJryjyFWFya4DZr45AFWxG3WU
	Gws0qFykAFyDZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jrManUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAOA2rHpfVxuQAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_104413_157058_8BC2612A 
X-CRM114-Status: GOOD (  13.32  )
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

mchp_eic_probe() acquires the peripheral clock with
of_clk_get_by_name(), which takes a reference on the underlying struct
clk, but the error paths only call clk_disable_unprepare() and never
clk_put(). When clk_prepare_enable() fails, or when of_irq_parse_one(),
the IRQ argument validation or irq_domain_create_hierarchy() fails, the
probe function jumps to the cleanup labels, frees the private data and
returns with the clock reference still held.

Release the clock reference with clk_put() on all error paths that occur
after the clock has been successfully looked up.

Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/irqchip/irq-mchp-eic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index be007d325e67..5250e6baff63 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -233,7 +233,7 @@ static int mchp_eic_probe(struct platform_device *pdev, struct device_node *pare
 
 	ret = clk_prepare_enable(eic->clk);
 	if (ret)
-		goto unmap;
+		goto clk_put;
 
 	for (i = 0; i < MCHP_EIC_NIRQ; i++) {
 		struct of_phandle_args irq;
@@ -270,6 +270,8 @@ static int mchp_eic_probe(struct platform_device *pdev, struct device_node *pare
 
 clk_unprepare:
 	clk_disable_unprepare(eic->clk);
+clk_put:
+	clk_put(eic->clk);
 unmap:
 	iounmap(eic->base);
 free:
-- 
2.25.1


