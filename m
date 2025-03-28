Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF058C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=; b=LI1xFATtNXAqr03fQWRvMa995U
	cgYcDffTQqgs36o3HVkc5tDqTerl9eukmv4Ua529cMWLXPjKm/9yy1wvmqG7mWo/T0cyBF59tT/wL
	zxxxXfuPxjVUxXAtXbmP0YNfp4XiUhLTusxGNIcmEzhBG+n+154iLXddNQo2Uant1HmOUN/c24s0G
	PA0wkcglMPeK/Ra+ySkGRdV0vSvHvI/+60qbPXeXAFCZWRDMQUAm4hFkgb95B8gF/FjVqDZpxM7AP
	uSfabm6UgozGn2FyBtfV84I+iZ14WpxWloMROUjCe2nj17rjFnJqWqDxMBvdukBkh4IIcyWBIsB8C
	guNVb6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAUM-0000000DYzS-3O4n;
	Fri, 28 Mar 2025 14:15:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9ng-0000000DQle-18Wc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4054174a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=FcUQLYkEu081+ZF96pixkvO0TRrvpukf4iyk0L8TekdfsWuMMffESAr4s+pXYqccwx
         w9uH7bw+nThhSTiFXKKaIzmnmIZSTGTOfn/8pP/KSWuJfL4O8W8CRiL7qeLl6Nv6bdkn
         xTFQR+ZzRXJPXWmnYTkH11j1wWtQEnJD2Ao1JSL9N3uCcIyn76sRNCy0fbhVc80fZTRl
         7KrE15eZcY5ntsToe5UvoTzZpGA95gLv1igIOBvy56vKkE9ev0CGRO2saaBXD34hPV0c
         cFaOn0EMur3lsxdvE9ePPIQC5bUQZRmHL75gYSCeUA/e/ClVSWQsAoriIYWjfNM8VNSx
         lCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=K42ks8JeoUw8iuXyE1GsM4oecQ0PCZiCFhZoFcvxi/GsqJWii4p3nVVBFzIKoOg+kY
         sS21Tp9So5IDQK5oUDj69yXoN+DRJfAQpkSweTP4yoT9w3KjK4GzrvJR8sJ3a6Qmc6Br
         MavCDsqTzY/YKrva47+IlB83Cb2pTvISgJ8kwVTjHEOl9G9iIpiG1qsGTbtZZsK6Fcqs
         QkxISgYwNjkmRV27N6fbNhA2PCgGGdxaHW3lyXx1Srrwgy+HVAdBhjtD1Ek8U41ZEr08
         /dEDa2GwqL8W6mhZrvLS6AIZkWWq6y89bgWu7PcKFIcqHg4vZaNtIMUC2DiRDwHNcvn4
         vuhg==
X-Forwarded-Encrypted: i=1; AJvYcCU6B/rPyEolz+VeZae24q6HWcPjgpm9Mbe5CnVrDVaPMRUmzPQr51k4ibVZdNqm3VCQ/qx2/fJps9xdgoSN+dJp@lists.infradead.org
X-Gm-Message-State: AOJu0YwXw5U3sL5zpryZNn8w1HwIjuynn9P9bL1d3FE8J9N8DSfw9cdj
	QU2MGUCAbo4KryhmtL5NiKAeiXsVmuYeVHZKVB/GwN1I4SfnyrGp+hd6buFcXic=
X-Gm-Gg: ASbGnctcZSxgErzxXoV/oeiTGYOYriHuBG1XZyXxfXoEQ675SFXuIGv/PhHW7HtYAY2
	XjpIc3C7C54Ii/m+WcPCE905iA3PHmyR1Qn6N37Kat98dEUpBvnIbPITXz6A/eakBRMbeanx4TC
	Zefpo7wKbSF4e9k9OUHey6OPFv/qgIbIrVGHJORF1g9XIn8Jxsz7HPtBo1ZGHI6WZNCq6Zq3y1+
	MYC8w/tGQ38kK0QxHREEVn2EVyLW3KVeOL7mfyHSo332IJuaWBqzZpXlR1lGze7kBcp2ZedPIkn
	Hi2tIRzCbhRnHabdoTqjObfjY1TeKvlPj0EaW6Cb0owKdI8SeZYMK/RAPwNVxDxKG3lLKb99JdQ
	GccpQJf/nTyhdfQ0450ExhLsdSO6g
X-Google-Smtp-Source: AGHT+IG7PqQiTAeCLYeu4XFO7xoUmzB0J+twGC6cGhlHhLLeNWFRkIRumwPXFqyHrKLHI6/YYrbfIg==
X-Received: by 2002:a05:6402:241d:b0:5ec:6feb:5742 with SMTP id 4fb4d7f45d1cf-5edc4c93702mr2791136a12.16.1743168666473;
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:10 +0000
Subject: [PATCH v2 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-24-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063108_309832_CAF48CA7 
X-CRM114-Status: GOOD (  14.99  )
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.472.ge94155a9ec-goog


