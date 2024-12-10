Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=; b=kKzyHp7CD5a4ccuVXW42+i0mDS
	ULavd3kmyh9PTGVXyJ3wa3y/bBBnUoKRKwm6lUvouTIETEpX0bN8FGKQR+8cUMBPLCAcZ9zssme/P
	TtrpJG/wrjkFIKWf+Iwgqx7EegUmgWSp8bvADR+bbnSPRILMrtyb85DsxybWIuao+czGOK44RY4yX
	Fgo8XPRtrRlb/2kCX45UeTqQYXtrun8tXCMOcec78z73kEDnBRp6I8HlYl2oqwISY+Bcj2SkwimAb
	LToCXoP86Vy5qadPTVGGd04fT7ANeA1SpjqgrGzBJvlR2aWZmL86XiyDzcmaTsbj6y2ySydrua+rx
	pSIeJkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4b1-0000000CMAz-0rhK;
	Tue, 10 Dec 2024 18:04:31 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4Yy-0000000CLu6-0L8s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:02:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1114706466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853742; x=1734458542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=TStgLl0fHOF2KGphSE5/jkARo+CFU2hLOVCknoiXFcaRzco+6gy+3sEMJZX3cLfyww
         fqCVGy4FfZLN8YbDGRTgeJFRRoxz6o8ZJj+qpjfY3mIStSrGxojoyiPh02X0xHxOG+7N
         6HjiIP7c/muD2OnW7rtWafStqK5kk/l2bEy5WGNykGv7HxPpob/wdEwRlhOuBcIHVje0
         NEBLBxOM7lk6XUtifh8tYqV2kXgDgWJNCQxuEHsh/hUmnLEVQlFU/l/gGSTKph647zLD
         ITr+ALeUD4rlQOBseBLvm4bX4CWL6kQOing40wLGSCa4y0f59vSj5IrWkzr4rUXQjRix
         N/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853742; x=1734458542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZXwQI7YS6Q3F5RUIqA6y7OiUdvPTyw1jR4jWoj37sI=;
        b=c5Q1YxDJuYV68uRo2VpyshsoEAd0Gll/jXR6Llxo/71wvO8oB8hr0IPuNzCA1U2M0z
         bzm+z48j81J21xwT1liT9smrFxrYlh996sildkvRf/M1c1IkxtncOk9iIQaUY8k8DZhz
         /iEdjq2qL64+G31NRTD313kz4c+SpUtGpdKMw0et0qHdHGzD65BoTl6XJbhuL83+216m
         Trn+4VShek37p+Hq3NNWiz2tQfa28+Qe5xpIl+0VmK/nD3Uj2q3YDt5szgz1Ei5CqHSf
         OgWL04gv6yJKAdsuVLIXozOUFKpa9cPvyv3/zuSyym+rtpwDw/eyZQct3m4AZcjtf47W
         BIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUarr8pwiZC4pGAUvTBK3hdJ9K+bTyekLdD7ryDfGtECxLB8MjlwNsKqxPZdEwybzN+LbQQai0dpjqtZbwae7nb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2DzGMUZTHJ+GtgxXl4RQqSOYw5gXZIG5vDRSqpht35EY8Kh06
	ICKxadsGpPYCfnHgv6yYaLpK7XqpHIGvw8G3oyhUHcC813BjfMh0
X-Gm-Gg: ASbGncvREVoMJ2TT0m5M7XkZm9jlyV8MyBcJ6/DlgEaA915UR7tZC7fvq34x018aHvn
	tDbpApuFY4NdA/IgwYcOP+YpvLQuS/cyD08QlxrE16ecdkMWvVlSHWQM1v7eV0bI3B2qRrFl1ca
	sp1K90KdSYbBOEwFJ79TSn9T8WeQWKdnoVbTtL0IifET0bCB1lmNgQhvemBwaDu4mxfS8PQlSLc
	A20pYxCOAIYd/kuB/WIISNLn2j5PD5byUJImG/zPAJDh0v3Pov9sbsW2Ep7hEPmCECTGefpnMTP
	2rPoZgD5H7ktroqmydcq8LeK6K6IIQ==
X-Google-Smtp-Source: AGHT+IEC+sHuk12I+fxgj70sSzKLNbgdxZmltXdSj0c428j3LQYmmPpr+f5+VpccA3NjQUiUDdy7BQ==
X-Received: by 2002:a17:906:1bb1:b0:aa6:5d30:d971 with SMTP id a640c23a62f3a-aa69cd37734mr498078366b.11.1733853741535;
        Tue, 10 Dec 2024 10:02:21 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:21 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: exynos8895: Add a PMU node for the second cluster
Date: Tue, 10 Dec 2024 20:02:15 +0200
Message-ID: <20241210180216.398165-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_100224_122183_2A0B159E 
X-CRM114-Status: GOOD (  11.79  )
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

Since we have a PMU compatible for Samsung's Mongoose cores now, drop
the comment that explains the lack of it and define the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index ee393f4f0..90b318b2f 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -38,7 +38,17 @@ arm-a53-pmu {
 				     <&cpu3>;
 	};
 
-	/* There's no PMU model for the Mongoose cores */
+	mongoose-m2-pmu {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
 
 	cpus {
 		#address-cells = <1>;
-- 
2.43.0


