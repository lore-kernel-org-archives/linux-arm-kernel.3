Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAEAF45A1C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 02:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=; b=lX3u2HmYbwmlTZBp26+0zJ4u0y
	fj/lq+qTDe5H2id4CWVuCWEb1GJo7fHQnCioqcd0b2ylxVfn6Jv+xjWecPz0p8+zd4nZpKZmj3gjB
	ApZ5vDbOXiKK9ht1os8XZSFK0K2Kc7c9NnwPIXFV98xhY63ih6ov/rW3P9/269FmhSovNWU6+5JDD
	e2MgtLar4HySYPc39inUgIuGeEnLmzX7gxa2F3x7rgMd+lZKswjXkZ9++9gkS55XtMcP3oxoQOqRe
	Hdoq8J8rKCw8XvCmcIs5ldmsriaIZAV1g91bYWTtUgx1XhCc5d8s/nROYy/PSl3peQeDDVGwqJuw9
	3HSWVkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBOO4-0000000D43p-1Vxa;
	Sat, 11 Apr 2026 02:47:56 +0000
Received: from mail-ot1-x364.google.com ([2607:f8b0:4864:20::364])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBONx-0000000D3zI-3fZL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 02:47:51 +0000
Received: by mail-ot1-x364.google.com with SMTP id 46e09a7af769-7d9e22176a7so1413982a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875669; x=1776480469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=CBsv1gt0WJMdkn1abjV9g4CqWW/H8MjMEl+UTMSPcnIl40WOf+e/EwuxRlsnADgB5k
         /8OubMiobTfYnsyPlJBineNy7rPtugTv/atcPv+wIcSE/h+og3j5D8hl0/v3Z286Pryt
         7lChs2R/y7g6L/3scI/ekD3gdX9hT2BvqBsQOkUN5yJ6NZlPPiLS7yutBskrqSWONLKd
         NjgDkxBnhtIx+F0HPX5J/9WtJeG9q4hF1z/olWKyuhuuhaQJOXrM5N/gxyygYagJ7Tvz
         i1rxVASatJdBChrGj/XWkb1XAQA9pBxm5i+cjFxmJY+CBVi9IG0TZld9wc0pBg+Ks0D8
         Fx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875669; x=1776480469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=Wb0YZ/ywvvIqlK6PyoYt1dMGKPbinRv4qZvQQkbgGEqWlUoyj26Ks+4QOIjhDlk8nd
         K+4IX7HLUPAKqhtbacjqNW/7Li7dhc3jYJQNmuBpHpvBwntX+VomkdpqwdYwGDDO7r7j
         tcQKUcCTF6rw50tY69UikpbnzhCHPjbcY/l5SMv+PlR9SCLfnEo77jvBsJtNvWoGUhhH
         DIbZjlBGS9rbnC6CoRjM2keWyK0r8w8i8MrdQoL9atYYRcZcCsU9aWe9WSFT7gz/Caum
         hN5xADcnXtVT7eqWKYvse8NOhxYkTEgXVJqu5grRdVc2LePkn7yN8TNyMikHNVLxnCMH
         yUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRz2emqK6x6HP4l4BGHr+P0IR4pjqX4a/JF+BsShlRD+ZXej7m99KNebctGok/WAn7HYxTrK92dK+eac6/M+w/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0nH7RpJpXvyHwwcI86W07Jb43PR83KBACJgtzaDBcg6BPYbEm
	TukV3UMElz0lWHwNb0t0JvN0y8XS1MkmHB1VlqNIBFME+7bOG+F5JBq8FNbmQxGMSKdIyEAfgaz
	XQalBZuN9lfoQ7jZU+DQtFNC/koK3pUuxNr3I
X-Gm-Gg: AeBDiesgGcyUr3G5wY9rC/rrx/Sf39sZlpH8NpJ1tQyPD9/o9ndkqN09M7zBAjGcvlI
	78DHm2E821WUco++iyM9rLEqNAIS9g98NiXERGK4FNOIxQv+AxGjsf4oIZG2I96Sz43DDxjyt3P
	ghmsagc3327o3kRfiwP7ZFjTuC+oSscBQ67cKe900N/KwtMp610Zt82fRKISL268uFW+xNZG6yK
	ZHY4x/MprfPtQ0Ek+cP3U39/WqKPiCnZKb86mLF9uCHts+Rj2Eil5Oyipl2fjO2vDzdgUVXaXwn
	1t9pX2zd8rWJVDeJn804ckhLQ7quSvF2Dj9+sWkp8+gbRQ9jvK2yo49lILAK5qziIz5y04k6+OR
	eL9XKWSTqejZgFlwiG6qM6hQXSA0H9aIKt73fkMAdQm80
X-Received: by 2002:a05:6870:75c5:b0:41c:4423:5f0 with SMTP id 586e51a60fabf-423e0e8bd76mr3635022fac.14.1775875668802;
        Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Fri, 10 Apr 2026 21:47:41 -0500
Message-ID: <20260411024743.195385-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024743.195385-1-dennis@ausil.us>
References: <20260411024743.195385-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_194749_917713_2AED55D4 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Dennis Gilmore <dennis@ausil.us>

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0


