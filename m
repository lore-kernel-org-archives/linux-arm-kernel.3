Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F86EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhCY1iDUbu37jepiOAA6VwvvexBYQDCMMdCEXW+5rfo=; b=ZXoijNq+6561agSi79OIbKb6eU
	a6HbPFOLbidkH8F+Qqm35EDCDybMh3rnSHMC6MMXIFOYRKcv+D/srZmXZeLu4pXj5aC0pErRLLt7S
	v/NfcOTwZnsjlf+pq+EqU3jUvEQBGv0yQ+y8Ux8YdP8BLkcCfUqIH0BJNhuDpkLqJ/3U8dvGI/ZPW
	xVQuzx5+OJUSUGRTli4OFOTxOh1rw5LL3UP//6TdkPdvxIVcJUA5UoML5a49a7kVvw9I9LsjoFZBF
	M6XQxZbeVBlgPsb4xvIjjEuAgOqZ+l9yF4gc1RAed21qp4l9ayQZur277UOgWvTce019rHLs8uR9n
	STmy/axQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsa2-00000002NYb-0E0Z;
	Fri, 02 May 2025 15:45:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsUN-00000002MYl-2pPd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:39:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542FdgaB3896448
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 10:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746200382;
	bh=YhCY1iDUbu37jepiOAA6VwvvexBYQDCMMdCEXW+5rfo=;
	h=From:To:CC:Subject:Date;
	b=JAfg3+jGT8+L+rPMs8b/kmA6NKjymDKkB18z9Hwb6i9ekfke82CHqyFH5DnrwtbwC
	 5BqWTEomMCiy1lra1s42rt/6XevTcDrfnEbcZF/uT6b0RmFcN6S/t6o5MUymdZCC2P
	 S5jeT0KOniK9dM89caNNrk9RqAe/kDlU08AmO2wk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542Fdg8i042337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 10:39:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 10:39:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 10:39:42 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542FdfOB102775;
	Fri, 2 May 2025 10:39:42 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v2 0/3] Add support for AM62D2 SoC and EVM
Date: Fri, 2 May 2025 21:09:12 +0530
Message-ID: <20250502153915.734932-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_083947_803961_719AC5B5 
X-CRM114-Status: GOOD (  14.27  )
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

This patch series adds support for the AM62D SoC and its evaluation
module (EVM) board. The AM62D SoC is a high-performance Digital
Signal Processing (DSP) device with a quad-core Cortex-A53 cluster,
dual Cortex-R5F cores, and a Cx7 DSP core with Matrix Multiplication
Accelerator (MMA). It features a range of peripherals, including
multichannel audio serial ports, Ethernet, UARTs, SPI, I2C, USB, and
more.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

This patch series includes updates to the device tree source (DTS) files,
device tree bindings, and pin control header files to support the AM62D SoC
and EVM board.

Bootlog-
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6
Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Note: This patch series should be applied after the below series 
has been merged.
https://lore.kernel.org/all/20250415153147.1844076-1-jm@ti.com/

Change Log:
V1 -> V2: Fixed indentation and build errors.

Paresh Bhagat (3):
  dt-bindings: arm: ti: Add bindings for AM62D2 SoC
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 445 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 4 files changed, 457 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

-- 
2.34.1


