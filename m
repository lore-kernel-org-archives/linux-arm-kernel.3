Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FF6C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 05:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=; b=h4J3MA7i4Uku7VdXOGMHm/xL45
	aNhJs37g5wQuXDNjCqUSwYEeEArjwFFvjMA7SqVbt5bKGnAvJPLMvLqJ0kVsSmfy9x5yXAok5PH89
	oMk8uRXH3ZRGC9gpWghD9ZdgZtWrTNeDrLr/QBLz2hQu7QZeX88Q+lE0dJTx51IMb4It2SHtHUm1A
	DPKD2cE22lCDCjB7rySApQY3jehIlILYJdmpm06xGEdRoz+zCv6I3blPGEjuXUlGsNHXzC5tV9rAw
	GZxdCMcrnl/nqG7MoETfj30dGm5tumnX7uWgtTD2l2Bmi6eH9h3QdxX2QYTwUU8ZZYI3RKfcMP5+A
	YdcL/XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ3lJ-00000006a33-0DA1;
	Sun, 25 May 2025 05:19:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ3jB-00000006Zv1-0Fqu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 05:16:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43f106a3591so623695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 22:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748150211; x=1748755011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
        b=kLbxIQMqy67o4LnJxWpjciuE89rm6i3t/MdwMja58uYSDD+VJOugHEsb1KoAHO7nFX
         1kOno6EHrZ7BzKs7914u6mKVEgihMYZRJ0hTHh4+VRQWjByTKS2ep0WzTLxLLkcTSwO/
         6mks43IVQXrvAX8H/iQT6f4CYR06Jm2ugdgw/DabYnMyBYxZecYnm1x2ueVgwZF1b9yy
         BTsDOZHLihvBcUtm7T9jSoWgxSfRnHy7ckc7As8ShzCb9yAcU77TbmCHcYuxeUq97dXp
         o3wVM84jewhnhHvLcM0+gNUNnXFApJKZbXfzl58AcqSZ8AYnPT269g6UddOhcnEmrE0j
         3lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748150211; x=1748755011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
        b=YtIfGLf7Eek/f1pe8pSoNmSA8U9hCM/zqybL1J5qs3RrhyrkrGVTRk73yVgR74Yxxt
         NSoKvZm4iLp99LGXGwFosotMyl8a/KpwVTZZeV8oFDZh6WXMl19w0ysXrEar1d+/Teyb
         bWz4BIz9GvDbVfUJqjdPDpB+xlQUztD4uRLPffQdGEkr1zrn4xqr0Jjy6bRcl5xnqkCg
         En5zh2Dv831TXS1pDTvl4WL42kPxZKFhXWJSPdxUqI0paYrkzlP4eAn+cNOq3eqzXtKI
         qSoBpj0PA+iG8seOQwNQfmo4G3ZF2vvsB1Qb1p8ZHR6CpAfyP3EYlWv1i3phsplZYTuV
         lylg==
X-Forwarded-Encrypted: i=1; AJvYcCXURQ4SlT7ptXdw1i34eeyFBQVGtqs0gl8pwPP2an1xccfumCfmPbe2DF8bwN1WQwW+nFjV5r/xRZH7Y5aGWnPl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2cx+NyYuM5Za6OO97YxGeZ4RyeuTkSQHQxTGfmdeDjTkwN0Br
	WLUqXS5RcpdJVJoWg3TDnKGP20Vk5CdyWhfnGKKjPFQPJmcFYhHTS3MQ4l2Nl2tIx54=
X-Gm-Gg: ASbGnctVOLBy0SdE1NFaiy3KkjP8ye0nUmOYgtuiDdQm/ADZbFTJ1M8pcnT+ARyQErt
	TQQzoXCITxkH2tRPBVv7yqkGeSUZ0q1oLJphqw9FZEoPy0TO+gTSrngtBEK3U7g16gqRxd7VglL
	w8gZ43wv9RDsU3ZFEE3dIDGW2OzQO+G7NKgnzAsNkme8wyG1J7Zb7aqZTo56U8lIBI05IgK04Sr
	V5Uj42T/ggmk98R1k3G2/xuqVIAfmzL+06Vgdgp7H624FDyh1uacxHiGh6EiPBOziVQCFT1N12m
	gDdjtKB0Dithgrd5GH/7MDgBZeQK50YEd9EABGYcekYhXm3S5SxW/hMQ6BDFKQ==
X-Google-Smtp-Source: AGHT+IF/jwowPMNweDb/B2JPyAKFGWGQxdc3mLIKIM4NNW5whKHA8bo7N+3jJruEbrSaU/3hrj+bdA==
X-Received: by 2002:a05:6000:40e0:b0:3a3:62e1:a7dc with SMTP id ffacd0b85a97d-3a4cb434a24mr1333037f8f.1.1748150210738;
        Sat, 24 May 2025 22:16:50 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d67795eesm372940f8f.86.2025.05.24.22.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 22:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Date: Sun, 25 May 2025 07:16:40 +0200
Message-ID: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+5c0VEkCDydqP+dJvv5yWg3lhMM2EDfhOnBOrhDfWlw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMqe34zQlzL+mH8sYednrPzCB+DkOTefFX/gsg
 CPcqSp2phOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDKntwAKCRDBN2bmhouD
 1+d+D/wO4XWtaSL5Qb2EZcmthSwwShwp2UkTqt4aV2OtyA/7xavezOOZEsI64ORhN+e6aSKIJjt
 8aV5tclmOA+GGI92SpVK3nLJUWcuV1gn87alc+VfrGqU8UfrsDB/lMef5fNZIaqIHJhW3uXoEyK
 jjSdxY2nwJS4tofa8kjxqmuAkmjv/wZasaEbDfw2YiTLu2wWCjmlmO3OsYM9z6KA3j8q1dnW7Dw
 e7tf64cBf5FP0xdNNxBNNWpqggwSqwryvr+6Vxp7GefHghXl/luFwh/31n4jhV5twJXdFX4w6O5
 BIFyepFm4VuMoDeHOXqQsnhUGEob2rU1GSpDzRHtodioeou+G1qQu6RZcRaXILpSMPMY8XTjKfd
 jVQA/q0nNLYctkBfycPA5OiavcADRTUJ5I6a7zUY+7nf689HDwiBzyF9DV6N9djU0jug4Qe37Le
 zzRBlrazoQT2FuQJY9YZiJWwXCG6lv83lYsMSkgHyL98/yTXdy0aHZl08HjdyICYGaHFJ4VnrOy
 0TsfjR0sbuBvtGme9HmCnlehtrp2kRR/gvMEGGAjNWaFb1ANYblR/W0BGN9CsWyiSQoW0Hzq30n
 kxEL8vcOovz7A3QtUcXlvRmkvPf56Mua848yvHoIncqJFWv3t+Ls/bLbqjXzxoH940UIYc7UC1F +hPx0ET/ieWU3Gw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_221653_117214_C00A494D 
X-CRM114-Status: GOOD (  10.84  )
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

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.45.2


