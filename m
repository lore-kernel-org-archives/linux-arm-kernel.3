Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9028CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsawg+8GATdikrrlq0osBdEKvt3vbI0cHqtdo1QmEeU=; b=ELJ5dmz7zmbpkfdFvpaxioHG+s
	punCh4jXzedUCq4CZl5SsYi5NB+010ZakmdV8ssEQkLi5hV2UYn3RBx2vaE9bGjzK8hgLSSSoaqPM
	3WNWwfSwfu+NFbmv4RcorlfcNAqeVuDzOkNlWmge7iS/pnylm5KdmRuPD5YYdaY10c/MsFGfYYyH2
	GAkkq8rXFG7NdAKNqo83kyFHEtP7r94Ay+Uhe2kXDT+Zk8dLx+iinClxY92gh68tyenlKXtwjqJGI
	2btFXbUPor+FqZ4+7CwN2ZRw4WvtosRvFSjBcsDsf4inpjYpYS3Qc3eUdXL1DvxNzyxihjm8jxZ9K
	7nq70CrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2eW-0000000BCnE-3RBI;
	Mon, 01 Jun 2026 13:26:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2eV-0000000BClI-0Fnn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:26:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so1755493a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320358; x=1780925158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsawg+8GATdikrrlq0osBdEKvt3vbI0cHqtdo1QmEeU=;
        b=fb8fhCjK5ROwIscxjlnoEgbb2whys7iUtesZH16jBunxBUJQlE0pmdznrrTtjEKlSN
         FyjEzZkJ+jEsI5ZhkZyLuX+ZfAOr2quwc1zlB93Ppg6Bg/kLEYeT7EtBaXgv3bO4mrn/
         DzDNs6I33ZHuRjDvFEx/2r0J58R4WhvkDtiZggfBt/dW0hQkF6dcomSn2Hwqwp1yvQte
         TBBnNZpyQxDGy1BeSUSPHk+gQMuBNvQhWbtqQsxLowLJofViaxprJ7XlzzlJ43vTcEXo
         gEpCw7lVUjzTrFKiJQ5h6WYlxNTL6fNXP4TRbtlhd/8nC6XdHVRTQVbQ2iaQkZG7q8p5
         QQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320358; x=1780925158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsawg+8GATdikrrlq0osBdEKvt3vbI0cHqtdo1QmEeU=;
        b=KtriLGAbb5cI8yngBw0xAe6QePGjB14n+s8RjhQULkgFrxmkXccqXntsAh4oXZas1S
         428SbFuc83AJPS0YvGQAzGcSjrURlywW7WU2Uzpm3WGG9qYDHA6LoGWyg/cjnq2Qvip7
         EEgWAM0+Hxc0PTxeE+KZCiWW2h4J13OAjI40zw+QF7wENbLKOpWHrKxguQYpopel2HyL
         8giQp3RYQZ08gpiMZdkbuwqHlUYeacj+eBefXYxPrMf4bWMKxgniRWlXR2KNXiyrzE+z
         e1fpW3RmGzKzMEq3YCgPPkV0W7v+SrFgAumIZjxdrtdB8omUSJ60JLMbb5hJTnDI4SC1
         vVCg==
X-Forwarded-Encrypted: i=1; AFNElJ/lA61EvsmCm85AJYY1aNbAy+XLVrG2YTBVWLq2qvqC0tqJlP5/bdGhWXwg/hfgP+n1yEXzxFkjYXd/y1PlV0l0@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1iywlF2lx7tTVhFpLzP+r8718dzrDwOeEBjzV3JAWlIFokrm
	4QcFiJ/eH0f9wP9N4cHmwHoYSsdI4gePCI//iTnH9+mX7v9ZVX3rkQkIT35scTqOClg=
X-Gm-Gg: Acq92OFjUxqecWDQ0khDFtXjyk31zqiVi7gmiwF4lSr0Q/QmVUfBS1sGVpI5NKfb7TH
	BP0gBMEuxF4sgOv8slc2cAQ/9l4YKmcCyfet/Kmxub/KRKhrIyLDXkqnjla9Ci9DfMvYajBuUdL
	bdeVO+QxFfSz8Mu68380MYffHpqwD+s+WpYKHsiP/RPfpXZTCK6zfsf51Yb0aHvsH+YJHT8q0IT
	G6B7y93f8FMwRLGUO3G/wpE2u4zQDwIrfUQmnYWBDhBu1mZXwNY5VacYCPEwC2wlSX7eq0Bv6m5
	hfoV6yntwPz1YFSfD/YGteL+4v9GQoWRKwHwZyPDrpFsqIu7NysOxOr0xEm7TVwogZLxnn/LmNr
	klKrKZb+JZ//BW0KWPQR7SLaocIwOzk0AXzteRPdh1OexfhdtQ4Mhuu6KKxCZ8ZDFJXNWhZrURd
	BY2d19fz8wsLx7cp79vC9LlcOnT3L9T4JRoSWqe6Jg
X-Received: by 2002:a17:90b:3c0e:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-36c4feec3b3mr10341353a91.6.1780320358238;
        Mon, 01 Jun 2026 06:25:58 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02d0a22sm11444234a91.8.2026.06.01.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:25:57 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 18:55:29 +0530
Message-ID: <20260601132529.139172-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601132529.139172-1-hrushirajg23@gmail.com>
References: <20260601132529.139172-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_062559_107323_5F6CED54 
X-CRM114-Status: GOOD (  10.07  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC, and add the vicharak
vendor prefix to the vendor-prefixes list.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml    | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3


