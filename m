Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554AFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=; b=0+IMQidKeo81fSE+AintGd1DtM
	Cqdp4lTHEGK4P2ge0tTAaRVtXA368oeYRHRzzKkbx0mD/r40nGUBQOJaGz+QAqw4cErv5UuBFwhdU
	hZ1r025u/+/rHaISZEiaUIcIJIQ8+8/SDluFZRRcqjjPbNfnZjea8DWViVNV8zqTz5J/Zr/xSduJf
	KeOYVtiMeupiy8z+T6EGjSbJOyz/3cV+VxKHrv2quTjaQCID/JxwrAj9+CU/PXJ8VR/yylO+7C1b0
	IaX3w2zyJP29UmC886YzGPvBdVUfaCkXWxmRy80z0/RQkegaHtYxphntq6EzRNoRgWsrRpJdkp/5x
	3Rqs7j8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwsB-00000009RLy-0TcB;
	Wed, 05 Mar 2025 22:05:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXS-00000009OWq-3lce
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so3521805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211065; x=1741815865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=BQa1dYbIiTRBNSuNZJciAD6QW39HrPlWmxcJm3MofU2VacHS6TM8BIHHVooCw7Jm/t
         Jas1e68wKLIFIVmU5O26+q6pqn7K3xYL4RqOQkzXBHQL9yJHGvptTFqKtdmVt0Zf6PW0
         cAYKq53iLIlA2/XYJotW/OP+OheLEQm5hOzkA3oD1pL2i6+1A8TT0KXGq02pBx1GCUzp
         d0zByjv7oYWD4LJGGSAx+E2NtKHl8Z/cFhm5CYg+Y0WtmZ6EdhRGvXwLeNomUxU+Iizk
         vldVkm5/GlziiSKJvE9kFOcUmyJIlkEmS/k6meWvYmtdmWyQz6NNPuJPhrye5FfwMaQr
         QKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211065; x=1741815865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZSjThyZHhdWGlYf2wRahOUbPzc+0Bbe9Htg664cFk4=;
        b=PTmDznJmq0xkMJTmJQVlRJZVbkYsRVbZp297Xrg7ucsTLAEjgOL+53qH+Y/Mf54r70
         dfbewp6bOTAlGCQ8MAMDeIZngPMSZ+sktydQQ5KRd4V0nO0bPad5aWTayz4tEIOMHG2F
         OaMMe8w9wCMPwtpSX498yIXuQ5NQjIfW8lKn0qeGdQx4FKz2HfnktbkOLQBIEMy/CJxD
         pETtE43Qoem89qTDvJ+3/f94JCckYQyrKLASIiTryXyNwpqwHlOTUVpW+UtKaI5jpX3S
         vsYbV9ja9k2jqr582E34m8y5PjQTnD+rsIHMdZtTbHmRoXRZmLDaVQEPl4RXAkUDSBNK
         TzUw==
X-Forwarded-Encrypted: i=1; AJvYcCULIropWP3sBkk7+H6p4xp4sUgS0GP7s2uCntLE5veETnz8+4gSseJSK2pAgiv0RyWH5RCcUB3q3QrWM1PYlxgU@lists.infradead.org
X-Gm-Message-State: AOJu0YxvtQmQTfPSGjc0+7gI5PkoJG9bvITLE28/eIRrTJ2WqIa/XcKG
	6aPJ9qjXJTXf2lKeSk2Sg2JaZeCsStzrhkuQpFooyxBM/FurWQffayJVmEDr0kQ=
X-Gm-Gg: ASbGncuR4nMmcB8AA0jT4wz0zK2FfwAmyZN9knFGL2y94mQQ0DTfnyxY1/pmWuDk71c
	y849JsbPTh2IRB7F3XfKW+GzDR77aMLejICOXQmKRYPpAqU2FoTjUSiWtX+XbUncs+AvnXJG8m0
	eoq6Gy4B3HAet2IOmLocIFqhM1y32ogX6QPQK++4At3DS7AcJWXWhBCgFTEfNNV2zRfO+h8Ewms
	12XBCNTrt9aeJFgHfVd6fyFRc/p4uMmKSab0wFavH3ac3C9lD+0jiyuXQmNThHvc1E3MQKEam1u
	XWqUsEWi2Jsz9dVyPDLJUDqZ7dLqDOj09oVkAOZcUdUUMS4wJeKPA2MklsS7
X-Google-Smtp-Source: AGHT+IG9oDEbjWb5CHLFd4pvqc3zsjvr7YXKlBgukhSG7DD0dtCAa5qeb4IWgIRHQyUrKQp/E80hsA==
X-Received: by 2002:a5d:64cf:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3911f7ae2e4mr1607807f8f.9.1741211065124;
        Wed, 05 Mar 2025 13:44:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:44 +0100
Subject: [PATCH RFC/RFT 09/12] clk: samsung: exynosautov9: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-9-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4eo93tsZ0/GxwIl5Nhb2FbHPag/3Lb/a4eLeV0239cU=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGfIxZ6hH8H4OVVzPjscb/kQnFA0nYBLz6OlbJrPwAPZTR0mW
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnyMWeAAoJEME3ZuaGi4PX1qEP/i8J
 906a4b7eLT78KedQQmJMTOfPgdXyHd49Q9w9IfrsXvcdJBs76T4161HaWoJG7HPC21WLVr+E+QN
 2jXbKQVbwE+y6AEoKemy+7NoxBfajrVUuMunNpMbQhFoLG2e3Gy+gTCWu72MN/5h0PqUekel47W
 vTvWxCIu5IUbrXN1c0eqU9yjPbo5p2zCQNmjMJELs+Dh3Ybjs8kueVKlr9kGmB3TEkE4/AsCp0O
 Evka9WhRh3B7SBGd5kD7yZMwNl0nqrmzilg3s/DoX7+hdvVkJwP+IthzN3Diktbrk4TsKVjBwU7
 kVxWVoT88D5ZO0CyGmykfA0KHdlIREpJS+UiPH67ZP9m5oIAGlfyTF3pkkPCo34nz+Wu+dXzA5Z
 YDNbSmtaKW+zIHRASAa0GyzhhFXx1LcN6YsDucmvwKnA8sfAwVT2jZ5uJXBn1NnqIMVhXk1xvvV
 7ssMaWC6HLnzVqkOHBCJx+ElQrxyfRjcmHW+W2JPsClUGcRsroTAlZq8rw9KEUU03SgOW0HMaLt
 FwukRkiDshRpksvnA4467ZAFGm368u8/8X1b0CRh6/yWzXY0JquFTiMW6+7eHgAcPhTlYTgyhfJ
 fbl3N7yGvIiZlZNkDeeeo4+6sA6BCEWguPh1Z//xwm4A1zmJ+KSTqo/EjKuxWxxUr7vr0k131hq
 qor1/
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134426_941878_FB562F7E 
X-CRM114-Status: GOOD (  14.78  )
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
 drivers/clk/samsung/clk-exynosautov9.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566336ecdf55bdccacc3cea09a33201..627f3d2666740fc4cba205e6e2da65f53b8df186 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -2190,17 +2190,16 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynosautov9_cmu_driver __refdata = {
+static struct platform_driver exynosautov9_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynosautov9-cmu",
 		.of_match_table = exynosautov9_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynosautov9_cmu_probe,
 };
 
 static int __init exynosautov9_cmu_init(void)
 {
-	return platform_driver_register(&exynosautov9_cmu_driver);
+	return platform_driver_probe(&exynosautov9_cmu_driver, exynosautov9_cmu_probe);
 }
 core_initcall(exynosautov9_cmu_init);

-- 
2.43.0


