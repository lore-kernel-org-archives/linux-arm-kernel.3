Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E96C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXyzQ3RBFjluU5MFZEnJA0kb3eKu5D4kycElIEXz9OU=; b=s9NQAAVulerHMckVL8bIO8ZJ2/
	BKZWtdZl+XK9p4y4UK+nu6ey3sjkM+hgRRtCevevRMX8v/I99UYeM3dkQPkvxFkw8lMTUODkvnQad
	yu5jBoIMfZeMcUzcHVpKlfuqFMeXM9sy3ymM903u8SUI6Oca+jlFr8FEDQqten8PsvJwpyXkRXCJI
	7VAv5xWfB7ebfVb3Lxdrn0NwB1KE25sHc8F9tlVL0ZH0x0Vrjn8982gMcaJ0sUFm7ivbf4mkvjZdA
	iE/125lugZq1WQTJUmp3CQl4qX0zO6LKo9KR/HCpkdmsvxMaO/01Ul8Z2SaH3yg5xl+jpeEyNkWXE
	LYRPAOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjVj-0000000F07O-4BtG;
	Fri, 04 Jul 2025 16:43:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3p-0000000EvGC-0UuS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ae35f36da9dso208330266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645687; x=1752250487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXyzQ3RBFjluU5MFZEnJA0kb3eKu5D4kycElIEXz9OU=;
        b=PgTyJ4LaKtidsdpudU2yW2bWCil4w0Xm0+S2NHAu/AnPVKqQ6lLKcrgWFuV10M0m02
         uaVdb29rASQIgPFs2fQ2Ce0nQ3Tp8eeRaK6/xtiUj9IaQ3h6W2RD64bY96JdtyutS93G
         hhpw6TVXPmLZGJIOTv4ZuEWe+uk/v5+OuGhU+F+psiQv0QULyb8xddAEe0/0gbPi1syY
         wOj2+crHoDr94bnxbPStzcFOB38EFHIIEaBNYRFiCiHy+HcBfOR2gAnNODz5an8/0coi
         QcWqIn0SZhCQzkyfWwrviqQHnHJW3oSQZ+HCI6yjJy3oa8O8eGNbEnA9Qug6ZCwUh1WE
         q2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645687; x=1752250487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXyzQ3RBFjluU5MFZEnJA0kb3eKu5D4kycElIEXz9OU=;
        b=QttRdbpCafHWiPGPW0Db8kDoneyiLcyZ39ezG2ImoHCze29EdGqJRxCffbPsuKt5kJ
         DldCorkLDaj/auqTp9SLmXIkX4kBvyd/1DFxpWGCbqqT2/1B3vftg9razqX8ETuEbI//
         OqAVCL33MDcjlZw7sJX6sxGxh4+NYdaBxV7w6aHhVg0MFgYaNpZd9Ag2cfU7qw4FNSjc
         Fc1EiTQQAmmKD55CwA/UECtPO7+Bj6Y+BG8g2BbXUgn9SPyHJkO31jJ0MRGJGfqjwfxS
         3RRV5AIW/wIK+KE06ymwaXnsK0a7BNnkZ2SrU5xwlx3Z8AYxMXZW+ClmHv4FYGUkNh5o
         yAJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Vbm0/m83kKar+C/hw9zicGb4YbZc83IMt02c5tMmsnWHTTIOJni7Uk3LXduFyFmfZzslS7nbtULlfgIRlTIW@lists.infradead.org
X-Gm-Message-State: AOJu0YyHX4z1tZdWNoOQC6nYvyXdcok08K/LUbmmS9tybqW2iTf4ekD5
	Ll708NuVYwI1mmgVVxkwWrcysr6bKcwUXXj+osDeCdTUEWz4PshXGU1d6v6vs7CzwtM=
X-Gm-Gg: ASbGncsAp8jHthHrIMM7suScHBylwD568xfRzCSjG49ZBdM1ZtEhdLcTT8GlVVofG4A
	Kic7GBb/nKYzdi4amh7SqkHTyd5VMQ3ihEnpdsEKP3U6vCoUynBo05Zn/aTWyKT5HztszTtQ7i6
	QO6qGF+rNrf68r0mZnx9ob4xFaY2fOiA7mnDVqk7CD2BUgen5riPj00p1I4kmcJOcQ12T16WCeQ
	w+DtoEQrPDbw8fTs+BlwvfMqOKwXkV2VcWscqBlcaii2ZnEjIjtP5zzVQy16rXRdWcZJHvSonwo
	BkrvRLmIKwb5ZQY1ZNFSVgwchbt/nP6Ak5futw+fWuN2Xb8sjw+pHcgoqL6n461yA0vl7+KEjWk
	zYpbkchlrIONyEjQ=
X-Google-Smtp-Source: AGHT+IEDflpTvh0P6klOG4RxU2kQw1Fie2pGQFC7OAdZikbSv2DiF4LblPFKqKT3Yf5hJEzuGL5H2A==
X-Received: by 2002:a17:907:9443:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-ae3fbeaee26mr286313266b.60.1751645687592;
        Fri, 04 Jul 2025 09:14:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 6/9] arm64: dts: renesas: r9a08g045s33: Add PCIe node
Date: Fri,  4 Jul 2025 19:14:06 +0300
Message-ID: <20250704161410.3931884-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091449_156842_E4E245E4 
X-CRM114-Status: GOOD (  12.47  )
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- changed the ranges flags

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
index 3351f26c7a2a..cff36e873e59 100644
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
+		ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
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


