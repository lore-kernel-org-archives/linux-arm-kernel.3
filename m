Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B1FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sm/ZIdkSaGh1P4y2c0zDVUpHmGlbMlKT0SYr00OWyVM=; b=2AyhtBbT/GkI7QHSjFLcPchx7I
	b+kpFhvGIUBXhABZy9GFXQ0GnYwiYN1MieDdTov/kEZ8ME7I5ekn5Nprj/bzbOiU/0/BCC6wJmory
	DovJnpTA8+AKV/7Korqc7B6gqLjaKB3nP3YgJll6mR+GgqLuEpQKVYDNcS75rKCpVmejkj9CmtTA/
	nRz3VmU2n0DsyqpPvNhx/0HMeLDm7SIPhgwfJlxDR7nsdPqeHPeDUvbSdglv2oX8guOCye2HKblWi
	/BDRaJii0iz/AedGHJcKjkg0KwsSX0cxYsH5Jo2kO9tKcyJKixG+l+UwyDIzkYs7Y4dhgHppVmXkX
	BeN0GAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YWn-0000000Fvyl-0BeX;
	Sun, 06 Apr 2025 22:31:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGm-0000000FsxP-13jE;
	Sun, 06 Apr 2025 22:15:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso24342815e9.1;
        Sun, 06 Apr 2025 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977711; x=1744582511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm/ZIdkSaGh1P4y2c0zDVUpHmGlbMlKT0SYr00OWyVM=;
        b=YPJcA8wF+aF1RcBpVfCpJ59X1jVTDgzFqJWU12fRYzDAmolWi2rxhDuLbP3RJGdmqu
         d8WrvB86GQop43r0CNN5QbRHug2dC+bwooj70ZslDWz+siA3ptyreuOea9VrmAhLvGv8
         mZnvRb+EdQIZcgoetedsWjXg1KTkyjUqPgKBu0lHdefPXxdGnhd1hHCHZaWwHpMu1AzO
         dV1cZJMS4qA9iIv0KsN78D8MEoADY8IvxvIvSFwabsxa7KpVTKYrsahlTQtuv7/fWxGU
         iKh6wMdUgleoWQHPnNYsplxEl5jsFgtEhhZxy5oIkkABk5oENULhvKiNYgWohRONJu/A
         A+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977711; x=1744582511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm/ZIdkSaGh1P4y2c0zDVUpHmGlbMlKT0SYr00OWyVM=;
        b=kLa2VTzJkQ2JeklRMDSWNvRpAroGKoYynGYuTUspdpYE8ruC+DQPjC0GGfYS62QGrZ
         +Ye9wtPj29lunAxOJAvzZiyQOE+sSOinjnMdfyuxKzgdU7F5/x23txqbAS+7U9KmG9Ct
         6bwsqRB3xyNjcsjn5qLO4oqzTIOL7jZyV0F2MG0s5iMgCF5ZJKAM8TW1k7MmSS5tz5UL
         9RqVRJWPfZ0urVYJQgsha6sFQzYUlQwwuOJb+foSOj70+S/SKhSeskeI52VpefghAMes
         AnA/2Iv8r6Ab0xEI/P9kK55ntSCZ5oIYGNLXnxEMGARKmBCVF1twahgIwVzPxEigpRr1
         fmfA==
X-Forwarded-Encrypted: i=1; AJvYcCVgm5U0iNXyRCU6UYhXPzjW4aZNmRXngXRsssI/q3ZXYfZjEh2pzropaN8ZePCOiEv1S+JXTv7l5itnlKrdYdXV@lists.infradead.org, AJvYcCXAgphHMNc0qZID+ljoLBj2KdBvjftGds669fBBEbD09Yce75zROTPBGlStkvUE0KT+3+iK2dSMlPBtfF8rcdI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3oMUxvdXanIIO/Qv+FNwu24ymWIM/s14vVpdVqvje2smW9X+f
	6AhXOrux5HxuQtxmDc6RkDuydSJAt8O9Gu9g+ekdZ3TvK3OYQKXu
X-Gm-Gg: ASbGncvhhbvwaDncwc9AgKNr7fRMS6yJ61w2nZ+NEEhffq7u4uaVJbjCGux7tbj/twn
	jlrWtf5zERwtpvZcfP63vXz+dtVkQe9ZQHNNcwURcnSLo8WkjiR/Psa8vkxscZtrnPrplsrROF/
	A8JZJFHbV2wtMzu1p9VIIea2ftYMrGgwD1hFyxK5OXY9ADjOtgIrsZO2jzUZ3FNMCWaNQ/QLpJt
	6UYcSEIsZw4eo48IkHZnKe9qlS/do7e1VFOMnJk6OYT6h2PUqhEleHPnpwKac7lV4HTcHWSp0hc
	NIzbz5vIBZ8yCcxBN+0lmyxFIifUYBhvMYpyu0EwN5BQ/rDIQQGdP963SAwgjyVFqjeC3mUI4eO
	TOpcqSSUE7aecVg==
X-Google-Smtp-Source: AGHT+IHxaGvWEB3NGSJbMPNiv9bPepD1ALCIv/tPzMQD98V+RZ+Iyvgwi83L4i5nUBXgE8BY0b3p2A==
X-Received: by 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr116582275e9.15.1743977710829;
        Sun, 06 Apr 2025 15:15:10 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 08/11] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Mon,  7 Apr 2025 00:14:01 +0200
Message-ID: <20250406221423.9723-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151512_298841_11C7B57C 
X-CRM114-Status: GOOD (  11.28  )
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

Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
can be defined for an ethrnet-controller node to support various PHY
interface mode type.

It's very common for SoCs to have a dedicated PCS for SGMII mode and one
for USXGMII mode.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
(for Rob, I didn't ignore the comments, just want to
 make sure the driver side is done, please ignore)

 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 45819b235800..a260ab8e056e 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -110,8 +110,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.48.1


