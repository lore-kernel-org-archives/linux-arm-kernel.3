Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8ADC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHFFHm0oByj6MZrARuRpeeWBOjjHOV1iLYz0FKla/hE=; b=tl1VT7hARbnZ+KJF3kEcL9KuMm
	Cs8pqKBkhyTTYNKN+6wYQtZ0z8BI46fblMJMsecrcx/6qicF6xDhXT6wrG73iTB4xPiWZJUBcB6pq
	4Mu0TWRcM4p4aqWxU+yyyJhncyEiYGftQqpKTNs3Fim/Wrwb7htLofaj+3+0cufVwMeUd+02fnzDx
	oyTH2XeU7auKmnqq2AbyTD6UTiK2ZktAAqjGXnzU+s6LozIkYuPxFn1j5l5a824bsKmKWa6Tirz0p
	ImG9p7rWz7rgeNvIc8mSge2eUwJ83mJmNfrPFmimdqAALuloIcE1q/TGVbDK9NcRyB4/K7gAYvZjW
	X8F496VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqXN-0000000GRHw-0adS;
	Sat, 08 Mar 2025 09:32:05 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqVh-0000000GR6V-3zlN;
	Sat, 08 Mar 2025 09:30:23 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:217:f42e:f419:35e])
	by smtp.qiye.163.com (Hmail) with ESMTP id d88bc5e8;
	Sat, 8 Mar 2025 17:30:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Sat,  8 Mar 2025 17:30:07 +0800
Message-Id: <20250308093008.568437-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHR8fVhpDGEMYGB1NTx5KGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBSUpMQR1PSR5BHU9KQkFITh5ZV1kWGg8SFR
	0UWUFZT0tIVUpLSUJNSkpVSktLVUtZBg++
X-HM-Tid: 0a9575173bd103a2kunmd88bc5e8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6ORw4KDJKFCkIASJNMTcf
	KCwKCi9VSlVKTE9KT0lNSUpJT0xDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0FJSkxBHU9JHkEdT0pCQUhOHllXWQgBWUFJQ01PNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_013022_157111_9E43EAF1 
X-CRM114-Status: UNSURE (   5.56  )
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

For a long time, rk3568's MSI-X had bugs and could only work on one node.
e.g. [    7.250882] r8125 0002:01:00.0: no MSI/MSI-X. Back to INTx.

Now the ITS of GICv3 on rk3568 has been fixed by commit b08e2f42e86b
("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
and commit 2d81e1bb6252 ("irqchip/gic-v3: Add Rockchip 3568002 erratum
workaround").

Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
MSI on rk3568 to use ITS, so that all MSI-X can work properly.

~# dmesg | grep -E 'GIC|ITS'
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] GIC: enabling workaround for GICv3: non-coherent attribute
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 320 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: MBI range [296:319]
[    0.000000] GICv3: Using MBI frame 0x00000000fd410000
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000fd460000
[    0.000000] ITS [mem 0xfd440000-0xfd45ffff]
[    0.000000] GIC: enabling workaround for ITS: Rockchip erratum RK3568002
[    0.000000] GIC: enabling workaround for ITS: non-coherent attribute
[    0.000000] ITS@0x00000000fd440000: allocated 8192 Devices @210000 (indirect, esz 8, psz 64K, shr 0)
[    0.000000] ITS@0x00000000fd440000: allocated 32768 Interrupt Collections @220000 (flat, esz 2, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: using LPI property table @0x0000000000230000
[    0.000000] GIC: using cache flushing for LPI property table
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000000240000
[    0.013946] GICv3: CPU1: found redistributor 100 region 0:0x00000000fd480000
[    0.013968] GICv3: CPU1: using allocated LPI pending table @0x0000000000250000
[    0.014948] GICv3: CPU2: found redistributor 200 region 0:0x00000000fd4a0000
[    0.014968] GICv3: CPU2: using allocated LPI pending table @0x0000000000260000
[    0.015904] GICv3: CPU3: found redistributor 300 region 0:0x00000000fd4c0000
[    0.015923] GICv3: CPU3: using allocated LPI pending table @0x0000000000270000

~# lspci -v | grep MSI-X
        Capabilities: [b0] MSI-X: Enable- Count=1 Masked-
        Capabilities: [b0] MSI-X: Enable- Count=128 Masked-
        Capabilities: [b0] MSI-X: Enable+ Count=32 Masked-
        Capabilities: [b0] MSI-X: Enable- Count=128 Masked-
        Capabilities: [b0] MSI-X: Enable+ Count=32 Masked-

Chukun Pan (1):
  arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS

 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


