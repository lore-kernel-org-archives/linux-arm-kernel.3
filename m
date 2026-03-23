Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE381EC01C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb73+44kcbKxePBQ3Q4zKKBWI8OMJVoldXrY7eAcuXs=; b=o+9ZdHQ/PiCCHzJfke1VmqHntf
	93iBfqqV89NQkYihX0cuh1BePKPgbs4qS32n3U1aVrpwOEwqOpe+H7qCinC+YVAiTEEgn2vKu+vS5
	DxWx9zvHzKLY6ut0LLemBZbsYl1j0/2R00YbUMqZEOJhw43dkuAVMfdTrbWfu7uC/yUKdKHdG/MZU
	wsdAOlo+E3pRwYy+lnxlSoRNN8q9RdPnNtP7bPqm0+3k6FPyuwSKEwoMqnwHZyuGfBNfKFLs/EVF+
	rFWYQxhgUpQPPJ4MAngX+r/oh71ylNhFVE9Xz9Q+YvvYT/PtMUaTkG6HN616OsPksQg5CxdxS3NyJ
	GV3Dcu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2s-0000000GYdI-1o8d;
	Mon, 23 Mar 2026 11:02:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d2p-0000000GYce-3M8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:02:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E15D1684;
	Mon, 23 Mar 2026 04:01:56 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9AD63F73B;
	Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] pinctrl: sunxi: Rework IRQ remuxing to avoid fixed mux value
Date: Mon, 23 Mar 2026 12:01:47 +0100
Message-ID: <20260323110151.2352832-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_040203_976403_BDB1109E 
X-CRM114-Status: GOOD (  16.55  )
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

Some Allwinner SoCs cannot read the state of a GPIO line when the pin is
muxed to the IRQ function. To access that state anyway, we temporarily
mux that pin back to GPIO input, then return it to the IRQ mux
afterwards. This code assumes that the IRQ mux value is 0x6, even though
newer SoCs (D1/T113/A523/...) encode the IRQ mux with 0xe.

Avoid hardcoding the different IRQ mux values by saving the programmed
value before switching to GPIO input, then restoring the saved value
afterwards. This makes the code robust against future changes of the IRQ
mux value. This also avoids calling the sunxi_pmx_set() function twice,
each of which does a read/modify/write operation, fenced in by the pctl
lock. The new code takes the lock around the whole operation, which is
also safer since it avoids (probably theoretical) races against other
code touching the mux register meanwhile.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 23 ++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 -
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..6a86b7989b25 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -997,18 +997,27 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	bool set_mux = pctl->desc->irq_read_needs_mux &&
 		gpiochip_line_is_irq(chip, offset);
-	u32 pin = offset + chip->base;
+	u32 mreg, mshift, mmask, mval;
 	u32 reg, shift, mask, val;
+	unsigned long flags;
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
+	if (!set_mux)
+		return (readl(pctl->membase + reg) & mask) >> shift;
 
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_INPUT);
-
+	/*
+	 * Some SoCs don't read the GPIO value registers correctly
+	 * when the pinmux is not set to GPIO_INPUT. Temporarily switch
+	 * to that mux, to read the correct value.
+	 */
+	sunxi_mux_reg(pctl, offset, &mreg, &mshift, &mmask);
+	raw_spin_lock_irqsave(&pctl->lock, flags);
+	mval = readl(pctl->membase + mreg);
+	writel((mval & ~mmask) | SUN4I_FUNC_INPUT << mshift,
+	       pctl->membase + mreg);
 	val = (readl(pctl->membase + reg) & mask) >> shift;
-
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_IRQ);
+	writel(mval, pctl->membase + mreg);
+	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 	return val;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb..ec7c977655b5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -85,7 +85,6 @@
 #define IO_BIAS_MASK		GENMASK(3, 0)
 
 #define SUN4I_FUNC_INPUT	0
-#define SUN4I_FUNC_IRQ		6
 #define SUN4I_FUNC_DISABLED_OLD 7
 #define SUN4I_FUNC_DISABLED_NEW 15
 
-- 
2.43.0


