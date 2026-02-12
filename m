Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB503EEA84B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFNqVl627KbDVB2bXXBClx+3peaRi9R3ur/yH/oEI6c=; b=38ZKYnxLA+jYUdOPu7k5ZaNgZT
	L65y/0v/IvTnzyO24UqH3NbehKTloXTnVVk0l19e5QCD73rON1QlRPVxSFhbcRF4zctoqToID+7Sr
	2yYfTDenbfuTyQu5W52dtQHJEY/kK+6LmJcoipk/VeCHDUq3sUXvLs0bfhblvbN9sZ56v4M1bBXQU
	HlFiGfZJ5nSRuajshRZTFSqW8+QPkmFyP9NfYcvttkjCE+nJi+EN2GzYxlJIwLitwBeJCdAFFzmPe
	27sHoF+uWlBCZKmXq2TijIgst7Kdbs1aodC9JgJ4tOk7nMMSO3zwD2U3oY1O2hIUKccjBlgUdKPhT
	1k8iio/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeV-00000002XEe-31HK;
	Thu, 12 Feb 2026 18:42:59 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbeS-00000002XDI-1ZWx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI6JZ6EZ/Ek+7TQ1cJ9t4FsKlH7hPSfZpI0kEOn+HzT1khbMyXflolKFXbYQTfElmnWmOAZ7xdlVLMv69NV69cEi39eO6e/fpC9EAHw4bfTQ0KDFnzP8XSWBbelI6Wu8zTJZOrZcNwta998p9+tzk3tb2LJTjvtQcsGw9cCbe1SQJTEhmxCZwlYDDYR5dozAUoJqJmRGpbNsEuKC3sTxuJ8kKvZVTFzvWnFgISCydW/USN4etIcrVkVW+BjXiDCUzyVPJKS5JrI0Hhyop4iIr9ZwudlyVxlIC+/Gk3pMVdyEnZH/Fa3G+R+elQ6sOvzcDRBkBUdmHDPfgPQ2tVjdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFNqVl627KbDVB2bXXBClx+3peaRi9R3ur/yH/oEI6c=;
 b=ORHXlWFynUWcjzDvZ/xqh1kXa57wtbB4l2G661MWzKmbkrcey0DNyMxFMCKqRRAIs2gEYP/gdPoZmjx2q4x2cNRbYHGuvbndkuOA1o0idhh/AEcXdBlSDhZ5T+jv1sT15YhfeXT3/NSXrh/P3K+a4Ofmw6qX8rOtb/FSt0qpyFdgMFdquoN1tmmTSRvCom8u3/hAdXCZ/kriJcqcsCPvj5TVatj5jJ6LRjE0EMVcIOsJkcCFKpAWBDCnyxA9Cq9NFeO8sv5pOB94/JGS7Xo4ewNv6iDBw/MPAmBiBNF9e0ZTMdYjOuiTueqk0YOpo9vICTKYXumpnR4vFkSHB3MPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFNqVl627KbDVB2bXXBClx+3peaRi9R3ur/yH/oEI6c=;
 b=uCgadDDEMCIZtim5Nj9N3KGmWkTLTGPWhbSXm/3e22361yTk2xzDKCWIfUnGqXmvkT6DoqBbzIqZZ/IyxChS0DqSbTCGSggDZYL2NRA85f1NCqaOeX2KfUvIunguRKaLy4m1iffl/qSquPicin21QT56jwKUBfscdzYyEQ8LOj4=
Received: from CH0PR04CA0051.namprd04.prod.outlook.com (2603:10b6:610:77::26)
 by SN4PR10MB5590.namprd10.prod.outlook.com (2603:10b6:806:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:42:49 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::9) by CH0PR04CA0051.outlook.office365.com
 (2603:10b6:610:77::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend
 Transport; Thu, 12 Feb 2026 18:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:42:49 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 12:42:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 12:42:46 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CIgku24002204;
	Thu, 12 Feb 2026 12:42:46 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 0/4] Fix MMC pin pull configurations
Date: Thu, 12 Feb 2026 12:42:42 -0600
Message-ID: <20260212184246.2316659-1-jm@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SN4PR10MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: d749a848-e95b-4436-0411-08de6a6685c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?03WKoqYXOkGEJ0bvc/qaUu0hxKkVVSMa/tJ8NZwesGv5TV3sJLzozTfEf0tq?=
 =?us-ascii?Q?DU1ZYO0Vdx7eTusw45eQSw937G1kXs79eEQWfQE/pTBr2GDz02GTdkbu5fRg?=
 =?us-ascii?Q?NvIdPnuRYg+QMrJpcdy+rO2L7mHpN9VTFK4AG7du/GITGv59wAkvbyv7EDZS?=
 =?us-ascii?Q?84UDorLBhq87QA4ONXkcJC11gpKbDjPoYFDpRSISp3SQIpFLjRhuuobSBbFE?=
 =?us-ascii?Q?JipQT0qxscbIgZQ8b2ZudYbBtQBF7hZiE36MUuXbdgeXbsBMycIjjJkCCjue?=
 =?us-ascii?Q?2ee/WP1FabYycujnpZNCIqPXbiQYEmNBviDvZBrKa1afxBCpX3Sh2C7EqZ+E?=
 =?us-ascii?Q?YyKMQYrbytC7RPDnvX4VZxXAn2KS5LrWnvX+Kayb/raZcOHSWETkmN7Fj4Rt?=
 =?us-ascii?Q?uikKlFjspCTHKp7wLbOU6pohu4AG+1O2uPM/wYu+NS48HGcxSt56anwT3d0z?=
 =?us-ascii?Q?m7qM0/t9Y81jyzqG/NyhVEgI5Hc8OVNolK5LpNCxoHT+J2SS2torZ/F11oxT?=
 =?us-ascii?Q?7P5S1Kn/BODkRwbJmMO7DfktbGLWiqTNvw75dh9DqojPw0wnyodNnfpvnVLR?=
 =?us-ascii?Q?pqdgAXUa5vEa68dPhT/iX5xLI6RONjlKujgJzskv2/HzMaGe1n5ll1VrtuJB?=
 =?us-ascii?Q?cNOY5u1oGC83v84z7YN3TDfuLR67qBf9hb5epVNHX1fl7O6mCzdDglUO8Vq5?=
 =?us-ascii?Q?Kh/irj4pQmUbHl4hcPjMQedNAbG762YNJdibTNfUTbNNHiTOLTk2PtqX93Hq?=
 =?us-ascii?Q?3lpCuYz9L1rXpFYi6ThtPX3LamL/uOjh0/BQMig1/AoIaXLfk1jwwqBCR5/N?=
 =?us-ascii?Q?9cE43W7aR34VYudys7LBlOlFOt1YfNbtNXkcr04lM7/g244KjRRntOipC09j?=
 =?us-ascii?Q?FRHfJ/xnuWuJeiQ6sYUX5KSWVENP3L07hRsi7mp1t8dmi4WdUfWnDgeKZhnS?=
 =?us-ascii?Q?5muQXPQ84dVaZZ5CwJ1ZecKXMH3aqQFU/iwhGDiLJ2fgdZ60Zkc1zEf3wklH?=
 =?us-ascii?Q?SzSBa9qpkWYef6QnjI4LaIjjd1xk+S0e7vMkAwuK0QMUBw0VlZfdjCQK+igq?=
 =?us-ascii?Q?JqvrXxkK1S5A6bSb6NxlToOQNzRFiAJUMeaoh/XluA3yp1vjOPHawYMqHy0+?=
 =?us-ascii?Q?lx9KQTNTkYA7Fux9BP5K6hRLEnv17AR28Zrtk7K6pfkxAeorx4WC/aWg06Ce?=
 =?us-ascii?Q?Kw4jEFmfm7NoBYVooAoaPRFCjYUOacDzYLFlFv3fdZhRdKkoVTsKOXC+vUi+?=
 =?us-ascii?Q?md2uy5+/yjPnItyZ4Z4m/HLAZ5epeK4lAX2QaS3hIoNJoTrbCH76f/2aJHwY?=
 =?us-ascii?Q?Dpx8wYKVZ0h1/i43SJQFtezii+fsJa+hQ150F90pCn6kcIJySX7rgRYA8zd5?=
 =?us-ascii?Q?GzvcZWHVoiLDiM7XhbyPC5kWKzRUCh9+ESWP6grAoIevZph/OybFQjAdaRCe?=
 =?us-ascii?Q?uCn6NAtsBtwu6WBPQc6cmaZJwbUMUIMdk7okM20Mn6/X4BQvJ1Yvnbk7dKBr?=
 =?us-ascii?Q?zk5VyCBwmGZ11PrQXhXh/fIEYf45ceW/+q6iEdCSiWyiAaPCYOS447YMXDQu?=
 =?us-ascii?Q?YWcPuzq8o/FDbySLN2XbwGhrku3jhLPd2BvDU+9SX3EIn6kxKFccWmYo5eqe?=
 =?us-ascii?Q?Z9lwbgQwzQMhcLmtKei/VhsncZACxTYT7RBB/X0Ry3Yo?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eyNgTbdW7R/MZIl5/Wm5I9QwpIuaxhVDxrgqdoJ26TkTdrpxRf9Aho3knsZYHqTfaKej2MVgmoRFW1tGcRdoEoNy94QSjmhZCHsv7sibPFgz3/C5cf/mIlaiHJbBUxrtjxhwEbPouJFUqNKHPMqeOB3ecGEOu5zE3hUgSACEMnSH5VPeiEIjIVtqbdV0YbXtVs+0mrkiHvGe1Hm8t0v965lU5Tfg263iFMhONNQelVT5fvG83dctkOD2iyP39adcFo1Cn4FlVasO1rhHXetHJqKNljfkLaour3JfV4feb8SNuN3HaGD0jHk8pqzsex6ypGvwA0e26ulN4KFAx4htRAHmnNaD5hoKB8o4mwUTSaOQ8TVuY1vYVXJhYJVTMQztyd3y6fTiR2QMDhqxBs7WLOhnbHFfa3wCr9uuEu7vQV+8SKE3lbqrvKmNQRCPXOAY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:42:49.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d749a848-e95b-4436-0411-08de6a6685c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_104256_673019_3F460327 
X-CRM114-Status: UNSURE (   5.73  )
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

This series corrects MMC pin pull-up/pull-down configurations across
TI AM62L EVM, AM62P SK, & AM62 LP SK boards to properly match their
hardware design.

Most boards have external pull-ups on MMC pins, but DT configuration
was also enabling internal pulls. Having both internal and external
pulls active causes several issues:
- Unnecessary power consumption due to reduced total resistance
- Potential timing issues with higher speed modes due to mismatched
  rise/fall times across data lines

One board (AM62 LP SK) lacks external pulls on eMMC data pins and
requires internal pulls to be explicitly enabled to prevent floating
lines.

All changes are based on the respective board schematics referenced
in each patch.

Judith Mendez (4):
  arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data
    lines
  arm64: dts: ti: k3-am62l-evm: Disable MMC0 internal pulls
  arm64: dts: ti: k3-am62l-evm: Disable MMC1 internal pulls on data pins
  arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data
    pins

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 14 +++++++-------
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 10 +++++-----
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  |  6 +++---
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.52.0


