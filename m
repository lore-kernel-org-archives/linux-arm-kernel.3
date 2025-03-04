Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23fw9nd2WijxdvDPVP22O//GXKGD/eRJ6jlUzmtvfS0=; b=TjS9EYtaQfMJvIHsHdpjuvtBrj
	6VFAQJOtBwGu+hVOZdhqeCxM4bYKxKmWFhllFRxYZcPYMaJBb/Q3TIub0UseSKS7Sv5rgrZWbF/GA
	FYzBTPGAxqKenaWFr+KGOjfa5C7qST9lw2rJpFvyQO64PSc2geZELNtypwHPTIio9nRwTnb+64HvW
	iOvJwh+TYxgCj9MsIzXXRg4dk8YbrBXCzKc6FbSxA+Cut18xw95EcHoZmE431BhCu/xW8eZesD6wx
	J4tS//ff0j1wLGfxL5g6lNbznggl1t/nUwaJjAnqqybdkJeDBT0pU/BOpitRPT2OC4Grr/vnGIafM
	6gWhOGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZMg-00000006FML-2jrv;
	Tue, 04 Mar 2025 20:59:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXH0-00000005tPF-398x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:45:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bba52bc1fso2716925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741113945; x=1741718745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23fw9nd2WijxdvDPVP22O//GXKGD/eRJ6jlUzmtvfS0=;
        b=tVGsKpRxxw9QXl/OyfQGIqyaQ0LMGgPIXCxiWcysjBCmEptx0SARd4Aeo+L0sms2V6
         Vawn6t+FS4LdnEDXzDfTTH2RoE2cSe2TsHEflX5bcvYRi7vH27Kp4QQ56CCL64pZtV15
         xfkCKnMYs87Dhv2KUaHa1fwwufNEjl/yJsOl4pl5QICEOYPgsPDdwG0DklQjW/58zLWD
         7EAbQSWR+d0MAdnyywt28wJDV9+PtEBxOp39B0Qbfrnjt+IXHq7e0qXFGpJdJjY6bxND
         bjMum2Rk63Pf0rjnxrDfDAIOGBpzKpGpklaZ3oyN4FstBP2Zp53OSwokgA5p0lHZkEQe
         /wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113945; x=1741718745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23fw9nd2WijxdvDPVP22O//GXKGD/eRJ6jlUzmtvfS0=;
        b=OireZaMNcEiFa6jMdMlh1yDVFXyG83INnf/zkW9VU+Qd06sRP/qzW/9LEic35SxwHR
         7GYO0M2mrEd+rr8yG+uXhgvVjq6xh68lRaO+ysWlIdxOTKhpzfCFQzbp9LFlWxn2Ydf/
         oUr1Hes7SE9RhHgaI/dJC7RFdPJ2QHr4cjNxH/QMbrcjkoW183gez5rF7gxK6LAoqb9+
         ZiAz97fzgmY25anwInzpCc8cCySV/FYrNzp2+ychHmp5UqoazkROqtmB5tKC2dK16qf+
         FXB5bqidS7XlGqO2JA/KsBkwsSQdfCf+yEz5coRgiVyoQJh6yYpz+/MGdExCDPqHPoPP
         Kg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXxaMmvjkgSdil30XShskCXVY8cOuBBH+fjck0ENh72scr2J9MmbDtwGKOh2Zh1MvmRmtfjJBIjLcBnMiCCk1ej@lists.infradead.org
X-Gm-Message-State: AOJu0YwW0eBzyFkPHU2VE3BMl6+MSRtC8nuboesmDhXTbyhferfghJwv
	UJAjL89xnukCThJ1n3qRzsv41hKOu2j3h4aB/edAFjV6AWWIseQiZ4hhnDuyQ6A=
X-Gm-Gg: ASbGnct8b8Fuh+HkCiZkOl63Z1CNCVqJCeSrwuzn5DHHdCsI7m5LoKoB60wSc0hOFOP
	oAnzhJEYSV/Yo5voyicpcCFpTVa2h1EA8/zozc5FbP0WyA8mTXsPxc/ThHmzyaYNlMnPPfET1Uu
	VOcOEkQPwq7GA975o5ui2hEzofliyZzcppxwnCzcGRMEWFPL5/TgQOxGRQdk3RQWN3mTF0Qo/Pe
	19a1Zn/v5u7yu0ROVw7uQjrrvlKUQUXiLTlU776mOFt75m3NRba81oUr/BJvG1dkABDTD+yRBAf
	l3kHciK2SgRJTqvmYvPifYNhiKVupKl/X9klfllsjl+2OXabOUxK424Rhh7q
X-Google-Smtp-Source: AGHT+IEZBNrDOHIEWekGAJtSc/UGpK8YWJ/bFwbNk8fHje7TlkvZlpJFIsLNWuWturVh4W8L4OYIwA==
X-Received: by 2002:a05:600c:46c6:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43bcb934956mr14692285e9.2.1741113945177;
        Tue, 04 Mar 2025 10:45:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ceesm18229985f8f.45.2025.03.04.10.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 10:45:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 04 Mar 2025 19:45:31 +0100
Subject: [PATCH 1/2] clk: samsung: Add missing mod_devicetable.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8836;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y0l6LF+cPZkGBff4XH+f4wgTySGbQrJV5Lf/9eDivjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnx0pSzzh5ohT9snnEM746NI1k5H9yYLWWjKWzK
 wfvoGmlS2aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8dKUgAKCRDBN2bmhouD
 17oZEACBSdNA+d7lPkrrmUb9SzAHhRp0EPOtIIgcv9QMzrhDdrHB5fLAx1nkstnb+Bdxt2sPtr0
 7iDHL8ayCmpXurxTyiesZA58uL/xrvTUcOr0aIWnj+KmaDsmnhf4csl0eLKqb5nt+6dJCU4//Qn
 5pMfOunXUDv0XvX0Xr+Jy5LfzvOlixxL4Rrc3qPuoYl5JUSa/tvKEwpkHaSd4F+BMMfhwmzhnyZ
 VRAxqReeNTjjV8ITwRGGca32Uv0Cu+0nowOSzFS6f06CmXNazg4XlsaH/2afLuxJCjF+ioQSdvv
 mCNcgedUAhGQOu6SQw0zjb+mNLAu0iOq2F7iyOFyYIloqnMnCD3vO/8u/tWohi/5tUImG9qJwJj
 0ZP/RIu27rDLAO/CyrunpNlWPi3INxcylJ/X6ge96sScGT87vfZhIAAAiEGvsj34rIUpNMj/9by
 HFrKYgDuyje6epr9o0XkVgpwjqx5f43pD7c7NjvbWrSjenC36t1+rTt/GHxbdBdHDFMm6JPOqy8
 UZX/jPk321k9EzQXHPToxaxKDkNxoZHGXYG3WQXYK/aJXOgxeLRA3veffUUx22EHPRTVifXglWy
 RCrHWcBZHKgQCEPMhN6U2hLQq+lNh4cXNk4+unwvE0bANxX4KsK+RQ6GAos6ZQkJpF+V6S/XfTL
 Fn5t3dKkcSr2brQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_104546_812620_FEBA1E5E 
X-CRM114-Status: GOOD (  12.15  )
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

Add an include for <mod_devicetable.h> in the drivers which use
of_device_id table to bring its declaration directly, not through some
other headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos3250.c     | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 1 +
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 1 +
 drivers/clk/samsung/clk-exynos7885.c     | 1 +
 drivers/clk/samsung/clk-exynos850.c      | 1 +
 drivers/clk/samsung/clk-exynos8895.c     | 1 +
 drivers/clk/samsung/clk-exynos990.c      | 1 +
 drivers/clk/samsung/clk-exynosautov9.c   | 1 +
 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 drivers/clk/samsung/clk-fsd.c            | 1 +
 drivers/clk/samsung/clk-gs101.c          | 1 +
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e11ac67819ef26f04edfd4d1a26a5d9fde361aae..0f5ae3e8d000f9edddba4beb3c9a2e10d604c8a3 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..5f1a4f5e2e594f8e858dd92634de2019bbcf1ee3 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index aec4d18c1f9ef93b62b718c85d731a6afd3e6b92..62ae5d845853e6fed2498cecb1151c8cf99bcae4 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -7,10 +7,10 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-
 #include <dt-bindings/clock/exynos3250.h>
 
 #include "clk.h"
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 29c5644f059379f8a0770ce2214c32b9df7d76e3..a6595b8d918b972208ba0b61d4c0d7f13bccaa3d 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 47e9ac2275ee356481f242ce59772f66daa32f14..e90d3a0848cbc24b2709c10795f6affcda404567 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/exynos5250.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 333c52fda17f69797d2defc36ad6293225d25e8a..a9df4e6db82fa7831d4e5c7210b0163d7d301ec1 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/exynos5420.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/clk.h>
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 609d31a7aa5247e6318884609d1e651001616b73..61e7e7ce1f60aba005018054aa2155455dece6bb 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index fc42251731edb6f8368d38638179056f8bc58335..79613affe8ab99d78cc677e688dbb03a2dc7cbb0 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index e00e213b1201c82ac0c70cfe23d5ccc9c04f2aa3..dfbb00312b03eea362f90149bfe36129a0d29285 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 29ec0c4a863524fe3fc5c223d762da87e5f13013..66f9b735e3818cc993f1f61acaef4c38bf2a3285 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 76f22a4a4631fadf400420b977f3f59f40f840c7..2cb77a7c3e7830163e8337fd035b5fa426480be5 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566336ecdf55bdccacc3cea09a33201..1834751650df82a4a89a1a50de4c68d985a0cb60 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 2a8bfd5d9abc8acced4e5a3eaacefe5fa724cbd2..f9b4e9f09bcd0e77ecf99e72273776454b302f31 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 9a6006c298c2a80da0e29aeca3b09cc827caac0c..079d3f4eda3f7acec84cc866b0ea7623104fa257 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 86b39edba12276745a124df6a2ea9c22d74b915a..97a4ccc103f62199cfd7d0d8d4b38bd2e127bfc3 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index d19a3d9fd45239500c0f811aa27df86f832ea5c0..b1fd8fac3a4c0549f1143d02d11eeb95ee8967d3 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 #include <linux/init.h>

-- 
2.43.0


