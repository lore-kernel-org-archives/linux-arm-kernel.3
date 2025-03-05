Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F47C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2s2FRzqyd1/ZQ/o1NHnLvTWcDUtW15BuFTomhPZd8o=; b=Mr5Q6ku/OrfWTiO35XLR6xrxhY
	IPqfGMSaHjJrDyuKZ1r8+KdYyNtNv8qVqdJWoZdlmjOtgwd1lCayP/Z0D0oL/FG4lNxuz3sWZYllo
	0aQUIkYFZVOdlSR0PquQOWfymHhEvTJGaEU8Z4+fii4L+rrR3cGe8rEiNaocZCNIy9mmWE+tMA/2S
	5sgtvoPHZRD/qnp8++S7PLAFqHhXCKJB8JJF+NkRn/Y4VWTvOdXa7JmrNJQvLibpWGPaZX49wNIZQ
	QfcS/a0Ivn1KX6jGyTW8zZXRgB+VBcy9l7bcUn9s4UuJUSTCD9gPTgm8/QydTcPRXGHDcCLKkpP9B
	7Lh/FXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxmF-00000009Z7M-1Tsr;
	Wed, 05 Mar 2025 23:03:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXH-00000009OT5-3DeK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bd750d27dso947655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211054; x=1741815854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2s2FRzqyd1/ZQ/o1NHnLvTWcDUtW15BuFTomhPZd8o=;
        b=kib+Dp5j8cA+YHfoR6JQZgLRnP2VcnzrvcugyC3qLX5rDn9ZMz/hBb7/aXd0mHN7L2
         3eu4svXMRxwdXlUJSotrcNG9JsIcqgQR7Xh4Nd2pMcker7XI426LzEc7YdEFQGzg3frx
         rKugyd+QGzwc33tuARlgUqunV3862BEJgV8rYEK2F3TA4HC/pXUKVMI7n6d8HzBCadlb
         ZqqlJC8Ixffq9RZp274Q58C1tdACqG+ilE+Ugoc6tm24M2XHyxgFTmU4LPmIzW9bAmWm
         tR6pM4AjaNA4bLh01npv+0CGL1K5Csree2fVmfJyVCNuHo+787IvIUNTj+eY7EyFkvRW
         Jmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211054; x=1741815854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2s2FRzqyd1/ZQ/o1NHnLvTWcDUtW15BuFTomhPZd8o=;
        b=dLD2KTVwDLlELfIRepHRJKwSCFGsDh3aFaWv5cVA2B0tPshmPSvoTlc8/tppVdwFlu
         RSub1UaCNnCIwaEGYNbDbOBZce7ebTKbZVEpPqrZFRmQrHJ8NlZWJhS9ZAvSbkDLJINs
         03oG7DlQx1BRfVdVnXNjQ6dvq6xhMePYt+om3QyR9oQIzvl1fjYNAddoalM1iF20xowZ
         dV7uUyHyC8prxbio77ReLcaWnL4E4F9QUgqL7IRwA77sl4pTZdUtNUt4QaoqOWLNj1AQ
         F6xzHaBV98IE9JaRMpvcxZBNJ5lWxlg1TObo1IL27346a56WMmcM5wr7yxoaHhPgrVNj
         +/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXilvWsH2WxX3F3qxRCyikTkyF6UPcFZb3pCBZPGzDxGFFzGC7dWcGvSXvEoHiR3zT6voFrba00yIOnEUIehRx6@lists.infradead.org
X-Gm-Message-State: AOJu0YzKacdXPFopbmWrIKs1V5SQ+yDz23XK5Ppu0fg+RxInzTMDJTmf
	lWVmrk7r5N3xHwMZcEQaxzQMHi/kNUKbf3TfAuP3LR7azStho3G/QzJoD2Ap1nk=
X-Gm-Gg: ASbGncu+C8unLpmduK0O4MQlIYtDeMVYqxvuyAoqYSzn1qDiAxi+b8ROMrx6aMiq+w1
	vWxAVyxA3xSX67TzWL4kGu9m8eg2zlyKh+A3a72f+t9NIp9klW/14fLUV9wS/Dh+JAyyPPrs6fk
	EQcmShjfMwvhfYEnpBXcRN9FLaWArKTxoF1thd8NkGDwfEm9D2f7rLs1RMG8ENcGN1KKjwZRUp3
	opHkMrIzFDjBayyYuX4Vtp7XM+QBo5wDw6GmNJn7KwwNomERQmrfWUembR7SQfFEEUgiIoDDH8p
	hmfxiGaCCGNLT6O8BBUFRqKhzcu+ulI5NaOEePvSc18X8jSpphvP95hQWSmL
X-Google-Smtp-Source: AGHT+IGrfptGh2oqKNwjoju5jcZ833IP58nBTOtC0kImA1tMF8jS9CFcYX7dHyHVQvdhzbGQlFlgAQ==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr1483805f8f.8.1741211054280;
        Wed, 05 Mar 2025 13:44:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:39 +0100
Subject: [PATCH RFC/RFT 04/12] clk: samsung: exynos7870: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-4-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d9JTlndrDcTjpU46BcEr+6DtMEAruhkkVJ+Tehlx/b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWZXZ+MDoZuAIim26MjaX2wbo5pHyJx2aGP7
 +7n3QYxF1qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmQAKCRDBN2bmhouD
 1yluD/4zpqkFYSPfgklTIdAU4mducTvJkw4WZ9iKGe3BouxOxS4r9q6CPrsB+b6AuIA8AaamNUl
 K8KM9/wKHiXEWw8el32x1OvGj8RaKC8ka7nsN3cGI5jIA45N5p32ja9U+rsSVlSIoimUfZnwASS
 0GzxT8ezrVQSE4YBqHAEA6ZjZbQq2cFxfEgbGnZ1zq2Pd2wnb5SOgAwTnpAwShY1H19v8SJHATV
 GuGACEnZyVlDPT9oA/8R87oo0ri9hbxmK6n49xUCVVRuqyCBBosf9ZQUr7X21OxgOXR64ssjD0L
 gjg+DCgkJx1xMqGqU3Xi5OvoeCNp+VztXV/SUnQN1pukrBy4XNtFyuTfn9agLPN+RdiKHYBB0QT
 w1Z5teFwdFPP8HZul+jiOI0UHR/kZ5AnxdkbD4XML4YexmQiI0YjVk1NmDcZEgu6M5RyQgbmsT4
 veIx7tCTwfOrJWJ7eHO1Rd5b6mSna0v3u/XGNHXzaPyyD+v4T34w5vCvFCrEVq4rFyUEbpefqKg
 t/2xIenKXNew3xIhpSrailWBO4QFhwInECmBDoCsXH100k9CzbX6CdEf7LH6WwmNAwYMxhNwWou
 8d4mimDkv6jcxTd4LUx6QoZSjNKGZih2NfU5oeFxpw9GXCoIqWnsnb4ABL1umYPPt5EgdnczdN2
 HB5xAcPjXReV/DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134415_810352_D6F21267 
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
 drivers/clk/samsung/clk-exynos7870.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
index 2ec4a4e489be30bd1cd2e6deac006bb8ac5bdc57..c3d7d816cab673518c7b01ce35b0faf249692835 100644
--- a/drivers/clk/samsung/clk-exynos7870.c
+++ b/drivers/clk/samsung/clk-exynos7870.c
@@ -1814,17 +1814,16 @@ static const struct of_device_id exynos7870_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos7870_cmu_driver __refdata = {
+static struct platform_driver exynos7870_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynos7870-cmu",
 		.of_match_table = exynos7870_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos7870_cmu_probe,
 };
 
 static int __init exynos7870_cmu_init(void)
 {
-	return platform_driver_register(&exynos7870_cmu_driver);
+	return platform_driver_probe(&exynos7870_cmu_driver, exynos7870_cmu_probe);
 }
-core_initcall(exynos7870_cmu_init);
+subsys_initcall(exynos7870_cmu_init);

-- 
2.43.0


