Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BC106F2F4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=; b=aNvc6xViwVjZSvMBpG3CYcreXa
	Jpb13FaB5Wu/Z4hhXeo1XbWTux+c8/hVaQuih+Fp52wZe8SK4gvMqNJguFhMlRQF2WMDAyGTzN0Ef
	pz5mRh3ttgODdxm8Oy0s0rl3q0UVSmLv30GgN3eYNwdDP3QkFmu+zYAvYpglCfCF8MOOWYLFHT8CF
	xKg5KpmfOc7OeystpIoVvXPvhKz57JtXA581Y9jAB8VFnuH5x1HoVPH2Z9pCUY9yjKm0kDJjhVHTD
	wdxLXlD8Bwr+CURsCzz7IzpiMyel/Z2JCyRiLmpYierXGovRwPSFB33Es0o71JIFj0GZYrputKghP
	DGboaHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foK-00000004zYy-1162;
	Thu, 26 Mar 2026 08:11:24 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foB-00000004zVT-2Qkj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so505958a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512675; x=1775117475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=HdE4hNT57yIbcct4s70MG2otVymTejDoXu7IRQXb/8DdEhPZUecSR1xsmAehJhQ3c5
         fs/nEoCRhSYxpxn7nAiOngLF4aGRDMuuiN+ICLUtle6En3okaAEtsNdD/2pnrbwl9Gvl
         pAV6OFz3rycSxDMn+pmePRjQ+pHzkUHNh0f8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512675; x=1775117475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEBDbGWMGSNIllBw+P70xdFs4cNvWJCEJNsNL7NIicU=;
        b=STdWi39nyUDg77Ea3WGR63n98C2GX7kW9kut+Xpv7CyOnfeTNGjrtc4RU/0Nqf9dLC
         Ao4yvP6iKldGwb3NhNctoHq9PPhgMS3MsEDr8n3UlIEqXtBaSS7p2hwuMQiX5nFwGZSu
         jEjo2qorvtdu8yIzKzCmptHplJDIkvgzvXESOnbrWixRk2afNMEOIwAxX9mOqMISoQY9
         Y4zgwWHhj55CYJFybcl6EirxmPcKvrqYVxArW48/LncleZnAKjjcwA75lKiJo7KkcWhE
         6alJ0zWVQrnnfVo0NpU2Y5qeHLayhTBbijS+oc07xSnpos1mQksAWYsuAv27/RMwsEI2
         kPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzEP6z5ICMyvS4ThgxURxjNG7McLftdCgrfOqiMb8GCyuWTmyaNHad96jTMHUs7u5eEdGDC5cDRMZdhRb/9uuI@lists.infradead.org
X-Gm-Message-State: AOJu0YzHwmJ8hc13ASHEB1ceJye6uVaMCC/94R6ZLLMpDcty5i8av0yI
	3Z/0N1x1TrvUo4gU5OK1tMTYFfI70KTQwnO6grU+Lj9c6mlssseelSDnyJOW09SONQ==
X-Gm-Gg: ATEYQzy1KBogJzLB5Ah1tbSUT6KKlYrAslwa3O2513W1U/wX681f/eUep+gsja44BWk
	XhKEMY64CpamfyUtIK045Pc2PD1zZfphhwsX0Cpl3wa6s8KkcMmcdQ1I2jSHoqSWYkJ+mXtjdEo
	uKumQzEkUBlNwt6h7wwFua+CDKdhMlRhojq7DlwX9TWzE2sQ8nPBGUijsSccerwof8n0v7PcitJ
	5/qieUux4pQ+8Uazdya8OQl/wA3CfWR9O02d3mHoSxOLe3HAneEDDtYM7ebjeyM9L0i121S6WaM
	yl8tB6Y+vqGRHZ0NKyju8Q00uQG8dmfQSyfRnVs0zF0XwDRKljXJpZ/yTdmVAdBGfTV4ec2FG22
	V1juf6FydGA6utZjeJqb8MEAxD8Gn7uBW2cYHp2jqeCaqKzadIzIxb93H+PkMrQ6lwRNRCjCjFX
	EuHTqhDBNgb+KZjAQSoOu9qgLlSkFcG8ISUhryzsmQKcl4nmjYb8H6dtMpaVAvaSY/jXBkSIrsb
	Lqvmtil
X-Received: by 2002:a17:90b:3a88:b0:35c:9fe:a58d with SMTP id 98e67ed59e1d1-35c0dd0949amr6018363a91.11.1774512674744;
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:48 +0800
Message-ID: <20260326081050.1115201-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011115_617689_12ECA782 
X-CRM114-Status: GOOD (  11.01  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved *-supply to top level, same level as compatible
---
 .../bindings/regulator/mt6315-regulator.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..1c63265907f1 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -25,6 +25,15 @@ properties:
   reg:
     maxItems: 1
 
+  pvdd1-supply:
+    description: Supply for regulator vbuck1
+  pvdd2-supply:
+    description: Supply for regulator vbuck2
+  pvdd3-supply:
+    description: Supply for regulator vbuck3
+  pvdd4-supply:
+    description: Supply for regulator vbuck4
+
   regulators:
     type: object
     description: List of regulators and its properties
@@ -49,8 +58,11 @@ examples:
     pmic@6 {
       compatible = "mediatek,mt6315-regulator";
       reg = <0x6 0>;
+      pvdd1-supply = <&pp4200_z2>;
+      pvdd3-supply = <&pp4200_z2>;
 
       regulators {
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.1018.g2bb0e51243-goog


