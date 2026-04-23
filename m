Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F7AF589DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=; b=Ul7q2hwpLTCJ5oyHp8iXnaYUze
	qsk3lemxR3IWlBasuGeXPLcoG7CIVsyWQ2GYcayzkv8zxWo2JiZ4dTHCcB0Ihj2zf+YU/pBOweUGK
	E4CHWnaSBevBy/cshK1A9rkC3Gbh7LVN7HY8s0IVffd+meDmvcAw7ZU7gBOm9WCJ7GGFL15ZNDj7y
	ygxzH5BUlc5QeDcJP2dZyO34QrxXYy/521jCAgPToVJx42ubtnpQ2PGCi5m1Su7xtbDtR/TzHzmmf
	FCk3PtdKBSOF069kfulR0hXaRi1kyk/D35loW1qq4hC3l+P0mkqcgorp3yeacHK5inK59qyvtsUQP
	INWh06PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutj-0000000Bngq-1Gxm;
	Thu, 23 Apr 2026 14:19:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFutc-0000000BneB-0u1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:19:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so6133251f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953950; x=1777558750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=Awj4jXsayoNG5ZzIROg4lp0RnFsnvI/78amSLrJpYchP99ZgAaLHGpYPd0sk6VTQT9
         dgcCP2Cv+CsuCOqsn3nbaOW0l+MTaCKd33jAN4WQax2v2RQeg9D974Hj5PCtcX9T7g9E
         rI1HvxKvlqKMeBRbLSPL3gWYTo2JLJPI6aOcJdROnPkWIOAn/noMdKLP7h2ZSwmU1x2e
         gSYKeIRM8wFJCXxKl2mxjMdTBUSZ3m4b/dpdVGknWKKPTK4K4/ggisOb4vFBXfkBksFj
         u5SJ8GCk9TrGS2kfHp2w18uy0kAjsJMkDMLrIk1mPedP7RGZPmJ5VpNLsbW7q+X8qxaf
         qQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953950; x=1777558750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=MVz/d9HMra32/QD3Um50SHE0wcmdaXW+9/P+J0lNZZ8j02GGo7/0eJF8zQRcRhZD52
         TkTXw+DJpkZgndBxqzys4Q+TDBeZSjbXGZeaYObv8f0TjGfU+tC02NyHSgUOWskcP6QA
         roVDZGhb2zUnMTldY0ZPsmd2xPT7beA96o/jlScMx9hdF7EuZoOd/rFwAvYLoyuBaHJT
         GmAYmTF8dOmneAAlASbfFjBn8ZWh0BPj5z5LrWensUtX/BrSBxKx0vftMdurMYDpY+hs
         k8EBwrum7GBQhB4O5IF63b74G17lGugYZqZRtfKZ4BrpOvU/J8bw5VNVuIivwxTKvF4o
         31PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eRm1fs3aQeFgSkX2nLAfYmW5qwnnRxc8sjVZ2PCxyy19NMRAKGqDiQwR+JWAiimAFwsL+JyKkMY8vRKDRSeoF@lists.infradead.org
X-Gm-Message-State: AOJu0YzLL2nQ+hv5NH3sJG9aNDZ2g2/kEcHI9rR4zudNAINtpcIyHOpk
	g5XOQAlQJg/F7xzdHm/6aAq9O+pPqi/HSeYkrih6RZY4Xfae2Vz8jfWo1bRYybCwwFTolEUHa0N
	C4vMpQwI=
X-Gm-Gg: AeBDieubXddmQ6se2tzHZ+m2F62Qy8J7Bv94ij4yPUulWBBm7SRqjgCv2lcbYovvxMN
	+lS3bnJuzEevGeUOM18WTPsyxcvBGl3EfXsPt1DGdPCbeOuvhwCbw84m2f8Vr9INfIkhaqLZPtS
	lyqSltXi6PZuPOaiG5QoMil5AVdMEXW0V966F6PlQYV096Pw7ZF9iFoIiqNM8/TK4MXYCmP/po5
	tq1tkMxFoTjynxQWODFRIDRMV0ku07z5uoZVPD8oMroXXzETKUH5zRWWj0F6nKMCbSdVTDsc3lG
	n0eoQ3U71tJpeOJfiLNYKre3u4VMfvjiaiaKaVttCCEQRVFQw80fi/yJ7wIKLuyyoDc9ik3fUjm
	VTXhagRNc1xoiK8MAdIdOTNLJDfTWEpynIEudyaR4hhOMpJ7jlVqaT/4cs34TsRcpb8nXBGa25M
	bjYS3Xd53zwsyhDe1479JO+UQisl6HMC8kqqy5tnkmRSjjC8+r/8iUdmg4kJfr0HSDlgx9Sy3/o
	O+A5uZXtZ9gGvD/4A==
X-Received: by 2002:a5d:4ed2:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-43fea252120mr26389443f8f.29.1776953950228;
        Thu, 23 Apr 2026 07:19:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 14:19:08 +0000
Subject: [PATCH 4/4] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-4-2217b790925e@linaro.org>
References: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
In-Reply-To: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=i79vicUFzY3Onqf5OYj/Gpp1I7cWGIKf2Gu04oPG78VdXvKe/mM1tWjxIiGpqqhWXVO7u+3NR
 a963qJxKznSA4ZndiD2phqglKzLbYatsVVbBB1pq3M36X6MzqSjxJ6G
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_071912_268485_226FB700 
X-CRM114-Status: GOOD (  13.27  )
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

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog


