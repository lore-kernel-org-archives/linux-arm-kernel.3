Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CAACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=; b=WaactVqvz+i4rNQgOBGBAWzchm
	ot6+OPBHBgv4nEcK8+iHpxpzQOUZB0rXr5/wq5rR0nLTDky+l4GM1kV0n7csGhvnAmAV9Bv3Gf3Go
	oyN5UpLZKRbqYCFihFydj7x29NNsCNVkRCEJhFb6tSaDQDUdYQPxok+iAsuWZ8RoU0s5mfQ+zFesR
	3mrg7X9xJetuD473PG/QYOQkyuSbwtSysNlHqBooQodC/ziEsrHHTpuxAzSYmPTbt3jr6r1gjpTmm
	633vDcrDS0t1qFnZrMyQ34+ghNm4+z+ITznIVzLu9Nk5b8ybDRl0xnGq+yyc78jgVzVXdfyRqixV4
	Ft5KLU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004nhq-31RC;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwk-00000004nfT-37Rr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so2859804f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727197; x=1791331997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=WQpsyvFoVF4EjzIzWHekLHl2CEWp1EBIbuBGBgzovfSt1tDcFjr/gY9OsZOaz7OzJg
         eyuD+E/FD+ejnf93+5P/pHVixk/x7qgKQ3Fb/lri6OE4sPjTQRWUMGSYhZ/cCXpGLcoH
         2x/G0mc1rukulS3tvyNVG0y7ISBOqehfiblaWCyTielc1hg7uWH7Kit4TorsTC6dxUqJ
         4cyUR8+JFdapDljSg48xsu5cUT0RzyUXbkV2MCgJP52DtgIKN7zxIWCdHQYwenF5MhHT
         qZ5XJm/WotovV8vJrshKvNm3Ok6n5KTLLpqnoF0174YekvCoLfw9gSW/wyCkY2GT9OXR
         0iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727197; x=1791331997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=2A+5CgASL61+nNMb0gN+Yjlexu6Ceb8TX2HT9vTPM/+bN3RAZCVXPjYe/4xqruiHNo
         7h7AepWLC63/5c1SaqBZQFvmdgM6+4KlI98lA4oj8/8pbec9QdhxO4zaKi8t+vVw0Y+t
         Rq7bdkhXTqNN4RNVhJ1GF2RSdp/9r+cFOBVsFoUVh64lzZOXKwG56wBoKe9frl3M93Av
         jjhC7s09OmzDYCISfd9ncNLR9gPmfd3z3WEEMcWhLjvFxnXOxNAJAKUzVZ17GATUAaEe
         exrDic+yicNfcOcc9bYW6/G2xtWByLm2tmbYQpS4do9yxO+f3JxAkZD8E2u2OeVYWvU/
         wEfA==
X-Forwarded-Encrypted: i=1; AKwUvBwAHetQrY4fiFIAQ4YUpaCfPb0/q0ceIT1esGzv8ATWRTc7jWR/C/IQKI8D2z0+TQklyJ0yTgORg6mWUzFY8dZt@lists.infradead.org
X-Gm-Message-State: AFuF++kq4IUMaEqxGW9j4dCz+Mc338ibWRt4nq4ygXmpcf1ptgnhuwyb
	ZGqHIm3eqbvkoa78Y/wyx6QSBWTqV5PlvPoNmo9a58MIVKGu0Z1lsh75+yuLOKwGn36ww4crrxL
	BkqY203k=
X-Gm-Gg: AYBFou2oVyKC1wybkH8Wco1AxvYNfw63yLgEDlK76yueN4LUbeSaHVkiT1D2hlJFSkV
	tto0TDWoVpxZYtl510KwV6Wf2pezGgUFpgkiTyviHmYvDYORfBnEDSRrHOv3t/HjzzZODKQJdtD
	h9D6Z9pTbYYJdTfdlk2b5JqF6ZwyjwMZLMC99xy6OwsZL0LWgV1ESKstr4jy04rHM3rhQ6/AdDI
	49a59AJSQ9tCG+I1mSY76dpXqeGfJJCdRJYx4S+jU0ZurylAuy7sf3zq1GGu5INthnLz4FgGTTQ
	1QpmXr8lxpWgZDqC4+pH41rxn6xrYMaA6anZXlbR4snV/IW8H39A75bJiyYH4Ln0dnXQzHbUTmq
	v2zuoy0unbkYR37YrD/s2x3CLRNjqhCLZ/4PY+F3i/lynLMB0rDlDtzTpvvMmhCuTPH1Lxo+ixz
	HTAK4kRE4L/TvazCx2QzLUBJsYop7tJvdAjwRPNXixgx3ow2cvnsdA0InOohmyCpTmi69uI+e5K
	zbhRhEP4/mep/7KUrx0AOu2lSH0LsbwYRM4POS2NCYRbD2VxAKHL2YVJLWRMQ==
X-Received: by 2002:a05:600c:8b4c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01502b7b2mr11612155e9.19.1790727196898;
        Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:01 +0100
Subject: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171318_803791_0A94A4E4 
X-CRM114-Status: GOOD (  10.50  )
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

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..803fc127d895 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -248,6 +249,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0


