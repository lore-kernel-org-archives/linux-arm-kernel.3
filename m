Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5hy3Z9jv0vrGFeBz0PtZBTuwjhzXWCPOOX3HmJCm3k=; b=Rr8bnL26Oo3bZ0ogwuu5LZnzv6
	ykX2YI5K048qcszInpTNCNn4KA34/GcBMVCGQhQDltGX1mzFCIgE2bJx5rKCfhyFxKwNTGGTbN529
	GkPoH1S1WJWIOgccSCDYvdbqdaeQvSSGWGfgkfNqg5cBUGEZvAxplrdZUP7a8ECTM3LDFJB0x47UD
	bVNmvHxV84QrjxmUKWYbVMd/6Hh2cNYt9tthHTM1ua3UDkuX88eJeXq7rUBc4qLxdsy8E99OJ4yBS
	BVIctC8HVMfTtLqp+vr6yxjT+2EVdesnPSvfOhWR3TLv5IyCbfiDblEKjO732fPyz3baltcPhLzOa
	Y9KOUXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTR-0000000DVJN-3W6s;
	Mon, 06 Jul 2026 19:59:25 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTO-0000000DVEL-1GK3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:24 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1523855a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367961; x=1783972761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5hy3Z9jv0vrGFeBz0PtZBTuwjhzXWCPOOX3HmJCm3k=;
        b=ICEKzJrmOANNHKt+zVRyPrTW+K1vQrFzAR9Jov+JYmZiyU7hSmVSg2MFEuOinEHWUE
         ETFSr0yc0EcFTI+UWclMQigaMS+Xbq5C+jMkDeQUEzNmNAep3hypLCwExA/vSsA+I1qB
         VI4PiGaRlkYVM1P0NSkhCtZ/sXn7VJIwhlzoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367961; x=1783972761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5hy3Z9jv0vrGFeBz0PtZBTuwjhzXWCPOOX3HmJCm3k=;
        b=KcYKmRBvN+K5e2krfoqOF9b2VI+wj8bDJ7ieIRiwBEFgCRLMPNpwweMnMpga8I+TW0
         AMbvpeU5j4Zi4BVlHQEwc0R5zvmjCvygM1nuXX1jlvl/j6JMRpod7mBHfgD90SmJTGwM
         pnChJKwVtoAZdsd+TER0cHv6hk0w8e5MVkkA0a8iYjGhw3FloDbx2gv2QTmL53C0elPq
         ncVMlLSMBkEHsnIivKZ/8xSUEEi/8IFEqWhyzfSd9n8mL8vs2/s273DMzV/xmi4CZUKs
         4IUlUk+ZKOg2PZkMMUP+FgnUE6aBwtSTPQzUZkc78rbgT1NqxVeO7uHEJhp5OIMTi0nc
         xOMg==
X-Forwarded-Encrypted: i=1; AFNElJ9WKKLHvYFgykV4MjuubO5ip0/hA9k3aUjojImT3Q8DB1jfOhhMFTCnUnD/qRWAGn0wMFCAabwxrU9oZuUNQ4ec@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxoiehrlDhjqFkUmtoHH97/FdqE8PuIGT/w+dojzrh/Mfberb
	x5zusUaOOqDDTdumGy3obysnaO0an5i0OWuFl7A84IwrrKB0/lXaTpwP5mz183hZfw==
X-Gm-Gg: AfdE7cnkABw6V20CxV0FaIgLA5zMljJuQfRAPa/57gWQ96lTsEBuNzoubwWlPJxpuJX
	wXTnKcRxurN7SL81hoxK3Xj6N3EWRi0jd97nN4YioOkX0r7W9Vu8SvfjjCz2FMQQX+wx0ISEvJ8
	nScjigwrJ83rN9nkB/9Sz9JbI1bh15/GlZFKgZRuzWzu244gav1lMKZC3ZQY5C7at62qO9ChdH9
	cEeCQnBl0fGvouLtSsdmjHbC/K1W50FrN/VN6m8ExJ/rZFZvf9RgaRMrTnpakZAU2rT25P3b6PH
	Axby5caI6Hj5mK7dFgZjKRuiVTByHXmji8KMafapV3RFDZay6I1TXWqvTO6LUG20LpN4ArXiSBG
	/t8+n/txHf1H+6TuDQj4T+etJ8prDWcC8IlrjDG93nLsyy/vMHqalxE8GlZwmXZIHWLxUFHxNlC
	O6RSp/pBg=
X-Received: by 2002:a05:6830:680e:b0:7e9:5de:cb93 with SMTP id 46e09a7af769-7ebb2346cefmr1219468a34.18.1783367961281;
        Mon, 06 Jul 2026 12:59:21 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:19 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Mon,  6 Jul 2026 13:58:01 -0600
Message-ID: <20260706195818.3906949-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125922_967962_984BDED4 
X-CRM114-Status: GOOD (  11.43  )
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

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF with its clock-controller child, which provides
the MMC drive and sample phase clocks, and the IOC and PMU IOC blocks
used by the pin controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../devicetree/bindings/soc/rockchip/grf.yaml | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..349fd3393ac4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,8 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-ioc
+              - rockchip,rv1106-pmuioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -100,6 +102,7 @@ properties:
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
               - rockchip,rv1103b-pmu-grf
+              - rockchip,rv1106-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -244,6 +247,33 @@ allOf:
 
           unevaluatedProperties: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rv1106-grf
+
+    then:
+      properties:
+        clock-controller:
+          type: object
+          additionalProperties: false
+
+          properties:
+            compatible:
+              const: rockchip,rv1106-grf-cru
+
+            "#clock-cells":
+              const: 1
+
+          required:
+            - compatible
+            - "#clock-cells"
+
+          description:
+            Clock provider for the MMC drive and sample phase clocks,
+            whose control registers live in the GRF region.
+
   - if:
       properties:
         compatible:
-- 
2.43.0


