Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D9CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xpFwXSkytQvvkU8ROBlt0ktsfoNgM6ARQ73ZlBwNUO8=; b=enQ/sNcOUK0L+ioiEUmFhikNhX
	1rButMeszquWmD8ZWBAhGqdtzG6CLHTm40y6m2W/AfvkQ81hVnMIMhczo1LMPTEmLIZzncDvnUEvH
	urOdPGo7BbMgtAs6W7KQlXS8bz+QT6EadlqJg1h/SwaT/dbGjTVa/1OlarzUtkEkGccHf8GVtbUhq
	f45YsOSOD48cTBMjL2DvqXjPHhxq5m73CWBKxUgpI/Fe1pPi7pzf1oPgNH+r65KQM7cU5Q69ELKDa
	yHkJ0uEIgz04TEm3RY6JSy8C5SHa+ZczIXsdyzIgolDCGJo37W/aLutHfY4Y5VDZzcr3esyOJluLV
	OHn7NmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3bU-00000005ZTK-2ZoA;
	Fri, 09 Oct 2026 05:57:12 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3bR-00000005ZSu-1XuV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:57:11 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjwvgshq_H0dCg--.3328S2;
	Fri, 09 Oct 2026 13:57:04 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] counter: microchip-tcb-capture: fix clk reference leak
Date: Fri,  9 Oct 2026 13:57:06 +0800
Message-Id: <20261009055706.3157552-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABHTjwvgshq_H0dCg--.3328S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DCFW7Wr43Aw4kKry8Krg_yoW8Ary7pF
	W0q390kF48XFWqga1DJw4DZF98tr42ya4FgFyfKasrWas5J3s3XayqkF10van5ArykJa1a
	qw1UWr1kuFyDZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bO5rxUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwgPA2rIaDU-ZAACsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_225709_804990_8E3E4B39 
X-CRM114-Status: GOOD (  11.85  )
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

mchp_tc_probe() obtains a reference to each channel clock with
of_clk_get_by_name(), but that reference is never released: the only
teardown path, mchp_tc_clk_remove(), just calls clk_disable_unprepare().
The clk pointers are kept in a local array, so the reference obtained on
every successful probe is leaked, and when clk_prepare_enable() fails the
reference is leaked on that error path as well.

Release the reference with clk_put() in mchp_tc_clk_remove() after the
clock has been disabled and unprepared, and also call clk_put() when
clk_prepare_enable() fails.

Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/counter/microchip-tcb-capture.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index e53a8390756b..f1c900efd2d9 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -470,7 +470,10 @@ static int mchp_tc_irq_enable(struct counter_device *const counter, int irq)
 
 static void mchp_tc_clk_remove(void *ptr)
 {
-	clk_disable_unprepare((struct clk *)ptr);
+	struct clk *clk = ptr;
+
+	clk_disable_unprepare(clk);
+	clk_put(clk);
 }
 
 static int mchp_tc_probe(struct platform_device *pdev)
@@ -528,8 +531,10 @@ static int mchp_tc_probe(struct platform_device *pdev)
 		}
 
 		ret = clk_prepare_enable(clk[i]);
-		if (ret)
+		if (ret) {
+			clk_put(clk[i]);
 			return ret;
+		}
 
 		ret = devm_add_action_or_reset(&pdev->dev,
 					       mchp_tc_clk_remove,
-- 
2.25.1


