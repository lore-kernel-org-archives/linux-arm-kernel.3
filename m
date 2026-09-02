Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8859C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=; b=Uv9NX4qZ1pGAyigjiKQIzl8R14
	pFXZ19ErQ4Pr0ZXlYlwTUGeoH+eQnlMijiNflUlai6Rri88dBpNvv5zxY2sLXJqJ1Ifx2PZj09AgX
	40zJJy83tfh5Qz+Yi1AYdm8KBW2ErjGeU9GOYLPnjQEkAXouDVJce6ffcZHmGQzos8UkYljl+Jju4
	FK0HqBJ7yf3fccCPbiK8BhU4NzhhMJnkS1lIwYTRWKaxTD8JkdtgqU6w+f9yU0Hh4JT1GDa+XyOyC
	DJIbqQH41tW92+jfaODXdflwZdPfsfJ2arahqCfe9bOE1UIzfZBYif0PqubgcLBwBjceeOg9dq4R+
	72FfCIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cEb-0000000DkLt-2oJl;
	Wed, 02 Sep 2026 04:06:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cEW-0000000DkHR-2Im2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 04:05:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6094045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321955; x=1788926755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=qq5IuSDYA+AQrnbdOcpXwi609dAenI01HV5rNmrJ075rp/DFEvgnrr8/vrLp8KY6Vo
         vbP/ErxSYEhckGK2VbbXzqTkxo8Hdi/cCoxxCYd/Pij+2r0XZhH3hbi/auxIzG8pUhDs
         7oJrRuaEVKZw0lXi200zCko7LHv0rt8+yuaYgCs2wTp63W+Ewp1YJ8sGWB5z1B4s5tlT
         dvO76MgfRKXApHlnYo/uA9PCaXaphN4TZ++s6Ki0a7t7idc90JRoi1n+2CPsKXvXj9Vm
         TBHzEpbe/Zz+5j1BlcD0Ky7kdP7vbZlA3m4PGmqayg5hDh/BYI+kLgUC1yUaAX1fObdW
         o9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321955; x=1788926755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=NvNgHUfzyz6n10d/AQklS9RZ1oNih1sSlG8cJhHha6VZyxkCPJ1tfTn1lIiYeq/DXK
         fN+YwbvkHwDofR/YLIJtveAfIlGvBi4BNoTn7ANv8ECNZxjtquDjoYPiViAd6mi6nU8w
         1WcPpGaO7fnbIS2NV69rVEwXqwd+rNnpi/yEMpO32HfJetwZCOQBWFYXnECouNip82Tw
         1a0yPFcMWk641mCg6XKQ/uJ9B8eATchNP9sv55toE9TZeJhJAGCQjL4BCPbvFXY4xIk0
         sQ9pRMhmohdsfRnz6ldXAIwtnoJ6sKOvtok7dVJzHWGv6vkH7LtihKtipXIQxGh50+K1
         cDmA==
X-Forwarded-Encrypted: i=1; AHgh+RqlPmZ4HWX3fhHQ0eWdrA5lD9OuObsaGkxBDjxHCnnjyeYq8ONfPOdkiYUq7egOpNv6I8JORLR5P/HoJ5Hv4Rlh@lists.infradead.org
X-Gm-Message-State: AFuF++mtPlzeYdfk8qePzgUYtfUbP+/c91wCslOdNEmQiyTriCoStr5m
	8Ef+qPLsHr8digCqnkrmaYB6U+gpVjegzGncrW90D2EDx+znBXiY6WRf0WsVVdt/wQs=
X-Gm-Gg: AR+sD11oi786bdfCcRM3cU8xJl9Wq3CpO8g08eYqnzuYqnBsWlVf5u4pehLmoDf6DiF
	h9a/FJ63LbcnDFWX4o4NMVgOVirRlBoDpa73osuqKgNDn4WHXSCya7RNi0E5HcOrcy+Xi1GQoyw
	TrgwfRTB4h+qm1r6UcQzImSLcNQVtQ/tpmEFQTUp1pv+CejXwC5+VE9EN7pnp6jbmV4znO2AEBW
	4KLDBI4utFVgQrx16dLHODmo2g4JJYP/+4epO1lM2dMIOuvSxLFztPX9wG5UroKP/qZkkCwXvvy
	XMHFqwCJsOPDtkhl/v9Aq2vZNP7SFQJIeW5gGBXY+BmKNaTpwyy2STU1s1qS/LGGL4hKt8G/F+t
	SkVvorjPlO5ukrMiXM7elHq1v74RvnejbwMg5YzfjtG8LowMlRHijkKuXIObdU4mxQ35CaNUQDq
	QJooIEgcVkEwNmQc/z1m/gNzmjvb81FrI3uDKNKUnErWib+yf2qXKfvK3W9kflz0tpg9qX/BblG
	j8E22CqBfxpTBsUBW2pDx2DweLlhcYsZhBXAoP8SMWUcYceL1zW
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr29047875e9.16.1788321954704;
        Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:43 +0100
Subject: [PATCH v6 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-6-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_210557_819002_37CF952B 
X-CRM114-Status: GOOD (  11.11  )
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
index 911643008b9f..62dcfb18f7f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -226,6 +226,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -243,6 +244,11 @@ reboot: syscon-reboot {
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


