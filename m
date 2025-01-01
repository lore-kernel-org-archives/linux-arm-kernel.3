Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF62E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=; b=LImVobHpU9zKJJkLJeU/l7IzJ4
	xa6s42Rcp1L8chB5OyoePpmftzOnDehxYZ7UnnJAsKI2lXstg5e89tjypdMuM1O7XFB2ogEsvtRr8
	X4EL2M/VkujgYOzkntH2wY7WESMerR4LKMIjDXUM+QAgyFl9R+1MNvLGN80U6pWGNbMrJcYsFNM4x
	NhCwTDNrrARxGzNQLTseyx5+HR0II9Qu7GRePrtka5G+CXSLVe4zkJeKYKF75vESOw2KvrUUDwpH/
	V+vi8aK1Iu0Lv7j/ed4R1MEm2lYMEd/90urnAoUZKpTDAhNBgaa030ydevwNcrjaRrArluSK3e4nb
	o4UPcCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxbb-00000008b5u-0Ys0;
	Wed, 01 Jan 2025 12:13:43 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSxaS-00000008b3J-10bK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 12:12:33 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YNTH53thszyVQ;
	Wed,  1 Jan 2025 14:12:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735733540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=;
	b=EudnyMcg1iQcq8/ZEjhKmchdAPzlfM3cdj36jVGhDUvaTLLxAfYmdWJ4ca/R94pTAUIe6G
	1utTBYxucBtu/o0Bf2Gpe1f9IL9pbtguIUsRB0A4y4HKwxw+cuaymYuOlKd/pnTuy6Xujj
	Aia8wzvhUB62TeEPapgXby+4xz5+x7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735733540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=p+QcDoxis5JV4EA1Ucztgu1StoLe88duA0WfWrb5V+g=;
	b=qZ82c404DqARVAuSM6CpuHBLoU1MTfqvthsQKlUV4S5YtYAN3p+r3qtV9GbSzWDOuAg57o
	ur0U9cIWmDxTlFTpIGvx01WHfs59Bxpl20+m4URJEKXUFaGIHacNVpmU5gPKR2NhxClkpb
	3DlMiU7gB06j4FnZtLSMLAmycwa50Lw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735733540; a=rsa-sha256; cv=none;
	b=yBfjHO49fQMOaiVUon7Yo9JINkjs65izR+TOKUK6XUzD57y+WqslKPQmiDZzXtcNGTpASm
	g7KtWhlEdphRsOMbQHb5sSV9guk/9VfIS6rlqCjJzk5KgtvGkX0qtok4mcSeKfauZnv1Pt
	8VzaiNEoo47StTQPPsaya0B5JVrB2yI=
Date: Wed, 1 Jan 2025 14:12:15 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
Message-ID: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_041232_452107_1592A143 
X-CRM114-Status: GOOD (  11.42  )
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

The Retu IRQ is off by one, as a result the power button does not work.
Fix it.

Fixes: 084b6f216778 ("ARM: omap1: Fix up the Nokia 770 board device IRQs")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 3312ef93355d..a5bf5554800f 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -289,7 +289,7 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
 		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
 			    GPIO_ACTIVE_HIGH),
 		/* GPIO used for retu IRQ */
-		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
+		GPIO_LOOKUP("gpio-48-63", 14, "retu_irq",
 			    GPIO_ACTIVE_HIGH),
 		/* GPIO used for tahvo IRQ */
 		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
-- 
2.39.2


