Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F98C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eT1vk5XLAjl/TpZqvTHxGOR9jCT9UoSjSIUIYdqBtkE=; b=XJRI4CM7Wl1/yhtvMeVHYmj0Gq
	dJerRNFkbEW+f5vCZC1qQTU+OYBCz4PqWSRq4PI9EdzOIRwU/WlZJ3tS9xDMVtWiWaQuCG/5TriY+
	U6b4F2p/3ZQUzYG+laxcm20m1PMvZy46EQg5X7MWsN2bHdPZoUF3kLecChh7WDGEDuQGb+wkePOUq
	Ira+ZPFflrujLFosTxiJ5QavEpKXkzWmGn2A/0vB6Q9IkQ1aXpgb5ZtiJ9WUUZJOrkZ8vLTpguwmz
	BjVdofraXtVvkR7S3xohwz7wgFybyeP289BcG9xcUtMnqzgGF7e15IjtZh6KUsQLz2tSUNaKPEAFa
	20Egq5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o69-0000000AIdt-457b;
	Tue, 29 Apr 2025 16:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mfp-0000000A4hm-1lOL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eT1vk5XLAjl/TpZqvTHxGOR9jCT9UoSjSIUIYdqBtkE=; b=Go8vyfBy129tsyI7Yj+/EIPAlJ
	+IC4zEekDiOqBOgFHKjJbhCTPlRzUk9MzFyoW5U22hVTQQiHy40e0dioHf+hceF1E3MPVAh7R0MRc
	lna/E1n+5+ZjPwfzBcgom6ZhV1j3d8LpdnC9gtUG22SElp3Eh78uCoWDEtAso1BMeVJBysFYvtRQv
	uimpgt+LNc8XBOKus967wB7rO7H26Ax4CB7tCQ3mc3e7CWOI7YtmOwHCUu1N1qB0uNvZe4fmaan8W
	2YwTBmZGZLx3bVje9dFq4uxjBdaRzhAvK1RGxVek2OA/E8sxFGtQh0mwNX+pGKT3S/q7xVTmAH6K3
	r7YsHJUA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mfm-0000000DQsm-03kF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:15:04 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtE43129345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745939695;
	bh=eT1vk5XLAjl/TpZqvTHxGOR9jCT9UoSjSIUIYdqBtkE=;
	h=From:To:CC:Subject:Date;
	b=UKMn933M0o57lbaJ4fAAZ1jCkSHygKp9fWbNCyGFcDEk2b6xTPkjRQSmV2a0zrtKS
	 Z5Bde8Gn0XzjbSTkeifW6x1TwWC6F327OHjWjEh4xxwkElPFfh5kVYa1no1tx5KDAu
	 meC+vuHu3RzlqPlnPmeRfOnBOXvViDvMlMfPwSwQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFEtoW032103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:14:55 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:14:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:14:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFEslu129369;
	Tue, 29 Apr 2025 10:14:54 -0500
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
	<u-kumar1@ti.com>
Subject: [PATCH v3 0/3] Misc MMC updates
Date: Tue, 29 Apr 2025 10:14:51 -0500
Message-ID: <20250429151454.4160506-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161502_403278_BA9C56C1 
X-CRM114-Status: UNSURE (   9.71  )
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

This patch series includes updates for eMMC and SD nodes across
Sitara K3 SoC boards:

Add boot phase flag to MMC nodes and dependency nodes to support SD and
eMMC boot. 
Add non-removable flag to eMMC nodes to void having to redetect
eMMC after suspend/resume.
Remove disable-wp for eMMC nodes since property is specific to SD.

Changes since v2:
- Split out patches meant for stable
- add review tags

Link to v2:
https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
Link to v1:
https://lore.kernel.org/linux-devicetree/20241014194722.358444-1-jm@ti.com/

Judith Mendez (3):
  arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
  arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
  arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts             | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi      |  1 -
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts       |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     |  1 -
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              |  3 ++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi       |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts              |  1 -
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts       |  1 -
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi    |  1 -
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                |  1 -
 11 files changed, 17 insertions(+), 10 deletions(-)


base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
-- 
2.49.0


