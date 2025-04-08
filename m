Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA169C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4i93wF9m6/Pka4RzDhnFmGJ1Adb5uJ6IEyLecKy9PE=; b=WS2cg13mlpfspSbyKLzZm2ceSl
	smiMK2WyPawznXwozAqz0iRFHpr1uIJ9mckMXkIucfq3wYHdfi6rqEdUFaZiWJkIaq96DzdPh/gJe
	DX6A8zoC+Xb3TaWpZVzLF8DPVs2DT2G//2jYePyTSlmhC3BPQnwkXNXRiX83ZDAfMbLl8MzsBRiDU
	2GkKZEWzMBkLkQKETAElvMzQ/RCLb2MCMtYZYb51zVS36R+/1biS8lqk/UN4BRoIUeTVp03NTot1E
	EhVh5U1UKxVP+6QychVBZocBhzEvdra4R6yW2kweO++ARGC3tkgL2R5r1LW5sefMa/+AkQ07xpvuK
	DC9pASbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26lg-00000003n6e-0Xcg;
	Tue, 08 Apr 2025 11:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Jc-00000003h30-0NHl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y4i93wF9m6/Pka4RzDhnFmGJ1Adb5uJ6IEyLecKy9PE=; b=XH1J0pHzvViWxT+GKsiqWEEt3P
	AzpMhh913qfX+W1WzBe4rEd8Qt1JBT0WCw6LfBnk1TnFGt19ZhaARW3cT7I+cpue0FQDYMsM23sZH
	+iZl8DdzsR/TGl6TsIhNllZocIh4XI94/pJhEl28du7tnEzEFfyIkbP+ayzUj2TiEnDGViReuvSCZ
	QMr27lIpzDzWf0fqfEtJ0rJUmxQClQJEmmC4C0MgRylvThB9+gcBlGwsfaw4sz1kKh3nafwkelv5l
	T1u15JF4hTndXY/h7EIjBGPmDE6XRiQqVLcpdQnPmauPvVzGHwKFTJ/m5vQv1G/3Xddlehh7yuwAG
	TRfM+6Ug==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26JY-00000008FV2-2uR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:36:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaBmk1150072
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 05:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744108571;
	bh=y4i93wF9m6/Pka4RzDhnFmGJ1Adb5uJ6IEyLecKy9PE=;
	h=From:To:CC:Subject:Date;
	b=drNdrQ66X9B5u24i0vnfT1PBKEeGh67zXRLujTj6JftMtLn/dj7SSIsylETYvGVxx
	 rcDXnmU2F/5mjtySlmuTyjaZ/3cjw1baVkCyHpo2T8kkU4iE3V16pbztSdkyHq+jlD
	 geHSZKCxLH4GRZ2/xvOK6Lv+rSaPlU6V/mqOC+4k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538AaBkg028449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 05:36:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 05:36:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 05:36:11 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538Aa6T7016171;
	Tue, 8 Apr 2025 05:36:07 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 0/2] J722S: Disable WIZ0 and WIZ1 in SoC file
Date: Tue, 8 Apr 2025 16:06:04 +0530
Message-ID: <20250408103606.3679505-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_113621_054191_5B4C73DE 
X-CRM114-Status: UNSURE (   9.54  )
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

v1 of this series is at:
https://lore.kernel.org/r/20250408060636.3413856-1-s-vadapalli@ti.com/
Changes since v1:
- Added "Fixes" tag and updated commit message accordingly.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
  arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.34.1


