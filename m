Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C195EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJjJBaq03pKIS8WUc8G2n2rEbHLp8PdWdJmdNjoEIKg=; b=4NVT6rf8v8b4XT4yEoHIYUQuq1
	V+jbjNod7c7LXvL+D4xF+IWG90Wr94eZ9jBRlTD2XMCeTUv3VswviTMe7iPOEXbX3rX4+iuTUorEc
	Gi6sDetjsi2cmW7VDwbiFSWYVib/VjsCQZo3QEhYFRAES7EkxunqnJJ2hnyw2fKTqha2Zv3XJWLQa
	ljybRIWa9aXduDr0zg84tEGLdK9dTG7cMAQHmLgQVGuPrD9ytdFLwVBXaf2m4ZL6+0abzl1HTCTUr
	dQv9wdk/QZaWOZAhQ8sTqHUQ+V0tJLUbIiR+aqrzhPCBH513zHDXwvldIdO6NOeipUlVt7+2bujZP
	J8eJ+P8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Me-00000004rZV-0IAG;
	Tue, 08 Jul 2025 09:11:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3uy-00000004mVO-29Ga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:43:14 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5688h5Ka460601;
	Tue, 8 Jul 2025 03:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751964185;
	bh=HJjJBaq03pKIS8WUc8G2n2rEbHLp8PdWdJmdNjoEIKg=;
	h=From:To:CC:Subject:Date;
	b=pfl4iBqtzSRdaN8NJcEx8QHGsGnDsZy9djJhOL/6JnPm6tAXVkbFpKp0I1s3rHhIN
	 s8SCmIBvsiwcGZXz1mNxzYLmzDh3RQ8o0RikWFyMutumewdwweqDdwJNF4qet6oOmu
	 ILWPB+BZ8Q+fChJG1MnvyxYDC5LjCsKvo2I+0ERM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5688h56V1287238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 03:43:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 03:43:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 03:43:04 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5688h4x71477715;
	Tue, 8 Jul 2025 03:43:04 -0500
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
Subject: [PATCH v5 0/4] Add bootph-all property to enable Ethernet boot
Date: Tue, 8 Jul 2025 14:12:48 +0530
Message-ID: <20250708084252.1028191-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_014312_595953_7C72A49D 
X-CRM114-Status: GOOD (  10.24  )
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

This series is based on commit '8d6c58332c7a' of linux-next tagged
next-20250703.

Link to v4: 
https://lore.kernel.org/r/20250429072644.2400295-1-c-vankar@ti.com/

Changes from v4 to v5: 
- Updated [PATCH v4 2/2] by adding properties to the respective board
  files and split [PATCH v4 2/2] for AM62P5-SK and J722S-EVM.
- Added a new patch to enable Ethernet boot on SK-AM69.

This series is based on linux-next tagged next-20250428.

Chintan Vankar (4):
  arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p5-sk: Add bootph-all property to enable
    Ethernet boot
  arm64: dts: ti: k3-j722s-evm: Add bootph-all property to enable
    Ethernet boot
  arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet
    boot

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts          |  7 +++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts            | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts          |  8 ++++++++
 4 files changed, 39 insertions(+)

-- 
2.34.1


