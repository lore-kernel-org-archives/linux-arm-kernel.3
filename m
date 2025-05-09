Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA7EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6/iRFYzPNHtnA5edzxBiliTVPFalD8x1Cxf9opghRw=; b=kRJKg1dVncCHjScKme6jB50RzQ
	Yf7UdtAoafG4Fz8RCjkl4nqzc1saedA29b5mxzVRUHmiPWk/kdLEyN9zEleUYUH+5uKkSQ6p5a3Hx
	ZiWr7+AW0UpJe0LMVTHiBnt24kEQ6xurIvEDJJQiDS45ixHgXIXzgIATt9hclBCuzukUj3CrIhcJ1
	saElTt8mMMHow+wgCac9NvWjxAvJW/tzIP6seRttDSMZsNVclEeSEcmcLBRuVAhM2QHCAM0eNkjX4
	STRzlnco/xmeiRolkZzoQpwapE3YfRbg0RrskH9xTw/IZy9lLdtQ6HG3NOD3ixl2yK3ajOIUgKACG
	fovmSucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKet-00000003Cww-3gnD;
	Fri, 09 May 2025 10:08:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJtK-0000000350z-43bP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:19:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JQXW2126646
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 04:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746782366;
	bh=W6/iRFYzPNHtnA5edzxBiliTVPFalD8x1Cxf9opghRw=;
	h=From:To:CC:Subject:Date;
	b=isek1appXOplxDelovhP2CQ+QdYp1bFsyp9Gtw/sQciNXHYsnmVNdYjbO+XVHhm0H
	 t8idkFQnGWf4Ibx4R645/qzqqpih2paTsdMspNIjKF27XuWdvaKevBkKuxsnA2HqdY
	 Jib51lRN2AGXdkso4xiKvzcoNQwLugKxeYtw/zwY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JQ9i029335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 04:19:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 04:19:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 04:19:25 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5499JL7r070287;
	Fri, 9 May 2025 04:19:21 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v3 0/4] Add overlays for IMX219 and OV5640 on J722S
Date: Fri, 9 May 2025 14:49:07 +0530
Message-ID: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021939_094360_93564C74 
X-CRM114-Status: GOOD (  15.74  )
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

Test logs:
IMX219: https://gist.github.com/Yemike-Abhilash-Chandra/88d4803378d4a3e20f1cbd3b9ada91ac
Ov5640: https://gist.github.com/Yemike-Abhilash-Chandra/738737fa5b1b635d260d9601ae2e85aa 

Changelog:
Changes in v3:
- Add make file entries in alpha sorted order in Patch 3/4 and 4/4
- Change vcc_3v3_exp to vsys_3v3_exp as per schematics in Patch 1/4
- Change "model that so that" to "model mux so that" in commit message of Patch 2/4
- Correct copyright year in tevi-OV5640 overlay in Patch 4/4

v2: https://lore.kernel.org/all/20250508155134.2026300-1-y-abhilashchandra@ti.com/

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

v1: https://lore.kernel.org/all/20250505115700.500979-1-y-abhilashchandra@ti.com

Vaishnav Achath (2):
  arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

Yemike Abhilash Chandra (2):
  arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
  arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX

 arch/arm64/boot/dts/ti/Makefile               |   9 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 323 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  36 ++
 4 files changed, 697 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

-- 
2.34.1


