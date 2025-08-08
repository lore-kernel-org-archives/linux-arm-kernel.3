Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C26C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOpT3EwekMFbbDeQwgIjJn3HpvobDhJhNrmTDOKFa9A=; b=LDWh1eAEkxgScNKf50v/kBn5T3
	wtHJYib+/sqbOxXE5fMHCsYdgptqPIyXcXsdyn7fKJhDKLy4Yzz5dcH4bwPRiA4PTwGQSJQc6yR21
	TbMU8WKIlLyKBU/06IkR+P7LrzXKlDMCwBFEy2A2i6WdHj+ejlFxVWnUzRsqj54k+IYYb3o4Xyy8R
	wV0ZDCfCu9eU5E+Jd616QTvXJHkDCs+8saRNhibExnnJ4zTwiTmLXV++DPkUltOzc2Zlbdr9FyJvV
	Mlk1fLZzLrN9bm5XKXWhprzBCkAdbFDm2Oz+KaYovsYITS/j0SBgNtYn8VkNoBNZSP6Ew4cx0cc7E
	8r7AE2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJwm-00000002WSq-33Z2;
	Fri, 08 Aug 2025 10:03:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJrp-00000002VYN-3FD0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:58:31 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5789wHfT958032;
	Fri, 8 Aug 2025 04:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754647097;
	bh=BOpT3EwekMFbbDeQwgIjJn3HpvobDhJhNrmTDOKFa9A=;
	h=From:To:CC:Subject:Date;
	b=DDwCNx0vk1yWdBqOiukiY6ywgftUxYluhrEqc2dhS8pc9VI0h3vY6B0ZVYssDYvaC
	 fBj86a24HWmZXPKOP3rk9MfXWXDLrggFzK2D1yLJ6qOriserZOTyi+oEQmBKTrMHnI
	 v8FF6s8YgTjD3PrgV6jRf1BdNQXjAsD6nVG8c8Us=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5789wHUR1505394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 04:58:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 04:58:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 04:58:16 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5789wCOp2574818;
	Fri, 8 Aug 2025 04:58:13 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 0/7] Add Interrupts property for CDNS CSI2RX
Date: Fri, 8 Aug 2025 15:27:57 +0530
Message-ID: <20250808095804.544298-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025829_894686_463E46E0 
X-CRM114-Status: UNSURE (   9.41  )
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

The driver patch that adds support for error detection on the
Cadence CSI2RX by enabling its interrupt lines was recently
picked up [0].

Accordingly, this patch adds the required interrupts property
to the Cadence CSI2RX device tree nodes.

Changelog:
Changes in v2:
- Correct minor commit message mistake (patch 1/7)
- Collect R/B tags from Udit and Jared

Link for V1: https://lore.kernel.org/all/20250714092708.3944641-1-y-abhilashchandra@ti.com/

Test logs:
(To validate the complete functionality, CRC errors were
intentionally generated by modifying the sensor overlay)

AM68: https://gist.github.com/Yemike-Abhilash-Chandra/123fed82e798a76944ec23f8e46d1114
AM69: https://gist.github.com/Yemike-Abhilash-Chandra/1820e39888cb50e250a83e2d059365f6
J721E: https://gist.github.com/Yemike-Abhilash-Chandra/63f993a995fd6a12cb113454952c063f
J722S: https://gist.github.com/Yemike-Abhilash-Chandra/2144fc8ab2f7bcdb3ef868e85424467d
J721S2: https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4
J784S4: https://gist.github.com/Yemike-Abhilash-Chandra/0c594683772f11c70bccb508757e9799

Driver and Binding patch series: https://lore.kernel.org/all/20250416121938.346435-1-y-abhilashchandra@ti.com/

[0]: https://lore.kernel.org/all/aG9tuMFOnvwXkcE-@valkosipuli.retiisi.eu/

Yemike Abhilash Chandra (7):
  arm64: dts: ti: k3-j721s2-main: Add interrupts property
  arm64: dts: ti: k3-j721e-main: Add interrupts property
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add interrupts property
  arm64: dts: ti: k3-am62p-j722s-common-main: Add interrupts property
  arm64: dts: ti: k3-j722s-main: Add interrupts property
  arm64: dts: ti: k3-am62-main: Add interrupts property
  arm64: dts: ti: k3-am62a-main: Add interrupts property

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                 | 3 +++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                | 3 +++
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 3 +++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi               | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 +++++++++
 7 files changed, 39 insertions(+)

-- 
2.34.1


