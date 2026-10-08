Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7344ACA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uuuba5t+YtdcDz6Zi5QWHUjilxWah0Ylx+Le7ktzXNQ=; b=YU1H/w5IZ4i0E8XRux2Pq41OH7
	BBIyunTsJTrAc1GqxvVgg2ZV7Bdau3wTE1t5LpmxPK9l6U6BloI1c4qbhj+1ZBlm1014ElW801cPX
	2M6usP/YFTDerV79oTE6k+hQfAOpdmGJx6lSRk3NrY2qkst/zc1YYoxLBfk8QTHqbVjWHn/TzzXFP
	eF4RCp+8q+fOT8uFYsXvrvJ7PJndrI3mxYRVOccVlBx6Ln04Mv/jzfGpojInhwVlJkNMKYZMfht2X
	NRPYcDVUakXysEogjwEf9MbzDOEjq4+74d1e+wfZocb54X34fC9xJX5EbMxEdnwrRdIBJ5VlrtFGx
	cbfvCu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs2I-00000004nGT-4532;
	Thu, 08 Oct 2026 17:36:06 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs2G-00000004nFx-1qXv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:36:06 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTTuB1MdqNlQPCg--.12561S2;
	Fri, 09 Oct 2026 01:36:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths
Date: Fri,  9 Oct 2026 01:36:04 +0800
Message-Id: <20261008173604.2733975-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABHTTuB1MdqNlQPCg--.12561S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3ZFW7WryrJr43Xw47Arb_yoW8Ar1rpa
	1xu345tF17WwsagF47tr4qvF95ua1SkFy8GFWfG39FyFn8ur1jqFyjyFyUXFy3CFWrZ3W7
	tr4rJrs5uFyDur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07b52NNUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgYOA2rHo1N7kwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_103604_845699_9825A0D7 
X-CRM114-Status: GOOD (  10.48  )
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

mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
the ipg and per clocks with of_clk_get_by_name(), but every error path
jumps to err_kfree, which only frees the imx_timer structure.  The
ioremap'd mapping and the clock references are therefore leaked when
irq_of_parse_and_map() or _mxc_timer_init() fails.

Unmap the I/O region and release the clocks on those error paths.

Fixes: 8051a993ce22 ("clocksource/drivers/timer-imx-gpt: Fix potential memory leak")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-imx-gpt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6c..b8005054b30a 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -441,7 +441,7 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 	imxtm->irq = irq_of_parse_and_map(np, 0);
 	if (imxtm->irq <= 0) {
 		ret = -EINVAL;
-		goto err_kfree;
+		goto err_unmap;
 	}
 
 	imxtm->clk_ipg = of_clk_get_by_name(np, "ipg");
@@ -455,12 +455,19 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 
 	ret = _mxc_timer_init(imxtm);
 	if (ret)
-		goto err_kfree;
+		goto err_clk_put;
 
 	initialized = 1;
 
 	return 0;
 
+err_clk_put:
+	if (!IS_ERR_OR_NULL(imxtm->clk_per))
+		clk_put(imxtm->clk_per);
+	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
+		clk_put(imxtm->clk_ipg);
+err_unmap:
+	iounmap(imxtm->base);
 err_kfree:
 	kfree(imxtm);
 	return ret;
-- 
2.25.1


