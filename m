Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F9DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=; b=ULkWJHuiTkblKptJGdAcreKIYQ
	UGRxmskB7vykFgS4To/1yZ2ukzY3mObnhRjFdet50XROeoj05tx3DKA9QvSRKJjSUNioj5w243GS9
	d6LkSmB82+rihsE0FacZy7NypWJsP0Amn5IbtSzGR5jWt2J+zMS1FRvhWO5wYrvqm5EjxDPOifvES
	rdHDif+tHxCalMG7INJ5UpJfNN9m8+TLRBvVQZJlRzWgBAAZEB4Asc+CWkKVq27udnOfDwYmM0V9w
	my9Oieb3pq6FTyRsQzSjvCBb79Rzq0UYiyycG97kvOZo8S149reNf6zgitCHSBAevLW9dwmoFmHcd
	2HNtHaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLD-0000000CteQ-43Ms;
	Mon, 04 May 2026 10:15:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL8-0000000Ctap-3YmQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-444826c16ffso3799688f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889749; x=1778494549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=t70jCmlfFdON+A9KOH18/rGOPgW+APScHpOmwUSx0u7BTYLmSmS4ovxqa2midUA188
         TXlOXCL7yNpCWW1XL5RWqLZFTK+CavGe3Frzv7EjbMs87Mor6ctVervbYVNrJWObClzu
         PJHNP6p9XiiCPNwzMbwlQB42vMr1yYTIMQGSEAJwgJ1yVek2F5zSNkgi1Qjwju8z8+q2
         8OuBsfAflE4I9O9KCBJ7K+M6SeercVgOPEOYCv164C/mk92O3tPDlwx6okKFSNHArhNL
         1w3VfNum4bYuuXfSOSFdRXP6oTLmoJw/J4/z+KvGFDxmqJmzpEMPNrE3Cs4MT2WHgvl7
         e/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889749; x=1778494549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=nyFZutvQWJ3PvZQjbUOBzW/VKGNFhO55lyFKJwALBE7Aam7jtmmpF1MTH+yP/8MQW7
         8CDzKymOH13O5nc0F9HQOx3WpGi67vXtX4AYEXqj2XaY1uBF4FK7usjJ+zusEjK6sWnz
         8Dom8C7M25NOiZOMLIYnUzTQvrAz8ubhY43ydWZH4JStf6auhVrXYwK8yeNDDnsugUTY
         FSMlqhB7eo9Y+24dbbhrLBYqlCaC+MqXvVvcaUJChBdTLzMdQu39YqT5FqyWOAHW3Uuw
         DnpfpRAhSFpLmO6tURiWBgdZf00lYy6PCHSbBrM7Q5EZeECAQvVP9KTpa3V5PQ3BT+GR
         bV+w==
X-Forwarded-Encrypted: i=1; AFNElJ8wTCDQXhCW5ixgywUGWO4wZ6dvcqocUKcPLzhN0pxK3nY5A7GWWjtVpWP3/ncNXnBCDaiZ5Gh8Mj+YLEBZzyUC@lists.infradead.org
X-Gm-Message-State: AOJu0YzBQhPJ4rdC7xNUOHzKiTX4tod4ty8pOGZmeTeY5zX7SdLiTIYj
	xsJlpS1iYfogWyseNcY1Q+ypebX2Gx64CbcqU+vDe6pYmrzf0ISifxyLAC63728HW/E=
X-Gm-Gg: AeBDiesZulFlcnw2bodcj9rhbwUBjlal7Nln+Tk68nSqUXx8+fSJhjV8W2pApPLIwu1
	LGIDR8gw5IUVHEN3l8lXf9wkBgWKM5HHG3ThqJnj8wMfOEa7qi6nHbwSh9NGGGQ/lB16BTCxi1l
	aXjOJLoebZb6pc02NECiIcB/8ZXE18QRvu9kwVgMB1ncgJT70OpCgSti0cxa/yaP/FHU8DIpgEj
	PXhcYLAEWlAfws2qUeCMru5yM6pc7mxFMqaJeTRurZFttr4Zt/kmhUf0WElx1T21lY8pEHqT12l
	TGK5NkmdwCMAXGk84ZtW4NmRvWsPV9AZ/lB2JdZapybBPqMuLlsVpWn8QS5QMXso62CjgaHJvsO
	29VBxNRis7aDn26HdFTgtTQ7LY9pFdX1diNc+xLWVXPtARthE6svDYFEUyHMT7A7M+y9yV3o9QC
	x1snd3hGnLb35ORW6AzdUR/D1ykyelZNLGJMVNKZXCtFFZ2P0GiEunQLnBppcw5EWUcLvQjs1RQ
	9ybgCeEyTY258dNuQ==
X-Received: by 2002:a05:6000:2dc6:b0:43f:e99a:ff91 with SMTP id ffacd0b85a97d-44bb4538036mr13545221f8f.4.1777889749199;
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:46 +0000
Subject: [PATCH v4 3/7] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-3-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=pwo0xPZ+j2nUIqRUV0W+GmOAiRSFJ9hB1ibEiJnHUOT5RynjZS2zWHluR75Uagx6xq6iMWjKr
 7H6qLWZki7ADMzuDAAtTu0ijPIK7z7dJq5AyuHmxz7AJ+lK1nM6C8kp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031550_945901_2A10B4EE 
X-CRM114-Status: GOOD (  14.12  )
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

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog


