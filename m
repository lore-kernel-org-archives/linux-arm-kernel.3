Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997CCA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=; b=xp+GfDlFS0hQV7Rrg8XsUrtX2S
	DuIrBkJ7laP7L/ymKQhwXuNyvTZcBnRWhY6nSJWzVUODSIMyk494EMN5Lm2obnfcC18CABBgzGRdH
	2UZDplDm7NBXHDiDGPtdBiJStXdEwTyulajAQRLysSpZiq9kLM0XtPsf75vVg5p7CdFimLdDTBIqH
	oSN/cu6mEt+thV5KQ9CRkxfBImEoHrqGYPQOlOvPmgHmJV8a3g7fCxrexRwZxj2SbuBHcf2n4MndJ
	LeImlsrPGJKP43cfKRA+Bg2AS3ptxvg640LQ3c3VqdpdJ7kMjuCUk3xRpS37Ry3WJcUU4XpM4sYs9
	SKEWaiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhe-0000000846S-1uHt;
	Sat, 10 Oct 2026 13:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh4-000000083Sy-1fIE
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 13:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=; b=IaRDDx5PV2p4iXoLOBJ+wyd5Nk
	dXKez5p2lTzhdCAug9sOwCxP8TIDejSg0HMTo3qV8LHnuGWxhjIBl/1tSFAlqJtmT1lmIldZoH5gO
	QcUMP8xrC31s6Z2UtoaPOVrotzkOpXWcp+GcYTazoLIMOTD2xXZ5nEfrvJ8E30xMpqkOl3BAGcFsW
	lgsxLLm63D7UG0uPcuuQ+8je40a/EFChj3FfqIxIICDO8XqWZacRCEFXSbse3bzd9tiKxNCb/4L7g
	QMEaB6K5mg/kJebp/5uQ660Ef0gSzGDoQBkF8m5Cfch3sqsNUuueNXGv/lV4gAmq2MkwkOlr1J8ze
	xN1nFDQg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFWh0-0000000C6pn-1s3d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so4873605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637249; x=1792242049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=;
        b=GACAlpbKWImtqHYbJMFhRn96ORzrxhdf/CvxEygaitMEj0VfWSR8pL0i4QmzwLvJea
         SIX0fyqO8TEDLh2q0eFTfak8uwqHiEhhqWJ4GXrAovcndVcSVTSab5B68zwus6DOqku6
         q02QeppF4XAYWrAaoO+IYLc0h6WxYva3NAxTiYdBiN+H5Cq09defVYlsRhDCig4nKpPR
         8dlCuvQ4Zs7u7GqkASHW8+r5P61kdyF8bn7N6xCqHQLN+N8dZKMs5043+MfYtdqP51Ai
         Swh5hEGRS8LfmMQNtYp74qbHPUk+XfgRcI2f/CmSgPgKlkELRYNoFgK4iCPyrGob/tqL
         Nwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637249; x=1792242049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=;
        b=GNPeA6ljga/0O0SB9OEM3kq/qdymBdUtf/TuWCLyFj+AljsQ5VMEemRkDp3IiOm2EM
         yrGBd9kEk9w2gsCBHWc33wHrPDc56mjcNDIMZdinSGfMWu1aFCjWPdI7RAS1WKj00uTC
         Rj0RgKh+ra++BSt0YRSpZbeUmh1RGx4NEcsQGb4TjKtmXGYjqZ9Z1iu6PUhvJckxDSDP
         j/fh43HM8U4FB/o3huI5VJrTL04qD25mNubnKUnBWPlCE7IPNAJy4QKxY8MmxTjOl0Pi
         w/zbsWSIg55n4mF0Jtm9rhGg8LydED2cJfgDlqB/XPKBVNX6JbHUNR7HrAnRNNHG5oCP
         r6lQ==
X-Gm-Message-State: AFq9FYLRm3bv2XWnOIhI6cZXnCn/jdvgKk5qMd8XSG/5fq4EvFjZHkiK
	L83S26UjuwJROEve1JKK6JT8E1CYsV2VT0+IuPpZhw0pBs4Z7nFOV98FAShHkNZ/vEhTpQ==
X-Gm-Gg: AYBFou0PotaagRnMxpEAJTiBEkvo3+TWMQlAxkBX6IGNn2Gmg+e5L7lZDf64ZZ3qhCH
	V1H1GG4J8Yf0nzVhOpSwLdDSEHaGppHpCfn6Tl4wu5b9u0pBZYNEhFj9lA5MSehTvWBl123C52X
	TR4AredV5XschAxlrq9sd9SvwaWQHN5ux414N8BtOOF9elLExIoseVDqMmKTnyT9maIE+MG/qId
	0ePE8+nrA43vL3mgFHo6Zavzm8KJECHrUuTbHwTq+sA4K0SNxinl81uBG6k4vqWyvNeOyVLNjPy
	Sv8G7Iiieq2X6Rlw9mO7ftqcIY9Z2C6Ofmw5VjVknthLYdQkjVFqiYqGm5rzHVBsblMxdwlSbkY
	0MJ7Ff+qqOx2SCaqvB8eiA1+0rLJE3GP+xek5vNv1M7ry0DMqF+iBJE3txR2rJzLvJczeHS1qW6
	0Cmh2040SStK9mCI/9LyEpD28JlO3Zcq4BYh1cWf3qK9xWw0uGHOe+oP667NUltdJt1YvBM5eXc
	IGORs5rKI8MxRekcr2EEFZSO/mk/IFIoqjiGP1BpT8+hg9J/BBUqCEuZ8k0lnuJWcJK56/eOQd+
	0f+3apL0SjyTmdmsBgc1szjANkUrajIeUJmxy5L7GveYZU1bs3olWDaPBk4hNQ==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr95353065e9.2.1791637248717;
        Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
Date: Sat, 10 Oct 2026 13:59:59 +0100
Message-ID: <20261010130024.177503-22-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_140050_938714_D4DC2BD7 
X-CRM114-Status: GOOD (  15.78  )
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

Describe the USB host integration with three CRM clocks and four reset
bits.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/usb/zte,zx279128s-dwc3.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
new file mode 100644
index 0000000000..ee26915f42
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/zte,zx279128s-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s DWC3 USB controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a DesignWare USB3 controller (DWC_usb3 2.80a) with
+  integrated USB 2.0 and USB 3.0 PHYs, used as a host. Its clocks and resets
+  come from the top clock and reset module.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 20 MHz reference clock
+      - description: bus (AXI) clock
+      - description: 32.768 kHz suspend clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  resets:
+    description: The four reset bits of the controller and its PHYs, in the
+      order they are released.
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@9100000 {
+        compatible = "zte,zx279128s-dwc3";
+        reg = <0x09100000 0x100000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&topcrm ZX279128S_TOP_USB_REF>,
+                 <&topcrm ZX279128S_TOP_USB_ACLK>,
+                 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
+        clock-names = "ref", "bus_early", "suspend";
+        resets = <&topcrm ZX279128S_TOP_RST_USB_B11>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B10>;
+        dr_mode = "host";
+        snps,ref-clock-period-ns = <50>;
+    };
-- 
2.55.0


