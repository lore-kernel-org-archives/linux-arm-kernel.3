Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB5C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpG/I/+BWWmS26h5n6JKq19fnTLhLa0YbFAXx8ak2yk=; b=1xGp0NDP8W8+rr/+DKqrAaWuwp
	3E6mruvbojGHStRQ/p/7rujN1hsNZGqyRfInz0lr1ibFcNDqaTpZP+ON1BRRT9jHQGGEWYeATel8S
	oYHxo5HowCrx26rHXqWTPyOOu2K2fQ/oDm06mmAfyIDjgQFhyTKmexRgLQNybKXhT67WJD0tLF+PN
	tW7f8IVgwdLoPC8cxannkq0y613+66+OvsSRpvhusK7J7INjd5GvlZbUHUbJ1z+hwDgXOVssNVwBK
	ujwYfItMLgTdXuPOuLmw7DMoPULGwBTlKC5vE3Map+Mmb+LWP+Ux4auWz9QKhpcDlvlUV6Nf3m+Zy
	Ah4UR+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxym-00000000QiE-00QR;
	Fri, 30 May 2025 11:32:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxmG-00000000PAM-0BR4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:19:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so5186105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603994; x=1749208794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpG/I/+BWWmS26h5n6JKq19fnTLhLa0YbFAXx8ak2yk=;
        b=q8aEfgaxH5wmmSzyK5wImiXCsxVdgzbD3WKmO3TmywqULdnctzUtOp1wKfiJaryAMh
         1KNWiXQOJ0sQqIPNNSmPPAsz1mEZpHVhfgXA0Q+sqX2pI3WBZX7thH49ULVjnFVl0U9V
         Y8QidDtgHWDMHLY+g/0lwnS43Td/UtzTmk5MCqP5QXCMHvBdGp0SqPxOhLw2fNUHPNUJ
         xg2gMV9x8OFluU8zKxOrO2LAknJj+jV9ku66K8s2LBut3BPxierdWzWn2zL3kXM/bg6t
         9Rdnurgtva6EdKxk1ai0JxvjUQGYmVNYIvdINcaz62kSqeAf2AcSuHDUKOVImYFSq0m9
         ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603994; x=1749208794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpG/I/+BWWmS26h5n6JKq19fnTLhLa0YbFAXx8ak2yk=;
        b=luGWOCG5HhQ7tSc7UST3c2OYYbHPLiA4Z78z6sDBgpPp65XeXZCqdlHqCTgDuLyi5A
         QLIRLj+WKW0x3O62Wxhed744SOXc1cZdXS0vMJt7RidlAygb0+Exv57ecS6AvhR3Qmab
         tr9hJVQE84l3cmYutqmXZvhOt2gUyXPE0YWo5Zfx2UyvIKWvXfheGLlwtsa09Jq/E+yM
         ZMAUMTZYZbZYIlhqgqSdB6TxewT174TRkCyABrgZy/hIa5BhXpRnvlHZzcx6FKYiessU
         ej+pLH/wV0Kmv7TeoyOdJ2m48avzQo9Pj9MbQbK0VYEvj1RSnqnN3hmrvjYlAuT5YOlu
         IfEg==
X-Forwarded-Encrypted: i=1; AJvYcCUTD7AvIlBRtX8V4hflYA9BSRDHxgwpoU4OfgUNpk2/iaCUFMkDjIqlVbVDAeUfxJwq4zJt3aVvnBMNVluY+AuH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw46v32tKO3lv5hjPaw0rMOeecMOAqp+9/VnfV1Dp5gpeGIJtb/
	6QdGpbQzhIFANs8Fkp3dA+fLy+r6UYiWcOc08blSH5wAy2tYtDy1P+OVTRJhUJMdg4k=
X-Gm-Gg: ASbGnctYfoCsevLB4Hns7N691M5fxK2Rd4pzauQcBTBUg7oBORCqvdHHtfI52dIMTrd
	yF9FcgGnUbqralI1+yFg01LlInR+++TGrXF+koYM5HjjKRwxKRlEgG3tvTc00agKhpWIkt3i3G1
	+09pYHHMAdj206FDjx038RwuvpxHqJNYbf7ohSBYYWv2u9ZRvnXLkmvC2YmFnkXZPdc48vFwkfc
	utAoCmSU9bgVyS7vR+OeGwNuXcpOr6ed3xiHVqtIj4/41FcnVI25+MTuVYbk1AG1VXmoQAffBSd
	8lNQiE582uHge21ydye/yITLHN3Y86zWEPjmUxsM4uIltVF9gdDPHXHob7ZKeNmzG46fbNPDAUo
	LNOaoh5wxJYc8Z9tT
X-Google-Smtp-Source: AGHT+IGUJg33COSzG5y9e9bhXP7pOmJUOM67MeQYRzNHWMgUFeu2KrzZLuJQfaLbp9n6mkOJwkwhzA==
X-Received: by 2002:a05:600c:9a3:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-450ce897d17mr44809275e9.16.1748603994306;
        Fri, 30 May 2025 04:19:54 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:53 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 5/8] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Fri, 30 May 2025 14:19:14 +0300
Message-ID: <20250530111917.1495023-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_041956_083318_EB3CC12A 
X-CRM114-Status: GOOD (  12.34  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S SoC has a variant (R9A08G045S33) which support PCIe. Add the
PCIe node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- updated the dma-ranges to reflect the SoC capability; added a
  comment about it.
- updated clock-names, interrupt names
- dropped legacy-interrupt-controller node
- added interrupt-controller property
- moved renesas,sysc at the end of the node to comply with
  DT coding style

 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
index 3351f26c7a2a..f1d642c70436 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
@@ -12,3 +12,63 @@
 / {
 	compatible = "renesas,r9a08g045s33", "renesas,r9a08g045";
 };
+
+&soc {
+	pcie: pcie@11e40000 {
+		compatible = "renesas,r9a08g045s33-pcie";
+		reg = <0 0x11e40000 0 0x10000>;
+		ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+		/* Map all possible DRAM ranges (4 GB). */
+		dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
+		bus-range = <0x0 0xff>;
+		clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+			 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+		clock-names = "aclk", "pm";
+		resets = <&cpg R9A08G045_PCI_ARESETN>,
+			 <&cpg R9A08G045_PCI_RST_B>,
+			 <&cpg R9A08G045_PCI_RST_GP_B>,
+			 <&cpg R9A08G045_PCI_RST_PS_B>,
+			 <&cpg R9A08G045_PCI_RST_RSM_B>,
+			 <&cpg R9A08G045_PCI_RST_CFG_B>,
+			 <&cpg R9A08G045_PCI_RST_LOAD_B>;
+		reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+			      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+		interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+				  "serr_fatal", "axi_err", "inta",
+				  "intb", "intc", "intd", "msi",
+				  "link_bandwidth", "pm_pme", "dma",
+				  "pcie_evt", "msg", "all";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INT A */
+				<0 0 0 2 &pcie 0 0 0 1>, /* INT B */
+				<0 0 0 3 &pcie 0 0 0 2>, /* INT C */
+				<0 0 0 4 &pcie 0 0 0 3>; /* INT D */
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		power-domains = <&cpg>;
+		vendor-id = <0x1912>;
+		device-id = <0x0033>;
+		renesas,sysc = <&sysc>;
+		status = "disabled";
+	};
+};
-- 
2.43.0


