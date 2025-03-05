Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8D6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmxpZ09jIu29qEi/AkYcaowgVYj+tE90JBsNORvuC0g=; b=T0Pf2cR/z+HQVvVpR7sYASdfZ3
	QhAGULsYsX0MiKyUIvqBZRcIAQQqJyxId5KQTPbis5mfWReNTianmHOWzPwbkeYSplOKdeJ2lt8kA
	cgi+m90TupdxFO7wP+bYe+QUzAYkdiOwbF+mr1SaJwCQNjEavkm48GWkPntdTE6Zi/rXHEOXa4fLT
	/LwH0nxcUaOfd/b7u2p9UoeCg0cmO/yqnGYnziQ4WV+yRsv1Z4iuaEnJnBr+gpC/yDQrOysmSD3BK
	jOMNyGp3cvuxm8rKDPMW16/noytJBkh+rCE4UW3qZ6M5rHBcrIH7HtUOwrtgk8WPZFc6pK+wEInhb
	yr0ZUC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwqb-00000009R5d-1YGc;
	Wed, 05 Mar 2025 22:04:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXR-00000009OW6-0IzC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so972195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211064; x=1741815864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmxpZ09jIu29qEi/AkYcaowgVYj+tE90JBsNORvuC0g=;
        b=IUHrKfuHCX4C5gCJdhYN/40+EW9JBN2AwCiFEZL7K/gycujL/ExzJSMd+iEm7nv3Im
         T2UMJSoU9/2Kyx0HQmm16AHxdbLU1PhVBdiWNa1zvTKSFjvqAYI51pIxkpLlipP/s+3s
         1Q6qX6Vr6nd/t9zxt0k5l6OQnTDYjOVnFYQEd4zXEMQ3UpiXm2AuC48dYau1AOiDCXv+
         wnNI18ubvrpYmvTC1V/twcX6Yf7YGnhSW2e/zINPrtFda1PGFsr9neGOOgz3898Tf6PD
         9KS0LSPEVpn7w3CR4bgP4BMV6hGIVbhcOGw1qGWsfVGOSg6+YzyJqWgeTe4mmA5AT28X
         yX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211064; x=1741815864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmxpZ09jIu29qEi/AkYcaowgVYj+tE90JBsNORvuC0g=;
        b=uKFIVZvwfD140HtYz4wfq/MaTEZwTh9Md/OGsYSeAgtNSSWvJpX0as7SWtYwHHeNoG
         MikRVLtQs08BVcCSbvilx+QtRAZ7bAboCjtpFT0RrJcXyH9htb2Ygs41HiEOIfoRXxWX
         zhSrfaGYBe4O+BxP2vj9sN+UHRhqEb3PlsPR3Xz1hiBWJQ4BWp7JSlc+35UPW1cKzE4v
         q9kiAtoZfBqvis9jDGImihrEdin/jDW09ld1Da9Cx2uHEgzFITxnkeGSEN5e2h2r1Rv8
         qG95phQFesFe1BEfZA8u2elj4JLHj2GBrdx5J15es8cGLG0xdztBpgT0lFskqCLXI1Zj
         8Rbg==
X-Forwarded-Encrypted: i=1; AJvYcCWdm8DpJDoIcha2iJO4ZXeEGCUkAmwZjz1+dhL1XRqhGmTCTca7HIpQlz6OT8HHOAwtd5cU++yuRMr1vdYNbWm8@lists.infradead.org
X-Gm-Message-State: AOJu0YxBqpHNZAEffRjWcRG9kFrbEbLs5HM+2RIuYpfMweIOE8hnw264
	1vB6yWL2xDTTF5/fQX9v7M8thKndRpBSoP/U1DGQFXQbvBH6d7XQRLn+sRi29Hg=
X-Gm-Gg: ASbGnct+cSQYUnbyIFRUDytybLuKUY//YwYt4KuQf9bOweUFErXTwMHeBLo55+Bih83
	nFdQq5dChXMlJJooiQr4WT/YAHSpPYxGaTxeMYf0LfjJLSVj803FUUGxzOs477Nsn5cVBAWLNOF
	9f2Se6d4G3g/VGyQLNlH5pI9N0CPRcNhebjD8A33y8ZLBnmtLvHnwmJ+JwHljuOGk5XGlJTv26Q
	raoSlj1WrfyBhDFKiqxnWLJy3P75vskGx3myf+ufITK/lDzHlxlWM8zWvs+6QfNa+evZ4IxFGZz
	hild6ucDGeQr1sOLRsGiG3EY3UWbx/i91wf4Yj+F+i4aOGoPPeNjiHw9qgy7
X-Google-Smtp-Source: AGHT+IG6/FOdq+0IiseN+Wq23HMXCjYsagVn2IkOh+9xfLrrk9mTK3zkrn7JtBymNDcg2qggUimm3Q==
X-Received: by 2002:a5d:6da2:0:b0:38f:2ef5:ede9 with SMTP id ffacd0b85a97d-3911f7cb856mr1759396f8f.12.1741211063703;
        Wed, 05 Mar 2025 13:44:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:43 +0100
Subject: [PATCH RFC/RFT 08/12] clk: samsung: exynos990: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2XarLZImY29BpX0xdhMgfGuJC2FYaijyu3RP8qT8JLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWdiuhfOVof9WcPcy9OOBKNwinPgtWGHEdi6
 4Wc8O3Uf6iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnQAKCRDBN2bmhouD
 16cSEACCJ5RRF+v7vfpE3v6kR1prNOGfM8tH0mQXI3ZE2Z+XWwgYIJ1SI2mIO32qJ8ls8qV8JZR
 MzgA8hp2jU4IOxj/3Qu7VE1iAuWyl3+xuad0AZ28farCExV4w953p2NFsa7UdwVf1o+QtuwPi85
 W1VMqNobFrLMD/8Kp2Patwu0MqkQP7XlTOaBLVkyTv0nR7LqQF1pS1UiUMuZ0MclpXEum1mefHm
 i/HyroEkuEos2/ydSLJU4GSWGI1xhupw5tef+azciLnQGt3n/fX8iZzVS6O6PcMQa2J80k544ix
 ec8zTfL+JID2PgAPcpKtUFE4jFSNhsAbZKQQGhQf77auM4gzyv1uaOSlwV5f+V5QtX/tOgIvFZh
 GG6Tw7klVjfHu3oh2zqzeKFzuVJM3SpfjZ371P0rLIWZfZKK2XF8Rho+EmeI6M6wnduQ3WdifPW
 zZa3QQ/XnobI7zVyvmXxMmDOuH+RGCZMdjAk7QtFUWnILCb6h9Bz+KaqZW68djPrQ2xm4xjsmPg
 ZnPJmYj4zaZEaXoLd8/UyD3Aamze/rFvI+c0AL3GscqvDw423yCPBg2I+/kxcxOHm/GUIU4dWKC
 2fneiRIbadDEqwmkL13qXecwX5wy9N2wSppxh+hRZGqtuxXprFIBSCuaqcQtMAtNOkA5N/usoXy
 czkSQ+McHPW/e9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134425_133077_7FFC8D34 
X-CRM114-Status: GOOD (  14.46  )
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
 drivers/clk/samsung/clk-exynos990.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 76f22a4a4631fadf400420b977f3f59f40f840c7..d00050d8765f25042698cbe6bfa06623931c7414 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1504,18 +1504,17 @@ static const struct of_device_id exynos990_cmu_of_match[] = {
 	{ },
 };
 
-static struct platform_driver exynos990_cmu_driver __refdata = {
+static struct platform_driver exynos990_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos990-cmu",
 		.of_match_table = exynos990_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos990_cmu_probe,
 };
 
 static int __init exynos990_cmu_init(void)
 {
-	return platform_driver_register(&exynos990_cmu_driver);
+	return platform_driver_probe(&exynos990_cmu_driver, exynos990_cmu_probe);
 }
 
-core_initcall(exynos990_cmu_init);
+subsys_initcall(exynos990_cmu_init);

-- 
2.43.0


