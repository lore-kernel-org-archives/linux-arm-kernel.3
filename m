Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C80D47CD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=; b=qhVv+NdoMdcF20T++lFscTAuhM
	4sBfhjwSu+W8GMp8KiwrIxK//8JTJkFA86eAF+cX/GXOUzW96D7TySjgg8tyxmjeeDww/VEQGfHIW
	2YusRmOcYA13+aDrgOWqRhgEJuoLlXY0vEkPO32eIFqZx69KSO364UNJf7Uvf5lNbXYbm06cR9tQ3
	3rbWP3gMkXsfVIaqi+fToYr8+PjnMVcmxHZkw6WHPpM044s1PFlonJVVWm/Omeft0VCI2e/bAeoLr
	CFxzDUA9gC7x6wlnStjC79rz+iMMXSLDgkEwEH4ZHKyhoRSwXKujyzSBEdooetiT3JiFL7GFy+cnK
	7Up+SewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrP-0000000E27w-1JkL;
	Fri, 16 Jan 2026 11:19:23 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghrI-0000000E240-3dpI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEZY5CM5ds2fz2msgTPynbHahlzUlAU2mHpCdP47ZE8MgtSaA7Uq0eosBaRtF9fHi7X/rcEF2gRnHfn/fs91kJFJV47Mq1DU+7DehkbFfFQcH9jKDVxyKqe7p75j0H7jQRpfr5Bw06T0va9i73RDBqTIr1IxdJ/gjswIaMMhTQhVZmCMmG8e1m+wsUWuLVCRVqWGhj7FbMTzvch3JQ9L/HRYWK4OQh815L2Uja1tQmXX3at+JP7ys93Vyl5Fe3CkONfjhU2c1Yt1g+30Fi4HuawgT1oVPOpCDZe4NUvd/Fs5D4JSbGDlugW5dVYPl06FrDAumOzGCdSSbJt8i2jqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=s805yd3TK/O+xN9A+XCU74RqpqXNKXnTBCbn5QfL4MQnYqE//w0gEQW5widk4Vx9lmiX1hRtpUm9VYqU41ghiODI6/GhzZNcLeDnIjWbbENPih/XIy2+o5gbv+eMcBIRUzBniar8f/mzYfuxWerQ1ca6sDhCXj1diU5JvMxIWU/VGDR19/NDezmsXhWyEWldL06PNWfR51FXGPe/MhqEi+jO5ggrEQbrttanG6gHHQcrUE7zO2oSX5cqpLIw0ZHcdrg2x7JXk2CZFnbg3/ojpoeGXOfDXXdclzxKpizk1rjQeLFTO5sM7CFNblxposCB45dxc9FFbth9FeLpx4HCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6hi2Ng57jOgja0NHfG8qsfVJKsfUIfcFnUYxfdNiuA=;
 b=dINjtcW7MOA9xBOw0SofEPLzyYXcpOOTAwvXBJnjF4PenD3UUDjqhnm1VaK6yRC2SGV0NcGqWqWGQxeFJJl2FDfuxXV6pcwtNjXYJAGQmWhRyRDlh2qeLGaLIy/lAWl4mGBsvtps6WzrWEexlYB2K+X/uB4RtOPNMk9DT/DXwx0=
Received: from AM8P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::16)
 by AM9PR06MB8162.eurprd06.prod.outlook.com (2603:10a6:20b:3a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:19:10 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::5e) by AM8P190CA0011.outlook.office365.com
 (2603:10a6:20b:219::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 11:18:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:09 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V3 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 11:19:04 +0000
Message-ID: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0541 (UTC) FILETIME=[EF51C150:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|AM9PR06MB8162:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b77dd433-cc0f-4ca5-4e25-08de54f111ed
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vTeGkHB4dXCbDtU1l8m1nBZgq0rIg3ZiSaQ5zY9wsP2+G6vv6n1UuB8P67lD?=
 =?us-ascii?Q?WGSdJLJZUG3vJMSuQ7kmv9WggdL058YpmtL2GyMIZ54ZGxy/xyOTrPpTE3XO?=
 =?us-ascii?Q?sqEE++OPZI9OKisB944yuqKTky2UDeR+3aVyY/X2KZQwVgkiUceS5G0GHHuT?=
 =?us-ascii?Q?rrrGTIc0Bs6NpyaqVqEBLB9fAEJuSBFMHfZ3r5D6bTbtXX09ciVm6Tbua1at?=
 =?us-ascii?Q?yQUBNPikByOO3KBoScVOQSZalcENkPWwAhzB6wY127dixyW1/zFVbXPb9Lht?=
 =?us-ascii?Q?YDwVv8Yugk3zi19gSPjgHnxolg38fn0dPua24xYVKuGkpNiwQ/zu80jBNfz6?=
 =?us-ascii?Q?EMDtLPOBlkPnxx47KQstUTuQrd1eCqe1oKBGZQkr2wMFGN2atg9jle7OrJML?=
 =?us-ascii?Q?PWnWSftGxpgHg4gEUFrWPllrZ7QCGuqE/5NkVBhyOP8PHHm4+X3W7t2RR9GP?=
 =?us-ascii?Q?t73mnWV+6SPTVudnWw9Sgm9kj9nS52J7MiTRCKlWJJkz/SMqwOnVv0vDUNp9?=
 =?us-ascii?Q?EWiEJyHuTZTHeeFh96spXyxaOsSa/IF8D3Wo+fHQkhY6Fb/apjbFM4Lw54F5?=
 =?us-ascii?Q?/JlEDQivchBGEVZw8aygaxbYw/s1Zb5r6bAL23O7HL5XDBgBYTvUp9Xcaidp?=
 =?us-ascii?Q?o+viKQCU8UXmDSOI+D+18oqNxbrlbU9GGGsW7AcXI9zL59taifKFWOHsOyKN?=
 =?us-ascii?Q?i5zy9lQMlHYPJhwNEXEKJtyMXO0/qAOcl5fRHJC3/9VmLFwVj8J61HlEWHRG?=
 =?us-ascii?Q?e0idhl02NfcstLma40GPSm/VyUKuy5XaHCkLcTgoIETUDhKgIf0Rz+gj4732?=
 =?us-ascii?Q?AkKTyS3bBWfNGtdO6yn8MeRgoWMrC00Z8pmO7uFYdpK/AMICva8W3uVDa//T?=
 =?us-ascii?Q?UoQFCr/QHjw1cmz1S79uwUNvpJo/h/qiNFXlqFUYeOpeYiw9yvrtTjXEgm6i?=
 =?us-ascii?Q?5MtNr7SXt0pRNy8buQOKt6mHMk5xgL2Ew72OUgnhYEJgzBFAQdn84pJNF1yH?=
 =?us-ascii?Q?Jr/Evd54WzS8PKzUxpYZ9nUNQzDVKOP3cqsFzQmvpmUgHL1SGI2E0Ld44TlJ?=
 =?us-ascii?Q?Kef2Sj4uGssV1mUj7mjwzvQ16XjQgeQftNXOXQl8Kru4r1pc4YopGtdsYLQ6?=
 =?us-ascii?Q?54qz4L+gZFj81CyTC0ADy669B7VL6VRydqMORCHfE+sKgg69NEVUrQSA5dVh?=
 =?us-ascii?Q?rKqgGg43oGiwWPZj9p5YMUb2EYS4nz0B8EBZbs2POXmnhaFglpR4shdPNwYO?=
 =?us-ascii?Q?R7N9EvBwOvFKRYruuxotaU26pY+rpH+nwvpyAsYpsNfYIAhW+n5KIo2QmM+U?=
 =?us-ascii?Q?8iTM0PORuUG3ZdZ/141TpXcYPxdyvjY9xWStqBreRKSpZzWpEGqPuo71FKJl?=
 =?us-ascii?Q?Lki5E2zXt06YeQ5RPrCKvZd89CIgtCzOjBu3vCR86wMeP07t1plToGaBVCAw?=
 =?us-ascii?Q?FCfdgvtMtmTOhUMDjoNV5TY3sxL+sK0Fq6vwENPph29MjcSdpKj7BWtd3zB0?=
 =?us-ascii?Q?00tKbOfcCkg+HfmHLV7hcZs53PpuJYp0BvGfsvw1ncihBt9XdDfZ3hwdQx69?=
 =?us-ascii?Q?tLjhvi3tXv9ZmkmTe2Qa9Z3erb8ww4dSisX0gv6nQkyxQAmFHgrIoEVkEFnh?=
 =?us-ascii?Q?gfLipsl3BAfDZC3eRUM+hNpLa4JGv7Bu+wyWfiNnwDsMekmm09x5Gg7pv1YY?=
 =?us-ascii?Q?GtGRiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:09.7443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b77dd433-cc0f-4ca5-4e25-08de54f111ed
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_031916_914362_DF4E898C 
X-CRM114-Status: UNSURE (   8.30  )
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

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v3:
  - Add trailing comma to IMX_I2C_STATE_READ_BLOCK_DATA_ABORT enum
  - Clean up reference manual citations

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0


