Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CDAE92714
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LxlG+pLsH21v5FwAitBDXQijxuqWknyeGn1K+XbPv0=; b=L4yOgHB43RnMGg4AAf6QRBT8z6
	mlBgxsOL+6c0MHR5khGmt3kz/YriNtVVp5xb1sOYBa/F45Q0+PS9dS5o+f/F5t8n/j63m229i6Gw/
	4X9iuGiitwwtBUz88zY++AGIYM5jW8s34bwmSiegEFaA28mkvLbjUXWEvwX22zlOsKtY50es6RvZT
	IRTnQfY5Edu5n1F9u5eq99/KnWzDRi/iKHKTG3lGOIEyAhn8lyzl7cZUO45b8AqWPf1aTEiunSiJJ
	Hvpuwr/BhAIdvknN61EMxTQUgDoDlgzZTTTE1L2axp0uCK6XK0ZYplPKo+ZaJoNEIv25AxA8YcWiB
	FMUbfEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9p-000000024z3-1p9l;
	Sat, 27 Dec 2025 16:28:49 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9a-000000024vN-3dOX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 16:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766852905; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AmaG8lufEcHfcRdXndOvpSwo7MhKysgjdAStJveVoxKeZHG0W7HwuHvf8KgmiFyILs
    f4MFOOWItUTF1aBg3v8hAkOZ7W7viPEySAM9FzR5vU3PBWs+UWc38HcwQi6Jn+EjT1dK
    dssFYXPDGPEkSulcfMbOziQ/VqKr0c2rU/XIUeFrqGTAskDVeuN0YNx1xnfsmrpsX7Yg
    2//xicsmjjSC5bELzMvvvhZE4TvpKwDEckjpVWDhGXtbG3dxCrYYXm+B5JGNGF7J2LRV
    b5bJcBB45Rqn2jc4n+u36tXTm/rFihGHoG42GYMvKCMkkqsbA2sotSAdMKdirmLjEhG1
    g9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=8LxlG+pLsH21v5FwAitBDXQijxuqWknyeGn1K+XbPv0=;
    b=hHrDyJ5nsX9sSX+EtcxgRUSOvBhe91RTHOiJ5fXNnG32Nnv6DGAyiuw8LYMPpsq9qH
    M3g98vTojfNlZ/s8pRItFXk3Tj69ErX07XmyVgx3TZCqS8bqGBx7OpjfB8kkQ/wPwpfl
    KRs/PM/TWFHtAEJqIh5I57NEDx4ywI1lcDrrOWNwYQeclZfhwylxBVtoqvMviBS47CDR
    3uNhokTSddYMDnVWz3wbif94yD2G9AZ64NDUy9ZqWBjeWUNZhrj3bxUS+iouZZJdB4zk
    JYOns2yOJHIRGaECtStz+SO3DR54l//jTnqJmEQHZl1OXBBo483K24HM5ISkXdafnQku
    yFnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=8LxlG+pLsH21v5FwAitBDXQijxuqWknyeGn1K+XbPv0=;
    b=RxzYg0RYJmuu63TovFOOieC4G1i5NRskuUlFyiDzy6mZ3QDhyAj07MTtOQEWYRc2JY
    vPygyJeYuHeRSpdq8tOzHuX0eZH+zmA33V8ABFljYVrrUUE6uau1qf6Z0wcXUtKXyBQt
    4qkKHZ1YiatCnuQ1LpYX5btPgKWGa5ZdMcMFp680xm1PC87vAPN8nH9cCedZoCWDMIH7
    j67f4zIBQwOopwLTtMczaaDfvsUhYwDPDJyoWe8VbCvNvM7MEN4A+2Rp213qLFsWmYjH
    2r2hqLvp1mkuMdzW/se+RrhmtyO/1YjFc3hGG5uVSYCLVWisR8gzOWwQLQmC3NnOT25B
    xu6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=8LxlG+pLsH21v5FwAitBDXQijxuqWknyeGn1K+XbPv0=;
    b=PsvsXm9uKtmHbLziW9jJfgJDDricGlFLTO6P40ztCnPQLZzIRH0Hmtpm0TOdKm0+av
    KUBMUq+R2GoEfwRGcWCA==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQvpoIkZXd2bnfIrOV7Mbk="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec1BRGSOtuJ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 27 Dec 2025 17:28:24 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Sat, 27 Dec 2025 17:28:14 +0100
Subject: [PATCH 2/3] dt-bindings: mfd: netronix,ntxec: add reference to
 power-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-kobo-aura-battery-v1-2-328a90ef5122@jm0.eu>
References: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
In-Reply-To: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_082831_060657_48583DBA 
X-CRM114-Status: GOOD (  10.74  )
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

The Netronix Embedded Controller supports monitoring of battery voltage.

Voltage monitoring functionality is self-contained and requires no
supply- or battery-specific runtime configuration.

Battery design characteristics (e.g. voltage-min-design-microvolt) are
useful for users to understand the charge level and are commonly
provided by a separate battery node linked with monitored-battery
property.

Add reference to power-supply.yaml so that power-supplies and
monitored-battery properties become available.

Further drop reg property description and replace it with maxItems 1 as
is common for i2c devices with single bus address.

Finally replace additionalProperties with unevaluatedProperties to
allow properties from referenced schemas.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 37fbb953ea12e..6599dcf0eceb0 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -13,13 +13,15 @@ description: |
   This EC is found in e-book readers of multiple brands (e.g. Kobo, Tolino), and
   is typically implemented as a TI MSP430 microcontroller.
 
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+
 properties:
   compatible:
     const: netronix,ntxec
 
   reg:
-    items:
-      - description: The I2C address of the EC
+    maxItems: 1
 
   system-power-controller:
     type: boolean
@@ -42,7 +44,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -61,5 +63,6 @@ examples:
                 interrupt-parent = <&gpio4>;
                 interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
                 #pwm-cells = <2>;
+                monitored-battery = <&battery>;
         };
     };

-- 
2.51.0


