Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVxGAM4/nCcKxs+sDtsismmOkEJcCWSQ0DSMt8DbCic=; b=K5qikT21c9N8fPRZRz2/zRW0ub
	FsN2c3u/300DGchLdM5a4x3SXyPOE2fetxfcrHcYJY4x1pq96L70s2M/PRwtp+7dUaJMmoZm7bGFp
	8vGBxVO83k/m2AWHkle59xDNhX55S8LhHhanx2jdniNLL8WkpF28CDq3q1/tsFhy4DMze4FJpjrF5
	g762aWfBZ0kf+HDja7XT9ucf66XVA6/6Il7BclSclsPmy5PvBayKgCwL4u/ra+K/o2v7bnrJj5nV9
	6I+2DQJcTuYTXO6uYwQQhm7BpyPrWcrAKcd1d3zra+CcPD4h+Xy4hP6hG3qNEE6UIhpGAB7mH/MUE
	aAklva+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwhC-00000009Pzx-1wQG;
	Wed, 05 Mar 2025 21:54:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXD-00000009ORv-18XP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bc2f816daso4746975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211049; x=1741815849; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVxGAM4/nCcKxs+sDtsismmOkEJcCWSQ0DSMt8DbCic=;
        b=zJDyWNmzj/woznl0l6rlpxgmVfKhY9M0YfHsZV6BqvpqSrrFvAsQpEl1MZPIpH+sl2
         OpZB61FNId6pRGagazU2ZTSaKEH+K5GTKSXtNHMHp/bagcSj3CpLqg8UFMlUlVlrFWjJ
         0aajK6TELTv77n0OXIGEB8pG4uKyYBtiIn4n+7oi6Lj74ENaXpNVyCOJMKvv34IFTuQv
         jtSlvjdRpM5++dGQzWml5uXQJsbOKHJ2yKqx/xZ3KN4DpREB7NacWCEY0E/5i130PCfg
         VMRnAWHtv5Q6gc/jx07KhU7if53pU30nLir3PlzkrPvg9SWV1gmNlkNZehfkE1v52GbB
         Xi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211049; x=1741815849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVxGAM4/nCcKxs+sDtsismmOkEJcCWSQ0DSMt8DbCic=;
        b=mCfc7mN+TTlTnktEfkHp9i8uwKVdNyvZO6RfLv40Mxf3PCLv1rtcvyj802E41oB+dw
         hfdXRtgHwW8id+2dLeg0nP0mlItm5sbWbK3+9BZOFqCJtC95PcQ2fxpQI2hZ6afqWG2W
         tV3Rn0u7U5p97XIre7K7ar/qpp4i+8m2cXJkm/QCnxGG48YObAvY5sFmejHWB+kQGXav
         /kfeo8GABjZaWGKGNXbpB2GwhZW3ov9ykvSNajXOab0xON0vWGoLCr5CAgPu1oKLhL4g
         J2pzBKH+lpUwbue7diZD5sT2EKwDj5ZJtqQu4OhMKykVTF3POigPt3Ur0sW1wE3nSlXg
         TVwA==
X-Forwarded-Encrypted: i=1; AJvYcCWzYK1QhvRWbuVBe3KWD6HEaxl3X7A6m2Jjtocy8onn99a7MSvtBumIbx6IJs/2VtOI2cDeAJQWClX1OX+aDtZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxLRCKhsjEugteVMwlce36zsV6Oha0FrE2rYgyRUQZhZaSzCsQy
	cpnP0BKX7guoide6DAc+QL7RSCKThpLYq8hpD0KGtFIH1CcZUqgDlKYQjUDFQWo=
X-Gm-Gg: ASbGncsOqkSDUSIJoERLgr+JkFRS88agaE9BuBgznkjYd2Eyn9j393ZWTTEm335jOdY
	Ambf2wke2hxT59KEPG5dU+A+mrbWHx77YhlbqNYItotq4EdiVkVKSMV+cYJQqFIztaa3sE+TjBL
	Vu6rmgxi7COnRcg29Jmt8p/5NSlXBa+hLLjBSemiBWzqhdDkjRXnb3FUP6G+p3CTEBVvO00PaHi
	RDY+LwLmRN241ssk+bcP1khlV3rSrD5L1fE+Jps7JKZaRb2lO5+GW2620HR0kUx0BqnxgDmQ/ys
	MxxUQyPjZSw5mtLmsok28UJ34jBZ8YcqWzk7+iRPrPjLYyZj2+2yrvypSdUR
X-Google-Smtp-Source: AGHT+IGTJpI20ihfkqPuNjdEmzB+MiUW31b6PxusuYq5eKUNbKdBy8bsMW4AkAQoRAhs0uUmLcziug==
X-Received: by 2002:a05:6000:4011:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3911f7ae687mr1551301f8f.10.1741211049635;
        Wed, 05 Mar 2025 13:44:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:37 +0100
Subject: [PATCH RFC/RFT 02/12] clk: samsung: exynos4412-isp: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-2-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t+zGz1MJJVI0DC4qjJcqN4r/0vYG3vwFfP7yta9kkmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWY9A8xapFqDHqyFPngwImNfotWJ57AYEudX
 R+YhiTFllSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmAAKCRDBN2bmhouD
 18frD/4wNJJk95A4UmdSvfcwkDL/IZxRyGMwQlmE2dQ0eNLXUj3pmzb5ahYb5qSm3qswa+ye6JX
 x58thWUBbzzrQticpGDE3e1JycQL0PqtsQQk6uuc7KT1rDINwiK3Wjzb6wCZiFgnNEQAhpbobCL
 IiQ8qdle+SDL5V9icLdStqDDLNl9uaJCaS7OXQWzAEtX0N/0ymCQcJKSwWdHGMtohiN77P/oeUu
 bAbqRNgZKw0UkAy0LvNI1u/Q8kpvXhDtSdOByTvLQbMuNVH1qWVbYjEOa4ZoftZDKBjXOoZFsYv
 jq5T+2x5ZxkGrUaxsf3QwgqAVwyRGCUFHebZKZ679wt9riyIl2N121NWkYhvmwMnVNCLJpkfj6b
 m6IowacIIQrN+UXNEi2Ubh93DetlFeLDXXkcr5j0vLDgBtq/1GmleHwm4+n0vFcEWh4K6gLqBCk
 5CL+s3pc7HTwh6Kkx3prKwpN+awIVybjKKLb6L6PqiMUC8fKKeZw5UJqNuG2uRMdQrcpGncL9IN
 Q5L51z0+x9/g4r4Adj2cxZX3ePMtRpqb8MGtOU1I2/thJIe0vofagNe4NjNcfJm/STiP35FWm8x
 LfBANRztSiEN/z7lLowXbGto+SZSJ8XteiwMQHiKTZXecM9Lm9n3QSdePqgWYz6n+WxKH9/O+4b
 Tc5UFPKULXewf2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134411_314070_D778ED8F 
X-CRM114-Status: GOOD (  14.35  )
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
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 29c5644f059379f8a0770ce2214c32b9df7d76e3..f288c152d3f769fbb5123c3b79fe4ddc8c23aa55 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -155,18 +155,17 @@ static const struct dev_pm_ops exynos4x12_isp_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos4x12_isp_clk_driver __refdata = {
+static struct platform_driver exynos4x12_isp_clk_driver __initdata = {
 	.driver	= {
 		.name = "exynos4x12-isp-clk",
 		.of_match_table = exynos4x12_isp_clk_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &exynos4x12_isp_pm_ops,
 	},
-	.probe = exynos4x12_isp_clk_probe,
 };
 
 static int __init exynos4x12_isp_clk_init(void)
 {
-	return platform_driver_register(&exynos4x12_isp_clk_driver);
+	return platform_driver_probe(&exynos4x12_isp_clk_driver, exynos4x12_isp_clk_probe);
 }
-core_initcall(exynos4x12_isp_clk_init);
+subsys_initcall(exynos4x12_isp_clk_init);

-- 
2.43.0


