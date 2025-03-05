Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9CDC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXkIs54qm6LUI4kgzEJJnI1sUBwA7+zCVW8PggSja/s=; b=vI7AUWfJ66KTHcHdsg9EBod0XP
	wF0lkbHZVbmRbg9NkSsrOSdIvkgL79Rd8ZRl/v3I9rAFQtwUw3leMRcXEstaFtGTxNSSsFK8WGyGN
	6uLZpP8OUte5evTS+YO5Tk8ZX/gY2fesFJSQq0VeRGQMwZmMZxlJfaWk0wH+T+Rlfk73LW0rJjtYa
	Ws3DRCRA7dqUBHqWnn6UXRYBOyFo5R/zfD+uZveYAGNHpyF9t70cebFNp27pFZhGsArmZT0x823Pv
	Sas8l6NFWp34BAOqEKPs4oTR93tadkDHXrcG3sEJ83E3/B2Fc6ZiGsGRhdmeGc++4Dpa81qOL3PmG
	vwtaw5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwwt-00000009RpZ-1Ka1;
	Wed, 05 Mar 2025 22:10:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXX-00000009OY3-25gr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390e0f7b272so576704f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211070; x=1741815870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXkIs54qm6LUI4kgzEJJnI1sUBwA7+zCVW8PggSja/s=;
        b=HFdyqlDSzfLKh6BLsxN69c7Ifyhvh6m0bdC+5q7hg14QR/tMeudfkwZnqQyDtiMUiT
         oYpdFO+C2ZBVkUR6oHs8WNqzHUmyPZnGYvMtm5dpeOGq2Nswg/4ERAhbXfsoqUSpLG5+
         MlZujV5xCaXeWIkaoU3LzfXVR3ZROV3r647McpeUIRdGWwdi+We+snNPl/ROIg/HHnhV
         hMHfiZ65NGyCoqCzqQSfdukZW6DwDixm46NRB3jcM+Tw0Wmcs59/MgJ2vBXOcxRgwSt3
         wv5gfFnUaZ/KI4nzyvedzJ+0N5zGKtaPZ08j/ib0GI09xVf/7yc0YcuEWgi6Fc6pFrS4
         1rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211070; x=1741815870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXkIs54qm6LUI4kgzEJJnI1sUBwA7+zCVW8PggSja/s=;
        b=F7kk9Yps/aZPktHHbueNLGWnodMOnW4TmHZ83gJ6Z+a8qymF82qfDlshUynBTaUuYe
         1/fnVisunGfKZX3/mHNS9f8uptxeIqwVp6GLRZMfLMGfUYGwHCPtz+Jpqn2AnQ3f50u7
         22iz4rHl224FjDXfsX7xB4sfC7UgmVD0+OdaGs219HKfq/QnY6Y5uil9mCXXsbnOOfdA
         cXhNfWFHsqk8RE9mbu1nMhQjF2XgQaCEPaa5g2Y9pp3VhZhmx3/CMZMFa4C6JHny1YHg
         fZ33qnf8J9aw49nHlYsra7qjQAbl3SCncEXJMW5VwRvEM446HvzGgHA2+vm4jlLb/CxB
         IDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR1Y6GITC2WBszm2iND5ZUeV03pdI4y2UotQBXmE06jMZRhYMB+DyOC/QnB6C0bv5ovGjDFuPyBt3vNz0loAYs@lists.infradead.org
X-Gm-Message-State: AOJu0YxM9lB+Q/+kPJJ1cdb5DhjLVKx+vKsF6mKQZRNBeVmyWj/KJp4y
	umjbXWOQ+b5T6hsAJk3WBWUtIQKHXcOG1hE7Yd1yWv0V/2FJzm1X2I3mdmXsUh0=
X-Gm-Gg: ASbGnctAdh8g8NVO8h8FTwJDOV4WBZjtn/OWWc8MLRX7B68GFLvvnE3o5lEwimCrNR+
	oQSivEioSkV4K8bw3mhb5VstD/bnD/iZ/nygE4d/t4aQ/XuhR+T42ClhijndRQNp7fY+zLn+KKM
	Tds9NY1+DbNEhop09XPBUt9OCp+x6eemMepB+8fKfoqlgRyqaYqhx1g63TWONZFpKtEcjHiLkyv
	GhuIYt0ffXjYX1AKMnH+pvD1s2zHI7s8aBsjkzuzSl+S995xqKX6V8RTzNqXqrYC0nF9Y/aSnno
	Y4Cp/+SD4P0yJTnyYQZZRdzY1qpbjHQks3Di8VPGQNuSMllUIczVG36YZPIr
X-Google-Smtp-Source: AGHT+IF3GZh+J/kzZkiIGp1RO9U18YWRAnLBj1hWD/sq99vtzP9wNUti0rkSiBo9jR1+7MHDit7nDw==
X-Received: by 2002:a05:6000:156e:b0:38d:d743:7d36 with SMTP id ffacd0b85a97d-3911f7bce04mr1468019f8f.10.1741211069847;
        Wed, 05 Mar 2025 13:44:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:47 +0100
Subject: [PATCH RFC/RFT 12/12] clk: samsung: gs101: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-12-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1440;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vp6W7iHQ9HDX8dPuiHrwQP51NV/6Z9WgxoY+8xbF4+o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWgtf+xtNx1az5n1ge5uKzzuPqzgx3d+Io+p
 36d5Qd9+TeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFoAAKCRDBN2bmhouD
 13p0D/9g9PM/WxzSeqBZhZcyDz4cecwCph7JPpVFAx5ZMUxuNrH1+k4jvJr03AlrC7k2bLFjBmZ
 n1CU/XAGCmNkAluP+1Ascyn3qmtbG74Segm+byK1IS8xNgyA3x/Lofb73zklDZgDuCc9koJEEVx
 aUZnWYBejQP45fHdFopm/O9rB250CPHTBf6pLhAACMOXTreScW0KdYM4lBWu/a4Lr+DzPJoHpC2
 rFsA6+/NkhuBnEbWS8ZLriPlacULNqJxzzG39dNrfYfZUGQM7Hhpli+8a7y5mbCi3VEbVk4hfBc
 TdITfRgV+Bb9FpD9P2VAowHqr1Ha7kKlrKOHA6SQV059Fc55rtWcC1juY+JSP1RnBz9dCGf5kyI
 seMUWWBzfDapDwaKYtYbSOu3eytOSzue9EeacncNiNWCSSeWhYRJqaCBhD5Z8pvOaT8y3JI/3MC
 3yTSUea0MDX/alU7xRiXSoIe2zpnhRZdCGhDFyQ0eVt197H8cz6UZh6VydNECw8cBp+RoSOgHht
 1by7Oo0MiSbjdLDfCTUpIGipFnva61aaHrWQYDfAjOOVqXE2a7SX96lxZKIMTKIOJMd5Pmb9A2+
 ycZZ+Srl1jQ1NIGn/HfSQHp4+Lor9ToJX/nKjq2TB1m07Xj9sZUdt1yaX6j5em9GxDaYlYj3I2F
 VNc0i4YZHaH1r6Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134431_541144_502531F3 
X-CRM114-Status: GOOD (  14.44  )
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

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 86b39edba12276745a124df6a2ea9c22d74b915a..69c121d478f3fec98dcd84e0639e204fe604e91c 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -4412,17 +4412,16 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver gs101_cmu_driver __refdata = {
+static struct platform_driver gs101_cmu_driver __initdata = {
 	.driver	= {
 		.name = "gs101-cmu",
 		.of_match_table = gs101_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = gs101_cmu_probe,
 };
 
 static int __init gs101_cmu_init(void)
 {
-	return platform_driver_register(&gs101_cmu_driver);
+	return platform_driver_probe(&gs101_cmu_driver, gs101_cmu_probe);
 }
-core_initcall(gs101_cmu_init);
+subsys_initcall(gs101_cmu_init);

-- 
2.43.0


