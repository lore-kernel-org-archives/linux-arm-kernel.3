Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658E8C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=PESqPJj8U4NlMfuQFvh9MGjmJW
	Q35/tCcJVAEVeyft/vsYji5XdQzlQGFtgyhHAGv9nyE5shy7fIIN5xupXD3oYrtI9dtIIPOj02B15
	IOCycWtzA/h2kI0KFab+h1TSY88Dr6JfcccaywP6PMAcxDDUc12t/aIpGIW7p4v+5swa+hVGAGAqQ
	fJnxWUyMVSOqVFG2UCf2iuHxLlRG54TYbgafvZNQ+bC00s/FYjOtGWdxt2vC5AM56iBUUcT1YusW9
	HswdASQS4uMKk0JX9gDFM2BCZIlrEJfLtxmcsBSIONMZgOa6wfYicBfS2IQ4YZDUtCh43AWUgkcVI
	w2VW0iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJe-0000000E0bY-02Bn;
	Fri, 18 Sep 2026 09:55:34 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJb-0000000E0Y9-0nFf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:55:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356256so198300f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725327; x=1790330127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=PhFg9fiMha3vz9SbCOKyw4LTjjNGpYuQ4PqTNqyKep062GAX6yJ3/TQyTZqezFnrbA
         4a6UqcIKXSAlbK7ZLdxzt80u4nBRfmtFKSswvweY6zKZtyGMjY42w52774lGy2jPAgtu
         XicC9JeX/T3dOgThFH613BIWi1397LqIJYG5E0qJV64oOsL93u9s+ES2avRkDKOAdS0+
         fame9bQH+Q/xaCFmWNFCEls4qv3YpjhkpQ8tIqpw1560DmyS6FJMwAocP24PRgPrutm8
         opqTi3YnXYAm01Z/SXUZZ5MepgdwJm+Sf8qRjEKmlnpRFMcwsXfZ3xVJCwCvSoHPL5W8
         z6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725327; x=1790330127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=pV8nh4N6yOuiJhSVLTGFCogIgemK73d0ql3cfHC8B1xgQ7Njr+YIn4qouvPPPPYoUN
         h+rVzc81aIDgXEyNfC3CJK+DqEWdwzdm3P8DOhMrAFYUZ8uMnudcRIfJCXDSHD0mmvNs
         g2wsuwRZKwlBWpJboXZyYmBLlxwnbxArXE1FOJXHo50VGmsYQhlHiTretP/vPf5laMkX
         z/KG9BT/LzA+e3J4asqwM0fe0FQ7XNRSrivSc6ODxkGzgsLWGVwamvMZbYvYR+G4Nw5d
         g2m+iSYTi1NnCknqM0VmvF6tta4fCmp4t4OijTik9s+ahvTpa+Ox8ddhJaW2PfFJD0SI
         +7Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxcxMCK/bGS5wrVMtyWSTZ88Sy46FGQDk+cHOk85000vShmOu7zRlezbX7BzEE0Hbxh5R3ePej6Qn2OIZlt+ZAQ@lists.infradead.org
X-Gm-Message-State: AFuF++n4t7gAa8l5pb/8fH5zLDcD/JYMAHRLoiaKSCuDAFarDvZwYHD+
	iIDxSpH6pyu4whW+6DBcOPc7Y2IQQcaLZ+3eY0OTa9R4lsTEIhjOUPVPbDNo3tU5uGU=
X-Gm-Gg: AYBFou3Zb7tSMRgxou9aaNamKLca35/0W8t8nqh/qykL3FvXCNpgRFknPF45Nu10/Xo
	GBB5sqyX51ajGA5o2Msw11wF9mTTHOke3lcNxyhJ85rkn9mGuEXiAZn4w3XRy1afbnPhLOIhvY3
	frJBGkcce5MqmkH9iyfyLraR71orc0siGQuezHnjOh/5CJcLaopLL7v7yqypBN6bfXlYs94aywF
	ZTAUUMKK/OiTvfLiheOPhf3mS0Y3bTxYcXBynOkiOlZX3FvWSRwNmBcM197k2x7rZMTaATRAHId
	CA8jpRXN/GboptL3qrONE1RJFg9RK/X7uLu6nHro153TpL/mpoBViq2+D8h6Vy88vo0P4Bg5hyu
	w/LZ9fZmTTASspgu2hlHhHkbN6h1nTfjgVdpDTTwcWSmSiXvYrFp1BAhOrqSFzQKn5EdgOWzPDB
	xp7oNlP4Aa0+5EHJTFZfddlW33OO7CJKCeM/2KIIGr9z/8wxfSEn/OR3D/SVZKcGscMtr1Fg==
X-Received: by 2002:a05:6000:614:b0:487:fa3:764f with SMTP id ffacd0b85a97d-4871db0c610mr3127079f8f.20.1789725327020;
        Fri, 18 Sep 2026 02:55:27 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a928sm3077276f8f.13.2026.09.18.02.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:26 -0700 (PDT)
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
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri, 18 Sep 2026 11:59:00 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1789724999.git.andrea.porta@suse.com>
References: <cover.1789724999.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025531_244919_1B77AED9 
X-CRM114-Status: GOOD (  15.85  )
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
index 0000000000000..be020583fd0ba
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
+  fan.
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


