Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B894CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=; b=D1n7R832+1WH+3HB/24tShyaMb
	DNpUADt93wdVa3CdUKHoq8Gi36gIuUuBMtbtBeBWQzL22Vp7uyUy8aZmJr7pFpf+O4OsLEFVSl2U6
	isXxTvmblnxHL2zva6pQSC1/BM0LMraz79y3FkPCW6vCuRt5oIW05N9j44/zlCVpd08pu75w0ChB/
	ZiqQQjhD60wLJNzcEMkSXtNiuvN9HaXgRDOd4XYdgRyt0fB4GZxzlk6xbUQqq9H2aWp+d7TuEYR1S
	cBLQEyNeIic6aDhwBjHDuu14B2cuCfZQ8AGVID7Up7tGjE7yfK6JWMn2eYCHloQHEq9fOkEBUjzP0
	2Eey1TqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcc-00000004H6E-31dZ;
	Mon, 22 Jun 2026 01:38:46 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcZ-00000004H3w-2FQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:44 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5177945a279so40223221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092322; x=1782697122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=iHVZATXSTzIRqykCgiNOL3REuY+w2GK5YQOryicbGcbOJ1jj5y7Tpxk/2vMAzJEajG
         98s3RWgeRFtkMOICGGYIQ6YGWaGw8qQ7rsBZhlnyrRfTYoQn+8c3KCr8retPjbgu52aG
         LD3DSBVy8DYlVRdoMrIzrihhv9nAK1k8MSRTD95WlhZGpPi4kI8Mn1s9MOZXLP3YDLOZ
         w7VeiNgXvODff7cnUlVa7m1DReJkluepp5Lq6cdmkPAxuo36IYvHIen1IXgO7pkPQWml
         VAytIZGRkDusXrtaBzxOdlhU3rY2JxKG9DVEyMv9hFLYEzIWzdaZByYMlbc+R7sYqKKY
         StMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092322; x=1782697122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egN3juT3vo+m+4LZ0Q68Au8I/pA97hL0YrjeQoHBISE=;
        b=bXNyrZ6RxkeAahl7HBCjOHyn6ugzdfGa9qo4E9McX2IagGuoZm0ac00vJ9NvpOTC2n
         JHldUXq0EKE2rg+tgM7Q9ikr8HbI8HUXUKgFvG+Z1rByNVQFlU83tWI1Vn15UBP1dnTb
         ymSq+RFQYViZqGSgwh7Hxp0v/i20VyGBl5FHRT8e816TmYL0zqHi6vslTFP1JaaHsoS6
         /GbhPr21D0AZatNADoXA5x5LHrixFyUe1sBzs9hEMZiDxG4kISc2r8+F4UMDenQ5Y9n/
         IylQqbyMLpytF7UiosE/lQ3sPxsjTcb+NmG/hWHl4AwnPrd6rJEFR3FV3GBTwEkyprZc
         5apw==
X-Forwarded-Encrypted: i=1; AFNElJ+yqkJX9PcGltW5u8szf8WFNg7Ih0kyrzbyzRR50EU8ywf84Df0EsVww8R9Shjq9yymSJ2dbee9gJm2cyFDPNK6@lists.infradead.org
X-Gm-Message-State: AOJu0YwW8+YaX8qF5xi8driPomWy505qMSc11B6oRWWdPwCOkQkoDet6
	bBul9JsJNAdR+Kkoyuec9nPm2sOStuNJxRzE6ZgYiib4nYyovKt1jD76
X-Gm-Gg: AfdE7ckYSHBqmkZ5E6sJTb+2zfM39ovv6C/njLSnkxu2wiwC6VHk/vjk5BzAlawhv/1
	2jMJVsJT8JectKRjzygv3/EnBDKfvROxueCt1CW2jQGN/5f617LT3GWfxi7N4bnfnFBgoNF33gy
	dG9gR8J4AWQ0WR4aZw8sOVHBTa79Fvb4LRNL6Rd8f21+LE41OiPEPbkJtP7pA1yPiPPlZHXUCWJ
	kfvNX9opQAvzjEKpKNczrvxLzz2VB12jYXg240gpcxyFi0GfpDzOByC9ezl+M/77t5RTfYiinrV
	8NNd0N2AFhZcG1pSR3Kztk+r4Us4N0RDjzPDVE9cK/d/ZN+r3b7NqZ+PSLRqRgFX5bhC2u1164S
	MVB5Kol69k9svo+Yg/eB6Ahq2Ijg2G9sq5LWiT2Ng3tles/D3lbxMrfcI2x4JSLCU7NlEcxY8pL
	oP81F/Ir0qwSKY2Q==
X-Received: by 2002:a05:622a:1f1b:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-519e4a54ab1mr164968221cf.16.1782092322553;
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:42 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:26 +0000
Subject: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_183843_587054_62F9A467 
X-CRM114-Status: UNSURE (   9.97  )
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

Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
`sun50i-a64-dma` dtbinding documentation.

While the A733 DMA controller shares many similarities with the sun50i-a64
DMA controller, it requires a specific configuration due to differences in:
- Interrupt register layout and mapping.
- Number of channels per interrupt register.
- Support for higher (32G) address widths in LLI parameters.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index c3e14eb6cfff..1cc3304b7414 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -25,6 +25,7 @@ properties:
           - allwinner,sun50i-a64-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
       - items:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
@@ -70,6 +71,7 @@ if:
           - allwinner,sun20i-d1-dma
           - allwinner,sun50i-a100-dma
           - allwinner,sun50i-h6-dma
+          - allwinner,sun60i-a733-dma
 
 then:
   properties:

-- 
2.54.0


