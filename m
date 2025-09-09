Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A9CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=; b=L0ZXKjc86+ZZWm64hfdG7yvOpz
	8jfEsdG104yOb4O7UCTJN5zX+zB0m6x338C3SRZbEPdQAMNYoQ9pBci8sqIfmTQJtMThuAlChrt7g
	7rGG5fGLoh3XkF4/Ig4jEMhRWSYS5Do9+WEVosJZTqWo60uB5I/RYrnuViFoutoqDBlHLTotDUYZK
	qEKNTzr4WL7HsHTuNkVg2DyGBOfxVdOFo2573Sbf5GYkTVUPOZKO98Hc8Moo1C24bNlaijBWmkXYh
	1JP+wZ19usXyjKJcLLRwI0lJtfO/efzuyjk6qn90jm5lN2CI/04I2SwiGNNdCTy0P59dTw8+0nuBC
	XziYxHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1ec-00000008gnh-27l2;
	Tue, 09 Sep 2025 16:57:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKu-00000006HcL-3AlH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=; b=d4uCh7bd8bimRtpoZmx3ZIZApO
	fcLpVc496+OqlO3UeVXA8Tc5Q+5Gih93QO4RXhZiya+l+vmHtluMPCvLk6XbN8C/uzNPBYPHYIEFZ
	XrsKliaTuBsYZXw4woEG7YfhWUdULELji0Z+HDVJCRIFQMyTIZx8cApxM/C5IwkPAZZiy6GiuK3N/
	KkRHGOMW3wrGqtlS23dfyjF/RAS+icD9vYKHcD7PxOnUuKu3qhaiICadFMEI6GMiUeV93TFjeUpOP
	qazX1V7Hxw0FUvmGrAHPq3UVSs/quYgoXgjrLF5buj9J3YOTqsR3x3druUS926vk+w9FSlSU8m51G
	pVoHPAOA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKr-00000005HV4-3wA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so12357775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412744; x=1758017544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=GQ/Z6QLIvc4H7Xs9lpi8wBXWK2fD3x6s9gaOCF6pCcIE4AlHBglKjkzcG/3NEKcDaS
         8VE4ncGLV04z+TrVGFpQb9ii7fPVf3sws5XpujU/I3Bsk4QtsNHQl4H8xp8pX7SC67kr
         +g0hULX+M4Yr1q1JxTqBVAUolxX3UEYP5zExXzLRkFeR7XbFxVM+Kp+yMue4zb0U/dnL
         cyVagt5JU9DXlYnKDu+IN5wpstmRF9b9OPS1+XmzmJhfjWeR9sjN/7fQiAvFr0QcpSNB
         Z6nbba0Z847Qg7ulIMkBZ5b9dXgN9sHin8PEI770eFp9vnU71QmdRn3iyJ7wj7JHMng7
         KdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412744; x=1758017544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPzMl9444DyFsyhIlxZU2alp+KEUomV9x8N6sGCMpt4=;
        b=BC+O2b2EsIBlzqDRQZ0ryLXsefEqZIPF8Prd+CG7QLAXkKIwZTsMFv4CFfM/3m+75C
         9S0840Vo+b0JdGTr0Lb7UDWjlcy72cgRUwpx44jXhbzRpTbdBZTn8sF+t0sAZNhH9n5W
         G4SLBZBGL1YwZdFSp1Xp6wVpIMkTDRn53wjrqvj8Kyoy0Q6epedaQeGjpQ6dEorhfF/4
         xajct3XYDkRyYNhpJKiD5XZ2nW5r7BU8GV/KQeSzGRLTkg5V6Eu/fInyObGsezEJz5qe
         7hsN/ElZ4U5lu0/H0tsOP5kL94lhSBxKXQWh6dvAHtp6B161+UzUV/1ECEG+C3a0rI0w
         zkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBvl9eyaNbvQ21M7FhIChYlptk+WE6QyrZR31m0gEvjnBsIjGnqIKCdwfjz5ercbVk8RBWwzVNNEEhq+qAa/xL@lists.infradead.org
X-Gm-Message-State: AOJu0YxKDoNhgLkJMOjMsqVWZx9rzuFkLw62AT7n2Jx7yn4/zCD+ArWI
	cJ0sGGGnaVTbStFq7XPIAzX6qjKBxXv8FRmUcqh0azB3yoWvn0WKbIrr
X-Gm-Gg: ASbGncvvARgcHhgx+wAV/BwUW3kU7oeZMCbZFn5102SaU+Y+nwfjxnSz/KLohtRcZ04
	qz9Ik+q/k+2guFM2mdOxETP8+D3Mq+ZOKOo3O/BLUBcQPw836WNTuEBeNxPfjLJepUvz425GQ1g
	D85R4hsRK/6h/UDlVH9BBloWo5OrSfuKRzxtwJ8wRfm48p6Gagh2kgkUinTOAIkodYLFljHsp2f
	DrNBdf/i8oEImnRoXOZHFFjXECP9A9tzffLM9GtKVkWlXVCwHuuiYRPgru63pJnFa17/ZxfOaah
	aGdIF37U2jE+H5vPfOmIGNr6GIIKQ8U/XgsaLCt9EX3YcGIcDrHKtd472PQfudqMfHOBvE+2/eN
	r/wTE0TPHekZNjAvmKDaZfO2SC+xtFLNYS4GOn/fw+4sIAoDBwQHwI/BfuqMxI41dxZ4anx967+
	SUV7R2OLtnbzd88Z9kf+/iXw0qJA==
X-Google-Smtp-Source: AGHT+IGPh09/AgyRGnk3hh/JVjy55HRoX4WeFY5HxCNx6I/w3RAwA6apcDwreywzBjxWgSeV51SF/Q==
X-Received: by 2002:a05:600c:4587:b0:45d:d94b:a8fc with SMTP id 5b1f17b1804b1-45ddde8c757mr122875745e9.16.1757412744214;
        Tue, 09 Sep 2025 03:12:24 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df2cb1d77sm9627225e9.3.2025.09.09.03.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:23 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:10 +0200
Subject: [PATCH v6 03/20] clk: stm32mp25: add firewall grant_access ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-3-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111226_103649_022F74DB 
X-CRM114-Status: GOOD (  17.75  )
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


