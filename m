Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRK1BYeq9oENOjqMtHoyse0xgVkJUai4Nnq/5BnLYx4=; b=kOCNpxYlQbJ3sSVv8t3UKR0r4E
	6fpWc1muwutRKjhS8AhBuNfCfHzmhI8vLCV4D+HOLlmj1vh05l27+Ns0lY5gpQ3F2S8KYOrmfF3YJ
	0S1UMBvc49yeLnUjI5KvGJwkBAQjIzf0VFiNBkq65BmwInu0UjHCcWWWL+Pam6W2xqzc4KNGTPnZU
	cYEGui7auv2keAIIPbpmzLYdMxUw9W52cedxo6MjwxRmoMwXTP/pIThWruZZZlPy1TVWA4wGM8VyS
	XX2AdvuwtUU9T46t6Z0NlBJMh9mgcwWwS/bYvpP5Ov9teNzz+kG1LMGhilNIXVkmO1XOwzjBj05an
	GvXDzF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tug0J-00000007K3u-1El7;
	Tue, 18 Mar 2025 23:05:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufvc-00000007J4n-0oPY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:00:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225fbdfc17dso57366185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338855; x=1742943655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRK1BYeq9oENOjqMtHoyse0xgVkJUai4Nnq/5BnLYx4=;
        b=AnHCl8C1fyRwfdHr26gXP6Kd6C5ZOJuIR8Nzom6gU/qNOSvSytRWRCCna1SvWMUhD2
         s62hghjMsfPS2H6rZcpRmNc39VWMkdV70mlr77pSqGL+C1g08xQCKmMMn1r6cWIx7aPk
         toUmIfWuJXSk5DT92JQMRTQH4bajRqRiFQC+U+y6WA2nLjl+lbnWz34I7PpZPZkxPSZW
         rPnIkwxbB81H4J/wIa5U9N/NDYimB+Ne5Wi6POEMrmeKduyF5XhxZemU09ku8yLDc/CJ
         0/3UPLpvlwe2dCILdxmYA5lUmcQcYHA3ZfNfwbMvpgWX8GwKe16zsiQ7rQKvrQOOVtyf
         j/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338855; x=1742943655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRK1BYeq9oENOjqMtHoyse0xgVkJUai4Nnq/5BnLYx4=;
        b=Xk4tyCzyzXzbMjaxe2yR83ZDCOC/1Ua7YP5WcTA9E7lSwdqAqcuHLJjZiD8PECEsPv
         9vwQvrMnhuC70e21ap42fIbbjwohSuYEZut76bU3KQshYjMFj0s3nsHmdeKBL1FwFFTm
         2QKQqo8/enDf7FYquEQqFNoaFnJBD8+EefyMwipp9PeNH9XPfozzuP8c4TaLHZEDGtK3
         af5iN2rzul5tiuHrWmvg4wwbwd3TVBP05JgY4wIahcWju4KU6hKmAghfDUx1Rm3dBt/Z
         9E9DtyGan5RDz71J1KRnJA+UuUS7dTkTLbq0eTPpFWd7Ws+w9mOciEyjQA5AzlR2raIY
         o+zw==
X-Forwarded-Encrypted: i=1; AJvYcCUDLjOqrt/onps6CLlR7/dr8omcV+wMnDG0LU23xVwKYQKj+ToknbVSiVoq7wej1OZphxWvlUVnPSYeQIT60XhB@lists.infradead.org
X-Gm-Message-State: AOJu0YzTAr4zHLi/b38Iux/mhHahbLVr5wNz19z64Z7ioASspZtvYa0/
	ZfHS/ib9rTVrkNl2pWZWYsPLIvdT74v00ErNOXEnbE9h1ot0joGfcLPtt505lT0=
X-Gm-Gg: ASbGncuDK/IfBE8S1Aa/Ua9mdfJSnhB9A4tapOZ1UNW88mAELCG8vJQfW/oz9ZW9zVY
	NuOwjKH2Hbk8Y3J1/d7vMKmwMSiCQJKQfxF6Y+MERha6fUw6itgO05WYhbsuNJhjvYOXyy/T2vq
	DxNZsYIrp8pk5L0h0eB8FFrFCgNoSXAFBhYu71+Kkx/8PY6TjCbvkX/UUajhHecMHcvTN+Ch9AD
	0n4jaZEiSCaoia4R2ES2jQD5cbeSm201aXp7sxjmQUlUypKut2tUbbuYotN4jBsG7U0u4Ruupak
	CrLnrIt93A06YgkWMwCxqdej4lATqwoWfIrunqukX8YkbCKtRYTt+5co42OAOnow/V/ZUkPNEOk
	IpofXYCIIA0Cryp0zGw==
X-Google-Smtp-Source: AGHT+IHdNYudNQrKRJYbNO8tKZv7fexJeXFTkUuajSjQrqfC+IP76hd/8HGEo15LPdOK5Ylw/STnrA==
X-Received: by 2002:a17:903:41c2:b0:223:2630:6b82 with SMTP id d9443c01a7336-2264981b460mr7589085ad.10.1742338855286;
        Tue, 18 Mar 2025 16:00:55 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:54 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/4] ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
Date: Tue, 18 Mar 2025 16:00:39 -0700
Message-Id: <20250318230042.3138542-2-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160056_233784_606D5A52 
X-CRM114-Status: GOOD (  17.23  )
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

Don't put the l4ls clk domain to sleep in case of standby.
Since CM3 PM FW[1](ti-v4.1.y) doesn't wake-up/enable the l4ls clk domain
upon wake-up, CM3 PM FW fails to wake-up the MPU.

[1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/clockdomain.h b/arch/arm/mach-omap2/clockdomain.h
index c36fb2721261..86a2f9e5d0ef 100644
--- a/arch/arm/mach-omap2/clockdomain.h
+++ b/arch/arm/mach-omap2/clockdomain.h
@@ -48,6 +48,7 @@
 #define CLKDM_NO_AUTODEPS			(1 << 4)
 #define CLKDM_ACTIVE_WITH_MPU			(1 << 5)
 #define CLKDM_MISSING_IDLE_REPORTING		(1 << 6)
+#define CLKDM_STANDBY_FORCE_WAKEUP		BIT(7)
 
 #define CLKDM_CAN_HWSUP		(CLKDM_CAN_ENABLE_AUTO | CLKDM_CAN_DISABLE_AUTO)
 #define CLKDM_CAN_SWSUP		(CLKDM_CAN_FORCE_SLEEP | CLKDM_CAN_FORCE_WAKEUP)
diff --git a/arch/arm/mach-omap2/clockdomains33xx_data.c b/arch/arm/mach-omap2/clockdomains33xx_data.c
index 87f4e927eb18..c05a3c07d448 100644
--- a/arch/arm/mach-omap2/clockdomains33xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains33xx_data.c
@@ -19,7 +19,7 @@ static struct clockdomain l4ls_am33xx_clkdm = {
 	.pwrdm		= { .name = "per_pwrdm" },
 	.cm_inst	= AM33XX_CM_PER_MOD,
 	.clkdm_offs	= AM33XX_CM_PER_L4LS_CLKSTCTRL_OFFSET,
-	.flags		= CLKDM_CAN_SWSUP,
+	.flags		= CLKDM_CAN_SWSUP | CLKDM_STANDBY_FORCE_WAKEUP,
 };
 
 static struct clockdomain l3s_am33xx_clkdm = {
diff --git a/arch/arm/mach-omap2/cm33xx.c b/arch/arm/mach-omap2/cm33xx.c
index acdf72a541c0..a4dd42abda89 100644
--- a/arch/arm/mach-omap2/cm33xx.c
+++ b/arch/arm/mach-omap2/cm33xx.c
@@ -20,6 +20,9 @@
 #include "cm-regbits-34xx.h"
 #include "cm-regbits-33xx.h"
 #include "prm33xx.h"
+#if IS_ENABLED(CONFIG_SUSPEND)
+#include <linux/suspend.h>
+#endif
 
 /*
  * CLKCTRL_IDLEST_*: possible values for the CM_*_CLKCTRL.IDLEST bitfield:
@@ -328,8 +331,17 @@ static int am33xx_clkdm_clk_disable(struct clockdomain *clkdm)
 {
 	bool hwsup = false;
 
+#if IS_ENABLED(CONFIG_SUSPEND)
+	/*
+	 * In case of standby, Don't put the l4ls clk domain to sleep.
+	 * Since CM3 PM FW doesn't wake-up/enable the l4ls clk domain
+	 * upon wake-up, CM3 PM FW fails to wake-up th MPU.
+	 */
+	if (pm_suspend_target_state == PM_SUSPEND_STANDBY &&
+	    (clkdm->flags & CLKDM_STANDBY_FORCE_WAKEUP))
+		return 0;
+#endif
 	hwsup = am33xx_cm_is_clkdm_in_hwsup(clkdm->cm_inst, clkdm->clkdm_offs);
-
 	if (!hwsup && (clkdm->flags & CLKDM_CAN_FORCE_SLEEP))
 		am33xx_clkdm_sleep(clkdm);
 
-- 
2.34.1


