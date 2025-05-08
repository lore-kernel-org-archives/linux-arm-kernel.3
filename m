Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10257C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=22LK9KobhX2zXmGcP3CVrZLeL3cLsZDdzOWb2Q5CuXo=; b=zc0xmX1OYnXoeGAQwfgNjij4cP
	pveckf7GRxGU0sTS28LvcIfJDpXNU7H2rmrnVI6hsT4330F52vcbpM8fVTEim5QFuKq3pnXwwSz0q
	DUlgGwwHnWX5DB2FRHYuDDl33Dq/cfTzDtzmqoI/WxZ9HYpr6y/c4vwJhaRCca3MwmF8bJxlNJsTh
	74Y5XyPZRBCRzSJD7w7Es1AVi/xbsuUEFXeyBvglpIU3StWFD23Sr5P8a9s6QdwTn/LYsnGrQz9d+
	s83f0yIYeC+iv+83dOHpEaGUfU2JzRDiKN6zzEsK/NqPXZAma0/XhxiUD0GUMtwW7pvffqcFzHPuR
	MucAT78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vX-00000001MkD-2mfA;
	Thu, 08 May 2025 17:20:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Xz-00000001CFf-0phP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:52:32 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548Fq7V51140288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719528;
	bh=22LK9KobhX2zXmGcP3CVrZLeL3cLsZDdzOWb2Q5CuXo=;
	h=From:To:CC:Subject:Date;
	b=LAAclLkR/xcZlvRvm2IqXjRJSHSs/QxYcoN5QtlU6RmuX5ix3Vn5325b1MtWgR2v8
	 WWWR4n1Zfd7RU5FtmhUqVnGjnFyTdkVpDPna/Ss8UhdaDw0B63t54SpQIHQCiUPq7i
	 T96qeBR4ObHAwSIoKCnV1ggDp9lAOeLTWtOIHvPI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548Fq74X084866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:07 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oK050794;
	Thu, 8 May 2025 10:52:03 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 0/4] Add overlays for IMX219 and OV5640 on J722S
Date: Thu, 8 May 2025 21:21:30 +0530
Message-ID: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085231_329017_CA38457F 
X-CRM114-Status: GOOD (  14.14  )
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

Changelog:
Changes in v2:
- J722S EVM has the CSI2RX routed to MIPI CSI connector and to 22-pin RPi
  camera connector through an analog mux. Initially, the analog mux was modeled
  in the overlay in v1, But following the convention used on other platforms,
  the analog mux has been moved to the base device tree. So that an overlay
  can control the mux state according to connected cameras.
- Correct the vin-supply for RPI camera connectors. To do the same add missing
  power regulators in the device tree.
- Mark GPIO used in the comment
- Add reset-gpios property for tevi-OV5640 overlay

Test logs:
IMX219: https://gist.github.com/Yemike-Abhilash-Chandra/8417af557ff2b82cf8d72be94d838c85
OV5640: https://gist.github.com/Yemike-Abhilash-Chandra/ea782b0caa5eb171258dd2244cf9604b

v1: https://lore.kernel.org/all/20250505115700.500979-1-y-abhilashchandra@ti.com/

Vaishnav Achath (2):
  arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

Yemike Abhilash Chandra (2):
  arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
  arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX

 arch/arm64/boot/dts/ti/Makefile               |   9 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 322 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  36 ++
 4 files changed, 696 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

-- 
2.34.1


