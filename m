Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4911DCD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=; b=1Hb6scVn7CfMAx0Njp90J3sDJW
	ow45AkWCNRqtmrtcQ6LJ5GJiJqltmtTLiob/BsvB4hN3ysyUcC/Q77FQZ/mlhNN/WeHYTGEPHNb53
	MTUJFQyK0JFxpvwiHcAMHH9wAMEDh2CIbGq6X3BRvrMnJqkoCkOfB8EhELkKh/ezpDLgV8avhJTx0
	AkNF3wNOAqO+UF5oFkIT+DboK0DGqgtasfvrV+oi2xn/tOC6U4Lq9+s2usCOBY3t5rGgNEBrPELgs
	f9McvCdY++DDUlJWqYtCf04p5xqfAvKFJZ2pON2QIOUmascyoXewEbYV9v+JzO/DYjTP2yhlC2O+Y
	LBE9e7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Or-0000000B1Rq-0deK;
	Fri, 12 Jun 2026 13:58:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Om-0000000B1Oe-3syJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:58:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490ac10e337so6627925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781272695; x=1781877495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=UrjOLxtLvTGV4Jva+tSM115Utau3xOn1nLy2geLn9ykcbQuZsvOIhOvaE/E6618Zu1
         hlKgneqb6HfmPS8627hqS196VwsqXbp7XZEfPtA9besIXco9U0L1JGAYQ0PZlZ1kGevI
         fho5KAOCilpqaaHcaT7nczeFDMYJirpEj3TvdCA64s7OX/OdD9cGhmDsIrUXx/1E2Dht
         nfiDFxFL+uSj5tjUxE+9Uvo99sSebecNytOZctDemnywZN2iY/BjIoxZK5d8GR+L6B2p
         4TFX2okun0bE6raZBQ2IsC8UD988POQynca2KV1Z+wZWIy8VJd9QVn1/CB3uDltTLuTM
         nEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272695; x=1781877495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=MJBL7Z1N7Y0zYmW2zVyVwwZf/5yLoK/ESontu7aOMyFpWtdmV5MX1wTvGbkvsr5cIc
         +t58D/rFpkRYNoJknyLlPfdpnb20m5FZPR0AHhhrKOmeuOzVm/7pjbMKo+p5PvXL9gVH
         L8qZldvpin5Y+8U+Q9+9ve+c1j5F7B0eZrLSVlidK9lroBo/0m1O6z+MdTj0L/Zg+Nco
         O8pmpQteCbm0HcN10w/AasxRUkFz6W9pCrv6h359sV6zNFXh8gAGm7T9mY5RtXtis5kR
         bRo2bHs+W5BFeFqroPzH8C/m/HN4nSagD6R/ZN3Nu8F7gMCI0RdMLc06ZrX5TDA4+WVU
         8Xug==
X-Forwarded-Encrypted: i=1; AFNElJ+tDGR8mUwug5k9Y8paVASxM4CVcGHCkSnu5w0gruk8yjVpi5yPf3ZtfdyQHrA6s+cr7412i9TeFThAxomEQshk@lists.infradead.org
X-Gm-Message-State: AOJu0YyDBkSLeKhH5cyaOS48gH5ftge7EmbdjX9NZy3j+5MAZ7dQ6fW/
	q3W5aGKAMyW3lzfAppQCvzVNXujaz4H2wmst8SCyk/Xv+g2GTDnpv90NMC7HRawAtfY=
X-Gm-Gg: Acq92OEOVDaEYdvQmzdBdnPChNdi2Efz/hAGbJoQHhPof/UA+KYselFDLK5GK7RlgnG
	70m0UZB46I4Xz0XrZInUDXdWMEdFHzH7IM1wADmLa4rlKL5rIPk7yqUrgUnOGLFBNndCnK6VXuX
	R8tIrf7aWLhgTJAebM1DmP/ESJ4SwrbB2pf1HYc1DxhtUF5TUha6o7nzQRisZ9olHROr300Aczp
	OeHy7dc88dpsX/CXNI9okhZulLsNE4v8OVeyQcG4OwubKMDxIJFMjCJScXk+VjHmClWlPXZMlrL
	x1R9QzhUL5X57QyBkUXtxsnhhYNhypTbhyl9VLOUhGa5CZ1MdAEir/3mBXcgaGpIXPPmUfK2Lf7
	U72p6zgK5pnSPVVEtffbqDXjjEzS0lWkPsSRN+C3TkWSfMupxRLMz2K3hb2Y7J53hPCko9G2362
	26ddWD7Xq6cFkLCiWVi5ZW
X-Received: by 2002:a05:600c:4745:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490ec4fd28bmr39923655e9.19.1781272694998;
        Fri, 12 Jun 2026 06:58:14 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c9057bsm171955365e9.5.2026.06.12.06.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:58:14 -0700 (PDT)
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
	mbrugger@suse.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri, 12 Jun 2026 16:01:26 +0200
Message-ID: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780670224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780670224.git.andrea.porta@suse.com>
References: <cover.1780670224.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_065816_984339_1C37C64C 
X-CRM114-Status: GOOD (  14.96  )
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
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
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


