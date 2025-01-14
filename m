Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4998E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=; b=l4x8N3ILwOndeMXPNT28ZBiC3h
	OH15VCTLj1twp9BmyC+hiyiw3IeITwiyejeDkdcabc+uCnmBuCizxjJ5s1kO8uTuCT1m7VO9p/YRP
	p/q3dLBUTmJSjlpyhuE70K1y7FJ+QW2xIFK2RpQ/XLtNYLjQBJHVI2kx8jAzOqCs0zHvnUusvJR4m
	3ZSYqMhJNaqf1BhQfz652flyR9nyyXGKxq7boCaBQTzry3NMqvk1cR0EC34ORo/KpKn24VqemtmVY
	GY1I1XvZ2gbw31pXGN7KvFTGCS1Do7szKAjWFEp6l7nmtm38inyBBWPeSZZkLdwmjScSs8bjaweNW
	1nPDpdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmGY-00000009UhO-0Hfu;
	Tue, 14 Jan 2025 19:07:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmF3-00000009UYa-01in
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=; b=CRd54XYQK6EAbYsNS6RjCoE3oO
	kOObtIBDSWAmFAVWswcSKmkVeNW5/1OYh47Vm95hGvwYTO78iLR5XvvHDUZCT0Kqiuf+IbS10UWjB
	2MThDUcH3WHZJe7zDrG1ycK9yDESFsDqH9saH5dv03omJ0Hqh6tNHP5co3Hdwl+qGOAU1ZOlNsfXf
	YdW5xsXbMu2U+NTHrMlFQCz1Fwr7Uq3cSl1R8s7l9ki/32cprnXbBlEm8F1HxJTtGcT9L6W+tXpyM
	7LVvmKekw/QqcqEQmTmPMxGC8qBNSn5+Tvs6M5idZAk1QQEGsfm/HzCppwEbCYpbt4BSfMvFaBUYq
	89vJ4sDQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmF0-0000000AZL4-08oK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:06:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434f398a171so6315105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736881575; x=1737486375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=;
        b=ZhqPiWPNqqJ0d5mtbFVMxeb5906nkygB/ZAx/kvHRBz3yBnIrtuOWr+RdopK+BADpT
         nzJQ0gucukdQrJKSV1DQi7UGbj9MliMcOJyiMy8dXCWe3hwoDeQ0s+aodpG9AS7lRGc6
         bqDK10YsACc8pS9SmZ/C0UoIACeKtp83aNPf3eK2u2PvP/qvlngbnmFlnMQDnkMCc87U
         WCrhTpMfCzEVPAh0pEBc0jhwuDM46uL65RSPfSh4fuUANIrYI6Sbq5HlW8kH41o4EX1I
         Lzm0RtwY2ccU64WwGHasChqg+mcEoMCqJqgnmwkg6LL5r94osRhHUzds4+6mRhYF9vED
         LSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881575; x=1737486375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=;
        b=fewIagDQ5iaSRE9aUSknqTHfbNac5DW6qtusDP1AklajzlVkL9+z9AMsNn2RfH6CK6
         Xlc2S78QNXzMnxwojo5AfWcwvt2nZPor7N0/03rfnf/Tr+asLPZUVNmtmlFO1H0yL+Tf
         6GrT66hjIHxmX5pRQeICJkZubNBSbZB0rcrZFKFpfAj6nh5eMfDI08KKaPjsfAKRPwWI
         BTo4gNrewA4/Afpl73UOUsWZWJbGV8UgQJvy2f9qSbXFQr2MqYVDohmMlo8Jw5UCDp99
         M4FYKPIhlvwelLUaIsnBWalqCi5CkkR3v+dAGm/GxOAsugcVkJ3VyaM7Iis4qpoLMuo1
         mxTw==
X-Forwarded-Encrypted: i=1; AJvYcCUPL+fDqlKQXiuu4hNBbmVjDUdmYlFZOuJDnzeQvH7brHQbwVJfdgjBBY5ZsMpdtRkSNXquKNRnUTX4B1PFjznV@lists.infradead.org
X-Gm-Message-State: AOJu0YzGICvs2Y2qiaNnqDnDEYtYkSaNqMnMtRgmhvfmuFCEm1KG3vUX
	Kn+RwjjHROJSIt0DuuyekzlDTusNkxolNILZFQZ1ghMr6CEbHM9Ettb4UlU5RAc=
X-Gm-Gg: ASbGncvZgco3Z2arykfJsr+2b8GQrKnShOtP8+gj9oiC1+l5iOrg7nO0SbSwiYOEbsJ
	oG8FzPxRSqioAQBqPXY0cBaiU0j5r7kshqWt/nI6WRd8KeHazRzI+NNJCMATT0qMDQ+Bu3hIVnD
	5GVhoxu58RLuLdOrwEtX36nP14eFxNmCsPUodW3veHJ2yjYSHCTLGzbocJfOAMkYGPqSrEPARcw
	odbT8nzQbLp+rki56I0cEjjzFiN6ZwDdSXyJ6wUaoqdmwgYLslmWJLch6NKI15c8duwtMs=
X-Google-Smtp-Source: AGHT+IFImMOmtgZS9Sl5xUd+t9teQiBmkHvNXwnB0+XwZRB4xxUckm9dhGwsh72cuUI2ybXH0UMA/w==
X-Received: by 2002:a5d:648f:0:b0:385:f479:ef46 with SMTP id ffacd0b85a97d-38a87310d7bmr8399078f8f.13.1736881575209;
        Tue, 14 Jan 2025 11:06:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1b44sm15771296f8f.90.2025.01.14.11.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:06:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] clk: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:06:12 +0100
Message-ID: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_190618_169674_EBE5FA32 
X-CRM114-Status: GOOD (  14.25  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Also: drivers/clk/clk-xgene.c
2. Rb tag
---
 drivers/clk/bcm/clk-kona.c  | 3 ++-
 drivers/clk/clk-nomadik.c   | 5 +++--
 drivers/clk/clk-xgene.c     | 4 ++--
 drivers/clk/qcom/clk-rpmh.c | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index ec5749e301ba..2b0ea882f1e4 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
+#include <linux/string_choices.h>
 
 /*
  * "Policies" affect the frequencies of bus clocks provided by a
@@ -502,7 +503,7 @@ static int clk_gate(struct ccu_data *ccu, const char *name,
 		return 0;
 
 	pr_err("%s: failed to %s gate for %s\n", __func__,
-		enable ? "enable" : "disable", name);
+		str_enable_disable(enable), name);
 
 	return -EIO;
 }
diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index 06245681dac7..f3a73ac5a1b9 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -17,6 +17,7 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/reboot.h>
 
 /*
@@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
 
 	val = readl(src_base + SRC_XTALCR);
 	pr_info("SXTALO is %s\n",
-		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
+		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
 	pr_info("MXTAL is %s\n",
-		(val & SRC_XTALCR_MXTALSTAT) ? "enabled" : "disabled");
+		str_enabled_disabled(val & SRC_XTALCR_MXTALSTAT));
 	if (of_property_read_bool(np, "disable-sxtalo")) {
 		/* The machine uses an external oscillator circuit */
 		val |= SRC_XTALCR_SXTALDIS;
diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 0c3d0cee98c8..96946a8e2854 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -7,6 +7,7 @@
  */
 #include <linux/module.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clkdev.h>
@@ -520,8 +521,7 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
 		pr_debug("%s clock is %s\n", clk_hw_get_name(hw),
-			data & pclk->param.reg_clk_mask ? "enabled" :
-							"disabled");
+			str_enabled_disabled(data & pclk->param.reg_clk_mask));
 	} else {
 		return 1;
 	}
diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 18de31889525..c7675930fde1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
 #include <soc/qcom/tcs.h>
@@ -206,7 +207,7 @@ static int clk_rpmh_aggregate_state_send_command(struct clk_rpmh *c,
 		c->state = c->valid_state_mask;
 
 	WARN(1, "clk: %s failed to %s\n", c->res_name,
-	     enable ? "enable" : "disable");
+	     str_enable_disable(enable));
 	return ret;
 }
 
-- 
2.43.0


