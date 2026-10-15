Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB5CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Brhdwqnp+zrXya+pAYQZ+kocBKTR7q3OUom2Y3/V6I=; b=PK2npih9sbnYUJ1AXU4O63iTgz
	Ccq09lhbgCSyavilVo42GjKpmZ0gYeBi94XW8t+kWfS/YHrPbZAVscvH+k05Dhz+2+abm3Rqxh85d
	7xBUqll62A+XKyxjFgzUKaCPKX04S2kyEmUgk+bmGCno/jjQU7WA7qDIXMUeBtiLZmWonzMZW8SyG
	tPmV4OdPNQK41k45FVo2OZ5y6tvEanqgQCHRHUBGt8lg++Gx9HxNzY2DaRvKPILpshB/zTZ3b5JDc
	Gdxzxdg6bkmS3SdKKC4xRJg06MrwVQuhHMrH+ubENAxGo9C1v72bqkEn7flpnxjwVHVwzfF37CFfP
	daWIJ5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCV9-0000000GlaY-3DPJ;
	Thu, 15 Oct 2026 03:51:31 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCV6-0000000GlaB-3XFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 03:51:30 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35b2c599f43so45674eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036287; x=1792641087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Brhdwqnp+zrXya+pAYQZ+kocBKTR7q3OUom2Y3/V6I=;
        b=pLqhb51A/ovdxc4V1m4mZTGTRZE76BQgMGgj8FkUS26kwPJLKyIEfnGKmZ+TALHnhS
         CEYr6XQgKNH2hmfCH8dV23GOZ4stkOwSeKebh+MM2cvvoUXgpjMOjuECFMfzfPCrKQFY
         F/s0LAkCqMRgmDYflb82dwXjZiYx6gW5W0qyco+iUvm74zf2O6Ff4jngL8LyO54YQms4
         kyb2zRuYrbrVHyiljkf8wbNlhh2NELhc8V6ZY4OKlKNaPb94/uyOFDSYMVA5yr2o2Hp6
         NwAdot+0KzxbecsaM9oeOqrPWOpbT0mVzs7AkrMhW3LzI/ltMJbOJLIzWEWUKTNUwwlO
         C5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036287; x=1792641087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Brhdwqnp+zrXya+pAYQZ+kocBKTR7q3OUom2Y3/V6I=;
        b=DvXFAGA9stPQRxbFds+PbA8do8Yw59yTW14AwYVQthXkicYv6DUJ3P/l7fWw5HCab1
         zJ5NyPTPxhGX/R/nGS7uZWufWHEichAC8Vd76HKVkWizKgqZDdxnn+FnsKKQiVRKP1D4
         pYtWLpMUjyFCfDX1SQ12YjkYTIzZrWYhhOYfwgiF96YHdwQprpXWRX2esp+GYBkEFd03
         yB1DlrRGzLOzk4H4cyMEJoDMkCzgJ/mPgt3h5slO9t5y3bD2bCFtipy55qPtzLxV8Nas
         amLkbROXybb+pU/tyHO9KDadWCoc1LbfLem3XWwvrtzpxDntItRpptTYRiiCNvlCx6NB
         WZWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu7Y+3tNKLj8cvMNbPpW8YlDgFKoJN9vhmDCVleFQDuTrHcdK+mJdbojHI7U9dELo8GSy8cfqcbf5Mir9CzrRG@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8G6xNIEht/26qNpsxajK/+cdE+VYmMd0Gr4dVfCAXZKiTj93d
	uVl/umyc8uP9oy4njbDGVMUl9RHBvebnsKtW7JBcw7lPWNycPEH4dkCsVAdvVA==
X-Gm-Gg: AYBFou2+lzv4d7BP9RGDgxDormrvH5Ba8l4ZgxTnG97tHUQZqe3rVsybPSSavvu31gp
	zZ2thINqVpHi16nh1ZBF+YP302oVErOnPtSTD9OcvjF5/dvuN52OqzKNzvc8Dr9MKSZ1GT76wf1
	WUKg7Hl4EuvOIovgCMgrnmfSbM/2DxvLLMhVIJUX/xqnjNduFPtGiKtkXMEkhIY0Rxg/v7qnSkc
	wGYXAHp7z2n9W6ZQRQUvHi+OsfuKAxo/2bdCEhB6PgPUWfijPfZfrU62Q7qnmtm/AbAFHKuNlhG
	ul0Cd8rfeGsrC58E44fzuNmFiMmRX/AQybakGpPdEOAVwKO4+gYUZMhO/P97ipjCM99JoLZr0gs
	9UFnRR7ZPuA9w2GP+X4tMn3ru2u7OKZ1xzs65M794VqWVRDYpiio8ulKun6Y38EgtTNeTJCld1y
	wKFa1G25jch5u7T5bcEYlI10XYh0rIIcnoaHQeCIrWHtDpB+fp9qvU1UVt8i2S1PtnKlwKA+HvY
	DGJlaP0HXJegd2O
X-Received: by 2002:a05:7300:8b14:b0:35f:f0:8edf with SMTP id 5a478bee46e88-35f00f09f07mr2511567eec.13.1792036287168;
        Wed, 14 Oct 2026 20:51:27 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm56719830eec.30.2026.10.14.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:51:26 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au
Cc: linus.walleij@linaro.org,
	joel@jms.id.au,
	brgl@kernel.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
Date: Thu, 15 Oct 2026 09:21:18 +0530
Message-ID: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_205128_890857_5594BAD1 
X-CRM114-Status: GOOD (  17.42  )
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

On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
not provide working host power control when the GPIOZ6 pass-through
strap in SCU51C[9] is set.

With the existing GPIO request path, SCU4BC reads zero, but a host
power-on request through x86-power-control times out waiting for
power-good:

  SCU4BC = 0x00000000
  SCU510 = 0x00000000
  SCU51C = 0x00001e80

The AST2600 A3 datasheet describes SCU51C[9] as an additional
pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
SCU510[30] is clear.

A diagnostic experiment that cleared only SCU51C[9], preserving all
other bits, allowed the same GPIO-only power-control implementation
to power on the host:

  SCU51C: 0x00001e80 -> 0x00001c80

SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
or additional userspace delay was required.

Add an AST2600-specific GPIO request callback that performs the
existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
when SCU510[30] is clear. Check register access errors and verify
that the strap bit cleared. Other GPIOs retain the existing path.

This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
GPIOP0-P5 requests when SCU510[28] is set.

Hardware testing on B650D4U with this pinctrl candidate confirmed:

  - Remote power-on: power-good asserted.
  - Remote graceful power-off: power-good deasserted.
  - Physical power-button power-on.
  - Physical power-button shutdown.

These tests used x86-power-control with software button forwarding.
The earlier board-specific SoC driver, its DT node, custom sysfs
interface and diagnostic boot parameter were not used.

This replaces the approach explored in the withdrawn B650D4U
power-passthrough RFC. The new proposal changes the existing pinctrl
driver and introduces no DT binding or userspace interface.

Feedback is requested on two unresolved issues:

  1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
     Clearing it for one GPIO request may affect forwarding on
     another pair. How should that shared control be represented
     and coordinated with existing mux ownership?

  2. The SCU510[28] enable path has not been validated. Returning
     -EOPNOTSUPP is a limitation of this candidate, not a proposed
     complete solution for every AST2600 configuration.

Is the GPIO request callback the appropriate place to handle this
strap interaction, or should it be modeled through the existing
signal-expression mechanism?


Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -40,6 +40,7 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2747,12 +2748,56 @@
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+/*
+ * GPIOP0-P5 have a global strap-controlled pass-through enable in addition
+ * to their individual SCU4BC mux bits. SCU51C is ordinary RW, unlike the
+ * write-one-set SCU510 register. This candidate handles the GPIOZ6 strap
+ * source only; the SCU510[28] enable path needs separate validation.
+ */
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct regmap *scu = pdata->pinmux.maps[ASPEED_IP_SCU];
+	unsigned int strap2, strap3;
+	int ret;
+
+	if (offset < AB22 || offset > AB23)
+		return aspeed_gpio_request_enable(pctldev, range, offset);
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	if (strap2 & BIT(28))
+		return -EOPNOTSUPP;
+
+	ret = aspeed_gpio_request_enable(pctldev, range, offset);
+	if (ret)
+		return ret;
+
+	/* In dedicated-strap mode, SCU51C[9] does not enable pass-through. */
+	if (strap2 & BIT(30))
+		return 0;
+
+	ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if (strap3 & BIT(9))
+		return -EPERM;
+
+	return 0;
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
 	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 

