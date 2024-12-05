Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8088E7717A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xeByAKCLyISHzQ6+LEbPiuQutggH8J/FE/3qIh+Q7zQ=; b=tfS6umEIQPVDmWnQuPg8cjSQyc
	jEgwCnsAFhDxHeggxt+wkaBf7IiBa12LbFiZQ0nBm6Y9L7eAuM6ud9eS+BCHV8Z521Zd5H7FmP+mE
	htmHG+73GXyoW3FGx/opK21mDealHtC4K+sDT5L0J22fVHIrMsIg6r5G+40fZTcOSCEIlHM2+vrL1
	szQFUavl8GRifT5F/XsYzF5vm6e/jXCSElkjpkAAHwHeqDqPK0alQcCjMCsQvLKv34xNPgUrS4A4N
	+LPr0IO2CkUdV0cgzel7wwmGoEW/mJhUWPoh4XcY0rscsHTc1LCniG999sAlfBVS9YLTeAGz49YI0
	55LqUHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqv-0000000GKWC-00bp;
	Thu, 05 Dec 2024 14:29:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAYC-0000000FrdP-1NGj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:01:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5C1dFL1943300
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Dec 2024 06:01:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733400099;
	bh=xeByAKCLyISHzQ6+LEbPiuQutggH8J/FE/3qIh+Q7zQ=;
	h=From:To:CC:Subject:Date;
	b=BXzuxkGQtLI1O57Qfafs0ogNMBmIB46nW1okrwq+409gtcfhi+Qm4jwd9aHFHddj8
	 0hnPyD6Zyi/yY76gsZE/lP47ChipGK4F5dkrUWjhCeY7/HcJtX0bGyNrIG46g9zQU9
	 +fWG7t8FkCNWHmfie+xEXBC0/2DESAlT/Spgt7Hk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5C1d1u062603;
	Thu, 5 Dec 2024 06:01:39 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 06:01:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 06:01:38 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5C1Zp7018608;
	Thu, 5 Dec 2024 06:01:35 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 0/2] Add Deep Sleep pinmux macros for TI's K3 SoCs
Date: Thu, 5 Dec 2024 17:31:27 +0530
Message-ID: <20241205120134.754664-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_040144_408948_BF99742D 
X-CRM114-Status: UNSURE (   9.21  )
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

This series introduces deep sleep macros which are common to TI's K3
SoCs and can be used to configure the behavior of SoC pins during Deep
Sleep mode. Additionally, support for SoC wakeup with USB1 on AM62x
based SoCs is added with the help of the newly introduced deep sleep
macros.

v1:
https://lore.kernel.org/r/20241112115650.988943-1-s-vadapalli@ti.com
Changes since v1:
- Rebased on next-20241204.

Series is based on linux-next tagged next-20241204.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
  arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1
    wakeup

 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h           | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.43.0


