Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03FAE6F09A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=; b=LY357d/3Io9Zl8f4oyciFENMbU
	7ElgTTcIr2dc2VO1HJShlOQw85c7IrRFxKSV0OGeKAbV3eEveYS2LDRW7qdhzRrtvJn8WP2TOXXpA
	z/Z48QWhUGWJK4QwUmHWKfGUkyg4MGer86ogbCrmhuOpdOonPi3ALcw7+lPPClKyAzK03la95342e
	2u4sDJdAGwRmLnIlzKvvx8O66DeA8ES8zIBOAXX5NG8FRYwf4sKYZNa4jEJnomr91elpOU7Fkjx0z
	fp4fagpUg3jqVDMxwlXGH2OIPxFdy7Ywn8eaibqq2PznH/Pp/augZK/YCdSszNWgTspwWbo08KWJH
	2nJkrC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t72iT-00000008lDb-0HQQ;
	Sat, 02 Nov 2024 01:14:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t72f2-00000008jvw-1th4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 01:10:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so2051088b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 18:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730509839; x=1731114639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=nJBpfdd8M8eA05ocM4nCMj6AZWVBISq+pfHRUWnbAnJfZlmHBbbjTPdnkVbpSMkdct
         pez7ZfGYSS3nSej9eDlJ44w684AL1HwQhmQGDMDpNTJ3KrF9ZuAZUC/1EnqZsHPMwFmr
         mb/635d4oHxe/i0ebUTgUJXPGSwUVvBCA0qogd3bb0QIPao5hufgRBAhT1UzMNv8d/uy
         VRrxs6WuiYC+iyO9jGEwbp3spZh7LV1KOmTKn2mOzilv9e92m4pIYKhdPXWTxyiI5fCz
         nf5qz7w14RvRBX/eCu3ljeJoTq5HvM9jM0QvR/EsKo1jgDz1LpjbVMR7e6kbMV2o1PR+
         dgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509839; x=1731114639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7y+F0NAVhdE2hhGdAP0Oqd3utvxnAK6BbO2jtHkbzc=;
        b=ZL/sYX+cEnSqCzbwXnvHYieLgxzjXF5PSA06wrWkZnV1nji5a7m15Llz4eDXpZW0cG
         qIG+CNqAOY/I1bHCW3wfWp9TJ6SspGXl61254f55tvjOL2HNROen/K4xNTdRyolLzWcl
         tosjHTaWFTlOKLrIQLVOw3VaQ0WHZRwRfYKVju8WaBJLOhRvH2XBPVXQmn+XZq+myseR
         O8hmG8DXLOXx9JujDfird+xd4PNdfs8UvS+FhCjYPKWeVANJtbB4DNKQxLil237vPQAC
         GFxs3uWOv28me53CZ9x/flzAcJxhOaz9ceUoyxU96vtWbTG7j/8YQPyZLOcgOpRRHlJ+
         R//g==
X-Forwarded-Encrypted: i=1; AJvYcCXulmWBeYU9EG34TDsYND3clK489XZV/sQUNsrZVXr5ob8nRO9gWgfy37W41J12Rgj+zB26KOCsJCdI2fBSWDmR@lists.infradead.org
X-Gm-Message-State: AOJu0YwKYZtkKFjueN/M/rV9+aoX6nAWPApXHyPiGc/2JafMbUlKWr5L
	zMfkbMkP7aXMUc/KMYu9QJTsdeiQZOnKJlN6ArjMhgIOtDA33Oiv
X-Google-Smtp-Source: AGHT+IHcjcSgjEuTU6hZ1FVroEwjdUbcKF4FmsEf33q13uuam+xyJW6LtKMG454Bq5g6GFRLp/acrw==
X-Received: by 2002:a05:6a21:6801:b0:1d9:3a26:4396 with SMTP id adf61e73a8af0-1d9a83d6622mr32470596637.12.1730509838976;
        Fri, 01 Nov 2024 18:10:38 -0700 (PDT)
Received: from localhost.localdomain ([49.130.42.137])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc2c38adsm3287708b3a.133.2024.11.01.18.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:10:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Sat,  2 Nov 2024 09:08:23 +0800
Message-ID: <20241102011004.59339-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102011004.59339-1-towinchenmi@gmail.com>
References: <20241102011004.59339-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_181040_513671_CD05B2B8 
X-CRM114-Status: GOOD (  10.37  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0


