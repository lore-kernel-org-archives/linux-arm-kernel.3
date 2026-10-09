Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFDECA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 02:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUt7VV3noaSHrRxsp785y00D8vyXY601mFOPWU0BBgk=; b=DNuTUdgKrsyo28tuDf5c+2CgTU
	aCdxXSaZOOKtKBu9yNaD73DVnGlZc2KYIZ4zDn7on9DMcFPTpEO9WkxsuydysOECG1xYcfYhP/WSG
	I3AFLGtutdFn6y0ZHCs/3C9Gnfa03/ojELFPwtvtbJikaTpOz2eRVF6jm6maBsIlbIQTQv2WHj6qm
	KNu/ggDCCleWaAS5Bps4ozbsjbx7c6lh5sHEa2n4NGamBwyYLn4SZorvDpF6uFik47qh8YUqQqTWn
	uE7QqzY2DheHw68N+EhsOwGfPsTDc4Nxk9l3S1eASWn5slyBJvtFhWOq8HFEaJpiQh1kL7wnOmgmK
	gxc//qaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0LO-00000005HuX-3LR6;
	Fri, 09 Oct 2026 02:28:22 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF0LL-00000005Htz-0NUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 02:28:21 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHET8_UchqgFAZCg--.870S2;
	Fri, 09 Oct 2026 10:28:15 +0800 (CST)
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
Subject: [PATCH v2] clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths
Date: Fri,  9 Oct 2026 10:28:18 +0800
Message-Id: <20261009022818.3025610-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHET8_UchqgFAZCg--.870S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4xArWDZryUJw1rGr1UGFg_yoW5GFWrpa
	18W345JF17Wwsa9F4xtr4DZF93Ca1Ik3y8CFWrK3yayrn8ur10qFWjyFyUtFy5CFZ5Z3ZI
	vr4rJr4ruF98urJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07bOc_fUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggPA2rIGut+rQABsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_192819_505847_BACE7A65 
X-CRM114-Status: GOOD (  13.19  )
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
ioremap'd mapping, the clock references and the mapping created by
irq_of_parse_and_map() are leaked when irq_of_parse_and_map() or
_mxc_timer_init() fails.

Release the ioremap mapping when irq_of_parse_and_map() fails, and drop
the clock references and the IRQ mapping when _mxc_timer_init() fails.

_mxc_timer_init() can fail after mxc_clocksource_init() has registered
the sched_clock and the clocksource, and after mxc_clockevent_init() has
registered the clock event device.  Those subsystems keep using
imxtm->base and imxtm, so neither the mapping nor imxtm itself may be
released on that path; request_irq() cannot have succeeded there, so
disposing the IRQ mapping is safe.

Fixes: 8051a993ce22 ("clocksource/drivers/timer-imx-gpt: Fix potential memory leak")
Assisted-by: DeepSeek-V4.1-Flash
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
 - Dispose the IRQ mapping and drop the clock references when
   _mxc_timer_init() fails, instead of leaking the IRQ mapping.
 - Do not unmap imxtm->base nor free imxtm on that path: the sched_clock,
   the clocksource and the clock event device may already have been
   registered and keep using them.

 drivers/clocksource/timer-imx-gpt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6c..8050f3b449ba 100644
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
@@ -455,12 +455,22 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 
 	ret = _mxc_timer_init(imxtm);
 	if (ret)
-		goto err_kfree;
+		goto err_irq;
 
 	initialized = 1;
 
 	return 0;
 
+err_irq:
+	if (!IS_ERR_OR_NULL(imxtm->clk_per))
+		clk_put(imxtm->clk_per);
+	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
+		clk_put(imxtm->clk_ipg);
+	irq_dispose_mapping(imxtm->irq);
+	return ret;
+
+err_unmap:
+	iounmap(imxtm->base);
 err_kfree:
 	kfree(imxtm);
 	return ret;
-- 
2.25.1


