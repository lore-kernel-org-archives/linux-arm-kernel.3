Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D15CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72qXvrI1abXH3Guw+vBZYFqWh6SdLLj7B8w8ungRwZk=; b=4a863OBZUMZ3IMxxViZUuFMbLc
	DBTg89iGP2KsbJxOFqhY3NsREO+2L15xLIxmuxWUcWhiAc1gMLLcqwjRzDS8pTxt1gpFjwAYT4opw
	UYx7lDoCnVbZO2rEbRjUvZumQvikZ/2dgjC2i9VItSjJdfDJd7EBI2dAxKZdpufHqF7zak9Ws+gBW
	D+/hL09T/s+XCKtGaobw1i0f0HmzyP1FY4OjsPVFuozu8Mev7cI0x2DborhDV2KaqKV/C3cKkWW8S
	RFJqaP2fg/ANrXBYtnvGpz1D6v13EXdZ2g2UpA5QWoym5FhuerbfT0SsqygOrgo/drDwxDw7PCIal
	KksWoHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgi-0000000BxCS-2JCe;
	Tue, 12 Aug 2025 20:33:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultgg-0000000BhsE-3KNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD03E5C4186;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 798D5C4CEF0;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=dp8uCVb8LD0lYnS4gp/nmqX07iPx3Lp8CElZzc5oZ9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DZ7ogL+qgE00dLCMdHJEe+tUmi2xnlLw9iFhMilVpyw6QenSDCCMzRXsWQ9mOPqDg
	 piZ8FnQEOz3w4WkGtOHodhyFKynAfbbghB4CeaCfBngYKrUiJ9STmfSCBSoij5A7vI
	 jDq0B0iGDtWoVl1hriGB+BXFVWXiQL6NqnIgHV7RijZQipmHkPUdmLGx3weujXCXyR
	 a7Jb8FH6U6pOCzfDnaKSdnKFBA2jbqIQ9doilM3sH5BkG6y6bdiiYUFRKfEAxQGvHh
	 NX8b/k1rKvSc+/7XquExUS4lk8xp701ytWb2rDCJxPPrVozFT96ZmZl054/HxsUD/M
	 52RRJqW6nEV0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB0BCA0EDB;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 12 Aug 2025 18:25:15 +0000
Subject: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=dp8uCVb8LD0lYnS4gp/nmqX07iPx3Lp8CElZzc5oZ9w=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsduEX7/Z6lM9Yvq0o43917LSnIVejivfbfJKYYiL3I
 DHj2H3hjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEfr5m+F922LHmQ1id1jnz
 NrO9PLN+27Wcc3OO+3byXuD98xt/cX5gZLihr9tVlH6LWe/itZ8H+MU2ZCzZoTvlrlWRXotlvpb
 re14A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112530_925547_6F2F5978 
X-CRM114-Status: GOOD (  13.67  )
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

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/mfd/apple,smc.yaml         |  9 ++++++
 .../devicetree/bindings/rtc/apple,smc-rtc.yaml     | 35 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.34.1



