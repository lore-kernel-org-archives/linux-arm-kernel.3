Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C351076381
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEWPVqwEFoPKAbe7qlwq0I9018TRorejG7OhaR4DCXA=; b=TJweAHB38o44zPZLdP56KUgnN4
	K9wyvt8lIsbkWkLlMOp9J5YMoAtJb6/zpuoaXnC81MOBE17FZm1rFFrikoaz8echwcLqjxVb8ERer
	BGoI+ulBwskGr9lHLEVzsZwktAstKVU6ubz52QmoRLfKwfapYNVhlItizgkkKG4DAXvrFOFevgTd9
	lc4AX/3ODtU5QBXisiZsiTKGFLaQWwn9H1UVczERnJi4eKk4MHeAzjh5UqIl21oz2vbYe1v1sQB1V
	MHCVfNy82H9nMYJVcytz2irqOFq/ec+C1hqpPrALjce89VMTt7cBw+YdVKUltjrdZVJmQrJgnqRtd
	35J03WQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zDM-0000000Fpnb-2eoZ;
	Wed, 01 Apr 2026 17:18:48 +0000
Received: from mail-eastus2azon11011065.outbound.protection.outlook.com ([52.101.57.65] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zDK-0000000FpnG-1JRg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oil6Lzay3u9Skx0YzqI2vtjx2oU3hLGFvKY5WRx3NJiurscivKFYiwGdcP25xcfWTisg5lMVBVASKF0glYN6PCPB9vQyZM0OMv+OANd4xPU8tZYzlvSer4FkMQmxRvL1rP3QhTipcj64FAHzyUFC4Hk0rGzfLBFhVSao8AilfFFwdKzL6MPX8lUsa8QeU8NIxGpLgTYmify1zB7/NMAlNGebj30bgPRZexkbBW6EXMGyql7V1KmUXx4lvS+h7UKir1WBQGaE1+hDYpBG6QHKfexskrkr6jjWiGu5HByrLc7/e6jKHQqi2iL7VRpjTsSbqzEJqHvyAHmGwdxGeGOb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEWPVqwEFoPKAbe7qlwq0I9018TRorejG7OhaR4DCXA=;
 b=UFPVMyqZVgms4GXEcf7HpFxeQKi0P4ZX3fE1gyUA4t9oAj6jyI3wUMwOIG2tmOZdV83IaYAYDu5pisXEFwNONraVCq2iaCWKaCRLUa+qDfYl23Ht3o4dbzlokaOVN9YlIvckhMp81KPduBI4ENUA8/nq8oafBDL6VEz45BwlssEHfhDOihC47d00PQxOtqfWzvKUp5nAqWXKEdu/eAw0XPCMwVWEis02LCikY/vHcbvu0/E4xaUjoleqV7h4cGfzEzUCeHiIeKLl9AWCB2qpTxKrr2LUh+8rnE4t9wwP9EcoekwHFCrYLvWgA6Ri+Pmqi2IjNxiuji9VXNfnMjOgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEWPVqwEFoPKAbe7qlwq0I9018TRorejG7OhaR4DCXA=;
 b=oLdlWJGgO2fcYWW9WFeJ5hgZdNVFgNEyobjkBi0/L4mFTle3qQYdHEQ+5LWbWHTGnWk6Yh5UOR8eBtF/yzAZLKA5E7/GSujtObLVoaFTiu/Bz5JoUASNWsUmpjeMrldHczerOmjHVZK6x9V4Ol40PpNb/2eieU6WEMw2+zjsC1s=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by DM4PR10MB6280.namprd10.prod.outlook.com (2603:10b6:8:bb::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 1 Apr 2026 17:18:40 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::34) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 17:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 17:18:40 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 12:18:39 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 12:18:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 12:18:39 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631HIauw481052;
	Wed, 1 Apr 2026 12:18:37 -0500
Message-ID: <61fbb6fa-f03b-4f52-ad51-1597a247d73a@ti.com>
Date: Wed, 1 Apr 2026 22:48:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: defconfig: TI K3 updates for v7.1
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Nishanth
 Menon" <nm@ti.com>
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|DM4PR10MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: e8067239-4d71-477e-b423-08de9012b7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: HEWVoXqVyfRid6lOCZIQgOKqCzPOf5emx+I+2/oCr1GaKu3jUhiYkDKwHgL8NhaPsnf2y7JMxsYOq9GwQ/ZxOWmmWAA/LwV5xAFcQk/nrRf05KsOLgxm9YMO8KdzeyhfY7nactumQWQmINy+TnXuaDYNRRrdDy9r7mDmBcq3dX0YTQIxIJWXucSL/cW0dL4J36nJfXDhm3vPziSWBKjgun1pPEC9e+z0I6DxHw87w21tRKbDdtv2yfKcoZnbDppaQt8LJs1Wsk1OPoRRnaWx9yifjj6t4uTBLwu3iQszmTGrNFbUttTH4rcUFd+sEZXtAP0B0HZk2q4Xd0EeIdGK7SE52wBawUms5ummWWRCjvOSOQu9NylWdh9FODGA1Z5uaAcM4k7bXoOgFG6XH8Tb3I3wKgnI7fK3LnBJY7sS6SLlFp1DyZaZcyS2CS95xs0Kr8hmVePqi836nXclFGHbKZ+sBL363aEp/20Oa99GqyZt1JDsaTLSSDZ/rSlTTNHJK+KxuchMBublb3w6WwcWsrerhrWGNUMP+ZEm0vMYZNFuKtdI3ol1XLBezpqwFZYdvT8/PiCDXb9O7WSc1jOk0G7GL5eBWRcroS+WZnQbhOCakfcCwWSWQTNNOVBNFIkQR4cmX3eUwTRhOnLc6+5aRjKxOGFsliyHtL9wDJykky/iBUhlSmMMrJj9S7wBCHASzMHMqDFnfCx5ixLGaMsSCfa0CF9ZGxACu+PEkbhBZLIogLJyWppd6IuEMboofPPtftSCOZnhvkBQlAuAUAu1Lg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 89KW8Ug3wlMh5qX1U6OksD5WmsOGD3X+p/yLXC+4JGWN/ZdKsCC5cUCwMtBFJAy4CgTlxqdVwVsMbXF0NxDcjKVqJep5pDy8oHtvBeKD+Sfzhtf1P4JYBNL12zfX4oQK9F31jt+thjquMccFiS+tHZXtZZg60DfgVvYAQXClOkx9/gB92rvXU03qkxYNk5DMOtghyiIokwFyOseWhJlQO4cTw56L5H3cX6y52lH1x9hYgFNSgthLHzLGijh0WsEoNeesUWgL2Tio9iin7qkfNyWn2/0Mpg7XMraP8Qv7wxW3rT1KNue+VNs3gKYnyFm/WHqjA4w3NKmVcGHfjywLH7UCfAW8b0RHw7DGK1XHeVwHpSSo2iN99yYsaybiKc7S3kTb1+Qgr24K77xVTF+DkXv4TD4vH570OJPNOieF0LEVzqNKqNHnZuY+5RhoiFqo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 17:18:40.2362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8067239-4d71-477e-b423-08de9012b7fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_101846_382728_984F90A2 
X-CRM114-Status: UNSURE (   7.12  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v7.1

for you to fetch changes up to 079a2e18b776f391d6b16b8710af79976fba14aa:

  arm64: defconfig: Enable DP83TG720 PHY driver (2026-03-29 19:51:25 +0530)

----------------------------------------------------------------
TI K3 defconfig updates for v7.1

Generic Fixes/Cleanups:
- Remove SENSORS_SA67MCU as the driver is dropped

Board Specific Features and Fixes:
AM69:
- Enable configurations for Toradex Aquila AM69

AM64 / AM62:
- Enable DP83TG720 PHY driver

----------------------------------------------------------------
Francesco Dolcini (1):
      arm64: defconfig: Enable configurations for Toradex Aquila AM69

Meghana Malladi (1):
      arm64: defconfig: Enable DP83TG720 PHY driver

Michael Walle (1):
      arm64: defconfig: remove SENSORS_SA67MCU

 arch/arm64/configs/defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

