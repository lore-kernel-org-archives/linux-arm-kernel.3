Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727EEB2700
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=; b=UPGri9sudqh+MWs47p/pRIBTYI
	kvZ75xARlMjlmriH6ccShyv/x3uCIQ9IedPjDF9NGAuJGZLe/T6HbploLEZcaFK/XWNc+VfvyJGTA
	qH5ekn1o1WuGmC4NuqgIdRy7eKk8LfmzPAMF7DcLUeSk6Gt4H4NxsqFnH0xeWBK7WScszO97C/OAX
	rNaB9qIuPMyp45Z2Z9USu8b6aef4D36BnKargK+xS06G047Pz037wdUXELoB9oXsUocQ1fb/1Bmj7
	t81Wt1VjBJg5K5DM+A9hfCZ2NrM8iQjfTvfSfnF8Kl2fh5wwaaXNEK+fuUzD/dC+trowV8mxbzLzf
	E/Dhcn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUQ-0000000HRD5-0MJu;
	Tue, 10 Feb 2026 19:33:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUL-0000000HRBK-49n5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:33:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-481188b7760so42859785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752012; x=1771356812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
        b=B6jC6amxPjkYENq2zc47HgQUpA6iAunlMFeoBJ10giMA3YRsW9oUnZ3mjt7mEC2e5A
         C5pQ7Lki2e2nM6jY+fhfzJymUSN4n2DEIUl+Gde84/QQBeo1i04jjgMIcNoyaq4GgZDg
         p3iX/NAfzQ3pKtwIjrD+zjrstVv0P/hIP3PZ9EuEkGFglxxqvE9cypzvL6xG7s6r4pe5
         9jKUkjesomynh8Gpz54BJqcxo9t5fNNqWfI8VCMwh/1Ztzud5CdCwiKAVjU38plaM59V
         BoVKr0xgiZyP0ybDV29y4j240ps1utwt54hX8EBpjv9uX+HW+LD25gkfqzA+JHwnEM7w
         7zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752012; x=1771356812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
        b=mrH1J+mhPp1sFu0xb2OvZQzY8rUaaZ5rVJYdratkY0xfMlwk4kHReTPljuoexwx7Uh
         yhf+2oVWhqHeg38936/2aeLnbFMIXiSggDQe9/gCh10z2ygB/RxlUWz24PqD44Z98qc1
         yjwx39HdX0hPhXu/sdJ2WnNsMSz2yCDqyejioiTnf/xWd85rlKgnI/wYUgCKUEo4cw++
         1kvD7urwnTwMWYdPxD0yY8DjbviW6o1TU7BbQl/zBCkaaDRusCwMgHUu56WQXZwoKfYF
         nARqZ4MnODnJB4ogEr2p3QpjnREYCwHGrlzZZINJAf/mfZCm9fNJR1tiOHiWDslpH/mv
         y79g==
X-Forwarded-Encrypted: i=1; AJvYcCWInenGfG0g0//uAAKWqqlZHhh3I2ec1mDtLHLfKap0y7pE3cHQ9smdsg+o7q6C6Sq+WHCRvVBq+jU1SubgsDzo@lists.infradead.org
X-Gm-Message-State: AOJu0YxlHGwPdapwDlaAYrTX1jBHH0Em4yB2+yUQd66wahASyb43uzBM
	TzqfmLveKUuCLt/0CHYzqJa9oQNYNVLNGA5vuf/jqYIEFaW7JxHUHKcT
X-Gm-Gg: AZuq6aKnn11tY9KimFSF5qS51TtQPPqI4777mLmAnQHgQ/zMSjkNaIXsRt+/cPPk3CQ
	PUXlNkGRWN5Sb39aMXXEN/MYL6ewVmeJJLQ+350oi7XFK4aLnZPOx5mszGiqMR1s2HCbochvV24
	m1IOz+u66cPKCUEMr58nlTUJq35GXoNUglrM0+9plyxUTg2msWeMSvmbLF54wMnD7E5wpu5OUM0
	uZQ8LqI0ets+xBuS2l15eEqGxslP8vX6exebfytdcFJ58rSx+3K1//FoWxBIIu0TnPA8UbDfgZL
	E697Nn/kje8rVFeTj2gmsvQ2N4BzDWdKXskFxyC9AEXI0XcUol/HNv3ngssgnx1UuXFFxTWBjlC
	bp5lcGYu4Es82xlRD4Cyb4JpEW55eLgsvbl440m5+LMKWHII7wCFIqAM+m2Ru68CRB4Qp07Z3sL
	/RHgt5MrCkCf5xgBNvBMZkxCZgMTBwBPrucEfliHNVk+z50Rjn7aVDJ9Ias+A=
X-Received: by 2002:a05:600c:1548:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48320933613mr219892995e9.10.1770752012271;
        Tue, 10 Feb 2026 11:33:32 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7d55c9sm75779815e9.8.2026.02.10.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:53 +0100
Subject: [PATCH v9 2/3] clk: stm32mp25: add firewall grant_access ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-2-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
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
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_113334_047190_252C832A 
X-CRM114-Status: GOOD (  16.92  )
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
Reviewed-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
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
2.53.0


