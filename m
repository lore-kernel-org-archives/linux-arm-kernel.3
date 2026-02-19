Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A9BE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CTUvVPj2BvMHz8/AyPqTWbyCsQNYMFqm7RLduJVBAdo=; b=LXzWv5OD5S5GNnhk3rDiDNZa/U
	XU28PTrV75ASB2bZkScvsCQXclsRpfttib5uowov8AZfWMzUMes1Xt4p4LI3O3zCXFAlGmgOM3XEA
	hg3moWlzHiujsL7VLla+DADLpjDjqJJQ8NCgOz2FgndhsJbSxnBS1L2plPyzPSZaNjNGytsE5O8mk
	Wj97KGdE/pjSVrZBzfaentlTU6EFQXD3gE2KyKeE29YEDQ9E5F6Lv5aQv0lo8iCZOiW8q68NW+PiZ
	PUMOjH/OstTAm4nv1md28lFyPwV+v50I5y4xosFd2llCWMll7YaNNnfXiPyqEMNo2LBCXKabhAHUu
	IWjSWwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1xY-0000000BGOJ-3vo0;
	Thu, 19 Feb 2026 11:12:40 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1xW-0000000BGNv-0pi6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya4XAcFTuMbO4YzflNcQrE3q0F0tAz0Da8/LGDwKfWHuONW7TOPrPi7Oqg6Z05wrg4Bo3xMrh43XzT10puze0VWNvGihc3DEt2xDiUe3/6cjaLYjLIomx7njVV8pnYqCZoHxzIHMhfE28jQ3DpLbOktIpRN4/KKyhPx2YU6zm7piMaCFVYX2PpCfkczs+VjgShvPm8fvWPfvKJDaSSDnWwl6KnsHGJe3DNOGXZbwAF4n3LsBqzzq3iNYDPzvzf50IMd8LSGPxsI97QuTxZT/TiOspGVWVjijSPHDD1lqxy+rVpUMPw2ocamC3wcfV1Wj9vRiVB0ccbeuwfWhbCN5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTUvVPj2BvMHz8/AyPqTWbyCsQNYMFqm7RLduJVBAdo=;
 b=I2wX9MN1/eeg7Y2d4cWxOYCfOKrP0jWd9weRe+kMpbWZSBN6KTQ4LyMNvDnVaNbJr/dRvKN1CVA+AJO8FviRV6V3BfcAvehacJuX6L/7Z/8+LbQ7hHz+/LKyICnJip+o1UymlQZmZX/WbajYERe2RYEkL6bPzSU4Hq42XSQ/PAKavVXAnlvxIh5H7CffLFGlbUc7DEYb4R/ayFkKfs3dsYRUWNYN4m7WxQbziURM4yVsi04sgKt1rJ2adHfxAZDErBIRYadtHuh9SeqCgicmGc7dC2Jii0JAZ6ifrHBr4CKKhZXigWZt9T0qFQ4ppVXP1KiA8xvLOxd/ET2rknKOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTUvVPj2BvMHz8/AyPqTWbyCsQNYMFqm7RLduJVBAdo=;
 b=QfThX6uD6Sao55IBxHCE3xXEGrX0wwyZTjKN1zY/Q8lWe9+b2HkdiSA/XDtVEF2xrE07h7sg6dGzeJbw9Zo+PBjaYwfP/+g62pFumvtj+JScN1YivLvVZQKvOFZQqR/QtAP8w26xa/9WHKyqijk/ClGYASTuqzc+euXpIfzVfO4=
Received: from PH7P220CA0161.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::20)
 by DS7PR10MB7300.namprd10.prod.outlook.com (2603:10b6:8:e3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 11:12:32 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::48) by PH7P220CA0161.outlook.office365.com
 (2603:10b6:510:33b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 11:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 11:12:31 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 05:12:30 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 05:12:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 05:12:30 -0600
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JBCPL82488751;
	Thu, 19 Feb 2026 05:12:26 -0600
From: Aksh Garg <a-garg7@ti.com>
To: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <heiko@sntech.de>,
	<ebiggers@kernel.org>, <luca.weiss@fairphone.com>, <nfraprado@collabora.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <a-garg7@ti.com>
Subject: [PATCH] arm64: defconfig: Enable PCI NTB support
Date: Thu, 19 Feb 2026 16:42:21 +0530
Message-ID: <20260219111221.744294-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DS7PR10MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c994fe-ee85-400f-d318-08de6fa7c687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?82mt+X9zj7DQtRZ7P52xNA4l/nGOymoguYO7K4XBI04K/wwN6tbrY5n+uU8Z?=
 =?us-ascii?Q?TidpYS0fU0G7m8pDvGqJ2v5WHyAaF1scp48ToTuSKwPwTftlYhYxWdlHNQIb?=
 =?us-ascii?Q?X7yrZuG1qPbyXvPuPLrxAvNX81uH+qwkCkfEm9Vb0LryNAkCf2QZTPdiE+q4?=
 =?us-ascii?Q?gx4SFiJ1THwZe+g95J9WLdLTst2HGxvr6qLXh0kt+aZ+f/Nn6LZwAfAzptri?=
 =?us-ascii?Q?QWGFX6rYJuYcSz+TVH2bqaakV9kpv+CwOz4UphmlGYIWofYaSLKYe7akAfmE?=
 =?us-ascii?Q?OM6N67NyM4UoSIVdjitMRnvgBFh7BwT8xEBVqoRxEHLKuzB5zYqgfBWiN7Id?=
 =?us-ascii?Q?m6jgXCL6pD44/gJNtrruVkjQSalFgVJUH5pO7up+x94BpAaGBGaUNN7yORGW?=
 =?us-ascii?Q?eZ9ZPdKwz23jMgVFUrSCiVUwQ/yDhMFZCQf0JUvCT3WLNXwIItASTaoJlFTh?=
 =?us-ascii?Q?NPiq/clJxiu4u5O4xl363CvmVF0E+jQqUNOVXMvOE0ESot7xbEB1PzmUJmZJ?=
 =?us-ascii?Q?09dkERP++F93oeeHipCQgIU5JOsu7inHqr0YmuoEbO7W16S2bs6HjVJXtjhB?=
 =?us-ascii?Q?A2N5KYCKu2fls9VzxLM6PLxwUtbeYqAmPtp5Q1W2QKHT3g1T7/81IVco6vKP?=
 =?us-ascii?Q?XmmDGdnST0blKts9RHVhPrlibCpEfO1a2GmHdfKfrlGtx8exoIWkJAYJwErR?=
 =?us-ascii?Q?V1egU6mG7W40CrYqToD+pHqVASj1sluibRrR/maafPaoMxL+hxPTVzDXLWGq?=
 =?us-ascii?Q?QznfN6jN2ayq/3JDJRx6y4RtyTOGJTn5t1FjwexpaejxmcMcQL/n68at5zW1?=
 =?us-ascii?Q?TU7lzqS7KwWncaubcSj6iyGooDvkVAA+LtJZ5yPZY1IgUcfDSmFElbj2BYnw?=
 =?us-ascii?Q?Souxeo67THMz1LZa5UR2/1FltuRVQ5l8lNmi+wD/SZLxa4rtN+P7xeRSw+e6?=
 =?us-ascii?Q?6wJWKM4UW3pxmnlCSIhrS1IGKnNbHqE5mOgquIloculCyYGgqtsk+9BWjE5o?=
 =?us-ascii?Q?6FwLzZAePKrtHiRyUlPfxoEAwiA4IacEt5HojgWxJ5p1J00jvjSnGASwlMbi?=
 =?us-ascii?Q?iI5H4YGYDKUZoW74gbyVWZxVLiaYXTNElQ6xVR13zY13R7kuXhU3VY7TEbmS?=
 =?us-ascii?Q?D5AtAlY+Lv9BCOymzF589NgZrFRQx6wtQtcboSeseRz4KtHY1EZJxptiGRli?=
 =?us-ascii?Q?7HoKAfFfaNoHUjMBsZZICx0Z+i1i9UQSOd62CqilqgHpT3FotPMi85cCD0K2?=
 =?us-ascii?Q?/vjbjMQsDlxiXofqQLvjDKUIPc3OgdNj8AXq1zauaLNDELvF+YyDV8OSskY7?=
 =?us-ascii?Q?Zqb+HSlBUFRg0TVdf4s7+CAIbcw4T7cd16tYcNWRhhVfi7BqlsGMgdyRMmyN?=
 =?us-ascii?Q?6cgk6G5jnaot77aJ8J/0WbxGDFrT1PeuD+oteCvbacqtd9qJIanPnlFkvUlV?=
 =?us-ascii?Q?1RuEJYeVbXRFt11tAiUkKz3ot/6OBUr0WV5Zn0GgaqtH9buQD5RynrwtbihO?=
 =?us-ascii?Q?wGd7J5A6n8aL2NwPWG8TF083f8UuMRtVharRlsD/WT5pRax43Q+r5A5yIyQ8?=
 =?us-ascii?Q?0RzRxFFf3LLhA7vwxIJG8aTabhPzWsjO4ocB92t1uV0BNQBgNFJLgj6SfNLn?=
 =?us-ascii?Q?gmo61VfI/hG9yYVsUbhbCdIBSFrJ8R5Xt8Aq+Fllns8wCzZpThkg/+IiWyse?=
 =?us-ascii?Q?O4at6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3K9tK+UK71XgEuPmX/MILNV33K+zj8EEUDl4xNlhg2JWTwqlh4rOAZ2lSZtNeM/yUHYQQqYUw/Sl54hDgIRYfUhRVQ6XMBA8c7OEGiu99D9jI2Tm1OYEbFCaujOgEi8TEyVKTkkve2x20HFj6pcgtb/mBAzBYnccUX2Zwce9GcMjcZo+hlbEQaFbPEhwmw7A97sEyrNeTpnWYFWlwq6ZMZ06mdCg5O59ogCizrG95/yJlcqQ21a8rlElX/kX8/MbJTu8WIxgs/FFeg7JHKwGRKYlPVoyaAKlD4Rt97l3Dc7dcxzYLu0aIDAGj0I0vZCh2gD3Ui0iz+qzh+UvbE6dnWEf1chLMFZzhwAmUPz+2bIn57shO7zDOgwArbAEXrbgikFa026nfdooucEq+Qy0ngrCn2j9YrII0P1/aBkRmcci519chK7ukLijzSciqmWa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 11:12:31.3453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c994fe-ee85-400f-d318-08de6fa7c687
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_031238_338214_8ADF8776 
X-CRM114-Status: UNSURE (   7.28  )
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

Enable PCI Non-Transparent Bridge (NTB) functionality supported by
Texas Instruments J721E, J742S2 and J784S4 SoCs.

NTB_NETDEV provides a virtual ethernet interface over the NTB Transport
layer. This allows connected systems to communicate with each other
using standard network protocols, and transfer data as ethernet traffic.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 35e9eb180c9a..8ae56d186716 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -250,6 +250,10 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_EPF_NTB=m
+CONFIG_NTB=m
+CONFIG_NTB_TRANSPORT=m
+CONFIG_NTB_EPF=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
@@ -334,6 +338,7 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_ZERO=m
 CONFIG_NETDEVICES=y
+CONFIG_NTB_NETDEV=m
 CONFIG_MACVLAN=m
 CONFIG_MACVTAP=m
 CONFIG_TUN=y
-- 
2.34.1


