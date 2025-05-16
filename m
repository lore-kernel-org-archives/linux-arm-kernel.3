Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A16C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=; b=tS41VPcxLSre9mOEOhFWNNSKcu
	WHATZeJ/urPrDUXuCR17R/1VtkEhGWeDF1+zIczYRNBDbmbYA88/LKVFMORauTLuuOwheXdmdtJZ2
	82/oa8wm2ZoYlpPBW5YP7efwrWaMn+QrEZQNz8TIFaCVcH4Lkf+NMic2q1J3sJmuR8c3lvL0m6or1
	zjNmF+dmmarq/yd3w2VpDNCrj9EEnOhns2+3ps11cc1WaCmuhI+8VAdZMAwbkR6PCtHjVH+1j5DM4
	M6pUavO8+jYoL6TIN/abJ1aGZso5r+vGVZWuE43iwqblypxGbMmrQD/377xHbbrJw4n47JuW4fPla
	eo8nBAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwB0-00000003gda-34qk;
	Fri, 16 May 2025 14:36:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvRh-00000003Zwr-1q8y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:49:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso133715a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747403391; x=1748008191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=QY5+v6qdGOLOpV00YcM+499bKZATnJO2ERtTe9EgPUTe+JyAz08aQUmN0H4K48YO5W
         /V5478+MsZYUu9BVlu7qLmChv3AeEbPF32W56q29VBiY8zvIIGk3E/oZEVwl88iJ3B57
         oT1nSIniMuPTiI9PqO18VUAhmquBC8hb040+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403391; x=1748008191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=XnsRDDgTILxX3JQB231BtOIdRkgvYfBFCS42emFDqOSkYh6X7MwQAr9RuznQ2M2AyF
         S8DkgTQqzMyKxjS3IFUd5g0BaLDd/Rhr++GPIHhPOq8hRe+SOpVluOsRIp51yD6noooJ
         D9lQ3N2wo47bCzWhI9DbH4aEmuq2+iVG6SMR4SIN6TtN+AcG9taDSIVvvbVzrmWjzK+h
         3M1jdhezkgw+iOFViTCMaFLuQtfE0AcLySMw/SXuZTHkTWIfbRLf2om8UcP+CYre3YxB
         ldAsivoiUZtpcxjbo1zkX97cpUHf1iYRxuwj9Rh6tS9rbvqAdH0JJHKrxy+52JKTYE2A
         JbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAgQ+pdacIVn4Zev+0JcQ/tsAxLXgKWpp1xNB5KG33cxvIFqGt0dHx//nYwXnnQpOl5cPrTYgRl9a5me4V146i@lists.infradead.org
X-Gm-Message-State: AOJu0YwzvI3HJ7TzhXvgryK7tSBMFpGZCJMNayhsDAB1C//1yfz7uB6J
	+qRDFp9PV6B1X2L/8jOLQcXLT1rUCUGj7pUSUL7DIN9uGUhOBGNDk1zumehpvtnRImI=
X-Gm-Gg: ASbGnctkTL9rhV2GmAWTA5PLOV3GzONyC/ckiNeECcp6kq0w4hn7iCye4PbhhyvCPLv
	50V/F4rAxqlHXTP/EKsX6nPNZL4Udqi1tr3m01IqVW6Ei+0KRtaY4zTu1cEwhlshr6OPfjhUzTc
	HFvGDoqUVb+DuWeltUuBJCKkBJXz6U23wzDQWhuDTznJTkyQNBIkGAIRgtRbdvY91Zp12jNnoil
	5soybc8rbakR/FqSiaqvYqw8FnYWjjtTQpZ/FbA8O+MuQigRvZoGD4f5SuQfT5T03VfDv6H76KX
	YuQHjQEqnObFUjYo6+sbAGmN6o453jdnWgca/c9RI94DA1RH8oBiGnf4EO68Cdf/FFev/CL+GB9
	zHiN7aMchxPV4leKq3Bdygfw1njM=
X-Google-Smtp-Source: AGHT+IFoN5V5sXxRw1p11CkmgQLqoxiXH8inT8H8fElyYIKPtuQteQwDowZG6nwQRuFNGWvPp8sSnA==
X-Received: by 2002:a05:6402:27d1:b0:5fc:966b:23fa with SMTP id 4fb4d7f45d1cf-6008a39c9b8mr2906162a12.4.1747403391082;
        Fri, 16 May 2025 06:49:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([62.19.60.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e6389sm1562951a12.45.2025.05.16.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM platforms
Date: Fri, 16 May 2025 15:49:27 +0200
Message-ID: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064953_485345_2717604E 
X-CRM114-Status: GOOD (  15.82  )
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

Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
driver") breaks boot on i.MX8M{P,N} platforms.

Here's the log for a board based on the i.MX8MP platform:

[    1.439320] i.MX clk 1: register failed with -2
[    1.441014] i.MX clk 2: register failed with -2
[    1.445610] imx8mm-anatop 30360000.clock-controller: NXP i.MX8MM anatop clock driver probed
[    1.455068] Unable to handle kernel paging request at virtual address fffffffffffffffe

...

[    1.634650] Call trace:
[    1.637102]  __clk_get_hw+0x4/0x18 (P)
[    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
[    1.645152]  platform_probe+0x68/0xc4
[    1.648827]  really_probe+0xbc/0x298
[    1.652413]  __driver_probe_device+0x78/0x12c

In the imx8mp.dtsi device tree, the anatop compatible string is:

compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
for the i.MX8MM anatop is incorrectly loaded.

The patch fixes the regression by ensuring that the i.MX8MM anatop
driver only probes on i.MX8MM platforms.

Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-imx8mm-anatop.c
index 4ac870df6370..90ff11a93fe5 100644
--- a/drivers/clk/imx/clk-imx8mm-anatop.c
+++ b/drivers/clk/imx/clk-imx8mm-anatop.c
@@ -37,6 +37,19 @@ static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
+static int is_really_imx8mm(struct device_node *np)
+{
+	const char *compat;
+	struct property *p;
+
+	of_property_for_each_string(np, "compatible", p, compat) {
+		if (strcmp(compat, "fsl,imx8mm-anatop"))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -44,6 +57,10 @@ static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret;
 
+	ret = is_really_imx8mm(np);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "failed to get base address\n");
-- 
2.43.0

base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
branch: fix-imx8mm-probing

