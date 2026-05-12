Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9749CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=; b=e11LQ2zl+XuE+0/T3/YYfDiU6n
	PICn/gltd9PpQHoz47BbjnwwM8jchEQfA7lQrg/GBIid2ZX/FAkRQwvnQEaOcO6hA6ZCR6QkyiPM2
	uVVaKmfDj33OHSbu9rjdKKvQFu+5MFdxMkquEUA5D128kLQzMhbWuyUmnzyOcWnPw1rToYA8QyKt/
	6I6KuKshJ87Jt9OXU1UZ407QwqP0w+znmrs3churPT3gSAwyO9Z/GaX1+aruOoiFSsdquIc8Sa5Lv
	yLpW9Bulxg2N5xX7w+w5xiuyPp3PWyMdR8C5AimJjvsjOx3pjqB8lYeXyC0mMBrLZyZgvRzrSBj9Z
	bKzd4RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisk-0000000G9Di-1Ij9;
	Tue, 12 May 2026 08:54:26 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMish-0000000G9AX-32ej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:24 +0000
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c795f441ff7so3866828a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576063; x=1779180863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=cgTEQxbYzO/WQoFIQUGViaafZdtjDsiapOxlebrwFzhZloKbkzXs2I5ndqNYQ+iSIo
         5iZR+2VlwyC7MFrIpxpa3t6oGTxlRy9VhSuZos0OHP9w/7sdeUNyk4T1CKhhdIcCitC0
         75anFbbwZlJFZhweqcsSmChtmcActLiL/sdis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576063; x=1779180863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMpmOLlOHSFIvvWgO19Vcb/akZQ2K5UVO/tRSLgtnsY=;
        b=cao7PQLQAYP+LUV6JVLC6nl+LqAn2AnFF34TjRdswfiA+JYioBTKcoK89VZejsLlj7
         ADftnT2/df6tQNJ3KJ5UFhC6/RTrckUZCCuH8FkwvPNFDTaPi187URmXmNUbkkCqQFeC
         JdXFoaIR01farB4Rp8ycjulndCtKBBpKayHcQCAZ+AdT2PC3XOPXaAZnL8cnVFdnpt3f
         dCGU+C+UKctea+vt4F8cnDCV9Bv+KFIeKqPUoJZtXFIY/sUxRa5+Jg5p0hx4wgFdixuv
         nQGJwdU97MMpYWILXpdCJ0CF5p0b+g3YbqbvCUS9rWM+lFyeu8Hq9NVVl9xrCVefUBqi
         lJbw==
X-Forwarded-Encrypted: i=1; AFNElJ+fqZdk9T9Hiv2dsVYhp+A88URKR5TEYzQIwcE3yIBmUXCLKGokxBY9JDCGPfpVYD0HU+PwOpTPTUzFPL1F5vBO@lists.infradead.org
X-Gm-Message-State: AOJu0YxcHF3OkWM6CGvfnmqWnvUuRgzKlTCQ435ca+7jx/Bd2fRdBU7v
	0zs4F1knbYaNNhwabp3+xn+x9UUCEEF5s9Zm25vvJSoI3dlas5FpVqK+0RqYXgGE1A==
X-Gm-Gg: Acq92OGHQmRqmv2jLvwkEFcfZWx1x+lxcf+wbu4bvKkTRiHOWOWIZA8UtW2Da1w5p+Q
	wIg9gBDs2Bvwvv/dqYL01SoQMnISo6MAWNFUdBRML/0Fpgd0VOZhVQjy1PW3o7kXSV9kU7dhcFW
	Ibeb+wu+272rQXG6O3/VX4JqixoqtlK3rzqOaJWzQhmFQma2aI7BP+UbuEAbkD5nPRk04/Rzifm
	/aGabepD25H544AXVZUJ2LX+CfxqdGWmrsH+/pfNmDljiBoQKFPAutZ/9n/1LgvRwxt+hCmNR3E
	RslvFl2O9LZPpCzXWOBGOI2SRAD6XDbeQGJxw7eeLlPQsSfyJEujoOpC05tlkU4DK4gkzemgSnH
	LsEZA8G1wy5afp14kbC5g4H0l11dqL1ffxHyVnVey/8d6zQS9SbdfkMBRPmz+ehXqYEnKRXbTFW
	l3GGZ8HpSAU22GdgKSBvxTQVVMsOE6yYLQa5SVKMJvAzsluDdA8tOHm7cYtG7Ksyucv458un1L7
	1TXnlYk1/YzVqHHLQg=
X-Received: by 2002:a05:6a20:7f9a:b0:3a2:dd8a:5084 with SMTP id adf61e73a8af0-3aa5ab5c3e6mr30559580637.37.1778576062752;
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:22 -0700 (PDT)
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
Subject: [PATCH v3 2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
Date: Tue, 12 May 2026 16:53:50 +0800
Message-ID: <20260512085358.1693208-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015423_768660_9B46CE4A 
X-CRM114-Status: GOOD (  10.27  )
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


