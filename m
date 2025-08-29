Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A802C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSbzDEs4DoD1Kv6Y2ZtI25mfCIzDcnm2Cf5crMrd5eA=; b=MflI4FIsa6hQX/RJTAvonDnYVW
	h6cbjbU9yLvlRWkGpK3NGFyp/kUs8Hna2O1+/NfYtVGWiRmrqhR+PVwEFiVMUzjMyJEyPsCNUw9Ar
	rTbyZ4nEj1g7HUVaZSFYDNEIuPSRVaLD+bJipMLolt2YCphcJ9B2lSGit2R7GKJC9uV1eDkdeQ6Wr
	lgyuJooDzUFluWncWp61gVRYdRB9JFAoGTWowiIBkGLwUSpuavse51W8iUFJ+2bwnVUU7fauEkAMj
	WGBj/dYrdeXAtHPBAP498d+dy6HkNmhWsQrgKRW6rZHoCRhVDMvJMWkjjortXBaYb39xr/xcId+Ad
	bAdZKczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru3v-00000004seP-3Tqs;
	Fri, 29 Aug 2025 08:02:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtpG-00000004oTc-2mO6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:47:11 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T7l6Ok1704553;
	Fri, 29 Aug 2025 02:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756453626;
	bh=SSbzDEs4DoD1Kv6Y2ZtI25mfCIzDcnm2Cf5crMrd5eA=;
	h=From:To:CC:Subject:Date;
	b=GYB4SZcUazgWqd1t1R/PuJRUixUdaNPUbpfrY+0F3dvgHVigeVPdJJ/u23lvb8qj5
	 E+JfK+doEmqqK8HnluFuJ4I36vWHjLD1rRdP8repxQ/MhKbm+SYqMGA12uzLrnNR4p
	 3YRgx5htqXU2J8gl4EWr/uhHlcKVuowe4Tj50chE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T7l5C2384084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 02:47:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 02:47:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 02:47:05 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T7l1fP1717407;
	Fri, 29 Aug 2025 02:47:02 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>
Subject: [PATCH 0/3] arm64: dts: ti: Add bootph-all tag to USB PHY controllers
Date: Fri, 29 Aug 2025 13:16:57 +0530
Message-ID: <20250829074700.1531562-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_004710_813928_D2B3C118 
X-CRM114-Status: UNSURE (   8.56  )
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

This patch series adds the bootph-all property to USB0 PHY controller 
nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S). 

The bootph-all tag ensures that these USB PHY controller nodes are 
available during all boot phases, which is required for USB DFU 
(Device Firmware Upgrade) boot functionality.

This series is based on commit:
8cd53fb40a30 Add linux-next specific files for 20250828

Hrushikesh Salunke (3):
  arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add bootph-all tag to
    usb0-phy-ctrl node
  arm64: dts: ti: k3-am62-wakeup: Add bootph-all tag to usb0-phy-ctrl
    node
  arm64: dts: ti: k3-am62a-wakeup: Add bootph-all tag to usb0-phy-ctrl
    node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi               | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


