Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE39CA100E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DyKTAE05zd7hVVcF/gkWKFhYS53prSAmivAbUQbAj3Y=; b=LlbAEWLgTgn/E6BVwgN85zl45/
	HHEWJscR9AfYLon74gHrZmS6jBMKKU8IpKHuLJM9rNGis1X8zx2UuuVTPGsMNtSXQP8el78oy5NjX
	snU4mgOi5Lq7V5VCTH5fxsoM6E2s1DHJOfzBNn43gX8laPhA/M7odCJc4xSn+0TRuY9Ayth0MVZ1Z
	ViBPJyyaxn7QQyV60Cw+8fEvuASNeDQIOzT1y2pocDVDHAYWNToBpoAmHFRoifI9aRqxQ2C1MK+Xg
	O8Xys2QECL84YYtqcspbVZx1EfJ56M/fD9HAb+ZjFHZZpXVp7Lxi0MbUZd2I8a/NFLu2hQ2lIgUE6
	aPEUwKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AZ-0000000CzJ8-0yhV;
	Mon, 01 Sep 2025 15:10:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3eR-0000000CSRb-1rsV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:28:48 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581CShP42770740;
	Mon, 1 Sep 2025 07:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756729723;
	bh=DyKTAE05zd7hVVcF/gkWKFhYS53prSAmivAbUQbAj3Y=;
	h=From:To:CC:Subject:Date;
	b=gmgsrrmib18epn0MWP9GOGEk+Xso4j/+4SpJlIwnytRUOBN5ni9+SP2BqYVCeJ4M9
	 jINnqILztwqgtyNloJirDTqMqNByKtyvcRn4/e7Z+E+lk/Eozh0qy8Df6aLtQtUXkG
	 9Aw3fGu7ERf7WrUuBzTvldSV3Wg4TWEYwYLAzEEs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581CSh9a2721477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 07:28:43 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 07:28:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 07:28:42 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581CSc7q2504775;
	Mon, 1 Sep 2025 07:28:39 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH v2 0/3] Remove unused bits from dts and add support for remaining pinctrl macros 
Date: Mon, 1 Sep 2025 17:58:32 +0530
Message-ID: <20250901122835.3022850-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052847_569683_239F2DED 
X-CRM114-Status: UNSURE (   9.62  )
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

This patch series cleans up the dts files to remove the pin control DeepSleep 
configuration that does not take effect in hardware.
This series also adds the remaining macros in the pin control file 
supported by SoC so that any configuration can be used as per requirement 
in dts files.

Akashdeep Kaur (3):
  arm64: dts: ti: k3-am62p5-sk: Remove the unused config from
    USB1_DRVVBUS
  arm64: dts: ti: k3-am62x-sk-common: Remove the unused config from
    USB1_DRVVBUS
  arm64: dts: ti: k3-pinctrl: Add the remaining macros

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  2 +-
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h           | 55 ++++++++++++++++++-
 3 files changed, 54 insertions(+), 5 deletions(-)

-- 
2.34.1


