Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE2E668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROyoy5D3Apuc9bLeRfwSeN7g6RKmJPVj7/pjyR6FjdM=; b=Ed+p4ThUCowf+LUYd+tnBzEhp2
	kRXIIrUAhGieiW1JcCcQ6oCRF+/HICnP46IQjgsbtux1NgBEvTmD3xcld/PgAzRo4omA4Q/MkzwUt
	7qmjgYC4cqQpHhZwM8iG0p3XZ+x00drH8b0Ia03KKE7r+eZe1vraKj01r75gv2RO6fR8Wnb0nfYV9
	OU36bT6pyP5jUbrPPvJ/AIjP1KRgfhsGWq3mU/zm0O8xod08KcUNkNFA7TYJQpP4unHNIDWW00Jwn
	RibzSoDXhIgKxaKaRUTKNlWrKOEr2wN95sJA6HI80oqSbEJ0XX74yq/1Q/mv2Rc5Cb/fRrYjDiZTR
	AKfq+36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCDE-00000005oyP-2TIX;
	Sun, 24 Nov 2024 12:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC6L-00000005nGf-19s4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37E525C5746;
	Sun, 24 Nov 2024 12:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BA3C4CECC;
	Sun, 24 Nov 2024 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452752;
	bh=SUm48HcYKDKR6wUc3VpZvhgjuViI2lQ8T7bFKafhnSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4Hp1A3UJOoJSHvYNM8h8iMeGknzOWnWAMIppR8PBzZdanstmggHrOjk7sfmNt8nK
	 a6p8XDtoKx1UrbUMXNfUC3vWSIEy0LeaZpfK65LTKPN7+0KlgvIQr3Mu7quO2hT/3Q
	 GbCSR/SLhkPN57S7Wx+y5RY7vPfkZr1623CkP1puRyhg5cXPL00Ky7gTtUzMNaNexM
	 irqp1omfDXQo2D/fB8YmE98Wpa1Fe8Ja5XyAxMDMXTy5GacdOPCHpjZn6hxJoS60C/
	 PwADr7h4VeeLmFg+4bvLYDLauPy9PIp5bVgwPiPGdNQ9gtjaH2WBDXoz13uEqgWhJB
	 RQKoRTfT314Ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 19/20] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
Date: Sun, 24 Nov 2024 07:50:49 -0500
Message-ID: <20241124125124.3339648-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_045233_346400_6BFDAE63 
X-CRM114-Status: GOOD (  11.98  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 62d2a940f29e6aa5a1d844a90820ca6240a99b34 ]

Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20241104093609.156059-6-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 1a6317e4b2a32..ea79f85f8e0bb 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2355,18 +2355,19 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	struct pxa_udc *udc = &memory;
 	int retval = 0, gpio;
 	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
-	unsigned long gpio_flags;
 
 	if (mach) {
-		gpio_flags = mach->gpio_pullup_inverted ? GPIOF_ACTIVE_LOW : 0;
 		gpio = mach->gpio_pullup;
 		if (gpio_is_valid(gpio)) {
 			retval = devm_gpio_request_one(&pdev->dev, gpio,
-						       gpio_flags,
+						       GPIOF_OUT_INIT_LOW,
 						       "USB D+ pullup");
 			if (retval)
 				return retval;
 			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
+
+			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
+				gpiod_toggle_active_low(udc->gpiod);
 		}
 		udc->udc_command = mach->udc_command;
 	} else {
-- 
2.43.0


