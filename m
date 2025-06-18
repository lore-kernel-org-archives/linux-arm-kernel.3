Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD68C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7Gjkx2X6l8ld7ZAkzrhU6ET1cjEWLvNXC62oH5aFrk=; b=g1bYehSOD/RNDzlI/o48wmmF+u
	0aE88S+ilBvsdlPQte64oS591FHbA5224eMGW8MifQe7va0eeFroGTjsw3xaZJcOqdAODcxGfTZPF
	sNjlBoSQYsWPmnApepLNn29tj3Tm+fE8/SmNrm/ADbP8jEwFaUY9EX7Pp2/F4wMl+xXL30xqpMXuE
	xB0M6g4b1+aqscH3ocMGXjDjkEUceva7scaJdeWVrJ/IUUIQvbQYkxsSpatVnXZ0RZK8UqmpyIovo
	ZKXVxMXpeEfKPePD79DrBkysdFEupT/Q3lR+WXQTM6L101/3JVH1V1eIseebKWNaK1+nrkfBYALIs
	NMFvigLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtB-0000000A7ZJ-0VoH;
	Wed, 18 Jun 2025 12:27:37 +0000
Received: from smtp-42ad.mail.infomaniak.ch ([84.16.66.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq6F-00000009nhK-2Ojr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:33:03 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6t5dNkzV7j;
	Wed, 18 Jun 2025 12:32:54 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6t0QW5zCWg;
	Wed, 18 Jun 2025 12:32:54 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 18 Jun 2025 12:32:40 +0200
Subject: [PATCH v3 1/5] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rk8xx-rst-fun-v3-1-081f02d3d348@cherry.de>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
In-Reply-To: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033259_767392_7CE46518 
X-CRM114-Status: GOOD (  16.25  )
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
2.49.0


