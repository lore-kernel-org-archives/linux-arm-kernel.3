Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D684C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kg2NnHcrGc9RkC6KDeqvn/0+/AwqkcPgEQ1yg+2Ozm4=; b=mnsSnqWk6pNy9cig8c7J2XJh5G
	5s993aQkpWNTHyGREhRsGJsUdKtOFbeWxNIJ0CnuYQqb36Y4x3blmCtHi8C98s0CVFkYlCzGvfljW
	zU4SPfbKnS5faU2kl5c4QW7xoLam2cdnIt7sARknWqm63y9y2LBu3CBvGH2T4jxchQF86FOJPugEq
	osCjHKv4AJNkR1uAmOjeODVHiekXwufTqXEK7DxllgfPNvQzlhSYeqs65ov67X6pwoPVqotHwrzMd
	HXIDEBQT6Fnwe8EFgdE6DuwwCDsLD5dfYORcVRIi9VTWzyJ70Kk07rYCVuBsJ8Kr16+AdyYuCe1Lz
	0Onx2OOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4enA-00000005cRJ-3sbp;
	Tue, 15 Apr 2025 11:49:29 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eF6-00000005Tul-1t2q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:14:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBDv8S2975116
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 06:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744715637;
	bh=Kg2NnHcrGc9RkC6KDeqvn/0+/AwqkcPgEQ1yg+2Ozm4=;
	h=From:To:CC:Subject:Date;
	b=kXFJs50TpXcISr3WXqVtI89G9hbECLV3QTFJ+DdE41OIDlGaqbJiQ/8mePP99X7nd
	 9KGGskrNs/RPtwTJQjmJo+wu/m+sA7Uc6U+sH8Pk1F8O8BjXolz8gYx1FpvDZDVVsk
	 cDoilLMdhXU3nTDiRre6S/lkc7eeA+7e7uSJ0Og8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FBDvxh122629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 06:13:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 06:13:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 06:13:56 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FBDqI5051431;
	Tue, 15 Apr 2025 06:13:53 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [PATCH v3 0/7] Fix dtbs_check warnings in CSI overlays
Date: Tue, 15 Apr 2025 16:43:21 +0530
Message-ID: <20250415111328.3847502-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_041416_595438_6ACBFD65 
X-CRM114-Status: GOOD (  10.60  )
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

There are a bunch of new warnings generated using CONFIG_OF_ALL_DTBS.
This configuration applies DTB and overlay together to generate test DTBs,
which are then validated using dtbs_check.

This patch series fixes all warnings related to sensor overlays on
jacinto platforms and a few minor warnings on sitara as well.

To fix some of the warnings, missing power regulator nodes are added on
the J721E-SK and the regulator hierarchy on the AM68-SK is corrected.

IMX219 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/3a2f8d0f2f5710108d8ca82eeba17bdf
OV5640 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/7801f74d28ed5895a15049ce9f0fbe60

Changelog:
Changes in v3:
- Change the PIN_INPUT to PIN_OUTPUT to control the regulator in j721e-sk.dts
- Rebase on top of next-20250415
- Collect R/B tags

Changes in v2:
- Split commits containing logically separate changes into individual patches.
- Use fixes and stable according to ./Documentation/process/stable-kernel-rules.rst
- Rebase on top of next-20250409

v2: https://lore.kernel.org/all/20250409134128.2098195-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (7):
  arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
  arm64: dts: ti: am68-sk: Fix regulator hierarchy
  arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX219
    overlay
  arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IMX219
  arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219
    overlay
  arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219
    overlay
  arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640
    overlay

 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  |  3 +-
 .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  |  2 +-
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  |  2 +-
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 13 ++++++-
 .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 31 ++++++++++++++++
 6 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.34.1


