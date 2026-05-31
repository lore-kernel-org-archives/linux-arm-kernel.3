Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DEFCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=; b=sSWvkAE1gAOTQoRei8QUM8Sk39
	xnBg7RqArBGghbddpSQWqgL8snEs1Urho53ev7I6UXdQ1Rleu+x4wnZPJfvlG01JZA92Styw+zytc
	hY72eju8u6zWuVGvVdf5hv25nYAQXw0swIq1k7kRoGAGP5MWOmYHabat5v8/aPhpFtW3ZtFDDPtZ0
	wELHmbsrzJyB0ImohYUa48i5y7Scm/AIdMpqJKP3/1/So43wZffwAE5TtL+Ss3X6oo/c/v6hl0VYM
	NZve0PZyzLIYPDC409QjZYu8PFnR3FLFeBX6mzTrrq6/Q+dloAtvr9YvFN0nBW17HhqdFzbmPWbXz
	sHmFwpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009geC-08ve;
	Sun, 31 May 2026 15:26:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi38-00000009gac-0hLN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1699223f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241160; x=1780845960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=gOiP/eHM4YgLvfsVPOTq8Eb5o9+W3KB1MVXKBPdSoT8NyGeL97N52OyHjdVtFullCU
         XS7Zj+y3og7xHkWhM5NgbwyJ0GnihqijLTul3+dxJ2btpJ8NlVW9W4NUyx3m5LJ1uqar
         zL0Gra7VdCM0+ETi6ipBGsbjHs1RRTDCvDZPbnsYkB/CsnooOdaOfE4H9hn40iEY7chG
         ywW2oY11i10clQRYpHVxXaIyAVOUXbVfyzVSVaBWGeuw9hDpKyvCnPMg408NOezZBk2t
         SGKD1pqq28iWFC/eDfQ/Vyeo1vRedlYz/rdDYmVRSM4d1we4zRIkIza0yZ5o3pmU2mY4
         AMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241160; x=1780845960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=tISEWl26VVbJpGtqGPJqCx0pww4UHR017FBIHq2wvXubbKz5jX77JeyLbDXd1N80No
         MuIKng17KLiduFO4R9Tr7IjnsViiGRONNf8jnf04BT2WD+cliKqFZNfd37kUWurw5Uul
         ROelVSyPaWs0IUgK87QhBirfTW71Ro0yHqH6GId6WC4Q4fQm4JMdMuHDxQRmMn9sF57s
         ijSa7H8xnrnibKC9SeZkz2dCZEKc4H3Ow7g/Srbqj294EyPNx/lZ42f67D4BHq7ijrIL
         CPJJ2b1wm8vFFYvvaoL8FqTU5rYCRFvxs/YFHwz6LBivLa6rjaIlAbzkMYjQUXmf+gHi
         zgoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h1/VNU6ZkTC0VaV8frW5nI61pJdGTgD/Ai+JVnsJJRgKo7oo6H5ES/wQ0L0SAGLI9hVyR7qMGm4/xoPT+NLhc@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsJxwF+Kv18zEO/fX9FOTAuENslvxQKVjCsfuKgOw7C7bAYFT
	JyDmhWhbhLjumizgjGTWrlXL9qv2NP5NeiuaGRS/VqC13YLOI24zbKdIcROmONxauOA=
X-Gm-Gg: Acq92OGBcXEYtxIHD8jwBm2vRBTWAl6A3A7vqdHkql37qCc/8qjob6WnSRE8ZOfDCX+
	0/Sp6ejoPxvlELffl0rFq9EjcltDsAEbEznpZkIbEElgMWPYP+nmnTfm6hpQX+p0MkiV/V4RNRJ
	zZ+sLkeLmd1UwD3ecPhbN07zVQpZQIbIsjZwMAdbeLOn2JS4IwIHEzqwPsuglhvthWwOeX/Voq+
	WnQcs+TQsvd7c4JkZ2/j5QrU05rDxor1EoOahrdC1kKHpVQMrXNDECAOrvEKdhASxLOdbtbRJ3y
	lbizwIEE2dpXT+urh55UfQXtAibfMs6tZ6S3BwCr07q9gcKqdORI33T10IupJP11B5s+w1peIkm
	1JTVwIvRnzBoZ9YJsLAksUWQZpGBkkCHP/YqcOch5luVWfQ9foi+TlWEaCAdIMhmKedYDReJdVW
	pcikiE7fOkmOO4B9kUVm8U+0OPcj92WzRzf2DHDkuZbg==
X-Received: by 2002:a5d:624e:0:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-45ef6b836a9mr11291781f8f.33.1780241160201;
        Sun, 31 May 2026 08:26:00 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:25:59 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:55 +0200
Subject: [PATCH v4 02/11] m68k: mcf5441x: add clock for DAC channel 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-2-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082602_227853_09247E3A 
X-CRM114-Status: GOOD (  10.67  )
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

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


