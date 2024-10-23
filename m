Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD8CDDE64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OOav69xrLjc1Tf8Pp64sba+N+3XprTxwBkpV+TNsfYQ=; b=cCWY8q5/42I2NMDdKujwd/ZCxz
	rZ42VBzUCYHsTHhFgG3kETo3Y3RbxntVkN1So3JqsBym7K4hdo6D4f1E6mGqNplDYTs0KntId9u7N
	+a9yH9Nsy+Vza4oHRiQY/uxoiaKrwH5fas73XIu6XcrOdDEVtu8rspfHp6ns2+Oa54CNKpYZBYQ8H
	YGhRqgfO6k8ZeMSN00QqUHhWdyPQpphWr62W+w9hLC4Oyw6u7O556nfNDSXpJH7mXIfwJrPOEweyU
	bPJtl876+yidh9E8tRWWgmtTrN0hcLEp60rrtsB1c2fVencGXGB289FZg4b7RwOqqsJwp9QkkVHMx
	hcw9xaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z6G-0000000E4Nz-28Bg;
	Wed, 23 Oct 2024 11:00:24 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ys1-0000000E1rY-2JUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:45:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjb1v001673;
	Wed, 23 Oct 2024 05:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729680337;
	bh=OOav69xrLjc1Tf8Pp64sba+N+3XprTxwBkpV+TNsfYQ=;
	h=From:To:CC:Subject:Date;
	b=k3Swi63jh4eAsbUspTJcyyM6Wjpl6wek4cbRnuOzzyW5qN3ziHe+cafZ6nb3XwgZq
	 zg1VOtopHA+AyFgU91TzqRZ/J58bveFph3Le0aZzF0RioVpHOQ1v1do3ZWMuy+EZOn
	 vwtzlUdl++An6LJKpS/wiNhpdnGN5LaXccZSSVrw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NAjb4I070855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 05:45:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 05:45:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 05:45:36 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjW1r014331;
	Wed, 23 Oct 2024 05:45:33 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH 0/4] MCSPI clock ID fixes for J7200/J721E/J721S2/J784S4
Date: Wed, 23 Oct 2024 16:15:28 +0530
Message-ID: <20241023104532.3438851-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034541_742525_DF2EDFC4 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi all,
This series fixes the clock IDs for MCSPI instances across:
1) Main and Wakeup domains in j7200
2) Wakeup domain in j721e
3) Main and wakeup domain in j721s2
4) Main domain in j784s4

In j7200, kernel crashes were observed due to incorrect clock IDs.
In j721e/j721s2/j784s4, there was only a mismatch of clock IDs w.r.t
documentation, however it did not trigger a crash. The clock IDs can be
verified from the below links.

Documentation links:
J7200 - https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
J721E - https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j721e/clocks.html
J721S2 - https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
J784S4 - https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html

Test logs:
J7200 EVM CRASH - https://gist.github.com/anuragdutta731/2733fab2d734eea67bd5ad64a2ad982a
J7200 EVM SPI TEST - https://gist.github.com/anuragdutta731/e7f7610a0ff016415d5f58ff314a8c81
J721E EVM SPI TEST - https://gist.github.com/anuragdutta731/d8e63b1298e0c074f6a29544f30c3e87
J721S2 EVM SPI TEST - https://gist.github.com/anuragdutta731/48f6e67f776c025ec98ebe0809dac4a1
J784S4 EVM SPI TEST -https://gist.github.com/anuragdutta731/7c1367c9d0308c5b67a4efa579594970

Anurag Dutta (4):
  arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI instances
  arm64: dts: ti: k3-j721e: Fix clock IDs for MCSPI instances
  arm64: dts: ti: k3-j721s2: Fix clock IDs for MCSPI instances
  arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances

 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi        | 16 ++++++++--------
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi  |  6 +++---
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi  |  6 +++---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi       | 16 ++++++++--------
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi |  6 +++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       | 16 ++++++++--------
 6 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.34.1


