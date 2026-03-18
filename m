Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC3D103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqLAHEEwXnFAkIE7EWJpBFXwpqyj0nN0CIFlRmE/xG4=; b=PRMgFi0y6D/aK/Tg59Wvc8jOYj
	QcasmszA5EnPI3ztUCyeQgneFWtC15knKC83s8UgbQ8p1YkwFZy4vXotsaPJpbSvtrLzR8kCwQ+3y
	wD5CPJ6Ny9r7bH0fRnMskM27xM9B7MS9od4gbe869otb0aGp3+bdrip/067We6sNoUNmHs4gZWZ3t
	CHg2fhS4sV90zkGA4TR6waG8N2oqeBMLVMI/y+OnZ8dN0x4c1fP2xlFQcbL7ClA1hb8RzZasuubSM
	76M+KUgd0PPNNhGrUfjAPiP0s57x9lf8MJo3z3GCRw2BMx7YP0XX8h7qlxODUO4RNWsf0+wm3vPMv
	VSMataSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbL-00000008fOK-3y97;
	Wed, 18 Mar 2026 15:14:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbB-00000008fIC-1pKy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so71863755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846856; x=1774451656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqLAHEEwXnFAkIE7EWJpBFXwpqyj0nN0CIFlRmE/xG4=;
        b=HWX+jvRZn+fN6z9+BTi+a1CXXsi5B4XfBH/H/DT5+oJPkemAl24rW1XCH7PWfz2/v5
         yD9jdn4GTlKk330HNiVYfr13VmoNN2efUuPdGfnZOXM32+nAiV7V8pgcXAEZaqB56VFj
         0YgfvTAAPb50q5BYQoelfiL3BYJtoT2bE4Nw0dyDxn57N54XERZmdModp4NMqTCkPnYM
         PArBqoDbnaVHe5J4r+3T/JkF+81CLT1KJCY2F37wI3M53wcnV+ohlZ3Y5Yt+Rf0rmWbo
         qSAfYm6Hp/MaVtoliqZaWbxHZZ+P8jSSYVZlINuSjo94bTwThARc7BGjMcTKCsdEjwce
         et6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846856; x=1774451656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HqLAHEEwXnFAkIE7EWJpBFXwpqyj0nN0CIFlRmE/xG4=;
        b=FzXu4MGBShcWFFV8O5JhW0aaXqBil2yWaOkNiv/+QOKE2CG/rzS4aaOzkGto+vYyrJ
         CESYL0CzLiso+RHWfzMlzOOMS2D4x8e+fcP6WDcducf9HVeiC20zaRQbe0Qu7HYlyyx2
         k9fs3R9tS6sn6ZPytdHOOCJnsPWDSw1pKbLpXQGUo9xG5/3F9i9KwYqO54VXZVftIvEz
         osI5zlHDXyaEJ8eakBMQEvyB19HDq5rKOzJCIhXr2lVFJTxQ9M+5Zi+6/ljFZNF5H0AQ
         MXL9X/7vpe87ChjvzBlcaoxWk/4WCv3oD0OmBh0ivU7prXTmz1hq5nCql3q7xLYc0EwL
         wv4A==
X-Forwarded-Encrypted: i=1; AJvYcCWGHNM1kQxu9rWoNW8MMkOZedNmfaYgCd9kdg2UCxIh309VIeAM917g8d9ytqKT02GapJBT17uwHz8qoS/Z9+5W@lists.infradead.org
X-Gm-Message-State: AOJu0YxTyGxOO7lSpdJNzty7h5dHrqdZF+W10G8gDL6Q9f9Msc1pMWFB
	Raghv0idOus5/1uxwZ/km3/+7trYAxDlUs0JAaz6Vq9I2un1cFv5JZhLxRuOvKg6SaE=
X-Gm-Gg: ATEYQzwt3No91/4l8Gv+mviyKXJnUmQ9FsNuuMvfyOXjfY4uyVrIVeI/ejImCyAFPZT
	0dazJLrEaDtQxvyERMo2cSrFPmMOnqVPSY3dxTgY68jlelAAYhl1WgpXxPa+PqWUKOI2d5lMZSp
	empVYgNNz1pWiHzUcQCjQNr+K7AEoQIh4Zz72HzTghX3/7stF4Vtc7oCtjT9bUtSdR8mJVfbGTj
	1QRRqoXJESdSWYtTzdqvU3wqGfpP8hbo7UMe93DB7/Xg3A0nxDP7eqOHbYGwjs2XjnBSa3Zso2k
	boKOADCbl5w80YneFXqqxDFgkuClIe5qZfgxh4pLjUSGuoCq1QyWM2voY7QFf8SRdSv+EAbjiCs
	p350IthzM9wj+7P6hpv0L1DdSitQVrgl3IOTIeQz1kUpVlsBKmv5YvU53TIRHuaLOtYirWuJaYt
	rwkNbQONxSVD7zomEZMC7T
X-Received: by 2002:a05:600c:3d97:b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-486f8900bddmr2822665e9.24.1773846855746;
        Wed, 18 Mar 2026 08:14:15 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9dc46sm165840765e9.8.2026.03.18.08.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:15 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:08 +0100
Subject: [PATCH v3 2/7] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-2-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YlLGNqmO0oy++jL1h69SEkdAlw0brbHAP6D6yct/xFM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdByXWWjuf+V8vf6tlTqZPprexjqxXeLtvy9JNrzPm+
 xQJTGPtKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInEWjIyvFfafo29p8d96Z8n
 wqeFS6W3cGfODNuW1mU+9UHlzOTpBgz/VB7vnefQpHLr3fG5eyyYThY2PXK/8b7vaKbt0suvlVa
 9ZgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081417_494929_BC3D7FB1 
X-CRM114-Status: GOOD (  11.77  )
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

Add names to the memory-region-names for easier identification of memory
regions. As the meaning of the second memory region can be different
also require the use of memory-region-names if memory-region is in use.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 15e0286e4926865d88b693998e5aa64543ae125d..775e9b3a193878349590c5036aa884617ebbcc9f 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -175,6 +175,24 @@ patternProperties:
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
 
+      memory-region-names:
+        description: |
+          Names for the memory regions specified in the memory-region property.
+          The names must correspond with the entries in memory-region.
+        oneOf:
+          - description: Basic layout
+            items:
+              - const: dma
+              - const: firmware
+          - description: Detailed layout
+            items:
+              - const: dma
+              - const: ipc
+              - const: lpm-stub
+              - const: lpm-metadata
+              - const: lpm-context
+              - const: dm-firmware
+
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:
@@ -227,6 +245,13 @@ patternProperties:
       - resets
       - firmware-name
 
+    if:
+      required:
+        - memory-region
+    then:
+      required:
+        - memory-region-names
+
     unevaluatedProperties: false
 
 allOf:
@@ -330,6 +355,7 @@ examples:
                         mboxes = <&mailbox0 &mbox_mcu_r5fss0_core0>;
                         memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
                                         <&mcu_r5fss0_core0_memory_region>;
+                        memory-region-names = "dma", "firmware";
                         sram = <&mcu_r5fss0_core0_sram>;
                     };
 

-- 
2.53.0


