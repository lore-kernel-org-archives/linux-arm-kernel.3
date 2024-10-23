Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E195ED0BB48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy3J14myK2azS2Bw+TGbV6O6B2X8yTfWnYRpx0z+kQI=; b=dXSDxwXNSKtHnG640s+zhLRsJJ
	w6Kh2MAPvxb2eIgeE6ZQziHe3WzHsX41jJgjjYVo1U98QCn15ty5wfrpNPwGEZUJRLVaDfWT5/0+9
	pLhRMSRkelJkqUO8jRfXP9wVc82Q6FfRsgRESWUK6AGc0Qkq0MdR23kcfhhK4qI8Hehsl734BEVDe
	7v5xSOtHLCy/v5VFnQNM99z32BUpr4QL4FleZ0pTb2T/B8Hk+53kS0NB/fwxpjzR44ylw370LJM6Q
	xPgMNqAFNngx70CTznWKgX6MRcVji0Y82YGEULlJsZKDpO959QKWjW9vwj9oHzeIdKbQA/L9P33XB
	VsK7zVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kEv-0000000GAM6-3V28;
	Wed, 23 Oct 2024 22:54:05 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyq-0000000G6zE-03n5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so275312a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723046; x=1730327846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy3J14myK2azS2Bw+TGbV6O6B2X8yTfWnYRpx0z+kQI=;
        b=NHrBJGgCQKEic3F55psqI9CATfMYjfFnm4EA4H26CCd77IM2W7OUpU8s4QhgV6aPGV
         qDhOlORGSSQ8x/K2rG0yoZJxIl9oDdAVgc+6ISULon+wBhUWPfkHCIL7dcuCsmEOvYum
         P/mt3UQTI8n+5E9MmJg6GRE9D8vObNrsBpUbbm4HQJD2Y3e0Sc8NHoDgcMsDUi7K9DmE
         0PyWc1fG0eVAl4miydGOoF7rFVZrnycDt2Gacm1UlN/9B/gKIDwTqnJe+GXiFxg0PadU
         BmtDceZs1kW1iYnP0Ao2G2fI4nmRGayYeOWtSG0yIEOEh1VZvTlIRPbuSnBxmUBmexYU
         Rb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723046; x=1730327846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy3J14myK2azS2Bw+TGbV6O6B2X8yTfWnYRpx0z+kQI=;
        b=EHy76iqZnlZM2QA/HW2hhKRlbvyBR75L2A5uFYkZ9XXZDKbQ5/+2D3/hzeDERATn0S
         gKsUfFIzuCcX5p8y/YJIfI1olXw799pSheij+cwwMJubj4EHjD+AZkSz5Tx/aj4xsNkd
         vM8jMy7aGN030hpFGPYJ4Xt2h1hphAj2uwzVvhic78xAI3rlcyfJwHRlo3m8Kh+6n1Gy
         7bX7zrlfdEdj/x/lfIAe4/UVXPE4w5/p0CenCBmf4Y9RUVc3NHXp4YGjrnHByt/lInhC
         XA3YScCJr7/cDU3oC2x86AXn7qEivedK+To0tQH1UZ1E/OIs1+fJf9YA/se7+ib2oawE
         Bl0w==
X-Forwarded-Encrypted: i=1; AJvYcCXcIK6W/kJsqqCA/sPypl+U6yEmQ4wmfGONzbN6YlAqdprFCuK/FnnLXDfMmw2ILxB/oPeLTp991LsI1/tCuu5d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HDnAem59a3DCaCJhV2fMKpOCqbTlFCK/30CPGKx/KlX9GUob
	kZaDB2wn0n4fHpiM9oxORzbffoqn7vmmIZ5ehnvMKZnS51sEZt9l
X-Google-Smtp-Source: AGHT+IGBz17FxrPN/rCHV/WwziIBuQiIF5Ruh+1l6Pbr+Er47DLsPPDKhznyybTHabaFp3fkM6oRVw==
X-Received: by 2002:a05:6402:2086:b0:5cb:674f:b0fc with SMTP id 4fb4d7f45d1cf-5cb8af74aa6mr3518069a12.23.1729723046065;
        Wed, 23 Oct 2024 15:37:26 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:25 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:40 +0300
Subject: [PATCH 09/12] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-9-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=882;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=PUZweYcqklViBmb8uZ/IJuwwHuTmJtgh5ndkO4UYJyg=;
 b=aA65zLsbn/4MPOMDsOlrN9HRxwQ62r9xMLoPkCXZlYFt12trsIitbpJJEy9YAUBoQHqpYyUog
 +MZ9ldEdyVkCIZ/kDvOl6e9ll/aKott3kKtcXOIRwAbErCVivTpWmAP
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153728_088530_C598B3FD 
X-CRM114-Status: GOOD (  10.84  )
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

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


