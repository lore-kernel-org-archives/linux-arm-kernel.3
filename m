Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=; b=T9i9yofNjUCLZqldRjLPlSmVGM
	rCcPOoXYx9p8jDCTdUs2WXBuPjbFj80KKRtGqqzRQJdy0YGJd1xAMh33e/RLf3r4Qguod2Y35wx2n
	DQsFVj66KHkIBHoeeQ13fmZj01+3YyvHnbz2O37bLt09jfS+eVC2jhWVqWBqqiKJ2NObvlNK5PR5o
	li9FdveqsMfc/bpqdNLO1DJfhsuokNFwOAEaTV0uiY1396EHSz9+6WlrcL+Tsas2iW7ToFmiG4gxU
	UMReTU9V+xsRjwtroMkjX9Gg4J43IqjyJ5+eiAFIZPDNtc40W+C7yoQf0ZQSTapbNA+0BRLjNjjL4
	KO9xrKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVM-00000006rmj-0d2m;
	Fri, 03 Jul 2026 11:56:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVJ-00000006rj5-1wgs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-847d1e9db22so513150b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079781; x=1783684581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=;
        b=ZPI+JUko5FIkUuuXUXUFArsaoOqogx7xWgXky0iY53Lxh/re/tZ2O+7WPk45GxgWol
         VVdqO10eP/G4bHn+o225jZtWNu0sBktNmqApEJPYnzxmwStwCTPoSoN/HVIrvIil/21c
         W9RSN4ci8NTpW8OxLMxI5vLWJo/cbyRMlg27c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079781; x=1783684581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZuI6x0GxmbjrjyvyYJDyx48WMW5UeshcsiZCb+EBSg=;
        b=pwppjnS9MyHnXfKZMUkkOEolfJ3SEMVCaLUaafLGfdkHoXOMO+6GBzdJrTn0IycRqv
         Kvg6pNlVN7MgDfGCJ+e8gXz4GZrvEAEPxN9JyQST39tiv1lFEaKlSzapVxDe7dpbm0R4
         OmKUJyGCY0eFxcFOmXeYg2f+rcqiyMyZYEHKwTcuT7RobOwIelhn1cWRQfLhaPNIzi9E
         VjvPvE+kgHsQhEyAklSNZ+JPZcdJAXMkMxdcsQqgN57vdtO1VvfxwfdlPWQSb4dSP7yC
         fid11j5XkOTbcfBe4LKXSlUMAYuX/qwmmcrr8WGPa6zK04+sjXZxCly8ZBTC0c9M8zOs
         9Gyg==
X-Forwarded-Encrypted: i=1; AHgh+RrOUWKp+3BZ9JmGjOXCQKE75iJHbKsm1WOTthLNqAhvcB1+QaXvZG+Hj2QCwY80CIl2fVkF7baswveJ/NHzlLK6@lists.infradead.org
X-Gm-Message-State: AOJu0YzSDrY5FO2NME+PTwwuo7EPSunZOAVK32XhAMfoWenXKHeNVsMr
	eGGE4dp9WP0YMY0Za4VGSJkFIz4L5+LHyK1EJDLzahpAUcVxWJBqOvC/Zi7whA/S+A==
X-Gm-Gg: AfdE7clP2gBhRk0OvoqGHtlFpHWO8BbPZasuVZwZCHgxGjD+mo4B3aTKvge9nfKtPDD
	diPLSdyxd8fyIJYg91faM977b0+BianLHImsWQjZyzGOwhm0Np8/8PjAQgrxu+ln5Qkc/jmk8PD
	XtCPYlAB6ZD6N3AzISxf5RmrlQsCZLMfYzR+fknInoZbvZs7GRburIhk6OM0ruljL88Pvm/ZQHX
	ICYJW4gvgiCFi2tlU1oyf3jzZ9bAVnPRM6uVEy+oRRF+c+7fsR7uU8KOBQP8GaRih3aFJibK3ZI
	W5GE0hGhMfSAlYsSaettTofRg+qADTnkMOvoYnsPP1N7FcnW9yhDNwSks6wML2lONGT9OZSR7pN
	obKGzYpXX1c+X9S+pOlHDt6THCIaauwWBNL99MzmzxByVDe8xodmLGUTVvwEIcu2l5Inku3Re+O
	8fUfHnZpC/sEIh1tdxpj1oV6oxgFE7lKimMR8HB3E5ljp9/DpynIxsFYnwvOueq8euwT3PMQ==
X-Received: by 2002:a05:6a00:94c6:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-847c0ab579bmr10089691b3a.57.1783079780697;
        Fri, 03 Jul 2026 04:56:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] i2c: of-prober: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:56 +0800
Message-ID: <20260703115601.1323491-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045621_509051_DDA41FD1 
X-CRM114-Status: GOOD (  18.11  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/i2c-core-of-prober.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f274e260353c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/string_choices.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -219,19 +220,25 @@ static void i2c_of_probe_simple_put_supply(struct i2c_of_probe_simple_ctx *ctx)
 
 static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
 {
+	bool supply_was_on;
 	int ret;
 
 	if (!ctx->supply)
 		return 0;
 
-	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+	supply_was_on = regulator_is_enabled(ctx->supply);
+
+	dev_dbg(dev, "Enabling regulator supply \"%s\" (was %s)\n", ctx->opts->supply_name,
+		str_on_off(supply_was_on));
 
 	ret = regulator_enable(ctx->supply);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
+	if (!supply_was_on && ctx->opts->post_power_on_delay_ms) {
+		dev_dbg(dev, "Waiting after enabling regulator\n");
 		msleep(ctx->opts->post_power_on_delay_ms);
+	}
 
 	return 0;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog


