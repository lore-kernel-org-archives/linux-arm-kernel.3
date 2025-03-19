Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E507C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wPWYe9eR/3ZvAgQvDxg3SYoxP/A+rutkYayuMKJSKU=; b=nyP+nl6p9i/GDZryOyW3FzFl5t
	bM7XcpUSnmuXRVaP6SkyjVkqzo25Jk7x+JcmITy20zLM5LGUP8hD+UiEqbzqjd5ixW87X5lLM6ZPX
	2JSYjzQYDdHbEor98gLVTC05NV6wAQTYe/vnNiWA/R6t8u2wmHu0s/MA/eyqQmghfFxTuZs4xIG9Q
	Pd6fnUZa8F7zKwOiRLUALT9pBafdkbzgN6bABgD1q8k4tpjS86iuZmKmmure/22obsbsrmHWWdfbA
	kGcJyPGkiap1WlFmdC9hL2bYSakzf+EvKxGNB1q6duB4VkBebyYVycd2MEu08mkpCGY4T8QTA2fM+
	L0v29IUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqCo-00000008bF5-4Aui;
	Wed, 19 Mar 2025 09:59:22 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq5Y-00000008ZWT-3Tzl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:51:54 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2DEF8C40828A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 10:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2DEF8C40828A
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: ARM64 GICv3 IRQ handling on i.MX8MP
Date: Wed, 19 Mar 2025 10:51:45 +0100
Message-ID: <m3y0x1e4b2.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_025153_032547_4EDB16BD 
X-CRM114-Status: GOOD (  14.50  )
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

Hi,

I'm looking at the i.MX8MP I2C transfers to an image sensor (Sony IMX290
and 462) and I find the following interesting. I wonder about the time
spent before the IRQ handler is called. This is mostly mainline v6.13
kernel (not any of the NXP branches).

The i.MX8MP uses drivers/i2c/busses/i2c-imx.c driver:

request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);

As I can see, this means i2c_imx_isr() will be called by el1h_64_irq()
(constructed with the entry_handler macro). el1h_64_irq() is the
ultimate hardware interrupt:

Call trace:
 i2c_imx_isr
 __handle_irq_event_percpu
 handle_irq_event
 handle_fasteoi_irq
 generic_handle_domain_irq
 gic_handle_irq
 call_on_irq_stack
 do_interrupt_handler
 el1_interrupt
 el1h_64_irq_handler
 el1h_64_irq
 cpuidle_enter_state

Now I put some debugging GPIO outputs (very short) in both i2c_imx_isr()
and el1h_64_irq_handler() and this is what I'm getting:

- the CPU gets from el1h_64_irq_handler() to i2c_imx_isr() in less than
  20 us (sometimes < 3 us).

- but, it usually takes like 350 us to get from the end of I2C byte
  transfer to the actual el1h_64_irq_handler(). This is the case when
  the CPU is only slightly loaded.

- sometimes el1h_64_irq_handler() is called within 2 us after the
  end of transfer. This appears to be much more frequent when I put
  4 busy shell loops on the CPU.

- especially with the busy loops, the I2C IRQs appear to work in some
  sort of polled mode as well - the el1h_64_irq_handler() isn't called
  before i2c_imx_isr(). This is fast, though - ca. 1 us after the end
  of transfer.

Why do the times between the hardware event and the actual call of
el1h_64_irq_handler() vary so much? Is this some sort of power saving
issue? Maybe I can prevent it when e.g. the I2C xfer is ongoing?

BTW it appears the I2C transfer times are much better now (in comparison
with the old 5.15.71 Freescale/NXP branch), most probably thanks to a
recent patch by Stefan Eichenberger (5f5c2d4579ca683 "i2c: imx: prevent
rescheduling in non dma mode"). Still, I2C is (in this case) 400 kHz (or
so) and the IRQ delays make it much slower.

Could that be caused by the ATF/TEE?

Obviously, the "polled" mode isn't a problem - only the 350 us delay is.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

