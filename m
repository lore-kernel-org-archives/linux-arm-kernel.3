Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FE0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VB4PgcZ01Fib8r6PBjxZYMBn+UiSZUTB5bok31SdtI=; b=OQDiWfqPA2b+X3562ZKY+zSQn2
	LrqIjcE9pE/PKvegNyKPw95SrHEJgGuB1dlxApNwsgdHpC31lobTNCu3STJu7sfCiJdvXM1JlzK+H
	4yqbc013o4238peQly/vjayjo525A44ZntrhwNIVu+6wxTPer877YyQxvGANl9aTdzYswR/SlevRk
	7YOWBxBAxzsSzJggmkJ8TvcISrhTKFOZGwILYOcq54mS+oithEJGYxnwAfrtv8TBFhKEnRCf56Z3q
	Ae1ro7BrA+kHo/RFV3aAG4qqv0rsku9AHwxckLJOq+fL5m2SFSGd3UAOFEAfsVIHIYf/axwzWKdNZ
	hGqbpiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g3-00000001rpK-3ySh;
	Wed, 13 May 2026 09:14:51 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5fy-00000001rlA-0gn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:47 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so109405245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663684; x=1779268484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VB4PgcZ01Fib8r6PBjxZYMBn+UiSZUTB5bok31SdtI=;
        b=qnQRqUPTzPKOvNsVLFKArs5eQcQcYezbRjt5ALNvf+lpzTEFGlfd5rUuvbJmShv9L/
         DsRL76ym2+/bUxQdlfQxtW5Q9HPLNDeQi0V2at+iUmRJtNGgxYENWDeTaOb2vi2pYw71
         Tq3n3gd+f3wHnlA3BovhPy2YIuUeB8Yyg0eaoKKECGbKJNMWELWLvDy95JrvLICkRF5h
         dzZdhi+EjcdLERremF8TsrUA6A4Wkia2O/NtdzFpOoDVTt4CNjMnPVGWkKBIiZrdQYZ+
         arZ5tL6772ef+cUmgma647xAutdKWvesR5JIpvL36tR3I66U6F9xixRGyS798txK8F5e
         EvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663684; x=1779268484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VB4PgcZ01Fib8r6PBjxZYMBn+UiSZUTB5bok31SdtI=;
        b=F91+Jjb1mpIS9Wj4jUkYLbKedRS5BOxVnd9gNdmtpA321i3PhkySlqd2viIF56q31W
         7tJduhOo+iKlVuJAMTy3RKxNEqcLzATi59b/yImCsyHexZcfV0FLadG4FQICtdeDGeYB
         JhdjcA1FD5yHkzfFIyVYpj/Ie9/+dQtXoAB7rHdBRdu/SIyVrqUUOaJx0wlHMqzpPbDs
         i7VUD+uLWUMLFVqstiZKTaprY5dj1b8ea1cWW5OzT1FP+hW8MGNs96P6F8DajlEEq9zv
         /sCwSBwc37zuFvDfL/UoPo/d7wr2V6Ir2EqGbEh0ferV9+MFJNt50ALRmxTR2gbTvYxw
         z2jw==
X-Forwarded-Encrypted: i=1; AFNElJ8/qua3n0jAhDBzZDqVgGA1s3DzBadpnY19kMktM96z62+PLhGggoK4C0MaoFC31TMgUf+RnZ6vn6jH7ceSFEN3@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBe3sR1ACvAjFgV1BOwsGeHBe5Pl3KK2RL5r0qz57dW1/EpZD
	et0w6r8pZ4ZROE/nfnR00IfyqhPW5lVWU4SjOYBnuFYGYPp8BhjY+C14JoeUAhyILgE=
X-Gm-Gg: Acq92OHlXmtinKCgCzwB1tNOeXgBgWsAnr9X8/Cj6SrzwLpAjJGjTwBlL4pHY9EcwS2
	6ZwKk9NRsMh3kWqVCFb6y4oD3YA9Fi5vbdfEtlDhZHyPcGN+FKIyjGUvgT0lTVihclDTtbN7uPw
	+Hnb+DcGWXGc4JeaLgbFlKgJiIw5VzulwULvZyk+H3yiCAbk43YeQLM5hSkvJuKPGX8M+/RPaEU
	ySl2wvGAFHO7H2zKek9F/XY7kPGQBh/f8W0rAaIp0/NKezWaPvy1PmKIQ8n2twIff6hgCMywwR+
	4VlqFa+ZhvO8i7dUfisoc8NDNoqPEtex+/dNzm+gD9UsHwlV6IJdt8SYulry2Gb2m9byGl+h4vq
	CCr+7aoE5d71rbh3Rg2zgnvH9kovR0kjZMuGvfe0t81acZVr1TYFrQRty0NtFxkFe6CfzWw+0vf
	Q2RI+S6XA6Dh6AOiD8x7geePmM5q1e8pU=
X-Received: by 2002:a05:600c:19ca:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48fce9b9fb4mr24088665e9.7.1778663683583;
        Wed, 13 May 2026 02:14:43 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:43 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:27 +0200
Subject: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_021446_230392_4E84C7E8 
X-CRM114-Status: GOOD (  11.36  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC clock names to bind with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b724d7fc1a08 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
+DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0


