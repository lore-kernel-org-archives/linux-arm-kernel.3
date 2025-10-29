Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DFCCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVX8PaUqPMzIopFUo9tAEzS7Rc3NsvxHPpR0XGXVCs8=; b=NaU0SEIj85RLmyVbzz97LnHhRA
	yNZvbivr7vDLw+h26AGKKM7kjNca3bl5CzV+gn/TJVM+3o7cjrcvSM8NLrI2JQBAi7ZJQ0/aEXWJK
	/TNlZ/oOv80Nj3XpoC4QTtHuaG9iT8g6w9DGucwG32yrbyNOsK2TcqYfwNDlAWfwU9yDsND5frpud
	TEeaIi0sHdCP/KXmIZ0ElUDaVWUZChl9VWgpv+MRHUt4zOIdpC81Q+WlES1CHpT34aZvmh3Ws41tu
	vD+bHPJ5I7L91kZ/8JOgbnEprYoRgWCrWN4tPvgR/3SOoz/zMKddHWC8wjC0xoiAgnQ5d88yddPPM
	wjm5UBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1Av-00000000CDX-0DsP;
	Wed, 29 Oct 2025 08:04:57 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1Ar-00000000CCm-4ATc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:04:56 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAnrGCgygFple17BQ--.24270S2;
	Wed, 29 Oct 2025 16:04:50 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] serial: ma35d1: Fix resource leaks on driver removal
Date: Wed, 29 Oct 2025 16:00:39 +0800
Message-ID: <20251029080039.1010-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnrGCgygFple17BQ--.24270S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4xWw4DCry8JF4rurW3KFg_yoW8WrW3pF
	ZrKay5GaykGay0qw4vkw1UZFWkZw18tayIkry3C3WfCan0qFn3tF4fta4jvFWUZFWkXr47
	Xw10y3WruF1DKFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkKA2kBkUXMWQAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_010454_436545_D0FE7AB1 
X-CRM114-Status: GOOD (  10.16  )
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

The driver fails to release resources acquired during probe. It calls
of_clk_get() to obtain the clock reference but never calls clk_put()
in the remove path, leaking the clock reference count. Similarly, it
calls ioremap() to map UART registers but never calls iounmap() during
removal, leaking the I/O memory mapping.

Switch to devm_clk_get() for automatic clock resource management and
add iounmap() call in ma35d1serial_remove() to properly release the
memory mapping.

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/tty/serial/ma35d1_serial.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..37e9f6166290 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -711,7 +711,7 @@ static int ma35d1serial_probe(struct platform_device *pdev)
 
 	spin_lock_init(&up->port.lock);
 
-	up->clk = of_clk_get(pdev->dev.of_node, 0);
+	up->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(up->clk)) {
 		ret = PTR_ERR(up->clk);
 		dev_err(&pdev->dev, "failed to get core clk: %d\n", ret);
@@ -762,6 +762,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
 
 	uart_remove_one_port(&ma35d1serial_reg, port);
 	clk_disable_unprepare(up->clk);
+	iounmap(up->port.membase);
 }
 
 static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)
-- 
2.50.1.windows.1


