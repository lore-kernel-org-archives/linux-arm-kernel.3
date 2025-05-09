Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B850FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VPSGPkK5ZMCFmDxL0qp9plqTEWD8XrvlwesQZtajotc=; b=ktA8Fk5e6kJfD+t6AmMJNaDpao
	GQg1IapcJr2TBAUJTU3OpVNTmF2BkQxDPPu9DMB6ZKHTJ7VTgBhbVLnzuyJI/Vm1OuYr06whbNxuu
	VxbL10pl+FOF3mjXIK1bfkUog52nCDR/wlvXSZ0slVCOuil5BoQu2oNXWWpvaYmq0/6DnAi2dbsC1
	hASH9y/0G16832e06J45CJD2h48rbYm4JL2VbLJp7nms8aczmOXtlQXoaSTeEFKsWX/d8DRXuPkba
	Dk5IHE88vWdhSPs5GMbXjOopjtHou5PqP7A4zkBQvsb8IQeDEKKg2P5yKHOf3Ma2uKu4TXuC1Gvdt
	2bJJuDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDICB-00000002kqi-1HyK;
	Fri, 09 May 2025 07:30:59 +0000
Received: from mail-m15579.qiye.163.com ([101.71.155.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHzd-00000002ivi-3EJj;
	Fri, 09 May 2025 07:18:05 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147bfe059;
	Fri, 9 May 2025 15:17:46 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 0/5] rockchip: Add rk3562 SoC and evb support
Date: Fri,  9 May 2025 15:17:39 +0800
Message-Id: <20250509071744.732412-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE1DVh9KHRpDGEsZS0tPSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96b3e847a003afkunm147bfe059
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxg6PTo*DzJCDQIQFykyTE0N
	TSwaChdVSlVKTE9NTExOS01CSExLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUhCSE03Bg++
DKIM-Signature: a=rsa-sha256;
	b=IkWzPTkebX6Fze2/KqozB8z4QjcDSONOtF2h0go0X03o+lfmkbToC0XS7Jlnpwn6jOSOwFbdtKYlDDjE+DPXyBgL3E03Qa5K3XwWyCoPSLYgLWauKfLe/N/lpj86d24PGVWSdnd21Cz/fyLcUPHq7zGocvITXpUO15q/9vIbD08=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=VPSGPkK5ZMCFmDxL0qp9plqTEWD8XrvlwesQZtajotc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_001802_352078_A4D137F8 
X-CRM114-Status: GOOD (  14.03  )
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


Patch series v6 remove USB and watchdog nodes, for relate patches not
land recently although they have got review tag. Let's make the main dts
get land first and then add relate dts node back when the driver patches
get land.

Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
scmi-shmem from soc node to reserved memory.

Patch series V4 remove patches already landed, and remove dts nodes for
modules still under review.

This patch set adds rk3562 SoC and its evb support.

I have split out patches need driver change for different subsystem.
And all the modules with dt-binding document update in this patch set
do not need any driver change. I put them together to make it clear we
have a new SoC and board to use the new compatible. Please pick up the
patch for your subsystem, or please let me know if the patch has to
send separate.

Test with USB, PCIe, EMMC, SD Card.

V3:
https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
V2:
https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/


Changes in v6:
- Remove USB and watchdog nodes

Changes in v5:
- Update scmi-shmem from soc to reserved memory

Changes in v4:
- Collect ack tag
- remove gmac and otp nodes
- remove gmac nodes

Changes in v3:
- Collect the Acked-by tag
- remove i2c/serial/spi alias
- add soc node

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (3):
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  455 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1187 +++++++++
 7 files changed, 4009 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1


