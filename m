Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0069CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=; b=fPwRjhYEYkK8olWTO/rFjuhOUS
	mvu6PzJBu3tR6WGO+5KlPrL5cYbei5SB5Qm1O/8Fiw1YpXqgbbGKz+Ly4v8EF3z6Shb/ctM0v5g2A
	q+AmtQ501Ak/lSfGN6oHflFNiGaOwSnwThwsQMs5d3AAIXT6tIgTQ548rjt4U/xB2FNocxyMvkeFN
	PnGgSCbXlxnSRYVbVpA/Axf32Z63Jm0BEfakul7vRNE5jdNK32HYd/qEljyU+TMbkPTclgzPtHMri
	2PqhT5TsTByjcBG88qFcw2ZJv3S/afOr8z09LK4bAS0brCYzSlN7KfdS5S3nmD/LOKSXSA0bt2BFE
	8uTe38Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAU-000000051jU-2hRK;
	Thu, 14 May 2026 09:15:48 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAQ-000000051f7-00QH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so1396046a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750141; x=1779354941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=UxINZfemzu82rd9ckNLbyGv2e1I59Y29eZIsZLTP2YFwkYYIiUnmTn4gvU94cnjGVQ
         O46hdFdJXzKpV2Z/H4huXubsH943fvQiOX2d6l/osClz8EnY/nZL/k82VzZyhF7kP8Da
         DZLVBXo2wzcQDgY5eaE6u0IzPM6WXXIbMEk9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750141; x=1779354941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=LXb9vOsHK+Xf7mDAWOYWvitb/cJWT9mjXDkPGKXvdqrh4eTory8xmAwRwbl4Bn90iE
         jXh5UFqeROxkq4ozJfBl6UiwjwFP0UPvqggivUaetaFVLoLLSwwaMeew8oCunslFNIoj
         L0ruLvoSxp7YpXDUqlyiZkJYBmRwpcZE43Gl9++ZFyxVmZIT9KOT7M73ucM5sUXOHj52
         OFieV2uPyzeBvYsAcvdZeYxMmxslTd+aBIIC4lzv5WlslzYoTYRJtZ65XA1uM+Hd5mbA
         vgzer0Y0SdPM56QiZR0vEejhLtD/+Se/Qc5SFYDevUreUrqDnGZA1RTTqSvRtDuwlG0A
         hRgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dIy/BD+cn0BoUut1AxyCEVnEwzoH3w7cJHOWccxE3dKnorcfpHO7HCTZ7+LNHkVZNDhkZWj59ke9aamyA2Sc3@lists.infradead.org
X-Gm-Message-State: AOJu0YzkxnR6uknh2BpnNrFHrYXhL8TArqGIhwGYsN1jAJ+kR91l8Vtc
	UYmUkHxBz+Gjs4JJ1/pfEc9hYA3euho730tcBUege99zZrMksYzAuyC6IXLu2o0OQA==
X-Gm-Gg: Acq92OHNp0nIyhRa7r7AWIZQhItZ5ZUIjMmJJtzvYR+PIdkQBkybhj4RbWrxhxUYkEJ
	tlRuboJq59T+Cy3QhtkVqOX7lkFpEMhbMGED/MhUbuweXiizOlWQ8k8BsgUV1UMY5Q0IzGSTkE5
	xcEvnvldNz+xHWIM4NSEO4Hxh2W7yU/kCqoCoA22ddUReoqO8PrPOUbqqO1IWCgeZsFq4t3rTIB
	fEzVawGf7p+SFGLwqYhwQiHcMLL1v4RdgT/kelREautPg7MzzQYiBhyNEWBvwEsiBL7Bmobn0wJ
	rvVOilsLYDQEo5T8fcplTEiaD4ihinjuiYcnp4Q3S52gJOkjZoaP4iDALk35Ug1kF9svzeKnPeS
	qqSP2QhjqLKp0uDcsYGBzklLJONB5LouaYvbdQ0+9DsL37SWCllpSpSOG68WwoebPoHMkKhcp2Q
	4Q0tu/S7I4wn4hV9VyCVw4cfuDl8YwmHR9mYfpOsa1qjpNsYCoSK/Y92YfkadO+bn26GU9Wjq4n
	UFrJU/8
X-Received: by 2002:a17:90b:3149:b0:367:b9ed:6656 with SMTP id 98e67ed59e1d1-368f3e5cc2amr6642670a91.13.1778750141249;
        Thu, 14 May 2026 02:15:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Thu, 14 May 2026 17:15:15 +0800
Message-ID: <20260514091520.2718987-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021542_375681_B21FF0F4 
X-CRM114-Status: UNSURE (   9.96  )
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

The name of the regulator should match what the board design specifies
for the power rail. There should be no limitations on what the name can
be, and they definitely don't always follow the PMIC's own names.

Drop the restrictions on regulator-name.

Fixes: 8771456635d5 ("dt-bindings: regulator: Add document for MT6359 regulator")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6359-regulator.yaml  | 43 -------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index fe4ac9350ba0..ac925334ae83 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -18,84 +18,41 @@ patternProperties:
   "^buck_v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(s1|gpu11|modem|pu|core|s2|pa|proc2|proc1|core_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(ibr|rf12|usb|camio|efuse|xo22)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(ibr|rf12|usb|camio|efuse|xo22)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(rfck|emc|a12|a09|ufs|bbck)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(rfck|emc|a12|a09|ufs|bbck)$"
-
     unevaluatedProperties: false
 
   "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$"
-
     unevaluatedProperties: false
 
   "^ldo_vsram_(proc2|others|md|proc1|others_sshub)$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsram_(proc2|others|md|proc1|others_sshub)$"
-
     unevaluatedProperties: false
 
   "^ldo_v(fe|bif|io)28$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(fe|bif|io)28$"
-
     unevaluatedProperties: false
 
   "^ldo_v(aud|io|aux|rf|m)18$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^v(aud|io|aux|rf|m)18$"
-
     unevaluatedProperties: false
 
   "^ldo_vsim[12]$":
     type: object
     $ref: regulator.yaml#
-
-    properties:
-      regulator-name:
-        pattern: "^vsim[12]$"
-
-    required:
-      - regulator-name
-
     unevaluatedProperties: false
 
 additionalProperties: false
-- 
2.54.0.563.g4f69b47b94-goog


