Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11570C83F19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kHbCKQ8p1jDj8v12ktRvQ3BglcMakSPOnDiSl02HrQo=; b=CvhGnHbkUpk6r3
	9rJbfvisb+Tp/V9xbhA0YZj4oQBCJeASswRFJVoDmNOFDydjywBWUibX4mZjZIPXRjEVqqdqnQOKW
	O46aGxKOjyErT8aRh5uXrqPcsro/jxL6ToRWjNa3rBRyoPnxGJBJfT90s96oXTqSYTcuG4e4XgnxG
	4jG7WlwEj9I0w03GqjuaTbuCopCzVOWixYMgu95ZkdF2ipTbRehQBP0yMoJMnEbb9dJMmD16wwk+h
	uxNQO8vFROqvxnMi//7+n74v2aPMpS2EdeFo+HiHiKyD4TSAXTgW0tSrISt7YscnhpotkgCDIuEAX
	KUP3ljjVkGFJCx9wLN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZegu-0000000AHVn-1y3X;
	Wed, 09 Jul 2025 23:59:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdOO-0000000A6D3-2XJ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:35:57 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569MZpWP952194;
	Wed, 9 Jul 2025 17:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752100551;
	bh=kHbCKQ8p1jDj8v12ktRvQ3BglcMakSPOnDiSl02HrQo=;
	h=From:Subject:Date:To:CC;
	b=fZ98xm/ZlcxgcMBA5A1dOAC308+yotiLypWmprguQlkkBOsPFK421upHtzTdmst0k
	 aOMdxOIDVaR70EgfuQBn/olgwYuBJot4hYUm4ocyMoiAG5saUspYy/pBxhc3ZW8Pky
	 LDKCooC4qsGnqeABbMV+AP5hANoQ5diaY+0tTX3A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569MZorv2415886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 17:35:51 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 17:35:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 17:35:50 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569MZoYX230289;
	Wed, 9 Jul 2025 17:35:50 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH 0/2] arm64: dts: ti: k3-am65: add boot phases to critical
 nodes
Date: Wed, 9 Jul 2025 17:35:42 -0500
Message-ID: <20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7ubmgC/x3MQQ5AMBBA0avIrE1SFYqriMVgymxUOiKSxt01l
 m/xfwLlKKwwFAki36ISjoyqLGDZ6dgYZc0Ga2xjnOmxbXAO4cJzJ2VFIl8TtevsOgs5OiN7ef7
 hOL3vBycrAtNgAAAA
X-Change-ID: 20250709-65-boot-phases-aaf3aa6db782
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_153556_691205_21FD20B6 
X-CRM114-Status: UNSURE (   9.98  )
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

Hello everyone!

To save precious on chip RAM space during bootup 'bootph-*' flags was 
added to the dt-schema to describe which nodes need to be present during 
each phase of the bootup process and which can be pruned to recover RAM 
space that would otherwise be wasted.

This small series adds the bootph-all flags to all the boot critical 
nodes for all boards that utilize the AM65x as well as to the AM65's 
reference board.

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      arm64: dts: ti: k3-am65: add boot phase tags
      arm64: dts: ti: k3-am654-base-board: add boot phase tags

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi       |  1 +
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi        |  2 ++
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi     |  5 +++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am654-pcie-usb2.dtso |  1 +
 arch/arm64/boot/dts/ti/k3-am654-pcie-usb3.dtso |  1 +
 6 files changed, 27 insertions(+)
---
base-commit: 036cc33070b35754f45da50d81f8c3c85191c8b7
change-id: 20250709-65-boot-phases-aaf3aa6db782

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


