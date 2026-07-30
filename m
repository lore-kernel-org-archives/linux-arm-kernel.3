Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2599BC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHXOv04DuMhM+9hs8qoLTNRU6S66RipG6LbigyuoqQI=; b=HQzcH/Jg6UGzVqQp43qaSRV86J
	L/e/c9aGzsWLI+g72MBF0tY5NKyIUTUV+uGN+HYn5TK7S0K57DypH7PKHXfWi833mqJSDo//W1QlK
	G3+WvpBnmeBCWhMsti2jW0F//yS42Xb3Hn3L/EzJc/3F/IRdT8DhKCW4kNG530FHhsD6I9B3p3SvA
	5oqtZS9Aybdm2gvuw5ni8J6QOLt1YRjN61BNkwp0o3yiaJ9ET8HZvv7Ca5nxkvNjLsvUKFcIZBCvD
	lKUToVGne3cq8PFhyWQwRFwpBG8KF9EO1YJQI39DSxfT6bXZ319SvinEE4p5l6ddBXJp+fRajIE8a
	2r7aw8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNiA-0000000A91n-2EVF;
	Thu, 30 Jul 2026 10:09:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNi8-0000000A91d-1XaA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24DDE40E15;
	Thu, 30 Jul 2026 10:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E1D1F000E9;
	Thu, 30 Jul 2026 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785406196;
	bh=hHXOv04DuMhM+9hs8qoLTNRU6S66RipG6LbigyuoqQI=;
	h=From:To:Cc:Subject:Date;
	b=mVA+POSHxQAZLN+oAZWAVt9cmwnWFvtoz1E1rRBi6l/LsKDcpaSIM13dY1xwRPS6f
	 wjuBRIviuLuhLECvrSOXsYVOAT226CczOgVnCBzYY55/oD75ugofZ226zNKdPAgjCq
	 g+EaPGsXzlrCsMxHAfvEIwPC3hBpxECMuPuDIFKyKbbBO0dsXk79yKGAuZKuVtQUr9
	 Ks/ydUVHrCTvUvLU2jRxRqpyWIejaUfyuVlGbjlXLX9/kF4JctAUd3CrFBCPFUOZyA
	 2rhyWdTfqqB6tbcW6GmkFTnZMkdk8hxE4A7aK2DvBt+CnqnOeggU2A29UEtGviLlXh
	 8QbsryWpEFFhQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] soc: fsl: qe: implement get_direction()
Date: Thu, 30 Jul 2026 12:09:40 +0200
Message-ID: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=chleroy@kernel.org; h=from:subject:message-id; bh=t4jN5WDxBUnYILBi/TUtcunD2+40jxQnux/VuTVXIiY=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRlK706cLh8n9izg9viW/Os8+8qGp2/ev/Rc4VTLE3rH MNOhiTN7ihlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATadRjZNh0aoo5z6fjy6/s 5ioK69db+M44VkaeP/Jx2797pzc9zbJjZOh9a2O+cPnF21qaahNOzHq062mPctv1RT5OPH+zDxy 6OpkJAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

The lack of get_direction() callback in this driver causes GPIOLIB to
emit a warning. Implement it.

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/gpio.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 66828f2a3577..6d8f4d549fe2 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -135,6 +135,30 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
+	unsigned long flags;
+	u32 val, mask;
+
+	spin_lock_irqsave(&qe_gc->lock, flags);
+
+	if (gpio < QE_PIO_PINS / 2)
+		val = ioread32be(&regs->cpdir1);
+	else
+		val = ioread32be(&regs->cpdir2);
+
+	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	mask = (u32)QE_PIO_DIR_OUT << (QE_PIO_PINS - 2 - (gpio % (QE_PIO_PINS / 2)) * 2);
+
+	if (val & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -308,6 +332,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->ngpio = QE_PIO_PINS;
 	gc->direction_input = qe_gpio_dir_in;
 	gc->direction_output = qe_gpio_dir_out;
+	gc->get_direction = qe_gpio_get_direction;
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
-- 
2.54.0


