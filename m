Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144B7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=; b=Db75ai/4688EuAUHlHIoQD6W5J
	SJxi90RfzPAA2BPq7e0izLpQ9aimeD1SNBHhebtGeRAQL9qN93TAQeQgzBICjLwypbwudJcruizUQ
	eiEQ1XfqGiE8QyUHY4zkzrw/dk3NM1ogfqEAnJHDx9ZRVBeIj1KZ0cwjbtKHOrehruQhYG2lLFSrJ
	jRpFyAAoAia2VFKhSWioGn47+vIOLoAtey5TfHxkrKha6xlolrLc48b5uEsxbKzldEzHpsBo4aCfy
	kW+QVjJ3fdL6Jy6+Pze3LtMpfMmQ6dA82VIQV+FaaMJnVzaMxE4+xNwMPvAtlPMSSWrXTbay5SFqv
	ayGydxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bf6-00000009dSj-1yyZ;
	Mon, 22 Sep 2025 08:12:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bf0-00000009dP4-2VLn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:12:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso49198555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528753; x=1759133553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=HJe3vfTkMBHiGXQdPDhSFtnA4PTZy6TEgJjX6fRm+uxUT3kYL27VUyD3Us/pHfY2Gy
         1H7TmvJ8tKGXun/EWH2EIqjMRaBiZ5zudy/HqNYt+kY2I9H0APVkFQ8vEv7OQs/4yhG0
         LWYPlC5e2bIlxkoDXmLW5E2Liq3Xnh+2SWGFVZNiEwSQH06B1ulTD5ZcKv+Yji+1mH1m
         q87rGPJItOnY5wjMgAfq/Te68Ak/cqznMsPcm26OmsWSH5rsqTx73rXR5WbXAFZogPWH
         ELlmhD5zSWT7l+ysuQHSOOzsRw5QPtBQuHAmhBL/KNPwYDzVS2OT2/mKWqvUADta3KoD
         m06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528753; x=1759133553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=eEzjchr2Eq4RfLBe2lJkBtcZ5PIbAruku1u7cYssZuAgmJXxCb1joq2ScWvzSVs3HL
         KWeFz/L1HdEEtjotjInzR0u4WXp7+OifDGxN1MMQI9cUWfoC8j6ZAlMxSE3Ri2q0xUGE
         Tq6NxPhA3NDo4fLqDlh1dNEc/OZc3iF0S+zeoyzBtSBYxgmkIy+cGKvkowgDhFsTJmi3
         mnpbfT4r9uUW3P5RAVMiVzEX5VRhs/vwzSoaq2TfgVS7A4PnImuxCJ36GVnt7VX3VsKK
         5c5s5H8zlj8FqpqrWDgvWIviFn7S6QdmlcpoOvGXYsqDQaKcusGAcJfLvX8qDM2IrUH+
         +czw==
X-Forwarded-Encrypted: i=1; AJvYcCWjzfKwjHUcoXD/XjhUPYc2zh0fdmxKknhfn1O0SMIyVxjJtHC0YLsAXI5ZopzPkKTw2du7V/9RuETZKRcXyWTp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzajkf6NtKGyKPYxX0QERiB0Ab+3qapMIMhABpFHALlqEwDrGTT
	+2z9pM1k2yiEckZIyTtfK3+HHsGTwHyl8DqSOi3N07xFIelhrSjR4vC7
X-Gm-Gg: ASbGncuvKNK1geTX+3/bIkeU8pNUCJZQnduWIAewfpbsFatJCCRE0cm+4LUFZ+71Zhm
	cEI+PULUebwXeLoLd5uzxztVx1ptcrXfStRVXVPGdreUmdEn7T9NLIVtLmmdH+5UUoywXAea53p
	BBUirxW3wvJUss9fgjn5hYV/Xgr0Y0M2mYqY25o/afOmZVT2bjPciCflpud1cnYUFSuzQiDwBbI
	j9tBpxcRSodcCdrQBrt6V13/OkPM7p+ScXGxv/W6X2fZuP0dL4ijwNm/sD4maMbhGns/Wq8/NGv
	wcCLsymHR+8td9gJW1TDbTdynxCi2sb0T9X9HquUNnwvNiMMgFVm5jmh51TDDbnoAwV4GAJTvvk
	UydZ3mtEqdV1iwyrwygBgZ0kLWwj5jRyR2oi+OKOhrZtlRS5EEAvdufwmNgun61qBpaV1ItsElw
	XzkphQvYBU30WMFILr
X-Google-Smtp-Source: AGHT+IHErk/g/+nIENyJ6+q+pyXV8qOgYAZOyjvomg2ntIsCHA25Lz454iGFXy1dqVhhd2gwP8RBKA==
X-Received: by 2002:a05:600c:4ecf:b0:45d:cfc6:5166 with SMTP id 5b1f17b1804b1-467ea89db1bmr112950935e9.23.1758528752582;
        Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f3d8csm17958416f8f.9.2025.09.22.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:19 +0200
Subject: [PATCH v7 2/3] clk: stm32mp25: add firewall grant_access ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-2-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
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
X-CRM114-CacheID: sfid-20250922_011234_665283_FEF93095 
X-CRM114-Status: GOOD (  17.17  )
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


