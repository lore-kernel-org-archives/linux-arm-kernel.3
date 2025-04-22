Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78DDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4pJOvfSWdXFtA3Vu2W/bJKu8o1yhDi/KoiZOv1/400=; b=mHC+1/UMaOGCOw0fZvxHK9VsmH
	2RPcwBMmdxX1ICZoGYoZ0WJ+KX7NGZG27DB2LMRQGBOkM9Laq+PpS6icKIGs8JKxDcqljNHvM0Xo7
	D8KjyRj/BTE4QMmuLQfwk6Pug+mHneNu9NSyIWdf82EbtRv8rh6G+EOvR+rLvHOHFLmUo4KnLZjby
	+kKDuq51Rt3qeVPdJXdOQYGctgXxNXBFi/YpPwXIXtSu7yLIUmo3HcMZfipX1sZDikPGAC+O6Z4WQ
	dAOxA7PNE99Y8vELIr3j4vOfrbCL5AL8uByiMSC/dUt5fYwipQH9N2V0q6Tm4OGV+y/OOnGIvNOf8
	HaQW+4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lpd-00000008gMT-3w0A;
	Tue, 22 Apr 2025 22:11:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Lk4-00000008fD4-1eQS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:05:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5D4Z1353991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 17:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745359513;
	bh=x4pJOvfSWdXFtA3Vu2W/bJKu8o1yhDi/KoiZOv1/400=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gNp86gIo41eHZK7MT4wJNhBRrzGhnHD/ECqfOOpsysyhxk2XxACKcvwyUoAMi/jLq
	 8l8SYADl4Zx3ZeyYMFJ83/ryo5cOL13Q6o+G8eMuZdbPgdtva3PkSUnR4SQVE0ip2G
	 h9zQFzwQfSP/1vK0CXs8OmF0AevHkBe23gJTEHzA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MM5Dm6019162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 17:05:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 17:05:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 17:05:12 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MM5Crf012605;
	Tue, 22 Apr 2025 17:05:12 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        Nishanth
 Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Josua Mayer <josua@solid-run.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hiago De Franco
	<hiagofranco@gmail.com>, Moteen Shah <m-shah@ti.com>,
        <stable@vger.kernel.org>
Subject: [PATCH RESEND v3 3/3] arm64: dts: ti: k3-am62*: add ti,suppress-v1p8-ena
Date: Tue, 22 Apr 2025 17:05:12 -0500
Message-ID: <20250422220512.297396-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422220512.297396-1-jm@ti.com>
References: <20250422220512.297396-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_150524_513049_EA3A775F 
X-CRM114-Status: GOOD (  10.23  )
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

Add ti,suppress-v1p8-ena flag to sdhci1 nodes to suppress
V1P8_SIGNAL_ENA.

On am62x, am62ax, and am62px SoCs, there is no internal LDO
tied to sdhci1 interface so V1P8_SIGNAL_ENA only affects timing.
Suppress V1P8_SIGNAL_ENA since it causes init failures across
Microcenter/Patriot SD cards and Kingston eMMC on am62* SK boards.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7d355aa73ea2..a61153b0af32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -586,6 +586,7 @@ sdhci1: mmc@fa00000 {
 		ti,itap-del-sel-sd-hs = <0x0>;
 		ti,itap-del-sel-sdr12 = <0x0>;
 		ti,itap-del-sel-sdr25 = <0x0>;
+		ti,suppress-v1p8-ena;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index a1daba7b1fad..44d973caf200 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -606,6 +606,7 @@ sdhci1: mmc@fa00000 {
 		ti,itap-del-sel-sd-hs = <0x0>;
 		ti,itap-del-sel-sdr12 = <0x0>;
 		ti,itap-del-sel-sdr25 = <0x0>;
+		ti,suppress-v1p8-ena;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 6e3beb5c2e01..c4304dae9757 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -604,6 +604,7 @@ sdhci1: mmc@fa00000 {
 		ti,itap-del-sel-sd-hs = <0x0>;
 		ti,itap-del-sel-sdr12 = <0x0>;
 		ti,itap-del-sel-sdr25 = <0x0>;
+		ti,suppress-v1p8-ena;
 		status = "disabled";
 	};
 
-- 
2.49.0


