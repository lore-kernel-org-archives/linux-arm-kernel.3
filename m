Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E6FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 04:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zP/+2G+KQKp0jcs9Wp+FgRomWiwgmnqO7eeiRjAeLco=; b=rcYnimahOYAWUHRtialt2J7MzO
	pamssSQxGXhhzqo5DtVpSqRs0x3kJ8qz4XDAzdYLQuZN1y6m/VfIZB8/Wj5c/bdJ39ac0XekdidJK
	z/bg6ka/1vdmuAL3u1bSWVy3mzZw8WqVHmldV09VcOZoE34C7Myr8MfO7787LvixR/Gf9bxmFbmSD
	DR/nl2PKXuVZBW5GmxR+tQ2vDmFUFXtH77Pl4vf9arPxwTa/nB1UzONs5vXtK9Vm6rfmMhXD2kP3U
	KsMKcDIZc4HT+WaD7hJLug31wy2FWxoMFSdbTiE7YvN4iq8HISi5R76AB3gjeqqPEU+KE/yaLa0yu
	/eJRdICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeeu-0000000FSgd-2y0T;
	Tue, 12 May 2026 04:23:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeer-0000000FSg7-1fcZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 04:23:50 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8cb40149037so478552785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778559828; x=1779164628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP/+2G+KQKp0jcs9Wp+FgRomWiwgmnqO7eeiRjAeLco=;
        b=KfdTbijV0Gq5UYV3UsxH3VS1R+bQ1M0+x1JWWwK7jA8qnQrt2P9Aj7xBVS1P2FNb5t
         0jZlWfMoTZ9Ope57Cmxfz5FQzl1mPkd5YEbdeq/2oXzFX81xh5eFt8jwA3yQFoFrUp1O
         H5/LL3urXTFNcl9vybYB4B3nACYh/Dtrzli7IEqN9QzOpYEjf37wpZ6FDBM0X3Ifd+6I
         1DV9+O9vvsm2VAduHQGx3TQ6HpOfmSQBpHpFbG+m4w1flpjkaWAqEd2aPRlYIuarPLuL
         MICizm8cE0ku2kVFlTblcFvs21WdhjlTVpTmPkkTdOZ2lqipuVF2c0mzT5MH1z950Q6+
         X6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778559828; x=1779164628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP/+2G+KQKp0jcs9Wp+FgRomWiwgmnqO7eeiRjAeLco=;
        b=DL5o6rRZis7WE50Yme2Ki/Tn4ehgPb1b8vV3kg6hgtEF0L5JzuPNtS7KxtAniJtmYn
         SaZqHktqRDUEigqDvGGjOtcQi6AeT9Hoau+XXwgv4k7XwF976qYYbcPRecReDBjypTV3
         ueEmuJXoybzI+pUdaUA2W/XOmG9x8QrDcS5E9hRw0OGv3AcuBL66KrnZfvFPD/DgtV6Q
         D1MiciEmX2/Nk3iPyzRXwLMQ+133m6MGJc5EnjlEA1yBnLI6PxEViswKT3OE3Sf3x0MT
         xsMVzZJXd3IFoHi2H36vX+P5fa215NDWpmbQlNGT12AKhuaOQVoL2DXm7nvJILoAauk2
         sCow==
X-Forwarded-Encrypted: i=1; AFNElJ/RI2Rm12EUY+lUBP1JKD/iPZ8O0f80LjGLzP27TL99YUVhkQuTtkmU4nBEYu77KCvxlLwFuopy35EUzaTthEJq@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQp14tgGBvpmCGgArDQOQiiRGXG8WMUjn0vuU1jM9L56L450U
	rvvPtcTmu2bpH5NSLeICiX1D6NXquvGruhD/F1AWufP3wZ3jeh6qoi5z
X-Gm-Gg: Acq92OHM50bURxTCwADt39pb7H8EZAoH9JDM2DenCuyr9ngg86WAyxBbR2a6U7w/BNR
	n93hRslcmeFm4ThClT749OKRBkLmJdQhLCHFIFYmHnLtn6ySmm5bp9hb616LP91x2hs0dDnFhgD
	qWbFsuuWqYikvtj060Tf3xhl/rUGVhOlrpBmx2eWU2EchuYmakBJqPIrK0SUTWS7cdAtp9222gF
	ch2qnVY70ykfv8fOuh2UxnV75e+heurpChHagjeZzOv7/E4TJ6gYzP0eigDJZdvVHdVoXahencW
	icljRN8pucZxc7NxsOSSRJ2a1NGx0IEVzJnRMePtpMgKnyYDhNUUkYOcEGr3EZR+afqm67eNxSb
	yGsnH5exn0xZDeILF+hRSw8zELAvhLgXeU5maXWR4bLlozNQ2D06yE63kKrVrbNdnab1DfB4f6S
	b6gxJrW/LY+ZwNuGrGUz5shqzeJDx3IfrghzVs+66dVpTdZF8fgKZSGNqmDwUhTqLbU6ze8Ig0c
	ShsSR5VSv0Wq0fFb1V4/WjzqzIb07V7svrZDZ1D0DwVYrU=
X-Received: by 2002:a05:620a:4888:b0:8cf:d717:c22e with SMTP id af79cd13be357-907badfbfebmr2504182785a.28.1778559827743;
        Mon, 11 May 2026 21:23:47 -0700 (PDT)
Received: from mighty.tail79ce1c.ts.net (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm330162176d6.36.2026.05.11.21.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:23:47 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Date: Tue, 12 May 2026 00:23:41 -0400
Message-ID: <20260512042341.1452-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_212349_448585_4173695B 
X-CRM114-Status: GOOD (  11.67  )
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

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Add a small C wrapper with the exact callback prototype and use it for
finish_suspend.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap-mpuss-lowpower.c b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
index f18ef45e2..1c51b2f97 100644
--- a/arch/arm/mach-omap2/omap-mpuss-lowpower.c
+++ b/arch/arm/mach-omap2/omap-mpuss-lowpower.c
@@ -111,6 +111,11 @@ static struct cpu_pm_ops omap_pm_ops = {
 	.hotplug_restart	= dummy_cpu_resume,
 };
 
+static int omap4_finish_suspend_wrapper(unsigned long cpu_state)
+{
+	return omap4_finish_suspend(cpu_state);
+}
+
 /*
  * Program the wakeup routine address for the CPU0 and CPU1
  * used for OFF or DORMANT wakeup.
@@ -437,7 +442,7 @@ int __init omap4_mpuss_init(void)
 	}
 
 	if (cpu_is_omap44xx()) {
-		omap_pm_ops.finish_suspend = omap4_finish_suspend;
+		omap_pm_ops.finish_suspend = omap4_finish_suspend_wrapper;
 		omap_pm_ops.resume = omap4_cpu_resume;
 		omap_pm_ops.scu_prepare = scu_pwrst_prepare;
 		omap_pm_ops.hotplug_restart = omap4_secondary_startup;
-- 
2.43.0


