Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19565CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=; b=h32vk/POWF1IBeNwMENivV/1aI
	rIv6TYgUWzJaTzI+EGN0Nx4Wr3ThB6gjTLylQWTti6J1RZz4NR7zZ8JQXPofY1W+cwcI0UMfsHREH
	qKb4Jr/pQIMzMvgSzvfOd3hHYqS2KaSVu/MUSgp+ddSbLiQYh9kXaZpY8fDZnDbaTedGd6+GjelPK
	MujSqCpELNqxZLcCs+S2WocG/A+KLudpBJitblEsEMpJkCffL+cQoRgTM1Y4WKCcYA6/BFwXdOdzg
	CIXhBmboAx+X9jv72rqQelXVV0MHSttVElBrASePBt8+bKhZBi37B0Yz8tnuVhUFMbdQvuYLyqXtV
	KCVOP7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTBk-00000002sSF-495R;
	Mon, 08 Jun 2026 06:10:20 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTBj-00000002sR2-0Itj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 06:10:20 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso1502782a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 23:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899018; x=1781503818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=HPKPfCAYzJ1RFR+BwHeHVXAbKNld/aOIGGXz0Yn/INwefZTbzAeWa6tM6EYqy8XKY4
         x0F/+Ci0724ReJP6BEudT7DR+zFf400s90J2QNduoRG5uM0l4Gejn3HAIcUWCxNuaeVw
         dIPWwDS1ZAgnlPbKA9d64p0v49W3CNkHANodbYJXOd/3Gbby0U11DveGBumBjFNrWKeU
         TnwkDiFJp+AwL5Edcb1mtM/E4OduozBI79ZlKu9v2TAKZw6N3ZT1EgBnFoMnY6a88tmX
         dDX0M6MWqAWFBxvnH82J69JFRcsoKy6G2NokMPdY9aE4CO2FhPJzWta+7cwrecVhdT/V
         6bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899018; x=1781503818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=lw0VAmfezrnE0nUlnPx37O0CkUrF9jqnCSRfQjSqvmxCNOY+3xPRTWkrHEMthsNUrE
         abhcBw2Gg1EsL3w5WBiVuOwFLaETs1Msx4DBoXcYrL0txvaQtPapX8xpa0Nrhx7d7vXh
         nTXt3spi6LuQcE6DeBKmk400goD6Mg9bTlJJGe6PWxZ38jYB+5chhL8OYuOpaTIkOWxR
         BWKBh69qZv7XWlaV0BP9IblvLHZLCdxKW/BUnigfr/sghWyLiJiedAFUNuPfcBmwnYrV
         mRpCjfRy7QeL3GRA4P4q/UogGUoBnT74AFVxCOYAiS+mcFS9Etmm5I5Uo7xGur3W7QjI
         1Hiw==
X-Forwarded-Encrypted: i=1; AFNElJ+NsDv0drHDhiAHYMoyhkhq/lXLJ7aZYB3rmgXwGY0l2yn9C3zblJKgH3snWlcUlkb2rui+rgfy+q8OQHLEbB9O@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0GPHJXg5z9AFI6PG6TnIu1t/W9pN1/dbA6M65w76lV5lUF3qn
	zCIfj4XeQbTtNwtIhgYUdCVMJ08z1L/TwTUHu1XpEmA2IHkXp5kLHAuF
X-Gm-Gg: Acq92OG4v0lXesrJhzu8wZMjML5Wox2YZqQD2uwE9FlTyzRCOf8mUD5pZrXQLzQBS+C
	N37G8mu7NE+AseHLwyzop7lp797hvutxGNOY6uT//CwIQvwtOfoRPuGcCMWbFpDCpt1tR1hYSed
	GDLrHIXaloYi34zIp38a1F8shJGkoar5bUMcih7SnI1ShlFCb2Nwdc+O7rKe1IFHnoa8vKNsdvI
	mt/EHapan4U4OKx7aIPm6iJrzUOt+Fl03ExfbqaQLviv58prdtXsgk4WbpK8G235/W6NQHeo1bE
	/QVi6ncT0TZU9NaBI8iz9dI35bJ03v3GfmrIsuje8+uSF67CzO8q3YJJMCFEQ/YMuZGr7lQI+Wd
	QW7lezU36tyS4R9oP/cNUtf4UXkOD5ryBbPy74jZlAFshSY86CkLBfXQoU/zrXa+gv3by7p+isK
	h/AJoPRkKQk9Oo0PXPxaF0wKCDAhJ6yB2lGhgtzwE+ESlakRqcXrQ=
X-Received: by 2002:a17:90b:5583:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-370ef0eae62mr16087415a91.8.1780899018315;
        Sun, 07 Jun 2026 23:10:18 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668e98sm15065026a91.5.2026.06.07.23.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:10:17 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  8 Jun 2026 11:39:39 +0530
Message-ID: <20260608060940.52549-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608060940.52549-1-hrushirajg23@gmail.com>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_231019_395657_DD2F287D 
X-CRM114-Status: UNSURE (   9.66  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
2.47.3


