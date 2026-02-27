Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8228EFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMwaBvqdwYCjJQBl60E8qyyHxhDXj5rHW+g0XPefEf8=; b=NWZmDrEu83elvJdT7sjt8UCz4H
	+HS3Ti0gZOr3hmQz42q0RsQvksRRgcm15SEyAuRKfcqJQ/HC+3yDBs/4xOejOk1PeVCAemRgzy5AI
	gt2bSGUNh50RqJOfTKvHfyPaANzkVvlUsoYLIq5Gt3hYUQxskiVt1D5CsLEpzVp2xFR4GV4zdbOrY
	bi3Pn7RAejqJyxg6VuZjG+LNlWL4qB2fMbGb+vFcyga37esfKzm59o3zOTA18zhRMe3Q3gEAsntl0
	PD+TizcbUwndPlh6KOmKTF34i5EKDH0eFoqt/JPE1LZFhaPksIvknjeENVwYj6kV9GtPh+z885hOx
	jKrWaWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzaR-00000008Zgn-0kwG;
	Fri, 27 Feb 2026 15:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzaP-00000008ZgV-3oaB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fMwaBvqdwYCjJQBl60E8qyyHxhDXj5rHW+g0XPefEf8=; b=N8qWrqgw07bQPGGJ8OosKDS3+G
	Lk/sh0G0ClSLLcrUdRAhVt1hoiZXyBu7uTLTu4h9RExE8vqcMNFFrCn1g0CY2LyfSq3vMJTikwTBx
	LZ38NR6UKLyk6ZO6faugHrTgxW3zNqxZerDHljFa0PjbulGMpR8QJn3VUmg/O/Phz6ss3/0JP4ftn
	GY3DPCDp+g25jMutMFgtdmoyi+ZrFuIq5RPss/mNtctYBCW20V3KxHolXxAUxKVxxO2heOYDkvARH
	IGeGj4vbmxPrccwJmLn7GAl17YbZi7d4iDmaQVvOQWyKRg8LKcuRaMGzkIiTEQdNoz03q8166Kcfy
	+Hi8NuHA==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzaL-0000000DKdc-0XFR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fM
	waBvqdwYCjJQBl60E8qyyHxhDXj5rHW+g0XPefEf8=; b=qAXf2gXwUS0T+EnfhC
	VcvyDdrPGgBImptrFp3R7KQnXjvc5jpX3RxfhiCkh/OqmKeTDiG5w0v/eIF9zE9Q
	toqioLz5HUX3WtYyTeqzoLZ1qjqDKk/oCpATIEynglsqrUNLYxHKU0UpcbcyS2iG
	cvuf6/x3N5zivP82NQUkgz8eU=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD39_A2taFpCwnpPg--.7205S3;
	Fri, 27 Feb 2026 23:16:11 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] ARM: dts: aspeed: add 'resets' to video node
Date: Fri, 27 Feb 2026 23:13:15 +0800
Message-ID: <20260227151602.829-2-haiyuewa@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227151602.829-1-haiyuewa@163.com>
References: <20260227151602.829-1-haiyuewa@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD39_A2taFpCwnpPg--.7205S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr48Kr18WFy5Kw1UtF43Wrg_yoW8ury5pa
	y7Cr4kX3ySgF45t34UGFyDKr1DAay5JF4rKrsIk34UXry3X3sYqr1ftrsag34UXrs5uw1S
	gF1xXr9Fqw1DXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_ApeUUUUUU=
X-Originating-IP: [101.228.113.192]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzhs+qWmhtTszdgAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151657_837317_E2C59FA8 
X-CRM114-Status: UNSURE (   9.51  )
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

The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
the reset DTS handle specified, otherwise it will fail to load:

[    4.809494] aspeed-video 1e700000.video: irq 57
[    4.809977] aspeed-video 1e700000.video: Unable to get reset
[    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c3d4d916c69b..1547e28d77e2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -242,6 +242,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 39500bdb4747..793570ca2518 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -296,6 +296,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..3adf48987a17 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -428,6 +428,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
-- 
2.53.0


