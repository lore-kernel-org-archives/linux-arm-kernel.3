Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F6C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUyxSz5c3/MDQCOI75162kYwAQ50MisZs/s81C016VE=; b=PExp7xFYSHAGXMNVS8r0yPFQ3c
	mLRZw2CSovinJSEN+Rbkuh33l6cHDMQeEuDw0gHaKCt4kdEWCG9rxEt+zhLPAkWO10TeOwu21zwyB
	5r2pfZi0vrpk8dJjCiN9JiWPZN4IB/ewPgam/oDXE5t9g8A/VK+l79Ppycibi00qIwP+6oL4m7+mh
	7tolZWOUYkFRCPeDtwdfvN2DicRoH12/ZIOgf4MTkJt3e2mYljw+GnO5sPEmxwTT36SimMHRtR99Q
	FhD1VHAmiKLj6u4BZ1LmP87i/hJfNdewGmrck3/t+kWsqZqwDYO4NPx8Y7MxURu8lR0wR95ITwJyl
	q+xFh0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7k-0000000AeQx-30o7;
	Thu, 30 Jul 2026 13:48:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR7d-0000000AeN1-24dX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:48:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1658672a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785419308; x=1786024108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUyxSz5c3/MDQCOI75162kYwAQ50MisZs/s81C016VE=;
        b=eAWEpp1mmd+UyILvr0aEU2rmOAyiQKlVZznjve6CzXK0GP4t37aC5jUSGJUGXwkPmK
         J2RvaWPIM3zBQ+sGEN8lnU6uOwP5ptgI1Ky+8qppqTZejmZwQ3FSndz/wAAcoSJtOQ0x
         Ta207DRkZ+KoO3DS6GLcQ8iiD4FwEQHAuCnGu3cqTspqOO8OdZ67KH8sOsBIUuNx4nut
         UTaXt4hlgPbyG+I8Y7x3oWlY3fZgBswZUokTMQICcWL8rZ3w2SHbSnSb7uxO6HF2Z5uj
         hZtdM2KgQcEbcvoLFQGILB1resJ+cyLQYDS4NkCQeW6Wti8spCHLcgLmuk6KELGdDnvL
         WpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419308; x=1786024108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUyxSz5c3/MDQCOI75162kYwAQ50MisZs/s81C016VE=;
        b=K0QVtWBm1n1K+5Fk9FptpdYP1Fdhizg6KAXx5+1IjJ/ua0chRWzAuqU5lxdqFLKbf7
         sk3HrUzrQxRFg5Qg/9fcK5nLw4+Xkl4Kx9u/p4VUfCiv5hs4dnAs4/zGVK7vTQjUKIad
         9MmjcA4PzExxTugvCaR9l93yPbWqnKayWZun7KT0dcPZMQT3Qx73E8g/uNLUBR3Uot/0
         4OOUrkiaIHIjEUf2M952o6Dz1XTE0rd6pXsK5jug+7hD6ZWLgCDCEuZ5EhTLd0xrQpqB
         weCY2XGYIsT3ChbWkDTsn7uw7uoSK6WmBKQdWKVXIqbpuLhSOI+C0dFlpBIoT1bSb1fm
         6Gkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9f9eRcRGyEobHHahzXqvfNZzkC9KEjVhON9T7nzM5mKmcsQHPTUEz3Jum3mVriPAr8uH1r85UFdzosccr/v8z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3jZ5+nBRqbmTqP8XIyfIkXKe4oWPZ1EPgiqJ9R80naYaxJ4iS
	bheHPjxRnoDlc4rRZVOILa2fWPGZ1DhT8CSz+vKeLWQUIsIAWMlZOTL0
X-Gm-Gg: AR+sD10R77GKN1Cakbb6xsgP3+GMkzmnoNO+z4PY3HRlPfuDJ3UScPnwi4gCt2vP4br
	/BnHTXsLGlbx8PiXKxCFA5B7QRqw6Y9O4WWL0YRGze7LMTMJIJLCZLWuJbbPHOklG95iz+FiDZo
	iIMTApBYv2unfYEMKH0Sfc/9smyrzkud6FIpmJPl/vfXTpLHGmP//pbqXXBUQao55UC8ZMoyiyh
	8hyXzBu1zRgzoTXV9fS79YUPREcvfqi0b7sakkJ4XxJOzF0izWUrCFU/cC0K0nnXRY8CgoiKBgx
	dXHB/re48yThpJ77pFdWm/fVH2ErVeIJEIXCPlcAJiurGH36NEbqEIzpncZK5nM8DnXHDkrZuVf
	5/ClGICVWBe9gDYzCCw520QBMsZahu1B1qKXXzAS74zu09FmnduPLwMz3Sba7HrNi9knyttwbZz
	sE9UgAqmKvW+DAPlBl5I/z5CgXTPWyYMbzUnsAwVhZoln3h9FyQcFDTWPaeHlFH2O0jwHv
X-Received: by 2002:a05:6a20:918b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c900705785mr2618493637.27.1785419308313;
        Thu, 30 Jul 2026 06:48:28 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b670dcsm20692047eec.7.2026.07.30.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:48:27 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
Date: Thu, 30 Jul 2026 19:18:14 +0530
Message-ID: <20260730134815.434654-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730134815.434654-1-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_064829_551247_84F309A9 
X-CRM114-Status: UNSURE (   9.76  )
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

Document the compatible string for the Vicharak Axon Lite, an RK3576-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..4e80b594f42f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon Lite
+        items:
+          - const: vicharak,axon-lite
+          - const: rockchip,rk3576
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


