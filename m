Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F91E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dOTCOh1iqaFRt11MxmntHlvociqodkJI7c+rhB8/MU=; b=dwiEALH4TsEoJyF6OqkAMDFXL+
	htJUV9Y06Iyl5btzUvKOK9xcs2tiHNN0yj1UFnsHrECCL8j9jGVs1GBXa0xi05lq/gV7W/Fio8+sY
	6xjTEZif6pJ/IqQC7OsCan1mXFMUh+9LoadMew1yfUUVdjccZHyx0iQenRVyPFqqLeBHBmT5K7zL6
	Mm93bkfKZ5affXyLKP5baaF7iEeyhADBwC5086VlH/TkjYPZKvDQ3p6D6Z9lFBN6EZ+0L6tdofs1H
	FMpluMdAelww1zvf0NbpgbsHbI3nGleNnMqDf3ynausQ0UK4+7e7MuhEmq34aTDUNe+0O3oh4v7I0
	db23wp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Dg-0000000EslT-0WBe;
	Thu, 05 Dec 2024 06:20:12 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ5Bn-0000000EsRl-26lZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 06:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpSErJ/cfKCCF7BbdDqqfrPlbNHovtCFGjbQQaQq3FbKrw5/VtZNfU4fKJxC+gHROUFnnypV1HRLdXWYWVCag7Q5QCKCjhQlFi1YimAkFR5OOqCsVnbnCGfoB1SEzvw0jLtSTTFe0o87Ay8L3AerboBKsYGVF+6GSuReAsWSGSb0BxIrNEEI/oMkxNCN0yk6EHW2flccTBf5nIdJNG4iuzFlEnKqMQV/HEWCHhPiOjB/kQIPkOQu8xsQLVqD9UAHo/s05MhY9liVgsYvrAgz1UzkZDnl9FxJl/iJFI9kp28/jdpsIeN0NCuuzo2UW8rzV+vphIb5Ye4IC8O1WbdsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dOTCOh1iqaFRt11MxmntHlvociqodkJI7c+rhB8/MU=;
 b=YlB4oqS1JzqGdTKBU8M7tllhGXeEKNOxF8XItK2NTrHPXEQr1o89B2ASn8FDnfZj7jUkwJ1KhWTWpPruzdN/NxkVnUSX3COXBxcgItkmbl+LnyZ5so6d9lfRGOTY+j2gppSv6N/Q9Npbtzrq+Wcj28GlRXn73vbas+o8Vv58QHKZb082LuoHn9z97uONVym+puFbRjMdm0LWZcuEGq5cDB2moMGIcjZX03DlYRNjISF733RUfLjbrCAhe2QEmNCotWvbKHe0CS6JEM8/jk1tqWU6uxtKodHmBbLLPV1A0D0ZIqv7wsUcqYqs1A600GYjzBkEkiSrHzkKfW4egO29RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dOTCOh1iqaFRt11MxmntHlvociqodkJI7c+rhB8/MU=;
 b=aLkUSUIA1rEH5yoD4/Y2jn4ngtFf5jPwjfThXLOfbqtBwnLbmsCHfT3bDNZ1SFLaAXff8j8V5/yn8SoVwZen7amqOADQSIOKxI7jfcb0/CcYF8j0bajHkEKe4MYeDSSLNQe6J9Mr+hefxj/LRftUmCO7lc8wdvjU9VCqltE5guA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SJ0PR01MB7394.prod.exchangelabs.com (2603:10b6:a03:3f2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.10; Thu, 5 Dec 2024 06:18:09 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8230.008; Thu, 5 Dec 2024
 06:18:09 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] perf/dwc_pcie: Fix the event numbers
Date: Thu,  5 Dec 2024 06:19:13 +0000
Message-ID: <20241205061914.5568-2-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::13) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SJ0PR01MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8b451b-3c93-4aae-aa9c-08dd14f496c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6eVkQF7jox9vv72Y88P0c5LokE+Y6L2slahf2nnc3WhnY56lo914YwS50zpP?=
 =?us-ascii?Q?sSVL6v58vJMirGBTeXBAmhdm7yHlbvrdp3C/whw342QrYdk56ZE7sWGFKKUY?=
 =?us-ascii?Q?d2oOIGVQEOyEXoKCeTg46dQo5gr78z342CmdBEIdj/9zrqRE2W9eI7/NWwG7?=
 =?us-ascii?Q?bgbZGp0D4AMls3Twrg1g8xQ8mZqUpQ4J1Rq76eRw1ld4o/geSwY2gm36+SG0?=
 =?us-ascii?Q?AwxjY49YlwT5DC3NrlLiLot/T8Hagm14S6ev+ZRnUhO3XNOphAMFv9Fz4xoZ?=
 =?us-ascii?Q?arVTcG1GRuCvtRcb3fzLz78vo68/Z1J78wuJEVzl55CBxzE7VdKTyWuVPBEX?=
 =?us-ascii?Q?5vbroijy4z2rChjMYrDlBI0HcQeaaFQsJHn4CMh1q+W2owuThyii1fNOYXhW?=
 =?us-ascii?Q?NK5nBonu9wErAB+vSpq1mr6lBDrQxhKK75sK4EqGOHw/gBQSE1dtLefSK0vm?=
 =?us-ascii?Q?0lJuO9IvLtdEoYdpVXE49TAu0OPCe5CXQru1eLaCi3TQHfdjpq4yGBVTyB5s?=
 =?us-ascii?Q?HSlLxrvseNU/1ddstBFzEttdlQPr65A8z2CwZjTpexCnG1gOTcqLS7cWHcqP?=
 =?us-ascii?Q?d3CxUPA2EGUX1EdXs8a1g68qYz7N/3ojazFElX30pOQoW8ct0ADeMeimextq?=
 =?us-ascii?Q?ku/KoVpVakm6KNmYovV6Bwyptj+HcHm03TtH6xp/bCLXZB2TlIt3NOxxiMcS?=
 =?us-ascii?Q?bkET0e+yNrH99tnK5M2kPFRG8/yfzLunXsbveNsH0corn8f2LUAseMj56eOn?=
 =?us-ascii?Q?H4J7Cz8JUFAL8WFdOPKgCa8d6YW3F9OGQKp7OUDiFalUmO7qJMNMK1MM3CCW?=
 =?us-ascii?Q?eqZEFstHhgP54ctfP3YfJ7GskAMivPDV6lXsbGmP0RKJUobw3bOdrkMrhSPp?=
 =?us-ascii?Q?RKt1R01ViCwIJbdCIJlzARaSY4ExBIRW19gmPl3YsVbpb/76YTaz00sDapaD?=
 =?us-ascii?Q?CIxS0I1SofberM8HHerkPh0VM140yUP1Ug6Tafwx3dGcXbgmGpJ4kCbZb0EI?=
 =?us-ascii?Q?K9XmnYFj0poJUnNqRzSyRgiwBjRf3WTOfWFllgeMikPwncHcPLCZR/U8swfp?=
 =?us-ascii?Q?45VG5R3++ULNgJnu5z/BZX/D0nZIYAq1twoJhSj7wYyzbZutzxOe2SF18xyA?=
 =?us-ascii?Q?s/b+4K/94hmY6TuTlZYixPQUTLpXAn2SCXC3atc5xwnirW631y3yNeQVJbr3?=
 =?us-ascii?Q?T15Gtob51hZenz5sy9Q05ILgj65JAJtMxVyMDnIHySS8XvRHAUBBaclKmyRd?=
 =?us-ascii?Q?COufQ3zGPrNEYhIEP36e4clpJ5P2VYRdvoX8FrjmeHDB6PfHml/5NgkapQ+3?=
 =?us-ascii?Q?daajwg8R9VJd6fmq8UHTWPzIdBNzTu+BvKkvOOESA7p1JQVToQMU6AwdFsX/?=
 =?us-ascii?Q?FOgjPCCpbSH41ZUoXluymae+KDQMltQuc+eCeRt94zkiB1E2OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ShVhb+pokjl516SpRGqIWp/nT9LjVp6E12sFBwBSdrpGOSLcChJD0XgYC59a?=
 =?us-ascii?Q?5K+VR1lv6yxsUS33gS63Rv6L8jX5vf3hfFM1tNSWZ6IlWEPCSREuaLSdcWNP?=
 =?us-ascii?Q?Lb5e/0Jvp265j55pQ6UfmpUOZb655ePffH7K+RAd5d9Uz4J5ZAZ4G5mh7tXY?=
 =?us-ascii?Q?I0tU6lMawzaDuVE9umPg0YBDptDdjyyXvW3VbE9fE9xsD6g9ujIlZ4r9Xu4F?=
 =?us-ascii?Q?64vfr2MUkoV7cHFhAqzKSTI7FClBPLfSSvGxxjTc7RklvCI6rXPVSDFg15Pn?=
 =?us-ascii?Q?x0XGc2UFUhlXq31C2cxrHAL1Vsgy8wwvqS+1J/W/DSMxebCGfTadu00mvR5j?=
 =?us-ascii?Q?2nbqgCcCjvueJDQPGoezMkM/WI2UfKcbbVauT34hxrp02JpzuXaZLGu5z05T?=
 =?us-ascii?Q?hTPt/5XgflQEZ2WPEK/PJXrCrorxDgPo1EiNBNv0rZ7yojc/LeE31uQApL1s?=
 =?us-ascii?Q?NfE/J6J6X3RlGgY1G0qkzAG+pSoVGHicJqX+wjmMrg07mxd9UiC3BFwmhEKr?=
 =?us-ascii?Q?xHyrYtcVlap7buMKNyps4p/zYq+tzMmjuaKBuddjJT7zulXC0RF4DrmGhMG+?=
 =?us-ascii?Q?PkNmQPEXu6h3RPcmUKSYg2k2U9tSvru2S/ssiCdN1CoB/tnKaJUtGQDkYT1Q?=
 =?us-ascii?Q?LHXc1lCu6CxoZ578EW/GQcFbxIIqW/HL0TUxXiWYYBJvS6VpwWFFqvVe9NW+?=
 =?us-ascii?Q?npHh+R7rG+N5INqY++TtSW1P5b6iyA+d+5uzSL0GAH3yzlf0g5vXNSMXSonl?=
 =?us-ascii?Q?iHtbu0Z9YXBIQ/+DOWccaRME3MI/UHqUrviyJpwQBzGz68dp/BzpR8vt6RYq?=
 =?us-ascii?Q?m2M2GiZf2vGLy9ABGWQ9WRC08+owkM0S+Hd0LnphSxzx8X2deA5gEwl+pmFj?=
 =?us-ascii?Q?IDgznyeF3Go+Kai146ZtIBjcNJKTVmNZraZfMX3DZZe0wM20mSy91tAxo0Vx?=
 =?us-ascii?Q?ugu0npiJ1A+U+fW7QXD0PgXdOaaFfUqRM/yGhPwog8zRSwbnkJ0OmTNBPQLD?=
 =?us-ascii?Q?E8LGXgGUFR1Ra6VaiUhIIcqfKeQNIp0GwvJYm9nLTkaMH0G8cifz14yXgDcE?=
 =?us-ascii?Q?417LQkWx41RECV+88P4/AWe3H8Gppgd8gUUjlu1iQnhbVs1MuyyJDONh1RlJ?=
 =?us-ascii?Q?E5ZGifdNPg3vJNgsVuc0Am9Q5cwJCdmnVSputHnbz/VBP+qHjRdwws4Vai+/?=
 =?us-ascii?Q?Wepn2sI7waS+pkS+4RhWLgpKHS1fiz2QIOcMpUXUgeoE9ZEl8JyTqFeDPfTC?=
 =?us-ascii?Q?q4TzsSAuoZ1K+R/8xHUgp3L9aaDGoZWPLagVqNI03jMvs0QwqLL4zZ4BP1y/?=
 =?us-ascii?Q?+YxghBy4iYl0U08RpIFkr/Yi5LKk86FF67zgQNpJTSfFuNfWDW8aRL1QL81j?=
 =?us-ascii?Q?+lbNcEcXVtalDiFtZLFvH97tbAH4dXmmjC+HHh+8eS9/osX5tWKmsbg5qbx/?=
 =?us-ascii?Q?yhqkkvUeyU9wHA0MjM3gPcPOYcfRoKbjc9YhY2BQ61SvJ1EfcpQKcwBfcCSF?=
 =?us-ascii?Q?4MN9K+dlvn1Q6ek3TtjLToEf44RMjFzCEYfIOTMJBCioH0cqcldas4sRe/rY?=
 =?us-ascii?Q?1U8BXBGO11jfQC+IQXK6JD217W4hITcHaCNBsSm/J+sRW+iTbUz5vxvY6CRb?=
 =?us-ascii?Q?JLD1xR776CFZMF4WfPNdlPk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8b451b-3c93-4aae-aa9c-08dd14f496c0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 06:18:09.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfCMjNbpyZsVjhyhgxK571oe/fDum5BYxyYQ4mhtL/M1bkvmc15ZIrmQhrWpYmdCdob4l4DG8b6hQodJ+rkeeE+fB7oEyavBgOVnsAKLL61wkHgcGSKWOxSomuCy0XUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_221815_549843_755491CC 
X-CRM114-Status: GOOD (  10.92  )
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

According to Databook, L1 aux is event number 0x08 and
TX L0s and RX L0S is 0x09. Fix the event numbers for the
two events.

Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
---
 drivers/perf/dwc_pcie_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 9cbea9675e21..890cf3bb43a2 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -199,8 +199,8 @@ static struct attribute *dwc_pcie_pmu_time_event_attrs[] = {
 	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_1, 0x05),
 	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_2, 0x06),
 	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(CFG_RCVRY, 0x07),
-	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(TX_RX_L0S, 0x08),
-	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_AUX, 0x09),
+	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(L1_AUX, 0x08),
+	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(TX_RX_L0S, 0x09),
 
 	/* Group #1 */
 	DWC_PCIE_PMU_TIME_BASE_EVENT_ATTR(tx_pcie_tlp_data_payload, 0x20),
-- 
2.47.0


