Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BA9C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=; b=KhWrA5th2zsdKsRkSzL0w0dXkH
	MskZA5IB/rkooFfj6gUPAneAq6t8CcGG+BokOdA1lcjEuea/iUDUbkT4TzWdu1+22951K35S0vL1e
	+hBMhjbY5DUXI6KMKUKCgQSN38ybES88uOHtCVVVYQ+5SUwfoWkkLEeei5r+HylvIyFJdIKV2OdC5
	YQ+QmEvsDTEM+8pAaC4sVilHNDWI4Q8PXUyqHfcWRVrGhUt7nVSL1vn7f0ch0slV7su7EHsZjHpbJ
	n2Mt9NIOOt7Qrb2I7qRkyAJoHij5vT+nrnB+uyOnhMuw59MvD8ueP+h7qZ9bmOepRM05rgZn7KN2F
	3f9EaYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUY-00000006LkL-2jRV;
	Mon, 20 Jul 2026 09:40:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUQ-00000006LfR-0Lv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:40:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495590dde14so12198205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540444; x=1785145244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=Na9UvAdL+4WWn5yOW2x3VVsjLKY7avUgaNll/94nS7QV59+uyWTenKGAi6TXTrE0kX
         s/JTB7OpG9QMX+Jm6sSJypxg3IdOnFpG3ZlCMC5i1L+nptmLA5fOvLrGTBlRGsJ+esqF
         Bmb6HHDpS7VDM9p8Om9z35p4atPb3BkjB1Zyymono7YKiIp1ajQc2hsPYUt6doSWEt5i
         t2nqw3Uw+7zb5v3OxN3CuxDSbfUNS4TBCYJdNC8RWQ/MGOZusdcxa4YAukgdDo7pk6uh
         zzzKuUwyIYrszx7w/mKjcx5iyS1VDkl+raqxtNlLxYpcJmTtt+eibqswxnZjJZSQKbAV
         aWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540444; x=1785145244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=YIGaR3rjdmf7oTBHlu3xSHsJnc/wKoAkXEoWZ0L+HYejFqfVZ8izl47ooz8tjwS3qE
         +XFTdPsQiRwfrO1dtNE46hfzZb49wSSBt+j+TO4fLuLIVXLNJoxkl4/PO/cOykId2kbK
         hnQu4jQaY0dMUobN95GqW5IBjWhoyZA3dcx6cqzqCOvyfAc8gPlPrOLh5LzdB3s5QlCn
         VTfHHbtstqUlcdKc4ZFTnWtdl7cs88k/8cg5618Kqy63toik04eIYUX/Kxx5i90TU+lz
         sRPHBkPI6fKewUW3U6injMfgZTPZv1H8gnFHPhZvLs9ML5jqspueujMYm/G8DwIeDBSp
         aljg==
X-Forwarded-Encrypted: i=1; AHgh+RrLxBwQY+RPLjz2HNXhudaPRRyFv8XTSWzPeNE3ZHDxNqnYpa5Pkjb9YpWE3zcKeBH7y4+IwS0k7zgb3bvNDSyi@lists.infradead.org
X-Gm-Message-State: AOJu0YwhsWDTTECNJp7d/VaR3ZqZdWeX9hgxpqcR3geOzZJMmpsMkm/I
	wqduu9TJ3EsiNi+sU2Vagn7HKPVyknpgo5sQLqszhS9tZoJHND7Ihq6CdtDsjUdxd9M=
X-Gm-Gg: AfdE7cm7l6B0QnYjuFUWqCLKmyPL1P8o0uQmsTdrsk/d5doJnrrjeWTFGd4qyU/tqhW
	QIQ2KTuo5fg8QwCXUCg8IAkgsPJMJ2gxJQauAlR42zS7N8NAgrDUPdUEFN/U8Hn8mCUmtHLaLc3
	5H+DGxKjTcJmB04htKh31hsKBXMHCk6zVAwGAQpOX1fzIAHN2Iktm++6NJjIvrOCfAHOYHM7RiU
	GWnLUpl7d8FZ9h001MkI1ASd17RN67SegIplGBcEnyOR7BkaX9z1/+UL1xO31TocYtxws97/lxT
	xcZeNSrK/tcdsSh7fcdCMpXmlEvUJKl6yfN6lRkP1XnCfACQSFCW6XNLaYgZ+Js4TnZmMnZAIJZ
	qMPaJVFH7fWXXZ20oNnVTQDfNJHkgsJdA4UDevu6bpCYfBzcNpeCisWNL0iobPd+faVfpBkVbr6
	Z9
X-Received: by 2002:a05:600c:1d15:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4954a3f4901mr160702855e9.9.1784540444224;
        Mon, 20 Jul 2026 02:40:44 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47e64sm281394125e9.8.2026.07.20.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:43 -0700 (PDT)
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
Subject: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Mon, 20 Jul 2026 11:44:05 +0200
Message-ID: <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_024046_139254_5DCF001B 
X-CRM114-Status: GOOD (  15.58  )
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


