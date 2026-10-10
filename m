Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A391CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r6OLpax4xwYmqxOBU6oJkaoEN1v007lODV8ttQbVsFw=; b=dTsihnOHZruPwwPq63ffXA4JAF
	iu2HKTJ5FdNUVLmrXObg56nm26R/H4yd1GjVqNMM4t+dOPsHtb9mBoWXLr15pWFLPLjrX+gqG4Uzl
	Y23eEkkWu9Xn5LYtgHzDPJ9TfGw/rrXCsq5wbLNh6BunhJzKZ66pqxe4fepVjy4y45YIOnVyubdM1
	b9ZqPoasFn+HNDzVjDl5JrzmrH34lB0/o13s4JkL9K4HnDSV/IIxvF56w7mcUNwRMOWIvkz2ATrF3
	o+FPc3TUeuQO+B72vrG71wt/puPbLWjgUwLf103iu9oSbm3hn+ryJHhC1vNFivpfzaQNBfStgS1dT
	76MraumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbgb-00000008N5z-3OjY;
	Sat, 10 Oct 2026 18:20:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbgX-00000008N5R-2A64;
	Sat, 10 Oct 2026 18:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 471BE40AE7;
	Sat, 10 Oct 2026 18:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A69AC2BCB9;
	Sat, 10 Oct 2026 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791656441;
	bh=bvBLwSNHfpqFuBgPMxJgODmhyMsa4KrzMFEKnO7uof0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Ssz8PXRwBYeglSPrVy5yI/PIRHELiZF3DF1GQ2qJsybHJ/GJzNFEtOfT8IwDebvXa
	 GiZBJbXGBwYJOuOuOjFBBUsK6OhEupBtWX6jZ+ULO2hocuo0l5nTbpFGD3Lg7+aQRx
	 /74en2NV8oT4cxiFKRk5yx8bBgxigw0jg+H8kZ3Bg6YQyfA5iNUdv5he/fzucvTGrf
	 NjCV1X9yvynZByPCNcAgYX4HQRq5Ok/gf3RbtnsSX8duiGshQo4ORpYsE5VF3A3Uvt
	 CoTxbsWX9B1EXBa7OJ3um5S+6Jm+evhXJV1+M/DB+KwjqSDgWcllly9tFjkSQ8n299
	 CBnjDOO0HJVEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069EDCA6017;
	Sat, 10 Oct 2026 18:20:41 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 10 Oct 2026 18:20:30 +0000
Subject: [PATCH v2] irqchip/meson-gpio: Allow the GPIO interrupts to wake
 the system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
X-B4-Tracking: v=1; b=H4sIAO6BymoC/3WNQQ6CMBBFr0Jm7Zi2CAFX3MOwaGUKE7Ulraka0
 rtb2bt8L/nvbxApMEU4VxsEShzZuwLqUMF10W4m5KkwKKFaKUSHD4re4byyx5e+EdraWF0bo6j
 RUFZrIMvvvXgZCy8cnz589oMkf/Z/K0mUaIS2sum76dT2A+t0vCcYc85fCTMS8qsAAAA=
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=fZVoG9f36dKIjewDv5ebdz4lu+bdjQGttrwUIvjhrKc=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmnGj9LxAQuU8/rZlmZEzdbce2SpXrqKytf31krzLY7o
 +5E+ZGbHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAisYIMfzhKL3ycwCTj22+V
 VCtte5Ff6a3srUyu9s9MEYWPLFpOv2ZkOL523iR5c9aHx5TXntruJMCs863WyzaJRS1NqoGFoy2
 fBQA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
so enable_irq_wake() fails with -ENXIO for every interrupt routed through
it, and such an interrupt never gets IRQD_WAKEUP_STATE.

That matters for suspend-to-idle. suspend_device_irqs() keeps only the
wakeup interrupts enabled; the rest are suspended and masked by the flow
handler when they first fire. A GPIO interrupt that fires during s2idle
therefore brings a CPU out of idle once, gets masked, and the system
sleeps on. For mem the firmware chooses the wakeup sources, and this
flag changes nothing there.

Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
would end there anyway.

Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
controller: with the flag the alarm wakes the board from s2idle 4/4, and
/sys/power/pm_wakeup_irq names it; without the flag the board stayed in
s2idle past the alarm until a power cycle (0/5).

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Changes in v2:
- Reworded, as Neil asked: say that the test and the effect are for
  suspend-to-idle, describe how genirq handles the interrupt there, and
  note that for mem the firmware picks the wakeup sources.
- Repeated the run without the flag: 0/5 (v1 said 0/1).
- Link to v1: https://lore.kernel.org/r/20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv
---
 drivers/irqchip/irq-meson-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 91a9c337fe6d..e0329ef5e4a2 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 #endif
-	.flags			= IRQCHIP_SET_TYPE_MASKED,
+	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
 
 static int meson_gpio_irq_domain_translate(struct irq_domain *domain,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-meson-gpio-wake-f3bfa3bb2e5a

Best regards,
-- 
Igor Velkov <iav@iav.lv>



