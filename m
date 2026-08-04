Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0585C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzLX9GA0PMOy5TOxJvHxVnH9yoPV2TfmIgWpC5Rtigc=; b=mMUXN/R+JXiXOVOrrJ9iWkaFi0
	p2wDDgGoP4yBnAiuANI3ULrwAmUMXy2TL+zQhRALCxtnT6YC6zt0tf3QsKR2rTH3bdZ6/3sweNuzw
	F80i4NiFGuhJZt3Y8wmgsI5Wuz6N2xB/E/AjaE8GhIbesrf0uMHnsOTidqU5y7rXG3LNdHVhcL5iT
	iwuB6XvwUY+NI0AbNhy2e9ta8QnJvJbM7G4TsJMW5GBtu5HEvGMbxTx6zx8CLvJvju9fO6hBQ1F9i
	/DT8v53mEU+f4JF9GmELiwRt1EGrUIC5kcU6tvo3gtjrmpiMiUctfv/uwubj2sByxw2h6LCVKPL8h
	htP/DEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfn-00000002okL-1J8u;
	Tue, 04 Aug 2026 21:27:43 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMfj-00000002oir-2KmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:27:40 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-497d6c2d000so226254b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878858; x=1786483658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzLX9GA0PMOy5TOxJvHxVnH9yoPV2TfmIgWpC5Rtigc=;
        b=VjNuhR2PiRbkHboZqWdf0hcWc2zmg8BlGgDOANw3W6Nro3N0Hi31lLt/Kxt2LNyRJG
         5MQGU0P/q8K/qUcEtVc1tozWU1ZrUuFIB29XE24Dm/PaWt2VzjxINbb/WpdRNrjIyAMK
         0Szmith4rLZeyBDt/0MY+E3iJW5WzyJeCucToWqo9UYLMxuJAAFpzMkxmqt+Z2POxgoW
         PsAHI9Ew7nohgAmzZiFEDuMxlvOl9//W00KfqtdM2UkXmOBQNCb5/ARU2hex3pTMUElt
         pBGExhFqZg9XsV380NfQ0QusJwaLavFUzyWmozj60YWljV6W418hlRttqPprLIymJabj
         gS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878858; x=1786483658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JzLX9GA0PMOy5TOxJvHxVnH9yoPV2TfmIgWpC5Rtigc=;
        b=mjWOrmotH/CR3+i9rehK2VCjaUubrg8zyZXpEmAGCypnqcjV3CXogr+wFC35GVS8Uk
         OF8zZdA/hC961J9mRbhW9frs8urLiuH5EfwoyMFQLv0xLUSarSru4F0O3jGrkt2FzbOY
         S+tVdRAaZmMKuxnA6it2d0U7eGx0CNhr5mtlWZJ9TWUHzyV6mxBzmGCbZI4eSJZsrzUR
         O3JUpX4V55vkaRJ6I0ya3/9ePMk5sbuqk0VhSR0lI47zFjdNH0EcjmlxlWlj+WBFYLhi
         NMo8c8w8iXvCMPZhxWBDgRzvhE1FTDHq+85HEIaDok5LRWNAHM51J56dp7yLS0FuwH4V
         5A+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/6XpjFrifbX0c2h6hKGH0ANY5+uFjih1drjKOA9/2p7zp3F8mtUNfZNa3fAx+uF6xubjWC+dQLFrbVhfJcVbE@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ/CWk9xLk4HFUk3zBTEpvHXnVSdECN7STwlU3iMgVHqP1smrW
	EdN3RPZd0U+RZGF6wgwKy9RZr9gtf8mKS/rVgwxHfsHSEYiqsUNzqZis
X-Gm-Gg: AR+sD13gaLCHyihlAjZzZc8QVOtiuY1ZkdXlQ5Afw3pS/h527fT5X68K9dGoWRhgun0
	RdyzAo4q9Xv5dRFEs723gSwRkUrz6UmE1AgemI++9ic1oDAtIuRSq7MY5xwEirD+kcTEWYiG4Is
	0iQt2Oa1xQcOMyZAvpcNA0uAFqBljgecSzPtSF82d/5EPKtGjHeOTKpryce/rZdhjQK8SoIMrMO
	YbKSSBB90VobMKG/xotZxL3sHJyXh0Lm7gjwbGtx6rvut3zCqPB45/dt/C6jabIaaiCT17wEmFy
	iKkVRkMCimT5ANUClOtQpVHQ4MbhVPbe9/A8ePdIAYjQJtut0ZSiIDCkxMpvbasi6j9WPGdpgFe
	XrkW4gSp5NAGjNKooPsy+Ke5jn+K/EHDkT7SmKFv/2iv9aXI1U/LWYXNc5yWiw3kkuwFAf3gM3q
	qvTTMGwJ9c/4y8c8TIaCML+qwroJ2/1K/pAEHWwW7iU0YDjTZxd7unwEHgdgfrbnLvNrguKsDn+
	F8fA0SnW41Ek7I/GW+pmaA2RNo+90pCdm+0YPJZnu9iiXmwR9uOuV5F34jYqcdA/yLinQoGhzAn
	LnLMyIhcU9TvxY0oHIFgSjsL1EVu8teTnzcYt8zqzj+0H+5jMbKbX/5xMWzsUfsoMPFqpjmyiZL
	sZpw/wGailThTrhnAmRsVAp2+FX8Q
X-Received: by 2002:a05:6808:524a:b0:496:11f1:f2ad with SMTP id 5614622812f47-4afadd7f963mr1120843b6e.6.1785878858060;
        Tue, 04 Aug 2026 14:27:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae7c50e9sm451659b6e.17.2026.08.04.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:27:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 15:27:24 -0600
Subject: [PATCH v8 1/4] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-h616-pwm-v8-v8-1-db37ab8624ae@gmail.com>
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
In-Reply-To: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_142739_607973_3ACF043C 
X-CRM114-Status: GOOD (  13.74  )
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

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - describe the channel-indexed hardware bypass clock cells
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0


