Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB844CDB467
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=des/YMvzXKFvsVSBqNlCoInqunzXPQ6/th3snijZ9DY=; b=YbQadQfj+sWaaAoJS3pIRjkZ4L
	saulWFynvPY4ZsSBxXw58zoFi2GauOmRXNiVplr+ztkYLZ0X0xDFOKWRHnNMQ5IVRIlzSBVganrZ0
	2XR33KLsQ72Hrr/WYNSTZDTMKCSiHosTOjPv0RBnTfNT7I76Gj4AXAO0qvIqaev6dLtKqx3Wq2pvb
	xONfBVH3ZLQZUzwbAk8RurgiYo1rUWz18TqYtolzndEQc2PzNLKajsDvszXGcrpLhW75UJ2XEbCM0
	K/e2q1dELjO4w057f5s9N0OG/KfQc4TV5nDLRkb1j0Q42Vno4lro1PG2jaIqTb8Q8QwvGV275RaBn
	yOKrwiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFe-00000001zAq-0hOz;
	Fri, 19 Jun 2026 04:54:46 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFU-00000001z4v-2RzH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:37 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-918559ee2a8so244978885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844875; x=1782449675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=des/YMvzXKFvsVSBqNlCoInqunzXPQ6/th3snijZ9DY=;
        b=Q7tvjdvgviR8wWmRH4iNbeGAzfQogXbEYncXz0XOOdebxKN/SMIDaldB5tpzzrNK7T
         kIaCy/kp3VhAJWh5E6fvMyeg3vmbsjVJCQKE5ILCtMoJ4GNd2DWTGTqGIvxxzfZDlPLI
         pYC1UowdplsnBIIzd/DTQbXtPbkkQ7X1cCs3C8zKhaYMTrxkQ8FYCMZR1nAH+Vasfr2/
         pzT3BzWiAH5IoG9KhSEXDpRpli7vQ3YyqyIcAHuVkd4F2PcaIe039/+6DOLATnLEriZA
         ZtAAgWDOGH8yuywU7mjH2j4znQkbZ6U4R+2hIxviaX323c8r4lXyZRUEozssTa429D/i
         U9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844875; x=1782449675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=des/YMvzXKFvsVSBqNlCoInqunzXPQ6/th3snijZ9DY=;
        b=D6E8+5GKLg+xxIHvEJgqyFM2U3hGeRYJ/Ch7xJYY9lpm3fWMAP+P8M3aJUibpx3Wup
         Z+WGVv2JKRk2u9R0BpKdpGG6HSc2y1jLSLQF34DTlLmBxQsfe+NRyAZUvYiOmr1wFV4Y
         4aTnMhk3vTjJ2Xk8+wO41rqxp8bilR3Y8niwuCmjkRIGzQku9CehjYmfQfWBpOETH17P
         R5Pw+FE14mXkGAk40PTRSTkYL66/0OxQgNPYN5qBUzTYo3rBEkwWrvl/PHvczi4n8X0z
         eJQMIlwWd/wFGmSmYjZPFxXVNkT6OiLXH5FyTXhN4X9SXa7JGf1siWqYwHajnWf+/SEb
         SZnA==
X-Forwarded-Encrypted: i=1; AFNElJ99hqlXmdkJSahtgmph/KfD25Vm1EBZ3FWGLT6gfZasBqhko2NeRCbiTvcEAjvCouCL4+gIX4l4Oc4TAQrJ1hOi@lists.infradead.org
X-Gm-Message-State: AOJu0YwNqH2jwnPVr8fmWPPq6Zv5ehC0kzgisba5GdTJcF0Ntrmj0z/y
	RUvtB6OMFh3D79aGzoVtoNYWw0GiCu+8acEKRdgpgdl8cjcP0jSL8Bag
X-Gm-Gg: AfdE7cnZ7EL/L452mmFHCJkpC1DCue0Zzgb0tc5nCinTPYVRVvV7uYRfUEIuzILkWck
	bICS6HOW8FuEpubc7ICf0lCVWgtkGpw7f8y/FAHX7b3KOW99odav7M6XnufI55h8dGNMGDZjQOM
	liIuf4nGg/35KaFgd8VssY0/xUQDICdE3OZfzsZ3EJ3EhVZWeQWLLFQXnZyRYPd+m0wHTzbWamA
	sraBsWegZrbCAm75FCwbSG2duOGXcTUn8LzquiOTy63+SOqsP4QAlilSoiTBl+/XRb3jV+6H7rq
	FjREpJBLsRUf4qXfI4hkpkanrG31z7HtjdUKMdO75Tu7Lyd0dHIvZraSG6ccBz2XjjiVjZzy0hj
	pq4BuXDRxKqw83TSzINvizdVh9W1gbi8BDLH5MMimHlFdTWOSPBVhJG5DF4rDxsHHJjBoCJhPTS
	ojPOEWRtdmqJMGXQ==
X-Received: by 2002:a05:620a:284c:b0:915:422b:fb49 with SMTP id af79cd13be357-92091397994mr303581385a.28.1781844875147;
        Thu, 18 Jun 2026 21:54:35 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:34 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:34 +0000
Subject: [PATCH 5/5] dt-bindings: dma: sun50i-a64-dma: Update device tree
 bindings documentation for A733
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-5-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_215436_719509_3798E3F2 
X-CRM114-Status: GOOD (  10.39  )
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

To complete the support for the A733 DMA controller, added
`allwinner,sun60i-a733-dma` to the list of compatible strings for
`allwinner,sun50i-a64-dma` dt-binding documentations..

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


