Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08760C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq+OXw6OLnK7x004RVfSVNUbbrimNuG8oSdUlWB6tLA=; b=3MJT6qQLTweR5wzWBsuSjONYHZ
	TLt8XFL9C4DuNLrYr/faXYVRXabepqEjkAaElr1ToVfM6f47BR8tZ0P3lqcb3uP+9pbJ9KbC0XcMo
	yxl/juMKIhA4bUGlLIxozXCS417KIDVU41ZRVeVoY9TjV5JP2NXTbDX+zKpuk8QTwBuFR2AdJt5OZ
	9yCCAStpmWedfw6OoKJfAXXYgQN0X34y+ycfm8cyLap0gE+9av6mL4ho1EoBa4O5FcAvvQP3EnqZ5
	Nwm/SE2A6MYJglSm/1TviZHY41AOBRCAL4AZyvP/Zel755lbQl0O/lXGeOrWJy0wXmfx7OSqBs+Tz
	iNEM6L9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyua-00000003AUQ-3oeA;
	Fri, 02 May 2025 22:31:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyV0-0000000382M-0tPN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:04:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3035858c687so1990608a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223489; x=1746828289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq+OXw6OLnK7x004RVfSVNUbbrimNuG8oSdUlWB6tLA=;
        b=e3BB9yJa6QBqfhlSN9KMz9mOW5yYMpF93GtLFaIdv1eIYm7g5/PS0ZWnTr+aeWQCat
         02YYtcANuddsNh5Wm9d8kjxsmCHQAdRoO6+zBNkErKem4X1CNwGpQz+UApV/czoxBtze
         AKavkdHaVRS0DJ7/jX0A+y9tptcGKXE8krW2UY3MwmkCypbn0eLndFrH0MV1WUur53qf
         v2XI69DlqnWoK32OMUtipYG0pnPWSWTM0cz1n0jEgCNApYflrNXCtRfDB5wak6lpfErp
         /KM55zEpopOl1JRRx3wCJcFNJj63V3SepUjBubsc1M0/uUtZ4SYdKxCJ3WeyenFEzTQN
         0rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223489; x=1746828289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq+OXw6OLnK7x004RVfSVNUbbrimNuG8oSdUlWB6tLA=;
        b=AQIwd+9m57I63dACUuTuvbEFJHLzRGueLsLYYWcGYwbEc/SHg0MhArQvRg+VVguC3e
         HxoxZZoEk/WK4yxz2JrktViTO+q+3Z/uHVyj2fvneW2AKDCKML+e53UGdQwG5KctZ269
         r3RPAq1v6kURYRcTA3XVVEtQYMBRHeGgCtrsOOo3g1YKprhaYorq5MAZFIWbn0VNf3BO
         a80toqH3OY4ZyJp4hFy1VPccwy2ZbTfhEuad0TRp8kKV07E6Ly3B3M51TM1VQDXqLgHV
         1gCTzMSNy36KMpIFQ/IOqrGk2TSTzPv4CXO0Nok/oLv3GNLpncCZCluBh9DMzaVVaWvB
         WGWg==
X-Forwarded-Encrypted: i=1; AJvYcCWdZ3Tvp3Y/D3ACUqlBj7DhbCTyEGMyzKs6c6OzUdSP3Mgpnx+ihHaQjpkDbNcgvSAl2y3qzvCtKKC6thMO3uLS@lists.infradead.org
X-Gm-Message-State: AOJu0YxwRe3d3c+Iy0QrZsh/Dv5/jR7M3iCZmLAZJgeh8k5mmA72gS4C
	d0pAqxb9AnBStliNLXN+TysM0AJSRTobg2OJ/xGWCB1wj1T9//jBwHp39pGYQAfEhg==
X-Gm-Gg: ASbGncs2RYHCwuTwqzvN463lLfiIsXKDrwgbJhp4qGiX+fW3DW87nGOznNUEfPcDWfK
	oG/ruxWKCbwp7LSO3h2leNkOCaTLU8xaXgWEODa7kgYxMi9eqLn4yUPxpqX6zvuUVU1t5ySDNWm
	FpaCY284ozucE7XYQN1Z61hRWk8th9w5Ip8i8oPHo4fiNqMX7QYBomZJnwZ7hrSW4WI4cKAr4Fn
	rk0e2qlWy6Or4tWKTMlHNpdo9ovod+kBHzJmknx2cWLBc7+ENwsxj2N66S20+RzG/OzUujRkF/J
	1KmWH5RL/R00+LJHoJmQjDZaMh0m0hkiSX2Q9ovIS+eBauKk4bOkoTHGCVoHHlA=
X-Google-Smtp-Source: AGHT+IGIUqAabkLqubDX4Jwh5s3qIBaj31PlOqtXecuhGusREvC+uNRvRC9U1mpHrmUFZCkKtK1DPg==
X-Received: by 2002:a17:90b:5707:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-30a4e55b5a2mr6295145a91.5.1746223489449;
        Fri, 02 May 2025 15:04:49 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:04:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 02:04:23 +0400
Subject: [PATCH v2 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=1713;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=g8O89/tgxr9vz1Mo4beSgs2+D45p8f8lUVQIzp/SfqA=;
 b=EAIdOSwrW7w3KBGa/ocx/LaApsk6+8FLtGjQCektH9Dvh4aT21hW/4ADeFZoclicEljnO5tE9
 RUQ+2rIXptGDYQhtoNVw16zgJfo+5uSYHW+gvrBdUcTFbmKLw3NYP5Q
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_150450_256397_FE769BE8 
X-CRM114-Status: GOOD (  12.72  )
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

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..87bdb947dedb47b508528d70543aba067aa03e95
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/vt8500/via,vt8500-scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@d8120000 {
+        compatible = "via,vt8500-scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0


