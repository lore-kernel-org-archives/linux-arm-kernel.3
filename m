Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE16C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=; b=Usd4Hrr0pYE/KtI7R2bITZN9F9
	H3nLX811PQF9manGNiABu+2hv6D0mqiPraAsT6T4XmGExw8lUcqUfz+Xzum4QyIJZNpeRlR1T+xNs
	w3lkTX/mndOk43uKATsqKyTmWsRQOoWi4/XNZlvtqOZDpev6wEKZ15AynzMoFolh8cOYvQvR3Qque
	5NgtZ/PUrE0MqRJrHbXciSXkHs+sFuiGE1/cMo7vieViCQxCdMUiYQPKYPzQg3Rrlc+gdseOGaVIi
	EXf4jYuHGQu7YTtSqjzMvaD3/XAEl1G3WQqPTfv/IvL6WlhcMu7/KybutvtNHpCwiKgFxHRtYvqvC
	oEkiwl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzT-00000006MrR-12HY;
	Tue, 01 Jul 2025 18:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQx-00000005xps-1RmS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=; b=LvPrIca3BKHDpta7oQ/WIDwImr
	YcIfuZ/otZEBrubPJiFvbZ71RNtMuTGT+Yv0xglqV5nKCsKizxLA/6QM40ibpmHQL6bfeNiGvSNYG
	nE3vumkwt5VbwpAXz5Ww8MdfuE8GA23CsQfKV1CJXbV8iuUAkCMLviRIBBL7EgdhMFkn9i4MNNJxs
	z7fMGWZrOf7Zn1WMlSyrp62aLLQGCZZoUiLy32kLVAvVvJfU+dDJZUy7j3HxCU96ISDvlzXOr107p
	jRk/rdDrchxfSVT88lx7s+EPVnfNm3uymDBDFLNkb2Aaidd0l7U9mtN16gTxif6XwSVpOV48mnkhR
	HS9XRmFA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQs-000000077Dl-28a5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453643020bdso51043635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385724; x=1751990524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=;
        b=tLVu33aCd+WrqTz3yIcnu0R8h+RnpMHUXE328V2aQicgmVY6ajd8lGbZ/9f+/81uQG
         1cFBMdgsvwD+SkwGK3uDXqgTEj0tgjyDuqC2ZeXmt1GASXn+463jckLdx996EmpUdAaB
         jw+sUQ0MBE5xpvBH2jWdXvFR2SDi5x1cJHZxo2BNAKVv5yAOx7GKNu9+3BkyhgLdo9i4
         JkZ/knfTOJ9OEk2MIJkzcS33cYeO7Xdt90SET9xY4NoijPRcrMZUuj1azT9nJCZ3p0oJ
         7JOVgvkcbCREckCmOM49mvjTDrmLwScOvk+z3czQuUO70ZBlHIQFFlxZFGT1u9uhx7rf
         FEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385724; x=1751990524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iLA9QEKpGtzeHbOjLTVI4kROQlKVNQ7ikP4TAnx9ok=;
        b=tXpy4/VJaC0CTGvWJ7rRGxj3Kd1+pICFJiw8OAL6dAJqU66ZAENMBGEzBmtrMFwA3v
         YZF6o1wQWSfass8VinIBvPE3ORQlyM5Yk+EZmX1UwF8+mFjpFKTE1HLJhzg17ZMccF+E
         DdP/GStwTZL10NmfJIVuyZppDxBrY/jkqavZYJbgFo7rKUb4EIuQvsYyaSe6e2atdr1Z
         Sa4VXpINjvZeQptRRTo/+j4emDhFs2OEtQiawScBbEOXAlEsh5WbwbhGerN/nGQECZ5s
         C0GlUt3Xs7TxBrrIRELOmYQUyvqiYBkwGZ0eEvK8+9AIFh+hrKyd8I1xxQnqjRLfhS6g
         EuIg==
X-Forwarded-Encrypted: i=1; AJvYcCXpfL1Trkzgv3AOyjjs12HwUf8PP4pLzs9VHGDfsUnXx7j73jIswumMA8Eg2ofrL0ykLV6XhTTrJAJJN3qaPwxE@lists.infradead.org
X-Gm-Message-State: AOJu0YwDDtw5HMnOoDOGpGFbfABtmjTIOd/3Ca1rFsU4LHJyMvEN0pbJ
	ML84aoJbmb7vW7MFglIJ1Xh4oAI7dyKD329dPxUEOA8oycVQSmJO0ySW5YNG/jF50hM=
X-Gm-Gg: ASbGncsZJdvbpPRqbhVpuqftPbHAL8jk8HIukXaobKRyubZrBJaIcagYh96qbF6Kyw8
	yM0qZkXmfEokYF0AES1Gv8rtMjAkaRNxmRLG7bmaNd1k4zAY490AklLgsWa6jvZrhHsOPwdODmG
	gvC/EUsGLVsLCJzLwQ7sKODeh0iRX2juw8G0BwZpb5mEgIVAmadxeXrDw0OtDK7FOvzWr41w/9n
	ScgMFA/FhuPvDZIkvTh0ia8kOLfUqv/i4jkR9K/VXhfc4ZmSJUBfXsgeBKNiDL+xlD9EwLce8/V
	is1Skn/pOtMKUvCGFs+QR4Lmq508eXNTlL2jcnWyJJkRCgOiNszn3qoLIU4fv3Vu
X-Google-Smtp-Source: AGHT+IGsO1Tqy1W8cXCWGy9JXBxthxXBveIor0Nz8eJbbhghY3Ud/EpiGA9Z8pt7et5bm6LvqUs4bg==
X-Received: by 2002:a05:600c:529b:b0:453:8042:ba9a with SMTP id 5b1f17b1804b1-4538ee8590bmr157396235e9.28.1751385723610;
        Tue, 01 Jul 2025 09:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:03 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:38 +0100
Subject: [PATCH v4 3/5] dt-bindings: media: Add the Raspberry Pi HEVC
 decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-3-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_170206_702864_B49B7097 
X-CRM114-Status: GOOD (  16.94  )
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

Adds a binding for the HEVC decoder IP owned by Raspberry Pi.

Instantiations of the decoder IP can currently be found in
the Broadcom BCM2711 and BCM2712 SoCs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---

Updated based on the thread in v3 [1] with Krzystof to drop to only SoC
specific compatible strings.

This still feels wrong to me as this is NOT Broadcom IP - it is solely
owned by Raspberry Pi.

It is the same situation as for the Raspberry Pi ISP Backend where
it was proposed to have
  compatible = "brcm,pispbe-bcm2712", "raspberrypi,pispbe";
in [2]. That proposal was viewed as acceptable by both Rob[3] and Conor[4],
and the binding given a Reviewed-by by Rob[5].

Yes it is found as a block inside an SoC, but the same could be said
for a Synopsys I2C controller ("snps,designware-i2c"), Cadence ethernet
MAC ("cdns,macb"), ARM CPU (eg "arm,cortex-a53"), or any number of other
examples. They are all 3rd party IP blocks found in SoCs, have an SoC specific
compatible defined, but acknowledge the IP owner and use a common fallback
compatible where possible.

Please could we have confirmation that this really is what is required
by device tree?

Thanks
  Dave

[1] https://lore.kernel.org/linux-media/20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com/
[2] https://lore.kernel.org/linux-media/20240213104405.GB5012@pendragon.ideasonboard.com/
[3] https://lore.kernel.org/linux-media/20240215140058.GA4147262-robh@kernel.org/
[4] https://lore.kernel.org/linux-media/20240213-landlady-backstab-6e7da824c99a@spud/
[5] https://lore.kernel.org/linux-media/170932821578.3062059.18150159256247255021.robh@kernel.org/
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..fe3361bddd1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator IP block
+  developed and owned by Raspberry Pi.
+
+  Currently it can be found in the Broadcom BCM2711 and BCM2712 processors used
+  on Raspberry Pi 4 and 5 boards respectively.
+
+properties:
+  compatible:
+    oneOf:
+      - const: brcm,bcm2711-hevc-dec
+      - items:
+          - enum:
+              - brcm,bcm2712-hevc-dec
+          - const: brcm,bcm2711-hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "brcm,bcm2711-hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...

-- 
2.34.1


