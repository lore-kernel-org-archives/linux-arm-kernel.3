Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EEDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 23:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7z9JvDramw6cqnxYpFzhEM432yH7Ax9tg4umCAmI7w=; b=B3ekl6fhbudVzsVGtNMuMD9+QQ
	5svP2s8r9wpLfbMJ8xBuu5UDFczOciWUPfFjwmIm4CfphgrJGE00btYjqaonz+uokS6uK6lOaRtjj
	ni4pDaCK4jiCnxv99K2J/dL56yjN3q8SCx1pgvWgVDQU7CUUCRzmjmMabteeVbXWv2H8xM01NWvvc
	eOmLKZqQB+MkDAKavjF7ma3m2+x6m37xEWcnJSg+VIOHD3RNzvNI9xTCOUS/BeaVaMiHBYPRC/2Kw
	n5LcgiEP8RsqBiqxbYIAU/TbKvoHuoeEa2drph7nVoB+MykPHHSrGxct79w0hvebqJJpZ1cKVbLPn
	D3+WQaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Yq5-0000000Ecbt-3RGu;
	Thu, 17 Apr 2025 23:40:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ygw-0000000EaYp-1EZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 23:30:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeWG136184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 18:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744932640;
	bh=Y7z9JvDramw6cqnxYpFzhEM432yH7Ax9tg4umCAmI7w=;
	h=From:To:CC:Subject:Date;
	b=M6F16maQrI/tO2YKeE6kYIaoXwZ0OCK/bjBA+EnB7XOP64Vizv3C1+iRZtgnQVkwV
	 yh2Omw80GXjG1OB7YN47ImPbweluHaqs3/gWRt4EGuAw+68Mw92EhoubS1n1O6/kDr
	 iFF38jTGwGkccm0rcU2W4/yiaFLYa76X3QgpVZ+k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HNUeg6096091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 18:30:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 18:30:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 18:30:40 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HNUePe023286;
	Thu, 17 Apr 2025 18:30:40 -0500
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 0/5] Misc MMC updates
Date: Thu, 17 Apr 2025 18:30:35 -0500
Message-ID: <20250417233040.3658761-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_163046_424733_EFB5403F 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

This patch series includes updates for eMMC and SD nodes across
Sitara K3 SoC boards:

Set eMMC clock parents to default to avoid any potential issues with
non-glitch free muxes when switching eMMC PLL source.
Add boot phase flag to MMC nodes and dependency nodes to support SD and
eMMC boot. 
Add missing itapdlysel for default speed and high speed SDR modes on
am65x SoC. 
Add non-removable flag to eMMC nodes to void having to redetect
eMMC after suspend/resume.
Remove disable-wp for eMMC nodes since property is specific to SD.

Changes since v1:
- Add patch 1 and 2
- remove disable-wp for more boards with eMMCs

Link to v1:
- https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Judith Mendez (5):
  arm64: dts: ti: k3-am6*: Set eMMC clock parents to default
  arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
  arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
  arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
  arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi             |  2 --
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      |  1 -
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi            |  2 --
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     |  1 -
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              |  3 ++-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi      |  2 --
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts              |  1 -
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi             |  2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts       |  1 -
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi    |  1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                |  1 -
 15 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.49.0


