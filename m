Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A0D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=; b=OCCgkcAp49zDCpqsy6zH76neKm
	yLX2sVWDLQMDvKWCEpchCv6driSsNhBOU07OW6+Lrw8cdozcL/mXNfwPIpj6OD0bHg2aX1WMstPAz
	A7B3E9+3HPloydQe7pWv/YWYz7sMts7XqoJFmUEOn3W8ZUV6QF7xb9kdxf2OPDzuMwbQJalNnarMu
	RRn5K1ElArLYXcnVowvMZsg173VERbeBsGsdNJGKlP6tt+IYqxinbie4sBz/MizCXjaYchO8oKwju
	vDGLDfszHysJS89xGU+sc6bx57dfsCUIPzg/cn0BoZXKI2l4GfPPImsxYTXWqYCn2v1zPy1J4z996
	6bSDGf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5M4P-0000000AF1Z-0VdJ;
	Mon, 28 Oct 2024 09:29:53 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxh-0000000ADeS-1igf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:22:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f72c913aso5080343e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107376; x=1730712176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=ZPsETzRSS22ZZyg+bTIzmAhLgfxiXqBo8ChsCH0oAqAQDGGQ2JOOY1vERmWig3isZW
         fTlG/LPab8uNjf7YXgSPwOvwdxmk3NGv56ZKGI9SETzKQZwm8hlffdQ+x6gaN9E4L9gY
         28yECxIo0rNxeXaYizMsdAokxAp8ie8iQz0/P0WsbpdNwJ3jIUctdI8tydhSgtoglw4s
         6Ipe3FANFcGBJRmMFTXqyPbBqzwR9MQCKA87T9qpDIJvXB+0rdlPqCipNG6mHPg8I6Vr
         jVkRsRciUTx0ffhysKlUq7S/Ji2fIh10Qdx3NYYIlVQuE0YgK3aIrRqa0IOfu4QrPlbZ
         Pz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107376; x=1730712176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=FeiXfpLpNnJvmMSLQeH+pCNBbspgvUzoCYfCRqSPCJgkZux+eLnleEBO4VJ2WdDY6d
         O6B90vXqxZ4qXFOGLM6Ls5XkFwqIfkHBfWHGzz3NnHr2DLdwXOIWSD8E+768YthOZfqd
         FCjExKYKUK1HHn/E1wIc+BGbDD865mRp7/pZkUz7pem8m1U/ify9CdcN3SanUN7b/vGw
         Poa6aMlL5hset+YLT6nSWyG+U4DJJPYge5tjB0aVEamUtZp8viURMDslN8LY3apeJZ9p
         tZv0+6YD+DL7HTjyi8UpxWNwHBfb2o9g8nni7IenqT262RjhrFnL1hgTJy6an/w6hrru
         0rWA==
X-Forwarded-Encrypted: i=1; AJvYcCXACct4nicpvpwunYQLXG9QwH8Qz2VgWXRML1ZknWDs5Dm2oCfDSahpXJPDFRs8J82yLmlIxd65VyFKT1GoDjmG@lists.infradead.org
X-Gm-Message-State: AOJu0YyuGtmNpRESgUuP3akbkpBQZxyZD9z57mKM8n/p61JRXqAQaQ+9
	IU1h3GpvrU6tAoUSBn/IPKqxJdLwYAk1tSApTzfC5vcywcWV9JqH
X-Google-Smtp-Source: AGHT+IH4Qn0DWlrgDH6dSglOEm0aPX5GaLiU/VFtyCehoRKway/fv9to6M8P70PfL70BsV/WQYkMjQ==
X-Received: by 2002:a05:6512:398d:b0:533:711:35be with SMTP id 2adb3069b0e04-53b348e154fmr2628861e87.26.1730107375577;
        Mon, 28 Oct 2024 02:22:55 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:55 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:31 +0200
Subject: [PATCH v4 03/10] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-3-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1128;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
 b=SO38jkxxf+cL+EcxaLHg1ull8iFa1CiKhCwNTDWNov2Dn54a+i9AN0q6a3EOBeY9WbvQzHvxA
 1zw91RduGl1BEgyim6tFUDcRRRk/t50MSPTqUysznPyF40hunoElSuS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022257_459004_8E5D1FBD 
X-CRM114-Status: GOOD (  10.19  )
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

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.
Exynos9810 has 9 total pin banks and it's similar to other Samsung
SoC pinctrl blocks.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


