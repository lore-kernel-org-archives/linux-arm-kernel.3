Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9431D2E02B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm7LAbjk9UZeclhRsp45Bk1MVvIyLp4irLFys9bmcrQ=; b=hEacw8nERmAboacJugA7JrSoxS
	vqF7JnkxEKnKLuys81GyRNczP66eXCB5nowm8WdccLeRstVziy6qPpPRlbKJdGbRD4YzMZUj18V+b
	sQz5Bo9MhEMcxZEWhIeo5PQgDbove+FVwp2V7emV7Cz86QmqUFlArGDY3MIBU6+NetZwAi9Ai9LPH
	xDP7Dc/ePtemeGNehHldHKHSgUH2S0J8Ahx+vw7VftsCxMPgdl92NxeX+cRdYakXih9UdOW0BdIl1
	tbnVKbrvi0NLh0HNdEp2B10o7HJ9dw80benDdIFMLCJ/5G4JfrTpTCPgq9dm1G2Jd/sdFXn1zX8Pa
	mmFr5yZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XXq-0000000DlfZ-2RIQ;
	Wed, 23 Oct 2024 09:20:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XFS-0000000DgdM-22lz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 09:01:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a0c40849cso1006524166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729674104; x=1730278904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm7LAbjk9UZeclhRsp45Bk1MVvIyLp4irLFys9bmcrQ=;
        b=mQjipDQkkHVTG7ugO5W27wH5Eh+z9BqHwiIRSZ7SAdPA9G58WN6n0Gq3fAIpJVdH30
         zcjjBdY1d741VAQXWTbvBjxHNbvtdTu0YgggqmOov/mTwKLAh4WtSbmEgwkpBuIeZlb+
         LkP9cN39qqrbfB4K7WAV3I2aiAaR+4bvUJ3Fu5/E7myDmNvKExVmaQRT1ouVQ9dBwiLG
         lo2SLWIezb1nnPVi/yAIWBCbbVnnOW5QFKP6sVoqs6jeR/zv2dY6YqHkzcXGufigrwux
         PrEtowLy0FivjkBH+bm0D3tSsXpQFdowv6LpT3YDa4ZNlwLBNMKaP7QpS9YRkiTrczZ4
         50Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674104; x=1730278904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm7LAbjk9UZeclhRsp45Bk1MVvIyLp4irLFys9bmcrQ=;
        b=FeR+RDyP1CeFZNmDSl7kafBqzGmri3BvfC/HjtQjG4DrVb2ZmbMSAz4m+IUTvU4LG/
         Meu+CKrjDtZI3uBwzULKz2qYTSrPt+QIqndyBhLRSLUNET7wrW2icfycTVS9T7dGiL9N
         uoleqBKDlfKNMFW0k6cnKIW54eX3Q2+7fMBLegjmSbDSSlSqo+No/HOuNgNVh7/WAdk7
         rSoFLja1PCUewCQCBxpNyBGMJ/H7GYCcanhxQKS/7C8P42zALH5+5xDXAP7KUR27iMYT
         WbdkVEsgOT2o0og88epB1O+tZqVSCEp9ediv/XmQmB7tbcOYAWOPYV4cC/9tJGz12xY8
         GBeg==
X-Forwarded-Encrypted: i=1; AJvYcCUjoxfgf4kv0WidaVudZzPrZ9Zo1G0eCNUF8C8i4fkBvd8GTotzAd3xVlOZDoFgxP2DCYkETdtzsfcEUNxDdA3l@lists.infradead.org
X-Gm-Message-State: AOJu0YwKCBVPv8/ZKwr9twa6LscctxWzm/63c7mNyqBcZHQltbhnlZPo
	QDB/aXv7nmHho0hitC0ElYMailrRcCFHt91sdA6UlRKLmePRBRue
X-Google-Smtp-Source: AGHT+IFXdXCmQDwHXFejapkVSeC8STbxrfZ6+MkuiZny0B/dYKh+NdosUtdLCrAUdxVh2ZXGmmz5eg==
X-Received: by 2002:a17:907:7d8e:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a9abf8759a8mr175413466b.18.1729674104305;
        Wed, 23 Oct 2024 02:01:44 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a23csm442767466b.205.2024.10.23.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:01:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
Date: Wed, 23 Oct 2024 12:01:35 +0300
Message-ID: <20241023090136.537395-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_020146_586819_54054A2F 
X-CRM114-Status: GOOD (  13.74  )
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

These plls are found in the Exynos8895 SoC:
- pll1051x: Integer PLL with middle frequency
- pll1052x: Integer PLL with low frequency

The PLLs are similar enough to pll_0822x, so the same code can handle
all.

Locktime for 1051x, 1052x is 150 - the same as the pll_0822x
lock factor. MDIV, SDIV, PDIV masks and bit shifts are also the same
as 0822x.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1051x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
    pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 2 ++
 drivers/clk/samsung/clk-pll.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index cca3e6309..be6b51694 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1370,6 +1370,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_1417x:
 	case pll_1418x:
+	case pll_1051x:
+	case pll_1052x:
 	case pll_0818x:
 	case pll_0822x:
 	case pll_0516x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 3481941ba..858ab367e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -43,6 +43,8 @@ enum samsung_pll_type {
 	pll_0517x,
 	pll_0518x,
 	pll_531x,
+	pll_1051x,
+	pll_1052x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


