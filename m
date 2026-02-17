Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D6DE9A020
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bau6uafrQZEyhO8IyYecaXoONB6+S5GZTLPA52Q4cME=; b=cIq0tza0adHMIzEJySIiatWf6K
	WpLZiRDz/T2nqG7MUnOzx8WIcUBQY0r+CZaLbVdM9TwI1kMhHkj4QbOjNIvPc2bzOIPNUKjYyxnkl
	20fKE7InVqm6J/jwnnlNKkQlK4PeQ5c0yiHUn3ADut0YSe8AR5b7zcjdsnMtPWhXr6wfUmdNuOaY2
	oKqhNgsA9UaAr53JM9h1Fbj4JZgTTd+QPiDghfrDAOUjRBxyRPjH2BdInrSYknU0MD4+Q4L40USus
	i2F1wznZUsuuJ4o/UDCpvMkUYmdwo71g6xA/kiO42cJtf1foiHezpxmJUK6CxGNVn7kgM9LTTdK8Q
	7nAKpDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoP-00000008eQz-0M84;
	Tue, 17 Feb 2026 17:24:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoM-00000008ePj-1af8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7bced39cfso46158155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349073; x=1771953873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bau6uafrQZEyhO8IyYecaXoONB6+S5GZTLPA52Q4cME=;
        b=k8QB4WhkcRqlMMbEqtw+DDyD2tLzAH0FU72Vz5uriU2zCAEXmCVgpr7VV9baPWhJ39
         0oCGymFKgkCMwbWn0P79BG3DZNZKOfBJXMX6hA8MPRkbK1DsPBd6huJPzaoWrZsXGaeK
         nNVSUOki7X6Wz8VLWhhoDfbYdD77c7JGCuUZHD7Heg5uVt/gfdALbomY7Nt1lfLkMtII
         Htjncs2fsmZE5WeGoev1LcralTk/K/YyCzhI0GitzrFF56FToDPUEPIXD/MqJiKX+1lK
         Hzi/mMLXwQjg7gp1TrUrUgsj977KokyGdKCf4PbV6ZuPO2xRP7EXZGlP8O5vkdZc0fEj
         reUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349073; x=1771953873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bau6uafrQZEyhO8IyYecaXoONB6+S5GZTLPA52Q4cME=;
        b=FZod0vm9oqjB2Dj7mMPRYejqAbuBMKmRqPopWce2Z5yT91AebG2h+HGzA/GYRxZOVq
         IQh5G6W+h0O6yqSD2rY+K9vSthtIyQpeVLaofEAN3/OvILEMF9z4Mvu9YK6O6AgLLvVK
         naI39rJx8SzfUZr7LIodlSZ+l6HYmmp8TmSozwxlfeRElgB39/mXC2MKaYdfuQuMHzHF
         ygjpRSSSRQRzkbxY9QMpSpkfWpZqecO9T8n50KqkphcWJMYd2Ae4oJKst+2G/Q4SYYVb
         g16I7LY3dEi0PHN7mdj/PPggNydWOne0a/tC07IFvcAsy5VOF8fTkLUqRTlIgMFthHjC
         GU0A==
X-Forwarded-Encrypted: i=1; AJvYcCUXC0gJmiA1LYaHvqjN0lSSDchmLGpT7xPGZ9DHGM2xG2kEH68edHYPM5vuxqOL/oT2njffhsmubxwmJeyAZZXD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFeqolxLuixZj+YFYfkPYN3ELQxC9fU8Rsf8hSANKOwl3ljnw
	Kpnhzmi1gZRM6q/b/EqT+NRKQHQ5VQhuArK9wcuJUB8NPq1mSee/g1rV
X-Gm-Gg: AZuq6aIPYTtL59EwsO7wvsB2E46Oq0V3O4ziN8jTLNr9kkZFFejR6t1b0/S/l9C1+JV
	EOAOII/BLzXreuv3MrMRGX9Q1dNCR3cR1BTbO4Tgj5K0b/sFG2OBW6JH4vKuR/Pd3wESFWSnUQ/
	1vWan5KPDvAjTlMouf8Lsgih9tsDA/TG1yCSt7SDoooQcrcS7qpC8Dq3KYZtVOUNUILxuQuq9Bf
	lYdbBgn6h1MCcGNXAzhcL+C4M4CaAYvJNBGLoOt+2YYL2rGUAXzuAtU010NN3gBcwijIlAiLyXU
	cZno1QxEwyE1WIHxqDDozZ7DDHjOSDmOB/2R/dmDkroQKhbOQBCQnNBt6WdIH7Kej4HjgpowzGf
	0LICtzGwA8CdejnFIIksPcfwG0EzAtcVMHywNHKUJ9ztwwJJQ5vFDENemw9OBovmj0GhC1nR3D4
	mjqrqHCp45O4VIoRRm8Zxs43mpSKm949MATXURV0CAnPFcXNCi
X-Received: by 2002:a17:902:e885:b0:2a9:451d:a69 with SMTP id d9443c01a7336-2ab504e974fmr163450765ad.10.1771349073454;
        Tue, 17 Feb 2026 09:24:33 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:32 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 17 Feb 2026 17:24:19 +0000
Subject: [PATCH 1/5] dt-bindings: arm: microchip,sama7g5-chipid : convert
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-arm-microchip-v1-1-ae5d907e10e3@gmail.com>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
In-Reply-To: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_092434_426178_80BD1E56 
X-CRM114-Status: GOOD (  12.92  )
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

Convert Atmel system registers binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
new file mode 100644
index 000000000000..4227f308d43a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel/Microchip RAMC SDRAM/DDR Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  This binding describes the Atmel/Microchip Chip ID register block used
+  for SoC identification and revision information. It requires compatible
+  strings matching specific SoC families and a reg property defining the
+  register address and size.
+
+properties:
+  compatible:
+    enum:
+      - atmel,sama5d2-chipid
+      - microchip,sama7g5-chipid
+      - microchip,sama7d65-chipid
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    chipid@fc069000 {
+        compatible = "atmel,sama5d2-chipid";
+        reg = <0xfc069000 0x8>;
+    };
+...

-- 
2.43.0


