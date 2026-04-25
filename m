Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7430FFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wdzu/OjVJDdorng+o0yxXBdxT5kIS9RVZ5Y0mWK92GQ=; b=ienEbUVAdUGvXHaeLajVHWidkX
	6kdy/jWVeEtRJcTPOzKWs241A0FNPB/SQrK/0pJA+NXcN8QAPMv5G5etBj9s7Jrure9R/z4z3Bpr/
	Sa3lTYCaBCj7L2iiGd8dp1AfGMkpMT2CNyCzBjjzOpPt3CLjMYo75ShHrv25ZoTpmeHarWFppJjv5
	2OH1cwJZ1UsTEPnOPjFA/o8uJn8c7bTzpVSeIeWhpxOE4VsHW4tsI0mVW/+yitC/JZHZG2J9T0RJ9
	jKklBW+02C9U/2g2ecx/BcOHTuJcTjxMAlj6RTz8oA9gCkkBQ/ogi9REM1U5/2+XdmBYjVkpMxLP+
	FFFaRHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLL-0000000EHg4-1lIw;
	Sat, 25 Apr 2026 09:30:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLE-0000000EHbi-3ugf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:30:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891b0786beso57548195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777109423; x=1777714223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wdzu/OjVJDdorng+o0yxXBdxT5kIS9RVZ5Y0mWK92GQ=;
        b=q2PcG6T4lY5UXJQoKIYXmFnnzY5fTR6jEPvn4PkzOPlZIeufSak83qpkC+4rfm6S/y
         GWcidoL9jRFVeo/BfIwuHURjHFvfZ727qG+jYcOWnI6/UpPlPFbPXV5R4QJXiRoc85F9
         t+IgkWHAyFaYBWWU4vZMjOGL6+MgRU9q6SZYcCkfn36hsVxdPnkWYtU6TLNRl5IGuVLN
         85H0p/JwZzcvpkwJyF4C8qKC01FYjwjEHjP/gPulwSIJoQN2q1qS+MZLQyC6H9+/9AwH
         NQ54GmsUhIzWoscW8dTcfI4V04heICL0y7XOOw5SD/AvDiHoqAD1gM9l87mItqzWRt96
         QfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777109423; x=1777714223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wdzu/OjVJDdorng+o0yxXBdxT5kIS9RVZ5Y0mWK92GQ=;
        b=TP0rTnINYWLs4Wh+ONRNUkP4hzr3tK9AJ2YdvoZ0GM4ZvN5YRfbFbop6Myzoro6u/C
         YeL/r51OJHIL4P/FfpSBeDMzTui+HfI8D1au717IxqF8CNkgUHhjmyJtTqxgH+280sU9
         56P0bBgiWYZLTgf0Ycq5FywO8Z2KWki25Gez1u/GDpITz/nYWyWkigfJTBOh/5OsCTNI
         wQjsiyd+/IW6W/vNj+e5w5hAOwcDi5WV+39fB9OR0LhG/imZO7C2Pv2kEATCRHdot4Co
         WrcU1+5rapvJ8NjgfSxQ/VwIbdg8iEkvwPmosm/ez+WmeQgR3Idw8X1mUz6vW4vY1HW9
         yJNA==
X-Forwarded-Encrypted: i=1; AFNElJ8KD+OUf1dSZaQgwIMpPuJawK1HynaimBL0SLMXljjfFn1yTI/frt3ehVAi7PCLAyfivZqFf8aiQXAFFKSFRNEY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+XCO0T8Hpud2HAg2nvznsJZ5lsOYYktMAE/7tnIFEbsL7mMxT
	YPIX8M0edKuWNLu40oL0qdUv5cyWer++BiT3f3AXxQyoluQpWBdY5Wa5
X-Gm-Gg: AeBDies5eLtpZNYyadPd6MQu8oHIC0yWwCIIBgOv9CZhlUievhSRSgwBx8FkOYEwUW4
	IVqLWyN8fWGsd+IqN1UZjxynJyJFFyIV11aQpD8dM9qD4hcq/KSPF/RINaMKThZYEoqhSy+8doo
	zDbkndJ1LCStB83Y7ZKLJzKzzmLGYVYbptRh1JU79ypVtSHrgxbYp1D6/aL/vgZpQjZT5VcZvkB
	jwvRODzVZ6ScvdwPmwxN1YGdXLmgEo5cl9TOZgGRA+SDkzVfrnDg14z2tSmND4g5mZVK0nfIFA9
	Lb36DwJ/akTy0EKTGuN6alyI3TcYcis3jP3xk2+gYQR3rwLQsfNDwiX/z2W3ocLOZTptYGa13Sb
	/Q1CcerAwdKxFANpqtgPWG8c7S1nPM7T5g7/YT1xu2hNIgtRsH25jsqgZHZTh+fin7WSUCgMvGU
	lAOu2IYJuB+6SrwZ9PSJd13QaiXhQ1TWFkKUy6y9kVupfzraqwl92qLkxXTDX0Tjj7+LxFO4i4K
	7Yd
X-Received: by 2002:a05:600c:8183:b0:488:b187:3c with SMTP id 5b1f17b1804b1-488fb765ab5mr507183895e9.14.1777109422978;
        Sat, 25 Apr 2026 02:30:22 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm204422615e9.30.2026.04.25.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:30:22 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de
Cc: jon.lin@rock-chips.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 1/3] spi: rockchip: Read ISR, not IMR, to detect cs-inactive IRQ
Date: Sat, 25 Apr 2026 09:29:34 +0000
Message-Id: <20260425092936.2590132-2-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260425092936.2590132-1-john.madieu@gmail.com>
References: <20260425092936.2590132-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_023024_983076_7F454019 
X-CRM114-Status: GOOD (  15.63  )
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

rockchip_spi_isr() decides whether the current interrupt was the
cs-inactive event by reading IMR:

	if (rs->cs_inactive &&
	    readl_relaxed(rs->regs + ROCKCHIP_SPI_IMR) & INT_CS_INACTIVE)
		ctlr->target_abort(ctlr);

IMR is the interrupt mask register: it tells which sources are enabled,
not which one fired. In the PIO path, rockchip_spi_prepare_irq() enables
both INT_RF_FULL and INT_CS_INACTIVE in IMR when rs->cs_inactive is true:

	if (rs->cs_inactive)
		writel_relaxed(INT_RF_FULL | INT_CS_INACTIVE,
			       rs->regs + ROCKCHIP_SPI_IMR);

so the IMR check is always true once cs_inactive is enabled, and every
PIO interrupt - including normal RF_FULL completions - is dispatched to
ctlr->target_abort(), aborting the transfer. The bug is reachable on
ROCKCHIP_SPI_VER2_TYPE2 in target mode with a DMA-capable controller
when the transfer is short enough to fall back to PIO
(rockchip_spi_can_dma() returns false below fifo_len).

Read ISR (which is RISR masked by IMR) so the check actually reflects
which interrupt fired, and parenthesise the expression for clarity while
at it.

Fixes: 869f2c94db92 ("spi: rockchip: Stop spi slave dma receiver when cs inactive")
Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 14cd1b9d9793..de39f5da62cb 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -357,7 +357,8 @@ static irqreturn_t rockchip_spi_isr(int irq, void *dev_id)
 	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
 
 	/* When int_cs_inactive comes, spi target abort */
-	if (rs->cs_inactive && readl_relaxed(rs->regs + ROCKCHIP_SPI_IMR) & INT_CS_INACTIVE) {
+	if (rs->cs_inactive &&
+	    (readl_relaxed(rs->regs + ROCKCHIP_SPI_ISR) & INT_CS_INACTIVE)) {
 		ctlr->target_abort(ctlr);
 		writel_relaxed(0, rs->regs + ROCKCHIP_SPI_IMR);
 		writel_relaxed(0xffffffff, rs->regs + ROCKCHIP_SPI_ICR);
-- 
2.25.1


