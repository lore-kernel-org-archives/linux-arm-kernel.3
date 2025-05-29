Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41A7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+DtiYfEQ69sC7t4z3+fzWpvG+vUEJo0fRdsX7ekjuA=; b=z+Gc3nlFMNI+DsOHGkO7HiRkKK
	sFyOtLdYEB3TZK8yvz3XNlb8DaCuRu1i6Kl37U92yDLmaion69rjz8kMorSODK1D33TZngquNudl/
	SOqLMzOF93jglISxFe+AM0gX1MR9/UBzQI3S8ZY5MROokW7iGhR3Ctno/pIJ4yJxlzvXGHtjpUjzf
	f3zxfcb2Vhfyz7oCiWVM6DLg1HH8GjTJfM4B86hXZB8gn5CzO9uh906g9veL5aerUbzfp52yjBOGX
	FG3Wqvvy24p+uXMPR+fQ9Uy6Od9++aTZXuVypRfkZhF2RzHxeVsCCnclUvWLl27YU7K8iGYllmglC
	NwzqIJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdXI-0000000FtIn-0OjB;
	Thu, 29 May 2025 13:43:08 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPP-0000000Frlw-0Cil
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:35:00 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYmdk2378424;
	Thu, 29 May 2025 08:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525688;
	bh=K+DtiYfEQ69sC7t4z3+fzWpvG+vUEJo0fRdsX7ekjuA=;
	h=From:To:CC:Subject:Date;
	b=vghXUpSWuGLL3sjMCs6OlUHRnvevqAB6XJJ55ppAiOYrh3Bq3ezxv2VL5Y9TMnimF
	 iANUnWj5TpuNxMnNkAXGj44Bo4CkiwF7Pt2T4dVV/lg465sq71Fxkg/ngZEWuHweN7
	 /toNIBThohwn49NZvxv52P63/MDlM2Ln1emY/RU4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYmqC2201524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:48 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8g1650971;
	Thu, 29 May 2025 08:34:44 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 00/13] TI-K3-DTS: Cleanup CPSW DT Nodes
Date: Thu, 29 May 2025 19:04:30 +0530
Message-ID: <20250529133443.1252293-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_063459_188406_2D439902 
X-CRM114-Status: UNSURE (   9.44  )
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
  5.       J721S2      MCU CPSW2G         J721S2-Common-Processor-Board

Series is based on linux-next tagged next-20250529.

I am posting this series to receive feedback and Reviewed-by / Tested-by tags.
I will repost the series when the merge window opens.

Logs:
1. AM625-SK:
https://gist.github.com/Siddharth-Vadapalli-at-TI/aa812fda8c0653f387931bb90f12cdd0
2. AM654-Base-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/128b7ef2e0c371db4c8b3a4c4ddefcc6
3. J7200-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/66837169f7370faa2dae05cb39bdaad5
4. J721E-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/ad0f12f9aab3cd9b55f221062c53493d
5. J721S2-Common-Processor-Board:
https://gist.github.com/Siddharth-Vadapalli-at-TI/07dd468558f90d7637f8536d935d2368

Regards,
Siddharth.

Siddharth Vadapalli (13):
  arm64: dts: ti: k3-am625-beagleplay: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am62-lp-sk: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am625-sk: Enable "cpsw3g" in the board file
  arm64: dts: ti: k3-am62-main: Disable "cpsw3g" in the SoC file
  arm64: dts: ti: k3-am654-base-board: Enable "mcu_cpsw" in board file
  arm64: dts: ti: k3-am65-mcu: Disable "mcu_cpsw" in the SoC file
  arm64: dts: ti: iot2050-common: Remove redundant "mcu_cpsw" node
    status
  arm64: dts: ti: k3-j7200-common-proc-board: Enable "mcu_cpsw" in board
    file
  arm64: dts: ti: k3-j7200-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file
  arm64: dts: ti: k3-j721e-common-proc-board: Enable "mcu_cpsw" in board
    file
  arm64: dts: ti: k3-j721e-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable "mcu_cpsw" in
    board file
  arm64: dts: ti: k3-j721s2-mcu-wakeup: Disable "mcu_cpsw" in the SoC
    file

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk.dts                 | 1 +
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi     | 4 ----
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts         | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi        | 2 ++
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 13 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.34.1


