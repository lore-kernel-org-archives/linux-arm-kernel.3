Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A69DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AbHtC7bGFAAArB+3IgMlUK2lz2UUrTpFHXyawqx9Yg=; b=FocbfAI97y7imTtpQou8tIQELB
	CxBpKJ5Rd2vuy8veralf2kadM9YFGgy7GKvcObyiiGI+L8o+nrWCiqe2BsnahLRmprXAsyws3Zbh2
	HbIV40v54qC4rBUaOrzWLHKI+ntPH8qnCNpHkXDlu6V/ACM2xYo6TtVsC8fk5Xy52eg/LqhmcaZPp
	ShprruOrC4OuhtiYZDR00pYmgp82N6BuBhuwS4zz4B7dzV8RttJ8mzEBVrrr59khLGbLnYYYEPwPd
	W/VV7j6PRj9vxNJcRscQq9NsO5xrkthSEPUlBDV4UJc2upVxGKum4mGsxSt1JO1EOmb4q7KCL+MM6
	U1qBNibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwnS-00000009QcQ-3wpo;
	Wed, 05 Mar 2025 22:00:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXM-00000009OUK-42oq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bbf159247so3995455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211059; x=1741815859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AbHtC7bGFAAArB+3IgMlUK2lz2UUrTpFHXyawqx9Yg=;
        b=WOcTk8Bb799tZiM3f57c3GGKskP3hOrOJpYbY34Aqz4d4tk06jBQ5q4LbcvRglsS5h
         tV9lIonSDK27h0ODV1nlHzzEvdUoeuXwCxx46hAUkgiUfUL8zM4ZqhKFgBkRDoZz8+ZJ
         1aw8yjLag+Pnr9kxMOZpuIm9s+KTx5PxEoVVfL04IgmusSsq9fwlw4yKSiStVMaCddFB
         33+vIAJunremm5EI7yYBW2yW2etbGqDMd93d+G5fgSvNBvMAkPCjIeUcYHv0ztyq3PDT
         VxpP0jKxg0ousI6bxQspr6d8eO/1277TS/oouVmUruG0UlLIlUdGyMhLfJUNTQUIDh4g
         1hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211059; x=1741815859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AbHtC7bGFAAArB+3IgMlUK2lz2UUrTpFHXyawqx9Yg=;
        b=WhuEKfgwgZ1b3Gk6+hwwoT3h0+qTmS8gSmEijesViRZ0gAnTeY1jGbDcOTR1+Q/Hpj
         RvwYLoOKjfwAFXzde+WRxivbgIzWX/zLuYgUMR/YAtgIr3wFYWUejjHO7vrkgG9obDiU
         cgXtA6zcs8Hbgf8H29TQ/mmh2ktKXhwqKOOOYVQl1y4UuUAi4B3XBkhvasEjlkno4+AS
         IR8SsnJgmL5TZYtPo4Q4sv7CMbVhioUFJd+xQ+r2sewkCKJgAzzR6aL5zsxLR00v24it
         hszBmAUqjh0i7jmBGnsEetDiQKfs5NSu0qxGKISMTI56X2GxRm4QJJQ2Vv6lLMjtnmKE
         Uzuw==
X-Forwarded-Encrypted: i=1; AJvYcCXdxpOb078xmbumnRbrNZyiYW8CKX3SHGaRTOvAa74gOJ0NLbb0J7mBK16Wwf8a5+1sCLTbRhvWZvr7K1Sug5Kv@lists.infradead.org
X-Gm-Message-State: AOJu0YzSVBQG8veV5c7nJyjhw5q58SBRrEQzcEqwA9N9XFURBP2Nk3nQ
	iNG88r15tAkt7nGwiL/NupoI7vD2bnCvASRDYSchz4WdUT4C4eWFAV7siHDxKX0=
X-Gm-Gg: ASbGncupeqchc3nPrBK6JI2zVVZ0h1P0BuT2H57izJthTBZaD/KfzFl7jZZtqs1WT2R
	62tqnJT6sdprEoNefDMY91D7XgbVudIe2wPunTJ9Mo0oB6Jb78BqKU5jYqLdfvUsQhN9ACdPpYZ
	dRSxNjt8W3ea7Aj0+rwWGvEvPbji1tcNlCG0DlGt+4nzcQtBhZycsmqo5QeM6ebBNnFsmkPdlEC
	tPyzmeKDRtgpgipKZB5vjE14H350XQcUvrMkbCkeNYFXmm2u61ScCdVKLi/dEjYY5WtZqH4SYza
	k6M2mTktO5nJk5/SH/vP0cUVPi9q1TMp0GTICCsTx4SFYWqdBYV/sT6qowbc
X-Google-Smtp-Source: AGHT+IESqlA+NmHyup0UZmZ7wt1v7EySUvsP5qdj9PWu4jeZ36TmYHRDyU7n3XRFf4qUwKatNhGpKQ==
X-Received: by 2002:a05:600c:4e8d:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-43bd28a6f48mr13740805e9.0.1741211059570;
        Wed, 05 Mar 2025 13:44:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:41 +0100
Subject: [PATCH RFC/RFT 06/12] clk: samsung: exynos850: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-6-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6SbNRrg9WxI7TrGJUYa4ZN7DHWIj2qawRcBQlYXU+sw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWbNxVeej/GBuhHTzdhrQ513MoQ1zvD/Htni
 ohisbn9jR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmwAKCRDBN2bmhouD
 11b0D/9ub4Z8KIBdWqGs6DDGExA47ysD9YtbCBSmkGQorDhG8JIRIUI9M9rWphbWb4voAO23hCJ
 Quqnc2chadb94Yt+Zk1jdPtcbK227ki0j45Ax4jZBWgjy7H8VQJLtdK9ay3ZmU2HGrnD5y9ZpBW
 ol3i4enAc53Y2lZc/XXWO5wwA2ebk7QzkvmFTcUUrYMQDRcTHgwjh7H/ViJ2sCOtFWDsT3dfDbr
 zJMvth+3RBax6C3QQ759OCjqNPRoDaZXdTn+6n01sV0+wCdihRi625LeHOPRJcxl/Xfo135SLm8
 Sa7mCB8JSCE6qySlcwz67BxfvhU+vkX6XSoWg9AeRi4T7/ZPRZR0KcR96azXO+er8P0ivgMQDec
 NVUY916jlcNjP76/VL9SNjgMuh6cxIw6Xtsh0ZqRyFoK2AuPpSzb4kX3YQbFEtFjnrRnjtAs+O8
 56kh/sAiLhuRIHdorDKAbZwX/awnWoxXcY8EUQ2obcjBPbI+JG1ARuajoH1XokNKZ/vV6MPkIYE
 FgtCuFoFQmZhexaGBBkWOHEF+D4Xs3G8jn5yL4Rfq42MY2e35LyjFogzZh5CLGWbL20Y6BvfSxE
 p4sy8IAI1t8knICnOZqB/RhfePrG8+XOW0+LPth3C0SXMk4BleNAx5cMKF8GC9u7fw4v434JymW
 FLcyaG6UvTXiLeg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134421_007123_45BEC7E0 
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
 drivers/clk/samsung/clk-exynos850.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index e00e213b1201c82ac0c70cfe23d5ccc9c04f2aa3..37c06cbbe78f87e18877d33425fcd03b97a61e7f 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -2322,17 +2322,16 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos850_cmu_driver __refdata = {
+static struct platform_driver exynos850_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos850-cmu",
 		.of_match_table = exynos850_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos850_cmu_probe,
 };
 
 static int __init exynos850_cmu_init(void)
 {
-	return platform_driver_register(&exynos850_cmu_driver);
+	return platform_driver_probe(&exynos850_cmu_driver, exynos850_cmu_probe);
 }
-core_initcall(exynos850_cmu_init);
+subsys_initcall(exynos850_cmu_init);

-- 
2.43.0


