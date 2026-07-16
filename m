Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6C0C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=; b=ZGNA9Uh5fzjmY81WA+aXiUIGSt
	m6Hedem6uIi67Frqq9cb4WZl1odiFDCjvxTvAub0xsMrQqXWzXYbi8hIVPbCZ7sTYaKzA0OF8H0HU
	4lEJ2KVhkKfq9164vfDeY19wbN+FP+0YeqUQr/yozYU61Nledt9Va4mvYu94Ofs5UxBYXnMG+g6+F
	aZrqJNiI+ZRGxNm/dWmTjAlEV8zuta2vlnnIcOubWm6qp3uebMiK9MBrv4yc4uA0CRoFNBqr47gin
	//IAl7aOeeZoQuKHpH4YO+m2/4TMk4xBlrM4NNCZYjdDyOiGkwZHh93sz7EbU5HpSG1EAl2YESFNT
	K+cNtT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoi-000000008EY-3MOM;
	Thu, 16 Jul 2026 16:20:08 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoV-0000000081z-3RV0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso5473258b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218795; x=1784823595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=g51SQfuOAWtj1L+/YpdGerBCdEdyaklV8dG+5ToGPsstpTtXjDE4Ndu73O6PNQ/gXS
         0YKL8OZzwkEwrzow9LyfrmBC8AubFGlRqsnG/IEYaIIQEsQVMzaoEwAuqjRjAb96GlnN
         0Chsroh9BBNzZCaPrw/dQflQ7v7thtkFq7aH+f9AFHbKcSCbQJeju4Y2U0/UogEI43o3
         umP54McToig4LyOhx3+NfBL6TIIE2lba35zYa9DNcAYoinMffO2X53uDncd+8eG35rHc
         pNqPntb/CyE24/jEKJwvj0yOXUZRw5zrm20mFeTBa9nBZUgDi41x+Hn159l/7jBo1jNs
         94mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218795; x=1784823595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=Zny20Ek0Bl0q/W7wce7u3n6hvjFr5ZWYdyKPWqq8WkO8v6ycXv2j/TgDgEGMfC0QFA
         Nl2mBxpESOwVamrEIy9KukzAOAGfSgEW6ejDVImPnTXcgxlTYMuujn0XZlcga11NBSmc
         fPGx/NTD0rxn/6YVEJI2WTXMpBMGoDFFV78f/YJVKYrTM30vz6CkTr8foW8VUzen/pbd
         uxbc0PR2kTzHu5PvJE3jVWJRHDZ1ILTdwEEileQii0qUJR2N9rQfub/B2mPZJnbvJIPT
         zrT/kVU2JgcbBXRY3d+RatyYkaP3v0SuegAx5gbZFer9d8PWCMYfVovT5j9nZJbNxVOf
         odJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9lpOz1SJl1/MzNcvUbDJaQ9asd98mhoCyX+MO4j1LxjPkr3yhBg4WpplgYBe1z4WJHGE/xu1S1Y/9OlPKaatL@lists.infradead.org
X-Gm-Message-State: AOJu0YyWILXDhZa58/BfiOzuAMyx47i8KQpuu1qTz+GUAiLeke3Rczqy
	1+K8gzgetxj3zPuEJR59RiN+l0AKwYgNTW/QyJPOjDdoVLG4kE8O3cNp
X-Gm-Gg: AfdE7cnq8kLuO+KkISEtQZHZM6/qlGjjqoCFJ1gAbmLtvraY371vifYXgBXvq/KJQ1Z
	8d6WEhq75Yk3Z/tmTkL+vHsENYMaEwo2Q7djcYn1DwR3ri9/s8mirU23oTqa0GjYgQRYfRJIK4X
	JbJi2Ur6C5cRtMlclwdNcYnL9oUCRxtQzw1tQu31ry4eEbUV/3R9hWe8gkhfPLywhRHjhndAD/p
	nHDqGYSZE3HxXUhwqh3wVC7wU5vq4pTdSYP4TR9lxO0ysm/6/Abw8GnfDsGROIfca2j8fcXOj2P
	XddHfzjSP49JcPKs+P9KTvmdJyKYF0NNM+eGgPWZxQSJREtR+4vXvysQ8DUNOK7FNjd99GJeTZD
	dy5y2A2xdstykSPb7n9EdEtZsw7nNXVIGQK2YPj6pKCEL+OKMU+Estnnk1l44rv0IzSQDaB6FKI
	rFfylB0h6qryHmS0gDJx7tjsu6YIHTG9u6ew==
X-Received: by 2002:a05:6a00:22c8:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84a559dd085mr10999832b3a.70.1784218794877;
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 4/7] dt-bindings: watchdog: mediatek,mtk-wdt: remove mt6589 fallback items
Date: Fri, 17 Jul 2026 01:19:20 +0900
Message-ID: <20260716161923.266315-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091955_858605_C79CBD23 
X-CRM114-Status: UNSURE (   8.04  )
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

All DTS have been converted to standalone compatibles.
Remove the items block that allowed the "mediatek,mt6589-wdt" fallback,
keeping only the flat enum.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml       | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f4eaa5f7c5bc..2411c02f1cb0 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -42,21 +42,6 @@ properties:
           - mediatek,mt8195-wdt
           - mediatek,mt8365-wdt
           - mediatek,mt8516-wdt
-      - items:
-          - enum:
-              - mediatek,mt2701-wdt
-              - mediatek,mt6572-wdt
-              - mediatek,mt6582-wdt
-              - mediatek,mt6797-wdt
-              - mediatek,mt7622-wdt
-              - mediatek,mt7623-wdt
-              - mediatek,mt7629-wdt
-              - mediatek,mt8173-wdt
-              - mediatek,mt8188-wdt
-              - mediatek,mt8189-wdt
-              - mediatek,mt8365-wdt
-              - mediatek,mt8516-wdt
-          - const: mediatek,mt6589-wdt
 
   reg:
     maxItems: 1
-- 
2.54.0


