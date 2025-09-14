Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02045CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFrj3gEfIT3tk5nJrn5YbyG7ZS/WolhxcrzQL1fTi+0=; b=wsA4nF0WgbSFFfLf6BwTQ6JA2A
	3A1bqPKaG3ZoO6QicgNQeLRmZ7U7WN5xVFAvKAg3EAePO+syWdORVI8AjwXEpUcwtajo/cwfLiLQc
	5dKKo/zgKq8sgyPfQTNuWic5vNIMLYyM/K1atXnU2jpEsWSq/BQgoMhVZJDrNWR8IhtZxj7opI4vC
	MtcG9rx6XQNIeAJgpqRXDQAvBY1spILEq2TmAiYiYXSHREXxSR+j1J9w9hvur2msORt+kfIcmJgW/
	ju7bs58JN9k7ILV8k28T9mAKeMXEYmc38ulj43XRtFC3h0t5M7rQUq0yI0hgYklzylyy9+RFLN98W
	3u1J45uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtUX-00000002AS9-1m8Y;
	Sun, 14 Sep 2025 20:38:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtUU-00000002AQJ-1ED1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 20:38:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-627b85e4c0fso5607584a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757882308; x=1758487108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFrj3gEfIT3tk5nJrn5YbyG7ZS/WolhxcrzQL1fTi+0=;
        b=O8Hb4yQGZrx0tOaMCIph1dXS0saBAcOuOqSU7rXJwhuJlmApfTxSj0BRZBCJP6CTuC
         yD6uKbl83pl5J8I9oBk6kQNo/F/Yytw0T+NvVsZ6DnZx3I0mIwa+P+dx9LEcfW9f2TiH
         kGbjr3m4+LxSO5kxbyir/zx5AVDElL0bQi35M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882308; x=1758487108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFrj3gEfIT3tk5nJrn5YbyG7ZS/WolhxcrzQL1fTi+0=;
        b=Qi1qdzuPm4abU4J4fOlUVaePHbXndMwukEVz9rEVNRImYygZGfRCd9IqEqdYC6m/4F
         03lk92SdtQ/CcIVCKREEoIl7pyxCCFbFd5cDp48X94/Q1gk730plt6AznGmM9aMTgXUK
         Ih5py+KjeQn+4eUqSVEmJvfNyvhE9iA4PgU8IV01k5EpNuR2beUWXcHVUEHXtZuGcqD8
         RZAIaCfLVJ0NGhm75tUpDB4TchjgZ++ITUxh5zQe/CRYFRZneDG1sCKGRIIFMN8Apf+y
         HP6hUznIZgRN1JAReYc1s5Zz1buz5CTQ7iBg5hNgjcNavEbk5XKfvtNNcbEOScjprHEA
         rZQg==
X-Forwarded-Encrypted: i=1; AJvYcCWNZ3VxEu3jAaCorki54uZf2wEJgS0llgulW744hGhoJb1CdPkeNiLzWWuyFlWYQLd2PAqKYNbElrEjNL44umHm@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcOWM4wxoLBSLHe7H/qSBaUHiX2UVUIICjA6/rvNTgxz6cup4
	tLjmyJGF+VUzM0Ge/2RLSlAddtw8VlASpB7smDDzqBe1tNrnG0p1m0BtNLObvPLhSYYdYMRXw2l
	prxrH
X-Gm-Gg: ASbGncuNJ5hVdYQA2gt2PG4YBnLWSX9FEeC735dHovx+tjZEg0EQ6C57eokH1m3OMh+
	S5m5CVPSOh0xsXTn/JHWIKdmKPU1RLhqt0DJPD1V2MCb7Uc2WNgYOhkQIlfDJtgtBHq63pD0mgi
	tpcUZKOhvmGvAgBTJdEE+UXlQBCHB2HkZvOKSYPh4HQMETZrLATWNBaGQ4VEP+ElhYCZJoaNL8k
	waQ+V7FoBIUbBZv5OJUqi/hyxjlV6ZkSqlWHB0Tf/oHwr8IzJhnUpNNF0IW5tNRXyEi91hRQ+k3
	xYj1k6+EK+wf0z2S3MDvz75KekImlM1+3T2z5R5aRnen06LRGmGzbYNTHl87GSY2N5iNrnB9dDL
	1bhbP9uo11MAU1J6kZ94kAv2gm/5XXu/FG+ytTLucJt/skHfRveLleJNY+x7ukAZIvuM3O81w3k
	w2TEUR+lFtwr39iZykiP2bPTH1Xo43oAYrUL7IvKc2yYwwax+XpkzCwVxXSSK/27xqzQFKoUVVK
	SA=
X-Google-Smtp-Source: AGHT+IHD40fLYi4O1kTcM1Rp7p7ZYRGGkgLnzuTVUkbYF/Dv84qViywJ6Kd34fqgy/JBzIXC++JDJw==
X-Received: by 2002:a50:d647:0:b0:62e:c5f7:cf92 with SMTP id 4fb4d7f45d1cf-62ec5f7cff2mr8580125a12.13.1757882308297;
        Sun, 14 Sep 2025 13:38:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm7803739a12.17.2025.09.14.13.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:38:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Sun, 14 Sep 2025 22:37:54 +0200
Message-ID: <20250914203812.1055696-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_133830_374786_BE05303C 
X-CRM114-Status: GOOD (  15.51  )
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

Convert Raspberry Pi firmware 7" touchscreen controller device tree
binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop firmware-rpi node and use only touchscreen node to fix warnings
  you can see in
  https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/

Changes in v2:
- Added in v2

 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
 .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
deleted file mode 100644
index 2a1af240ccc3..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Raspberry Pi firmware based 7" touchscreen
-=====================================
-
-Required properties:
- - compatible: "raspberrypi,firmware-ts"
-
-Optional properties:
- - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
-
-Example:
-
-firmware: firmware-rpi {
-	compatible = "raspberrypi,bcm2835-firmware";
-	mboxes = <&mailbox>;
-
-	ts: touchscreen {
-		compatible = "raspberrypi,firmware-ts";
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
new file mode 100644
index 000000000000..697c508326b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware based 7" touchscreen
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,firmware-ts
+
+  firmware:
+    description: Phandle to RPi's firmware device node.
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    touchscreen {
+        compatible = "raspberrypi,firmware-ts";
+        touchscreen-size-x = <800>;
+        touchscreen-size-y = <480>;
+    };
-- 
2.43.0

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: drop-touchscreen.txt

