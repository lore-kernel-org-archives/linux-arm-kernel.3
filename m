Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6CBEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=; b=b1LdzgP3GDmsMgz/zYqpiRbBpq
	MeypmUBSUSUKoJziC7WkXYCu9kMI90z4fxVCYbNIYIvB1YhjGUsnPONSJ95CDI+3r6Phdb9tFsXCt
	mm2Y3HACIR4J3ErHy0thGGX8Rgvf7tt/Uq8P1WPwHI8E80+DS1jY7UROJeBxu0aInn9B3exKWPVzt
	x65/cmZ6hx9k3Ym+/i3sVq+rHdTVS6aC+Li5yNcX9XX+lDnIy2exwNs+BVTb+qFpvdWZbNtlRi+/K
	XUCK1cgSF38WH1zUBUhA1KyeXRh7eGCwAxUvyC8dZX4HUkT/hYzltDE0UwW8CySU14OBbmu0JgAqM
	oaVSgodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZw-00000006iWh-0SWB;
	Thu, 01 Jan 2026 09:02:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZt-00000006iVg-0r2f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:42 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso9036920b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258160; x=1767862960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=cU3UHd26PjB5TYGpTPfq19MK/OSH8XrX1sVgvIzROL9y2i4o7DR6TgPox+DOv6XfS7
         LZ7CHSQlLHLjdzDgLG1fXwf/3drYDCIep5hW90hKiZ2Glu5cCF/FHJUXM3/lBWMBd9RY
         x4ZXPqjP3Btz2lmrFH0by0jtsvsU7vajl9ddhJoJUP82uasHd1FyaGtzOjn4IYIfit+6
         JZyE6L5DBLZxKRL2Y+v2ROAh2QMYgo547TAafzfOr8pi4G5wPbKxo9ZZf3oDJdCtfcTh
         UeN71fpnfqRkQRbzZZZBXABi7PRAQqDtGKbV5I72JnAPRgMKDMw4EU2P70jjAmeUsull
         5DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258160; x=1767862960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=n30xSpiE7zJvZkRoeheLW/76bFW+jq/Wg+IOBhpj99/doNjgqP/sdiIFichfUQfs+u
         axqUMKXrZvU4QlGPI8sDt8vBnsrbK7ZYwgJqAKrqMCyujYavef92ahy4OshhqNPbTtaY
         pHNzlRKS/ymCa/K9G17goFcTRAIZQMORShLls1P/UDY+k6CVA+5fQ8R+CGV4T9hMCGmb
         C1ZzriSbXSnJYMl5EuBo4UIMo51oUkv7W0+ay1wB49pmxM7yI8rpi5n9tbokXSs9Ys08
         WFNxSYsqG6mTRmPhVpI2XMvnYXNFaokFBCAxM4rmiagi8OtPywmF8Qg2jY62WFgE8gSM
         Rhkg==
X-Forwarded-Encrypted: i=1; AJvYcCVbkDfUjgGw/kwkxrw/cF5bBETvPX1Zj5OcAqDDowTbQj+JODAT0hBxFZS6ymzFH7qOp3Ky1Wm18LS5u9fNUMcH@lists.infradead.org
X-Gm-Message-State: AOJu0YxFm+rFt7//Wzyzrc++oBr8RJq8I14b20ncd787DXN79x7CfSrZ
	JtXYH+Kr//ewONdhVSQLI4RK6dnFpAHZMqkYdyEw20H61s4OB8jnZYsp
X-Gm-Gg: AY/fxX6t4s9UAilhyLSlGB4dhqoKuSYfNm6PcwJBtAQgNX/YrSnfa6gjh5ndqq/g2w6
	n21833rjgQUB86MlPyJAY1Rm8GAh3lDbWVj6eboS74kePQyFqGg9D+swRqpKIANN4aspBUO00Zq
	nK+P9jJmQWkOgg2zbSw4uB2Kv90OjR/1prT3MGLh7mAOXc3RZtvDQhKcdhvM+Ou38pZNzCPrNQG
	akuTf2v7vT+tHay7hB/GssP8HAFTj/QJoq3ZZX3dnc4NXaisZP/6/u+HiR7HkmPYWyc4LPn6xnL
	l0vi8jdghzPU5p9UbVmMjaFuxcbFkzPbOTzeApCBGblDf6eQ4deuWOz73UBMI0nIXELttJfh4XV
	svKiV55yd8mpnwUAmz+VNuPQkOOIdeCyxMQUolpxfblGJ5pF7qGcf2eSOuy5uNsM0Wngjo4adtv
	sYGtRXlqtHjMDk
X-Google-Smtp-Source: AGHT+IFtoil+3P7aWnRMIiq8mqybLoG4UdYuQs6Y3uQb/Jyici2QQ+OBrSKeKnNpXmAnFflhht0LDQ==
X-Received: by 2002:a05:6a00:f99:b0:7e8:4587:e8ce with SMTP id d2e1a72fcca58-7ff66a6cd8cmr29772792b3a.65.1767258160250;
        Thu, 01 Jan 2026 01:02:40 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:37 +0800
Subject: [PATCH v10 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-1-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=07n0zpGM1mcRCjmEoORnP+p4Tv6Nx9ryjVOY1OMyuiY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmRsRBPdL9/utiE0nqPtsVdLeRRqetK9YcJ
 ZMgjrSR3kqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JF4xD/0QoWqxkZH1Wn5QnoPV87CkMp55ChVhudxMJB4SC5V7Dt+HrAc4pSd7nFd+K4pPeP1qwbG
 0onYYZ1veiVkIAFlQsUpB3a8jGT90Vru0U2MYyIrv6kUYWohWOAABi2aNG5omb2G5Nk3MibHtpd
 rnmNJb97uGnUepEd95Fm20xBETKdOWHmsQ4061B9YKi9SIt4gXHPDlHMNUhIy19RNz4veCpzW/V
 +FyYucydUfvbOrmRFIkosShp5AHD1RXszDYIAEl1zJmLRHZymEXUavxBarEYUKdajJ/3+nvFvEK
 tlgApSDE6OHx88cvWjkIG+w+a5IuDUT+lTBb+X89PQP1h4cc1PM2a9HSPDoLN1dTrDA/UPNs6AZ
 /tjGneYg4Kgu76qanoKeZQTDwuG8iq5SyrT2mMHMjM9uAlnPwRm9KxiI/AtMQ2rYvlVqqXazAgP
 sHf7GgNlZjaE4SIQgkXm4EZN8wrvOBrAPOMUmeOoWzDXYuvBThwlZXAbCJFJROUTLsKEOUWQt6+
 WsDdb1MllmQlEl7jgopcMuD0dxR/s8Xee0I7UC4/KAtBWwrKZEZvQLknULROfmmCPyCNEvVfNZ3
 poA70X2OklbJrD+UFtMMUxVVft0gzk21SwEibpkyOc18DW6AyXoBFwusC9FpWoym7sAZcHHVNOC
 hygUle0lWVEoscw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010241_251229_25F8C377 
X-CRM114-Status: UNSURE (   9.58  )
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcdacfd37472926ec6994c33603163a44..97800a991f208448aa4bc8dd59b45df2ff35b400 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.52.0


