Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4377CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=; b=DYP/Dk2DYG60cdftPjoDezEPob
	05xMKNDr2wKc860ISC6gvTcTUpK6ZhCvHGdkwmCsRiOdfB5/+4WKI4WwS0v2eNSZBsirF49pDfoAl
	9Wr++Ch23Uk3pwESl+NgSiF3aZbloWQtBZXB5RTFifhPBBO1LiyA3euSjIzhWoxYqoDCJBlNpxRvV
	aacsGPo3jtDTwWFUJ0CYHhGT1+XzfRVSHizuCeb00OBS4jJ+RjAYFfEeQR4WNwOFv4dA493ENE91z
	zQRhtm/ugfzZu2+3GeD+W/ybuB3FfcPmrJEDed3gADt6NhTHyMqyfic3c1SvAn7mD4wm+SN2EDWUA
	p5mrrFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmum-00000009TNz-05St;
	Sat, 09 May 2026 19:00:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmud-00000009TG7-3djA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48d102471a4so29911285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353230; x=1778958030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=O5OrZJd538aBf2Kkoqwc2RjHV1CA0JxjfCo5UiEuQR+IrHLhl85gOnKpJD/+kbozXu
         BxOBSi0G2Ff8W3oYjOartDT3PLQJxlK1NVu/7qe3b/iY23WdXp7vxS5DcyEHvJ+hssN4
         Opz7aRo+gSuXM1cl2JS19wFwlaOEBKIljrfdokDE+axN7JmE90nMMDs9tDoOqIOUp1mE
         q4efC+eYaWFaakYx+VuqAtc69x227/8YHt78S7Nvi7uQs4iGBDkV3vWLup/OW1utC944
         fo5uvzUoJKPLfdFOfF98i+crvi7zixLO0Nh8keLWoJszSKx3wVLeZWKWOWIY2e/KZKZn
         0xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353230; x=1778958030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=G7hTp5AJ8Kpgs3q4NIQCWn8zcGFfm0u4dOhHopKSFc1PZIlO05rrINExanbHjK/Ed4
         CCO5EAbtxqety/Rkn+tKRYOmuZbv1BveFO6LUjApPdL52+PAXH2kCLGPjQG1jPYc76hx
         I1UVGXgR0kHZp8pY2mv52bn5SWUnr44hDU/gvwM+YU8Fs6g30lwS+7cfjLswtANR1NEr
         cqlQ+WP5Lt67eKtU8j/uBl1UxxKTP58I77AyX0PMo8GPfIiHdqKtFLDIDoRIcfBzv4pJ
         S64RMgunMNJezZR/PIaNfQ6Id/6ycTUVv/kuD9tD4E3DSrdvzMOsm7MrGFHyI7nCcuIX
         4erQ==
X-Forwarded-Encrypted: i=1; AFNElJ/R66TyJ3bE/JMA+jJpSmEqUZjUsjovELHVflRRPGOGvg25yfwKZKH4naTYAxwKW2Ab/0lWiglTrQAr+PjkZxLa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1ZojIfVaBUo71n6Vkf8mac4I8IKHn0LfP67ADgMF8ahgZG8l
	VDAwqD8QgZFGWutTTU/5Qhwu/GU89jnhrXdKgfHT+dB1DGrdCKLit8v6
X-Gm-Gg: Acq92OERQNTKySccQVMwUvSq2f31v7Kk+N20ywMjL8dJ/OMftco3/u/suIBjRPGReoy
	K171l8Iw1dAGUNSEAVwqSD1K5CBPf8AtPEeTw1raLjvpMtmouSuKwQDAcAg7YUtIdUdezXCKNNB
	6Hfii6d+Uyw9IPkgiO5r3ELQCCiJPd58qzma/4UmlihwQB6oL6Oj3m5pI4+4ALfVwUp2uiEsgtb
	zoOZmyFeLq1zQpma5YwAxSonZcQ8m4ZGjhDSCjs4maphbSPC03iXnlLnQ+HKpuqo1y2HTZYu+LD
	uBtcJ0+mEsKSW0Q3YtVgeGEGgNfeGESJMtzStYaeLrmnDRAlqeZ/fhOh3/Jyaqq4rPX0ew8Wkpp
	v/pCQpO/fl0oKxDf8VCXjiMoxtNNA94uQ2QPxPYDmAOzkt6ao3rMWmldvl2M8Oec4aIAw1J2Awu
	59O11Qa7+cgbl2Rd+7GYgQpL//fR53QpEWZIVsL5dDO2CbT+FwmIZboR/dUj6gn7nZ7JE=
X-Received: by 2002:a05:600d:8:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48e676a4e03mr117153245e9.16.1778353230046;
        Sat, 09 May 2026 12:00:30 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com
Subject: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sat,  9 May 2026 21:00:14 +0200
Message-ID: <20260509190015.79086-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120032_289844_060EE8B5 
X-CRM114-Status: GOOD (  13.28  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v1:
- update commit subject
- reword commit message

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
2.54.0


