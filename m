Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E496BC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=; b=1ZgIFpxDNK4FOUsUqKp46mGlgV
	CkARSLamGjM98cuWrzyhAHlrLuFKrcjNMniAmh+SoSpCqfzO+M6OLaCXQkndlvekkBJaYvZ932Mff
	dEfl+aTTQyJv+iVuQM+aWBp1h3KOcZGC5fcIzRIvJv9UhkR5yyAVwcXZnMZBAuJKSZAv0JvXOiW1u
	H54+Z63eYHsa8a33/0Yi4uxAZPzagpeDLM58PrlhNVlh6AE5LYUYWpRmdV2GxgpeNrF19Nk8txvFu
	LlJVofghm7FTI8Ha/ptNpNL+vYikjwkgvn0I0v6u+TzQv7znI/tqyYnKKd1Y/GPSaPIF0Zf8JUP3P
	ogNzuL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRN5-000000037Xw-1R97;
	Wed, 05 Aug 2026 02:28:43 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMw-000000037Ml-1HGT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:36 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4ab47c40e7eso227557b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896913; x=1786501713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=JwLY2gXkxBFxJfIxpJGd9XKQwdMWNdoMTygdTpcODT+DOBM1XGQwV+sPjLd34uCTCe
         AETcdSv7bN+cCyKzKyi8KNsDo18468dUPRdh89OfARIprQLLYyO8DE5yqZSxDCDIMPHX
         N+hfOAF1ixvK6rNyrsgCgS1cftb15DavXMvtyGH0wb/kfhjOzIlPoCKyz1WzKu0/Te9O
         LevvRbmiGlwS2udHpTmvDaoG6MT26LPBldDGl23fxZtOEMxGt8D92N/6iDQrU0QhA8q8
         7XaB1Zmrf/u4UJk9JrY+CrPe2EYvbUtpLDIZV+ODWM6VTbWQprbToXMWVa5pYDmRWFWV
         qrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896913; x=1786501713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY4CB5Vy00/NtteUzUzKZor/e0ptbflg+HuPiVWnSpQ=;
        b=HDQ1nqluUVDAE0yjKHyUAP2W59EjWuUuNM2z/GqzwvNiaBQr/+KtP2oBIQ1JlhnTM6
         GhNk/t6i0pinZVB7cbqYyQWiEoeMlaqQnFBIm0nveGonv+aTsX7x7F8hwySWlYIbzSOU
         0DtGkVHfVrOEorbX0BhckqY9e0SXqNKF9rtv+Sr67OtNZN6Sq1o8ju9AQkfc1cLyaRYy
         vVlF540hYBvQzP6bVrrIrl3rKR42K/0jG1WoTobrpis7FFxNIjMfxJsQS4FM/0DTctV2
         rC5vD/xFQFZ4J4vHS/X4nImX8VVADicKQ17rHVngR9QrNDSZBozOyezqLocPOV9iNPxK
         /65Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaB9vNoW7/AMC/2XRPIKAhzwjA8w2d8pRxjJdJ/HC4GjBgl3FjdaF2+rU3K+LzIte7bFi31JNmRPITRwi4cC/x@lists.infradead.org
X-Gm-Message-State: AOJu0YxpSq3qXp0PWYW4LbDzg19w4AhGkhSiEtI7N4iJgpO8+jSsneXT
	KU8C/5tKMp9AhTi0c+FMewVupdy0MWB+kTPESKY/gy/lnYakCMt29UVX
X-Gm-Gg: AR+sD11RB1yaErapB9ZaCUIMptDcvr6UytPtbHNHpkodsgX9wJ2arex+IMXojThZte5
	wAVOP+hxxbvAftZAdhPpc+fpb+av7R+JGProKw/DKFjud4eO/Uzx4zsJ7K/JdBR9bVqs+RqkMeY
	jJKg3TVCiB/f0WaLwwz0+ggSPJkAS55/OouAfeEQNtfAE7rzlL5Z/EEyBm1qoJZ+6yjIckf8hwd
	Se82Wx7Z0Nq3QyQrmF2yvIgnLK+JICyP7mAbUPezi3lBH4NDnSlMBWu/Fx6cNXcejhObzoxCvpr
	D0eFsZejbkfGE2rl9LYb3sgWX4nzJlWwGkRvkfhRsyayNsmfGJ6RH4a8sQFWO2rcdtR+Kl5zuDg
	kBvLlmilSgiqBOx2eClickrxZ5lbB8IaVStRQi+IpdWhsBFmZTZr0LXrbXePjXW6F5YkMWUX8Iw
	61U0MXbfRWLEHf4qSorHlg0WnwWqyBml0EkT+x/eQes9lxbTMC7GtDpjEgmgoooaRtqM+Qam+zL
	J8eGR/Jgxu7nZc/yEDPMB3bM7Hmecf9I3G1SR1adkQyLhPjt8EPJmlkDE2/qjWwjoM4o/6uvNMu
	YMXShZFqhm4YiLtCOvs0Kvod3yFFoTLRzkWd4Lk2d3OxF7i82pXSO57jjSlkKgn3LdLepCYIOJ4
	EoHODSyya4a5ltorD
X-Received: by 2002:a4a:ee12:0:b0:6a0:a791:6885 with SMTP id 006d021491bc7-6ae96ed36f7mr2063730eaf.23.1785896910119;
        Tue, 04 Aug 2026 19:28:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:00 -0600
Subject: [PATCH net-next v2 2/8] dt-bindings: mfd: x-powers: add AC200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-2-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_192834_588880_E4E3F768 
X-CRM114-Status: GOOD (  14.44  )
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

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, the four package supplies
and its optional Ethernet PHY control child. The input clock must run at
24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded by
the documented EPHY clock selector.

Interrupt-controller and TV-encoder calibration properties can be added
with the child functions which consume them; the initial binding covers
only the common core and Ethernet control child implemented here.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..4ea56e99c370
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+            };
+        };
+    };
+...

-- 
2.53.0


