Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB32C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zcYMv7ggKAyiW015uopgtq2tD/sZdZ+LxTka+zsTdkE=; b=pfJvdqtPUA2EJNQH/uKdiXkrV5
	lzJGlv/okWpJMtOX6MsSfu57d33QCfTDSrIc/cIob+gtTfcxq3lZhAFivxzIIX3X5VTlQKq5Uyfxy
	IOHaritiv0cY9dtVjpfeZvtSDGlFR+5f1GAtVReI7K6jITLkZQQwvABCrplPj9R2aXru/C18GTvq3
	Vq8eVhp22k0RfF3lG6YhIdpBI3FIenYYymWCrj66GI7kRlyET8aAvpv+KegSLykguQRnBCDq/xReo
	v3xnsFvqjNp6dJIpZtI4gA4ARFyqM5i14mumRixQUf+mr3GDMVYbv7yqaBlSuW5VJbPWgIKL7GB6X
	dQIrIb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KXU-00000008UtW-3B8F;
	Tue, 22 Apr 2025 20:48:20 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KTk-00000008UDl-2Y10
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 20:44:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MKiEdr1992457
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 15:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745354654;
	bh=zcYMv7ggKAyiW015uopgtq2tD/sZdZ+LxTka+zsTdkE=;
	h=From:To:CC:Subject:Date;
	b=ODB9f3DNdMsSQXuD/PUb+vEq7Vc1mREH8AWwcCg3cKk3ZZCcOOiLaP1PQHMpvXmMW
	 hbT3WBuAhPs4rsqgwiPaKpuVW997XbL1S4GxXHEGd42u5QflwAJDeWuSXAAiHd+MVh
	 i4DVFFUznadNI9/qWeGGvANGzUfgJ2o+rmwIlCkk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MKiE67024616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 15:44:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 15:44:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 15:44:13 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MKiDWh061619;
	Tue, 22 Apr 2025 15:44:13 -0500
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
	<hialgofranco@gmail.com>
Subject: [PATCH v3 0/3] Add ti,suppress-v1p8-ena
Date: Tue, 22 Apr 2025 15:44:10 -0500
Message-ID: <20250422204413.272679-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_134428_749472_5208F0B2 
X-CRM114-Status: GOOD (  11.12  )
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

There are MMC boot failures seen with V1P8_SIGNAL_ENA on Kingston eMMC
and Microcenter/Patriot SD cards on Sitara K3 boards due to the HS200
initialization sequence involving V1P8_SIGNAL_ENA. Since V1P8_SIGNAL_ENA
is optional for eMMC, do not set V1P8_SIGNAL_ENA by default for eMMC.
For SD cards we shall parse DT for ti,suppress-v1p8-ena property to
determine whether to suppress V1P8_SIGNAL_ENA. Add new ti,suppress-v1p8-ena
to am62x, am62ax, and am62px SoC dtsi files since there is no internal LDO
tied to sdhci1 interface so V1P8_SIGNAL_ENA only affects timing.

This fix was previously merged in the kernel, but was reverted due
to the "heuristics for enabling the quirk"[0]. This issue is adressed
in this patch series by adding optional ti,suppress-v1p8-ena DT property
which determines whether to apply the quirk for SD.

Changes since v2:
- Include patch 3/3
- Reword cover letter
- Reword binding patch description
- Add fixes/cc tags to driver patch
- Reorder patches according to binding patch first

Link to v2:
https://lore.kernel.org/linux-mmc/20250417182652.3521104-1-jm@ti.com/
Link to v1:
https://lore.kernel.org/linux-mmc/20250407222702.2199047-1-jm@ti.com/

[0] https://lore.kernel.org/linux-mmc/20250127-am654-mmc-regression-v2-1-9bb39fb12810@solid-run.com/

Judith Mendez (3):
  dt-bindings: mmc: sdhci-am654: Add ti,suppress-v1p8-ena
  mmc: sdhci_am654: Add sdhci_am654_start_signal_voltage_switch
  arm64: dts: ti: k3-am62*: add ti,suppress-v1p8-ena

 .../devicetree/bindings/mmc/sdhci-am654.yaml  |  5 +++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |  1 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  1 +
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    |  1 +
 drivers/mmc/host/sdhci_am654.c                | 32 +++++++++++++++++++
 5 files changed, 40 insertions(+)


base-commit: 1be38f81251f6d276713c259ecf4414f82f22c29
-- 
2.49.0


