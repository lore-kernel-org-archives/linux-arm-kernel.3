Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B158CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lckrxo0Xz4JT/rW13ucWADdXpEaPkr562+yQE86m8n8=; b=VMjIRQk2OmJIGAJbRRg4f9TVIq
	9X3N3OyFwPRaoC19MDlyQ/gxyz87JYXj2DXxfDYNnrLURa8cgsOiqGy2iF7GU/6+pJT5KkI9Mv72j
	pvss9XMLgd6lzOBtdzqz9WeaCyJBjazt24EyG0LxXzrKm2dbr8jZAe1I8w2d+vVEsAi8iCqFg8EHf
	AWX4+3Fv9NlzLwo8IJN8uP39hLeZd3Lc8IsRjcQq1pb+GLXGESZD52sYqs2C5O4Jwi0brPAIQkJ54
	ILxLIXbAUgNbc9JGIJYUckUWmbYYLDYxBBhI3cbvpnPwdmAEq8TtHmvNEInyc2bSlo0fuSw294Qde
	+nWoFDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umofF-00000001iGP-3XXs;
	Fri, 15 Aug 2025 07:15:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoV5-00000001gCO-3qeI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:05:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7347e09so272574366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241518; x=1755846318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lckrxo0Xz4JT/rW13ucWADdXpEaPkr562+yQE86m8n8=;
        b=k95ZDN8RiJxP7J7MrzdJPJ6qPTySxlch7nHK4wYmdQVMyfFAqEcnrY86axD4jDMbQ0
         kvY8300aXP4WAHa+4m81PVWmBMBD9jXXB44kXuBlR91PXcdPZrLgLSfGg/Sz9zTfuAbK
         UAPqollmJWQKt7aWMTPox788YS8qYTSZ1eHUIJTKcFHJIxDx4HMUodpQK6XvV9zyP9l2
         Kf1mU8CCXCvcfhw/J+u2uoERvMvijQoCebJMPiyh2CvANn6jkiI7/VjGLKbzgvnANPim
         qWXBGtCcIrr+Hq6sdZe8CvcI7bhgNareZLbP7YgL3dpvY6ho3nvPEVX4gsjloEOrXr+H
         ZVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241518; x=1755846318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lckrxo0Xz4JT/rW13ucWADdXpEaPkr562+yQE86m8n8=;
        b=cMf73xsoXF+UGOxbu27YUJ1cuhQViDKJE9xtsdTZ3vhfLPmO9D0ZMH15U+tNTRCTvm
         +SlFDU/niiOIaB9+DrpE+JOkz0TsVsGDdVws28KJz4EgBQoSeRL7DqYw7T2QoJ+68Cpn
         YpOPjLaqWfGhlwSQ9EKVwGNZOGK9z4TnRNC/M/9DtDtxs2jujuMDvKs0Jf6XpI+Wyvxy
         OUMWjHkqF8H2KDkSvg4ZoIpRPELO5r+4qE6obmcvbC+/yGQQPki8k+GZs9+Ft3x/YUOZ
         4kIMfZSDe+2cbGM4pK5yFEwbjPsMGlk8MKDtneOcOrLQB7aIqLOuw8lmvOubmklyJWg3
         /bEw==
X-Forwarded-Encrypted: i=1; AJvYcCVBOmtNWqjmmK+Tsm2AiIxf91j18+qEi7BdKpTc7y19jLYrplXs+EbM98AzwdXiqNKNtqbL3ns7QSrysBjocJOQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzsOoHFLef8kzfspG18om/hvZAGw41pkha6l129Yt+tmnxR67pR
	gIP1cnNmY4A0UzHdYcqWKJPXNAP8fJ8XHyOJxJHTokbkyy4GLvQZqwsU3vvk7Q==
X-Gm-Gg: ASbGncudXVVXS5Nqf6KFcBssEbvdoi1m4jaX7LOENaQ9+/XGvCPH/ZMoJfQcX76CLr6
	XdXzBP8oer1gj042QFvjPz6HMG8HqLEBA5aJHpymaMnbmNrN2+CDQrtxdpRFTrtOFn/rDvXZZL8
	QkzOGy5Qa4kh/bwizgy1g+styuEdTexTyeGQSjJCgKr8ILv2yLGX1L8LpCAkt7xXxqZJZGi96ys
	sZ3rN2QIX4cb+JWX1F03c1ijr+22UHvqNPyw002ZGF4lx+lH8FK6yXBRFlhRFrjhk0XuHOg/4IX
	REf8BlXT1t9qzhawS+R46Sb4SJCOGd8EmGYSgG37yq3y+0IM34H4xLDMxci1mJ3uLuEBztIA5qO
	2Gq87kbLOmZCNbCuGjCXU+UOB5M6BqHwSRvGzuKlAjVqPXqfwxNXQijV2vjv876FGiNWuthpcxw
	==
X-Google-Smtp-Source: AGHT+IHdoKgbaywXOlXlmdziAkeTbaLLPsoCtUeca2ggfF4bp1BRhAF6fsBWunc30eaw8fVlaGaVxw==
X-Received: by 2002:a17:907:c10:b0:ae0:b847:435 with SMTP id a640c23a62f3a-afcdc334505mr80275466b.49.1755241518334;
        Fri, 15 Aug 2025 00:05:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: exynos2200: increase the size of all syscons
Date: Fri, 15 Aug 2025 10:04:59 +0300
Message-ID: <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_000519_957203_1FCBACED 
X-CRM114-Status: GOOD (  13.28  )
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

As IP cores are aligned by 0x10000, increase the size of all system
register instances to the maximum (0x10000) to allow using accessing
registers over the currently set limit.

Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
Did not add the r-b from Sam, as the patch is pretty much completely
reworked, including the description. Please send it again :).
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 943e83851..b3a8933a4 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -306,7 +306,7 @@ cmu_peric0: clock-controller@10400000 {
 
 		syscon_peric0: syscon@10420000 {
 			compatible = "samsung,exynos2200-peric0-sysreg", "syscon";
-			reg = <0x10420000 0x2000>;
+			reg = <0x10420000 0x10000>;
 		};
 
 		pinctrl_peric0: pinctrl@10430000 {
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x10720000 0x2000>;
+			reg = <0x10720000 0x10000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -418,7 +418,7 @@ cmu_ufs: clock-controller@11000000 {
 
 		syscon_ufs: syscon@11020000 {
 			compatible = "samsung,exynos2200-ufs-sysreg", "syscon";
-			reg = <0x11020000 0x2000>;
+			reg = <0x11020000 0x10000>;
 		};
 
 		pinctrl_ufs: pinctrl@11040000 {
@@ -450,7 +450,7 @@ cmu_peric2: clock-controller@11c00000 {
 
 		syscon_peric2: syscon@11c20000 {
 			compatible = "samsung,exynos2200-peric2-sysreg", "syscon";
-			reg = <0x11c20000 0x4000>;
+			reg = <0x11c20000 0x10000>;
 		};
 
 		pinctrl_peric2: pinctrl@11c30000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x14e20000 0x2000>;
+			reg = <0x14e20000 0x10000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0


