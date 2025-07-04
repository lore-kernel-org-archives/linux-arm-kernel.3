Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5179CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmGBN4vguwr7JXCGrQEzsAEtM0h76i9zDt+HmVvYfZc=; b=glluC8Vw+EPRQX1wK1q5Yjio/p
	WU5CHFbUc+u4ruNZfuUtrG34gai60SWJSgK/Qyhvz2Q4lBfV9tEXj4mcHNXsOsK2GfoQKt+Q+bfvQ
	y2elVsjXz6GpAPga9zFGxmWEQnF7tSFYypjjJcQspiBXZffhLR5xwSFnu2q/6zo1ThHRubM/w5dRF
	JuJgZabs0RX70VBOtbPgbFj0ONtEX5y0Brye+JDqpbKFiyFOf3exY4/RKp2cj1GwIjLvDlUUdJrN0
	t4kF4Vdnjuzo1oQFaA05wciMmV5IMEGOgS1Br6BEfLX5gnvs9CjxLWq6LYMB8NnDM4x4aRUB75K1n
	2mMhJ2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjMN-0000000EyYa-2rLU;
	Fri, 04 Jul 2025 16:33:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3g-0000000EvD1-3Pzk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so1599884a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645679; x=1752250479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmGBN4vguwr7JXCGrQEzsAEtM0h76i9zDt+HmVvYfZc=;
        b=fIbt+pYMxTpx0McKdbh4kB81bEHDRpH16YVP7pDJXWX/+s6yJMOVHY8+uKJzKMpoOO
         B6YGxa80Hjbz2xia/9j+ZBhCxnmcFUFilalpA6E5eXtO/ytgmoc04rIKVr7ZaWkOtKsY
         j4j5R8S9iLbsf69I7lK+3o3UK5mFeeBPW5t6hkojZoooTS4+GBJYPSWHGF8+f9YeF8q1
         LDnH254cMlBtREA9+5B9D1aYVN6LURn7qj297MCKR2CmtPoiVTZ89EBrZs2+zBLkbQIr
         ucON9V/MalB/aSvk+bY/SEVdbJjrtK92tdWQxUgp7ff8ix/mzcRkYf0dFrpBntyxvUng
         yHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645679; x=1752250479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmGBN4vguwr7JXCGrQEzsAEtM0h76i9zDt+HmVvYfZc=;
        b=XuRQTDQfnY7d0d/YyjyCin0fn5zpkpHlLqU1qXOfgskRPXI6mu88tBEl0QvvC3FDtP
         ZroP3jx/21pf0DFbZIq0OhwY3trYtMr1UmDNrOGvwAPY+ejhal0YuNipznQ2P/1P4TY2
         OF2nH2CefvfTabprhfXf3Y+B7SfKYLnVqeatvk/irBHMRGX6OFVpc4TKYyNWYuJfVR2/
         +VGBX2uDRyEcz1o3PwZQ+OnM2HebHuMGaoGrYaM0docFM9v4Ru0th0g3AqukquleniMw
         NuksJcCj75M9Kw0fxb+VanTaTgo1VCcMB9P3ajn0zpXlI+ZiHk5dZUz0sGYbomsSM1+X
         tJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWXBMifoirrtVFZNHV5tDOK0z1xpR0wdLOa0CgVEUeBYw6T8BRrzp0rN/eu+IH8HiTXv+pWQPWs6gr4FhWEhof@lists.infradead.org
X-Gm-Message-State: AOJu0YweNCH3iDG1nyfhj4WCrc5d0/w6syy4GlnWWd6vtJPAZmATmZSD
	AmzXOK17lLCHAzi0YkTTzRvsnuC7bTX0o0GIk/N3o2mwWk4uyOzcUXD5Qw6m2VUdJKs=
X-Gm-Gg: ASbGncsIPnxThdokA6wmVkDfmfil/EDpdWzaHRgPFPAk4adQ1v/fiVgOanH7dWhw07j
	MZd5Ik6IKj2fVekHT1JRyOcwA2ENZDKVKQUNPeA+055ktkLib/YIRy8DrbjIa1iGwN+muCgc7vl
	rf2Udu3a+PYhbc8RqgSVPETuXgLg+WktUwpQKLGisdzHnB2poSS7L6W6KdDJlic1cgc+3zwPt+B
	hLfm4STx4N1WYhjp12J6E1koM/YzWJ/SAoFbidrf/Yn6TnJ6hzUAV3Q8nJ9H5TBoGOz8EWBUxv2
	3bjZZ33X6GFrYrCybmwdmLW6AglICBKaZsFgsdy07o3A3UaLNFDZR+GrElI2E9Ys4DCWHGPxkf5
	OazGq1o4rkeNYnb8=
X-Google-Smtp-Source: AGHT+IGi14ev4epMFpAVcULI0O8fOQuvZidrlt+4KBmokmlyAj9zyscXUfCOlIWYAChv9XzOSvBlZQ==
X-Received: by 2002:a17:907:7ba3:b0:add:f189:1214 with SMTP id a640c23a62f3a-ae3fbc5b749mr340373166b.24.1751645679233;
        Fri, 04 Jul 2025 09:14:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:38 -0700 (PDT)
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
Subject: [PATCH v3 2/9] clk: renesas: r9a08g045: Add clocks and resets support for PCIe
Date: Fri,  4 Jul 2025 19:14:02 +0300
Message-ID: <20250704161410.3931884-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091440_853991_63FABE4D 
X-CRM114-Status: GOOD (  15.53  )
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

Add clocks and resets for the PCIe IP available on the Renesas RZ/G3S SoC.
The clkl1pm clock is required for PCIe link power management (PM) control
and should be enabled based on the state of the CLKREQ# pin. Therefore,
mark it as a no_pm clock to allow the PCIe driver to manage it during link
PM transitions.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- dropped the power domain support and added MSTOP as power domain
  code is not available anymore in the current linux-next
- adjusted the patch title and description

Changes in v2:
- none

 drivers/clk/renesas/r9a08g045-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 405907925bb7..4a6632ea22cb 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -289,6 +289,10 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0,
 					MSTOP(BUS_MCPU2, BIT(15))),
+	DEF_MOD("pci_aclk",		R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0,
+					MSTOP(BUS_PERI_COM, BIT(10))),
+	DEF_MOD("pci_clk1pm",		R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1,
+					MSTOP(BUS_PERI_COM, BIT(10))),
 	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0,
 					MSTOP(BUS_MCPU3, GENMASK(8, 7))),
 };
@@ -329,6 +333,13 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A08G045_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A08G045_TSU_PRESETN, 0x8ac, 0),
+	DEF_RST(R9A08G045_PCI_ARESETN, 0x908, 0),
+	DEF_RST(R9A08G045_PCI_RST_B, 0x908, 1),
+	DEF_RST(R9A08G045_PCI_RST_GP_B, 0x908, 2),
+	DEF_RST(R9A08G045_PCI_RST_PS_B, 0x908, 3),
+	DEF_RST(R9A08G045_PCI_RST_RSM_B, 0x908, 4),
+	DEF_RST(R9A08G045_PCI_RST_CFG_B, 0x908, 5),
+	DEF_RST(R9A08G045_PCI_RST_LOAD_B, 0x908, 6),
 	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
@@ -340,6 +351,10 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -356,6 +371,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g045_mod_clks),
 	.num_hw_mod_clks = R9A08G045_VBAT_BCLK + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g045_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g045_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
-- 
2.43.0


