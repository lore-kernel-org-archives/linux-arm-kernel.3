Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3DECD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL0Ledz5ddI5Gkr4vZQhSArwkkWm/15rROLq8VW4R/k=; b=iVXZigY/a1B1brS2lBbPNRcoZm
	SP294/bevqYWJJaErV5yeOIlWmmtdyC9X53qIe9A2Dl8+E3ynV6mnjGN3JLd5OI5Zm102IXpgPN83
	RyoFI8UlqDkU50gmSKue+Vvp3/l27GVyuJU60YR5F1Myq25kyeUQACyYE5l3ZHNe64SbTnM7HV7wA
	eIYHwVZuJlKL9/OCnz1WAQH9pdPyqjP7rHdKXQzRTR+9u9SNUk2UD9ZAX7UAMZaLuOeCEu920X8xv
	10ai9itVhHHjaF2xlJL9s+XOoEkLmdXNRmQn6I4X0RzdyX9dMVFfJQRKCcdELsNTbJHkbYLUt75kJ
	uH3fuqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCha-0000000BrBA-1euS;
	Sat, 13 Jun 2026 00:58:22 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYChX-0000000Br9n-04eX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:58:20 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e6b5c374e5so1749742a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781312298; x=1781917098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL0Ledz5ddI5Gkr4vZQhSArwkkWm/15rROLq8VW4R/k=;
        b=arGn5PZGen2+PG9qMiqsEfQud99JH/vS6MIjUuTisC66FD+9ByADXtdFRHpv9u9xWJ
         LatDSg4emX1W5QyLWoU2H8jD/o8yzZIFZWaeitCWBkbPze8RTY9d6yHwjmjWaqXnGY+d
         yHOccP7cE+4JbhOTK+BsfZJmY611TJqHHQyhdtP3mcyEDbBc2BvQko+HMG/esyqAlX2Q
         Zc+vCaZ3wTXXHUsEMazn1p++aOyKRwDuc2GKr9pDqFIYKCnyISZ/vBbbrfPsaLtNKlGx
         PMtiFDr6GDNIauYanlSxpw2tNpRhi5/t4GGrf3T+lVDJUxoh7eO+O3SlL2ShGgLlv5DM
         3JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781312298; x=1781917098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AL0Ledz5ddI5Gkr4vZQhSArwkkWm/15rROLq8VW4R/k=;
        b=V3Fg8ZcEBTS5/FJSOUFOXBE/gkhxrPKvpYrf1Z746HTMgaPQa4nvAHX2tFqSeBQ9Vm
         L6jhxVL7WcyavSH86wGKvL7BJGh2QQRn9b8jLyoenp224WXBYlCXq6MNX8jIz4r+VvEI
         YqkgHT2GafsLyrSI8mXnMOxOAhN0eaG86JQHJZvSqbpWFou9zktmT5rP5iAvKG7a7ljB
         kts9fy3fB1klT/kjmKK3uVhROWRBuc9cfF+eXBGJnxDnFDE4E5Dsl+jePiTqD3phHmPj
         D7KHy9firJvN/NPqQF+71/rOLSCKS7ffxtcN9Nr0yNJPPHiAjzDb1ZWInEGWFygXboWP
         58Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/2T7qN9mLIE5qv43qP7ggAyZ0VbX/LOUYqnZm5IJVVe6gYyYaK11bQjpagUc9KBSihrnyF6m1/c8bT3y+eC+3R@lists.infradead.org
X-Gm-Message-State: AOJu0YyaWAVNPEQ8bFtfaWK1scYKLeNvE/FNs9F09ALZU8es8wvqKpT0
	FemD7uybEZqLHRThx6VbkuftARHdTga3IDORYefTSb5Uc25myd7TQ9Qq
X-Gm-Gg: Acq92OHCydjgpYcszasV0Lx5bRSWi+FRZF23lNc388SL2T+le9mfj36GuBTZPGgXB7b
	CxmJnlFMN3QwXucaCWsOI+DbSuQNUF16jnQyr48uy/O4x7SJVGDYBFxI1+/3tpZ4OnwuN+q+9wY
	vau5iz3D/di/k7F4Y1uLUDa3yhC77gq9mNSD2nzuGUd4fvciFn9FOqx7oS5tJL9CUUW5xHL1Dyy
	mA/TezoHbz+U1/QNuZw2AHZTCcPG+42V+EPXDxg6tbJuFsKwO7u/FeUK3Ykj7moYc5le4Afhvnk
	bpIfYYM08V+px15ZQZEnPfaVX6NvEI4xvuNCemaeYz4V4H/jxaSRLMFRw3TdEed6XClH1RB8K3C
	3VK1tb8OxLrs3t47VY42RupImEbdoEUz0KpFct22X/Cu+vYaJ3NzDdm1PRYw/GBwObckjT0zzuo
	EJ0N9DElhXEc9DOgxJMQd2c3ifLVtmcjcEv8bnjjza+6c17ewIozYgy6RTWQf+JUAAVjAp
X-Received: by 2002:a05:6808:c1fa:b0:486:caa4:ea44 with SMTP id 5614622812f47-4872dd9f5c2mr3185022b6e.6.1781312297861;
        Fri, 12 Jun 2026 17:58:17 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426abf260dsm3150731fac.6.2026.06.12.17.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:58:17 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Hartmut Knaack <knaack.h@gmx.de>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: [PATCH 2/2] iio: adc: spear: Initialize completion before requesting IRQ
Date: Fri, 12 Jun 2026 19:58:11 -0500
Message-ID: <20260613005812.160572-3-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613005812.160572-1-m32285159@gmail.com>
References: <20260613005812.160572-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_175819_070761_CEE153DA 
X-CRM114-Status: GOOD (  12.84  )
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

In the report from Jaeyoung Chung:

"spear_adc_probe() in drivers/iio/adc/spear_adc.c registers its
interrupt handler with devm_request_irq() before it initializes
st->completion with init_completion(). If an interrupt arrives after
devm_request_irq() and before init_completion(), the handler calls
complete() on an uninitialized completion, causing a kernel panic.

The probe path, in spear_adc_probe():

    iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
    ...
    retval = devm_request_irq(&pdev->dev, irq, spear_adc_isr, 0,
                              LPC32XXAD_NAME, st);           /* register handler */
    ...
    init_completion(&st->completion);                       /* initialize completion */

spear_adc_isr() calls complete():

    complete(&st->completion);

If the device raises an interrupt before init_completion() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access."

Fix the chance of a spurious IRQ causing an uninitialized pointer
dereference by moving init_completion() above devm_request_irq().

Fixes: b586e5d9eee0 ("staging:iio:adc:spear rename device specific state structure to _state")
Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Closes: https://lore.kernel.org/linux-iio/20260610115700.774689-1-jjy600901@snu.ac.kr/
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/iio/adc/spear_adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
index 4be722406bb5..ab02a14682ed 100644
--- a/drivers/iio/adc/spear_adc.c
+++ b/drivers/iio/adc/spear_adc.c
@@ -283,6 +283,7 @@ static int spear_adc_probe(struct platform_device *pdev)
 	st = iio_priv(indio_dev);
 	st->dev = dev;
 
+	init_completion(&st->completion);
 	mutex_init(&st->lock);
 
 	/*
@@ -329,8 +330,6 @@ static int spear_adc_probe(struct platform_device *pdev)
 
 	spear_adc_configure(st);
 
-	init_completion(&st->completion);
-
 	indio_dev->name = SPEAR_ADC_MOD_NAME;
 	indio_dev->info = &spear_adc_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
-- 
2.54.0


