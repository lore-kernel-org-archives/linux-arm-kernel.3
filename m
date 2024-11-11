Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B1BD12D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 02:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA6Lfw0pVK4KIHrVEahwSZAHmfqAeDyaeLLez6Fbs2s=; b=jfeSgOUWKmCrgfWl9V6AYy6VAB
	kEohXm4HpIOvD2ZM5bGe/P3zw3vfArlY9a6gjMv03nNCyhwj+bzRaErZMNtbBIqx2EPl0lYKKGyTq
	b0yYy/C/Yw/KKcufVb9flLqeR3BU4pfa+o4drKJ9DvwE0rvMg1myjEa7qn9D9RvhpZaLL/wELwVwK
	3OE/F1/YIEVElwHuueWS411vnkKtpSNJUURnG8WxYxgt2CpVDJYeGw/GgB1z3aLVlgxwbsPebCeIz
	Fb8l5Ys8hzXC1pOGwEYuKaG2c/8pnG4tzdirSxXHujtRr2U+3mmPXgghzG8kqbAZtzWBQXK+Qis1V
	k1vZrpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKOr-0000000G9UG-0D2U;
	Mon, 11 Nov 2024 02:43:33 +0000
Received: from mail-m243.xmail.ntesmail.com ([45.195.24.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAKG6-0000000G8K2-46t1;
	Mon, 11 Nov 2024 02:34:34 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a586a;
	Mon, 11 Nov 2024 10:34:25 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v4 4/4] gpio: rockchip: Set input direction when request irq
Date: Mon, 11 Nov 2024 10:34:12 +0800
Message-Id: <20241111023412.3466161-5-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08fSVZIHUJMHU9JH0xLGUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9319128a6a09d8kunm258a586a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODo6Exw4IzIfCiwBMw4xGDwN
	LBRPCRlVSlVKTEhKSUJJT01MSUtKVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQkxJNwY+
DKIM-Signature: a=rsa-sha256;
	b=S4nbMRNXQ3eIAPG7NtbSJ2jTJJEm67pkoMh0tQThPPA69ReLy4qvuPUjnOY8dTv+sNY4CgwNRfrSFeCtucZnG4AiAXrQi9aIIKakdR2IK1wbuG6HTjYpmljpsbNf5C1TfPrjKAvLCLlQ7Boe02/1kr/q8nEsO6PQotNNHFxn1qA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wA6Lfw0pVK4KIHrVEahwSZAHmfqAeDyaeLLez6Fbs2s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_183431_258622_9EC103B8 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Since the GPIO can only generate interrupts when its direction is set to
input, it is set to input before requesting the interrupt resources.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index b7a43e492965..40c2476699aa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
+	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
+
+	return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
 }
 
 static void rockchip_irq_relres(struct irq_data *d)
-- 
2.34.1


