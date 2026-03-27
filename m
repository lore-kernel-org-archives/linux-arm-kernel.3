Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A80010F285E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4058XtpebnJNJ0w+uHtlDdeXOwVoOI6qmJqEKpILNDQ=; b=mtzg7/d1QiiFuPDEmVipN9LTZd
	KAvAHwwDNHqY0Bgakp7n35N/ovu0hQTcYpYZ8pa8wIf96ulmsRlgcKUQmxPMf1aOnRvl+YYViMq81
	zon7aPibAtXVdgOy+ensY4RqlpFFgW+13pmNgBjkqbC9tkzVjV/eRv0MyV0Zwt9M0/r42SR6gRiW/
	9e46CJeaysiCI/Q8Qvpgaxd9bm3x7d2MIiSp2QxNmsSeplgPs2gKVJ98fUhXaulxxOJtQcwH8fdID
	NYF8JXpj4jZY+iQObkCvOaTWmQb0YIrb4+I2RuLZKOtstz2oP8ysMbhk/dAVTHzgc370MUVbJmeWm
	j8msppuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AmK-00000007qBI-3yGs;
	Fri, 27 Mar 2026 17:15:24 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AmI-00000007qAm-09cD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:15:23 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-0-165-nat.elisa-mobile.fi [85.76.0.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fj6hw1m7bz49PtJ;
	Fri, 27 Mar 2026 19:15:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774631714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4058XtpebnJNJ0w+uHtlDdeXOwVoOI6qmJqEKpILNDQ=;
	b=iuN8x1bX1Q1wJC+L0CibPUxnWESiQo8/OmyERfTJhNwLWT0Y7dWmnIXuV5oQ55oiVYTimF
	MUbrL0XqkVhtXBXhImO/FO2Elltiu+vt7yngEiqQNgwSbKCSfeIE6X65AMhx/YGS7sdLFb
	3AC4Pv/VVcpkrx/T5blr9zG8BOTW25ucj9wpr+Uk/4KWqAEgoeT4xflc4ln+Fx7JIgjz1u
	HTa6j+FdAbbYF9eLSNQhMY13EqNalGPRgPlf3jSbvciCHFEinaOp4Ch6J8CybxpVIQHp6n
	Ameh8ARzo/3inpHbeqiKb0rAg0m2/Hh7IvqyKikKWaSWqhi0hvmN6+LDCznIPw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774631714;
	b=VxBVYRVt4+sEM886Qmcvr1G3qr4SHSzFr4AITzSPUjLe/9Vgv1DuI/L2kBkdbAaIgCVvI4
	ylIZ2XrZY/5iTc5verBSLUsvmRW04pQRkY2+uXUfoUkkA9AaL8soy9W+OfIrhtYXVK3dJO
	c6vjNu20Kdv9P6gJAKFzvh9UqLo+0zVlh3yiny5HPoEiFz0UZb1XsUPw2QcFvw42VeXGKr
	HAER14RySdHODFY0CI123P6H+euop6Sbnu/PAvy53K1179lBbmResepQ6PKIoxWQXcmz8N
	yxWcpEHDng9vNO9Y97uwkCGaQHAxf5WVKsCKEAla4FmKQHUpnc6I0POwYUOLUA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774631714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4058XtpebnJNJ0w+uHtlDdeXOwVoOI6qmJqEKpILNDQ=;
	b=mOZGtSakUSgKFtinYZvLYm9BqJ/Qo+UkG1UV7M+rJqW8qL+PNGiev53EWJCvTgiBBEtVfd
	2FPAzo5p0TQlWuthUoTfaohd0QmZqjd2rEd3jk0djSNXBH/OZh7mec+Dx9EJKXDpA8GGcH
	500+JOTTGRQF3NOgheVI+So97BMqwV8G7qr/ME6tBS+sTOYOhu1ydfaIanYO3r27zqBbHq
	wiiieMGer5xRVY/2MREeuBZ5qUdims9z9raqFQPjjCFlkEpOLtyqHIbEkfAg08sLW8YKu7
	6zChMbrBDfraTRo4M7LtI/Qgu0nVi9bysT0fGcGMxuPVGLmPvfKq2lfPT3owAw==
Date: Fri, 27 Mar 2026 19:15:10 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX
Message-ID: <aca7HnXZ-aCSJPW7@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101522_234983_B0107CC6 
X-CRM114-Status: GOOD (  11.46  )
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

On OMAP16XX, the UART enable bit shifts are written instead of the actual
bits. This breaks the boot when DEBUG_LL and earlyprintk is enabled;
the UART gets disabled and some random bits get enabled. Fix that.

Fixes: 34c86239b184 ("ARM: OMAP1: clock: Fix early UART rate issues")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/mach-omap1/clock_data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index c58d200e4816..5203b047deac 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -700,8 +700,8 @@ int __init omap1_clk_init(void)
 	/* Make sure UART clocks are enabled early */
 	if (cpu_is_omap16xx())
 		omap_writel(omap_readl(MOD_CONF_CTRL_0) |
-			    CONF_MOD_UART1_CLK_MODE_R |
-			    CONF_MOD_UART3_CLK_MODE_R, MOD_CONF_CTRL_0);
+			    (1 << CONF_MOD_UART1_CLK_MODE_R) |
+			    (1 << CONF_MOD_UART3_CLK_MODE_R), MOD_CONF_CTRL_0);
 #endif
 
 	/* USB_REQ_EN will be disabled later if necessary (usb_dc_ck) */
-- 
2.39.2


