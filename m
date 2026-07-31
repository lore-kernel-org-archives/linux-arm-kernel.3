Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E31C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=; b=Ykt14v+Z1rR0J7QfmmbY1TZXg8
	JA9WtQ5CHej/bMCZOk+JovpPOOomXtGBRMCnQ9vMLaD1Q6aBJyA/DSVEWwGKyzs62S9EBTmxSzDWP
	g8VyIXaKpENfGYFlwM0oI+ds5THkhBG6w5fL3lzGB62XCPXdexyYazw/rnTTN9SSzeEH0DbAJN77/
	qQLQM5ESGB1N/X3Z4vQ8uqGYDZzF3jkeflGxP+PYLrqZH8Txv4TKACGDKNKcY5u3Vkk7eL9RmghQ4
	sXfQ4ZhIGTX04+Wc3VV7LrPBcBem+caClWYREhMs9vJaW+u3zV82CWUJwNk7hzsl4awgO6/zraN+2
	sAdT5lHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgyH-0000000BtxR-1ZFH;
	Fri, 31 Jul 2026 06:43:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy7-0000000BtrY-1XMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so698978f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480221; x=1786085021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=b8rAhU1N0GdWoWbagT/gHFHfJ1IN1j0mo9G5z65FLcpPHvJK6Au5QLYlHZra565F4A
         7+lv8+4QF9EyDq0QzZHpjPHiICYCdRqykh6k18VpQXoDndcDJ3q/tnzr4WjCFIq9Iqlb
         2kEjyEnYT66kd+gzt0j6c+f8M5UtJVLpLvBazBMtXxVXEQ8d4Cn5IXLr0PSg7SjBwMx+
         gtqDXYyCp5N+xI7JH8kkwTXmi9lPFyaHsUeR2li2y55lNPvMK9AWD0qhVlMZFuFmCTl/
         n5Y0Cb3to8nw4qp9Z3onbDSFbFthZDMHqL55xOxpfX+AU/ThmTGWlgiAVhT6ekMe1yON
         KDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480221; x=1786085021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=FVF+DgCG8sIiSdaFUkdPfPGZ0vUqor8RitMtTIU71Pp9DeRMn6kh2oDPlVddPFJHn3
         PDhAeHH4l8dSoZflTFZVB/ECpXJHn/PjJD0zCoYpQ+QjCFoA64zQ0v5ScpRyoBoJ0emT
         W3AWJdqFAZ3Ife7hFLPIDEjGu8rws2NoTwY30z2HaUYX5keXSinbVFc81nXAesqQN8b2
         RpmUAi9s2GD2glSC9toNHaEiqBlND7Z1KIpc27f0BY98tipgfMRwJFgDWXr9JmXwof5W
         8CcfI1FgUn9r7ANT1QG+n4ezIiURU4Fejgr4uGoC5XyulyYABBlh3awGngyhlYNPS+CI
         lkIg==
X-Forwarded-Encrypted: i=1; AHgh+Ror5ZXglsS9pjgAvVqj20nN9RJuvNQI3NR7mgLhhskrmfyt9x8xSWhQ+JOrvP/slJoeFjSKEQLgIYjnsb3blmdR@lists.infradead.org
X-Gm-Message-State: AOJu0YyZCU3X4tlz6xWD72VRKmLiELIWYi8SBMrDeo59N1GghZ0Q2iOH
	xX+WlcXNVHz40v5RY9dSLlKhKFVWMtoEy36B2cEHNSuMJzjGuWhwVxhG
X-Gm-Gg: AR+sD11gfAyGOt071hPLmVvcSVj8of/z8LaVrj5mGJqNqaDEGbgJlkPGu0pjabIIxQi
	qAjL1xr8ipTrEapezLYVd6QI3E6iEt7WewXiahi2SKv1ocDV0RI6E2mxrIK4cYaRWSumI/iLrEi
	BPI6TZGaqTfKWcQjRDNUfbrBw9SBm7vT1UvyUMiYIrS4YqYnCq8tmlogQmZV5PdI14scNUU9p4a
	M0XwFWl8khmOdgNEOpKB46x8aztV8VkYuONrWoOoKdUtCKbIZPFVVoTdbFDNcaBoGAaw6b1CFDM
	/+pcrnVSDwXozNToFzX81DEOdquSYxlvmwTHCZdwy006Ax9tX1QR1WV+kbdO3m5GBwq47e47R6B
	JNhGPsyoXCy5g/gxIbws11nvNb/Lg5kqb7azjqIYi6Xi04WZhGw8xPs9bGUwmXPJ4UEVbxoDJHD
	SsGVzGe7fuQ2tFnQiCaRLtao3i1uEWxE7fYmkDJqmQKaD7aomiMQabQk6+1tpW9l2YTRucu3+yT
	lqm5xe+Ys2eco0egranHCo9UMDxeuVH0uH3o0vJd3IqR2KdyWpq/Q==
X-Received: by 2002:a05:6000:2889:b0:47f:9442:f753 with SMTP id ffacd0b85a97d-47fd2b5dbb3mr1767774f8f.52.1785480221395;
        Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri, 31 Jul 2026 08:43:21 +0200
Message-ID: <20260731064326.2284228-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234343_438950_263CF361 
X-CRM114-Status: GOOD (  14.27  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


