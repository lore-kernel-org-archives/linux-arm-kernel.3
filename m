Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEAC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=; b=SpuwzfKXW4NSaDFg4jvyajdHq+
	qwBxGz9RPLFUaCySr+o9CE/XHJbtFiqsdxIEiKMK54q0QJwnFquL7Bus5B1nXeEFJewiOuDVseGLp
	3/801HP4NdeVEiJWO8SlTWSFG1lWLVgWYI+fufA8ooizw71eGGIlrbUtgahyC8AFOwvhvd4gE5201
	fabE1P0ipIP/Gh5XBIOLJDLGgAqh5LXGuXSR0BehMDNHQfNcplnP0ypz36SQFTB0mlp3gAb0xSdT8
	J4GLGRWhiosdnsS0FOedYCMy1kXcvL9FdOiY7W07F8s5Nn8xi5WAorEgzmzn+Kfo2SoJFbxKrQNo4
	/9gdUsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3Zi-00000001o8Y-4899;
	Wed, 26 Aug 2026 02:41:15 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZF-00000001o1u-2Vd7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 02:40:46 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-836c8bde2dcso5654577b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712044; x=1788316844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=jt1SpnIhpFsTYqRsdHohRN2xjf5jpMP/cZItLmCP9ocOoIQXe94J2RuSxj/G/Y1KBU
         SgtDYyCbi/WD4YSXacd1k6B9HYb94pMQbXyz8x0eFt9ioPEJqEXAKXkRQEQGpzEgtnSa
         Kb6JXp4W7gcTk4xGc4+bPUmrp9Cbu/n/qJEUg64BMxoCOtyO087ffdecfAjN4SD1GDXT
         rx/M7gNxrdDQzSbA4h1fCOpDxbSEDCy7yyAPBu9Yo7f3WOOypEdUUFjpUxXVm6VKzPrf
         3Ut1dvfcunmvzB89xCSpZl4N3qnsoUf3aX1vMQyIEUqO2RrfC03lL+FcF8MEqDUy2CBu
         ZlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712044; x=1788316844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBvIvGQQ8iDlLx9swcmCcNkQZffmEu12jGQ+ci/lSXc=;
        b=KUhWNZGkQILjErSFVQJJ/eaeCQGZijFvtw1O2V/bGqJ0c6H/FUSSq+8cT+XuGcfLMB
         oKxv72HTMLgkNQh67LQ0fYvrlW+pxdLzJ02EMeIP0ExWHpcUZU4XJEV+LcKT7364p5zJ
         y1V8RgZCsHZ6Fi9yRVhFK/hcYMhyFi13hj0AVepVZgbf+l96OT9yvAmAloro6KpDKTAj
         5qDaPttxBw5SPgzK+JUqBzTIPGn001AUvXv+lvDnSGw/mih9ZIWQLKZEutWSKVSYbMPe
         YGDBcZqwpBveGHJ6moA2eeONNqNPT79Rf83pukYIXmwumNpfX6uJl1rfX+f3Nxc2+5RM
         FX5A==
X-Forwarded-Encrypted: i=1; AHgh+RrB48ZjFpyW1BHv4LFRRt8MvBv+pZ8fWIWJC46hiDwXLOO1OKh23UvwE/bJLXGPWEt0b4aeS1wlbDKSGh/gPiyn@lists.infradead.org
X-Gm-Message-State: AFuF++l3adtYyHs5CZBZh0m+Y8QaWRw+Zd+ToVjcO2z+3P3f+n82P1lR
	ZR3bgtSakKlYVP/TeEsDHKeoKwyp893KSSmGrkPbnuEdarH1dj4ibuDF
X-Gm-Gg: AR+sD12d1vqIS3TVjZZg5nKAaTKF60AgKL72SJGTbSQqIueVg6YSGIjnMaXL5EFQmEg
	ub1W1fge943nSks2CBh0DeR/AvsU4CQtAJeCnOKJCfvujueKPVY9Bdu1xyfEZ0/x4R3qorCz6eR
	LLUGm6u+vCUoOQAQr5ILjAgSEVJ9pKObWw5lw80x416njeh7esQ6mlxX2e1dVsVzRSMFogeI3pM
	WtX3DkyYXrxeUGHfuECW3iZmKfUZRIYGupXExku3DrHEJCg2h+GliWlPqq9J3nPRHG3lVi+uTBp
	7CM/OacYJ7ntNfIH2klKTpQVK6Nidd0zlFsNgRVqGCRBJxyQc0gms4fZLULXn2WAwBP0t9j+9Fv
	GOa+lBz2uT3Yv2g5FrwDRDfqTOGXXWp4YGRbyPm41kGzteVlJNEKjg/zNNHtiAbr6+x13mJoKqa
	0WimLDkPrws13jtaWBMWw9rGBUt6OHu1M5mmPMBuzutqQWok+RaTl0HPoktcWPcQ==
X-Received: by 2002:a05:690c:c3ce:b0:845:ddf4:a39e with SMTP id 00721157ae682-85740497985mr13245667b3.30.1787712044566;
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:30 +0000
Subject: [PATCH v5 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-4-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194045_665045_FDA1A7CE 
X-CRM114-Status: GOOD (  11.26  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0


