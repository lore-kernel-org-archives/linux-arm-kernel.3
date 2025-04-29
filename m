Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phAgRZDLcEJL+2Qt4p20wfF/jzjcFFMyigWTHHdSwyM=; b=ZVCoV9tvMpgvzaTceYGAZlFB3a
	5OYcQDBh4gSGYFHA3Rg+ujp4KKbwegUMAau373Ngg2XH+gZP7VfNf7HclTpGGbE2Y4gy1q3sskg7+
	sgkWcLWWMJGIoSl3GnCeKrisxBUfrV97COI/7ctJ/coMJqdaQ/d8QZQlyLXEG2OvOcJogIPxewn7J
	kUX5LDx2sgOiUc9BLK088uvkwUBPno/LaHjrTou5AklR6GvlYeIgdDBe1pXBRFcsiPd8kLGiU7T+A
	gHulPkSFfJrpmzE7GZp3hfoiCs51ZiH2+930eopo0GUGVHXY0V6+z63M8TdBHRGGhdcfaPXf1vKAa
	22R58SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o2k-0000000AI7G-1rIT;
	Tue, 29 Apr 2025 16:42:50 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ntz-0000000AGdH-3F0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:33:49 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXbFq3722128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 11:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745944417;
	bh=phAgRZDLcEJL+2Qt4p20wfF/jzjcFFMyigWTHHdSwyM=;
	h=From:To:CC:Subject:Date;
	b=uUi4JEz2qI1eDMijaOFWC73rACjTB3ACNAB3xU0K0w+jMXJH5+v1oZ0k5wovH/oVJ
	 0w0Id6pHxRrpM+eFC8bSW3JyGabij8aLfl6L7zBfV1xKKU+sRYuCvcLgkI2DhrcMyo
	 F2eO1QVzLUANxxsLC5z/jbcnx3j5EKgTL/hLykxo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TGXbE8019666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 11:33:37 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 11:33:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 11:33:37 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TGXb2J093065;
	Tue, 29 Apr 2025 11:33:37 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: [PATCH v2 0/3] Set eMMC clock parent to default
Date: Tue, 29 Apr 2025 11:33:34 -0500
Message-ID: <20250429163337.15634-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_093347_927453_8768A825 
X-CRM114-Status: GOOD (  10.03  )
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

This series was split-off from "Misc MMC updates" patch series [0] and the
original patch further divided into three to help with backporting as per
review comments [1].

This series sets clock parent for eMMC to the default clock parent
MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
does not switch MMC clock parent correctly as per the Arasan IP requirement
to hold the IP in reset while clock source is switched. Since muxes to
switch clock parent are not glitch-free and the default parent is tested
and working fine, switch to the default as a preventative action.

Changes since v1:
- split original patch into three
- add cover-letter
- reword patch descriptions
- add review tags

[0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
[1] https://lore.kernel.org/linux-devicetree/20250429142825.bvrbpoc5iz32wh35@garment/

Link to v1:
https://lore.kernel.org/linux-devicetree/20250429142333.4140010-1-jm@ti.com/

Judith Mendez (3):
  arm64: dts: ti: k3-am62-main: Set eMMC clock parents to default
  arm64: dts: ti: k3-am62a-main: Set eMMC clock parents to default
  arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parents to
    default

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
 3 files changed, 6 deletions(-)


base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0


