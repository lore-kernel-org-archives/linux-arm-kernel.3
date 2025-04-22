Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5A7C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VD3GYSIMc1uNyuCfaxWRQVAVN5cwNV7T99X8AnTXs+Y=; b=HiuaYY+dAyVLxRem3W1i5yVHL6
	3WuabxFSBLbeglJkPPJu5fWCgZ4bxwBOnRJQLGcedzAmuiEgoEixshXzYt2E8+78S8V8IQgzq3Gz1
	iwLmH0s44Vja82NF9HqNaaYsHLDQrFwwUHggydtQQXeh3ojlRmaeFzbHUQCu9MBwLujGiKPzjq8lH
	PNzNkn5I5FputCXILiPFt7DKGXZYuLeWIRLvWhFiEwwTBi/NK8X0GTOcsbNGU43FhkwqXNCiO/zaT
	oysHw9e1h0VMHpIanN2T1ReiGMm9uTzcBXO1uOLmO+DBu5laPKXXA3jHcHQjsjFztS2QHtBENTGEO
	Symd85Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E4T-00000007Ndd-1jHf;
	Tue, 22 Apr 2025 13:53:57 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cnc-000000077k0-22HW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:32:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWNaD1209452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325144;
	bh=VD3GYSIMc1uNyuCfaxWRQVAVN5cwNV7T99X8AnTXs+Y=;
	h=From:To:CC:Subject:Date;
	b=xtvuIKG1//K7fgM6BsFtji20vR+Auy99+my2CEufgqApdNrK7gksYNoJvJxR+cv3a
	 N24i5Smyeg/JvqHvm4GQG0PEf5H+al8yqbOUCu3S3kN1WaFPsxn4HP3eIC5rILGui4
	 /z+RKluueh2mv5X9fCtirOXl8cVYdt2YeyvseBDE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWN0T017932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:32:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:32:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:32:23 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCWIKt117965;
	Tue, 22 Apr 2025 07:32:19 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 0/2] J784S4/J742S2: Enable ACSPCIE0 output for PCIe1
Date: Tue, 22 Apr 2025 18:02:16 +0530
Message-ID: <20250422123218.3788223-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_053228_610964_13398919 
X-CRM114-Status: GOOD (  12.74  )
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

This series enables the reference clock output from the ACSPCIE0 module
to the PCIe Connector corresponding to the PCIe1 instance of PCIe on
J784S4-EVM and J742S2-EVM.

Series is based on linux-next tagged next-20250417.

The previous versions of this series were a single patch. Based on the
feedback received on previous versions, the SoC and Board support has
been split in order to allow reuse for other Boards based on the same
SoC.

v2 patch:
https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
Changes since v2 patch:
- The SoC and board changes have been split across:
  k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
  respectively.

v1 patch:
https://lore.kernel.org/r/20240715123301.1184833-1-s-vadapalli@ti.com/
Changes since v1 patch:
- Rebased patch on linux-next tagged next-20241209.
- Moved changes from "k3-j784s4-main.dtsi" to its equivalent now which
  is "k3-j784s4-j742s2-main-common.dtsi" since PCIe1 is common to both
  J742S2 and J784S4.
- Renamed "acspcie0-proxy-ctrl" to "clock-controller" to follow generic
  node naming convention.
- Added "ti,syscon-acspcie-proxy-ctrl" property at the end of the node
  since vendor specific properties should be placed at the end.

Logs validating that an NVMe SSD connected to the PCIe Connector on
J784S4-EVM receives the reference clock from the ACSPCIE0 module and is
therefore enumerated successfully:
https://gist.github.com/Siddharth-Vadapalli-at-TI/905bceb2b6c0e1fc6b80cd2ddaf5bd0e

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j784s4-j742s2-main-common: add ACSPCIE0 node
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output
    for PCIe1

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
 2 files changed, 11 insertions(+)

-- 
2.34.1


