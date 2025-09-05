Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C41s7GNcy2VIbBs1R6Ajjd4rnWCbztAyNNt/x23sqEo=; b=u7c0PwyxAkYsrg/daToaNZxdlx
	O1NPq8iEE3MbueOVy46Yxo2gZQPZLMA5rBfSPRZKdznKwCR87gw4we99nYrnJWMzvy/H1BJJBJHDm
	wUK938KBAaZL5NhmtzeIzrtt7m5Y01Piz8g1yrcQZ6Ur0q2rmkOy3KyOY2HjqwIKB7PlBvHazNBgD
	A9YQZ+ocCr/sG70gkZwzwIKZI/8BUNXImaUpbZ+aaEPACPp7j0xP8b1zWidlGkQ5XQP0KBIsJrYop
	kY/P1qQKF0L4VtvsDg2csx5g7sVdcQbowOlkFUo9WgQRZsFZ1is5Tyn9CvXxFmAybjNbjnJrdFubw
	XIQyVTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVe-00000005RjV-3JAh;
	Sat, 06 Sep 2025 00:10:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaNL-00000003WcV-0hg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 17:37:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b76f3b24eso4318565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757093845; x=1757698645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C41s7GNcy2VIbBs1R6Ajjd4rnWCbztAyNNt/x23sqEo=;
        b=xREXfIwzq7giPnQL/6QVh/fX5LKcK5AACTpslQ9rjHjTAzFzR2Np2y9GzlGWdA0xNZ
         1j0rheNtKt3nSpw2QVDW+efl1w5k5V82rk4EDGws6iecqPV6d13J4pYXWIbGxhkRHJha
         1RIVQ83eol9OgaSHKLHh2Se8ATs0mk0pWhxe12FU+RjPS3KjKu9bf2LoPBuH+9by6pJQ
         pGgv7YwhKcdk0AwMOKhYXTcROtd6JzGby2dKvp2DzOe5OZs6oCFlXk4IowRG9ETmVorC
         veuoD+2I/fDo28kQMECnOMZrvr/ysQnbaWbvHV7etuIeygQ8B4AVPoo4cnbgM0isZpBl
         Dg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757093845; x=1757698645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C41s7GNcy2VIbBs1R6Ajjd4rnWCbztAyNNt/x23sqEo=;
        b=j5+SKrN9S+DV8tYJ1fQwzpmUv5HG6QTutWx9rwUNfUmI+ICsiftTTPuImhaJZ/8Apb
         jtRWv1kR6KdBLzAQOBsBTmodjHzrUD59uzgBvpTyeWt9Ke1/+vs5U2fPXh4ehMvraHXQ
         OMRqRBnwpI5pI3CgOWOq61rFZ70te5sqUZqKpE3yDbIKkKjU+0Rw2GgczqWWzYpC8a8Z
         H2ZxCz5+Ji5ZZmbv8T4cbrlQcs7HjR+wcRq/dqcErNpe7t5gh/YAQoZ65OWX++zqW9Zx
         E1JY6kJ8BSqtbqOmGceKLi1BC/BFM1Yn74s170VqDvQqM1lMmn6CrEnONqrO1I3702+5
         ptmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYgXmD06f30oZ7qerfI4Ckyaj/21nPJXQNTVHA6i+VR3ub/HIr4JbgYdR7Sl/dqMqICpvi61spyg/qUqR1j7Co@lists.infradead.org
X-Gm-Message-State: AOJu0YzoN+OjWgloExI88sTM/LBQuoE1OPy0pl7/7CL2UpZC3/ufQHFH
	WtxPA5qisUcvFO3LGhePQkXG8BVIBbNoUGHzw1kAZwiP80Ak4oqJM3E34TF6saEV4nnHrEKu1gb
	jEHRT
X-Gm-Gg: ASbGncuT0gVkPxA6MtK7j+8YyEDbb+2bh9pLYRfnLxG7uqdBIsUid9qLZonn1e7cRX1
	hfpzYpznyaGgfQcpfjmZWFfPPOxet7EM2aSou1NqkeVg8bTinlcS/0kk9G4ckMvQsOWXm4bkIGl
	2HegXLkKBke7iQ+AMKLzCCkGk9E6PHltGmxMmYmGe9aDJnb0m80BWl+yrW46Av40DJmUsZ9eoYj
	OG9TQU+LK5IMHSyJj6hYBzf2c0N0DIINUdp8KIM2ZX10TfxcwbdzcdbFq+bP2VcARx6CwVgqPUi
	NrFoCeKdLaq5ErpLo32i7DwvF0OdcxIuMUKrlr7+FyjLLIkRsWx9/6juyR2qE0RdKVaPwKEhpu5
	ZPSR29kuicaT+n+IYZQTCgBeRhRsc0cxSrA==
X-Google-Smtp-Source: AGHT+IHWRNSLIatugRetZO/CpGssuICFcXAn6/N40TrEXg7gQCmSjCxc3dvc4P8G5NAWJ3452VJhbg==
X-Received: by 2002:a05:6000:420f:b0:3cd:cb0f:7203 with SMTP id ffacd0b85a97d-3d0f6b3570dmr11699998f8f.0.1757093845275;
        Fri, 05 Sep 2025 10:37:25 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e5100eba33sm1095297f8f.9.2025.09.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 10:37:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: samsung: exynos-pmu: Annotate online/offline functions with __must_hold
Date: Fri,  5 Sep 2025 19:37:18 +0200
Message-ID: <20250905173717.34240-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=sxDSb9W3kWYfcQEyJvHl2qhUaQ77eVWABPTDD93pB1s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoux/NK0EZx7r4MPOk/47bnRwvwh/FBnKiD2F8A
 tqVeTkkzyqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLsfzQAKCRDBN2bmhouD
 158oD/4/V0LUlQQzGC6pFK5dIFV2iahT3jc7md3wP14CXs0BRPS3E/Ci3c06QriLlSw0aW5V2Bq
 YbzBSDkafkoyeXChCgWMTCKM1tKv2QJwf3UV47IHgQSiJho2gHtltA5u1aF3c9EOSuG7FXpGliM
 H782ohJA94ci6ED7Eg9TchGhD+xSi4rfruajT7YDIAf5mnXZFmXQU2hELBdtsNBEH1tYj/ZYmDm
 9KyBiDqB9f7LhQcHrLVctPt0r9IkA80izurnKizv8FHPg8XdW98LpTRmJPRbZ9Iedp2PU7NSpOf
 GWkSOXQM42UqCkwu+4isjBxqTlM6YKCKN1Be5x1Tnl//xe1X4cxhIaTZ4K8Vv8Rb/3wMRqg+7QP
 p8TBVDV+jKbVDmw3C/Gjbuvy70t/cjFV1AD3uvI0/00LHyoOyb8rC6Q9d3OhawP+CBVMxNxH5nP
 koHQTnWHdTj7V8WNH9VAzbww9bMGa9eHiGmK8a96yWURFpBNK31GEGmxPTk2xPYt0yKwgrzyPkf
 LRopyr5oK8H3SOSWiEgixeBGfv+vSPnFAbe0bJYw+1jzOMTPAWsgPYa8tfTdSDlLN1ESt9jrL0g
 mMxomTmcEAHNgZW2R7yiz9KboK5EhxQ7GFfrYYYIv7rWOLrlYknILYGyw7JNo/yKAvB3U1UK8T0 W90WS/kBIbrQl1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_103727_213184_7F51BA57 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Annotate functions writing to PMU registers to online and offline CPUs
as __must_hold() the necessary spinlock for code correctness.  These are
static functions so possibility of mistakes is low here, but
__must_hold() serves as self-documenting code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 22c50ca2aa79..105293970d48 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -364,6 +364,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
  * disabled and cpupm_lock held.
  */
 static int __gs101_cpu_pmu_online(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
@@ -424,6 +425,7 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 
 /* Common function shared by both CPU hot plug and CPUIdle */
 static int __gs101_cpu_pmu_offline(unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
 {
 	unsigned int cpuhint = smp_processor_id();
 	u32 reg, mask;
-- 
2.48.1


