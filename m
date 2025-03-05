Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC459C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqaqIA6DIiM40dv1MbN8TWQBwcTqK6nYU+kVVFGzqC0=; b=cJKnTbSnvzBFVGUe36K0iOt9XK
	4EgEXsi44rBqpbwdoyXPIomjJKEmZESuxLRNKA63OiXyPR9tfVXIuiI0BbwodQgfyaoVT3bRyKZ7b
	PkNJ3p4rjwBjTQ0YYlxFX63gaLIHovpKhcmDTqi5UmNhsCQboanpog0mnus2UCSBpDvYLJpNqv632
	nMxUlSGUETDAyHl/ilS5AMSkZL7fX2ThvXHJRhWCiEt6Y7wDjQqdfs8YCIKRY98nsmT4dKiPfoiPb
	xgTr7g6p0DeXi7Uu8gdauUHqIobZw+wQu488h82pI5v2FpzFEEXnd/Q5BPpPd06j6A+uAy2fdahGn
	LMust+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxmF-00000009Z7V-3eMI;
	Wed, 05 Mar 2025 23:03:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXP-00000009OVN-3wl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso3952225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211062; x=1741815862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqaqIA6DIiM40dv1MbN8TWQBwcTqK6nYU+kVVFGzqC0=;
        b=OJ6Xxhbi+A9JKtqGTCGWEYAvVJVs2yjzNaWbjHQetI0cOPb3REMw9fVHLxspFnzEzQ
         UpNq3ShuK4OmBU6W/D0AFdBwQbpIkWxzXF0fk090YEdd47DB36p/eYatVZexb/x2srwt
         dJ02g1eHp89iro+VzGN0W4MO+MrGw5x4GaObH0bChxuCIoId1F6Wg5Zg9vOrg2nuiYmm
         fT+h8TLMeSXd1vVaUi+Zeaw35bZMTnwltffcgUMMfstwEPugenqsO1buLeatC+cUpKlq
         6Ob5+bM6VOje8oPKVkgugLZLgXze0dv/VVtZ+SnW2LROtNz0ZZmKHGNeUouSv+n4Z0GM
         ZRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211062; x=1741815862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqaqIA6DIiM40dv1MbN8TWQBwcTqK6nYU+kVVFGzqC0=;
        b=uO9Rlu3UnPOH4p/ZY+b/PkerJNkmoVGfiF03Zt0GxLUpIdXv98/Nx5WdR/TOErwurq
         4YZE1IZQ1/dazolBhOqjB5x6841NMA0IDd81Jg6qq6zSRJC5l8qIG0ySOUZxO/APlo3A
         palg0gLQpwLyI0xHqbeB/jicf5dsiuiMgy2aNjKn1KnfAzLjhQbtFTBvJyFkmOVCxR3F
         T6fUxWjPeXA23I3eUdt5AUaoqxL2Srdtiso7MQRS40hqgOfRkQpcdnVLKMCRuiA8t40D
         JEbG3Eimj9ECUZ9uPRbhZoG5gdY+BVwSjO0EVbLs0p9v1TmHNTQ5OmfeWxBQd+dk6evt
         XMnw==
X-Forwarded-Encrypted: i=1; AJvYcCWClYAPjy4DDV98K5hitOxSRNlA8GHKGribIYrjJb+izWeKt71zf+49lRC0XUUTPIq7vmZDQOMUinAAa5bSWE0K@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2z9PHGZvQDveQwOFJWkovod3qBo9rsZCqke+wY2Ub2gnULSDI
	EC5nkIDLgwQM51YmtU4So0QurhkVSrngFlulA3+fkI7Uwu/vzrWM7ZT4i5/78Tg=
X-Gm-Gg: ASbGncu2r9uRKfPqUVJBp4F/C8RCK39HCIYaSYFIryamk3tP6GUOcLcmdtVK9OkBnha
	B3zdhYmku5p3n0xrwNPFek9IQhW0Rx6zEZkw++RI6IoJPFkn0PJev4ZMDaFYlQJmaqEmWvZfzRI
	+Ayoj6MUDFNHW5A9OdMNVbhyo6lObFWCQCeoxxz9cW4DIPQt2oEP/9kIsW8Ga33s546uvqXaP3K
	PQwVW32J0CffCwkt28J1uRTz1AvXPN67m8w9CSnSNEogtcZhK+08M41/ZmlaHsTvnLc7qexS7ec
	fNGQ/n9AKLKv0bb+9F1T4n2q/ttQZIrbxEVX8UygGY3mVtrhpQnYyLvbzCtP
X-Google-Smtp-Source: AGHT+IEVp6P3XNQLXM9Hx/K3uZ+HnS9dPsCoQK9L1YtJ5wzYA+CRMMsBsg9ueYhyVV77oKnbD55vCA==
X-Received: by 2002:a05:6000:1562:b0:391:1319:9007 with SMTP id ffacd0b85a97d-3911f74bddemr1659044f8f.5.1741211062229;
        Wed, 05 Mar 2025 13:44:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:42 +0100
Subject: [PATCH RFC/RFT 07/12] clk: samsung: exynos8895: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-7-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ThT1SH0NwFD4VGWTWx3zrPyEMtbDm+ytz//9/ZQ8nUk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWcznuiVaZj5D5PkbxaSqlYTXI6VdUv5dQr3
 3jWHqptK+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnAAKCRDBN2bmhouD
 1wb1D/4sp79hXYVSfV8BQMsYsRJU3nTGmpey/905/X3p67OR94ygRIo10cvnrFQo3N9tB2mLH+w
 2xvHb4FPpONotoITcu6fvz7SEsLPxI4tLEncYuSARGtUV039v9lix15mkB7qOVvQQn2NIbOi9mH
 Yu4aD23/ZMSMtBiOfZ4YzAuyHMAA1CK6glkpx+ysjIHFaMpdzn1NupBhCm+9PMA6qLcZFwlfJfx
 XUf4zWqubHHwP5h/bqH629lX5IT/TwlXSvkSAgNMQ0vZn125aw2cJ22TURiHYYUYnozi4yphJZ4
 WDkSMEXbJlvglud4K1ozSdRYv+uEFUTeLAhjZ31DtsjiDSGzXjinLXAg/eIpyDFqFWKoeq9cPCu
 mXx4gsLucE8+lMlYjiJ/ZFwvsoQC/8lh3KiENQYhs8O7scIfvEKwq7jcwqP1OMdzxz6dnJbpnA/
 2yTGzdqYwWWQCPReBJE0jpiHnnE2w5z/OG5AXpbCpQ5aszUlE9w2jmxaBTwCzS2Hd19OOyWKrIq
 PW2sTrZviRz+XUAt+o2KC60Yihxaf1vBgG+sYFDq6dC4wBsP7eI1MQwkHiZR75SDKZsA7bcmwcd
 aGtseMM5BbhCajXkwq6UiCAGQbRB56Ln0fB65AQcQrs5upLx7KTncMVvN3kGBucEsQstZHO15IC
 7hMZyEQzN6OFiWg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134423_987766_8260D88D 
X-CRM114-Status: GOOD (  14.33  )
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
 drivers/clk/samsung/clk-exynos8895.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 29ec0c4a863524fe3fc5c223d762da87e5f13013..6b85d917871d20fd3a3f6768937eb5694760ffd2 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -2787,17 +2787,16 @@ static const struct of_device_id exynos8895_cmu_of_match[] = {
 	{ }
 };
 
-static struct platform_driver exynos8895_cmu_driver __refdata = {
+static struct platform_driver exynos8895_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynos8895-cmu",
 		.of_match_table = exynos8895_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos8895_cmu_probe,
 };
 
 static int __init exynos8895_cmu_init(void)
 {
-	return platform_driver_register(&exynos8895_cmu_driver);
+	return platform_driver_probe(&exynos8895_cmu_driver, exynos8895_cmu_probe);
 }
-core_initcall(exynos8895_cmu_init);
+subsys_initcall(exynos8895_cmu_init);

-- 
2.43.0


