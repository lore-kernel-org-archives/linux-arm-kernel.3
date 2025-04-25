Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3BBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JhpzXDVwSy3f4gqHWufQhBYgL8KVWO79EB4j5tIS4UI=; b=XzCxFfeH5MOshvL3N0LqOomb2n
	zaYhYF+PZJaH4mYpNxCa5YUor8e1APLsZRyegw6v1Yj2iR8nT61DfidXiUTLEv/gJU4hhjLIvY3zG
	mOv1iRAq5qIiO8UC+NpLAAI2eOglMPioRWwD0HOLYeWq2fPITwnoWkQZEuCRsZSXQ8phMOeSXYaAy
	KW9qTnS7IirOdtQRQk7yLd5ACxL0m4tWMQvcV05mUBTAK+xisEubNvw4VJqOZ0PpLMZyg5XlTh0px
	k99sCu0QqjCIc1zDw7lKwsVw65wdAK+NJDIiFWRntp0wdWIDui5n+pyxAQBbn29168qjtde0ZFysX
	pAeBLHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8BN2-0000000Fxex-27wE;
	Fri, 25 Apr 2025 05:13:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8BLB-0000000FxRu-2Kot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 05:11:11 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5Awn12839322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745557858;
	bh=JhpzXDVwSy3f4gqHWufQhBYgL8KVWO79EB4j5tIS4UI=;
	h=From:To:CC:Subject:Date;
	b=sBGA/y+nXe44Uo6+kXYmQbOmviDHqsx62kUnLUDh6B8+e2oolPC4grZIsZRAVHtbN
	 q1h/oKR2V6uCM8vq3eEfUyiK5NcawPhFA4uGgLy3PNSZqX2u8d/GbHN2g24709cwvc
	 RP/ZH1wdWHpK8ONQBbC4WxZg7H7sNyl2xklTooVs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53P5Aw4V005736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 00:10:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 00:10:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 00:10:58 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53P5Avtl011185;
	Fri, 25 Apr 2025 00:10:57 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/2] Add bootph-all property to necessary nodes to enable ethernet boot for AM68-SK, J722s and AM62p-SK
Date: Fri, 25 Apr 2025 10:40:53 +0530
Message-ID: <20250425051055.2393301-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_221109_644254_C331247F 
X-CRM114-Status: GOOD (  10.02  )
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
ethernet boot support for AM68-SK, J722s and AM62p-SK.

This series is based on linux-next tagged next-20250424.

Link to v2:
https://lore.kernel.org/r/20250302153502.181832-1-c-vankar@ti.com/

Changes from v2 to v3:
- Removed "bootph-all" property from "mcu_cpsw" node as suggested by
  Vignesh since child node already has that.
- Collected "Reviewed-by" tag from Siddharth Vadapalli.

Chintan Vankar (2):
  arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all property to enable
    Ethernet boot

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 3 +++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 3 +++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
 5 files changed, 14 insertions(+)

-- 
2.34.1


