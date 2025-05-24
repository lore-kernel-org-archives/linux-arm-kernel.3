Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11DFC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=; b=ZkM0D2vTsHl2fITId2w+oNTdCB
	gcBFDaUCchpcFqvMeS0OAX15kgXfseO7EXvukM44EKYZxpso6JwdLwNUxmbaUvZhok3zTw5RxhiNO
	8mEThG4d1G5LWSU8r22h+wKP1+dCZ/TfMoXP5gqNfZPSggRVKv9pmOp/SD3hTWz/v81jGXnPh7l4C
	OoDBegFweUztYnP4oDm2w9qvIN9phKwyTU4Kl1KkED0kETN6s1k/cuiJ6777fXoOpHCcM99Rpp/3e
	e1cZuSi0QWFxLqgSf2/fksg2yD7DtCFf3QN6gjqn6/gkyqHmTjPs8MFT5yT3Nt4xGYo0bsvfBrgtW
	IWIqnRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhMR-00000005Jvs-2wuc;
	Sat, 24 May 2025 05:23:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhKG-00000005JhN-21J7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 05:21:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso79257966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=Q+ojvEV55jn5NBY1UeJ310ZbtFmKqxPm+g/6gPI9kI92XmEhy9jJ+wFh9UNpvGTigu
         I3aNgbfaV/oxKnT2X1TPZ4g6L5oytnH/mDrnJeSx8jGEGiziC61wWPydkN21LKx6/AVo
         mi/7dFakyfCKMdSa0JwQW9rB+Glw6Pyt8tqYqAfJcn4hrQGt6MaSXIqD1UlJRItF2BHe
         ZOJDZ7uGeQAlYWH4UwFv2vP4Ll5Bw+bFzuyyYdOjPOGypxIx2iUth4V723DePoycbyGR
         me3pKaN0zRuYzh8EFh+NGc2nPir3tkx1Y/4F3B54cY0QQKI/AlIZ7llGwIqnh/HOBF8L
         DRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=Gh7GxlII0BFbeDK3lMFRAzTVMJiao6ylsxBy2kPfVdnB76z9aRfDkkhJYyHmSvXPj6
         PnYQqsWLGsgJ40XbB/PX2CAvZiDbgkapjLW55Hn2nk34HCTzkaEYNUwy+tNzVN8UE1k9
         cuACWbaNHLh3wzvvADM1RNyqcRwoOrFahf3fuVrEXdyssbsaKJ15eh2kADKR4Brgfd1R
         514qwBOiuO+rSQ/GLuf7zGSSBKBVIwtPut3pWPxr+lzSZ8k7ZYT0EWoMhSPz0hzypkG9
         VQi9RQGeMI+YCNO5BiziPQTp5nOFaOJXZOyJEF9PfLdNi/DGD/ag54C3AYU5TyLDrhx1
         rjvA==
X-Forwarded-Encrypted: i=1; AJvYcCXNbd44Q+ABoXS7nW2jGoSeO45ACz73wAdfrLj6V8FVO4hIxhs24KrM1S3WbkyuVQ4qBQCwnKjwnzbyW+XJKYAG@lists.infradead.org
X-Gm-Message-State: AOJu0YwY5lYJYo3a4+96ipY8+32UPo1WyY63uNUoS+ofw9YixdaIag06
	VNhy5YAdOWQJxYLsbE7PADayIDP6edVfsKsEbS9V6JV0tdNZXSNTLm8fOHrkBsVK2FQ=
X-Gm-Gg: ASbGncvVLx1wLNC3kTmvMXbR+FoR2f9y2YeS+lxLb/hBvd3RD7UKMatsJaOHx/bN2sT
	iCVSrU6lFnfcz0MxcXKWwC5JiJqWv7IkUiUPvme8B6ZtsF11tXUnHReayoyhWfV1q3vTLv+iFdX
	PdoJHS924B+kG9wEgSeHj6K16gMUZkL8pW/G6C+qor5iYaqC5YNA5FF8GhCvmimlTmN5WUhk4Yi
	Iyi7HAFMh5nWJj8VcDBB1tsOFlH/szZBxKqMImTvBDdh6ulPRoJW1KkuagdaWODkJUW4AelSkAB
	q0MZtlT+lc2kX3f4poFPGoUSTlyB3lBrA3VK+yqNzie+tjGcxK8j3M9uSsikY5IFaUKRhOUAeEh
	Z1ZoHC6JUqc8mVGo0G5G95ijK+T1DhKAah+PJirJJBbnUWg==
X-Google-Smtp-Source: AGHT+IHXaAPaMnNiBFZlXKcRr+qFufWpMyOC01eMRk+Jpj8a7drQ0LfzI9zmQlfsyWsV8hXXiHulVQ==
X-Received: by 2002:a17:906:6a29:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad85b1300dbmr126184266b.34.1748064098471;
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:28 +0100
Subject: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_222140_521537_A85B1FB6 
X-CRM114-Status: UNSURE (   8.60  )
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

Enable the Maxim max77759 as this is used by the gs101-oriole and
gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,

The child devices' defaults are based on this MFD driver's state, so
this commit enables those implicitly as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f3fd474911b7ab1aa75dc72d42614f12b2dfc54..07e5e76edcbd3fcc4358d08663f51cca00acd49c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MAX77759=m
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y

-- 
2.49.0.1151.ga128411c76-goog


