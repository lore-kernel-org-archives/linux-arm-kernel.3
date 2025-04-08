Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sj/vDMjsgS3JeJqVpVc7Ee+PaOYcv9JfrYRFTbtostM=; b=aiqo6mGtHrqTdyiAJwOJ8FoAgT
	q5dEV+Wrge7VZ09v6EOygseTEIfY7Unx2ZWKa8icN651Xx04Tf60JHXICDeCqcv4ALyKrrxJx9uKT
	XXhtuohxdRNqHoax3N33++iUSvKxt1hCGTPfftWoOTVDBeTQdFSNWL6UAOEvtRDDr7Aqlj+/VKoay
	szLCxpgLneEG1OIns/K6X6kROaQb4raXCUz7JE9XjdYtTcVqmgFcN1yOSYdFM+sy6GphtxVwGtApv
	hsEzNT30sLDVqAAyhvIQNKCh9pkZMisXbbBb/ixiBRUnTHqyUCrmsDFq7+8AxiYXnInQ6eXClq5fi
	0F+BwHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u228T-00000002r4E-0nZ6;
	Tue, 08 Apr 2025 06:08:37 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226g-00000002qi7-2RzG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53866fL91125960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 01:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744092401;
	bh=sj/vDMjsgS3JeJqVpVc7Ee+PaOYcv9JfrYRFTbtostM=;
	h=From:To:CC:Subject:Date;
	b=CFRQYz03j5T9vR0x1RsAeWGiHVVF2hjE+90K9qzcLmcFWnx85SlOKvtihk62svUkq
	 wFPgmgbq/ZM9eEX4KsvyM5BWpR/NAqvbmbl+WkzVsKVQ3Te0VCtQjO+lL/nyiFrk+9
	 rQ4qP4vkexiQFH55Leex3KIcVp6KpVd/bHmnISMQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53866f2e030560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 01:06:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 01:06:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 01:06:40 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53866bvo080076;
	Tue, 8 Apr 2025 01:06:37 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] J722S: Disable WIZ0 and WIZ1 in SoC file
Date: Tue, 8 Apr 2025 11:36:34 +0530
Message-ID: <20250408060636.3413856-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230646_707944_84A2A0BF 
X-CRM114-Status: UNSURE (   9.03  )
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

This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
nodes in the J722S SoC file and enables them in the board files where
they are required along with "serdes0" and "serdes1". There are two
reasons behind this change:
1. To follow the existing convention of disabling nodes in the SoC file
   and enabling them in the board file as required.
2. To address situations where a board file hasn't explicitly disabled
   "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
   as a result of which booting the board displays the following errors:
     wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
     ...
     wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12

Series is based on linux-next tagged next-20250408.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j722s-evm: Enable serdes_wiz0 and serdes_wiz1
  arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.34.1


