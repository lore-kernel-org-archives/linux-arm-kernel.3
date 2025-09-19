Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA47CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS7mvhF1JO4dUjEbpDOATr6HeFKK48b7nTeLMm/UrOY=; b=cs8KyBYQh9F9InHscjyPpcsGMI
	FmvPdc2yb6d73ywLwQsAnf/djdImmDOW0BEMoor0lqpniSm6y68HFJeDT7VFjQ0fUFMqymcF0KGtq
	/Bakj1OnGGSksn8WH5NCL0kkOcqYtKeOmSguGrJKtOQSbmZ3XxfoPEVNAA1eiFATyWvsdxni4U7tX
	xBWo0JoaTrejEoSG73CNa/EqOIViZWiD35pDyQ6y12O9c9UG7TAiE6arxWYfIDJEahAkr+IkdPbyo
	kiVpEK0QIJ76c9+W+BymaJwHJw7Bwu7jGj2upJZ3u/WBH+O+1xEmQmruXCUFgNBwCCFQOOth+bhtb
	QtNV17AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVI-00000003Qt3-3g4t;
	Fri, 19 Sep 2025 15:58:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVC-00000003Qof-282k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:58:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso2755781f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297505; x=1758902305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS7mvhF1JO4dUjEbpDOATr6HeFKK48b7nTeLMm/UrOY=;
        b=SzCKH/Njq0HMZ+CFTv420BPbX0z0j4oaO4heGdyEsznbMru6coD5Kis5Bwr7/VSzvI
         9LYeBnwXFEE6PopTx2t2ru7kopNe2NR9SXQcVMHKrJX/9bRxrYWDMSLws9iMzl3ssjzm
         X7BJt8ysp6gCkKnuTtX1j4P2ShdFWNRtZPbPy+oM7gn1RyGNIlMWbWyPZmJxCfl4wBvj
         p4LwW2ogiTMyT5kAnf6Itimi9J+HwZ8/H0tSyBRBssuxBLmvhBQ+JZraDDmBPA07vuVT
         r2r8++RxoMZDHFzfKCd8KVU/tXiz8DuA4203oWaNWD+yECBrAIM8tnM/eFIlpKPG1dSI
         fnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297505; x=1758902305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS7mvhF1JO4dUjEbpDOATr6HeFKK48b7nTeLMm/UrOY=;
        b=jV+ULR5ATvH3s3X+XGQyWuMdAy4SQk6A78VvrjkfOoJ/whzA1iRdB997yIo0GXPL2e
         7Jz2MlMs4fQx/Qy6oZvLft7YlDDkLcvf5GY44xSvkyOkiujJbrTADRb4yiSgPR3V+UQo
         +RKLshkrLp6l8hGqvNAE3/CjrC85gUEeEdhqF/Y2z383k86fS1gVVRvS+aKXHmr+4wV9
         5TREjL6JfOif2Vy65WSdz+FbD7fzU0iKQS8d9Gic7O0d//SGC/b5QFuPLO+3DCEjnDU4
         H7D9PcDMfjqdnkidY5KC/DBVgKJHaj8cNyjXO2OmfljI6kEjaXfYnzQZeIRJHgx5EfKV
         oybg==
X-Forwarded-Encrypted: i=1; AJvYcCUqYIlvnboa7jyrwT+ct6EM/WEwGaLetH7XZn1t08O2HwpLnXSqyErHUfAWHWavWjdrKJxMJg6a6QnKItc4uI/6@lists.infradead.org
X-Gm-Message-State: AOJu0YxskY/k1HYaX+ltzslj4Fuedyq2g/lxnZ2GnUBIRSwhn4j71ga/
	A07Ob34t1mgWaulI+i//uOtEHFEv9xsN89hPujfZoSPp5hyoUZqlIyGy3U7bK9Nw6M4=
X-Gm-Gg: ASbGncu9OwF75GTb8LHRsVjWB2ddARsA84v0FKjJNqmWXY+kEUoXObBeHoVkGNues31
	u6n5Rf94eXCf2a76g/k+XqdAY/U3PdMk4WZ2wsEqtw/7T6fivHjsYGcRoyYb4NVQi31iVcB2mNM
	zlCXOIYMFbLIlrtqIxp9kLXPCVwzeXzSjayFVFKQVgzXOshme9RSxjfbGdsfJdnmFA4I6cYn8F3
	ZOsn9Lg8uoLz/+35d0j20INQB2mwaVKdVZ0IUJABHCY21rdvOVFPUX7nXxYYx9/s5kBGn6YJVbv
	5+nMKwNFBpaLGr06gaVALfOYtFCpGaSlTlXWFQKhPikZJ1oosYQWl3Ebh94BY3E5DtAVVeqDYRD
	lVWgCmcOVz9iDM6MuUMB6wACvmuC3CM6hoTW6AZFW0w==
X-Google-Smtp-Source: AGHT+IGHpr7IbIupTqCPhLagR2/pjjAWy2NRyzBJWRNwFS3zhzcdJAYgjTcIo3v6JaXEdhyc34PL2g==
X-Received: by 2002:a05:6000:4029:b0:3eb:5245:7c1f with SMTP id ffacd0b85a97d-3ee7da56fdemr3546022f8f.2.1758297504630;
        Fri, 19 Sep 2025 08:58:24 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:23 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Fri, 19 Sep 2025 17:58:19 +0200
Message-ID: <20250919155821.95334-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919155821.95334-1-vincent.guittot@linaro.org>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085826_583145_6065F765 
X-CRM114-Status: GOOD (  14.87  )
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

Describe the PCIe controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
new file mode 100644
index 000000000000..cabb8b86c042
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xx/S32G3xx PCIe controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 7
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+      - const: addr_space
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: link-req-stat
+      - const: dma
+      - const: msi
+      - const: phy-link-down
+      - const: phy-link-up
+      - const: misc
+      - const: pcs
+      - const: tlp-req-no-comp
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - phys
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie",
+                         "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  /*
+                   * RC configuration space, 4KB each for cfg0 and cfg1
+                   * at the end of the outbound memory map
+                   */
+                  <0x5f 0xffffe000 0x0 0x00002000>,
+                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
+                        "config", "addr_space";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                  /*
+                   * downstream I/O, 64KB and aligned naturally just
+                   * before the config space to minimize fragmentation
+                   */
+                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                  /*
+                   * non-prefetchable memory, with best case size and
+                   * alignment
+                   */
+                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "link-req-stat", "dma", "msi",
+                              "phy-link-down", "phy-link-up", "misc",
+                              "pcs", "tlp-req-no-comp";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+        };
+    };
-- 
2.43.0


