Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F695CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=; b=i1jxT6J8ImmKCEml0/TRHOF51T
	hWUY6OTBRXp35aA9V5mNNScH7nRx3dQ7a2TZJ0Qp9ONMwmvIA5Uds5iOeiQy3XzivKUGxQKsFjL/L
	xysXQRzhHm91HhOgcEtkaPddpOWeaylN1xwL9dEegO0KUo4ogTaxPs00zg43OFJH+54s7yb5ESXHI
	64T+v3VPHdWKdsWBCDnf1l+bL6CvO1zazESiG4HodI1p2PTYnnJr1XYOyQK5IXyVBxNZ4aHewdo/5
	pOZp81DwAvJzJD9YnUIkGCw8Xb5p6GmyrAvMrrYln/M5UwdRK933jlF7lhZEUtJU6OLXIrMPj1ndm
	AjUZ6tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5P2-0000000BTRb-2bAK;
	Mon, 01 Jun 2026 16:22:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5Oz-0000000BTP5-1U0T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:22:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf22d29dabso25117065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330928; x=1780935728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=oWVJCkfvidRwx0j1QTcx1g1nGyXNabURUJoadMTJ+afk8gjReMRkJYpyLUWO0PkyLJ
         yGwSTAdTiEzRdtpIWeG2ZYPvHB9YcyXnK9K2z+5SaDl5mhI3aNOCQgkch5BkpquzZ1ii
         pRgv5jn0rlbeAtfJxZmIcYRPKpmJ7n7vmmXjOhEVwpfue86iGNnCAOxmm8Qx5aVsb6T2
         XzSI+vwj2Q7igysjYps8sS2urtwIU0yPKnNxqS3W3AHCbobaVCIaFBjSfkQTAglJXiHE
         ggJKrk+ExjrNr7b7DoatMnp6gdA6/9DqprQjAvKn/nCgm+Q8NkPHdP8BnUvXAYX9eroK
         d43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330928; x=1780935728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=g7tJizVlkjEv2IgRfac8j0F98Twr+Z+VIFeMTmcifI9p1oR1MJmwYNlRYtD7mX1jxw
         q6gYNd0urRs9ZZ7ks4odLRwRqkkdSL5iuBecYzj9A4mH0VAdl+GP6Wknn5y8NU0lRadR
         IXDMovdsNzgrz3N9/UT5F8ZTpFv9URkijVDa2dvOfqcCWFCi02BzCqpvsVtAMtten7GR
         XdzqKbFPKSleI931VZ/tPvhKR1E6zyvggbTGtseH/DzIw8QYXEz1figmWiwp+n5eJg9E
         1CMvljl4QeRQI1satJfT520wjtzMETLO+dfO23Or1xH0rXYRc3US5uQEV12DFgNtg/EZ
         fgOw==
X-Forwarded-Encrypted: i=1; AFNElJ+EQWllkb19B0n4QqhMG50bjYEUweVG4mhoB35Jp8sxQRhn5AmQcmX85m7Ps78v5Ykgr6SZWRtk5D6xIZOx6tj/@lists.infradead.org
X-Gm-Message-State: AOJu0YwmkMJ0owyPvmLpRrzNd9XVHynEptw/LBswnnwRpO7RgJrmE4qQ
	4AwobxR/08d2IHgvG9nR490gt5QiFaORDVFcaP66MO0vp5ArM60hQqXM
X-Gm-Gg: Acq92OGMeT6uLFlRQPGNs7FgWIdrqY92JuTzCGKTFQsp9oGM+VlIrod39I3uSFtdgMA
	A46Rb9PioP/ls7LXluGk6KmdkZT3YYRHJZ8Q3liF6JVmOyVDrUbHHWMXMOxkvmuNBsSg3UhIkkQ
	glfX9X0xxSRSB3cfg7a2A9/O28WMHDn8+gPMfKlyJry+TkbFroi8HSPCQWSlaShyyy2ADaqKpqp
	3LnRqkuPSmksB0e5/WwJUTxctKHci6KBJz8DRH98s34SLqb/KWz/f+1FVWAnE86/GbzcZyELaAj
	Eq+3K+PISe9b8p3WUwTmDofTZP99knoW39xJRX9JiA7ZCXQFTtIucnATImOfF7cC4eqmtkBPj2f
	A3WzFScUJEFUammBtPRNkNShRceFcsFxPuODqw/OQJY3umjHLjJ3C4+4QWN7x+Z6m24TIzVj4i7
	JeMq7Rsqz/4uVIe8xQYSGQoU0L31yjz29b4c6saoUz
X-Received: by 2002:a17:903:2344:b0:2c0:aef8:23dd with SMTP id d9443c01a7336-2c0aef82687mr112227805ad.22.1780330928509;
        Mon, 01 Jun 2026 09:22:08 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:22:07 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 21:51:41 +0530
Message-ID: <20260601162143.170030-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092209_392970_22F18ADC 
X-CRM114-Status: UNSURE (   9.99  )
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


