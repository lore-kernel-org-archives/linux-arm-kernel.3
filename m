Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194A4C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEgb0yk2iXz9tDNUVR6UA9scLwOsFWEtbAU0MsUUQeY=; b=yTnDQdM04qd5Ar+JYTUPVsWx7a
	JV/1M+n2YrCIeKPkD6U9BxON73fp93VH52Olvwg60RWohqhWo3eUndfGKQI8gmD8YHzbpByCZIINH
	8K1RkOyf+g91OCN/KuEUAu3VPlWWv/YznVinNMzdZhPpoy6sOLEo45FHua+5XhwtqfALnu8D1rdPo
	95ANo8F2J2KEwY5CVa1vLaPyB0gA8CYrh7Yo8IpE9wPwM317kuydWocWBleGtfwlYK11TojIuGUG0
	JqnKWqLUrz+IrSuFWTNyFrU8C4qwkNaWQgS34TDymU2o3ZoXI+y6NJ1sXX4R6kIoXYd7zW1+HsA9d
	zGL2bx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuTr-00000007EvI-1Mym;
	Mon, 05 May 2025 11:59:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuRp-00000007EPX-2NlP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:57:27 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvCE8239928
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 06:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746446232;
	bh=LEgb0yk2iXz9tDNUVR6UA9scLwOsFWEtbAU0MsUUQeY=;
	h=From:To:CC:Subject:Date;
	b=QgxPXOhOSBpu+eCCv7vc2TdnMvCwbM9b9EOLlkSN/K0BfbV3271Z5GOZSp33M+5z2
	 hYTrH46IsH+/8qdL0HzQKigGjE39oxHA3RwvjkZ0TunHh6+LJSbGjDOOTJkCNK8Bc0
	 +msQJwOwZB80NcqIf7qM+JUUfOpou2+6I7/xqni8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvCVs004349
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 06:57:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 06:57:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 06:57:11 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545Bv79x004832;
	Mon, 5 May 2025 06:57:08 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 0/2] Add overlays for IMX219 and OV5640 on J722S
Date: Mon, 5 May 2025 17:26:58 +0530
Message-ID: <20250505115700.500979-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_045725_661123_E7491A99 
X-CRM114-Status: GOOD (  11.00  )
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

This series adds IMX219 and OV5640 overlays to enable support
for 4 sensors on J722S. This provides a reference for a user to
enable a different sensor on any of the ports.

These two patches were initially part of [1], but were dropped
due to a few warnings reported by Rob. Hence, they are now sent
as a separate patch series with all warnings fixed.

[1]: https://lore.kernel.org/all/20250218185452.600797-1-vaishnav.a@ti.com/

Test logs:
IMX219: https://gist.github.com/Yemike-Abhilash-Chandra/a797689069bf60dcbcba9612094f9b53
OV5640: https://gist.github.com/Yemike-Abhilash-Chandra/84b9d8f9b93025b4348e31c95efd261f

Vaishnav Achath (2):
  arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

 arch/arm64/boot/dts/ti/Makefile               |   9 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 339 +++++++++++++++++
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
 3 files changed, 706 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

-- 
2.34.1


