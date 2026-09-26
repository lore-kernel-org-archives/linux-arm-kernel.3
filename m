Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88B7C98326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 00:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lNkdwYA6jM3MWWOGlSN+cxClsTBHiOh8WfmAfJNZcGg=; b=FxLLQktOUg78nk2perkOqSTqAt
	FVwxF9NTUgzScZziN/qc5eVigTX+/KymeLZfLo9U1XRzTh2YvdnkKm6o2BzbmG76YuHjimiu8ncst
	Y2dHqhv+ywkXuaD+CV1U4UcuGtKexsSR4isb32oGIlCOcGcvYkB89IPtU8M5UP9B8wd+OOCKYT8TD
	U1QLAhnxlPNBfqZDHbW61zDUVHuEbbpwtqUTtb5cHAX1htR4smKLrujYHsEQhYh29hQR/9aBw2tZb
	EwmgFHruUDp6QEN18x7A38wONSdOBfFmV3key2iPaCiVn9dzkehGjSCU44vgTlks69Px5jJT2QQyB
	VMzeY3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGTw-0000000EkYy-3HYG;
	Sat, 26 Sep 2026 00:41:36 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGTu-0000000EkY3-3w8P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 00:41:36 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843796e373so836510f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 17:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383292; x=1790988092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNkdwYA6jM3MWWOGlSN+cxClsTBHiOh8WfmAfJNZcGg=;
        b=sQqwA108OTaSCgohHDp/6ORg+QohiBZwsrbG5LvRm1RTNFll4yddTsQB0Gm8T3Rffd
         pugLwRHrg6Mj/LF2GrOMLJdlrvnL6FjYUP/UfRFsXX+7YUDXM55ft6ieaXZnnfMfm47J
         NSTqbkZczxIfsfsHtUlqYtOfrGD4ENc7uELF9FvichOcRYaA1kBM1ARhlie73Io61VHJ
         UHL6MTENfmUoz7PZGNnbpqjtdRYo5v5W5TJnUQ8QLT3f9899BREZBeLQfk+40dsoiHA4
         djcppEqcsAZn3l6Ee96V4hQjuQNGbPEEL9RZU7LOYr6pg3DiCDfMTsc2KirceBXmO2M1
         LBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383292; x=1790988092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNkdwYA6jM3MWWOGlSN+cxClsTBHiOh8WfmAfJNZcGg=;
        b=KZptH5DZxi9gnng+wdfJfKVnQLDpe3nKLc7fU2OjKJBy44pDnIXYbaR1PlFMzjHLo5
         a4CSjXvwjqTMouychsjRM9slU6oEuzbYpFVbJhIuw43n2XYycWlMkt6rGF50ZGh66mQd
         vzOljX1jbQ6i3VeabmGdDW5MXwO4hceKD0vqlh3vkFJV4K52SU8tR/h2RlUYVyH2dKoQ
         hdAvpFnylx4N/C0NXNaBpeRYUYrBy5yWluC5Ite0P4hXcIHrqwEouoE9vJaCb1l0TD0d
         KAYXzpc2918/cTr/i/fTI4fFklKoA/depkbVypI4ygP6v9PsJYwKpTXHXj5Xdr/MWPB/
         RWBw==
X-Forwarded-Encrypted: i=1; AKwUvBwelE/XQEiomtD9MOfe5SxeIoywifhGN8Smfc1+ZiheWW9HALflZ4QdX2P15FBZycyh0yY3ZMYzk8OPYtABZaUs@lists.infradead.org
X-Gm-Message-State: AFuF++kmpZgum8vGcUAukhVuMIoEFDnkKegeGWmeMP+htA46AIRqIwwl
	k5qxHZkZ+VtNvbXZ35VmJIOoyS1SYsSVD0v4lcaYadGdtf7XCDsi+Pxt
X-Gm-Gg: AYBFou0HdaD3wsLJZvFZ6YG5WeOpkKS2WHzsdBptPRY0le1msw4pc2R/f6eu92t2oiQ
	Pf22/9/2Chixz/SbRZrdplxVAyQXeffzDHzq01HFRJk1Rp8HPLjspPQMAGMlQZHjdBbnExFfjgf
	FXMmAcmK3X1XvDKxfw2RrJj09Co0PXVVxwNDAEQvAjrn34+SDlZdSLP4mtBS+ssKsfHalYI3g8V
	drgK50jDaxCE8BHtdm2LFCyhNadoyiohFcR1kIYLl173MlYma6+V1ReMdhdnViT2thVU8prN/ER
	pnCah+9Q1Beb2du25T/K/uAPZ1otkaLF1P1iZ7GGjUeh95aFxvhbr7Lg6mwwdlPdnY1FBMgp8mp
	oEzAmZ2MPeAI9eHL+CEeVDqhIy48y1hlsNa6TlGTNxtCBy4AIJIAeaA8uTXtJE8G7rn3KubxJR4
	FXurXYEgqOeEOgtIrl479l5Qss/4sWqt8qjkX+4K+1E7M7IuYDmNlfetLG2IXbB1IBHN15NdS6o
	+ZAYovVVi83XweU2exyWlWL53M8aJymtoIfqQ/HNEuGxTHHVxEOfBzxRDGGQ15I6K045Uw+B7vU
	b3RrkV0akHuqrdB47QQb0zNh8iQzs3DOERUqrEkCETsElmmjnuOtsD8hbmb3lMU9toWE35LB/09
	OTgvHNT0=
X-Received: by 2002:a05:6000:4285:b0:485:8fb2:b8cd with SMTP id ffacd0b85a97d-488716b2917mr14426193f8f.6.1790383292443;
        Fri, 25 Sep 2026 17:41:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a9e5-4c01-21ce-313a-e569-2df7.310.pool.telefonica.de. [2a02:3100:a9e5:4c01:21ce:313a:e569:2df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm10350830f8f.28.2026.09.25.17.41.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 17:41:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Rendec <radu@rendec.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/atmel-aic[5]: Disable interrupts in the irq_pm_shutdown() callbacks
Date: Sat, 26 Sep 2026 02:41:24 +0200
Message-Id: <20260926004124.88221-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_174134_994104_B4DAF770 
X-CRM114-Status: GOOD (  14.65  )
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

irq_gc_shutdown() calls the irq_pm_shutdown() callbacks from
syscore_shutdown() with interrupts enabled. aic_pm_shutdown() and
aic5_pm_shutdown() take the generic chip lock with raw_spin_lock(), and
irq_gc_eoi() takes the same lock from the interrupt handler. An
interrupt from the chip while the lock is held spins in irq_gc_eoi()
and hangs the reboot.

Lockdep reports this on every reboot of a SAM9X75 Curiosity board:

  WARNING: inconsistent lock state
  inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
  busybox/101 [HC0[0]:SC0[0]:HE1:SE1] takes:
  c1c2b434 (&gc->lock){?.-.}-{2:2}, at: aic5_pm_shutdown+0x34/0xd8
  {IN-HARDIRQ-W} state was registered at:
    ...
    irq_gc_eoi+0x28/0x60
    handle_fasteoi_irq+0x120/0x214
  ...
   aic5_pm_shutdown from irq_gc_shutdown+0x4c/0x58
   irq_gc_shutdown from syscore_shutdown+0x5c/0x9c
   syscore_shutdown from kernel_restart+0x34/0x78
   kernel_restart from sys_reboot+0x180/0x25c

Use the irqsave guard, as
commit 33517881ede7 ("irqchip/brcmstb-l2: Use _irqsave locking variants in non-interrupt code")
did for brcmstb-l2.

Fixes: b1479ebb7720 ("irqchip: atmel-aic: Add atmel AIC/AIC5 drivers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on a SAM9X75 Curiosity with v7.2.8 plus this patch, PREEMPT_RT and
    non-RT lockdep builds (clang 22, LLVM=1): the report is gone. On SAM9X60
    and SAM9X7, lockdep only gets this far once the PIT64B timer report at
    boot is fixed, which I am sending separately. The irq-atmel-aic.c change
    is build-tested only.

 drivers/irqchip/irq-atmel-aic.c  | 2 +-
 drivers/irqchip/irq-atmel-aic5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
index 1dcc52760eca..4a7935e75e4d 100644
--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -123,7 +123,7 @@ static void aic_pm_shutdown(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 
-	guard(raw_spinlock)(&gc->lock);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_IDCR);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_ICCR);
 }
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 1f14b401f71d..07a317ed06ef 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -217,7 +217,7 @@ static void aic5_pm_shutdown(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	int i;
 
-	guard(raw_spinlock)(&bgc->lock);
+	guard(raw_spinlock_irqsave)(&bgc->lock);
 	for (i = 0; i < dgc->irqs_per_chip; i++) {
 		irq_reg_writel(bgc, i + gc->irq_base, AT91_AIC5_SSR);
 		irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
-- 
2.39.5 (Apple Git-154)


