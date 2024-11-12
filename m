Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74367D41D45
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 02:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNEmQIXIeVppZTHWDm1sWax6s+N6SW3qLZo4jlaSVhk=; b=GVzJ/p628c3bjK7OnxQjXXpyzF
	e2ktlwq2s/70tTKyV7vFpf+mtvRblY2EKBbXh7F99r6EiaXQ53GRAZ9Pg1lxDdCe38t1qAZE3f8wg
	oSMEsmtFfHhJGzU7mwTXh+Pyd3oPDvSTpMHsJpIQt0vO7+vl/4FkQ0q6hNi9cJwmmb/y3DkRvnF6/
	1VNzRJbWtRo2atG7JvRJKhy9VOe4QsZWT5p1az28TkIQa+uBZUwVYVwMeeLLvr73Apj6nm7EBhl0c
	XOAkzg48yiXtSgFgJ1XLqDqwTsXKOn6R85QksFC7SN6JNIPspvP9fH26orBxT3D+olaWIJ77mBnz5
	8gd4iyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgFX-00000001ved-0hyw;
	Tue, 12 Nov 2024 02:03:23 +0000
Received: from mail-m60108.netease.com ([210.79.60.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg6n-00000001ubf-3LG4;
	Tue, 12 Nov 2024 01:54:23 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f37;
	Tue, 12 Nov 2024 09:54:17 +0800 (GMT+08:00)
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
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
Date: Tue, 12 Nov 2024 09:54:08 +0800
Message-Id: <20241112015408.3139996-5-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1PTFZIT0kZTRpCHUtJT09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e1428e409d8kunm275d3f37
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6ISo5KTIqMBoQPzUSSSwj
	OUIKCjVVSlVKTEhKSExNT05CT0hCVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSktIQzcG
DKIM-Signature: a=rsa-sha256;
	b=B4BuOlL5tsBqQdef+Wlc71JSyi354lSEC1mheLS2w85oIb4J0/jXCKWuyGD4Z1mjCVP08Eq7YemWzBZu+Xtoz6Rvb6c2rLe8I7osMBL6piJ7gjxf1r8+xGfHJ2JlnHlkF1k1QJkDv/i092IN/48D9N+WoOL67icrt/bPch0PtzM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=mNEmQIXIeVppZTHWDm1sWax6s+N6SW3qLZo4jlaSVhk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_175422_081711_925CF239 
X-CRM114-Status: UNSURE (   9.47  )
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
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index c090cac694bf..cdfdd5501a1e 100644
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


