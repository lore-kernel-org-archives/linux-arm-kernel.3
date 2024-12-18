Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6909CE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=; b=CVfZl0Om95lt4PVoojvTR+EuRs
	YNVaOShKeBKWAaNT6jt8QBgGQft7qvmEWQKkWK98M/xJRdZ1DYL292bV60kmUYkSPqhvyU+gx5+0N
	D1p1PQDCIB6dj1O1dbJzyHoZiENiAWJTxkuPFF2a1bQDu4rpoe3RG1AKJWjYrwI9L3BEgUr+zQWeC
	uYoz5P8A4OHHeq+0BHd9Yr8Mi7mH84lyUV3K8y2VL04kJiwrtAivcyejIswlNOHCiMX6Z//NtEvFN
	2vQBVRiSILKzV5+oN8vBKIrcBrfRep4XXODtJ50J0uNTPjJQoFWX3IJBoQK/7lvJlpsLsXhc4pLh8
	nwGU/7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNysW-0000000HSCl-0K1N;
	Wed, 18 Dec 2024 18:34:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynJ-0000000HRJd-1JBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216728b1836so83265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546552; x=1735151352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=AytrS9mQq/q7sKmI8IDBUIrPCjslfzPVB/cPOnm8gXuMwg1/RscJ7BfK0eLA3IFG8T
         HsreFiuaVyX5sgC5a8mNmDP1Zbr7zXpNOWY5crUDlHPECOye3RW2pLpqKMzDcOgBQrud
         CmQaA5ytAkQLnW/qeXxC6ka0gwUqPCcfKxhIg9uuXQQNvXoiQtaAQeOCf/2Sr43oiPer
         8iiGwTD0VfWtHUhOWoQWp2WN67vR3/+uxVVRSUn8WORgUI+g7Ghya3AEfZh017MQfjm4
         XNaRrIMlzDFz9eTWil/SKPaPSb2ALmtEO1ByHUjIJXMuhv0JdqwZfXDwnuvNkCeHd6xk
         CUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546552; x=1735151352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=sANF27pVZ/QezEHL51N/MdjJfGEv+iBkNR+/HR5kXufLY/fQqOm0O0uOfLTRzSzfTh
         xG8+QR4UWh9MoqlvmzQIl3dHVoSh9HHec3m2qhXDPzsTnRAipdwOPaHGE98k2QorKKVS
         Ehuqd/sMi/PH7y7ZT6KqkDeeDIKi3HTRxtYSp0JE4yNYTcb5FYYcWgezvN9ajXK7/35y
         02sDZOHlCI2Ox3B6S6lF2ENzlEY1mrGJyOZk5SeQi2LggvqxwnhihvydF8pQnHDQjjXf
         OXO4CjeoWYZconIGBHy/UwHBUk1lONzk2YD0i7Ka1bkOmYAFzcihxNUZUHrdzIsuCU+h
         gwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr1DqcFNw+xPUzsE3cDPqBFOkNuzD23H4OMhHSC8my9WVzzxTgCuazRreJD4HyajbmajVudV5qpULFBxx722u9@lists.infradead.org
X-Gm-Message-State: AOJu0YxFv4MBsUVQtE5JRr6MsCdxSj+b9ifUOfNXJty+eQeB1j8IXAGf
	ySB1x24/Ve62gcB+yULA6Mov33wGb7NssF62LJfoSoaPCkA07Fnu
X-Gm-Gg: ASbGncsdNVGqN7SEaw+W+oLEuB0wZ78nbgdvzD8duH6CSL3s+RdZJJ2VOaq7lzq+baA
	gA/p+E9X7Ooz7cS/3rtoFYmjfjsECYIRGQCwPYr69m1P/LGMhXuDJe7rM6OqxPbsgFrsthmtPCm
	kfJUiOG1EwosUvBgfpzZDiXW5svyo++e7Ae1OHNX5tVnbkh9ae4qq7hRZrl5RdAAmDD+ddEekGv
	7vBO3SFnIVNGiPsXy5HuKGZD5Vt/9CnTczzyWHnWkjvoKlv1Vb3YrRPow==
X-Google-Smtp-Source: AGHT+IG6QDCToV6vGIVydE11zTBp/e2m6aHQJC8DmNhZClGIJeJEeU+1619CoVuk/ihQMDgpM2XnQA==
X-Received: by 2002:a17:902:e546:b0:216:3e9a:89e with SMTP id d9443c01a7336-218d725a7b1mr45675445ad.35.1734546551897;
        Wed, 18 Dec 2024 10:29:11 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Thu, 19 Dec 2024 02:25:06 +0800
Message-ID: <20241218182834.22334-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102913_345662_5FB41386 
X-CRM114-Status: GOOD (  12.76  )
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

Apple A7-A9(X) SoCs requires 32-bit reads on the status register. Newer
SoCs accepts 32-bit reads on the status register as well.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 90e34105b50b..b27d261fe5a6 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -122,7 +122,7 @@ static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 	unsigned int pstate;
 
 	if (priv->info->cur_pstate_mask) {
-		u64 reg = readq_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
+		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
 		pstate = (reg & priv->info->cur_pstate_mask) >>  priv->info->cur_pstate_shift;
 	} else {
-- 
2.47.1


