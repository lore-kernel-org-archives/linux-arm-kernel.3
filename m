Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50718CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dpoG+Ep17pquhQoAOs1k4k2xkCuSFL5NhYt1KTyjKU=; b=zUsORtAm2TtlQDadCQMbPhyPw+
	rTWKAo6/66pGsAcWYbNqDjNI7bamfJLyr4SyE8VT+rphTXXSOwktWMygWyqPGBlU1lpVwYTGCpy7t
	oodxljwNGDXtyvrEPbEjKDnwMILlYnzMxeywxXhVdmYpXyOIfRyR7fPYUIk/fZlTciRyvFkW8SATI
	SUjtmRaipzRn5sVmXJA/QS5f9ydgsGkIpV/98qnZJdb/K6/ZQaBqK/8erjGkXukUILrMZ3UpH3SM2
	1aXRdqIOf6yTyOojSC8b5LQX25VJg2ggwvdRykTcXhCVC9N9432ZOREeLNm+tirjYvVxFizi5HNg/
	kqJrTvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iy-00000008BEF-1ANJ;
	Mon, 18 Aug 2025 17:32:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo25r-00000007x87-29tn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 15:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2dpoG+Ep17pquhQoAOs1k4k2xkCuSFL5NhYt1KTyjKU=; b=nA0Sj9CEfjLXl2/icWZFSstQVK
	0SvelR+YlFArR3wh1KwEq4KsejwLLsUhxh1nLm4aTaj/D7krV1qBbuFb3M2k3w73NmYIebU/S0KPR
	7RO5+tFiM3h8x/I2BKKLFTPhQ3fGGgW9IGmFnJZFk4aj6y7MrsZfIyTKlPuLyxB2TRFw7MKLF7o4T
	8ZQ6w/GD9Z7BqDVFscSSl6mtfejzc45cA48jcnF/Huh9CLiI8b30IqEdwcD4HSlk7WdN92Oxb/lk0
	Jr2PubDRwdWw8hRc0FhrE9wxHt2mcrfnqvP1HBFNLAloWfmfgGSRfGPBYprN5U8BSEwxs0pesM6Ew
	nG+kA8Hg==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo25o-0000000HRTt-257d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:48:18 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IFm5Bq2691221;
	Mon, 18 Aug 2025 10:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755532085;
	bh=2dpoG+Ep17pquhQoAOs1k4k2xkCuSFL5NhYt1KTyjKU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cqoRe99vbqegNBy+M/f6WSS7WlAZxcNhTCC1ZLD+FYfmd7pPaTVNCN+D9Iolv8EFD
	 1UzEQ8absIReLT1vsc0GosmDOAoz3NdVikD02s+A+q6MjcrpdLplwYLPbe9uL45sfs
	 CLGYa9Tznsy6gh3dCkLBUE42jnA8o+mQJZS2houA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IFm5Pk619645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 10:48:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 10:48:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 10:48:04 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IFlk8n1551018;
	Mon, 18 Aug 2025 10:47:59 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
        <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [RFC PATCH 2/3] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
Date: Mon, 18 Aug 2025 21:17:45 +0530
Message-ID: <20250818154746.1373656-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818154746.1373656-1-h-shenoy@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_164816_877115_2BABDA2E 
X-CRM114-Status: GOOD (  11.08  )
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

From: Rahul T R <r-ravikumar@ti.com>

TI's J721E SoC supports a DPI to DSI video signal conversion bridge on
it's platform bus. The IP is from Cadence, and it has a custom TI
wrapper around it to facilitate integration.

This IP takes the DPI video signals from DSS and alongwith the DPHY IP,
it transmits DSI video signals out of the SoC.

Add support for DSI bridge and the DPHY-TX.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5bd0d36bf33e..ce34d68a70f2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1881,6 +1881,37 @@ port@4 {
 		};
 	};
 
+	dphy2: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x04480000 0x0 0x1000>;
+		clocks = <&k3_clks 296 1>, <&k3_clks 296 3>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 296 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 296 3>;
+		assigned-clock-parents = <&k3_clks 296 4>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
+		clocks = <&k3_clks 150 1>, <&k3_clks 150 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy2>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg =
-- 
2.34.1


