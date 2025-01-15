Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC33C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMktWQtgBLQ8cdlCbA+kTSiSpZHtnTanW9u8Zhs7GQc=; b=xIs3CZ38Xtur7qGcql+xM+5wNV
	TIeYBtW/a2QS3CuFApDF7nDrFiVovzPXbYIummD7wfwMLh6rNdd2MiWXhvY094ML87cpFMcsS2Jw1
	pcEMCWpKG/gkiBThuw3vSk2xvB6qSE5S+SqugEPauOQnIp8YxQ8wflXvnX9eZqda069OzN9whS3qF
	FcivA5N+rhGslUbWNr5F1H8c43+hC4DeCx8njSTDdlyBJ1JgjZzTDMn4fhaC5rpqFu2LEPA0Ik/mv
	z0bGAI9Vbqv0HSElnr2cwc77QKRNBxVIRjie2JWZ0OVqeEw20UdrihfDFjqL4eGMeOW/L/7hx4G0X
	Jo6Sbusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXydi-0000000B4LF-1Kps;
	Wed, 15 Jan 2025 08:20:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXycS-0000000B4C9-1jog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:19:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso419220f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736929159; x=1737533959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMktWQtgBLQ8cdlCbA+kTSiSpZHtnTanW9u8Zhs7GQc=;
        b=KzvJjVQ/GML5lwTaC0/eyZ1za1bla/JiirdZ8+ZAegLgb5quL/mXIiyZIFhpz6WEtE
         q/bw06e7H7R/PrMs5dXj7w9j6oWl3VYyTxEkQLWy1//4wxYuiTyngXdqNi3E1R1tmHby
         7fUYCsBI5VOKNlSy648RkSCZWrqM4rSuogYyDnskcf8gE2SSOk7MAnFHe3fpZm5hYeoB
         ISZaupSm12p1+r9OwvqBAen04YjyaoZ2LZWSsMBbSL1IeCq+de94nC29yvXFZjwnnevN
         9eyc0JP6IiHyRoqmeVe+G7PRCdP3YjEz/eCqC9uiNHjGiUmOHYjw0yOYJc7vObkB1Rks
         dcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929159; x=1737533959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMktWQtgBLQ8cdlCbA+kTSiSpZHtnTanW9u8Zhs7GQc=;
        b=LzGY1P0Ii8kDDP6YG6zA5o2+jWbU/3jhHm0I8WwRBFDqB9SFigUp/4LKvv4LygOuZW
         w2yOxkJTDvjRfp2JmS3GvYZffoafGyuBJ6jXBcR6rxr5/EsgOcCXY4EdPmqh1KjQug7x
         GQBt6GEa84cVs8lnVMkKoWO/mXCj1gTLXSqkeTMRjhY9WVUEJpf1abAqyvDmTgtAO7+8
         ckItMtEsXxv91VvMgiuMzyGchucZUZax34CIp+i5BwbNna19AR1O/ik0n9wEbyFhnrA2
         dW8tnDrgrQ3qxw19OGIQWStzp+9V9+904XLhHlZPWmX7xmoh4zYPZ3o9hYWxtpACJDCb
         a8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV5wKzMz+gBUp9YDnAjbuTgZnx5mhjICLd2s9M96EpUfHo6EjdPi/8WUM2gxxVuqQJ/o+vp07w9Nxp3nWcR4ztW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/rTG2lawaiMneIyUSDPvhu35VOYyjXeiD82nqXE411w7Sv0Tq
	unTekd4mOLLbh9sbf8XaqPT7J22mnpn8wjTdB/74r09qkHv7ZuHzHi1wGkLWyMc=
X-Gm-Gg: ASbGncvjNcQR1CpMASms2AWhEqikIBrXcfPuwDW9n7XwgR2VkLq52rR/XKM6Ic9Ow3T
	4VoaROoUqA2UaiXEZeS56y3KfK+O+yVrLDKZOYyAP8nfJzVlpsZLTs2zZo9CrzU+gnYIVIxOwD0
	GBVHw6cynk6SXDEGFHxzvugdq9oo1NPUE9pLfa7s4Sa/BLBRHe6NLnkUNYoStT6hrELoOUxNeVg
	Na1xQ4i7EdWZKSiUiSm2ycdxXUG7KE5ACuv/B0fZwe/sQEt4r9hW2wL2upaPu5dTKCKKzA=
X-Google-Smtp-Source: AGHT+IH82dvQPl7AJYMIZ5/7ubtM6u7ezR7aRuptO7pWHIlRw76Tgzx6Wrm4+Ge6XRuEgEY/v3wdyA==
X-Received: by 2002:a05:600c:4fd6:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-436e25603fdmr88744395e9.0.1736929158705;
        Wed, 15 Jan 2025 00:19:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ab449sm14589755e9.10.2025.01.15.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:19:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
Date: Wed, 15 Jan 2025 09:19:14 +0100
Message-ID: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_001920_495992_13814D8F 
X-CRM114-Status: GOOD (  11.84  )
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

Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
use reversed check for SXTALO.

Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP/
Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/clk-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index f3a73ac5a1b9..fc0aeb4247f2 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -117,7 +117,7 @@ static void __init nomadik_src_init(void)
 
 	val = readl(src_base + SRC_XTALCR);
 	pr_info("SXTALO is %s\n",
-		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
+		str_disabled_enabled(val & SRC_XTALCR_SXTALDIS));
 	pr_info("MXTAL is %s\n",
 		str_enabled_disabled(val & SRC_XTALCR_MXTALSTAT));
 	if (of_property_read_bool(np, "disable-sxtalo")) {
-- 
2.43.0


