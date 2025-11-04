Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764EDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49FY2zVqI9ZeKrIZlBhUVkh4m9OzOZyEeEGZ8bRpxBs=; b=M12YSg0Y4hSB2fRcwLP8PIFaqW
	zSpsVa4m4BiBPoCs2EKfz3DqVxX3ndXnjzQpHSRYrBFpVtFIVDLI77G4En3ALHisKyV41lX+tQl0c
	Jv4/gfHwjnKybRV02PYIOylRVaaJQRbO5zcasLuV9OzEWyr6Sl1UVBEz6fkBUX5U7H7oVyhSX2mHO
	8pzqH8tFt5nfgs/ruJFDn7JGMnjNxzIMZz1Qgp0VWMTibbpFh4sbE3QoKhsaHHWAnTWynRJ1AwIKy
	jLVPvbUCZTGsbFNX8UU0qwpfkgnE1R21gvTwINw2Qmk++PXhJv39chteI6a05zDFewaGNJv6B5mUw
	YdUQbylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUQ-0000000C10y-2JU4;
	Tue, 04 Nov 2025 14:58:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIUN-0000000C0z7-4634
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:58:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so4388219a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268306; x=1762873106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49FY2zVqI9ZeKrIZlBhUVkh4m9OzOZyEeEGZ8bRpxBs=;
        b=cmWGBhUHgal3ZHpxuC/w6KZ5tEU8hJBtIisOLZb/R+KpKHVA8788Zc13fxa27aT1vN
         uj+a5WBbz1zk9VOsTRYYTvTi8pzBbIQ3eViFIancg1XUo6MDzpMz/Bx/uPcbiXwLiVsV
         1ffdXtBl3JIqa6+GYADh8gEY7EehkqcnSaKJlaNs1dFmKAj3JZseS1CfsA1wsrp+dQK2
         5E9j/M26zVh/zfeV8V24FCvfFBqwM9Alpdb9yWBF/rsCRvpfIVQTSsQM8aEbSKTp/4wQ
         AicisLaitB8vom7DyOwIDXu4z1XwGX8a4pz3be3osb8NAmaerbM1qUOHSMylxbp5QKbR
         CQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268306; x=1762873106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49FY2zVqI9ZeKrIZlBhUVkh4m9OzOZyEeEGZ8bRpxBs=;
        b=q9gnY5O2c/CrfNcdVwxVOU2CT6YHRxJxSqvwiIUa6GAnbgJG6MNsEO8Ul3ZSdzGoxf
         fX/oY3CNn3FXZsnulV5yuMRBsTyf5FMGK2C+lEFHQncrzjTBMD9KN93WCUQwxvqHktxy
         xBZqmxXUH8SX9EUBY17D1BSseEHVMA6SwzGZKeyy0G0bDQ5fnjTGNZ7JHtB36+OaMEMl
         d8uPWfCCA85es9cKTqyEk5x0Kh1SQnAhSml/2TyTbEACo0Its6WPF/mgb63VxaBwx18F
         Bs1kMUP2GaM1eGYgKdBXVNve/8Jg5ShoM7gBPi9yFVXXq+JaPavKJP+e9vfu8ePSdycM
         XDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbfDXy6mrDm9kTHlNbe0FqDBSWm2mJlW+tWhceVwVZkQzZz6PJSwrvt0iX4pg7ILtBgmD3pMyuWgrFAcWSE4TJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy08y3xefonK0DpsWU5M4QeTX6w6NGKAEmyRE+veB351CpzlvT0
	Ai1IHkndymITLtwSJJWB8S6u1MLbxXetZX/1mfjMdfan6tQORZOUAyDd
X-Gm-Gg: ASbGncs0ha2GMGxX+NlheGjn/Kmq/O2kyy/EHPj/AltHL4z0XS7DLo1Oh8m/sXydjcw
	FlPppKIivxB5m2TWrPbxKBHAS8Qtp8L+CusUma6/tHQfN/qKDaxo0Li5I5wWu3m+hOE16gTj+Sn
	2HpR0ixXbyYdebiq20m9+K/48mdiDKIXHYGJT1T0VhTZnsu5IrfXCIborqJTtm4YyZSHFzZWqpO
	goaAXPyoDgocYwWT8wxJZwW00Vmh2lMybaa5Ux7qmUFZ/vwytxYEo64bQGLWQYQFJXaY9ckCLxM
	mKpUc3HAFI0Oe7pS2okIpX2Rxck1gkLQsxE+cL712RJfZUOGthAfxGrEW/x3+2tkipKbOkW2qHL
	tdC9O99EQd4DUOp61shwMJ0/sU0ZyjfZ4HlOIg94kQ4MvRT6i6QwXpIXjD3NtYzmW1kFdy6y3Fe
	EjlowSIdbFUPgcvBomAuRXLevGLDAPsHD5kasApPoYepndjBI=
X-Google-Smtp-Source: AGHT+IGhPjYnI2dd4Y8tgVpYrusguuiQEaOFUSTzgRXBxGOGzflATdcavzKwVGBwCMd5j0FypdvmLA==
X-Received: by 2002:a05:6402:2350:b0:640:7529:b8c7 with SMTP id 4fb4d7f45d1cf-64076f710cbmr15166855a12.1.1762268306022;
        Tue, 04 Nov 2025 06:58:26 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:25 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:19 +0100
Subject: [PATCH RESEND v7 1/7] clk: bcm: kona: Move CLOCK_COUNT defines
 into the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-1-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6586;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=Pth2Uzo1gzhh5BgeItKlIlc+tS4ImCHocJjvX3QMVOU=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSNOEyLcilSEETBIZirAou5qm09aAf8xYkar
 yv9ZYNtvReJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjQAKCRCzu/ihE6BR
 aFV0D/98icD+0WcR/TEYPPGeJeKVzdMZjA2VaWFmw1wWQ9j2KtZcV+tMbX0OCSG0csSD+cpaQ7Z
 claxEfFqoKEEJkrOI8Ow/7j0vE/BiaFyLolZlCAvSgh3xhGqgIRG8y+q9586Kd3FJuQ8bt0dLPY
 Mr3zed8MJCa+hdMbkuUTI9xnpmrOHPqfFMDdRQtiK1D+y041Xx4/HutrjxlfTUVdbkEwSLIkb7L
 QLGa6JTn8mXhvqwycR3pxJZLPeR7f0GJfYWCvE7Vf1FD894uNRGYd1SUUaRVtZACXGe9dZqiBxu
 lp3pQyjqQbFbAyKmVs/OGfeGd/o2DofTz/oUPNFG9ebY/dhsPrhIaGrLITzp0AUVPLkw5ty/7Sl
 QEb5Vfn4B5cHuzBWWUHnmkaUVuKxdrrtmD8sMLoF8pVdTEJeUkGAAA5o1b2+GVM5bNOaLcFWRS6
 xVud/NkFx0xipNSDaXAiFL02F+gbRpNRKrm1x/j0+wh0hB1nriNYLYisPlfWNsX4i5zbObtx5SQ
 pidWARuqG6wOGl7Ww7NT8Y8vCKHmA0hr88sxBHv+uq9ThcmYoTy5jOG8oYBAV/Wm6SGqsJQ5VIv
 cuUHdnrY7eRHApxK2i8G2zl8DDEXdTi9yi3Qml2mQdFLxXZssd3d/CWNIdQ7yo49hJSLlApA/K1
 kzCeh7K6tnDf0lA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_065828_061422_365DEBFD 
X-CRM114-Status: GOOD (  16.68  )
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

CLOCK_COUNT defines for each CCU are stored in the DT binding header.
This is not correct - they are not used by device trees, only internally
by the driver.

Move the CLOCK_COUNT defines directly into the driver in preparation
for dropping them from the DT binding include. To avoid conflicts with
the old defines, rename them to use the CLK_COUNT suffix.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rename CLOCK_COUNT to CLK_COUNT to avoid redefinition

Changes in v3:
- Add this commit
---
 drivers/clk/bcm/clk-bcm21664.c | 16 ++++++++++++----
 drivers/clk/bcm/clk-bcm281xx.c | 20 +++++++++++++++-----
 drivers/clk/bcm/clk-kona.h     |  2 +-
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 520c3aeb4ea9..14b7db824704 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -17,13 +17,15 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM21664_ROOT_CCU_CLK_COUNT	(BCM21664_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM21664_CCU_COMMON(root, ROOT),
 	/* no policy control */
 	.kona_clks	= {
 		[BCM21664_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM21664_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -39,6 +41,8 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
 	.policy		= {
@@ -48,7 +52,7 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
-		[BCM21664_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -122,6 +126,8 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
 	.policy		= {
@@ -145,7 +151,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
-		[BCM21664_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -225,6 +231,8 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
        .policy		= {
@@ -246,7 +254,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
-		[BCM21664_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 823d5dfa31b8..62c3bf465625 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -19,12 +19,14 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM281XX_ROOT_CCU_CLK_COUNT	(BCM281XX_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM281XX_CCU_COMMON(root, ROOT),
 	.kona_clks	= {
 		[BCM281XX_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM281XX_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -57,6 +59,8 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
 	.kona_clks	= {
@@ -66,7 +70,7 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
-		[BCM281XX_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -80,12 +84,14 @@ static struct peri_clk_data tmon_1m_data = {
 	.trig		= TRIGGER(0x0e84, 1),
 };
 
+#define BCM281XX_HUB_CCU_CLK_COUNT	(BCM281XX_HUB_CCU_TMON_1M + 1)
+
 static struct ccu_data hub_ccu_data = {
 	BCM281XX_CCU_COMMON(hub, HUB),
 	.kona_clks	= {
 		[BCM281XX_HUB_CCU_TMON_1M] =
 			KONA_CLK(hub, tmon_1m, peri),
-		[BCM281XX_HUB_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_HUB_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -172,6 +178,8 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
 	.kona_clks	= {
@@ -189,7 +197,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
-		[BCM281XX_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -301,6 +309,8 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
 	.kona_clks	= {
@@ -324,7 +334,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
-		[BCM281XX_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 348a3454ce40..d7cae437333c 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -483,7 +483,7 @@ struct ccu_data {
 #define KONA_CCU_COMMON(_prefix, _name, _ccuname)			    \
 	.name		= #_name "_ccu",				    \
 	.lock		= __SPIN_LOCK_UNLOCKED(_name ## _ccu_data.lock),    \
-	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLOCK_COUNT
+	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLK_COUNT
 
 /* Exported globals */
 

-- 
2.51.1


