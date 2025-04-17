Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gY5xaGXP02UKsHjzScQaLSQMWROzx3JrkxRyvWtZiEs=; b=wwbr8o5TFIrRNaNgvmz7DRYHJ7
	rO577ra+XHrZ1v6pjBAhj2p93RmK/liBWITr8EMxrMShHqlsdjr02Zm0RT6225B59vuu5sxMevrBB
	WSAW2f/tWQPgTokh9yrjISAPNt8e5rrJIZfNuDtmgs+Vvaz6vs5AHPds9EoKX+2ugzUNFep1d2fZX
	9I4z4tgyIX5eZ7HGOF5m8QiF+arJIIWk4SIScf6P5eFolj5F3EpTBLdxWxQqTStQ4gm5TIN+oXVKF
	uAyG2CvUoE1SLmUYxXoHhtrYJbteY5dUMGAyMclBPEgfNGf2h4gztlZ2T5W+aNOJiKwh/ZBizicRD
	v9zf5wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Of8-0000000D2YH-1tfm;
	Thu, 17 Apr 2025 12:48:14 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OQJ-0000000Cy0q-1Hs9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:32:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCWpHk691161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744893171;
	bh=gY5xaGXP02UKsHjzScQaLSQMWROzx3JrkxRyvWtZiEs=;
	h=From:To:CC:Subject:Date;
	b=JnKSTnWwK0T9zGwACqEuTOILuB3S4ncoJzRY/fXZPi9hyQhzxw9XLS1ySEgHMo2XB
	 uXwhjC/xqtsbo5nRBhcOAXT8G2scPtdJ+4E+9+9Z+GJ5pA4KHMvFoITIl2wCLbcwXh
	 0JLp4ipU6RmLDfyPbTe7fF2VWT0tUMq1d43PADwo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HCWphO094055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:32:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:32:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:32:51 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HCWkMO038275;
	Thu, 17 Apr 2025 07:32:47 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 0/4] J722S: Disable WIZ0 and WIZ1 in SoC file
Date: Thu, 17 Apr 2025 18:02:42 +0530
Message-ID: <20250417123246.2733923-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_053255_437766_4C24749D 
X-CRM114-Status: GOOD (  11.84  )
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

Hello,

This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
nodes in the J722S SoC file and enables them in the board files where
they are required along with "serdes0" and "serdes1". There are two
reasons behind this change:
1. To follow the existing convention of disabling nodes in the SoC file
   and enabling them in the board file as required.
2. To address situations where a board file hasn't explicitly disabled
   "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
   as a result of which booting the board displays the following errors:
     wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
     ...
     wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

Additionally, another series for DT cleanup at:
https://lore.kernel.org/r/20250412052712.927626-1-s-vadapalli@ti.com/
has been squashed into this series as patches 3 and 4.
This has been done based on Nishanth's suggestion at:
https://lore.kernel.org/r/20250414143916.zhskssezbffmvnsz@dragonfly/

Series is based on linux-next tagged next-20250417.
NOTE: For patches 1 and 2 of this series which are "Fixes", it has also
been verified that this series applies to the following commit
cfb2e2c57aef Merge tag 'mm-hotfixes-stable-2025-04-16-19-59' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
of Mainline Linux.

v2 of this series is at:
https://lore.kernel.org/r/20250408103606.3679505-1-s-vadapalli@ti.com/
Changes since v2:
- Collected Reviewed-by tags from Udit Kumar <u-kumar1@ti.com>.
- Squashed the DT cleanup series at:
  https://lore.kernel.org/r/20250412052712.927626-1-s-vadapalli@ti.com/
  as patches 3 and 4 of this series.

v1 of this series is at:
https://lore.kernel.org/r/20250408060636.3413856-1-s-vadapalli@ti.com/
Changes since v1:
- Added "Fixes" tag and updated commit message accordingly.

Regards,
Siddharth.

Siddharth Vadapalli (4):
  arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
  arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
  arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
  arm64: dts: ti: k3-j722s-evm: drop redundant status within
    serdes0/serdes1

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 10 ++++++++--
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi |  8 ++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.34.1


