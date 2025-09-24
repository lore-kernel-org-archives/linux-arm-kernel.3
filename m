Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C815CAC5B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=; b=t1DewzfhjKc7yvNl9N+k4nSgla
	k+f67ewh0C+oofXCfnSZaVsZ1DsPLx6U2P7+or1MKb2aWviZqLXNNNyb3a39XAAhLOw7VX30Ytyaj
	2a83PwdBUvyh/nhYsbE3AKOqA6r3VTeazp5gtJXjFsP22tI/QTRE7qEZOIMjiQLI4gzLJ3Fo/QbVQ
	Jxe4q/OMYChgZo1FiGF+wX39kWATs+8O/RyPlHS7NufpaKYcT/cljWRRmNXr7tZRypPP+Z9saA3KX
	7jfAK7loIjgVbf+W9m7Ru8BjtZkB29pxNCe64vTnhCSJw169Agb6S19OZDD4qX7X901FgmX/syTqh
	pv7kbgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3U-0000000GABi-2PBD;
	Wed, 24 Sep 2025 09:44:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3Q-0000000GA6z-1jNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:44:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46b7bf21fceso34461815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707090; x=1759311890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=VNDgaQMK305dm2PYR7xwubgOiga1K1BZ/6WcMCb7RhPJ12NbLi3fQDdIxrZnXk7fqo
         i7Pcb+SLPbkyORVks+mNzqPk2apd++tsaYTpBcwQoFg4mZRgTopXPVbI5OvDjxpE02nM
         75aG34TpFFdkhpndNZ6nD2hlpBOXftour87Zd3gpSHDB8dGQ1eh0CnzBwJfQLGG1+t2i
         o32mf01UKJAnS4VnZU57CLhT9D0URVn3IsGCNpsOQbpVr7fhLqIKKEDTXIyIaxTE3iPX
         GH5JeFUIHvz1CzAN8j+0vwjrKnZbQCRRYx1xgqwwM0FfXK3+9+chtRJS5amh4sR/r2bi
         i8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707090; x=1759311890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=Q+r4dkXUlrtW9z1Ua2RVHnX5uZSCylFEzDQ64Ev5zbNHaOuZV6g3Qq0p2/znizSLCx
         RQ9qdfdFY0yf9rg0Sel8jExrZbHsaFnR5z5DHQyqdPqujlbyJEdi4amzXQZqZQm+u7zk
         d1j0qlNewOxX7MseE20uGOpl/Z/oE1LllmGvwybs1HRQTSgwJFvRszABf0lUSVEaNw/h
         BRAYItW0+x21STMnJ61//qpGx4U866TW9dlqDEEmtFonOI9qELKw6Mqit6BCunTfz//s
         7BnDhjO3M0qrgR5tcZqHSD6hiV/1D3bBux5wgTB8uqC+WALrQfNEFXlz5l5S2J3bSzSN
         /plA==
X-Forwarded-Encrypted: i=1; AJvYcCUIweLQ4jpDJvujFUDhfBCCXpveyenwKeGhdFpLZYbgzka2IWRp3lfgn2z1/TD8zmn6soMr8lDPs11vyQvcSueg@lists.infradead.org
X-Gm-Message-State: AOJu0YyzpzrnnspQQ6piL6+wgpuFA2BQWLGsPA/Uajw0YGWDXgvlaowN
	c50kD3RvxEUUpAiYrgo9sRSa7R5fQQ2/UhdJV6TlhqHiaTlp3w2ZLe1X
X-Gm-Gg: ASbGncssEPhkOfqV2o0Mm423bzTRelx9NtsKOYYmje/FRtOltYmY3jtQ2mpv7QK/Gj0
	qC8XnbLYdLiHYLjLHwyP/wsCAjzP4lf6pFtPyS/d7FXslfH4BiiBpXnVjnyGh0Rx36CF4TxFCCh
	JlAuHDFCv4IxAePaFtdjxdb8oTF1DMLHWxtzhTngp1L6XmAaMjq7/f19lI+6wkmwLq30UcqaTTY
	fAVvhEP8B9oN140VNuvXKPyYlNV62tA1rg8QxdOkX6D4mYajvZlrcYP0BYmGrhgfa8FH9pZ4KUP
	54ws+uUjLJQraPyyBWWJdnWTMUV2/J4SXopAvvESBszI4U23pJsCCVbDAJAU5lufidT23TYAWNO
	455RPA01Orc/g2NbCZ18gF6XQ2UKQixXsNDHvKJtvx9vzroh1bH2kxs2IjmTc0Er2+YH4D+BMXF
	oOTJgMUp7o1aOAFQ==
X-Google-Smtp-Source: AGHT+IEhM0YgF2Kn4HKT8PplTIrFiGxgI+VDLPFn2Qw0xzee/LIuyoGd6FHnJttuYVQuUAjdxDoCmw==
X-Received: by 2002:a05:600c:468f:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-46e1d979fc5mr51230185e9.1.1758707090354;
        Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm30729625e9.7.2025.09.24.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:43 +0200
Subject: [PATCH v8 2/3] clk: stm32mp25: add firewall grant_access ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-2-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024452_477313_47B18D6B 
X-CRM114-Status: GOOD (  17.06  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

On STM32MP25, the RCC peripheral manages the secure level of resources
that are used by other devices such as clocks.
Declare this peripheral as a firewall controller.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp25.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..af4bc06d703a 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,8 +4,10 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
@@ -1602,6 +1604,11 @@ static int stm32_rcc_get_access(void __iomem *base, u32 index)
 	return 0;
 }
 
+static int stm32mp25_rcc_grant_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	return stm32_rcc_get_access(ctrl->mmio, firewall_id);
+}
+
 static int stm32mp25_check_security(struct device_node *np, void __iomem *base,
 				    const struct clock_config *cfg)
 {
@@ -1970,6 +1977,7 @@ MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
 
 static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 {
+	struct stm32_firewall_controller *rcc_controller;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	int ret;
@@ -1982,7 +1990,36 @@ static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return stm32_rcc_init(dev, stm32mp25_match_data, base);
+	ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
+	if (ret)
+		return ret;
+
+	rcc_controller = devm_kzalloc(&pdev->dev, sizeof(*rcc_controller), GFP_KERNEL);
+	if (!rcc_controller)
+		return -ENOMEM;
+
+	rcc_controller->dev = dev;
+	rcc_controller->mmio = base;
+	rcc_controller->name = dev_driver_string(dev);
+	rcc_controller->type = STM32_PERIPHERAL_FIREWALL;
+	rcc_controller->grant_access = stm32mp25_rcc_grant_access;
+
+	platform_set_drvdata(pdev, rcc_controller);
+
+	ret = stm32_firewall_controller_register(rcc_controller);
+	if (ret) {
+		dev_err(dev, "Couldn't register as a firewall controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void stm32mp25_rcc_clocks_remove(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *rcc_controller = platform_get_drvdata(pdev);
+
+	stm32_firewall_controller_unregister(rcc_controller);
 }
 
 static struct platform_driver stm32mp25_rcc_clocks_driver = {
@@ -1991,6 +2028,7 @@ static struct platform_driver stm32mp25_rcc_clocks_driver = {
 		.of_match_table = stm32mp25_match_data,
 	},
 	.probe = stm32mp25_rcc_clocks_probe,
+	.remove = stm32mp25_rcc_clocks_remove,
 };
 
 static int __init stm32mp25_clocks_init(void)

-- 
2.43.0


