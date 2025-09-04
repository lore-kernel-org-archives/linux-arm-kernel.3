Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863DCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t3YkA8eYz2VV/WwTvgxjsOxH7cEoaIYkMf2TA6+TZ0k=; b=o5RRsy86ZSIBS8JNNvgb7PP8P5
	pgvJRXTQ5cGuj7GroNzcnG1jxTFwz3qMZRmH4/WnD4oqlE4GdP041dBeuzwqbfAQjEKWtPg2N9bYP
	/eyNa1snX2PaMzV0okVZLKBEBD4gFoLvM3HQ//WMA4aY+5cbUtd0YZAPCo8KVCaWBTgz/d29Pnlzq
	HYxLI/2nO3LF0RcCSAdWRjcB2/1gaieG4Zpu0sq3rMRilMFIKOWFem6ememDZSEONH4mDf4tP+oNz
	mjsNQqBw5jRwnfv2HNk6L5fWPfXPrSLFnghrdca36nJqxT1XdkR/r/V7E1+s8QjwVGxWIlsDvbDqt
	Rs6Yhynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSI-00000008Hm3-0xDb;
	Thu, 04 Sep 2025 02:12:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty8N-000000080ne-1uL3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:47:28 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5840lONU2954654;
	Wed, 3 Sep 2025 19:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756946844;
	bh=t3YkA8eYz2VV/WwTvgxjsOxH7cEoaIYkMf2TA6+TZ0k=;
	h=From:To:CC:Subject:Date;
	b=NqkeGt2FcG2MYAxjfWL3evN30KyalWRdBrSdxkBdlOidcIe7sO7vSk2xUyGI/8M9h
	 Z7Ttm54aXMcIC5BNAaGq8vun/4s8IoKTJG6tRkci9pi6q3+WirYZtNjedfy7pPDrIk
	 zSx8rOa3TOZYxv57+BFUxyF7vTzRTMmMf4AQtyMU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5840lOF1476630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 19:47:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 19:47:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 19:47:23 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5840lNZJ2425599;
	Wed, 3 Sep 2025 19:47:23 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Move sdhci0 from common & update sdhci0
Date: Wed, 3 Sep 2025 19:47:21 -0500
Message-ID: <20250904004723.2856005-1-jm@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174727_534171_69B27689 
X-CRM114-Status: UNSURE (   7.57  )
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

Since eMMC HS400 has been descoped for j722s due to errata i2478 [0]
and is supported for am62p SR1.2 device, remove sdhci0 node from
common-main.dtsi and include instead in each device's main.dtsi
appropriately.

Also, update the tap settings and STRB for am62p eMMC sdhci0 node.

Tested on am62p SK board.

Judith Mendez (2):
  arm64: dts: ti: k3-am62p/j722s: Move sdhci0 from common
  arm64: dts: ti: k3-am62p: Update eMMC tap setting & STRB

 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 25 -------------------
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 22 ++++++++++++++++
 3 files changed, 47 insertions(+), 25 deletions(-)

-- 
2.51.0


