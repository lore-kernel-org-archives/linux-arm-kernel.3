Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A6C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=; b=rcZiqIA2PdJ40/kLS6lew/extI
	E1NLcHLow83byXNg2ntgjsAJ+Bzua2TtMNdT8FSH9Nidc9CXUPyq5HCxpNSOlkvSQOgKagqRwCQ7R
	amtwzx1uw0QL62J9IO+aG5b2gVUvggcwymOPJFtwVY0E1Y+1gjsvfUf3Jm8SqJ0jsLN9gpadHDGwh
	4n76hnD+Rs8TamyYXCWHHYYkueyu5ypD2Dc2PnaODa/clQbB/r7hukeLqYQgTZ2PYO0yE9fbttpiH
	HlVNr8ku1JLgYyerGqYm2hU+r1OC9QMN0E4SRdH+EK4tUDbYF+jFO2VXcuIUY4BGSMnscRY9P+aSJ
	UgFnQcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNq-0000000CgxH-2xWm;
	Wed, 22 Jul 2026 20:17:38 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdNk-0000000CgvC-3bHH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:17:33 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-667ef69424bso11116202d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751452; x=1785356252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=YylNWkkbX5Obc3OxpQG2vEKIMOxQI6FhroTcdR2bjxIMgAEWwG2SQL+I7qP4VP+lnJ
         1LqvE3znDFQwjXQJrXIB78UCqQp6KI76nbKoeQw6owHk6ugDfiEXxTRR8rnf7cN0qjKW
         qplXbOl8O5AiUIG63fJNTV8zLvRHVoLeLqlcoPC7jtTu1umUiSglWFcZUBWNrAUrlF8n
         uswr1tDDybHCKEoix75RSGTy4ZTiBRbItk7/FUSMYNhuIqtEYPrTg2efAlrPOgvySCkh
         Ed/kRcVTHHroHpj5yDy7o2VrgxUu+27hZqC2M6rc/0R65T3/wo9FX5oxvYZv9UpmKysq
         HYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751452; x=1785356252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=g7WEX6kDuE8pC9qnWGS7hPSeS1eFYhmBOmKWQ8vGU0l2710Ul/taaChxMkSmJsALXX
         FMPDqWba4bcfW9JA80Iln97qDuAtU2KA3BaVLDbAcwv+Ia4ABHMUzb7KixMZuw2MEkP6
         ac0N7TVi0P4mpkqZSj/tMmb4Mvw1jNM+O90MQzILTWpxZmHIa9jV44gj+HblxrcbNMjn
         7cFUid3KVvt9Hi3OKZfAzKEkEnLPSyQyUs3klfMolveYGXaTdnvYf8E3VjcbeVaJxoBf
         qkiSQ+visT/2eV/ho5gta/YwEHPlqUz4wKgsj81LWYiCndgpTyFukw+A8jgRtry+zayT
         1PKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6lt5sr/bjis0KuDf6rEMjv4d/zvG76iywGSZFJ8Tm7FGlUiPDCDCwG7Q8B0BsrvCmlXDK4xFQX7bqRT2SF0jV@lists.infradead.org
X-Gm-Message-State: AOJu0YzKLOZ2STwMaxjoJAKpy06aTqR47MbZ/ykCHOL3TH07/Sa0CkRW
	bz4zFcjLi7By9PGdA3r1WeWPx5GI+zcuIjAbkaQVYiXgfAIewOkWQwyk
X-Gm-Gg: AR+sD11AczTyjUEsULk62g00UMHNk6ovQ7xclryxWSK3fCk57lF4mtiDrJZxYDlJK5C
	cJ6dUwlIdZpk9rpYzBVhpEp/dxgZVvX7Sud+e0ZlZ1r7IYQFMdrD3Su4UDHEy8+9eoTYdXJwn5W
	zogqZm2v3NLGC8Y9WdgwnixGpZbAYTbzlMO3nfxIAe8LvSpjzBmo4jzxfvbIRxchlwLawTC+t8g
	7yTMK47Iov5sjRJ0DIFh69nMTCWmzL/9QlBo9WALXcwMC3CaPNe9IaSkhZgS+x24HDXxfAe2rPp
	PmsyrHhsb492O4rhVT+0aJnpjgnmlmybS8izyHoDxp2RoFSwvPqFoYI0SkggS9B1kAM3F1chq4e
	VA50NPstVBhUu/cpG4C7yoInbhMd+JFn8q9JFpexuNHNRowti1ye6VERfRZk4z2DfozVWGhSqSD
	8lAGV1IPKoY1DVikdp/nQ6QlFrxkNlT97tRJCG
X-Received: by 2002:a53:d987:0:b0:668:9230:e266 with SMTP id 956f58d0204a3-668a4cb0f6cmr27020d50.46.1784751451559;
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 16:17:15 -0400
Message-ID: <20260722201717.2205609-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_131732_906038_42E9A36E 
X-CRM114-Status: GOOD (  12.53  )
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

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0


