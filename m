Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB41F54ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=; b=sPc41xKoIdqh3M0F645Tw7bLA6
	M5IX0496YZFOnk7r+DrJW8vIBdyQJKR3RNqeBkMR1OCdacoNnFe39UD/KXPCxpDsHHfjAPGBe4T0I
	xVO+RpjF/RMT/Fg3NwcrXzt2B/NYgCgqyONz8nTYaLursTKKcyROR4wSrNcmOWSTM2IBG3JnsaQGl
	jrzJaVHp3qGqCVp4QCXRIbLPVEMp5rx9NfcpEaQXEj4yk+QaQpgfZS8r5DBScum3c5yPRacjxVCMN
	VBPESwqU+Uzmj3751lDkxIHYDYgLRCceZczE5rFcyikxJYfYgdOPU1VjcGbNZqd79Vm8dfZwb2w4f
	ZrJ3q/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52EG-00000001anH-3ZjZ;
	Tue, 24 Mar 2026 13:55:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52EF-00000001ale-2CZ5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 13:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=; b=mL0iDlkNEZc4YqcgE23xE1CKwa
	ShulVMXkGedMJJ1RDO9AJg9AkEv9/QgDkdoOo6n6oxB75UbSzsiTSJWnuc1B5FrrYAVB1n1JrVfnX
	nyKTn6ijfAdeouSdzyCaimJxtWZNjRlqEOM5VF53ZdntqMiLN31YQ/nHs+BLZJpApGrnJ6kKrvIzV
	YJo6jgA7xDyLsE+lTcCrUDHDlQeCVeLoJqv9S59Cwip3QhvbCVmBIm6FDfh7pJQT9XgvcAyed0dwz
	eYTb6tGwFpiWewHGBaa/u4hgEZgnAn2Eju53ShmGX5lilLIr4IZxH5WeHPQOSGvzvSoSG3mxAqhTu
	pTvSTBxw==;
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52EB-00000004DVV-469G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:55:30 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-56a9076813bso2405657e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360525; x=1774965325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=KKhTTFOtDZXjifRilnumeQYFdyCt5Xq0YrD8EshgEPhUzq8UZSpD0xTJk00jB+CUAc
         KTlKcEud0hAx3+8x9nbVsdcZYr8lOKsbg6/cUZsH21f9viwb5R6ynR4ySkPntWsDYpiF
         RB6Qd10ZrHFw6+Mikev9D7tjJYdF/Er1F3AePCRv2Vzwu3uQoDGeQCrIMBNCPSkkCaOI
         qlw26Z92RYeTiQBZsVS/lIL9TcpGTyv+Pd3k0S/Zembc+kWNdha5z5FczDWGd9ubMUli
         Htc5mKP8QzJufCrSGmHvH1FDk1xpa5fGEFWqlKKCPZ8iUvfJm7JJZCJwyVtRUNMdhMW6
         WjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360525; x=1774965325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=hzwQkn9rHeZ2Zed+FEWf972qCAf7JLYVzFMYwMZJJCeDx5qMA8xkzf/dt6bsrizE7y
         PeS/4BfpjmawRlVN4CuUWbZEmMB7Ua1sWGIF1YVeJH8R8xAByE6VIDGmhWkWSSfG2i2z
         BKJsuU5PVp34ka9w5Hzo25nXTvpzneK3T1JUWiwumQr5uGh4tYR5gg4Elxd+Cg1G74Vi
         ayn+RgqUbXeFyhqZNHPBUXDlC8iJ8+lMs//G2R1r1xIDvuqfhbifQL0jbG3Fv+vL9hVz
         WLenlQl590HjlFH3kzjCr2gz/wWanMPZGf/su0m68UY2yaOa4D8ZByXJkvdwsbHhjZiB
         OsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZAUtSRaIMtKaBryzwkzPzKxmVB2vR3g0Oh4crvthsmGfrLkdmHs3m8fQ4zfQer7mwAh9yJm1rIWsxk/A8aS1P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6pouDYYLfTkBp6kd5fO7lI5brVaCsV2sRftH92+iIpesfecWr
	Tf8RZkWW9uazufkNJrnvt1xRvGJTM33owyRNAAgMUlqlsiMX8H8irOA9
X-Gm-Gg: ATEYQzxggSi7wJFq4CycLBODmaQv1/2i/A0gENLT9PJxSAGbbiKORNjua2FjjmIlSZ9
	f473Yz44oEZPkbADM+pnBhKwMeiGodKzZWoqiCJ+AqKLTWbLLdaHpZa82+nOivUgUmhqASErxrk
	x8hIS9+QF/pOHZhH8CyvTs5DQa6zej9Rs99WYxBvFpd+catmpyhfrw6RoimAIdxPpZa+bWLAKhY
	cNDGASgqtJfGq55rPuC/F0FKYNUl/LP5dFsab+phsVoFfwOZQI2xP8osoDwaqBUiEBJ6mp6YeE4
	L1NgPstwmE/fObzvBXDBy0q5GXYXgsfnUnMGFHKOPxzlTBPgXfIiXMEkEMDS2eexu2TaDXNUR38
	0J6dr+QFWKOXBgwJyo7cxEUFIPGWGb0v4C82t0W7Ezz3v8+3SdvuEdKL4CuxilOae9ThrzzHTtY
	PrWfn7IjgNGIjkNfRiExZRETTRBkSLI7gqPdnKqFHuqgw3s/bMPPQXHyVEYYfqOhZ5AsHuZQ==
X-Received: by 2002:a05:6122:3a0e:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-56cde35a597mr7936243e0c.5.1774360524552;
        Tue, 24 Mar 2026 06:55:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:91c4:cdb6:8a02:47ca:2dca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f882sm15529418e0c.9.2026.03.24.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:55:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml
Date: Tue, 24 Mar 2026 10:55:08 -0300
Message-ID: <20260324135508.839142-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_135528_493348_2EB894DD 
X-CRM114-Status: GOOD (  15.50  )
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

Convert rockchip-max98090.txt to yaml to allow dt-schema validation.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../rockchip,rockchip-audio-max98090.yaml     | 59 +++++++++++++++++++
 .../bindings/sound/rockchip-max98090.txt      | 42 -------------
 2 files changed, 59 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
new file mode 100644
index 000000000000..5630652aa4c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rockchip-audio-max98090.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip audio complex with MAX98090 codec
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+properties:
+  compatible:
+    const: rockchip,rockchip-audio-max98090
+
+  rockchip,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  rockchip,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Rockchip I2S controller.
+
+  rockchip,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MAX98090 audio codec.
+
+  rockchip,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the external chip for jack detection.
+
+  rockchip,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the HDMI device for HDMI codec.
+
+required:
+  - compatible
+  - rockchip,model
+  - rockchip,i2s-controller
+
+allOf:
+  - if:
+      required:
+        - rockchip,audio-codec
+    then:
+      required:
+        - rockchip,headset-codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "rockchip,rockchip-audio-max98090";
+        rockchip,model = "ROCKCHIP-I2S";
+        rockchip,i2s-controller = <&i2s>;
+        rockchip,audio-codec = <&max98090>;
+        rockchip,headset-codec = <&headsetcodec>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
deleted file mode 100644
index e9c58b204399..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-ROCKCHIP with MAX98090 CODEC
-
-Required properties:
-- compatible: "rockchip,rockchip-audio-max98090"
-- rockchip,model: The user-visible name of this sound complex
-- rockchip,i2s-controller: The phandle of the Rockchip I2S controller that's
-  connected to the CODEC
-
-Optional properties:
-- rockchip,audio-codec: The phandle of the MAX98090 audio codec.
-- rockchip,headset-codec: The phandle of Ext chip for jack detection. This is
-                          required if there is rockchip,audio-codec.
-- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec.
-
-Example:
-
-/* For max98090-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-};
-
-/* For HDMI-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-
-/* For max98090 plus HDMI board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-- 
2.43.0


