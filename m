Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F43C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=; b=FAk1fTdqwBP7hnPmLimLKdI9iO
	VP+qI+SL9uOIrDyFbyGbwvqP3UN6zKsQpGkoWRKLc2UbRL75AH5fXumV3mYCMmvaU/HUvwJP2e+tx
	Vo0pTahzJ9AHblx9LCRt6YpPawPB3iIs8fSE5nKesslcdNtZ8ibH5w+erdZyRBmyTgI4S1wP7TEGr
	9mvvtaKV+FG2k9LPPzfucw+62RSS09k1hHzEF9GTYCRcjhH314y+EA5uhmoplHXk6eG9A0rnCu+Rf
	Qxi7HlZfUJ4QkBRbBJmwjmkYpg9kN2O5IdJZzndaqZbBfVLiaJr/XT+UVgCYgiltlmm5+RPCXsDb+
	26JDIXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHH-00000007aBv-3r8i;
	Fri, 03 Jul 2026 17:02:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHE-00000007a8t-2NQF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:02:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493ba701891so5577185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783098127; x=1783702927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=GqVNWS5hi9KByuDsXNZKjFhAt4tVGCEa1aArJcY6dhB730rCqA7cJP3w6GwycMQHJ9
         MGUgnfyP4K3px6rsk+APGvxvvCEl7fPyBda2kROc5/uWqBovUmS1MvI+tCOi/PCH2HX4
         Rsg1ylPQJfMXhmqBl+uMzI81aNoYVUkL9y888HrCac4V8WRt1KQm6tjZwgs2f+qnMsYc
         yBMOgTPOfuDJwmOoU2STw0sgPK69rU/4mlIA01FErGTWZ23IDxGnph3PahlEA9BBneK7
         aqRVOH5aCfUThvA5vDEq4GFQqUt+dBzV4jl7v7xJiWK2aZpBJNwbixH3RTVj9Kmn2Mpq
         2fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098127; x=1783702927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=hGKMxNpsg1bSFNl9fqfmuanagdW4zsTRZRpP3gXDtQ5hrjmS8qGq+pLEciAijQVmlW
         I5uxKanxFWy83WgJyZTIWNJe863sZ+Nnts3beLZeUeEbrTagzKnZXS4pOXQlKBaVvjzE
         uh6zJnRRFBo8AhA3LnhPut8SMNpQEuYX7CuCLNFuVHMAEuK9GRvjOfWj0FKoXS3kbHR4
         5uqWnjHLWcL/zSGvYyM5dim+1JTaI/A8Ashsq9gLdqsC3efrlpGiXimfBhGNS5dUP3aR
         rfTfnWdwwJk29RSr/NmabU21285cd8/PwoLFrELPn+Li/KET+bLOjBY5SlyMQZQ09J7b
         9SmA==
X-Forwarded-Encrypted: i=1; AFNElJ/kgu92SThoovGbXPg/DOktQ1CYQR51JOs2K1fKZtfwb8HBlHAmW9/nBjc+2wN05ebkRF2SHqa5ifOEN2/9+/62@lists.infradead.org
X-Gm-Message-State: AOJu0YyVEB3HChxIJU/nYWhi3g4+j4wGO+iHIwfOkNipHwV42jDDqueF
	6vt9gvzzvGpjsQ6/nb2F7HbrnBP7AdmsX/SqOAFBMwFuIO5SpBNDPBoAWB9Pu8Daxk7GxtCEQpE
	W2SXMeCk=
X-Gm-Gg: AfdE7cnwLrigo4O8eh9uEcS7lFjFqlnhSprgbat5QQkm+3P8WoSOoDrMkCwBn8AkuM/
	neUHytRTSCbl+AB9pTIx83gTnv/WeFazhFcZEO0QfzYQhPEBRBuU7xNxAGi55GZ0ZJ4Y6rhhjrl
	o29mHsTKNukVPnrD519EfPBsGe4Cd/vL0qQUFb5EE6bYNtxuI93ukupxt+HKj/RZWjMHpCoHb9t
	a4zbFBk/pLx3OJrn6EBQyH/m6xaKO2VcLK8V6LLSfqaY8kzv4p/UoJow+vGRCXLUkhpOCzmj0Aj
	dBcsliL9Z32W65IFQ9tWk9febhPd0GkxGOTetkA3eXgcpoZPPoKAuAwR+V7oZSH/NTQtbjuFm+A
	+ubm8TeVXj+BxaM77hcUMEmOWwpc9dB0GB0xtQK/ojk7DhHjDvZh+wUQnwES57AWHjDLSnpx5En
	wKg/L6yTp0Nfw=
X-Received: by 2002:a05:600c:529a:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493d11d7f58mr1680335e9.11.1783098126588;
        Fri, 03 Jul 2026 10:02:06 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm762345f8f.16.2026.07.03.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:02:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri,  3 Jul 2026 19:05:24 +0200
Message-ID: <67d51a7210f0d7410dbe34e3d93813db1fecd622.1783097764.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1783097764.git.andrea.porta@suse.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_100208_634354_27BC7E74 
X-CRM114-Status: GOOD (  15.44  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..970d0f3b33bbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan using shared registers (syscon).
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


