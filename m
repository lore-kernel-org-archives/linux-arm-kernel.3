Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612FDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dWFaS/G97jqWOxgFqeYAXV1zne3+Xl42M5FVRGuZE0=; b=mXwm1xNqY9zcWMyL378lHFzb2c
	Feh8julIlcJcF15c9ZXAHbPXzdGJVktK84vlbrdHMSjmTG5dh+cLRNY3WGNLY4oYnbxFkGCqSG8jH
	py12t3ZxTs+lvgCOeMfHpQPTTcxCSzBcAjwmEp98apnckYQR1+gLclj0i6CHRfEg+m9t6DjHzAWqS
	2sRcU8fZfwl0kAfT+SC/YWzjZnpxN1vtGj6hvLjSTMk/p1kRZQvr8Q362hUElbJyAvOhyhdKB/qux
	lKEa+ofXS/nWiRNywyS5X4rd5NOj9g0EDtacgzQxnASDDdmKXYUJqrcCqOTtdd2Cr88lMGw4vHlgu
	ftPJ/sjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwtl-00000009RUC-03Sj;
	Wed, 05 Mar 2025 22:07:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXU-00000009OXF-1WZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390e9e44807so484716f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211067; x=1741815867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dWFaS/G97jqWOxgFqeYAXV1zne3+Xl42M5FVRGuZE0=;
        b=zNECNTJX7gj3ng5rikqfS9zfcPokO58EdOzId9BlmZxp6CZFXcW/Z6BQi/CYNfp2Hr
         QxHppim6h8dmTMFTm3xrZHi170JBsEQ3dJSFcuVV0wUVO8wga7UKYh2O00bwUIiolUKs
         lHQmNhx3fELPgAi/P2QGVqdVcXxgjbYGRMKP0LWBnuF58tM17GDjINyY+II2fwFlKvNr
         cKeXJHZA4tgtmWT4NgnQN/zaRQD6589T9JuBRMflIo5SJIuZE/kvPHmAqfNOmPqjLMbQ
         hWpDY6NYV/SUTgkaCAnXvXkplecHCG4XfcTf4yeNCbesvJiqciCHvT0EM1/XgTDesd2o
         DduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211067; x=1741815867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dWFaS/G97jqWOxgFqeYAXV1zne3+Xl42M5FVRGuZE0=;
        b=BRP8/SqdE4JGiVm90hN+fSvx9LaUWc+tN0tFbI6eOIHwikevDj2Ddp5cECcD7YAjdj
         h+6Zx2dhOul7vlq5OJMjhsy3o4foHeRCOkDOwF+jE9cc/DC/OuuJ6c9ErcWbauy10i8p
         u9ulTP7rA3rENmoT8uyInJA2URJnq70zVyWDu5xJsq04LdKgkzVcR7isSWE8Y+h0g3/+
         7GkI66NVvNZaZWFo814LfA3hZZLReS5vcCGTqT0TarFy00/eBRbRqcZeCMVjuIe8/BWj
         oMM/McBHA3VQcf14NRVqg4pfUDTJSWw1wCcPOr4nDIA6QobsPwUqVvFahqbketOpUuEp
         MwZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqdYLG3C/A6TbWKhIjj0qJHJEYUeN0ZQ+kayCz1UWfT9nuXnIaYBY/udc3+BQiz6VqX1ZdLdT8qJVCVIySaBVE@lists.infradead.org
X-Gm-Message-State: AOJu0YwXGhG60woFCHAu6oNKhOAgQvZ+SzcGLVMF5/MV2HZ71i//GFH5
	3WD/K6fZxLaqnCKIBhfOlQ8lEMDXUcQZ9A6GeiT5nVIMWLK3Vv0KOBDsk1BeFq4=
X-Gm-Gg: ASbGncuRhTfIoF5KcY1vT/S6AV+WLwqtq6Fsx1tz6zoIgEhxnxP/WGqWE12edvthRNw
	I76RN5DkInwR5Xf9xJ4JasfpLBxmjO7sQmSarZEQ3rM5ZISDi51vBmAkrvgTnlfOtmlNHup48mb
	rHuV6Gc35U1lUzF+Ryph92ymPgSmpKAoPAAbsm2RO6idpBdJFYsLOz9p6QyOg/4E16c9SCx+S9J
	Rlxca7cIV3rmlQTV76kCGDalmZP4+QwvjDZaWkYIDZvW2oseaL0774/lN9i1o+4dkuI4USVZWvC
	p9G7EPbCw+JM50MKErtZzQSm/jZVBzaKVWQDbpyJu/3FZV+BhoR9oyplbXsH
X-Google-Smtp-Source: AGHT+IH1A/fJBTLHqlPv58KQ/cRH/6Zi6XKboH22bh6sg1obd9fls+egjcU6yo5+Sk7gg6ScTJLpeA==
X-Received: by 2002:a05:6000:2a8:b0:38f:2685:8457 with SMTP id ffacd0b85a97d-3911f590623mr1362159f8f.0.1741211066682;
        Wed, 05 Mar 2025 13:44:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:45 +0100
Subject: [PATCH RFC/RFT 10/12] clk: samsung: exynosautov920: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-10-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+mdLo+RkoqRzAL/WYhvT4QEnTkohQ3q1+qBv/V7NnpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWfD4lNE/n7846a4TZs5bMvO6ZP27EkqCuzU
 G97+bdTSAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnwAKCRDBN2bmhouD
 12U6EACKb7XaVg5lIb8YLj4xomObRFocfsUu5p6GcY0JzCGxUHBy+VYR3ckEhH1TzoELWHBpXMs
 72ZsEG+KN1VLnqTrf+gzGLKULXDBAFZAwRS+WYdrmVQjIhzIvLjPidyGpIcSbuMQKjBIoKVSzGu
 /ruK0yYNw9RX1rdShrDg25VfSn0zDm3zbhAEOIAUnf1Yt9OH9N49fOyH9s5HlEIU0W5D+4C4p/v
 ejClar7kt4g6Vjo5sp1DiviOKQ/yelmcM4qaJW7MosgUOVyc2UF0rn7eEKtLphUBOXZYbZLjO4A
 lQ346iWlNvp6pfxlYG5GXyKIOn4lnsDNPSgkeqKxaWJ8HRMwboir/4lUfIO/93c2VJXU43lz8HB
 5lR8cAaS1x7NeCzLJiuFg4vd8SsifJQN/a7ilPPKfaIvyOQyvqrbfzc7arV7DVI501e1hXCm2YH
 NtNB79aOcFO5pAol/WpmnIjSjuoIsdNZ7oPo4zve1XyBNnJ8EUFyld6IbL7ikHZ1m5sOVjkY+Eb
 PZc08yr/d8pPc+4IncTUhrHFDMQrJEf1ng0lLMJTEn+2yXkJFfqw1cR2Z8JwNlkZYosBtBOKeCe
 LKgFOTBSsfsEWOvXigGnNTluUPIV7fL0NELASH0Hepm2qo/Ux5LNcugSLFsryc0lFWmpMcXsUja
 Q5dzCh1wR5XpioA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134428_409097_71D6EE2A 
X-CRM114-Status: GOOD (  14.43  )
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
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 2a8bfd5d9abc8acced4e5a3eaacefe5fa724cbd2..e0ba75fd20177022dc7f461af5968c154b6a8a37 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1447,17 +1447,16 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	{ }
 };
 
-static struct platform_driver exynosautov920_cmu_driver __refdata = {
+static struct platform_driver exynosautov920_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynosautov920-cmu",
 		.of_match_table = exynosautov920_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynosautov920_cmu_probe,
 };
 
 static int __init exynosautov920_cmu_init(void)
 {
-	return platform_driver_register(&exynosautov920_cmu_driver);
+	return platform_driver_probe(&exynosautov920_cmu_driver, exynosautov920_cmu_probe);
 }
-core_initcall(exynosautov920_cmu_init);
+subsys_initcall(exynosautov920_cmu_init);

-- 
2.43.0


