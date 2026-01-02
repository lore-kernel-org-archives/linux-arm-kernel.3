Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EEFFA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMRntDBW+5EWU7Eup6lBpFcTSPp+X8qdra3fy4r81Tc=; b=fTAVUEC359Yxj4FR5hFledbyUI
	bnDNc4OXSvFDxaOlIL3FgJSg8nLb92gDymbFuFAcKwfpjAstmaCcnjsuEc8gGPw58WfYhctW2QegG
	icjccQpRTBliP+mMDfjArpm2jMKhISEr0pOlAp5QMHFqsHd/MgMJqLshAwDZ+CUfeVXv06n7BiJL5
	rri+e0doNQW1+aszTRBoplMNXKlgUnkn3cYX+ulXP/BQnWS4IZemtMnHie0aKym9/bRg4gu14vA12
	iz2A9sC1Lz4+JtQe6bW2FRjez9WbxVbkmxwtpLZ7MC416u1EWZ0C/tsbdf7mHzb360U3mVe4GdEDP
	YgJv0ckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSS-00000008ayz-3KZ5;
	Fri, 02 Jan 2026 18:01:04 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjSP-00000008ax2-0fKV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:01:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767376837; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fjuv9XzpkJV0m+YIpx2Od1BAjRZ1jGGTgER3a6WHcVd3FcoBn1KGCeiOiBgwnQ7frs
    7sH0JvM57xVJXgwp+h1ShpdZBmhvzg+kckSwlfufuVk+cclsItIZ1zEjsU9ZhEh3/Imz
    dbqb3z3Ju6XDs8WnlxHxqj1RjypBq9qu88uD0HL7YpJONChiVWqO52UICYYthBgWlB97
    LsjKdupRoj6Hk8HZY5xTxIARqspM9ZFzESh+TN5PXZEw7Zvh9l3SQYU94a7Z7CYWkDDJ
    P1SqKWDj8aHF3xeiiNrzL/QMGzgTnnbd3WOo4hUWiKgNFBflm9LAVerXIolid0CUHa+w
    TsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376837;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=IMRntDBW+5EWU7Eup6lBpFcTSPp+X8qdra3fy4r81Tc=;
    b=tQ7FIJa99YLaLjlHScq8399HxmmQGVX6ZZ6V5bK9lkmxfTb8VIbxpc2+lSisrFE/aG
    j2vIHdaP10ZkfcIF19vQNluTMGbyp6QpUH2mbtgCpPD185XMCC3cG9USQ60kP2f6R9YA
    1TH1wx7qORiaXeJKOLpeWHaSyITnWmFXCkloou0oKNIYvxWMvThmsyAA+J5bE2a0eVNR
    MG/HakzLNwNFbxeMaBy/yHtPKkSIsLAiqhSiCyfR8WVao6A/jhvsk5B1Ce6mAmi7o422
    wFQ/YSDKYEBD836Lb7kQBDikMF/MIO/nyje2wvnCSXtrDbKRo5cRWyMUgGSOKxmfX7An
    APjA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376837;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=IMRntDBW+5EWU7Eup6lBpFcTSPp+X8qdra3fy4r81Tc=;
    b=LsuKRvRSLn82MwSl0jhEcMvPIK/VhOtVm6VKB1snaepBDnGSdm3GgoCfvhxJ7wx1sl
    l6gSq5EN4lfDpxguuxKGw8RsRabZBwr/Lmgmnh1MqfZhiodLYfbys7Ojg5FSgcEE2D/I
    FruktwcmVyZZOWDZVa7pAnLp5S/lOS6UhKQay6NGrsL7KfnSlFhryJKmuCzoOq19qF4+
    HA1olmwxv6W8BbUEIvo2gXqnR4kV+8e0r4SOStuIhlpOBEMEdClj28q0VEglZCmCMDS9
    WRNJsmi/nSMbMJFqgOL+lu3wUIUcVui4YB1VKyeSvRE4Z57TRCZkfM3Pg9ojq/Ke0J22
    PhJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376837;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=IMRntDBW+5EWU7Eup6lBpFcTSPp+X8qdra3fy4r81Tc=;
    b=psG28K4t1TAuJEvmoOZ/tJkkjEgh/sj0GKZrC1EXdhgIKoAeR8jYEZdBxrwnLWZmDV
    T7Phw/ZtKVJO8ACS+4CQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0aEU9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:36 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Fri, 02 Jan 2026 19:00:30 +0100
Subject: [PATCH 1/4] dt-bindings: mfd: netronix,ntxec: add reference to
 power-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-kobo-aura-battery-v1-1-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100101_344520_0BE0C57C 
X-CRM114-Status: GOOD (  11.62  )
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

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 37fbb953ea12..6599dcf0eceb 100644
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
2.43.0


