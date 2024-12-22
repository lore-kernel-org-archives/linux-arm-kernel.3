Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61964E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 03:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kM9m4bUJrauGX8TICg5PHBrSZlJRJoFPdzB6IOozMZs=; b=hi1o8Rc/mdWRCSrK1y4MVxzsvW
	A+2hSgRm+llmo2pS8p0DOz51faMurS1NNus7wXqdqmoe90B7912mHnIZzTzOb/u3hurSJAt5WoKYq
	xoo3pQFn/bw3m8GaE4U4ePB8WPVEzptTH9dtQFv9hkep6WXul/O1mSGJ5Go8O/yheVAGPNtNx+udo
	5qwVAWmg8fyONIylqxMUikffsya49ektIbuCUSxq08GVrJpKSn4SxBBZt593O1rGJJCT26gOLDgOO
	xeva1sb67dZEd8CBYuxlym/s/8BVUywsDzjxV2J3WuMwXazInNTNfIhwklJqh8KlnWgOd+64cgn3Q
	8xxa5IBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCLh-00000007jLq-2sQt;
	Sun, 22 Dec 2024 03:09:45 +0000
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCH3-00000007iqD-3yvq;
	Sun, 22 Dec 2024 03:04:59 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 4BM342BR020894;
	Sun, 22 Dec 2024 12:04:03 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, maz@kernel.org,
        tglx@linutronix.de, jonas@kwiboo.se, macromorgan@hotmail.com,
        andyshrk@163.com, liujianfeng1994@gmail.com, dmt.yashin@gmail.com,
        dsimic@manjaro.org, tim@feathertop.org, marcin.juszkiewicz@linaro.org,
        michael.riesch@wolfvision.net, alchark@gmail.com,
        sebastian.reichel@collabora.com, jbx6244@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 0/3] rockchip: Add support for RK3582
Date: Sun, 22 Dec 2024 03:03:52 +0000
Message-ID: <20241222030355.2246-1-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_190458_232238_3A450E06 
X-CRM114-Status: UNSURE (   8.32  )
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

Rockchip RK3582 is a scaled down version of Rockchip RK3588(S).

- Dual Cortex-A76 and quad Cortex-A55 CPU
- No GPU
- 5TOPS NPU
- H.264/H.265 video encoder up to 4K@60fps

This patch series adds RK3582 support to the GIC and the Radxa E52C
compact network computer.

FUKAUMI Naoki (3):
  irqchip/gic-v3: Enable Rockchip 3588001 erratum workaround for RK3582
  dt-bindings: arm: rockchip: Add Radxa E52C
  arm64: dts: rockchip: Add Radxa E52C

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 729 ++++++++++++++++++
 drivers/irqchip/irq-gic-v3-its.c              |   3 +-
 4 files changed, 737 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts

-- 
2.43.0


