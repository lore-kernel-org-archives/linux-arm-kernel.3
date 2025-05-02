Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1391CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=; b=MIHQ8VWuig/IOUU4YCo75xp5Yy
	a/sywNlf2PSVRlzFi3RqNS9WlL6KPT3GMH1+v10u8tMa8GNNoKnYzkw0BoZN7s8HAMXMjWsFcKlXX
	Bx7rBJIvkYXHLHkYEyjk+MLU6rVyRJvfRUhTW9KLf9L7VHm+gs3QCswhNI09lqtohqN1EMmXwmeUX
	HyGLWK0mjGbrGpyHLBQ+CqkqW4W79iXcE25AbsQdWjVw6pzUXVQOu5GfjYiXsaK0GL1b/yG+JLIqz
	zCmFn1IiTXvoH+DcEB3ZiIRaBZb805cP9RgyFEG4pirVh+qK9TjMnYsrvYYQ2n6HsQ8vEurSvCz62
	c0d9jFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApqb-00000001xt6-2bEL;
	Fri, 02 May 2025 12:50:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApnH-00000001xX7-40Ht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:47:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0618746bso12273935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746190026; x=1746794826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
        b=GUMAq5HnQORWKOWru9MqG8VsCSK9/K+ADv0O9bJEivW1QbhK/N+OlQBI7/AASG/A/K
         6j6oqtvsyo7uOL63k7Utqkup9C97bMOR07y+ETjeGt+RwaH/U8SPuHoNuojhtg9GF15+
         rr/MW3RqrIguqwNzYEXMmN195N/vN01XW7kf3t+LgSXBOvt55nM1CZJQkHICjwAvF1Mf
         voJ5lMQkHDFXz9vhnHw2YodYsvw2u7rgJKXU+9i2eICWUnmY6dsVCcQ2WLNKgbVIc/J1
         CC//yTr8nmL74lHpG9ohLJXRBf+5bYr/V+l2j7nIWx66+MMkxsX+qNAOeOJ+wgPvbwrs
         wBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190026; x=1746794826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
        b=Mtcs46GzUvcBMXkgko+iLf3USmsIvGQOuhr4Et17I8DLXnl+fY/z5kauqNXGidsSGx
         2Aqb1vuqUa4kjknmz81d3Zp+UkrPTX80HgwqVNAu3JKZuOrefzoIdvP6LjN0FTzzDKgk
         nQhuAqNqze/sHUr2xRzGykgSXfDYNwlcZS2Nt15Oj1RhpFUNn+pHh7anc15Sak/dUbEC
         3xM84hbVy2/FlKrQTms1juUqsNDgOmV0MhhICyOMAwkyNOVJcjg71aORe6AtxQEnvnDf
         V/0evv+Mpc/lCN1br26YcxQCt8tBhKEb4tK1SrMhbHaZTMnjQLNND5qJt/Y6HeutHo+/
         Tg0w==
X-Forwarded-Encrypted: i=1; AJvYcCXFjod8if4geC8UZvYZ4OE97Swm/I/OhTAonS6Jmb9Icc07Usk5Rougl0l6Qp9jo6uGgqpxFu4H0xRPtiBELhsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5UozrcTkOtTr7bQmK8rBHvKIB0LCig6ghKAFeaCGIm9+Qso8u
	EeQamX8BGGveia0VTXC2XWyyTDr4FmV0Wc+FHJuTxjl9GsWk1C1h
X-Gm-Gg: ASbGncv96RHqyXr46XyxdU9OBoaf+CfgESAhxw55Kwarah8SyEMVtnNpJ1jM7oaIIrz
	T28tWBDfbVsTh8sP4F5k8wjJ8JTJ8KjCDy8UQAzz5nGuk7FqjWQsJtXvW6AI8njG9QE2pSqnlb9
	hE8/9maGV8n3/vmMBESBYv2xxfDn+8UFoupypS37xQwbdupjFaSAGvEHTspOaAf/1ZLsmOhB5Km
	OYZ+5bxVIhvOkaCcBzN78iA6On1/fWg6t/+f+nVMl7+EgHj8H4FzMpbKMW3bzq/F61VYjWTA+q9
	PBjrpLScIgTTO22+XaIAG2niIgcqpFABeNp/35ckkfIG1C0wFH1hjb4jRojUM2vp0p1wGHvfB8Y
	=
X-Google-Smtp-Source: AGHT+IGligrngWzegbeijlkgnA144Fj0oT7CnzNyCMXUijz4fcNIQm7z8dwBSQY1cErpDIrT8CTnwg==
X-Received: by 2002:a05:600c:a016:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-441bbeafc6emr23873365e9.8.1746190026203;
        Fri, 02 May 2025 05:47:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:47:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Fri,  2 May 2025 13:46:26 +0100
Message-ID: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_054707_991786_BD2C6BD8 
X-CRM114-Status: GOOD (  12.72  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0


