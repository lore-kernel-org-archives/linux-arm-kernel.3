Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhZ85enSzH8aR2rg2+4xDl0htzylKPW7K0xk6ZPvNY8=; b=Tl1OgPjhCQAiY9Kd2f4iGdkzWn
	o3Cquoc5B10sCnAklDc9histzJ8CvGOHPF9axvwAt9Se+2VHFg4amyVDNnfhdhOQymX+zg/UiSXrE
	36SKqqYbL0w787Uffpnp8gKu9nkLn3mkY4a6LOWcTS2H9MqTp+UFwrCsPMvipgqv087wv0Mf3QhVG
	UZUlGR9RuAoMB6MdD0a5kv+8Wi9E7Yp7Znkn8H1WKl14XvIq8JZuh4Glk2aidU5iOYmrzqwiDobXn
	N27vd/9ZMqGiZOvZwLVAO8tHV2v4L8hRnhz8iMNEhtdgz8jY4dCXeQquqc3G3HF7xH8oB7yQ128w/
	dJ559rrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwfd-00000009PpV-30o4;
	Wed, 05 Mar 2025 21:52:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXA-00000009ORW-1553
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bdc57deb2so104055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211047; x=1741815847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhZ85enSzH8aR2rg2+4xDl0htzylKPW7K0xk6ZPvNY8=;
        b=tfCJhz+/gyez9Do3iT/Knp82pG4FkVNYZ92asK5hfS0P2Ki7l+/1AZ75ENJOd2Tbfi
         MYB99Gv9hbjqyMcNsaAyfoqwaIGeTpku3+KPA1Huxb4SYEa+dz9tOAw8/Jel4ltWVS+R
         TZHpQLXhcBhewgOyWVOGm8Zoc1vhEfO0aXMeSFkxjUsxa6vlSGILGIPeinl2PjxLMe+4
         nJY/Vo7r1XF0RxnwRYwW9oiN9KW9bMqGhke4rctO+f12gpUzHzN3FS8KsMCBQKli49DS
         hixdhjQiaZIY9EWpbQlt3tCL20DxRJiB8lDQyeiuCqdG8S9Qvduzwj+dyOyteiMtHi24
         lKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211047; x=1741815847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhZ85enSzH8aR2rg2+4xDl0htzylKPW7K0xk6ZPvNY8=;
        b=lVtp5qvu5IeFXcB1AwIHlemrhkOrcdxy/Qjz9x05Ai81AxOrgiL8tuQRDAp0qxrx1P
         8G4eqRkcIXYeMQEFL7OQF3Hnd7Cp4g1naO5oPc9f7m306CX25tqK948h5nqNop46wLjg
         fbpcFXQLosiUpIA4vJGKHzM8vCcKw2BdJyuktDfWNNYEgNhVxGQ8j6iC01PVKPRpZfGB
         /JOhOAL462ffG4MrZsljihJmdJFZ2M1Svsf+9HxSDltT7UFwUCwZ2NjcaGXaXQezlojK
         G+GimSeJm/V9/1VG/gBAgs4f9Agf6K4oemPz/7GBHfn+hV7XT7yzV/RtPAWD+2RUVa8g
         7P7w==
X-Forwarded-Encrypted: i=1; AJvYcCUV5BHs3OnYHv/vK8XhhoafXGeDOaW9o6i1dYpbyB0V08q+lA/4o402tAu+Dsn0NMbCL2ZNQSokHrJQ6EcXD731@lists.infradead.org
X-Gm-Message-State: AOJu0YzQonOi+jVpNEDUOyvwdeftXRuFJh0iPgqmiD638XJfPjysa0JB
	l9vmtE7UcZ9C/9sS6dSRGP6R5xxeUI5R3J5ug9iXHW8lnlg+w3jaFXMAWlIC4Wc=
X-Gm-Gg: ASbGncseW8wNDUkfbvFmfdOrxK6WjCbAApDeJkMLgExSuKQsOzOlmLue9SXyNjvRfcm
	PfY0FeQZCsqEnpbhyfMXA/OsOUQXV7kcJxaUzcmFjkDu05KJGU1LVcGa/F90kC4EPVoMdSWMvxI
	kmWCkOLUu+xcoKLr1BpOR6A5ardpNQhyZW33eWy7pXnbuoTiLqtD6VWFSUyolsRu+OA0rcPJKvD
	jE0cVBVf7dfpJ+SEXhcwHLK4p2TKRRJD1kkU5rd2yUO0q4hVQ7p/7UIbbOtSoxlBWM2PKPgiZdS
	griOJreALHnIjpa7MIuYnmhV1aC8DVfIbIT2TURXk29coZNApAadMNO8G3lS
X-Google-Smtp-Source: AGHT+IEU3ZT22UFxaoWjU59awt7+7+j30wAzpVUzR3m9HwAf44iR6k5R6f89TuK7z56Epr48VHs04g==
X-Received: by 2002:a05:600c:19c7:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-43bd29d2c0dmr16131735e9.5.1741211046721;
        Wed, 05 Mar 2025 13:44:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:36 +0100
Subject: [PATCH RFC/RFT 01/12] clk: samsung: exynos2200: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-1-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oB/IkA/mk9KK64k1ad5Y2mXXIVYOv562vIrDzNjE5zQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWXDLQrb7Ypdhqnxaj43wd4/VBbmvk+jRJA/
 ++Pc53UcvaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFlwAKCRDBN2bmhouD
 14aCD/4k8JYBbnUBAF7FXSWvGemd8WkT6Ut97YBTep96oJfYE3VXHAg+MrwsEe8vOeOGp4huRj6
 /4oiNRNPjGM5xerGSljVc/Jzd7yYOglKaqblHfFi79APLb7A8soHNlAorlBLswm3BAvfKgiybhD
 1F99hwzkv3m6l69at7qbR/IMv2po47d+CWknmsmOT7/EAlU0m3oY4vG99OqFwtfwvvEMYO2/Jld
 gb00Dg8JDRrSL8VitynwAqP4iWf7OE9/K/mz1S47O/dbMYm6yyXtkQ/PQiBq2ri+0p34VIGfulM
 YaK/bCLTXhirKzc9BE7CHm/FlxZDUUQBRlN82eTs7K7OwrXfsBuWiaHZ/5QtG8bUVWuPhL0C0fG
 SdwF86ojfUiQj4kbo6TpGfzcyoA9Tuv5i4TcBPDGtm4jojIzMdj97WT9Z7UwCS0FuRD1rmmyM16
 BwIPA3oMEMG5/HuRptqVdCvIH9b+LPqUfBqcQxpY4RapXVQZbYAdSRGQfswnTA68vudJ/FTeNt6
 whf1m7nfwBY25Rej3RSli7TV/29k4rnxwMkTxweqVtaXfVZt5cYXl77qbu8b3Ealo8/sovSUUHA
 WDpGxXVtuBXygCEy6jhUKeEW6fTQTJtcy9tzY4vFND8eShBHorsGbmcCM04LLp/nlUiL5YtcMgw
 F3bzjzeRvs07DVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134408_298406_607FCC64 
X-CRM114-Status: GOOD (  15.13  )
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

Testing needed.

My initial tests on Exynos5422 lead to weird, unrelated oopses, probably
because of multiple exynos5-subcmu devices. Not sure if applicable here,
but change of initcal might have actual impact.
---
 drivers/clk/samsung/clk-exynos2200.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos2200.c b/drivers/clk/samsung/clk-exynos2200.c
index 151bdb35a46c42d0b50f48d47974065a892bbb5f..f1251d4f01781fd503f24189cc53b23e627ab5e1 100644
--- a/drivers/clk/samsung/clk-exynos2200.c
+++ b/drivers/clk/samsung/clk-exynos2200.c
@@ -3912,17 +3912,16 @@ static const struct of_device_id exynos2200_cmu_of_match[] = {
 	}, { }
 };
 
-static struct platform_driver exynos2200_cmu_driver __refdata = {
+static struct platform_driver exynos2200_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynos2200-cmu",
 		.of_match_table = exynos2200_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos2200_cmu_probe,
 };
 
 static int __init exynos2200_cmu_init(void)
 {
-	return platform_driver_register(&exynos2200_cmu_driver);
+	return platform_driver_probe(&exynos2200_cmu_driver, exynos2200_cmu_probe);
 }
-core_initcall(exynos2200_cmu_init);
+subsys_initcall(exynos2200_cmu_init);

-- 
2.43.0


