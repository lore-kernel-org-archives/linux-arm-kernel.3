Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E9A10F2863
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3Z1bpysXFgVp4e9xw/b5VJWuv2b/g8k2qTBBT/7+ro=; b=eidtkCmHJfNp5YmC5eMY07VJig
	VKJ+EkU/u2huALX63g7D3CQ0LJV572a/3sTTr/Xu0AFrYgoYOAlwTALd93/ATaj9PWBYn8leBo3MY
	l1stPiOkdSo31qciEnffEWF2Uh9abwoCHDQ9nZipCmF5nRxtCBFNgAaL++I7CuoCFeNf2+9KN365a
	1LbLtlNe6fJ0dEvGz9LFfxscq/CyuwWinJ2pI79+ckl04sc6xUVAjXNCj9taX3auzVs9XOqJIkMd8
	/Fnww8/rLk7il36pe7oXZY/pC4AdZ4xiOTVUAvWiVOj1w0oiqbncDW8fRZRkQpfqjJ0cdZDrzE2Z2
	8Q9WYDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZp-00000007ukp-3DqH;
	Fri, 27 Mar 2026 18:06:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZf-00000007ufV-46o6;
	Fri, 27 Mar 2026 18:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6745760054;
	Fri, 27 Mar 2026 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A763C19424;
	Fri, 27 Mar 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634783;
	bh=SQ5nAKYuYrS/ghYaKZeLV4R3AbXgYqFqYO/0dF0j/aU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J62FzuDyQjAfe2CmByAg/9OicqC2Qhlin0Mt4N0DNcl+PmdXmHgqQx44jcszbDvCj
	 jceQqQMCDX25i6FZgPh+SrGMaqOQqPRgrPhh1+L66qoPe5FiCHF32GZH82wZ4WRo7W
	 gM7OSb3VonUawBh+29f4TWYawkkjGx8RErbrVg9CFPAO9ol794Yxs7BenPI6eaJ7Fa
	 U6gsXTpKIoohcmIOlKtpbozydS7QZZ3JVplEvu/xfmlQO/mA1p50ZXG2NY1Jv0Ai5g
	 Ca342+DpnJSnEDawEFITMl3C94xsRMInfCF3I2tOYS21BEIdudgBHkw4uxYOtneP6j
	 AL22MLxGmQXWw==
From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH resend v1 7/7] clocksource/drivers/mediatek: Convert to module support
Date: Fri, 27 Mar 2026 19:05:59 +0100
Message-ID: <20260327180600.8150-8-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327180600.8150-1-daniel.lezcano@kernel.org>
References: <20260327180600.8150-1-daniel.lezcano@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now the TIMER_PDEV_DECLARE() allows the driver to be compiled as a
module. Add the MODULE_DESCRIPTION and the MODULE_LICENSE left for the
one converting the driver as a module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
---
 drivers/clocksource/timer-mediatek.c | 29 ++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..f5de5f397730 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -215,8 +215,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -281,7 +280,7 @@ static struct timer_of to = {
 	},
 };
 
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct device_node *node)
 {
 	int ret;
 
@@ -302,7 +301,7 @@ static int __init mtk_syst_init(struct device_node *node)
 	return 0;
 }
 
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct device_node *node)
 {
 	int ret;
 
@@ -337,5 +336,23 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	int (*probe_func)(struct device_node *node);
+
+	probe_func = of_device_get_match_data(&pdev->dev);
+
+	return probe_func(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible =  "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible =  "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+TIMER_PDEV_DECLARE(mtk_timer, mtk_timer_probe, NULL, mtk_timer_match_table);
+MODULE_DESCRIPTION("Mediatek timer driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


