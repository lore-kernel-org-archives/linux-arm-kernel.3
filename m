Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230AACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsntGwJK+u1bx93YId7/aEwLX3vg7UlA2rb4wGYzrE8=; b=ueLarxcyBQjZOcjUFK90CWLimx
	cRhQWJDlcRw73foLD4v1lSA3yU1JMOKddLrMCANNxqKyr/Eh9IAywgl5+h2HLJDhaTqmajh3Wbq7A
	P20YMFrsWCdN6N60cLaFDelL+Tq5JyQEIxvkMUWT51630I2/EQ4bW/rLg91LBQKJKXxNR/R0PbceT
	X9vPozGPI4SiC5/FZ06zetmHOw0Uwi0lQsoupeMUjlTUEGTWSI05gvQQBvLp9Tb9j2gLmTgw4mSMx
	yCVlKP9zZkcGULHuTShoK16XS8ApVEtBbhV4wtTsgnb3n4ex5Ud8qrGyrGplz/hpZs4kfuyAi0yD6
	w/o82bFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zS3-00000001OCa-3MmX;
	Wed, 15 Oct 2025 11:13:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zRz-00000001OC1-3bCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:13:49 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FBDgRZ1387653;
	Wed, 15 Oct 2025 06:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760526822;
	bh=FsntGwJK+u1bx93YId7/aEwLX3vg7UlA2rb4wGYzrE8=;
	h=From:To:CC:Subject:Date;
	b=SneuFKL5Pp1hWTysHZ9tvaNyHWNuvaOciG8JGyH1/QHLvfTOCMOlrswVK7rfNgBvc
	 71azxMvn103AaGqDw3HAZyimVW5Cnu3ge3EuKyRXrs/JOMJypXZbCRLQGOnJ6ySOl7
	 kpFN0Lbs0v5GxcCjwldah21fljaLzthmh3d/8jOs=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FBDf2s1179812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 06:13:42 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 06:13:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 06:13:41 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FBDbHi1809909;
	Wed, 15 Oct 2025 06:13:38 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d.haller@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Wed, 15 Oct 2025 16:43:32 +0530
Message-ID: <20251015111344.3639415-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_041348_003197_FE36CF30 
X-CRM114-Status: GOOD (  11.09  )
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

Hello,

This series cleans up the CPSW Device-tree nodes by updating the SoC and
board files to keep CPSW disabled in the SoC files and enable it only in
the board files.

The following is a summary of the SoCs, CPSW instance and the Boards that
this series affects:

-----    -------    ----------------  -------------------------------------------------------------
S.No.      SoC        CPSW Instance                         Board(s) / SOM(s)
-----    -------    ----------------  -------------------------------------------------------------
  1.       AM62          CPSW3G           AM625-Beagleplay, AM62-LP-SK, AM62-Phycore-SOM, AM625-SK
  2.       AM65        MCU CPSW2G         AM654-Base-Board, IOT-2050 Based Boards
  3.       J7200       MCU CPSW2G         J7200-Common-Processor-Board
  4.       J721E       MCU CPSW2G         J721E-Common-Processor-Board, J721E-Beagleboneai64, J721E-SK
  5.       J721S2      MCU CPSW2G         AM68-SK-Base-Board, J721S2-Common-Processor-Board, AM68-Phyboard

Series is based on linux-next tagged next-20251014.

v3 of this series is at:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20251014125349.3408784-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased series on next-20251014.
- Based on feedback from Dominik Haller <d.haller@phytec.de> at:
  https://lore.kernel.org/r/df6acbfe5d30956ed66e2768fa595c36d2ebe98a.camel@phytec.de/
  the first and fifth patch have been updated to enable cpsw in:
  k3-am62-phycore-som.dtsi and k3-am68-phyboard-izar.dts respectively.
- The fourth patch of this series has been updated to enable cpsw in:
  k3-j721e-beagleboneai64.dts and k3-j721e-sk.dts

Test Logs:
1. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/168cada897c0e13d5c197b241e336544
2. AM68-SK-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/b97d65dd9fd1a8a852fc4b55842d5e3c
4. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/0b264562259b8eed349daa36827f7c2c
5. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/690ca66e8400b966723f4d316ac1db7e

Regards,
Siddharth.

Siddharth Vadapalli (5):
  arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in
    board file
  arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable in
    board file
  arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable in
    board file
  arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enable it
    in board file
  arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable
    in board files

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi        | 1 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi         | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts     | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                 | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 18 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.51.0


