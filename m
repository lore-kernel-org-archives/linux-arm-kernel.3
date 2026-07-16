Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8692C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=; b=l7nqQouSEYIg+CchCCO6KhDARC
	eojpgcGDbUts1EwQvEJ7aEemAEImDnH0stw7tAXoMIqyBYGAKXNqWLxHTmLZMqUG+jD7FJKFgKpGB
	+/Tgkr+FyrUx3AgimSAGRLGWTJkDdeMFXXwbxEwATVjqXpAr1MafMfY785SWbu3Yl9eB+D+EwpdSY
	Vtam9hHTKl+cNiKRk7/Ask0UKQRQ13H/yCd8Tum0wn1LY8QX+30NSYBm1sARDte+5OuzYNXzl8b8m
	Yk8n5OWaOFD2UGO+H0o6ukTozIyBYUbEmIiFntpWUpZ6EYm1XQ4bjFpenFXzQT5wSsvaXECNFVsQu
	i/UeF7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoZ-0000000084L-0TCQ;
	Thu, 16 Jul 2026 16:19:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoQ-000000007yU-3CwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8486672f03cso6754386b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218790; x=1784823590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=pmwM7NbVe5fu6z/zYYbxh0ZTFdfv5H5gbnD9qWJ5t85giUBjp4eFAET4PWGXslOG03
         e63GZXknvxmlH5Kz/aWY8gfahXvFMKwb2ohBrRHw0loE6tRdLHqjoCEHDvwj50070tG2
         O08Jj+W9XUnmnoGzU+EIfz6xE8As0yxkgocreC0oSASnB5t7yPnKuw6DXI9m6V/3o3M5
         Amdf9tu/2/OlLmIYCVwVQusmjXLszAf94PsRzE/3oYAMoQNhTDot484XRL0exen4UF85
         QtSb4wbR3zNTNEzVTrlMhS1fpgKgApLiLuzf6NxELKHcwQ85OLUiFNxRrkPt1i8CdO6E
         fHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218790; x=1784823590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=ePpigSC5lMibFcCVNTHKaGpvAZSZ0J5mnTF5D5bymvU0CFA3IsZRI40DMPJb26ZRtq
         RYj8fWIcywRw3JLD97JxRSTBQvXazhMvn612B9anws6CPY4jBNC8MXkYHKApCj988G6W
         OhPGKTbNXAPpP6ic4LyJx4/OEqggxuMrviAWjraJPjDwjVuaA3QeNZycRvzX+KpF9wvd
         /vJ26d0UhnAXbzFex3bg2Ta+r3kBnvU3ZJU3NUJwg+FGGZVV10Xsa5H81Lez+PTsg6CC
         h6eGt1VNUgnzfDf6A6fOGyFw1IiQB7rdP0k2H5cPmwbPvzhCT8kHerBnzKNjS8WBgSQu
         f0Ig==
X-Forwarded-Encrypted: i=1; AHgh+RoN+3j5D5nB9eVNL2t28p7q+ZysKeMYcrQG0NVa6pj9j0+cL5DAH2jXSRd73IuuNVD4boHkXTXFsRbRdmEOEBpA@lists.infradead.org
X-Gm-Message-State: AOJu0YwdxUiue895NahMagOkxuA6VtltDh3DK5p1fTTfhz8PT8RR8pBh
	RFPuny7gGaV6ZDXAs5rkg1/nXQ+w2zkgdh2KtsAAC4SvvCum1wk4Dzbs
X-Gm-Gg: AfdE7cnnCWrR29X3P2wZ5oY8PFJpbesxNhs6jRYVbeqiJ1Qmiyr9sQLzl27XygN+3no
	+LCJwmFOvHuD958GBVK1wbv3gCFgkpMjpHAhKTFh4bvkqu6dy0qPmg/VA01voSCOupT1DdBzPLX
	WpwiwHak2rfqs8rKCr+QfNTw4sDD+w2djpgzizx6hWoW6YXSXG7AotiA8j+2sngiYuPxgYrIaFD
	CxGP01P5hakI0heaAWOfOTgDPj6lXSF0rylpD/T2/KH+kFt0IomDpYjQwqHBYB8bp6872u6UA/u
	od3kS3ZR3+pbHPzUYZZNVLMl0a2U6JzB4MBWde1x6oPVLyBb5DD336KVKsQ6BNxHye+lXG/ggeA
	Yj3qA8fTIIRPR7MpLgVjE7ckzwFwgJaw4GcfE+5R6CmdMwdZf00W0PLr9lskM3M29eeMZZbr3e/
	a4dgL0Stt3oOp+O3sYQBOyXNCMuLxFFabgDQ==
X-Received: by 2002:a05:6a00:4f8f:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84a67308928mr7306361b3a.63.1784218789947;
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
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
Subject: [PATCH 2/7] dt-bindings: watchdog: mediatek,mtk-wdt: add compatibles for all SoCs
Date: Fri, 17 Jul 2026 01:19:18 +0900
Message-ID: <20260716161923.266315-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091950_810374_BC8A6D98 
X-CRM114-Status: UNSURE (   9.15  )
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

The driver recognizes each SoC-specific compatible, update the binding
to list them in the top-level enum alongside the existing ones. Keep
the fallback items definition so that old DTS continue to validate.

Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
mt7629, mt8173, mt8189, mt8365, mt8516.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f4eaa5f7c5bc 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -20,17 +20,28 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt2701-wdt
           - mediatek,mt2712-wdt
+          - mediatek,mt6572-wdt
+          - mediatek,mt6582-wdt
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6797-wdt
+          - mediatek,mt7622-wdt
+          - mediatek,mt7623-wdt
+          - mediatek,mt7629-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8173-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
+          - mediatek,mt8189-wdt
           - mediatek,mt8192-wdt
           - mediatek,mt8195-wdt
+          - mediatek,mt8365-wdt
+          - mediatek,mt8516-wdt
       - items:
           - enum:
               - mediatek,mt2701-wdt
-- 
2.54.0


