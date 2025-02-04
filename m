Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A649C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1ZYlfQ5I0ElNygZ6hE0CR1HQzjz8E0f5rQWW+uT53Q=; b=flrLJiTVATz5mZS147ziQ6Ojep
	RcIIE67QAXqb2zFg6QXKGB8rMFz3JfcAS8MT6ivBjvK7GfrjUbgw3hthRXslqVjCVQpyhJ9uyG6Qp
	2h/BCGu1fqfevtY91mB2H4EVSt48EQZCTLShrQHjATsor8LHyEJ1qOcMRuTkHF3/U7s4ycgPatB6T
	wsbyXDpz6nyzrOT0Cnbeua7Ig4d67YLm7mD/b6Gu1hXooivNiSX/QAsyjr6qZaQ4vd7qCZUS2Jrlf
	xcDa3B/+O5Ltk6HVI7pMTQuW8zLQngmNQvD2HOL5kESNy6CtBLWcyRW7JKBWDX+TnmyavzuPSq3Wj
	M3oHghyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMnN-000000016T9-2gAF;
	Tue, 04 Feb 2025 17:33:09 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMjU-000000015u9-0Ydg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:29:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaeec07b705so988294166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690146; x=1739294946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1ZYlfQ5I0ElNygZ6hE0CR1HQzjz8E0f5rQWW+uT53Q=;
        b=BRMRWbvNw+lCPzRk+0mVKU49Cl9hNPKsm5PmBzFKOKSNDPmyLEcBvWHMg1maV1kBQN
         ROZjvcpWFhFdncAeGz7Hj1Wnm/nDsblmLBr7a7i4DzSaoSQ08XRop8i7pV/IGLZW0E+R
         Q3jaFHS7rSP4N3uBbIz69JTpVg8IG1EqeeYeUpX7yLhNWB813FeP/yzekJQNfHfebTT4
         lGmzffyX1yRoqyXKiXY9NV6hHjlI7Xg4y0wCPMzEpN84t3o/yOT6wrFcpseENSc3R0oq
         yD6sFzRzYRG2SWdpJqC2ZY5FEpoajdjuVdsqWgtKZhN9qia8jtCr1Nd3pT2MTFR9xLyc
         /kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690146; x=1739294946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1ZYlfQ5I0ElNygZ6hE0CR1HQzjz8E0f5rQWW+uT53Q=;
        b=f5laKSwv70D1eGwHnMaR8cGRMqY9p18Oq3SDsKaEXd9pEhQHvFGpTdmnBmM6SlVKpi
         Xd1ccfqMBFggfXF+fjVn+jr1HWfnOWJtQx7QoR0Y2DCs5kMtgl3i2cd2EkxjhuBQPk5p
         9J2sBS97gwdG2SSIO1y1fbtykPrq0JCbL06XaILso8shWlnFWYLmH5hwCGp4mXM6pkDU
         N3zYU+9Vd5dZq9MMwV5V4RQUXAhd/ei+NV4Rv+JZjpS5ti/oXgmv9mWgdV8CG5brCBL8
         SSgO5FQ8kLYhT5IbypmRi7ncNgs7FkR3BwXPB+ptVN6MniRm+w07e07hRh3sa4Tb1Gm6
         w0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX7YMXsXYKl9vUZiE4yu+ebv8taBxwohKrSoWlt+zDEm6WS7aQP4kFOZQggqSt3CuVbQvIhpI5yKCUNZEBGSXj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ayuJtw6cbU5nBjFAmqD4VceicAQye+gvyzdxq3nHllnHkal9
	HeDY0CbDf9QW6pPCGr6PqzO7Cdt1lXg6a47kjQB8GWlU9xQUpq1D
X-Gm-Gg: ASbGncsgdUKHLBW3Ipbn15lP5KbENgUAAcwBPsAm5DdVS3hC6vgyWAgPAdG/muAP04d
	BtVHEkKcKr5Wt5McSo0xS7BcVINTN+xzE0qdyNjueP2wEmS/DtUgXy1ehq68veTM1Y84+k+X/YZ
	k9A+pdsd+mUSWUMTAPdXwsnWL3afvIXMVdPG5fTMsIh59wjO+0+NltlW3maQXAbTa9BxoK/JxpN
	najvvtxLPwlSdyXp/ZgZ98kQ8PnBK/GoBRnzWDbx5M3Zaz+mURkvZZ5Dpars/Ty2POKl73ELBo2
	Xipl+yy0MDGls0qjMBKAWcV0F1X3eafDZHwRoMTv89eRw4nhXcm7AunsalEdGn5V8z0=
X-Google-Smtp-Source: AGHT+IEpJOijiDcCjwtFF8cSqgFEaZCubHLE5XagVr3Cu6llzZV801QUD29OTEPZxbzLkYeWwSyXhg==
X-Received: by 2002:a17:907:60c9:b0:ab7:1cdb:c274 with SMTP id a640c23a62f3a-ab71cdbc2bamr1356827966b.39.1738690145967;
        Tue, 04 Feb 2025 09:29:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] soc: samsung: usi: add a routine for unconfiguring the ip
Date: Tue,  4 Feb 2025 19:28:01 +0200
Message-ID: <20250204172803.3425496-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092908_169051_F2B87FE8 
X-CRM114-Status: GOOD (  13.95  )
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

Add a devm_add_action_or_reset() routine for unconfiguring the USI IP
block whenever the device gets removed.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..85329d4e8 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -174,6 +174,30 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	return 0;
 }
 
+static void exynos_usi_unconfigure(void *data)
+{
+	struct exynos_usi *usi = data;
+	u32 val;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(usi->data->num_clks, usi->clks);
+	if (ret)
+		return;
+
+	/* Make sure that we've stopped providing the clock to USI IP */
+	val = readl(usi->regs + USI_OPTION);
+	val &= ~USI_OPTION_CLKREQ_ON;
+	val |= ~USI_OPTION_CLKSTOP_ON;
+	writel(val, usi->regs + USI_OPTION);
+
+	/* Set USI block state to reset */
+	val = readl(usi->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+
+	clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+}
+
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 {
 	int ret;
@@ -255,6 +279,10 @@ static int exynos_usi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, exynos_usi_unconfigure, usi);
+	if (ret)
+		return ret;
+
 	/* Make it possible to embed protocol nodes into USI np */
 	return of_platform_populate(np, NULL, NULL, dev);
 }
-- 
2.43.0


