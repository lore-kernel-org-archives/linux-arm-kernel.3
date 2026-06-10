Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F508CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=; b=U986JsNj3uoBATTIO3ICOsC6we
	VUHKfAjh9AEhaqqBKOnQgN71h0UT9ad01GcVhzAeHXgYQE5k+ZJqCn6jkwKNVcWRnfrrl9VCXbryp
	OaOkKQQSTD6dF207PBOPZbEcrtEKl7Se13DblPTThYF/gixfwSRB3g2AOf9vCdJ5ERBXdL8sr6/Zz
	+svwF0A78rvBGBOffyuqOCPR8J0ZYA2ATdNitus9b+oV6PDDAs93xhyPIIn23B/CACwOKt0lO71sn
	GnQ41C0hEaWDJfner7LkPuzcH8DXFTmWiN/Nqacw9R/Cfvc1Gu9Qdf+NHQ901Gqu9NZJ80f8ZZ1kc
	+Z8rL6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdr-00000008KYL-0emu;
	Wed, 10 Jun 2026 20:35:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdo-00000008KXI-4ALa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso1967585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123711; x=1781728511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=ACjkxJ/yNbIfRVpVAbMVUW/CB7den0sy35Q1lUK04g7D7A21eaHyJhD6Rp1DM1mExe
         p+8yR1zV3e3lDoJ66Y9Akj4tdyDXCA1Yf9Vdv1pf6ttPKB7oBQHRfVDENn1BtOU+jP2G
         cqnSnhA0uCC/gMuC7ftpYOCl13AlvlnZ8jRTnG7Cax/STwzIT7KLL6eFnalnehrTo7/a
         VXvTFOj0AWzN0hro+7kyWxjF2w38dgBaNCEMCew7Hp4Eyyr1NYt+t4NGiCNseVj24O6G
         t81HTP50oSAPTYDlzHYh1c1cT9tRQTyZ+QqycsKbZsoeWx9QgOQ8bjB5nxnuK6tq+9fh
         6F8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123711; x=1781728511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oxdFj4Oh6M9kXl1w5/7S95bL1PgDTh+f8B3yZnortM=;
        b=ZW1JXsAmLzy7XUz/Ev7CD84ZW2ag498Mlq8cVa01kDY+UFXigVFKpkhKeP/Rf02AXe
         vkmjoInW5cd3p3nVM/sxQvVSpL1zraitWBdnY0ihpiyedAkLFqiUqPUi3mTyqxUfaMxY
         HF5qBaSts5GL38Yse/CIJK2TWi4oIRiYFo4VOyrqGBB99Uudo/41ch43dRQimlLaYIcT
         IKY9kCm29DMaYo7tMIeAx74qQH3v0FnfGrJZ3ZIUDuCXFARh50cgae3dR3GfL/PS8m/g
         HVgLAjW5gA2pZWyHroGBvcS2ogqP298IP+qza8w7rCnZppDxmexZqjpVhrtqjSzuwAer
         PvQw==
X-Forwarded-Encrypted: i=1; AFNElJ9Gi45k+xKa7RfRvZ+5x2Pbr1GHVZpmY+8qh+MmEHkcmiUydBmw3T/hKgpR737fe7Ri/apIHZb0R5NDXzL7CMtt@lists.infradead.org
X-Gm-Message-State: AOJu0YyWgJZMtJFUykdeqzQwNSabegyi4fbNw05VnPs5jJhRt+nN8jKS
	FLergmz/WSStclFLAlAwasRiCi0jRa+VSF+9Lj5u+Lo+/3O/KFDvVkYF5L7LmikgM9k=
X-Gm-Gg: Acq92OHIxX8OVC5I3qzIK3Fu1BI9rzlfcY7k8mmQaZADPGm8N7gPS25kW53K4W7lLIi
	n7iUmaNyOAG+n/C9amfaiYy6BomyzkOlF8xTn1VGviIWUw8n7qR8Ek3x16oGP4sjQccIGX/03AX
	Em34Lfcy0BShmGIZgFgfbOq29FTJDRmgvl4tHeoqG7L8eEYLl2G5vIjihGQEw9aEq6W37kTZXqM
	feEXTSj3eqX6cAdC7TTiZ8mZyN8LKolWNx6f+CHWJGIOOq9SFN5PiBIU7RTcRphmP76B26w57h+
	JhsvQEJVS2gNS6WLXBO7A8+snivYybO82SVNtqqDt7J0XbWWlIx5kF57jGmvH9gGy3OYFCO/Yp6
	EFdzpaPlePdS6j4edTL6oUg9rzCakNTNtD7RFlhBMQdHmpY3vRjZE4KPnq84l2kN5t/W4IRadzy
	yOSrz5J2+O0L2sP4gMHziDzAFeO91/Ta7VaFda0+Snpw==
X-Received: by 2002:a05:600c:3d96:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-490e34ce241mr1647825e9.17.1781123711199;
        Wed, 10 Jun 2026 13:35:11 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:10 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:06 +0200
Subject: [PATCH v5 01/10] m68k: mcf5441x: fix clocks numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-1-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
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
X-CRM114-CacheID: sfid-20260610_133513_052686_CAFF9DD7 
X-CRM114-Status: GOOD (  11.13  )
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

Fix clocks numbering, set correct values for eport and DAC,
as per RM Rev 5, 05/2018, table 9.5.

Fixes: bea8bcb12da09 ("m68knommu: Add support for the Coldfire m5441x.")
Fixes: 007f84ede6e3e ("m68k: coldfire: remove private clk_get/clk_put")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 6ce730098ff6..613b0275d9d8 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -41,9 +41,9 @@ DEFINE_CLK(0, "mcfpit.0", 32, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.1", 33, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
-DEFINE_CLK(0, "mcfeport.0", 37, MCF_CLK);
-DEFINE_CLK(0, "mcfadc.0", 38, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.0", 39, MCF_CLK);
+DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
+DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -103,9 +103,9 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
 	CLKDEV_INIT("mcfpit.2", NULL, &__clk_0_34),
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
-	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
+	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
+	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -156,7 +156,7 @@ static struct clk * const enable_clks[] __initconst = {
 	&__clk_0_27, /* uart3 */
 
 	&__clk_0_33, /* pit.1 */
-	&__clk_0_37, /* eport */
+	&__clk_0_36, /* eport */
 	&__clk_0_48, /* pll */
 	&__clk_0_51, /* esdhc */
 
@@ -174,8 +174,8 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_32, /* pit.0 */
 	&__clk_0_34, /* pit.2 */
 	&__clk_0_35, /* pit.3 */
-	&__clk_0_38, /* adc */
-	&__clk_0_39, /* dac */
+	&__clk_0_37, /* adc */
+	&__clk_0_38, /* dac.0 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


