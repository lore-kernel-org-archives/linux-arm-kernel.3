Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC6CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 00:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KrW5Js/vgcglIHjJXzY3uUj6z/r7gJ4lUexgfvZXCWI=; b=salNiQrnVgBVyW0jz65GzFbvXf
	u2y/ls1+XsMiq1qA885Xhg1ReSC6GNydUxYMd9rpP9OU6zUSyyAOeQXt7T1WIiDeY8inwEogekCpj
	Aa5+oWBAaPkKJZeB8kTwXI6ZrO0ldW19C9vC74IcM7boZoiLiE2/4QAHvWYMrbz/lFnd6lbiPyI3W
	A7bx/kV6Lql6Fs90Lp2kzZhCL+O5wpbz7VzB+snXRXKQod85u3CrrllRsGkB/QUixfyk2qzSeTbUL
	AbIDi6cYdKPVube2y0MT9MxEN46Ws1oewqem6Eccu9l38hujBhA6Oz1CjnfKqnJE8eGo5NTmM8LI7
	XuX3bcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY2x-00000008TMs-14nG;
	Thu, 25 Jun 2026 00:34:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY2u-00000008TMJ-2uKj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 00:34:22 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXwaiJdzxqAdjCFQ--.4213S2;
	Thu, 25 Jun 2026 08:34:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: pengpeng@iscas.ac.cn,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: sunxi-rsb: fail hardware init on soft-reset timeout
Date: Thu, 25 Jun 2026 08:34:16 +0800
Message-ID: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADXwaiJdzxqAdjCFQ--.4213S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4UCw43ZFWUWF18Xw4kXrb_yoW8Xr4kpa
	naka47CrWqqF4FqF12yF1jvF15X3Z7KF98C3s8Cwn2vwnYgry8CFyrKFWFg3W5AF48uay5
	ZFnFqa1UCF1q9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQo7
	NUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_173421_111948_F5B67C6F 
X-CRM114-Status: GOOD (  12.06  )
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

sunxi_rsb_hw_init() issues a controller soft reset and waits for the reset
bit to clear, but it ignores readl_poll_timeout()'s return value.

If the controller never leaves reset, probe can continue to publish child
devices and system resume can report success without a usable RSB
controller.

Return the timeout error, assert reset again, and disable the clock before
leaving the hardware-init path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/bus/sunxi-rsb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index daf0ea563..f83224dea 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -669,8 +669,12 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
 
 	/* reset the controller */
 	writel(RSB_CTRL_SOFT_RST, rsb->regs + RSB_CTRL);
-	readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
-			   !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
+	ret = readl_poll_timeout(rsb->regs + RSB_CTRL, reg,
+				 !(reg & RSB_CTRL_SOFT_RST), 1000, 100000);
+	if (ret) {
+		dev_err(dev, "soft reset timed out\n");
+		goto err_reset_assert;
+	}
 
 	/*
 	 * Clock frequency and delay calculation code is from
@@ -696,6 +700,8 @@ static int sunxi_rsb_hw_init(struct sunxi_rsb *rsb)
 
 	return 0;
 
+err_reset_assert:
+	reset_control_assert(rsb->rstc);
 err_clk_disable:
 	clk_disable_unprepare(rsb->clk);
 
-- 
2.50.1 (Apple Git-155)


