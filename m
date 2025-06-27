Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB508C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QwHnkBZDE7ljh4u8sJ1ASBVSGbL89HUUuSj6mKj+pk=; b=WHZfR5Kt6B20Vef0bubiO7X5Ur
	YKsgNY5dUg2rdKGlSWl/K39DLDk3iVUU/fUsG5SMedvtxlsyu/grD/QXtAqiRBcgsxzf9rVu42s4G
	DNyaLOiklGTbZLlhMAhFmK6qoYfNVDdmShNkjVcByEQOu0CfBdckWBhBHeka2IkaqwMUi412M1bp1
	Y+i5l/kdKdKu3aR4px/Wt1D36XOrTaaV3C77YnrRPqsqeDXrN+oJjMoKUsprd4X09czZfz6UjhwH3
	Z8Nm4cH16qmh84YHh7KKjNJ3NOH5nLaMqvqWvE0eAlhtGYMNi3VRCYyyohtZcJ84Hiembg2TeCMrl
	ZvSFxn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6wz-0000000EQPB-465A;
	Fri, 27 Jun 2025 11:08:57 +0000
Received: from smtp-bc0f.mail.infomaniak.ch ([2001:1600:7:10::bc0f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6in-0000000EMvD-2OpT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:54:20 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bTC9K2yQlzYWw;
	Fri, 27 Jun 2025 12:54:13 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bTC9J29nszy7b;
	Fri, 27 Jun 2025 12:54:12 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 27 Jun 2025 12:53:53 +0200
Subject: [PATCH v4 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rk8xx-rst-fun-v4-1-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_035417_745083_262D5DD4 
X-CRM114-Status: GOOD (  15.73  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC allows to configure its reset/restart behavior whenever
the PMIC is reset either programmatically or via some external pins
(e.g. PWRCTRL or RESETB).

The following modes exist:
 - 0; restart PMU,
 - 1; reset all power off reset registers and force state to switch to
   ACTIVE mode,
 - 2; same as mode 1 and also pull RESETB pin down for 5ms,

For example, some hardware may require a full restart (mode 0) in order
to function properly as regulators are shortly interrupted in this mode.

This is the case for RK3588 Jaguar and RK3588 Tiger which have a
companion microcontroller running on an independent power supply and
monitoring the PMIC power rail to know the state of the main system.
When it detects a restart, it resets its own IPs exposed to the main
system as if to simulate its own reset. Failing to perform this fake
reset of the microcontroller may break things (e.g. watchdog not
automatically disabled, buzzer still running until manually disabled,
leftover configuration from previous main system state, etc...).

Some other systems may be depending on the power rails to not be
interrupted even for a small amount of time[1].

This allows to specify how the PMIC should perform on the hardware level
and may differ between harwdare designs, so a DT property seems
warranted. I unfortunately do not see how this could be made generic
enough to make it a non-vendor property.

[1] https://lore.kernel.org/linux-rockchip/2577051.irdbgypaU6@workhorse/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..eb5bca31948ef0d39c46025d0cca65b8b4105a50 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,27 @@ properties:
 
   system-power-controller: true
 
+  rockchip,reset-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    description:
+      Mode to use when a reset of the PMIC is triggered.
+
+      The reset can be triggered either programmatically, via one of
+      the PWRCTRL pins (provided additional configuration) or
+      asserting RESETB pin low.
+
+      The following modes are supported
+
+      - 0; restart PMU,
+      - 1; reset all power off reset registers and force state to
+        switch to ACTIVE mode,
+      - 2; same as mode 1 and also pull RESETB pin down for 5ms,
+
+      For example, some hardware may require a full restart (mode 0)
+      in order to function properly as regulators are shortly
+      interrupted in this mode.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.

-- 
2.50.0


