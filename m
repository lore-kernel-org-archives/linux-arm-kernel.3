Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COpfDiVXZBGN9wKzW19B8G0HVXTQxbGSo82AzxjeetM=; b=ycY7tksud9Nm2Z5fXv4I4FVYSm
	4+u/X01ye5Hyfo4pLuUz0eSZRAXzWqWQNoLPnzA/hg4kKX1GoiJ+s0DmI2/igY8EkPyCY5gcf3h2o
	NKlA7EGSppQ5tSNW4CQbfmQDhWiQIKDNg0kYSbiAC6YY/mI52lgdZDl2DDz5qOPLsAOIplrQp35xl
	5YoN1E6BpY4D+tFKOLwyLWBJXUgKNB6NL1PdfnpsGoo24Y57BWJJQUsBrobZOMwE0rvUF2yuKFL9/
	fEizKb3a4BvKXKYGNDNVFtkY0Qy1ARFIak/W7zPP8KlRQjofTExqvkMvvmUf8n8XiW2h48e6WtnA+
	Hcd9BAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUaX-00000008kDK-1j06;
	Wed, 09 Jul 2025 13:11:53 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSQf-00000008Nrl-2J8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:53:35 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569ArTOs1426245;
	Wed, 9 Jul 2025 05:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752058409;
	bh=COpfDiVXZBGN9wKzW19B8G0HVXTQxbGSo82AzxjeetM=;
	h=From:To:CC:Subject:Date;
	b=Am9mtSpzsx3+ZS3f2Vkf26kJB1zAKdwouNaXfveW/1SpetcGekCk8AE/BCmU4lr84
	 vYIEMm3z0cyPgur/0jNlbo9J12qnOiF8cfa/loaVcNlHxcks4ut/9VNYhweInIP6Qx
	 Z+hUPYrn1xUwNKHh5QZzMkZXerOF1DQGFt5G+gq8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569ArTKv1934176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:53:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:53:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:53:28 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569ArRjF3516329;
	Wed, 9 Jul 2025 05:53:28 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <c-vankar@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v6 0/4] Add bootph-all property to enable Ethernet boot
Date: Wed, 9 Jul 2025 16:23:22 +0530
Message-ID: <20250709105326.232608-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_035333_630042_1F10F53A 
X-CRM114-Status: UNSURE (   8.74  )
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

This series adds bootph-all property to necessary nodes to enable
ethernet boot support for SK-AM68, AM62P5-SK, J722S, and SK-AM69.

This series is based on commit '58ba80c47402' of linux-next tagged
next-20250708.

Link to v5:
https://lore.kernel.org/r/20250708084252.1028191-1-c-vankar@ti.com/

Changes from v5 to v6:
- Added bootph-all property to "cpsw_mac_syscon" node for AM62P5-SK, J722S
  and SK-AM69.
- Removed bootph-all property from "mcu_udmap" node for SK-AM69 since it
  was already present.
- Corrected "bootph-all" which was misspelled in previous version for
  SK-AM69.

Chintan Vankar (4):
  arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p5-sk: Add bootph-all property to enable
    Ethernet boot
  arm64: dts: ti: k3-j722s-evm: Add bootph-all property to enable
    Ethernet boot
  arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet
    boot

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts          | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts            | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts          | 12 ++++++++++++
 4 files changed, 47 insertions(+)

-- 
2.34.1


