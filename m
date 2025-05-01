Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A39EC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pz6DuHsBQP2Lu67I6tzYBvTySwyfcVWJmFrJgbkPkr8=; b=aS6X8B23C9BdI7Gi7uPOCIm13d
	d66BJ66v+7rno5TF+8vvlKxkN+ZSnOX1JL56RGZWsV/ddoMgmoMfLsiTFK+2r3bLFOkd5b9dsvApy
	3pHDP6h37WN662G4MQet6xKBAxyAwNB46X35NEids0nCiIFG4DslYPBQZ6M8x6PRkF7CUvBzKRpuq
	lNSYHfDmv11BXkwutA+85rx58CRf/piopt9oxkGCB/pxW4SOmYSnqF/zZ/BGxiIgdrKIckTqIkHEv
	LEOxb8doNE1m28Nxp3r0r8CGZo3rJ47c3rNlMZhCYvXXDsYGo85GjaZK4ImypZD+nQT0oA42RdlcR
	qyqRtcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOOg-0000000Ewir-08Xq;
	Thu, 01 May 2025 07:31:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAOMl-0000000EwSQ-1tGH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 07:29:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5417TohX4160577
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 02:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746084590;
	bh=pz6DuHsBQP2Lu67I6tzYBvTySwyfcVWJmFrJgbkPkr8=;
	h=From:To:CC:Subject:Date;
	b=CA+R8Ie4csJpihIAOecGuNRzdbeHeRspUM2iW5rQH2mfeayYPGHw8dgt6JNLDh9yS
	 DI1rnsGbhDL8I2Y4t1Rz5ZPOORGfVbVQmhWzSuY6BtvsgCaay0pEbvFyrAEyOHlJEn
	 adK/UXBZtYLzpKdS1kXnff0Q0fykY8XccFQiczJA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5417Tobc059010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 02:29:50 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 02:29:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 02:29:49 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5417TnA4007282;
	Thu, 1 May 2025 02:29:49 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH 0/3] Add support for AM62D2 SoC and EVM
Date: Thu, 1 May 2025 12:59:20 +0530
Message-ID: <20250501072923.1262414-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_002955_578501_9AA14993 
X-CRM114-Status: GOOD (  11.86  )
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

This patch series adds support for the AM62D2 SoC and its evaluation
module (EVM) board. The AM62D2 SoC is a high-performance Digital
Signal Processing (DSP) device with a quad-core Cortex-A53 cluster,
dual Cortex-R5F cores, and a Cx7 DSP core with Matrix Multiplication
Accelerator (MMA). It features a range of peripherals, including
multichannel audio serial ports, Ethernet, UARTs, SPI, I2C, USB, and
more.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

This patch series includes a new device tree source (DTS) file, updates
in device tree bindings and pin control header file.

Bootlog: https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6
Tech Ref Manual: https://www.ti.com/lit/pdf/sprujd4
Schematics: https://www.ti.com/lit/zip/sprcal5

Paresh Bhagat (3):
  dt-bindings: arm: ti: Add bindings for AM62D2 SoC
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 449 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 4 files changed, 461 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

-- 
2.34.1


