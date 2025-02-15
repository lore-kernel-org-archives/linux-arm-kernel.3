Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD0AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UXbVdtIig5t0ncHRRGP/9I2f8qBOLx1rThseRvnVdE=; b=xqQkwL+6yHPTN7s0E72rmGJaj1
	/TWdyE+zjIppp7PfA6I3cmsHlFd+Zgj252GVnekXwMvUKxK24B1/NvdZnXi5XGj6T3DEPwWdLmSqb
	BiO8V2wcG+X9kFv5spwXQTxz2BKEAyssKr7XHrKxwpOEBq295aHS0ee7Pkor53G/aMmGT+w5WtLRv
	LKRuSIpsLlHYk9s2ZBHM9k2WJx0dPrV+/lwxjNwSLbnQSFY0qsfngqXjBmiQBqo4oHq69YeBQvzjI
	V80l9UoFdW5YglAJyVcZTVxHJo5l3vHh+E4NzK7A+1V9YMjPEJI+eV0xcZ3PTMGDrbvmIUNoUw8nY
	m3agmDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHGL-000000002hB-1zd5;
	Sat, 15 Feb 2025 12:27:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHDU-000000002GY-0582;
	Sat, 15 Feb 2025 12:24:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso1680733f8f.1;
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622254; x=1740227054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UXbVdtIig5t0ncHRRGP/9I2f8qBOLx1rThseRvnVdE=;
        b=SCRjDToXtYdfyfrPR07rIQElbRMC+bmjfchfhcDeJGxeMi4lJJjDBgqdo3uFPxpP/Q
         WyrArtZbaCN7ugZ6k8opFqVLPch41uH5xEqy/uIvEMkcWJQGyjJoozr5mw88T03zLqAZ
         9owkOvF6jiwfTfPFPSnEwh6Yo/48IdI/RNc1lsZKqu/s+6Xh5SrdQulIGqd6yCEnZ5RB
         jwv5JWXlQjvNYsaExAD0N/P362BtFMDKNxPkvfcePpc3UqmRD20MuAscFbmKgqYg7yhE
         ksjISINmCBqnGlAHWyi+cRmdq+Hm+emnaCzv/y+cLrDb3hYTuYS8Qi41jdpSq6MICh37
         zkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622254; x=1740227054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXbVdtIig5t0ncHRRGP/9I2f8qBOLx1rThseRvnVdE=;
        b=Imp5I5GZfg/MyIVmKOCoIkY8rMZHt8km2oNn0kYfXso3TKSFHcGrbNcbV+zgjtLgZV
         QRoVJF13eOiMMWyWUc+gYmqYTYCW29T+rrDnzFFdX2EjXyfJIATEi6ZEPoM2beu5ybl5
         H6J8rnKsQIez7/F61lbUuTOPQXr5H8fVU3HBRIs/p8rPgr0HiNKSQICBV3kM04F1P+69
         lTVBGVtTWs4uVh4i7Y9moK9VEqtl5fW/m+qG9KgvwgTjzK0sZl6LahbmTh6fKdVGU3xH
         5m0688R5dkzxYuiTTlU8ESyL8jGO/d0/uZImx7LBAX78CQdCZK+Mgj/Y0ulssMu3Qmsy
         xiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDRZ12Gtjo17xanCkXlh1U2NdMo42ZtnW4JJUCN27Xo7WwS5xNuxPAvazgkTHobnSOHJQp4z9Rx6c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaMLUF3dRCspCssuuGP0qqUvxpX42yDGy7knfPXcvbfBpcT5rC
	mG938kudgZDIDQhUNBM2sxARZH6g1X9PGA/alQdylPajvBJlTitrqMCxiw==
X-Gm-Gg: ASbGncsdOQaTFn0NfocCQi/HFSYq5wtIJ7GgKIuYBxWxD3a30Y+VEsryeg1U4af3IDY
	UeOn7LWOMOPuHp6auMBmfQv78xbnKCm85smx9GZ9fQjq8JPC7oGpUp8osg4b9FgsW4RkOwZduZC
	w7Db0uu5iEl8ccMuXRL7lFOKWTnvyZlIrMOY3V8SBs9mNDwwpbyGEUkrQ6Gtg6yYA4evocy6wij
	SF+7V9PBsuGJpoNQN7f73MRxUAVOQztUM5w6PNgtYZ7MzWCUs7nLmKfFP09eOFPDasT9gN8TZz9
	Lj1cqS603vA92KGByc7X6NsCS+8SUG8tUMsbuIiRo+IczQzcYZCGSMlprE88gWZMRx4=
X-Google-Smtp-Source: AGHT+IGmTv4OOgkCpR0N7S5UGI0ztXikYO3xupHaUrxXT7i2t0dhkLAloMagyk4Nzeo+E/beXj4i7g==
X-Received: by 2002:a5d:64ee:0:b0:38d:d223:f8e6 with SMTP id ffacd0b85a97d-38f33e7df9amr3703804f8f.0.1739622254191;
        Sat, 15 Feb 2025 04:24:14 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:13 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: phy: add samsung,exynos2200-snps-eusb2-phy schema file
Date: Sat, 15 Feb 2025 14:24:06 +0200
Message-ID: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_042416_056563_D9FF40D5 
X-CRM114-Status: GOOD (  11.98  )
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

The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
for the new driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
new file mode 100644
index 000000000..d69a10f00
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SNPS eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos chipsets.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-snps-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Reference clock
+      - description: APB clock
+      - description: Control PCLK
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+      - const: ctrl
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to USBCON phy
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200.h>
+
+    usb_hsphy: phy@10ab0000 {
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0 0x10ab0000 0 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
+                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
+                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
+        clock-names = "ref", "apb", "ctrl";
+        #phy-cells = <0>;
+        phys = <&usbcon_phy>;
+    };
-- 
2.43.0


