Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D89CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 05:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZCMvyWJd/0l+d8DwDHIgR7fMdp6Hhhxk/Ql0PW2G5o=; b=n3NqwAe6KgoRc0daPJM5NoLEEk
	WG/uUo4jwXF68hMNRR4YL7sMBg7z5AbJ2ZUrWeU/QIKTwheNuiXjJJYpaQeQatajHpYeYwyWfTacT
	btVEbyTmr0BNYWg/HCs0OSw7Kr4TBWfRMtKSrxq+dcXC4/MKxf+49o/SjqDavE+2vvbfmaNeA4lwV
	NikttzD8EnF4A98yyiiTSrzsLlMLOBth/sT973BJd7ayQ26DAqt7THALL3C/CQqjBKL7U509rqyzc
	UYm6X6dRs2mHLV7oBGidZ7ezLWYl9Vn4fcN495uUnDq95vC6cYGY2xzWNCV+kwX6kAtGEJ5/oEgbT
	nGLhy5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N2e-00000007BE8-0mx6;
	Sat, 27 Sep 2025 05:00:16 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N2b-00000007B9g-03I8;
	Sat, 27 Sep 2025 05:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949158; bh=nZCMvyWJd/0l+d8DwDHIgR7
	fMdp6Hhhxk/Ql0PW2G5o=; b=I/IHR/ZBehD1zCce6Zf+RIlfFIkv8B873wDBg96cWIrHduo557
	/1MfQJV5GhPBhy6NILg8C4/q+OPQKKSQnsCAtNBFgUXq4mULRPZYifBeL20HoVB7fexWPcrljAq
	vQXJNue1Jv6QK18wdEmgvryymT5rr2NR48YVViFkkHfWHxJgTeat/RfySPINdbHQumPzhn3fVnZ
	sBW+p4X1ceV+61Hv9xRqZa9ciYAj59xVLca4KEIY+OA6JpES91hcNfkP4m4627/i/qElpC2wAbY
	Tl6xYxU6aNMJ3yLm2Dgy0UX9ZyVHmZG/6EYSUgKTqepNxbWBj2HRxd94Fl+Le05xAAw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949158; bh=nZCMvyWJd/0l+d8DwDHIgR7
	fMdp6Hhhxk/Ql0PW2G5o=; b=ScRC0d9urjAzTpmviEOOd2PNwtf09CsGN+AqdKAxtvTOTSevdk
	KoZN/RL4rrO3VsQZNk3QXhyMknEjX9DUkpDQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:08 +0700
Subject: [PATCH v3 3/3] gpio: rda: Use bidirectional GPIO register for
 direction input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-3-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=1179;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=plcpw2T9B0QjZiLTHHwxIiFvD6CVvF2W7wuatitb7c4=;
 b=h8bm/jYJCPp076VvjNf3NuBUvvZXtwNyl/IgNI3unR8XASZV8DEetcampybSESkX8cdFR5EVp
 RVqpIB59SZDDr9w+ar/lPTXgEyhzNw+QVJ4JItIposuWH+DY3RRnq8c
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_220013_226591_5964C8C3 
X-CRM114-Status: GOOD (  10.37  )
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

The current implementation uses both DIRIN and DIROUT registers, but
the bgpio library expects 1 to be output direction, which on this IP
is reversed (0 = output, 1 = input).

To fix this, use GPIO_OEN_VAL for input direction register which
expects 1 = input, 0 = output.

This change should not affect any mainline users as none of them have
any peripherals hooked up to a GPIO.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 drivers/gpio/gpio-rda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7d20dbbb6ec41149a1dbf4d9ef9ac86449773c35..145b61fc83fb6eee2415e979a144616d81595736 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -243,8 +243,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 		.dat = rda_gpio->base + RDA_GPIO_VAL,
 		.set = rda_gpio->base + RDA_GPIO_SET,
 		.clr = rda_gpio->base + RDA_GPIO_CLR,
-		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
-		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+		.dirin = rda_gpio->base + RDA_GPIO_OEN_VAL,
 		.flags = BGPIOF_READ_OUTPUT_REG_SET,
 	};
 

-- 
2.51.0

