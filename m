Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2717CC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtIjaQYzsHOvXBRyxq6T6K4m4xbtRsSOUHx5wlzsFJM=; b=dYqMytoiJmDLpqkpAABWKv8HcX
	jOVwll5Z4BW4hW1+V/w430QagXFvzUUUN4qMqaaZjCsWBTh5u5BieVzuyla/GJga+HuWlG/lUg6Fw
	m28RMTLxrdYSUzWqlIooqxfHuJAumfaFqknW9MuwZiQ4MzYZmtunsh1HOZ8I78pv9rDnnmN/rau8o
	w2uZ4ND6uKRmVLZPTsUIcpQA9l4oVxMGj4M/iid8VBMqT/CDuR+n9aTRHFBKrlk2qgxGD1DZvxJSi
	EcMYY2d3igRcjdDjmJARgN64lH0tLWAGmCoicarBRhdqjmWFP74GTlJ+AwsQwXEx9ipDB0Yhz6TQL
	mgB6+V9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsR-00000009WIk-466R;
	Thu, 30 Jul 2026 05:00:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsE-00000009WCg-2CJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 05:00:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2035620a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387601; x=1785992401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtIjaQYzsHOvXBRyxq6T6K4m4xbtRsSOUHx5wlzsFJM=;
        b=iZ0dYywJ/1GxK8JTcwWNYMX7oRy3pyEs89O7/hZ9J4g6WY4YWv9r1PiylY7QFWF5i+
         6GFbc7hzSvyQCSPFYNkyJQaKyg+An6t9HPyWafiZGMuWZZEQR9vjvSrKXfhOP5Ja9Tcf
         YihMrWvcRhrmwybx4d/qXyQ05v6EscQXoE/1JlC6AFW853gjk06LiVsS3Z3lG315/8nG
         6+z2MKD2begv7VwboJLRLCcmVymMhoh008E1LsIiMqJ/80VB8UA2jaoBHqdKqjpKz1ou
         IGBbBCRMXFFpMtaT6EgOjNeGK+h05X7XLj87AgdDl4TyuhOGDsmTp335GVf+yazmuuhH
         H/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387601; x=1785992401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtIjaQYzsHOvXBRyxq6T6K4m4xbtRsSOUHx5wlzsFJM=;
        b=QM6xzwrcpV5mwuzcpfbZJ5riE4Ohh5t6830bhGkKt4JVbhQiXBFpwY4dzkAtL/g01/
         IfrDj5bkJqTstMR6pnHvUbMkyywtBT3+MQXtHl8KCAzKaoE2xBhhw3KIaH3FM1nv9RIj
         TASIlfHJLx9dSXoJnv2vvNSJ9vShepqFeTyZLcS3XrrXKvwFpJ+V7xETB+Uy1xoKWvQg
         u5rjgmtqTuq4y2NoAZ7NQRaRdoSq4ZoLgtqxlQktuQw3hhuUMF8dafrQKeEKduod1sa7
         y51HD4e7yvrYwlwwfQJYHpnKvdzS5Q1OE9dIn66S2PNQxqHSANnh2unrgstREfCJJuHX
         JG4g==
X-Forwarded-Encrypted: i=1; AHgh+RrwMCIRcXexsKzUciemRmGISE5UJ4eGIIAH0eFUrJ86aKBpBMHht+Nf5XqAurMcH/WmFHOD7IhZEDebhxcNs1VX@lists.infradead.org
X-Gm-Message-State: AOJu0YwhIh0Q3u/XhXjLoVGkGXdhnlXi7wAO6GROIFKzB4PIcW6nb8+/
	rp/Ld9A5BzWNWtvxiQ9zAEyV9wecb6lOGtllubT64i/H9b+/1L1yBAzfPD0fNyPQ
X-Gm-Gg: AR+sD11kfG2yv44KJAR2j+dfXmdexHWG+rthxJB0HpC1wxwkzpN5fuLcALwoq4vFo3c
	zk667z+6ZEgJ0IGoAK1vNn6gSJJZ86TJm1TNweT1dLlYbUeJ1UI48M3Xos+ZUVRzXzE6Xz7nMv9
	5Q/bLfgqx/LUOADhDtyuPiq8eRvzub+GcJytiG5JDS82S5NUZty3zilonlQUU39XRy+rziflXl0
	1PlUrSrsDARoWR5oWMrRLWR3vYWuXm7uQmTTjymWxfPZrcKckpqjjzt1lmN2WldsOoLny6QB5/R
	w3Rz+6K9dYTtkbMU2PX8zJqfk/t5mdk7JcezruRRsCW1PZurnor2HsD99A3oi1PtK7HtYK7zQxj
	lSu4NntJa1+LhfRJ+tqOCswatQMEkBZ5QkihcdTtkjw8Eq3y4zz3e38dEi87kyPuk6adnFdpIob
	P6uumm5WW0gg0DKO67F2eedoRVjxa3PvGe/b78FgKOlBWTQ0wR9txXr0TxS2XXJgCpOCXseln8h
	jqGXlc=
X-Received: by 2002:a17:90b:5687:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38f9bddef62mr1034829a91.14.1785387601561;
        Wed, 29 Jul 2026 22:00:01 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72556386sm14383898c88.0.2026.07.29.21.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 22:00:01 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Thu, 30 Jul 2026 10:29:46 +0530
Message-ID: <20260730045947.388660-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730045947.388660-1-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_220002_595097_D076446F 
X-CRM114-Status: GOOD (  10.02  )
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

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


