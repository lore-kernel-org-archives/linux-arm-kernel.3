Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B5AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+TWzMrm54xfZ0RWb5/Dm+shOivo1lObaYOF3smCwj4=; b=wjf7Ml5R/UYbHZ7z/UFdJZTFiA
	RPiKrwaCA/b3fvdVv2ZY231tqLSnaHlDga5TWEuVVzBDxTl2SNpEhZC42duFHi6cuhoprBTd/xHtq
	HuT4yj++zDmyA3x8tSutCjRrVxEac13w+U979spAI59S9KwoABClvJz17JeKSSJ2nlTBKDY0nxmwB
	ebfOSKm3DrzgQ4ijY19nyiE7V7z3Yh7kHCrqY9DNr5Xoi7Y8/CCJGYo3LGXRsG3RU8Vw2n5Url0ag
	q8cqxHzO2wBCHwqZrsRtbdPt0lsgroIiaQ+ulp/1OnY1Ow9300ePpU9u13ODLAK8yBTLXLf4Z2gTF
	KwS1A2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUC7F-00000006zdG-2370;
	Tue, 24 Jun 2025 22:27:45 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBsh-00000006wzz-1x8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 22:12:45 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OMCV5a1669410;
	Tue, 24 Jun 2025 17:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750803151;
	bh=9+TWzMrm54xfZ0RWb5/Dm+shOivo1lObaYOF3smCwj4=;
	h=From:To:CC:Subject:Date;
	b=JgE1WtSN9PhyKQdfZ59E1u6JrAuHkGJ40AHaSUh2sgThXcI8Nj5D3lDRwqllD5qn5
	 +FWUSlWCATUURND5C3RApKRZV7HJssEpXwokEWN0zY/IydEHhXN+6RcN8NtKrfL/mI
	 EhBy7NBE1iJu0+tbfztgZ4tK9K/FpQNbMuVlcCyg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OMCUrk1942543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 17:12:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 17:12:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 17:12:30 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OMCU9J2248346;
	Tue, 24 Jun 2025 17:12:30 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian
 Hunter <adrian.hunter@intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH 0/3] Workaround for Errata i2312
Date: Tue, 24 Jun 2025 17:12:27 -0500
Message-ID: <20250624221230.1952291-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_151243_558137_7143F958 
X-CRM114-Status: UNSURE (   7.28  )
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

This patch series includes fix for Errata i2312 [0].

Also include fixes for removing eMMC HS DDR support for am62
SK which has been descoped as per datasheet [1] and enabling internal
pullups for AM62 SK and AM62SIP SK, as per JESD84 spec recommendations.

[0] https://www.ti.com/lit/pdf/sprz487
[1] https://www.ti.com/lit/gpn/am625

Judith Mendez (3):
  mmc: sdhci_am654: Workaround for Errata i2312
  arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
  arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      | 25 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |  1 -
 arch/arm64/boot/dts/ti/k3-am625-sk.dts        | 25 +++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 ------------------
 drivers/mmc/host/sdhci_am654.c                |  9 ++++---
 5 files changed, 56 insertions(+), 28 deletions(-)

-- 
2.49.0


