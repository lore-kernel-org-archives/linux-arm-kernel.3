Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA4EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ctS2IsIxQtxk4XIYF0HsMS9YZmREfXrPM1zm5+YRlrs=; b=sj0Qf3V2EynNV59oUEfPMwtroU
	awZGjmRSpT2AYSMeK7ETbwjplKHZHaATSw+JOb3L9jjle1UCP3M9/UGl+UrN2JtEJhPSmVT95Px8O
	vzfMS5RG+mWht6U9THF/JdN7PwwX9K5ah46PfYnaV0rHfFsOCXdH6vH7VcYsbBzPJaT3Bm6bKeuhL
	gZeGsCzAL2LmsNGK2n18Ht4NJa3AGNtHIJbgDiz+fWayMyMzb1E/798Nb+CpifG6K+uJ5B9vvPBu9
	wqQ9u4g79oC57fp1+llRBXjt0XkMLqeXg92k4kMZrBiX3fZUPUVXOrD+xUUldxMMqnjTX+Dbd5oH3
	rnO8QVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRwZ-00000003WkM-46n5;
	Thu, 31 Jul 2025 11:59:31 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhRty-00000003WTT-3X4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 11:56:52 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56VBuitk3437181;
	Thu, 31 Jul 2025 06:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753963004;
	bh=ctS2IsIxQtxk4XIYF0HsMS9YZmREfXrPM1zm5+YRlrs=;
	h=From:To:CC:Subject:Date;
	b=fqE5vUhsL9xqx7rB7V9LEHJAyv0sTk2/w9bXZEjppS3pMwW8RdLH8j9shnP1hkV3o
	 /A+r17eWdStDO1xx6zBRvAvupbQO7jgBmy3Bo7ReG4OHSpGl+qdvEUjBOlnjTIK2wP
	 9Ndas5gBH/2F3gaViGAmQnzY6Ny0IP6hLtmd7BIg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56VBuiMG3301194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 06:56:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 06:56:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 06:56:43 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56VBudQO2861468;
	Thu, 31 Jul 2025 06:56:40 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH 0/3] Remove unused bits from dts and add support for remaining pinctrl macros 
Date: Thu, 31 Jul 2025 17:26:28 +0530
Message-ID: <20250731115631.3263798-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_045651_031430_FDEDCE87 
X-CRM114-Status: UNSURE (   9.10  )
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

This patch series cleans up the dts files to remove the pin control deep 
sleep configuration that does not take effect in hardware.
This series also adds the remaining macros in the pin control file 
supported by SoC so that any configuration can be used as per requirement 
in dts files.

Akashdeep Kaur (3):
  arm64: dts: ti: k3-am62p5-sk: Remove the unused config from
    USB1_DRVVBUS
  arm64: dts: ti: k3-am62x-sk-common: Remove the unused config from
    USB1_DRVVBUS
  arm64: dts: ti: k3-pinctrl: Add the remaining macros

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  2 +-
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h           | 66 +++++++++++++++----
 3 files changed, 56 insertions(+), 14 deletions(-)

-- 
2.34.1


