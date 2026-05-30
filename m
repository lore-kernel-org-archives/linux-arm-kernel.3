Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCA3CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=; b=txmMo68L8Dr+wUeLy/eHO0DyPc
	q6JQq+3HG0hFbcK9NXmP+KP69bfNWpkbgdfDyp6Wy3/Pz8GKUR34BCF8px2J6odOkIGAMB8Vibd2l
	V/v2Idw+e4elZ4DoX4gUj6uS2InWkBuP4ZReUDsUgGqv2jfCeQ80up/di2aomdpdSSShjWSXoIRA/
	lY7NB4BYxQ/G0olVZ/m57Z18wV1+AL5Ks69xdrktSfVQNyLl4c17hZnoZ9clwc/+q4aW12i3O4XN2
	XpcHR2rwtwBpbKwmlsst6Ka6lUfJtEpu+RTks5lWT7nFsKVwzJZo9EKYgzYKlsjEOzJD9hssWtx2T
	n7eH+tsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8j-00000008qzj-3cDn;
	Sat, 30 May 2026 14:58:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8f-00000008qv0-2tK2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:58:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so90245885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153092; x=1780757892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=Yl/SQXoJ43Wsub36gIcpFPJ8WSrproHZ/bPf1Ye6U/3TjjIKveENyq5oChV+zMcgnj
         FBXEpi4nGf1SBsTFjkJ5JhkcWIQWWjbcLljvyjS6VeEwvGimG7pTe3OC9Vec7OHnvwyL
         JqaOR2zfu5TWoPWzz+zZh6fDt/heyRcKd4rRM8waogVkoQjlPYcB/NYWfuG2sR9kJX+H
         y7hXIRKdnuhKzpWiFMmj4TLgR52Umc74q+xkM8gBFsSkGc7C7quikrC41XpOkhqccLCC
         KQpm4RIiGCpESKcZxqmcVNgMzuKuywRUjqIP5ECdKCgT55jIk6CSKZMkW0I0z9jbSx6S
         kIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153092; x=1780757892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1TMEZ0J6gXWQTFmjGHghmrU7hof3+Zk+ggFlB5N5pU=;
        b=HyeofkAf7rHbiHszeEZf2M5BifxZIWuU0wgK4czBDGVwisPPnAtVnpMYCp08n4B/9p
         arFYzTFANP8OC4P4lKIf+NN2DXzDm3cr5xDZOxrabIn9KF6U8qJ1962FifvWKMDMbThF
         TH/ittoGGdRrEuPHdDwCVKgiYC4o4YsagEDW0HVrKjuJuhSTRDYpnEXkkrp8vLz4gfhA
         E8zuW3On/Is2U3a/yUXd2gbvtv9sOePvRG1GyFf6TPAcGi84vmOGLmP5EiYeIQ/uv5dE
         NnY+l/TPnaMmvKbwmx+13BkMYISoufg8eCKVytPjrk1Aqh0W1+FHzxDrfKWY+cAl6HN0
         6idQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e9ioJVETzUlPfD45ywjIwOtohY/eK2bfZNTnBY3hVDnoupOlB0E/Irai7K/TxMmrlSX4T3W8u2eHhiMEHcExc@lists.infradead.org
X-Gm-Message-State: AOJu0YxGUiQLCW6vMFiUlZPDtc3X0l9UEIGDLkWFwaX+VO5ln7MrAmbR
	J0qLeAqo5bItNmrm5tOz0c40vneyXJcXpNpw9yuc+zAg+bXfkGSt00z3lGwK3w==
X-Gm-Gg: Acq92OEIRQ308DwE1d1NtOiS2Q+KY1Ddc7S7Uzut8C+Sf8rI2mF0xOYYf77RHsec/QG
	/wy1TCObr1UA8RLi0Z4v4e019H6uqyS5lsm5LPVywLHjQcA+Xr3sFJD8Y45QKa8+S9n3PBO+5GZ
	8Q8Afo2gR2rqPFwppZBJplXSgXtLYLYAmeEV/tvQn48H65okXwDeh9Qq7huttS3vUgWXavhWuFU
	QHhyCpRtlN8SZoJCsnL68aLliHIusdVgV9ggyFOBc3qt1EiLSagZLXx+IxDtZxnLiTGtAx2GDpu
	fPPUOnYtTc6wg6LtV/h6CDkkD8PUhJspBlGL6w/Air0u5puKR+CbdKqAkxlwMt9ruYXOswUbDbj
	LMtTFQOOEe09WMACMN67gjs4w5k4mU/T0ZcEDMXVCBhmD1ZCaTc4t4f2jC9vjZuNLmTUcLzi0IG
	HESnfjn7sqbwHWhUEPd+0VydHLActOkiY=
X-Received: by 2002:a05:600c:4f53:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490a2958dc4mr75086275e9.16.1780153091542;
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:11 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode and property descriptions
Date: Sat, 30 May 2026 16:57:54 +0200
Message-ID: <20260530145800.1029920-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530145800.1029920-1-y.oudjana@protonmail.com>
References: <20260530145800.1029920-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075813_760015_CAB2BF76 
X-CRM114-Status: GOOD (  11.61  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Change "subnodes" to "subnode" in subnode description for better
grammatical accuracy, capitalize pinmux description, wrap all descriptions
at 80 characters, and remove literal style indicators from descriptions
that don't need their new lines preserved.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 0dcbca5ca8f9..4dc9504e24ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -119,11 +119,11 @@ patternProperties:
       '^pins':
         type: object
         description:
-          A pinctrl node should contain at least one subnodes representing the
+          A pinctrl node should contain at least one subnode representing the
           pinctrl groups available on the machine. Each subnode will list the
-          pins it needs, and how they should be configured, with regard to muxer
-          configuration, pullups, drive strength, input enable/disable and input
-          schmitt.
+          pins it needs, and how they should be configured, with regard to
+          muxer configuration, pullups, drive strength, input enable/disable
+          and input schmitt.
         allOf:
           - $ref: pinmux-node.yaml
           - $ref: pincfg-node.yaml
@@ -133,7 +133,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
+              directly.
 
           bias-disable: true
 
@@ -142,7 +143,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull up PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull up type, it is not necessary to specify R1R0
               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
@@ -152,7 +153,7 @@ patternProperties:
               - type: boolean
               - enum: [100, 101, 102, 103]
                 description: Pull down PUPD/R0/R1 type define value.
-            description: |
+            description:
               For normal pull down type, it is not necessary to specify R1R0
               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
               will set different resistance values.
-- 
2.54.0


