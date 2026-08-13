Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4867C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=; b=tNWb1NQf/Ld2z90aDHtaAZnpdL
	NBw0LPQDVVV6jprjfbkmFHwm+1/JRyBpgTzWLEUwrSAkg7H+t8MT1QpICFVIlszpV6z7Fie+Zwkkb
	uEwWqxZobA8n2TMNOCZlUG0+ePJoSj/9b/Jq7BjhBuDjLVo+GfN2zW9dMG1lfrDKiJ5dRA8IhvuQQ
	2JTYqpgQ5EXUW8gyKOTuhDelrcIDO/X9TAUV2AEyuq+Dvo/Ds7cwCvolG4QyCowpl/yk1YhdIhDt4
	sklFt1iuhtARxQO7mDvvbkuUZyWEWLCI9NirK1IgnMu1pjNyou5PHSg7Pu49h7TkdsqIKe84yYRHe
	39jKP39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1P-000000017am-0638;
	Thu, 13 Aug 2026 16:11:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1M-000000017Y8-0aLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:11:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2293f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637466; x=1787242266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=p1mYrQOD7pDFdv0TX22V7g7Ih8U1dyqbcaTP3w9lgENTV1K8S4gHB2lM4H46OQzo+R
         C5gnhFsEMc92UloxGqcgROhgqolL1u7/aghlx270Tt1K50n7m5R0EJj5+f3i+B59gbqU
         Tj6S2+tGKmJikUTXDVDncWtjJ+BgdD51+cPIe3BWUeBfvL0DEZCtX3e4MAZxq9pKJycv
         5uQPlEZ6m7RTLt5Q5osEHi0t0I2R3dFMwOqah5Nf3gumZEErhiW72ufkjygYRxqGuQW4
         kKvZkF3i0FCI4tUNvkR9KjvDURHFOXRxG4naPQ5E+eKG12S8gBqrhLOA6ZRiM/hV+PXW
         GpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637466; x=1787242266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=QWLpzA8Wpi8KufKDtuogXDoQH2IhfVpASugxfedSyBCVh9t5QWZr4HiCo/EhCGnX1R
         kyYgvpKmfaBLbGBNo0FlFZuC3GyunYD1Y5B4jXZJySc21TdlLCMCsfMw9+h5L/stCfCf
         s882YJ8VK/eprxBJqmz8ymgkugTbm9Vsx1xg5l1fotooVm5QEAeaVnWr5oAWMgNqIILx
         LKLxa7HyCdMah5eD/3pIKne1i5UxhHSba4arlz6GBLeKiIv1C5IoZtjwj9IATooGRPhk
         LjoNufCVO5ND6rtZdzAo6b046Cy1J0ofeYbLRSnp4jf6tInshphji6/Mry+Hm3EP5g6Q
         sSNw==
X-Forwarded-Encrypted: i=1; AHgh+RogCrOPgij5J3cH6h7QI8h2wTFrvFvX1M1nd9HBormLCxxZ9uOVeWhWcs+/klZcNJ3Sdq7Sgc6/xNn07uHl2C0N@lists.infradead.org
X-Gm-Message-State: AOJu0YzhA6dVSQdWBtGKm2rdhGGJeHGzkFl3Sd/AyRctFKhkhIGCqJCt
	9avha5NA8JC5HLwK8VEwcPSnJWih1xJOh0QpP7NOWnA2Ky5H7LoOe1fJ
X-Gm-Gg: AR+sD11dIUxiCi3nm7WMrL4obzedIma1UUhtHn9UxysXhugjjFDbbb8jPMuHgeCF4/w
	4TuAuTihB7hYM0Q5nrsFC00hrK/vyWZm3H2+mXgmeuVcRFLpgs12LLHBrdS26kE15fAje92vS5s
	jw7tq1aXhoInSV4CFR0zKkDWuxwuWExqUyrADD2YyZZT2dsEvMiZNt+zv1BlWPoxDuhGyiPJ67V
	8BqkAluCDjCsDJyqBEVW4oq47+mh2JtANNUoEFtq1bhk0HB6xSjZ3cacKyRqJLDPHzLZXKCGxp8
	1hdqXM9cDeNnbMX07B/7Sx92PbmPAacVp82+eKHUVGRXOaGy/2KOEc5sbTmF2srTU+nHr/lJVzQ
	NNT9VF/RZNgFEplUpoI65dMc60/17np9xgIF61S90IJzOT1+lgDuirda9yZ4cULRDeNo3mX8qhl
	e6cuTUkHcKnJpgsdB+iV/M9xMMHgWRSr8zJtCXfTIhHSpRlFE8X0lrdY12CFPZP8QDkg==
X-Received: by 2002:a05:6000:46db:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48159ca5c11mr7774631f8f.2.1786637466184;
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 18:11:00 +0200
Message-ID: <20260813161101.2274327-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091108_217329_55F9D54E 
X-CRM114-Status: GOOD (  11.62  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0


