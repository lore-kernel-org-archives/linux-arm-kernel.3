Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0677ACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llSqr6SrvAH3wy9n6q0vaWwWuQff59HrQWE9Ffc1WMQ=; b=NKAdPdadwcZnlQ3i4grLmXxzX6
	zOaCeTety6jFwnlGhe6WLr8TnJrTlg3GUJh1MlPezBIPjWGQnubSL8swrT0bLAxkKdBzFY0kFxt71
	HRDuwnJ0Ja9k1Rmi9PPtFoBPQICZBbqmxJ/Nn7UH95ADY1c/cVLnikudkTbiUEErjPFrNurET++Pf
	lzlvPK0vx9UsYXujVsCqqAt4DMsvPw1AqFSyqHwBe1m1J8QTcjWWvQQsSrI+hy9TfDulE9eVl2WWY
	Qnvw48GMZEQhW3lEv12Qu4AXNn6wWt3TsjAP0wsNpx5rm74LNNBsnlFJoOhAI79psX6MDX3lR5QLt
	5c0MAcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMXN-0000000E66C-1VzG;
	Sat, 13 Sep 2025 09:27:17 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMXK-0000000E654-44WS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 09:27:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso653531a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755633; x=1758360433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llSqr6SrvAH3wy9n6q0vaWwWuQff59HrQWE9Ffc1WMQ=;
        b=XsDOQCJb+MdbTEdyR48OPDUIUYdA6nJsCMuTzZTBeSbmg6m/ejmun/S8obzLJSFZFh
         yDBWYtX/RXzoq62xRK32oMsPac5Pdtm1mFSF82h1Bs8hGLlqbFdsFRJgIVJ3i7Vm1iU4
         lgL45cfyDGA5gugW3YaCvVzj+urVz741NcOeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755633; x=1758360433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llSqr6SrvAH3wy9n6q0vaWwWuQff59HrQWE9Ffc1WMQ=;
        b=AJiSN9ej99Bzj1MAFuHtScCAzUQF7Hdp+njgPeesE9i1EKdxD6Lg5lbf6Ec9VpYGu/
         6c5cLr16SRjL9rBFmZPqtruhkRScLrBwEE2PUJ8QFI2SRG2+Zc+dxIxYwU+cMjozgg+9
         waB+AV/Iwy7s6ptDLF+8W8S0uvKSjmhvNZCQdVN7j9wfdO9TZw9vD3SmF8f5w+QGKriP
         PwD82IUVN0gofDUARZq2X/EIcR8fBSr0NsOdvMbThhzLUHSloh/228lfs0ZFx1aoj7RN
         RiDUYEMYnyS/lvJuKjzIM3Z0lzvVj+Vm0tniVSsklAhWNkCdFWTFNjR0ClkvD/mNrkEc
         mDRg==
X-Forwarded-Encrypted: i=1; AJvYcCVQTVi8I4DvVxatBcYhEpdvA6YAIoAfDqTAeEcj2QgcTZAMWB9TQ7JfDVejLPYRmsofJThJDFpjvtZ4FgSO5mit@lists.infradead.org
X-Gm-Message-State: AOJu0YwIv2IX42bP7dMCf9PIrCQaBaHb51Ux3V67VwbfP+R/u6YZi3+6
	cDHNI23UVlTUOjFASaO79dI1uf41Aq/QCCrkTjeRGj11LsNpm4Pn3TNDHUQkcPIHgz8=
X-Gm-Gg: ASbGnctmGJ0Q8O+SgsayT1MiKOiGipH+xvDqVi7mcmjChhcz8QQ3lsyWQSIQb/JlNlL
	r2LCuI2UK1GLhSa4MrgVlsSPvfh5cQ5Q7rlTdOQu+YbGNZOCAF+3bFn4epmoz5YlW5nPiqzs7kn
	ihprh7mhSAqvX1FzY7uwS25uL3M4ZYPFzqECRO6owejWOYLIl92x0HRNQLbfj2UfoKrMovn+ZJ8
	/yZPzpUz3xYxJP0jNWGvlGs4YTYAwb6ybWGeW+hJksgtrUAljSFzRr8Ktv1FHANLD9WNglhsgPK
	FO2W0OSz1vuStttbV7q3CPaae9LJS5JWYouvwWRwq5DOzsOyY0yrQzbTASczdz3RSBq9cs3Qvc9
	J19QfcU/B7x6uIucuuKpO83CZbeL4H9T67UEz/H3pRQXxvWaN4b+8Z3tiyiPWf88EXhFKHUS1Qn
	dPCdNPjYIBIdKuEKkK8DJ4BdqThmkvvyuxKkX/st6scW4JA1ddyexZWkY3Z5xmGB1V
X-Google-Smtp-Source: AGHT+IHcZdrPl3YiT8w37AtF2eLwy3H1lf7B4vokF4mlZ6H6fOjpLCxDlkfMTGZH+eFNfBTCbsCKyw==
X-Received: by 2002:a17:907:74e:b0:b04:6546:3475 with SMTP id a640c23a62f3a-b07c22b2136mr684830166b.6.1757755633084;
        Sat, 13 Sep 2025 02:27:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm551705766b.99.2025.09.13.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:27:12 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Sat, 13 Sep 2025 11:26:53 +0200
Message-ID: <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_022715_034729_FCEDB437 
X-CRM114-Status: GOOD (  14.58  )
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

Changes in v2:
- Added in v2

 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------
 .../touchscreen/raspberrypi,firmware-ts.yaml  | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 26 deletions(-)
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
index 000000000000..8faa796fb7dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
@@ -0,0 +1,45 @@
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
+    firmware: firmware-rpi {
+        compatible = "raspberrypi,bcm2835-firmware";
+        mboxes = <&mailbox>;
+
+        ts: touchscreen {
+            compatible = "raspberrypi,firmware-ts";
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <480>;
+        };
+    };
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: drop-touchscreen.txt

