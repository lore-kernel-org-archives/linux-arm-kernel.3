Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651DEFCC9B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 05:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RamBF01yXqMY5BetOf1iIqqKwFOFswVOHDrfq4/JpuE=; b=tDiAydV++keK03uVYIxXWcKOlv
	RaC8QK5JnAvQGqwX15Xi1NMumtq2OVIQQFSASXABtJyVPTGZPYX/4c9J8f+iUGr166ZUPd5hyGmC2
	TRHIXvwLz8GduYP4Wyr3tisTD7keCPym+Bn9ccMs+e7lI5hANi3cS79uQbaXdQ4HaFX/V6arNqVph
	LP+hsjSeYaQyjaiOkTn2SqgdK6wM2ZDzR7pPe7zMNSBtJJa35UJQjCsDJ171MEf/4JiLASNkHq0Gn
	oWMeBFVAATtLCXQlS8YM0UpAhy+xCfKjr7j9r9Fn9NVa8dD8DDJVr6YQQrw56GUDeHRwdZ/K2izaN
	OQgs2S6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CHp-0000000AoDX-1NsZ;
	Wed, 11 Mar 2026 05:39:13 +0000
Received: from mail-southcentralusazon11011032.outbound.protection.outlook.com ([40.93.194.32] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0CHl-0000000AoCA-2qxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 05:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQirerLAx96nCfwFqHcG2kBD5TjXlZMv/vIpOY/8FB4iF2bg/5VEzG61CHvJtBY33lyiSgwJhOqcXdH/HOfJnjwwJFv6QYGD3ctFm8j8BFwpfd7nskWR+btxIGHBjhSac3foqJPyRiVK6/5AFV+XSDpWPK44V4oeUapyXkH9FsXoVoU3eNXPajKnpSBf1Hd3YzaPuuNnsI7OG3ysf01s0mFigi4Ik4lMSYuMRUw7VMKnTE6AC9Rq1GQ0W4Ixut9fkaNk+VbngsoV36DO3DrOtfaM5+sY+regOHeSwp5o+WL7/9aEQPqZgrwzNVh3N5WNJDIYO++QVVulSG7zVZjLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RamBF01yXqMY5BetOf1iIqqKwFOFswVOHDrfq4/JpuE=;
 b=EK92ZhrZaloYF0K1t+19RbzB895ilecLX5dIPAaihVJI1ixQbXguWmorn6XdP58xnSY3OacJiSTGI81v/rKiZb5TyU8FGfrFfDnbsYnP9Pjb5XTzweDkS8ka03qZ/TIXS56M4cYHEM3oaq4r/Qw4zxEjZS3nmWsMjwJMIWQ/ajDlgEWP3PXoEW3vU7JJkRyXZy+myVFEIjG2cEQLnLZUYCc+0kU61QJqwEH1P7/K6fnGwV+fNBPNNcLAK0agtWA+hlkbKTG6jjy+Ij7eDbcxeUMqN8S0/AF9L2+r9RSG57RUzWtIFUxeXhsvY3yz+zEI76xZSb9EJN8thETX+MIFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RamBF01yXqMY5BetOf1iIqqKwFOFswVOHDrfq4/JpuE=;
 b=wiymi2mjnLmO1s9VG091Dk0Mv0VQExfkn3SqKX+rdXSSyYEtOFpVqNLoOJOSJDqPaNPRatIt1Y0afIC1DxRAi4WL6tUu2gxRBFxRlGQ35MVsoqAW3t7Ya1O6nrzgkUlmaJM0tnt2QRy9pPyKD9nA666c9VN5MkWbvpf/8RVir1k=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by MN2PR10MB4366.namprd10.prod.outlook.com (2603:10b6:208:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Wed, 11 Mar
 2026 05:39:04 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::57) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 05:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 05:39:03 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 00:39:03 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 00:39:02 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 00:39:02 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B5d2mj4179354;
	Wed, 11 Mar 2026 00:39:02 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62B5d1Yd028451;
	Wed, 11 Mar 2026 00:39:02 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>,
	<danishanwar@ti.com>, <m-malladi@ti.com>
Subject: [PATCH v3 0/2] Add ICSSG0 dual EMAC support for AM642 EVM
Date: Wed, 11 Mar 2026 11:08:50 +0530
Message-ID: <20260311053852.1034244-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|MN2PR10MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2684f002-ff60-4306-d63c-08de7f308155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ev1A1L7J3tTPhIpwNklmzur0wyns+OBz3/Flz8Xv1a1JkvcBs97IjDelQlu7U+lbQHHhwFJtICy/ao1QKlXphr+x8WZxD/LDJLtkTo/+Atxp6y9/5EmUwt1PM0cp3AmJ7e+90lnM+kvFrNZdumjp3ob6ggwnD3HtmQxT5GKFXevKsnSuvmDkK2UpnLxByv3ktWRx6QBKoikD+t1R2JmcGd+ftc5aS1QIfUzjA49ALFiCkMhS3rvAWzuBCbst7Wac/LziLOhTm873lvit/TF+5AvLpEFUmLaS5vxgvFSoaO29fGeR22pkLLaiRiCfQKJyWsXZOVkmU4h2ZiumLxSlluF0KUPoEyO/51D8xEFt4p12EJ+IHhD3nQck0nUuQa375dRCdElr4lvZFw6KcmiUQAxXUaSatgYWk4/fchbA0X26WnKnP+fQNjlfc+58eFUY7PM+6guR+368B1VFmlmoe0Bd6TRo2jH2KlCU0zVieVpYfXXQ76Wm3cYooh8gMVd3Zl/N9tqtBnmyQnlf3YHYIjB7r9qqVMH1LEb+vgwJhzba5ICrsYteq7zK+Zf8IHfSs91QMYDvvZ7FQzztAML4B5ZLugPW9vwiMx/UQiE2KHVxdM7DA7sf+DhMqov1ZvqdSWiJVeg3MShPFv4y0qghMjB2Shz8hQ2tc0hvGzaS1J86+HnbpR4nk4rlNXgUbpV2r/lC7QMgklpGwLZS+bTx2rrcWEmJ4ky8/zXHmsYO0uI=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OrNvzw9H5s6+aT1kTPrCPJyCJiy/6hRq6+Mq2QvrJhwR3khXPxy9qQqsL2qxDuLVG1Tdqf9fl5OYUdWvlj2hTi7Rj5DjJam7Y5NWITmoGE9AgpNsoJYpm92ayUk4Kv45dD6e7tryiOfBdV40mZrN1Tf3/Zb2h0bc4DRFDmDpW1EgD3TQRFUfZOZam38xIELcjviOiKFW9nEO5HTXIeVVWxAlAgaSeI02a4BPH2eDsPXWg7qki854vIfOCBRZAc4CGUqBqOnUTNLP8hbsZACMGSPqbu/UGJXa/TAFmodGQ+1WooLePwQimXNLVNGEoseMwvX1eYKs9Cs7+7c8MakB0W0JP/XAsVT/UYRoXT1wv86cLnkGjS8oWIRK2jrsJ5nSoihXuVbOSfU0lZ/sVdEeQg3IG9pmGWNwi8p+0fZ+PKEdfrcm1NVVo+wB28NBX88h
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:39:03.7012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2684f002-ff60-4306-d63c-08de7f308155
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_223909_725402_02CCB69B 
X-CRM114-Status: GOOD (  10.47  )
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

This series adds device tree overlay support for enabling ICSSG0 dual EMAC
on the AM642 EVM, along with the necessary PHY driver configuration.

The overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
dual EMAC mode and can be combined with the existing ICSSG1 overlay to
enable all four ICSSG interfaces if needed.

The series also enables the DP83TG720 PHY driver required for the
DP83TG720-IND-SPE-EVM daughter card used with the ICSSG0 interface.

v2: https://lore.kernel.org/all/20260228113203.498839-1-m-malladi@ti.com/
logs: https://gist.github.com/MeghanaMalladiTI/20e9e661c3e1075694097bc02f5a3916

Meghana Malladi (2):
  arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
  arm64: defconfig: Enable DP83TG720 PHY driver

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-am642-evm-icssg0.dtso      | 168 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 3 files changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso


base-commit: 0bcac7b11262557c990da1ac564d45777eb6b005
-- 
2.43.0


