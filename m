Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B28C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3OEA1Sc6R/H8eB7vrTHC8OLJDDsJGPdc9uDzBbAVuM=; b=2PsSR1njCvCUQEMdgiM4SplvyD
	i1rqixRhmq3A7CicEQB/9FIcbUQ1d2+hdpGq83bwpa2ytQ7Y7Kaw4kCnu6LjH5iwlhazRaC7dYLyw
	OT47ECUTMmJTH5jV2yDuFm2MggWmslTSdWLXlGglBTuLNCIFMFZdKDFHyVTt894cSApIboUcgf5k9
	4/HCGBkScKglwg/7xJvnFmecc2BTG78pibBAaAjZ6orLjOxM0YY0jj1ADV7UctVpWQE6UvBHogy2k
	TtOK4JczOpgBOFnB80lSBPTn2WLGqCbf9b6fuU72lxfwJ63t705IJexlyPSkc/0myV5aXAinlBaYK
	Sawv/shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th2XA-0000000EKiK-1xzn;
	Sun, 09 Feb 2025 08:19:20 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th2Vm-0000000EKW1-219e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 08:17:55 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HhnG4037189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 9 Feb 2025 02:17:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089063;
	bh=w3OEA1Sc6R/H8eB7vrTHC8OLJDDsJGPdc9uDzBbAVuM=;
	h=From:To:CC:Subject:Date;
	b=c5abNXa+9eJQVVHcIfxSCt3t0DCvR43Q+rff6FuIoYWzRrq2EUDKPENG0cjTfBCh0
	 yrxsqurlcI7j2TDFp91yxRd5GLCxwLxJeakOwoVIOkme0nRdaaYQNDYeleEYU6AOgX
	 XF0/iq9/9f0AHVzSSg38wYCikXdsEvzo3eZo5cyk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HhnK085891;
	Sun, 9 Feb 2025 02:17:43 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:42 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciS083866;
	Sun, 9 Feb 2025 02:17:39 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] Add bootph-all to SERDES3 for USB DFU Boot on J721E
Date: Sun, 9 Feb 2025 13:47:31 +0530
Message-ID: <20250209081738.1874749-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_001754_652543_387926DF 
X-CRM114-Status: UNSURE (   7.80  )
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

Hello,

This series is based on linux-next tagged next-20250207.

J721E SoC supports USB DFU Boot via USB0 instance of USB. On both
J721E-EVM - (J721E SoM + J7 Common Processor Board) and
J721E-SK, the USB Type-C interface which is connected to USB0 via
SERDES3 is used for USB DFU boot.

Series adds "bootph-all" tag to the "serdes3_usb_link" device-tree node
which is the USB3 PHY for USB0, thereby enabling USB DFU boot.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j721e-common-proc-board: Add boot phase tag to
    SERDES3
  arm64: dts: ti: k3-j721e-sk: Add boot phase tag to SERDES3

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0


