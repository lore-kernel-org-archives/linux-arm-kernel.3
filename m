Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54551CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+V+t5Qcu4oo0uZHpVh5RjBz4WkY7IKdvDOVT53rvnWI=; b=YAzRF8WrSElXNfYLQ0bXUa+ZDg
	wOFoLhDdeOQfds8EvC52IksaSRydWkuE79jlbDb+/DGKGGel9IeusD2bpjEjbV+v16giDaK8kyiLo
	QQsPaL2dqbOqzpVVj168yJYYxTjN11QgMVjWeTEUUdKMdqPeq8sRusHdazopoYwt+YFJJw3lBchgu
	MMjEWre5tgPtjT6pNRBYWYmIBnkyhjv8L83QeeRAoISSBQGalLdc+vCTitTIacxqsLltj3kcyK5lk
	QHqiNCoQ4KoiuOkvErnjpGfLSot49yELsCAtMxmbL9O6qOhLpw0iUp1RtFPlSxOf2q5VWi6TM8XLQ
	k1vQAB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g79-000000077Cp-34Ek;
	Fri, 17 Oct 2025 08:47:07 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g76-000000077CV-3w4i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:47:06 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59H8kxSC2320864;
	Fri, 17 Oct 2025 03:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760690819;
	bh=+V+t5Qcu4oo0uZHpVh5RjBz4WkY7IKdvDOVT53rvnWI=;
	h=From:To:CC:Subject:Date;
	b=j3F9NO9/kak6w5gAMHn5MRai9CsA0HQzoDsIh/2upp2jmNEl5lkGFGJYty5fiPqAc
	 UhsdFELxavfMn//MvO+fqqBExDIT7SVALFTsIkrWadaw9qXTohpJGkdTLzUt2cdFMH
	 UaX1kJIZ4GcJNjCvVKB155DS8jJ6NHvWFVmuxzDc=
Received: from DLEE201.ent.ti.com (dlee201.ent.ti.com [157.170.170.76])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59H8kx4c1870929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 03:46:59 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 03:46:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 03:46:58 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.231.157])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59H8ktET1019203;
	Fri, 17 Oct 2025 03:46:55 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] arm64: dts: ti: Add bootph-all tags for PCIe boot support on J784S4 SoC
Date: Fri, 17 Oct 2025 14:16:51 +0530
Message-ID: <20251017084654.2929945-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_014705_084949_CB6E963E 
X-CRM114-Status: UNSURE (   8.43  )
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

J784S4 SoC uses its PCIe1 instance as part of the PCIe boot process. This
series adds the necessary "bootph-all" boot phase tags to all the device tree
nodes that need to be functional at all stages of the PCIe boot process.

This series is based on commit
13863a59e410 (tag: next-20251014) Add linux-next specific files for 20251014

Hrushikesh Salunke (3):
  arm64: dts: ti: k3-j784s4-evm-pcie0-pcie1-ep: Add boot phase tag to
    "pcie1_ep"
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to
    SERDES0
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to
    "pcie1_ctrl"

 .../boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtso      |  1 +
 .../arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 10 ++++++++++
 2 files changed, 11 insertions(+)

-- 
2.34.1


