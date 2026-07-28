Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B778C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=; b=VUPh6B48qXAb9YWg8fGLfnJQRe
	qHpYDfdifaJKSof2bEs8TX+vvWn7eOYp4OtDRShhn85flMxK98lxHkSMYJZuJcG18YbOZQLRQYPCc
	MQGh6juEtKWpund7im8Ns8dvm879GA7Bmvk0seK/o0sNAh5N4VT8mNAigMOOOu05q5MwQTDIX0VQk
	N4SbbzQR7IIOMxXWbHpDqdvEqiwR6eAoTA2qFa6F+9pg6IRTBdwRiFrXO4kG2VXMYBaNwUx++YOBg
	NVULogMMltTBhNMe+oH9AfpIPKLU7VxPcOlyzD01DPRvWoz9WnJIhWw756xZmKdCBH9lXCY+9+T7Y
	4kGm02Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXtC-00000004HXw-2m5V;
	Tue, 28 Jul 2026 02:49:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXsf-00000004HW0-2ObO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:49:53 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81ec29f1d07so40827447b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206960; x=1785811760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=gY+4qACX722g6iqxIoUfHzhx7aCjuNMdBRgwhxFHngb5V51+QS6f3oTazD3npOqsxS
         gSr23v1LkY/OQ6m2a/jiCxLpSyhq0/7upQ7oGjxKJ9Uto612tAXK9Zc0QYg7iQy/uGDP
         Ez2vX1htpDewmxenBbcGJGbB9Uja0afz1pQazAIgclZRwMy2XZOdx14Xvrk4Se2mbEM6
         4TIXi7U7E7L21hQetloNlzs9lnNeNmdlXAsB8ZBm8uxcNwyGug0wQ7jG6Z8hLfdyM+I4
         XNdOOyKvanrfYu2kkS8BAujXqzI/Ao3AWCNam78Uft3YR6V6DKqK4+oNXAZEwfmYWe3J
         PFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206960; x=1785811760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=gLMx5JMqB/DIF3HlEGJeD959qWAduqSJfYFiThBvmWufqolVWHet6ZQ2mLcDiPtVzx
         QjVRCu+2TjdpDvWPN+ZTkQnCUdD1hDRi+UeqsOU2W7+nWHuLFEcnb/Wr07yccmVgRPte
         8MCyb6N2UnYCjvr7EDluzx1Y6OpFvrZv+7KaJEpgK/LE2/UdaqrWEPB5EEn7SvzVziaJ
         jMoMpZwE9a62FkUOsuOXjB/YJqIFdyOt8zNXTdMCLyrk9tEIYjDBJj+4i4uIvE2HCEkG
         A0b8TNJdsRpzzpLyWcNurZ7EnhDUWCH7yJ6xQwBY7sqDSRAoweeMXSVAlxt7cco4+5ZQ
         Eqcg==
X-Forwarded-Encrypted: i=1; AHgh+RqfiHTyOEO2XCN46lHP+T38LOmevO0MH3FXtT4fOq6kxdC0EB1iwumHTo6se7jGZ8B4xoRcaoI4GSoYeTbHZtK7@lists.infradead.org
X-Gm-Message-State: AOJu0YyzTRzNN9UwbVSIxTTkCsjcrrnL3dE9oEaDlicOvFSjbxU0r6Hp
	HxXz7B4S+VpevAXtwI0Zka/jyCn3vryrk1QOxdptNXzeVy1pbu15EA6g
X-Gm-Gg: AR+sD13sLCfzvPo/ksno9xjJqMo26SxpFftjKS7ngnkV5H6Bvz8lbBD2BZ8b7A6r/In
	2vXUR+kmk7Wnv0Irn5UEv86C/M2iBf60xoqvwigfa1ZdBFG73XqD+dLxdDhLYYsVo7cedjdfxVU
	3RqxZ6mSQCNtA3MCan3yXQpCG4xOfI+u4thbmYzuaXRxctmhfjF5lXdb633wzdGD2YPAgH+Ie2T
	y75bMp0zwxIMpCdY+0cJHKQ92Bdm8Tr96s0WXKDYtoGe+8Ul9TfmW2HzqH5d2M0Wz8Jg/v6mzVl
	7xSMO0csCA4JS5yFr5Vv3zUN7V5LXlOgwDafgHtV7J7bMMM/ITwMS95EZOv2Z89sDJbqHihSNsj
	XNszYd02Hj7NX1FOWgbbaxHO8qlv5Dzv8OO0t9yZ7Gfxv1k2jmnU0tpR9BTBA3f2hNvcdTJ8SuO
	1fHA8x8RNmMOqjxmZ3YBvBPSRveP6NRIs7h1oj
X-Received: by 2002:a05:690c:350a:b0:7ff:1a93:be35 with SMTP id 00721157ae682-81f99106fd3mr1842047b3.16.1785206960474;
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Mon, 27 Jul 2026 22:49:13 -0400
Message-ID: <20260728024916.993224-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194921_621098_8FDAFA17 
X-CRM114-Status: GOOD (  12.19  )
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

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0


