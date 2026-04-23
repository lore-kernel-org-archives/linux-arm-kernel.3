Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F57F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=; b=XD77C+cTeabSsiz2pr7X2I1FB8
	yBolv4U89PGGiOY9MEYOrblTHqfI8PWXfwnRyfxp6AAQF4LzGhUX9D+AfBnf0HXRXyiaSNUE826mj
	g3PaDHI7oET4XHzNdLhz0S0HR8WAyvAlmU6G68umtucWgo8Z1KMfmxNRbH2ScKtBMfKI5Xg+1uHNE
	8VPdBr0M5SEdTWslQJC1DefQgRucZsEZtwNmICST4ghJPLs2esQ+/p54XUOfDNIeiHRQDq8WGguga
	DUr9vpSHre4AFiwndyLtaDKZu40ho8Lp5t5VL6RqFTuy2kA2YATkfKEzZ1Z6Tned5f56Mmkj9vxVb
	bPHP5VMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPM-0000000BFL0-0e6B;
	Thu, 23 Apr 2026 08:27:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPH-0000000BFHi-08zT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:27:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cfbd17589so5074004f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932849; x=1777537649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=Q5dURj0FURUjlyJc/JMRiUZz2C8EbtTzj3iP+nQoutFgUXe6cYgF9dtNBXpOMJAhGw
         P0M3dyPy2tYbdnLmqDgtZ/OV6pKNbX6jp3khYa2ndXd2JXnJgmGwGZeKgiclwyfrdV/v
         ZpRqlNAuLjYoaVMw4sryRfqo9jx0oVJULGGNMONBR3hYbe8BCAZtVPi7VXn9BoHSvly9
         Ts7M6rZn9LQVsc1xjuwYns3X64IYAi+nvRfUBixM+firFNnvdpJt+8zWpj7tVLPeT330
         05nR9DTjrQOjhXJ7aGAKPiWdXzab6IA5IGCYTGMBZc0KJiBqzpHhTF97ZuIf58yuAz9I
         fniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932849; x=1777537649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=G8/Rbwpxui66zalLmb+/gT8Bn3cSTP+u/MSvAM6Ppl/yECrPgXNY3amKNRs5ikMGM9
         v17whBU+BZaYamYKi4wtUZwODgdlP16aTVy/bSOFaMrWo8MckAo45sBM2fJxd/SjQMNS
         kr22hDvgUhJKJkGMGBAs2R3J00uAHtZrOTjMLq2Ye4f7EveM+Y9GQJOMJ+pEVGcTv5nJ
         29i2/DTNrkVhA87ZWhIXHBCV1b84enCHwJu4F0TWgofSREttDijiJWXB2+joVg5qIn9s
         Ce1wBksxdKIlRcF5SnXp4w16BdV9HfhBCuT+v+tOrqqtmG7wMBfLoZbC1ssxSEog8Wpg
         DhEg==
X-Forwarded-Encrypted: i=1; AFNElJ9AZeAmeZc/Z6UV4QKxZczC0YNwl3x8UQB0AyWC1vNzMPJVuuFAeB0iitNJAC8akF7Qfic5V6SL1XzrfngoMVds@lists.infradead.org
X-Gm-Message-State: AOJu0Yybwdogn1nH8d4EbByEci9trDMIasWoFq82aPZ0LwCCSyk7k0g/
	n/1Jffn6wC5nFWEUkhMz1fVPIQFM7Wy3e17/xcik0U3Gnr95+WC1c0nVCqusJH1bick=
X-Gm-Gg: AeBDievKYINWF8kLuFSbHFhxFGWi7fvbsNaRhGjxaqr0ffG/APmS1WVzsdnxmyTI3hQ
	se5K0JHjRNIteYl5WFQakJMnfXFYwuP7bRAhXQ0HtviTGqjdJgT4wrBV01FtNgJhsG5aRVCjcUq
	eC2CWp8Yvosmsy/kgWW8uoA+UuWXGb1wkgxxxYoUmq0g0P0oy2B5rskAAOBdPvZK1jntkH5BDdh
	p1Apo1fLddfmAMFSDeI8+S5IJZ4sINE3v/Oct9+ktRE83mPtX04G3G1PCCpJubvQCapyWvKp+7K
	6ya/ajPWCfpAFQxzzORsVwjOUOErYGWJ3UPUCk4Hpz6yn4snwAcpX/chMFFuXFT7B/8YbFWL6qv
	P/I0j8gAo8cLhnXYjAFKCXY9yXq4bjiAzL4zSBMpogHQ85VymczCop77zYXGGpLXrM6PgLrqo00
	f6FoiWfQ7US5Tp3qk2tPCtb5bVgxqpDTmK3zMiqtefBSV/IJxDdR0Rsh8+h7aNJWZe0nyP/MALl
	3p9y8g=
X-Received: by 2002:a5d:5d13:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-43fe9902f8dmr34420482f8f.35.1776932848874;
        Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm56836569f8f.18.2026.04.23.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Thu, 23 Apr 2026 10:30:19 +0200
Message-ID: <f21a27b3eed72014cf21650ab22ff45446554d59.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
References: <cover.1776932336.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012732_267686_9DD09C21 
X-CRM114-Status: GOOD (  14.52  )
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


