Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C25D69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wy6HOPbWreNm+gjYiR1HLh5EyGj5Sb/iKkYx1y4lO0Y=; b=cJaFHpiOccRHIehJP9pkjXgfiZ
	fGufnGWZwB7IkOmZTOulJlUezNYZbh0mkbusZslK+KgkyKsxCFrlwgSp0mNY3OZCSZMWSpZbLejdS
	PlZ8p1zKNiLbTTaqDvyoDIuCq8nHA2VmwZXzXVxVD+3hCatNK/Frit5IpT5QKmkjUWfTGPIStDMkA
	fu/fcDLFD2KiGwN7oYzbKQVdXWkIk8Yjla2rmlYoQ5aoV2Z2aapUbY++dAGqZ34c4yGhrmltVMxhe
	0iey6VQQkfnL8KpdL5eZL8UC09oFEwd4+QbV/sf+QnFVQPbkvxnGvVZysNXoxoYpGaumyWwPGR4CT
	3QfMjaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgR0-0000000FtMH-0wkE;
	Thu, 28 Nov 2024 15:28:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgP7-0000000FsqO-2DRc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC2AAA43C27;
	Thu, 28 Nov 2024 15:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE71C4CED3;
	Thu, 28 Nov 2024 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732807564;
	bh=g810kAl+76OQ/4YxppQXydRnBCHRq1jvESwrtTuhF6I=;
	h=From:To:Cc:Subject:Date:From;
	b=hmWY0Zt+AHRBnOkCBzBNQSAP8i5XhfJvJWqTn6KhkHhw+W852QT1POwbL516InTRa
	 x4p5ROfbEWlyCPd6qpg4ax9VeYkd8/PRudEFKB+eWrbFdrqLBTBJ4aGI0bFgLWtR1b
	 sL9NZ50nkWF0q7+Ngk1XsUfjHNqPcap73qcINJp/1hGyWH8HDJWOQM4TSYUn+aXRSh
	 VUGpRnZZepYLzn8Vp7UpxG1J6iRiKOGGIerJN9iYuq8KOWAIyx6uqx/CjKjQ1M48aI
	 CwxPvee9vYyBbq54QwAWRk9FQP0hpB8FfJS0i9hcUxNtN0zh+jLZ/Y0aNtExqWQoTy
	 dP4RgqGCTr5Vg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: fvp: Update bus-range property
Date: Thu, 28 Nov 2024 20:55:43 +0530
Message-ID: <20241128152543.1821878-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_072605_687955_C89FAF8B 
X-CRM114-Status: GOOD (  11.51  )
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

These days, the Fixed Virtual Platforms(FVP) Base RevC model supports
more PCI devices. Update the max bus number so that Linux can enumerate
them correctly. Without this, the kernel throws the below error while
booting with the default hierarchy

pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
pci_bus 0000:02: busn_res: can not insert [bus 02-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci_bus 0000:02: busn_res: [bus 02-01] end is updated to 02
pci_bus 0000:02: busn_res: can not insert [bus 02] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci_bus 0000:03: busn_res: can not insert [bus 03-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci_bus 0000:03: busn_res: [bus 03-01] end is updated to 03
pci_bus 0000:03: busn_res: can not insert [bus 03] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci_bus 0000:04: busn_res: can not insert [bus 04-01] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci_bus 0000:04: busn_res: [bus 04-01] end is updated to 04
pci_bus 0000:04: busn_res: can not insert [bus 04] under [bus 00-01] (conflicts with (null) [bus 00-01])
pci 0000:00:01.0: BAR 14: assigned [mem 0x50000000-0x500fffff]

The change is using 0xff as max bus nr because the ECAM window is 256MB in size.

pci-host-generic 40000000.pci: ECAM at [mem 0x40000000-0x4fffffff] for [bus 00-01]

lspci output with and without the change
without fix:
00:00.0 Host bridge: ARM Device 00ba (rev 01)
00:01.0 PCI bridge: ARM Device 0def
00:02.0 PCI bridge: ARM Device 0def
00:03.0 PCI bridge: ARM Device 0def
00:04.0 PCI bridge: ARM Device 0def
00:1e.0 Unassigned class [ff00]: ARM Device ff80
00:1e.1 Unassigned class [ff00]: ARM Device ff80
00:1f.0 SATA controller: Device 0abc:aced (rev 01)
01:00.0 SATA controller: Device 0abc:aced (rev 01)

with fix:
00:00.0 Host bridge: ARM Device 00ba (rev 01)
00:01.0 PCI bridge: ARM Device 0def
00:02.0 PCI bridge: ARM Device 0def
00:03.0 PCI bridge: ARM Device 0def
00:04.0 PCI bridge: ARM Device 0def
00:1e.0 Unassigned class [ff00]: ARM Device ff80
00:1e.1 Unassigned class [ff00]: ARM Device ff80
00:1f.0 SATA controller: Device 0abc:aced (rev 01)
01:00.0 SATA controller: Device 0abc:aced (rev 01)
02:00.0 Unassigned class [ff00]: ARM Device ff80
02:00.4 Unassigned class [ff00]: ARM Device ff80
03:00.0 PCI bridge: ARM Device 0def
04:00.0 PCI bridge: ARM Device 0def
04:01.0 PCI bridge: ARM Device 0def
04:02.0 PCI bridge: ARM Device 0def
05:00.0 SATA controller: Device 0abc:aced (rev 01)
06:00.0 Unassigned class [ff00]: ARM Device ff80
06:00.7 Unassigned class [ff00]: ARM Device ff80
07:00.0 Unassigned class [ff00]: ARM Device ff80
07:00.3 Unassigned class [ff00]: ARM Device ff80
08:00.0 Unassigned class [ff00]: ARM Device ff80
08:00.1 Unassigned class [ff00]: ARM Device ff80

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 289c5f9d1c8d..225a1ed8aa08 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -233,7 +233,7 @@ pci: pci@40000000 {
 		#interrupt-cells = <0x1>;
 		compatible = "pci-host-ecam-generic";
 		device_type = "pci";
-		bus-range = <0x0 0x1>;
+		bus-range = <0x0 0xff>;
 		reg = <0x0 0x40000000 0x0 0x10000000>;
 		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000>;
 		interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0


