Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0E8CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jsywbNi22h13gbkifxSghvCHg0dJUfQFj5xl0Ab043A=; b=cnIK1P8ZGxFIMM0DI4v8G6ujFN
	tf9Hk+d5JIZc5hjwIs95WOz6pRfhp8+HMxvepldVPaVMy7BxuDqMxhbCFAvz7bnSb8PVybzfPIsu6
	W7AQSPnU/WPqh8vQHiFANuUW+VHXfvCrze7zErHbnP0Wbaa8u3Ti+0OjMUw9UA+BYvfev6G+Uc3dU
	WuaRxp5+LbWbv3JPo0FaAbzXcyfmLEdTg/UjuDOcYltgdmAcPq5uqlhERWah4rzouysI1waFVa7+I
	NQxKjaOrnjzQv1R4oNc/FsQqNSkZkctik5o1PLHmPpKNr/n4QPmtDsSbNXBTLhFu4qQvw9s92i4xR
	b1oqQz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXK-0000000GJN1-2QgO;
	Tue, 14 Oct 2025 12:53:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXI-0000000GJMA-0FK3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:53:53 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ECrlHH1150031;
	Tue, 14 Oct 2025 07:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760446427;
	bh=jsywbNi22h13gbkifxSghvCHg0dJUfQFj5xl0Ab043A=;
	h=From:To:CC:Subject:Date;
	b=Q5DPMoPQDAvpd1zwt9xOu/zbs6SVf4Oe6IdKOqXEAfuHavXXFRhkzo5Vqw/Tr5naW
	 uZXpoLUJzY2TqBkD0wexomB/g4es+Lue2LHVAqiE9hiaWTNpjTialU0k8WEzR96mO3
	 eTMTh6Ps4S9nMm/OE8eqFzNkkGZRUT90r3X2g7yQ=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ECrlxX3814784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 07:53:47 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 07:53:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 07:53:47 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ECrhPT055621;
	Tue, 14 Oct 2025 07:53:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Tue, 14 Oct 2025 18:23:38 +0530
Message-ID: <20251014125349.3408784-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_055352_219295_FD3EFCA4 
X-CRM114-Status: GOOD (  10.86  )
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

-----    -------    ----------------  --------------------------------------------
S.No.      SoC        CPSW Instance                    Board(s)
-----    -------    ----------------  --------------------------------------------
  1.       AM62          CPSW3G           AM625-Beagleplay, AM62-LP-SK, AM625-SK
  2.       AM65        MCU CPSW2G         AM654-Base-Board, IOT-2050 Based Boards
  3.       J7200       MCU CPSW2G         J7200-Common-Processor-Board
  4.       J721E       MCU CPSW2G         J721E-Common-Processor-Board
  5.       J721S2      MCU CPSW2G         AM68-SK-Base-Board, J721S2-Common-Processor-Board

Series is based on linux-next tagged next-20251010.

v2 of this series is at:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250611114336.2392320-1-s-vadapalli@ti.com/
Changes since v2:
- Rebased series on next-20251010.
- In the first patch, the changes that were made within
  'k3-am625-sk.dts' in the previous version, have been
  moved into 'k3-am625-sk-common.dtsi'
- The 'status' property within 'nodes' has been ordered to follow:
  https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Test Logs:
1. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/3af178c71cd2da436f60b87928dcb1eb
2. AM68-SK-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/b027a6849f3c17e11fad8324a905aa68
3. J7200-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/70d0d96fab92b894253c1884499d6fc1
4. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/2c88aadf36923b1d27672b64489cb2dc
5. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/0abbae2ef99f82871aa520e1ab973c85

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
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi         | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 14 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.51.0


