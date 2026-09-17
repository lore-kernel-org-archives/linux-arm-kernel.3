Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3282C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3rxmew9ejmFKQPEF28KKIfrgBOL2FlEjiVav3iuQOyA=; b=Dh6ZD8a7zlGx9GHk7+22C7uwbS
	DYJKxbbIc/hWu68CocTxHTbTQbc6hxiIiEp+DDhGykuh7ww1oi2i8O8XbMXuPB6yg1b28dkDID+2L
	DOma72+pPxhEZQUbgNp+50tUjFQ54cyjADP7S+zyKN61Gm8xOSuAuEbFXjRHGif085eVky4cOqDiB
	xPViq3NYjzJQTccyXGNCLDJ4y0ppLg8fT6afBxBYC+b9HT5a5Gi/rCerGV1wI/YAJt7Ioli7/DQuQ
	oqc58qqSim1cvmt8vJFBPc//WM0sSJ0raTwOtkEqZXT4DeXWKlazip2ZRiXcZI4Ui3CE2IGl7uy+j
	s2X4Y9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ETr-0000000BmUb-1R34;
	Thu, 17 Sep 2026 15:56:59 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ETn-0000000BmT0-2jMD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:56:58 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAC3HzrCDaxqPPmDCA--.6369S2;
	Thu, 17 Sep 2026 23:56:50 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Cc: ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] serial: ma35d1: Fix clock reference leak in ma35d1serial_probe()
Date: Thu, 17 Sep 2026 15:56:50 +0000
Message-Id: <20260917155650.2161274-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3HzrCDaxqPPmDCA--.6369S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUXF1ktr4rCryxuw4DArb_yoW8Xw4xpF
	srKrZ5KayUGa48tw1Duw15Zr4fZw4Uta4xCrW7Ga4fuanIqr93tryfJa4jva1UCFykWF47
	Jr1Iy345uF4jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPSb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMx
	AIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7I
	U1oUDJUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgENA2qr888+PAAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085656_059508_42A1279D 
X-CRM114-Status: GOOD (  10.76  )
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

of_clk_get() returns a clock with a reference that has to be released
with clk_put(). ma35d1serial_probe() never does that, so the reference
is leaked on the probe error paths and also when the port is removed.

Release it on the error paths and in ma35d1serial_remove().

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/tty/serial/ma35d1_serial.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..a073648cc5e4 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -720,7 +720,7 @@ static int ma35d1serial_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(up->clk);
 	if (ret)
-		goto err_iounmap;
+		goto err_put_clk;
 
 	if (up->port.line != 0)
 		up->port.uartclk = clk_get_rate(up->clk);
@@ -747,6 +747,9 @@ static int ma35d1serial_probe(struct platform_device *pdev)
 err_clk_disable:
 	clk_disable_unprepare(up->clk);
 
+err_put_clk:
+	clk_put(up->clk);
+
 err_iounmap:
 	iounmap(up->port.membase);
 	return ret;
@@ -762,6 +765,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
 
 	uart_remove_one_port(&ma35d1serial_reg, port);
 	clk_disable_unprepare(up->clk);
+	clk_put(up->clk);
 }
 
 static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)
-- 
2.34.1


