Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9ECC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VYyZyvSI/uogoO1M5S4jWlG83eCRLvK0XsODRTpSy/A=; b=eUaWphKKUYioXBhcvlT+25C7FQ
	gl+rl38+GJX5Vu5MwjwQfV6IhRDVi57qJ23fNDz/dopMG67dglafkox+PRvsSZnbdWXob1GbGYtlC
	5aNW3RO1/SwCemoPksTgfjcg342vAs4OISkFB2Hj0A0GQeuproml3/PN/KHOscv3wFV9kbNMIgGaE
	l2zUm87mO/T1fcjRz3UlY7LE0WXXAnJReJgBEsh5yhF3DilAyeqblPo4VvSkpMuLIFJ3EtZqq2yNN
	orpWxrKxAbi25Amq5IAE6qZvTRZcIb7aD4yPIGhnM9M2Y2130w2YisDQYlMif0A16FBSnI7EgZTmU
	JoJINuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrc3-0000000GEry-2T2U;
	Sat, 21 Feb 2026 18:21:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrc0-0000000GErd-2Wj7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:21:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-483487335c2so28398355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 10:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698110; x=1772302910; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYyZyvSI/uogoO1M5S4jWlG83eCRLvK0XsODRTpSy/A=;
        b=MNEF5YeMD92PwHX2IHHjgAdsKZdcKZVPSfP7yZJz/EfKvc5D1CxNCZQ3RhMOBppRGK
         6GW8nFm/vU2yZUqnqDFj1hwUFJY7qz5KgTp+ntKRVa/2zvHFitzVEVNf0WJHbhRwjMeV
         JJy+Nkh+GkIBn6CFikZZTA4xdgLqRU870cQRGfAG2LYpFtVHTRUXBhkJmToVHCJdrDv1
         VEuj4xrNMMTa7h4IJRUuY8SBE404KToMi/HJ1IajYMdLjcT3OUVILWb8cM0S04DtRUc/
         5UJpiRJTBGmk3Vl/5QVz3qxIbECwL/sUWE7zQpxFxippp3MZyvzeG+SLAZe6/XqHcLyK
         5lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698110; x=1772302910;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYyZyvSI/uogoO1M5S4jWlG83eCRLvK0XsODRTpSy/A=;
        b=o4AXInW/0aZ3o7pjSBDtZZSSGFS1KlUOFM/JeqX4nhZQ78i0teTDT3Y8lVWMVNorny
         B7DEh5LPG62/MIVyLxiJ5P5j0covDtLI76WydkBbFNxtYvE7SN26g97Ee32poqGlIzox
         8gvQHhkTzhotDS+sv6hgfiPy4ed0bQOwc8rAGSHKBlNJe2fZ1Z4hZCQwQDBd3UlKI8uU
         jaQyDFiYdZRCARhRrHNHD2z38Q2sh97PdnFJOaXk/EoobIGfurtGcKQsOITosvMyKwTE
         cV3HNxTAQ/y+DfGK3Loberq0CM41+HJXF6aHnTOa8myHAcTy2NudI9KD3xNqvBr9exK4
         1mfw==
X-Forwarded-Encrypted: i=1; AJvYcCWvJR2bjU875KSkRMiqa3f3ixbm7AvxK79cBPzkug2I3/H+cXoanHyx4lsns2FrDecnqhnl7gYU7h5qUdjtBH5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzFyDHXkzFu57IclwAHvGfzKzoHvihJxIx08rQC3upJa7aPwj7W
	/r7ERAk56iburJ3AlLdg0iv6Pojj9bScdMN8DxVJr6OdNYrDOZNwNHNU
X-Gm-Gg: AZuq6aJs03pR8yzSPz3A4ottKtbJ/zuC4sM8u4cugs8n4Q4w59lF5MeVvHD2vKAPO1A
	qEe6PN5hg+gpO9LjzwLVmziyKVcpJAC53Dkd7/D12HZ/bMCJGokS3faF6UG2LUOAyyNfPF86zJU
	E4wi10AZ6XVu/lQjezhykw30FRdgPuU2eCowyElN+UTXmtvspbh/scWnAk1ZGLwPfen5Ws3O4rg
	dgqo4e91pk+rzeDhK/DATtQU8Oprq2CsvadIPJDbLbMJv/Ka6pj/Wf0ihaVnUhJR4S19ZrPyF1t
	o3cLbBA42uXGZHSuILF78HJxSwvCYxVzcRQnohQp+L3aSbOIwYYelESP4coOFSE9/F63LdAMfcf
	FpOgE2lwoh7VoeQfBiYNr7VokTu6s+T0I7GCjvRe+Au2DktOzvrJkdrJ/wQnmB15OC/C2xgVX28
	UdkoxxEFa2knl6KU5J/SMJvhNUiVQgSilUWBCKS309hWrZK72ieg8pEg==
X-Received: by 2002:a05:600c:8a16:10b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-483a9603c2dmr38955185e9.33.1771698110350;
        Sat, 21 Feb 2026 10:21:50 -0800 (PST)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e51sm71300135e9.5.2026.02.21.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:21:49 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 21 Feb 2026 19:21:34 +0100
Subject: [PATCH] dt-bindings: firmware: cznic,turris-mox-rwtm: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK33mWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyND3dz8Ct2i8pJc3crE3Bzd5OSUNJNUs1QLM0NLJaCegqLUtMwKsHn
 RsbW1AHsm55ZfAAAA
X-Change-ID: 20260221-mox-rwtm-yaml-ccdf4e6e8619
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_102152_770647_851C19EB 
X-CRM114-Status: GOOD (  18.27  )
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

Convert the Turris Mox rWTM firmware binding to YAML format. Both the
compatibles and the examples were adjusted to match with the ones used
by the existing device trees to avoid new dtb check warnings.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 .../bindings/firmware/cznic,turris-mox-rwtm.txt    | 19 ----------
 .../bindings/firmware/cznic,turris-mox-rwtm.yaml   | 44 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt b/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
deleted file mode 100644
index 338169dea7bbb69cf005d964d20d69fdb9b3c7a8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Turris Mox rWTM firmware driver
-
-Required properties:
- - compatible		: Should be "cznic,turris-mox-rwtm"
- - mboxes		: Must contain a reference to associated mailbox
-
-This device tree node should be used on Turris Mox, or potentially another A3700
-compatible device running the Mox's rWTM firmware in the secure processor (for
-example it is possible to flash this firmware into EspressoBin).
-
-Example:
-
-	firmware {
-		turris-mox-rwtm {
-			compatible = "cznic,turris-mox-rwtm";
-			mboxes = <&rwtm 0>;
-			status = "okay";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.yaml b/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2feb11103653f841b2456286b666bf523bd02e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/cznic,turris-mox-rwtm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Turris Mox rWTM firmware interface
+
+maintainers:
+  - Marek Behún <kabel@kernel.org>
+
+description: |
+  This device tree node should be used on Turris Mox, or potentially
+  another A3700 compatible device running the Mox's rWTM firmware in
+  the secure processor (for example it is possible to flash this
+  firmware into EspressoBin).
+
+properties:
+  compatible:
+    oneOf:
+      - const: marvell,armada-3700-rwtm-firmware
+
+      - items:
+        - const: marvell,armada-3700-rwtm-firmware
+        - const: cznic,turris-mox-rwtm
+
+  mboxes:
+    description: Reference to the associated mailbox.
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    armada-3700-rwtm {
+        compatible = "marvell,armada-3700-rwtm-firmware";
+        mboxes = <&rwtm 0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..43ec3489898e3bd5c79924670081d4eb397e2729 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2713,7 +2713,7 @@ F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
 F:	Documentation/devicetree/bindings/bus/cznic,moxtet.yaml
-F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
+F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.yaml
 F:	Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/marvell,mpic.yaml
 F:	Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260221-mox-rwtm-yaml-ccdf4e6e8619

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


