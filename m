Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA23DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu8Ryw3YuNDxmBnJufDgGEqJYEKRQGz5OjjQfRZxK4A=; b=d0wwJr6+Zdq2aIPb4PZZGXTadm
	ElmN++iJrVwgPH4QyfxmpJcKOPZKmio785cHt9b5ZRE4BcaH8FWqKPR5FbWBZ2igY8j9VG3G/63ed
	GPie5ae0fn6uz1OFL36lxd9yXRhV9MFvSQrFW1BUSQezfeIyF4PEXs3OsL5aPzuxWQcgyMEoUQykq
	GkWEez4SpHmdSZwcoDR3FnnG1traU0lkgduQ6Y/TgntOAPvi5qwdd3mGeX4+z+7y/k5FfyT32lufh
	LJc0MmuagdiZcQr48Wjh2H5eATS1q82jzLgKg69Gip6hHdg83/azjB/EYxd2IfzxigXk2e7XlMEvA
	3w/pxJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502R-0000000986N-3p5M;
	Wed, 16 Apr 2025 10:30:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2K-00000008nbB-2EmJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:27 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso62777751fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791741; x=1745396541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu8Ryw3YuNDxmBnJufDgGEqJYEKRQGz5OjjQfRZxK4A=;
        b=HnAYKioHM/+bnSkNT6tD8L+cCctzTcOhg0mC3dwLxNdOATXzU/O4wl9r2CqZARrqun
         Lvt648UhUbMj0RCfKC3b0jk9A5Yq/tfyCv7tW05MoASf3jLz8Npm++hy8gIVgyCvTSBf
         ZOv+vBFQpV7oMUthG79kxGSN5cmQIfd2IPPNHN95Eg/EPhaV2LGH17xWWRtMBW1ty+fj
         5u0RvKwGvWJQ6wKUU6Z5HpiP8pBjKZA+0022BQl+PedvENone/JFe7InYP7EtCAmYAqO
         7Ef1bVa/71fD+qWTvDq2BbclHILswVNOBQn8y6/b0dDKZ4VvZzi4TaO+I+Tb1ihQggSd
         w/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791741; x=1745396541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu8Ryw3YuNDxmBnJufDgGEqJYEKRQGz5OjjQfRZxK4A=;
        b=ThaNLPfbMhTbF08NReh/drPInwDlHIwCE9M/jnNB+qXJg9gjIxily3MvZJW+aupxNx
         NqQB99g1M3jNrTTbcxkauI6nQWSgD7rEoQ8eIQf/g0fSmHiO9aRkHUUPk+od/LrYZ1KP
         8PmbtZMpPl4tsABUHzO0yLrCPNKg4FLrwdva1hx7un3kYFcdFMrKH60IVvxr2hH/WTAV
         5/OTD8t7OBXhopKhorTZLoRpv/VCZH8fkYU2DhmW+nB5UAWNxQtUsugcd4S74UFD+9Ka
         D0+aT/pvvHedQZgNwFWdj3xWFbPrsRIueOPuw2YwbIsUwGMHKS/74PhTScjCxa2DMj9Q
         mqfg==
X-Gm-Message-State: AOJu0YyRg0JxqbwoOsxEhZc/FmXwmIUM6bGZWLTtWXphC/Wf8NvEr7DF
	km+aGRNAVS84A9ZY9zyDQKBHdDLbZhx44M+NCPvEkScPiTLWFsZT
X-Gm-Gg: ASbGnctQKtE+2RDBouetiUxJk8kZQ7cMB3T1zoL9AbLv/CSSfBhnQIeEvqa53EwV1Gq
	TYHAnwZlRLeSbUzRKD95uPw1jDmm2igpiCNAT3TDK8zIEn+q0TuKkDyFZRq72baaAHK8cnSXOwT
	cs9DXvcl1g0PIT4Y69gvzn7nlRmSIm2TMQMaOa5CxXf8sgDSJlAcggeXg5X0Y2PzRJllV6s2PEI
	fN5d6JywsEE2Dca04RL4IV/QfCak0MazRQzArdUpubgaEj8X3SyYACt/gYticQvjdq6rEv36K93
	YuvabxmA6W7dnj9HhAwFZh5e7K4l8EN2vpGzc4SLSzCTSfV3Tvn6sYg6GoSbsM0=
X-Google-Smtp-Source: AGHT+IHGUCCMTjiwduF1l16OGT1xgbCzTtLXTitsRrPiIhyWpHVe+nbbegT0AxyBsUBlbVMQdAVQtQ==
X-Received: by 2002:a05:651c:12c6:b0:30c:160b:c75f with SMTP id 38308e7fff4ca-3107f73ba71mr3073341fa.36.1744791741104;
        Wed, 16 Apr 2025 01:22:21 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:32 +0400
Subject: [PATCH 07/13] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=1573;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=NEgiFvWhcClrHUAyWpK+jPl/V0oOpyceciVeAKHrSJM=;
 b=/QDgTVjmq8k6FV9L7Bv/m+ASL1PEmLHj1+mDPOjiIIWKA2aWi0U9t1ipMVf6sPm16AepLyyra
 1X+QUaaPHSeB+YM2oEbhgh1MJ4kR1Zig+IqJq8gzkI6B3hN1MBbx5ob
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012225_891308_AA0806A7 
X-CRM114-Status: GOOD (  11.64  )
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

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..1906a8843b0ceebe31eebc3b429560dd0d9cea6a 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
+  - Alexey Charkov <alchark@gmail.com>
 description: test
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - const: via,vt8500
+      - const: wm,wm8505
+      - const: wm,wm8650
+      - const: wm,wm8750
+      - const: wm,wm8850
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

-- 
2.49.0


