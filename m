Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E85CCFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21RvA6U03of+vOoSNEOHJ12MpJHMWvQkQrUZKv668QE=; b=WWipGYiA5WiTayc20P34xJpb9k
	JazY6qTC9kJ673kWCDkGySIm9gfKzUINv2QF97fMSCUMScTy5NoYO9d5+Wv30f9VNu2q2Dhv7rg0a
	4CpBzmVAtUe7H8NNJuyiwlQwn1EBQUCV9DpALPyBr/BrJJypbF8hO4vbDZMDnLoL+j8fup5uHsIsb
	DqUbx6LWW1zEBAJkM8CyZuGZxroD+7qMX/MBhdUgSCGAiFRdBqbB4Kfhwon0hybJq1ny1CZpMHUGd
	BmOD7aB+FUfYh9AVlVSe6tHrymWOphDYsdoW5s8gpHpokUSAZsNpHLldjUTWHf5zEi2AbcKWq2rhg
	14h9uH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNCGi-0000000AWMp-2IsV;
	Sun, 23 Nov 2025 15:44:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNCGe-0000000AWME-3gGO;
	Sun, 23 Nov 2025 15:44:51 +0000
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-01 (Coremail) with SMTP id qwCowACHHs7WKyNp9PPEAQ--.7449S2;
	Sun, 23 Nov 2025 23:44:25 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	laura.nao@collabora.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] clk: mediatek: Fix error handling in runtime PM setup
Date: Sun, 23 Nov 2025 23:43:15 +0800
Message-ID: <20251123154315.1564-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHHs7WKyNp9PPEAQ--.7449S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4rZFy8ZF47Gr1rGryfJFb_yoW8Ar43p3
	yIqFy3CFW8G34qqr4kJw1DuFy5u3yxKry5Gr95uwn7Zwn3Ca1Iya4rJasFqF109rWkWFy7
	JryDtayxCF1jvFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [114.245.38.183]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcPA2kjIrUBggABsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_074449_304076_277DAA5D 
X-CRM114-Status: GOOD (  10.84  )
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

devm_pm_runtime_enable() can fail due to memory allocation. The current
code ignores its return value, and when pm_runtime_resume_and_get() fails,
it returns directly without unmapping the shared_io region.

Add error handling for devm_pm_runtime_enable(). Reorder cleanup labels
to properly unmap shared_io on pm_runtime_resume_and_get() failure.

Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/mediatek/clk-mtk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ba1d1c495bc2..644e5a854f2b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -497,14 +497,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 
 
 	if (mcd->need_runtime_pm) {
-		devm_pm_runtime_enable(&pdev->dev);
+		r = devm_pm_runtime_enable(&pdev->dev);
+		if (r)
+			goto unmap_io;
 		/*
 		 * Do a pm_runtime_resume_and_get() to workaround a possible
 		 * deadlock between clk_register() and the genpd framework.
 		 */
 		r = pm_runtime_resume_and_get(&pdev->dev);
 		if (r)
-			return r;
+			goto unmap_io;
 	}
 
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
@@ -618,11 +620,11 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
-	if (mcd->shared_io && base)
-		iounmap(base);
-
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
+unmap_io:
+	if (mcd->shared_io && base)
+		iounmap(base);
 	return r;
 }
 
-- 
2.50.1.windows.1


