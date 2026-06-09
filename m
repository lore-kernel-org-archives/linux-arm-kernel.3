Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05584CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=; b=ICx9MFJzu2C3cmVVvcDJoTPMeT
	WK8Hkdzjv8/AXVBk/dr5FpQWnPsJl40+FcuvWmkD0eMpoqulWB6tSSnV4TCfCkS3uD6VtPROV+o9n
	H5wuUDhOdy4DcO48J+Niggw4vCaUAOwPKxraE7lQO3tjqZN9ow6Pky1qV+dIathif99mNxxFcATKv
	U7fxM9Mmg7iDorDhZYJ7WITm01E8OrTzLzwwq5KTp6DiHthFTVJbXEIuA1kU+CYP5YR4OSC51z2/t
	WBNQVY4Pd1HH7rBUHdyt70qcq2TIZI/j3LvZdNCerNEpkRUqyPpucEzlWAlJIvlHOGZ6mme+JpXIx
	nMY4GaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QN-000000068Mp-3NOj;
	Tue, 09 Jun 2026 17:39:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QI-000000068Jl-2eed
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so48329025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026773; x=1781631573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=mS17ftQ21typflwwgM+VbDsBSaOoAdd8pHCLqZz6qqBKE3a32YoNFmj9gD6nZX4dZs
         LleUBuTXIfPqlPSmKcYrMZ61t70eOPpEH+rFUmi0JgnSONwYiaEJVafjTNa9uMQ9x1K0
         7JvKr0uN05tP5TkHYj13Zm1v+M2sOWmKzBOqemkruiFdmOk8tL2BI3VIkCPzQ1QWRzdW
         N+Yo7GBIJ9UcbdgKExU9S2D/YplXL4YucWsm7LKik3Y2u4PRiKo/IqI87h1VSuxNHhd3
         ioIxrnQNfMM9vjoGmHKWCkMHBeodhZ0GFcx73yYAak9c77ripPcfTE7pybg1Pflq3as8
         /kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026773; x=1781631573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=A1gEXCkh3kRyJKPq86KynoD4c0cdAkJNGrr8wz1EQ+j+dzsUi4Glfud0PXn1AJpOdn
         h47NcZhX/HGU0X131SL4O7cGxeQbcSbAcr9rtN2ah7DYB3+5fCaCVV8LiAF7yA8ZGsis
         GqegrqLBvzCc/hZppncYmZ6jyMK52FyCT3fd3mHhNb9Zv7+Nki35WmKXfJm63HPFjaMI
         jK2tlqZglaEquPmZJWXdeyOpu60Sy3JzacQoe3Baad44QzjUhNAIeuzZ63xp02BpAi5Z
         6Z0qCEUxnJV3pZG+Ynra5mfSGogzu2vVD/shNZdbU1pb4BLBG7GtUZljAtornvoojetk
         IhIg==
X-Forwarded-Encrypted: i=1; AFNElJ9PNSbEX1TG6A9GnQLAqnJKpw3Ag/uU8y+t7pNsnYw895EjIRb/EsHokiC/qlE8GFIuEiXXaY156Od/lZv/li2F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+7zPNCVyprZrB4sTTt051FgpLBex71mvdKyCIYm41nWi0vf1x
	8urMaKO6kIGw49mx9iFHbfcdrvxliu8XRfN53L7DzyX5C3s3p/FlG3kDTMv7OSjZC2VZUgF/6Xl
	FiTm1AUw=
X-Gm-Gg: Acq92OGR+f1Utv2pAweSn+BOoZ01k619AsSYWSqgg6d+YFvtoMPTiboLOenRvN9C2mr
	9PXZ+ab3Majk2fRPaRsfjiDIhXaeSu1JXJCvaLDXtjisE43Z0Gk14R7mZZy095fxOWDt/iSV9qc
	sUSLPLPQ3/YSeJgrMB/CW/oGGSII50SgqiwuOdEVeOoC//DfuXIymsjB6T1DNizCniNQxx0BBxg
	wFZmMFdajLgSmM8CYvIdV9FdULs7IQy3zul0qOTEkhmE7MCGnGV4z1uSPBNnSQbHiem/VgWZeZ0
	iGM/l4NHt4pBGuaPD1ivVaJCIvtzTA7WQr4N13vyF4u2I65jkMV4JIhdrakEUF3twrDabzkVh1j
	bOvAfZ2sG76PWTYco6OkqHbBHttCQTYrfRX8KzL+LhxsylHq3pu/zd1P7qesO+ahmLbDyDkV8IR
	c9BSkU7QzDeSQi90JQxl0DE7QLlmWj8bOJttIfLLh/znYHU4CgUvc/Im42ZddhAOyumCDfrU/W8
	hXvL2Zcx27RJaYzLj/fzLg3ljkhuarvAqoFqg==
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr328438815e9.8.1781026773036;
        Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:32 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:24 +0100
Subject: [PATCH v5 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-2-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
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
X-CRM114-CacheID: sfid-20260609_103934_742514_6B89D985 
X-CRM114-Status: UNSURE (   9.64  )
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

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0


