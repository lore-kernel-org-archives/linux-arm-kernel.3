Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B590C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8YD8KNFDiE2U1dp4wTUoJkUIeXklwTbgTxO3NMEpx0Q=; b=ZaE6/RHW09Oiz2KOzpNN9N15Iv
	vhwOpoMr8dWhxJzqRoidX2e0gChMM3TZbnedHs968hLYy0G5WY7BmtZrpkV7QSqXlMeSQRh/m1Snc
	InOX+Yb/rEQ24s1Jj9qnyNnVRjq6MMUgGLBvi8TCJI7a4P69o2ht8zCwcSjrs1fxYkD+ziite8Kx9
	4eFiFeMlpyRJv4A3oNlCpZqACY3f79QtN0PLTv8gTE284+s3/sWcmNwfTE2lWRqhLYqCqka4Gj1a/
	Mo8lsFGZno5MdwI+OO0G+DYqKh7tfXKVbRj0SYi3UTr8LhdeQGpDerDaXaDroJDCSR1NsW+95QzRS
	d36n0c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L7q-00000005DSt-1VYc;
	Tue, 15 Sep 2026 04:50:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L7n-00000005DS6-0u3w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:50:33 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADHn_OUzqhqCREJCA--.50396S2;
	Tue, 15 Sep 2026 12:50:28 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: daniel.lezcano@kernel.org
Cc: krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@rempel-privat.de,
	tglx@kernel.org,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clocksource/drivers/asm9260: Fix clk reference leak in error paths
Date: Tue, 15 Sep 2026 04:49:59 +0000
Message-Id: <20260915044959.1726508-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADHn_OUzqhqCREJCA--.50396S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4ktF45WF43Cr13GFW3Jrb_yoW8GFWUpw
	s7GrW5tr1rur4I9F4vqr4vyr95tw4jkFy3Ww4Sk3Z5ZrsxJFyUXayrGry29F4DArs5Zw43
	tFn5AFykZ3WDAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU78u4UU
	UUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRULA2qowd0lzwABsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_215031_632240_04B3FAE1 
X-CRM114-Status: GOOD (  11.21  )
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

asm9260_timer_init() obtains a clock reference with of_clk_get() but
never calls clk_put(). If clk_prepare_enable() fails, the reference is
leaked directly, and if request_irq() fails the error path only calls
clk_disable_unprepare(), which releases the prepare/enable state but not
the reference obtained from of_clk_get().

Add the missing clk_put() calls on both error paths so the clock
reference is no longer leaked. The success path keeps the clock enabled
for the lifetime of the timer and is left untouched.

Fixes: 8d8bd7be8bf0 ("ARM: clocksource: Add asm9260_timer driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/asm9260_timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/asm9260_timer.c b/drivers/clocksource/asm9260_timer.c
index 8f97ab0b01ec..f0ba19c9e0cf 100644
--- a/drivers/clocksource/asm9260_timer.c
+++ b/drivers/clocksource/asm9260_timer.c
@@ -202,6 +202,7 @@ static int __init asm9260_timer_init(struct device_node *np)
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		pr_err("Failed to enable clk!\n");
+		clk_put(clk);
 		return ret;
 	}
 
@@ -211,6 +212,7 @@ static int __init asm9260_timer_init(struct device_node *np)
 	if (ret) {
 		pr_err("Failed to setup irq!\n");
 		clk_disable_unprepare(clk);
+		clk_put(clk);
 		return ret;
 	}
 
-- 
2.34.1


