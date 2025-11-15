Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA633CEB2DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=; b=mliU5U1KqbIruPuR040N1MvOM1
	q3KJHg6+lEcKtZ93RI341ag85AoIAWsS4kC8jAdx7/6eQ6cZhJ6apCesXguVPo9GnYjG7S7KcHvAL
	PQtkb1Kit5zbN3ukhh6CKG6CZ/RVmdQRgDQqwHq5QJprncFu1KgTj5i2oPRtqLbAPM0jcDZQyOmU8
	bKdzWBBf1uJ+cCrYYlxlqLl/FB/Hy8ak0fGKb/KVQNvY6yTE6PGb8c6/8uDdlqklH7GaTX5WLFpd+
	vRkj1HlvqMh9wOWh0IQJIsBQQVdsgkUT4Qxojr+7bXRNaxll8WjzqiXL4BFH8fVgjouiVlzwF9GKY
	A1M5u0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2x-0000000Dpqz-3Sva;
	Sat, 15 Nov 2025 14:14:35 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2l-0000000DpjQ-2LxU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so5327988a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216062; x=1763820862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=JFnt7NzHLwvAlnnpY3ejba/9Vy95Ev21Nz2npW9fE5tpN9j5Vc4LYek//5UfJJ3jbR
         oAawmaYV3zfskRgrIIGmKUdjjnQgnBq4GPbZJONUXQs6T4LhKuzLaqh/OkNfG4/wQ8+B
         3I6trVMhEfnYy4E8zRboTfc6kjNThfsDQugxBUUB+xvvllEV4NQPFa3otY9UZ9n2e6dj
         CJv2d8T4b1LlvQsvf61+if9MWVBPUHx46W4/QQLAUno2JXfCl6Dwvaynw/bdCqimYK0q
         Q1LFjwG30S7Qk06UwrS2CDHve39Jo13ntod0HRCXrzWFscm4p39W5hDL5lUMhzNKOHe0
         jAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216062; x=1763820862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=iVblzMkoNEgODBQwRg/ej5Jzc4tmVdNoQBLXc34T2NzSrc3aWBekBARb0Jbz501fwK
         8BMZb22XZ/8lwF1Sda2m5hFzLCGZ/HxgSTPgL2US8b1sN6DVkgMzUvG30qDlgau5SKfR
         3AdsKmV+NyeKGF2F+OAYZMXP7/4o3tCh1LfCZF27FiLXoiD8VM4Fm+ugnp0h054q/RYL
         iZ6gDqRkwfiWh5+iIZzev7EGnlrQn2EyKq+rdrYGuS/Ap7JEsNMo7WhK2FyRlEGG1qIt
         ax3AYmwsDJZqo20K0otbkXI9ymfYtK8hlqGBqodArV55O/8g/FbvAmJ+lEt16BgI8/Cp
         gahw==
X-Forwarded-Encrypted: i=1; AJvYcCWCQcQf4ezY2SiYiNNq4ZktLN4m3rlIJEyHzel2rJh3nskM3VoHXKQRNDixHXtYAf1I8/BUJdB0Ux23fQc8WwjM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3kvI3hiFfGOqsWE+HzhfL+2lgwH7Mo4hQzsDWYg8P0SjRzjVR
	01nCu2rZi5bB48WbK1makiNDosM3FuGvYpdmPV2cfLLNPdz3cDSCxyVo
X-Gm-Gg: ASbGncvLBjVVrtyq4Qh5esexaIhdrtAU7qRZjVAJoPL79nWQm6fNJRHBBcBYiU2OoC7
	Rbe5IeKgwBkmtjS6vcATq/qUTBLVt5getJxfKp9DkCfnthqMDttxcFUL3rTogEwRHArgDSSjWa9
	xUXud84h/9IVAvCCZfgkQtb/Q8Zfskq8GNAps3R38PS44v4VdL+mPvp/0oTi15DwiISUnKE+/PQ
	lc6tygEnabtjIQBcRk9sw8ZKDJoQrYYC4WXUfflIFitkaqnGe+dGvBH8Xl4amljokxnEJ16mYbx
	fHf1D+ve9nC/6a5ko2CyV9/esnprYYZ1Cy92z1sKMLbMrKbTC4J90T8Shoxc2OnjzH35xYzfrZM
	WAQEYS8r1XVkFP5F09h3lKaAmcJdm/hUcDFuNKYFNdxQVEk996M8sHfEFOdr0h+y3sNfk4vzn6p
	BP3X1lVta9i32eXU64QJLagKvjG7k5NyGgnWy3SGE8+Ssb9CDEM79MeRHBE0c56yLR/FM=
X-Google-Smtp-Source: AGHT+IGK96g9RzM8eg44aCNe4s7zkdHo6HIsmO/rv+pQP0RPewfWCNhEzO33viKn6j62oVKNtGFutQ==
X-Received: by 2002:a17:906:fe07:b0:b73:870f:fa2b with SMTP id a640c23a62f3a-b73870ffaf8mr113667666b.27.1763216061567;
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sat, 15 Nov 2025 15:13:46 +0100
Message-ID: <20251115141347.13087-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061423_615156_AF9C017F 
X-CRM114-Status: GOOD (  12.60  )
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Update DE33 mixer binding so instead of referencing planes register
space, it contains phandle to newly introduced DE33 planes node.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.51.2


