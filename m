Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D075CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tkCmPvwD0G55+3Hz+PGIRzqfrV4CwxtOzw2jRg+jCU=; b=eF6xePVxUPfb3p3gzm4Tiza28a
	vq7MHHv9N1/vMytJMlHS3m/+OH3uYn/NgFQosluRbfCyVKc6R7zt8CPz6SWuIzYyckS7UJ2o73Oly
	y/arZfP1ZXq2LF1VeNZaa7/XMKkmBRp+lIgcL4My7GLj/uRQpE7mfHT0OZaD7P/X2E8J64b08SPGE
	UBUWvNLH/hmSz1d2LJjDx/liS8OqKlfy8nQA1Z68MK8+MG29nyoUqrxzb93uA6jGl4z1K+V5B4XdL
	3/sUjNeZVwOgkDdOW8OSrU+W71ohwysMxfAYZ/HyJ8JZl3MzWM6qS2CwxebohplOJmE/8vY0571tO
	XWRoa3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2qq-0000000Gexo-3urO;
	Thu, 21 Aug 2025 10:49:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0H4-0000000GBCr-2pXY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:03:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so637261f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763433; x=1756368233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tkCmPvwD0G55+3Hz+PGIRzqfrV4CwxtOzw2jRg+jCU=;
        b=ccPOV+3R5K4JRKUHw5FGCemUfIA1cdIiowI0DC5V23b9ZjN1de/6uFVKEqOm0Une1d
         N5gDWeDuO5uph1dDLKThAfOttnN73EIlaA/U+gaIbaEGmUAt/bBiqW/IdrFd2TIloNU1
         JLELtWUtGw0cws79LH3BjIb0A0BsCg4iCGFhk5pseZXK4P7sMfaMRMBUUK/9u4mt7zP9
         dJRTKGd6yCeCVTHJF4zbIRz4ObUcxbf3oBveAv8X9X9tWNSCMNy8xsljLN+OavCqek+f
         CSWTqaz2D6gGdK2rredAfGefm3aKCi9yzZd9dAXUMue7LW1QNZUQNYYP3DXXP5m0cxme
         Re+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763433; x=1756368233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tkCmPvwD0G55+3Hz+PGIRzqfrV4CwxtOzw2jRg+jCU=;
        b=iMXrhZGcdy1RkuhQ8d8AYbOgeVxwUH/A7lDKnjqUaREKHivzgLp2uH3sSFCqSdbpEx
         1RzS7TOG9gdgftfnMIjMqWgiw2EWVXDkHkZseS5DFD7lqk3JXAueB1n2s49ytoU/00tp
         1yeE5ubrqrRoJW7TaxNQXI1Z6QjsDowGnWqCBGDXZp/bMDBX/oSW/9yNGaguFnvAlUFE
         /5OBLbzWPItRMRvuZFTuJRx1UvGWjpbwSrmPByHBfrBKFsGU9v+ND+XXicbk88xibcgo
         uAuhis5AiVyMyIBSziTtCtgKpyEWGeKZ7NSsdEYKt4A5SyhlUuxtBCGZfwZVLGSglM2s
         lEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDLF/FBbppeBD0oqTZ4gGfuWLbHSkk7kVvQOV4AmjF18I3R30QYDPPBnvXxBrNfz5o6Kn+oEIk2bEZVdJCe8ri@lists.infradead.org
X-Gm-Message-State: AOJu0Yzneli9uddY0zolfRpa4COAxk57zKQUvzT2ufuKDOUxf2JGkka3
	wWBgC26iK0jm/pabFBHQkMCLjo8ZTHQXlv2KgbawuwSB7K489XAMPQRZjNaXzJTHqBg=
X-Gm-Gg: ASbGncvZRgWc2PRGD4ldJlyXpGNlwSAUY/alil0SQCifGh/jxJMx4qUWO1ldYVLGiS4
	8w6PNIvBjJh+7bFycnF231GgkqqabzBRk/4JDRXQIs7YArUHZyqp/VWzfNVQNqsaxLQnrx257kt
	YivfMU/egdx1y3VbXaflsu+vydJTIx7mmI7eZo3iU6ITVXAJHG1CqzBaGalM9ct3r1wjQ+RT4q9
	p4fBmZKngO+/tmTZsZoU8hu/uL+DLPxbbK+gvTs4kmOEg5oAHqDU0sUwwp2Hg70hZAUYlfqMm0f
	jcfM7t6LvffBBDEp7RUvmEJfCGcBBB/ugZZWrW7p6VrfRYLWFG0dSUUklLpvI5HPskA/c4/4Ul1
	nPKSg5BObGkQvSLbGQasmwuL4YL1PEKzPuqbGeKB/oFPpVJj0AAw=
X-Google-Smtp-Source: AGHT+IHxOvjpSJKD0XjWYHq10XV3QIWqZ96+Xmdgfaum7aOTVRU/X6sQmyVkYJBCNcnnXqHOGX0gTQ==
X-Received: by 2002:a05:6000:2483:b0:3b8:d30c:885f with SMTP id ffacd0b85a97d-3c496316b13mr1240711f8f.53.1755763433031;
        Thu, 21 Aug 2025 01:03:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	linux@armlinux.org.uk
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: rzg2l: Register PM notifier to disable unused clocks
Date: Thu, 21 Aug 2025 11:03:32 +0300
Message-ID: <20250821080333.27049-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010354_715412_74AB5096 
X-CRM114-Status: GOOD (  14.45  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Register a PM notifier to disable unused clocks after system resume.
This is necessary when resuming from a low-power mode where the bootloader
re-enables certain module clocks for its own use.

To avoid keeping these clocks enabled after control is passed back to
Linux, call clk_disable_unused() from a PM_POST_SUSPEND notifier.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 187233302818..2ca32d7acaf7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -24,6 +24,7 @@
 #include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
@@ -31,6 +32,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/suspend.h>
 #include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -150,6 +152,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @info: Pointer to platform data
  * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
+ * @pm_notifier: PM notifier
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -168,6 +171,8 @@ struct rzg2l_cpg_priv {
 	struct generic_pm_domain genpd;
 
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
+
+	struct notifier_block pm_notifier;
 };
 
 static void rzg2l_cpg_del_clk_provider(void *data)
@@ -1879,6 +1884,21 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 	return of_genpd_add_provider_simple(np, genpd);
 }
 
+static int rzg2l_pm_notifier(struct notifier_block *nb, unsigned long action,
+			     void *data)
+{
+	int ret;
+
+	if (action != PM_POST_SUSPEND)
+		return 0;
+
+	ret = clk_disable_unused();
+	if (ret)
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1948,6 +1968,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 		return error;
 
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
+
+	priv->pm_notifier.notifier_call = rzg2l_pm_notifier;
+	register_pm_notifier(&priv->pm_notifier);
+
 	return 0;
 }
 
-- 
2.43.0


