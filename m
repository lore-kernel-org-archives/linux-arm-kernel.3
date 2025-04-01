Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P69NXiJFBn0YyMxukcSeHdHcWpvgS8s4dKJpRN1Hd40=; b=JlH+TEvX8a0FypNIaTH2QFyXi5
	44grCTdAUillNlrpeK9pT4K5YCYjrtjWuiuBshyZzUHbK/vx1eY3aAi3KPmB4l7PIP++v09Y5DraA
	cxk1UBIck34JbmzPDpxAwAHrs4J9n2fsAanSERcXcNcpAdFJjdqQuhCqpgm+NCoBBrZjYmVTQ0sGw
	8VHxH1XbYx8gnw1eb+IJ3KNzPvCKFIPqm3HkuhmScxWi13p/KyIHH+Prc+IdgP4KJQ1OIRdv160qV
	EgQHmiPg6hzB6GcVEQs1nneJnp6z9fIYRXiYpfD+85dHS4Qt874YlNGQvoq5z4guFrGzNtmHE+e6a
	hF7kUpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza1R-00000002p9P-1fH9;
	Tue, 01 Apr 2025 11:43:13 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZzb-00000002oha-4AqL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:41:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf2Jd3651996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 06:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507662;
	bh=P69NXiJFBn0YyMxukcSeHdHcWpvgS8s4dKJpRN1Hd40=;
	h=From:To:CC:Subject:Date;
	b=YZkRXg9H+2TBuV5NppnDcqm/Rs7LbgNxi4FdwzWdkETCwThaDI7Ht+IOJ3Pr1rf1b
	 vGIqgldD3VSKoSxW5slX3TzUFodx9HkTw3OJjamsMYjdvF9DTDocylNgpjbaYjeyOo
	 Wj0PpwgCDwXm0E/yc5PrKtcrh+toaEAAlUHDxfvE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf2ZM065228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 06:41:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:02 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm0099961;
	Tue, 1 Apr 2025 06:40:58 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 0/5] Fix dtbs_check warnings in CSI overlays
Date: Tue, 1 Apr 2025 17:10:48 +0530
Message-ID: <20250401114053.229534-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_044120_231342_0BCCA52B 
X-CRM114-Status: UNSURE (   9.50  )
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

There are a bunch of new warnings generated using CONFIG_OF_ALL_DTBS.
This configuration applies DTB and overlay together to generate test DTBs,
which are then validated using dtbs_check.

This patch series fixes all warnings related to sensor overlays on
jacinto platforms and a few minor warnings on sitara as well.

To fix some of the warnings, missing power regulator nodes are added on
the J721E-SK and the regulator hierarchy on the AM68-SK is corrected.

IMX219 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/b13caae87c0c148b5643df5baba0d90c
OV5640 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/7801f74d28ed5895a15049ce9f0fbe60

Yemike Abhilash Chandra (5):
  arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
  arm64: dts: ti: am68-sk: Fix power regulator hierarchy
  arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings in IMX219 overlay
  arm64: dts: ti: k3-am62x: Fix a few minor dtbs_check warnings in
    IMX219 overlay
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


