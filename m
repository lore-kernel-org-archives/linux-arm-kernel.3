Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E294FD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=; b=Jxg//xh+M1jro1bnRGW7tpCWa+
	UIjvnou5BmV2TE47tQqW7T2Kt2eqsP2FLgLqTks0/rCwaD5Zc5f0JMbf6tF1LazbN5CXJPzNRGpZm
	mNVgobz5fuOuS5HycOyfGPJk05e9G9/75vN7v694kSDHwp+c/Ue5MFXWJEkjNQYK5s770pzw68QJl
	Lar8y1ZaDRXPBKR2TCeymWVCsElOWOP2S+r+gzqEZz4KEvKxwjyIWug3pvwXxbN3hhuGwULhVkELK
	Blx2Cf+l4D1+FodAgXxPJ7AIJq2NETXuar6z1F0as6+RtoX9KzLeWwP4brxDy58upOkR1luFNBaUj
	tryJU1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5M7U-0000000AFLH-47J9;
	Mon, 28 Oct 2024 09:33:05 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxk-0000000ADfl-2Xqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so3519158e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107378; x=1730712178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=mCeFftcJoEzmWve9sYiEKddX0RhfCBKD34MztlkBXvpLmVffuQ03ZBMyZjHJGraLD5
         exytfLxiHxXmhbGChVf+G1O/3LUGvs5f9PWdZL3YDFRKUZcIBARwSiQqerFXzpEnRB+2
         H6PvAV6nX3EQTachuJ2+/qZbdf1toLoUI1pEp91Zisv7JeNzv3YWNDly8qCt+02vREEK
         DdbXfEhre8TlEcRf+lHNyvsyLzGHR2NUmbwjWTFnMAYreqK6OvKDOnDT0wInei/7K/LT
         nHNa8C44zi6rC7gdtVHZRcqTlrHCJf+khvtFlRNg3Ho//OX/5Ms/GqUZNBrZWphUjfxc
         fKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107378; x=1730712178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=Fc1KehIe58ioVcqSA5XGk9OcV6ycynNIjufIODk5+pULh97fmKfLiT0lkr+P2Z0KLi
         1A7UZ3x/o39rXX8T2PyRWXPrw6A7IhU4PwPPULBLhYMHgukrT1TCZdzkK4Ga2pxjqR8U
         9TwAYjGld3o5zRjGvoS8r+SwAx4DZ33qAoeymyDOf2UxC+K6y+ZEIA4UFffG7o3F2DuR
         CCBpAcDeT0V4Q+e+OHqHNasQkmSXDn19sz8cmPDDEZnjlVZwrQ4cVRqa5Q4FcczIuu4e
         6C+j6vCaA933NDGfTSi1SkSI/HOByKTF6KPjTizr7s/nlDdR61rQDRAldHj2SKMkTnMl
         B6Og==
X-Forwarded-Encrypted: i=1; AJvYcCV7yAL+skfCCQJoPJOJcOB9pPc7RyG18eFNM3i0Zr43ZkEU8ctyzThT164KTB2AE8DGdPuU97nS22kMpVRWaKhn@lists.infradead.org
X-Gm-Message-State: AOJu0YzUpG5csvQU0wi+bZu9jCu1iXsJz7B/YdbusbiHVozEHlj0fZxG
	aDOpcmRZEAiuM16D2sCHduWt9/7UqAZ0/6/1EhB+GIXQswxy/rYV
X-Google-Smtp-Source: AGHT+IGkef3HGo+qiSbkHHbqdccXE80ho2uJc7KuN9SzEldCCfuT107SCvwkHYC8p+RFSJWq/VtkVQ==
X-Received: by 2002:a05:6512:3e1f:b0:539:eb82:d45b with SMTP id 2adb3069b0e04-53b34c41d5amr2098232e87.56.1730107378267;
        Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:33 +0200
Subject: [PATCH v4 05/10] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-5-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1139;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
 b=BzqBkS/JjTAQgeZrbGmsIeoWOvNem3Z6/fZqBLEP25na3UUEyLPEvnDKuUEqkKr1n+Bvifgb8
 uet3RjHNxHTAFND4h/HaUpKSd0Dot7FUZ9cXaHzD2PFQcTUTcvlBb77
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022300_654205_651F0709 
X-CRM114-Status: GOOD (  10.05  )
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

Add compatible for Samsung Exynos9810 PMU to the schema.
Like on other devices, it contains various registers related
to power management and other vital to SoC functions.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


