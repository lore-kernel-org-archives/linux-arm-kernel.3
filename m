Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41162C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z8BxS1ovMFK/OAlihLVLKauzGGuhuJxVTnxHmVbPyG0=; b=eZk7vCBu6WCVVq5sMCt/xYmtWe
	9+PazxKb3HNFfT5XqrhIUi3hMM5mpqObMcIjN3kE0QX8JxQbKyVbexbNPcp0vQ78rL/UxM/+bp5Ld
	V2y28w9/3dHdY9hi++VEDGiQvHEHvWf1qZGuo++41938eC3Wn48zFM8n3wKItbw7K259GELakxNDI
	Sh/Z4XHh9Pv8ecQnEuEtDG8o6/uhpF64ZJxL6MRjoufQxjWZNtX/p/pptsvIJ17/gxc8OmuLd5nE9
	royGDgRqgUbGgVszNVsNPsiQgu7Ap/s0O1ooII6gpEdbfrwDls39e7ChMEnJLssxistYpJr29C7h1
	oqzZd+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taa8k-0000000ABwc-46yd;
	Wed, 22 Jan 2025 12:47:26 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa40-0000000AAzu-47ZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:42:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCgROE990400
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 06:42:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737549747;
	bh=Z8BxS1ovMFK/OAlihLVLKauzGGuhuJxVTnxHmVbPyG0=;
	h=From:To:CC:Subject:Date;
	b=dtI3npWW01XycrGuIRsJ6/OuPd0r8HkyIZ24AFBimN4sTkRnubHSV2iTKkPmAyTMo
	 tcuJHjBOGxTTsUcUTNISlg2MJXE1Apr+goZCkK2Md/ibTwSSJP1OJUR0dQX6cSWRrG
	 1N31jNtVtdYj4XLNhfDquKdDyWrkBWYtjXRNUmy8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCgR6v020940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 06:42:27 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 06:42:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 06:42:27 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MCgN23007253;
	Wed, 22 Jan 2025 06:42:24 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] Add boot phase tag to USB0 on AM62A7-SK and AM62P5-SK
Date: Wed, 22 Jan 2025 18:11:47 +0530
Message-ID: <20250122124223.1118789-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044233_062234_D870753E 
X-CRM114-Status: GOOD (  11.12  )
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

This series adds the boot phase tag "bootph-all" to the device-tree node
for USB0 on AM62A7-SK and AM62P5-SK boards. USB0 instance of USB on the
AM62Ax and AM62Px SoCs which the aforementioned boards are based on, can
be used for USB DFU boot. Since USB0 has to be enabled at all stages of
the boot process when booting via USB DFU, the "bootph-all" tag is added
in the USB0 node of the respective board files.

Series is based on linux-next tagged next-20250122.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-am62a7-sk: Add boot phase tag for USB0
  arm64: dts: ti: k3-am62p5-sk: Add boot phase tag for USB0

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0


