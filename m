Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C03CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=; b=BYbXc6wwU7ZS1ATjqnTPYjiLJy
	9crXCzpSB16DNJHzX+eB6HIvRqYdL/74I8QB1PEP/Ycp3VyVEaXxeQfugsG/IDyIjgf5yc5bib7VJ
	fH+rCi9c9sDkD8qqCBTg45ym4KSZZUVZkRcJ4Joti7YEvsClhn9hKQO6fU6dYX8GsBUWP03T0P9K1
	GMZkBcEhuYmw1KwdFiBoNAK3hENkCWiOaIHoKybkQE9OmTjFjJ0J+rxWcwd5+vKhbbjUNEVD6yPzu
	IA+bHcfnJju7JVwQqdngUDD8Pj3E+ZexUXkTvxJmFJ22JyVZcEqQAk5EMDxGLsRBvM5OdOCob0Vc/
	rwibnYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFE-00000002BAs-1bIs;
	Tue, 29 Sep 2026 03:11:04 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOFC-00000002B9g-22U9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:11:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso14380225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=zoyUbNuWsxgNsyuSWOpQuFueMRkto1SbHPGUIJMTjga8QzM6pMVx9ky6mVcszot5aL
         Gxy785TeOAHb00UR+VtS6RuHYtosKIJQxZ/n7A5Haq7WQtJcuYmIy7MgNSa7jpNy2xGt
         JLVL/68h1dDdzjup1nqbwjXTtA5xBtqMoLqy1j5o0nBaYkNCLT0FN3j1OZ8cESNDoizL
         SmlZHBPL7wQiZAMzG2GDu3YlW58T1j/gd0Z7TL+NYVe3EPFt50A2PY0suAttybAiPAzA
         L4AuMQzvhaoQMQ+laRjF3rothogWNuvr3HmNeJrxfGq3gJtFsTrUXFusEueXTg0+JEQ1
         AEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Tmkp/C41+VRZ67CctHDbpVV8IlGaj/VN6M2tb1CRsw=;
        b=qVqv3XeZanahaALx9QHMTllypvi1sO8eZrOOpHKwY4boDQY7uHKu0dCckBpDH2Lh7O
         jNE2e5VtW9RJOvx1trQV5MIlOT6PdMbEMdXYvRKG7Uka/lwSl+sfe8DyW7VVKwZSefH6
         oUNyXBJYNdL4azXPnTKqMEO/iwz+VsadhK7o/ooNm8ald9Qv9enIQPWLfUULVnda4MAS
         LRPUwluPWL9JFySv4R9A5yxCEUcsJBMO0znsp6ynVP3I2V2rfz5RJTB9LEkZ6wX22SU1
         kDeIE0PXJNY5/wMMN5sxu34wCKmFZ7f2BrK1v5hm62rnrOSDrtnddYj21g45XU6EgW1J
         y7mw==
X-Forwarded-Encrypted: i=1; AKwUvBx+IMindBoS7A61NMlA69cJ0hc8eisdn1b9JBmQqfqxYgjIkDepJYt6YVOjG3ZmE2NE7ATH4bJFgDYsuNqHDQ67@lists.infradead.org
X-Gm-Message-State: AFuF++mzE4M6InRyQ/wbfYYYoCKxMD3+gsNKVtQyOkd0STvcxntN1u9G
	sDANupG4tgf4okoOwhBn8wXVKdtnRN1R9fip8HzRJtnjsDwhm27COv4DjKmmDk0xuK/o/dyosJ+
	TjZMgtyM=
X-Gm-Gg: AYBFou132Ou94qeqlkhTcmITo0SrZGcDmRU8I7OV72b2X0QoBttygRsOK3hCHCcmWcG
	e9H+RsLwln67TIYU0lxi9VmNFQjMI0yhxxRTbmfWFVGL/oGNMKqZYa/1fClE6xdDLoaxpxco92o
	yWHSHPkNdS12IW7a4fhkRsJUbmu0diajb/YkJsospJRGLZefmApwuSG3tdFBVCiBm5f7Y8RYR30
	TZb5nTJOznZzQhfimJHf6ekjiUAltPl10m6kJkSMLGkXsXDophzSK+9o2HpynJjvh8fEqa+8vjx
	dl8cGM+VB2COk8Ho+q9/Jmsxi7Lnk19JS0Hb3Wm2NpeVPPmcaYid44RsJBkSm74xhX72o9C/XeV
	yW4TZZdbf+6Ig1yOouZDNveaA/tvnAqie1s0es5g5K9P/t9k4jUAp/GzEMrWEnMOeKLcMWL09RZ
	hW1gYjLYte3yUc2f0QkywOKvA8onrqiD1LZ2MeQE/I631sSC+Eyx0JPIai+n3s3b7jFd9dpuw6+
	sZxtRnFo3MZcZZnmWO2xJZ1NXtuBigt+aRIb9Pkm4f/BDjGXkJXkbW+S5I3rMM=
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr108686475e9.25.1790651460523;
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:11:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 29 Sep 2026 04:10:47 +0100
Subject: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201102_613775_E7212AC1 
X-CRM114-Status: GOOD (  11.10  )
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

Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
protocol provides interface for all client drivers to actually use
features exposed by the APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..91c6cee8f483 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -11,6 +11,7 @@
  */
 
 #include <dt-bindings/clock/exynos850.h>
+#include <dt-bindings/clock/samsung,exynos850-acpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -170,6 +171,18 @@ timer: timer {
 		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "samsung,exynos850-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+			clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
+				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
+			clock-names = "cpucl0", "cpucl1";
+			#clock-cells = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.51.0


