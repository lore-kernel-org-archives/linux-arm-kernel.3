Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDDAC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYr0H8H+3w2Nj4aKKiG0KJqnlsCXDI1Lpa8vdufXlPs=; b=mxnP40ML4ai4VpxmJBvZCQMNZ8
	YZ9ZR2ler398+hv0RSJPV7A4Ld6+Ki+LhyknEmOXVnzZk3STvJs90QNU/B5fl9fIKPQp5pINNkQuF
	6Fn0979vFy6sAgn6xZHsMpKY5+fNFJJlfnem+3BKg9bYkKdzPjh64p8tuY1Hj3FNo9jJtjBXBkdZ5
	SZXwxAomIDsc7UeCCQTX4WboGn7WZJ8wpNHyBigYVB88s5YcTUOD11gn3zkpy12dfBZOT5eJ8836K
	bLMVB1C5JcjLVznUXnOw5enpOip1OvvwAl2iikEM4DZB4fkeWzH69EKfUBMvAqVLX3z/Lxfw63U98
	SO0T3jAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP4-00000000jxb-0foU;
	Thu, 03 Sep 2026 22:59:30 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP1-00000000jtY-3Mnx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:29 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8687630fso3925345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476366; x=1789081166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYr0H8H+3w2Nj4aKKiG0KJqnlsCXDI1Lpa8vdufXlPs=;
        b=jBKkmg+G2tprpcEzDDk5/HAwwcmp16nZmT61F8uJaMozo63FpgW8E5OCw4CB/W+2Td
         Is6YR+cF8k/f5cJ8zRWSeaCIpiFJ3UmTnV1n3+whe5VuouuRooX2hRujGv8CHTs4uz3x
         nvuDTFOvlxaJ7MbBIVZwXHfiJjw8TFyQpt5MkycUfjNq8XVUqXny/+DPXnDHZxDXYC+I
         FQnoZAnwGMEwc+3O1WIwgNFNaSVXKiLOLvOZMJ5+KOsvdaD3493Na/+BJ5F0mk/GOusC
         ki1nNuTM41TQCoxSvTV6k3P9SIrZk6gKoD1BYcXKQfhLVWz+N4/laJlmhGwvxJA15Jxk
         T0gg==
X-Forwarded-Encrypted: i=1; AKwUvBzA3pFIN/OCfzbxPJukfN1cmBliF1IoYsHBIzI/RuMlNbITrf5wvSmoNLTOieaaJjQA603wgHkbtZFdg3xI6SCu@lists.infradead.org
X-Gm-Message-State: AFuF++kRk8VZH2KkZshc3W7yBZOy36Rxjk9EiHP8MVCxTg+iS289xUR7
	o8bcsks9MGF2MFd/fOip/U/ZdmX1PLZ8UxLaAjFmVANzdL67Se9VAaAa
X-Gm-Gg: AYBFou3mX4OtrTJn7KGOhiQRSx3mh+NksZX8x4HM7HV7JQ1TF3JibHRjBqjUYJDxINR
	uMPYDiYt7HYVuzGIXIVwPKqR8w8jjvIvUHn0/rNYhr2QW/+nLDO7KLwhUS2vWr/m4+Hxr9vrf+5
	rX+/Z8H8hi6RbreFWApAaqeHkqJxAMDF1OXRWSk8/iMOR82MP6A69jf4POf+JrDCVCqOo0eeI6L
	xONByQti9hCxiEkxFNvuyM99StstfmddrvxgtysBlMbWfPOWr7ufGw3kdbCcFiCAZ89cqNrFXmw
	i1B3Gb5Goxse/MWDtrhqrquiVAVmhd9JKyIZnnNXA/9tPnWf5pK7Yu3ntHPonaQW3LyfZW2eBS3
	1M0dSiep8mlozoqAo5nwacc3bXXWRdRVWYrMhhukrx9fR18s2+Y86TxNbPLRiQeBbcC7GguuePV
	RbCAFFcfyKdHBCi86wR3ZtKkFR5YegEGlFvAQVY56Z3aqZIAOE4eODbdmLdRXgvxBUPYmsgRyl7
	rXWyzKNC9SP2HHH1P3XHwSOog==
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr290268f8f.47.1788476365986;
        Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Thu,  3 Sep 2026 23:59:18 +0100
Message-ID: <20260903225921.2290441-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155927_875863_819C559C 
X-CRM114-Status: GOOD (  13.39  )
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

The SD/eMMC controllers of the T7 SoC are physically far from the
NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
in the middle of the bus path to help timing closure. This stage is fed
by its own gate clock and, when that clock is disabled, a controller
that starts a DMA transfer can never complete it.

Allow a fourth clock entry, named "pipeline", and require it for the
amlogic,t7-mmc compatible. The other controllers of this family keep
the existing three clocks.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..12342b1d78e5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -15,6 +15,23 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 properties:
   compatible:
@@ -38,13 +55,23 @@ properties:
       - description: card detect
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    items:
+      - description: core clock
+      - description: clock input 0 of the internal mux
+      - description: clock input 1 of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
 
   clock-names:
+    minItems: 3
     items:
       - const: core
       - const: clkin0
       - const: clkin1
+      - const: pipeline
 
   resets:
     maxItems: 1
-- 
2.55.0


