Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11039E8783C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogF6oPDiZuG+9J1dIodEHs5idcwFQHu2/LQgA/A00CA=; b=wXHwP7u81FC42EhYiDltUSJB7R
	qDCmeGbfgJZ3d9MFGCCKdJPSoNzzUUPjKpWA4j4hP1POcxM6alclX9WdiydTji5FfjKUEXpl8gkTJ
	KUYjMLFQP4/iFIOu8b5OGyPxWzaTyRHAVWJxHgh7+H0Bnw2JM5IcRAcLS8U7jVCXLSEAmcpk8OQbb
	yZLBK0WJwOn9j+nOei9SoF9pstTJxO60PwWBpD2cd3F5vbbs7G7wEfICnbtH00wkCXcFdFNWn8FGE
	Anw7CVlW/r62bNqAJF7jmQoNmH0MHjMh89QAe3Z285r6eWW4/fFwj3PM2BbLiqDGSXID1sZ9QaP+z
	Bs1l0F7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHOC-00000006l79-373A;
	Tue, 03 Feb 2026 14:28:24 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHO9-00000006l2j-3VX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkBfQBwoJP42COXz0FyYSNRbwL3L/r9YGlu98cf1uT6rF52UDhieMUljJRQRRs/NaStBHozsQdbAC4o7UPWXJgzWN4+szYbYQpfLXc2y+Hrasl83Qj7TQ6P2KR+zQRFUhI+sZ9z8Hmr/wwDoBZDL6y+62IqkTKaiSwiUBhtsF/D1flcjrm7EkD/th7rLGUFAFZqYTxphNuKKS30II4nDJMckBluEpBRLeMVrVVOCW6CJpCcxBbgkqAVh/KjyvPcTVUn5GKOilJ0O+xJ+l+wVkJbGnYMrMItizGXlsgHazaPAS8iDcaMbceQVNWYJ5Bv5huko6IqSULVIWSrP4U7S3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogF6oPDiZuG+9J1dIodEHs5idcwFQHu2/LQgA/A00CA=;
 b=VsLxGKC4463Rf9GLVFZGCsvAG7qlNSg9r7jKsTjjN4SlCwEkZLrW4uyxt9RGxqQ8ZLenMlczU/rU43CiIPfVRRzEM4by1pmjKmRKzEWeR6OnTE+KSNME4Fh0cXPVR0WUnJOJmw6A0v0OZvWQqGb9cI87UaS07Tb7vvo0HXElAKA1aZ7zQEFGAg7Gl+r1H0vUFr1RuO/y9cxp7YjfIm0hRStxLo1wG5Sa5aivXQBZXO+57/tAt0eYG2jh6uooE2ZkNy9N6jYQt6sG7+VpEQu2GNBfYWyTo2cT8m0/M+EzrpKWBU85sj8bsCsWJdwp/xZvUc8Et/b/Y2jMWZd2kFN6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogF6oPDiZuG+9J1dIodEHs5idcwFQHu2/LQgA/A00CA=;
 b=hWJtuIsaiN7C6hkTa7+wvHn5zaH0wj9sM0pOEJvRZaWXpTpYOaW8Bp9GGsf053jv0fiV7EhhpzRM05w2OczU3k2az8cGU4o7AoLPHKGRAwi1H9Rww8Zbx0zo1Qs+PqUtfDmIT2el06fJlFRmwfttphWKv2nQ9rBK/BtekYT94kerzohubLc8JM/OQZDkWjp7KvBmAUXsZdx6vIbkfvhx9CpKg2RFC/nYFT7czi/ibufvTOZTZrq18T6gtUQIB8eGjFwLMKbWKE53717UNs3hvcwKrIGse+r2drQfUoATI1sw6c0axLbcZdRlRk1YreTsO1eKNI/jJJbW+dfP3qa5gQ==
Received: from AM8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::28)
 by GVXPR10MB9663.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:28:12 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::8a) by AM8P191CA0023.outlook.office365.com
 (2603:10a6:20b:21a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:58 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:13 +0100
Subject: [PATCH v6 7/7] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uboot_properties-v6-7-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|GVXPR10MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f2e7a4-3a2b-4c08-071b-08de633075c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHVibHRBUWNZaGdGeHdhbXU5Y2RlTSsrSC9uTExlckRYUE45VGV2WnZETG9L?=
 =?utf-8?B?SVdVbkVhZVNSTEhQVmF2MUl1aEZ2b0NOOFE2UHo2UnZma0ZCZWg3NWdpTk9R?=
 =?utf-8?B?TGdPM0t0dkR5QlpZQk9Od2ZvQUxUZEJYNmxlVW1zeWJYQUMwRnNET1VmWElH?=
 =?utf-8?B?Y0hjbUJBNWNyN0FpSlVmMWFZZGJCSTRORzN1UzNFd0JwWEQ3a1NacUZqeUQ3?=
 =?utf-8?B?Q0lNTFRtdUdraUNzZ0xyNHFONGVHTDcxUTVPbFQxZVdwdXhzK1NPTUVxak81?=
 =?utf-8?B?dmxuZmdsMzBuOHRaT2VtL2FMZWlSVk8rY2pCcFlIVjBYblZGL3RKbVE5ZGVG?=
 =?utf-8?B?S256K2pGVkZwbmRvRElJRXBGVGdPMEpyMDFWZzh4RU1RUVd2ZmZCWTdEUjhx?=
 =?utf-8?B?L2JOakNhbVAwdUpmVExGdHhpb080SUQxcVNYeE5WQnc1UzNReFFVNzArMHBY?=
 =?utf-8?B?OWV2YXVsQzRVWCswU2xjSWRUeUNyb0QyRHcrZFlmbjIxZGE5bk9keHVKeG5l?=
 =?utf-8?B?TmRSSnJSVGVVMWx5MWZLWmNqaFdRTmU1NC9GZlRBRUU1b2svWGFaWStHUExZ?=
 =?utf-8?B?ellrbnFxeU9UbTFEd0dvdHJZODdrV2JjSnBBS0ZmVnRua21yc1dCQ3BPRkxM?=
 =?utf-8?B?c0k0cU9WZHZwWjN4dnI1TURyYUt1WHdGOW44VXEyVitScVh5RlhDOVdZMjVY?=
 =?utf-8?B?MzdXQmRpMkJKb3d0d2x3bzB1VFo3NTNuRUppMS9lNkhXNGNucjZLcEF3dzFS?=
 =?utf-8?B?NXppUlJCVXRVSEx5UDNQbG9lbWFPRFRVemVxcVlMQko5VWFxWWJNRENiQ3VN?=
 =?utf-8?B?YjdGUjc5b0p5YjRTZFRBYlQyejhFT1pPaWZRMjhCU2xNNG1OaCt6Qks4TVZ2?=
 =?utf-8?B?VDBZcXliVVNCeWJySVpmRmQ0VDE5QWRGN1IwZDVXOWRXSGd0K0NlMWM5REQw?=
 =?utf-8?B?RlFNeEJFSFc4WFFNTHQ1UEE4dGV0V3lQVzlCR3VFSU03YkpBRFdnVVd1R0FD?=
 =?utf-8?B?Q3k4bWFNUGFVUmdIVTR2MHZQTC95TEk4VnJXQ1FXT2daMDZyLzVFbVlqR25w?=
 =?utf-8?B?eHlxdzNOYm5aS3Q5WFI3L1JxMkN1M25UeW12THMrby8zUmlUa0FuWERjVTBa?=
 =?utf-8?B?akJwR1czQ09iRk1RS2xINHJwcVNhdnZ2OWU3Z25Xb3FwY0tBTm5TRDhiK243?=
 =?utf-8?B?WjdneEJBNFpLTVRod09tMnhSNG9JdnRJN3pFSHNYKzVYR05CREFSZWpYWU1m?=
 =?utf-8?B?OC9lSTMxNHFtSUF4ZVlsbGFRVjVnSERpVzNoR0c1b3FSZ0VnOXA4djQ4YU9J?=
 =?utf-8?B?MlEzb05YcU1OVzlBYk9LNmt6QU92MG9NSHdBcmJUZTlrdnpPWEJqdGkyS1Ji?=
 =?utf-8?B?cU0rRFpoVGxMMElITCtFTXZoajVzNFBQNmZ0SnpHNDlTTHJ2RHlXcEFVL1hE?=
 =?utf-8?B?a3Q0dmJiSFN1azBkbXZHd09XaEtMWk5ObHVQOUtvSXZjTnRyZkwwSXpwYnhx?=
 =?utf-8?B?T2k3ZUJxZjJzQmlFZHFBU29nWmdYVk5ha3VpczRyVjU1Tko2VTRNRUhFRFBH?=
 =?utf-8?B?MmpxRXorcHk2cVJJZGRCS2YyR3llZk96SG5zNkVJay92dHgrd1d5enMremF3?=
 =?utf-8?B?ZTN2Mmh1YTlBazFiMGhtdHB4SGlHQTlJZGFLZjFwcjhBSnpvR0Zoc2t3NFA1?=
 =?utf-8?B?Q3o5V2puNWJpKzF2MG9BUjhVUTdpSnJjL2Y5V1ZLNDlISXNYZ09yUUp5cVFm?=
 =?utf-8?B?WnJYdzlrVWp2ZFJNaWxYLzhVOXZldHo2b2JtZHBmYlErSVNkMVN6WUJqS3Rk?=
 =?utf-8?B?VDdYc2NLa09KbWszd0t6eG9MOExIcXlXcU9TMVY1aUd3Zlo4L0djRUxUdVpQ?=
 =?utf-8?B?WXBwdTZqYWd0MkIzeS9nTGpvNGdOQ3FVbktKUzhrSnVCWThvVWsxWVFRejA3?=
 =?utf-8?B?dndyVnowUUVWQkFoQk96VytGakl1Q1V1emlpRnkwbzBBaGtYOS95OXpKckpr?=
 =?utf-8?B?TmxnUE50SFAwTmZTV3E5VzJvMk9lcHR6QUppUXVaMit0WjJ6bUsxVXg3YWRz?=
 =?utf-8?B?bVJQMjFpNXlGbnZJQmlOcjlvV1hKU3VBTTBJWmhyRTZqcFVVK05xR1c0Z1RU?=
 =?utf-8?B?ZGJuNWxSRXZWcDNkVHA3enloSmkwdUh1KzBwWnV2UkhiaTFLV3ZpeUh5ZEtF?=
 =?utf-8?B?eFhZQ1dvMW5zVEp1dTJmWndTalhHMkpMR3IzTlFwWVovWjZiMG00dTEzdVRB?=
 =?utf-8?B?QjhoUTZVWThoZ1BYU2o3STA4M2tnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +BxFQ0KklLuBJntYn61GoIJwVo0GZde0PVs8+oH8eD4FM5spf5grg3MYzuy8F6rVrnffBTIAK5EYNeaeCEPN3kCJqrN68vJUGEqN4SawTYr1hVrBzhJzKt4kqrqHOUa7UQsOPU8vd/vRpN5iKi0g8oqHSQ1esCEHFfDPYKbvXh+6knQxWC9xt8cvYrN0HGxa6BR8nAa9nPsLClpkR9dO1XXn6+E/B8nMzs6XyVkfxjZpz4taZNgo4V3Z9iqL0v13h1jOlliDeRUd3FnQ0/+pAI01S0pyT1fLvdmIkWMrTXOBwpAQ/cfnCiLIIvMEBvaSdjQKQq3BO7qkeLV90yMOVkW6MYjzn0u3aT09MyfNw5kAQBI8R0EUsFDMcZowNNIALQfc9EBPe/eCMK8G7eJTeRbOcofZT1N8A4aRr+gk9uSTzjmD3HYOu241WCI2VHpn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:11.7790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f2e7a4-3a2b-4c08-071b-08de633075c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062822_051558_E883151E 
X-CRM114-Status: GOOD (  10.63  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  29 ++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  |  95 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     |   4 +-
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |   2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 103 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 105 +++++++++++++++++++++++++++++
 8 files changed, 339 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index cd078a16065e..7ddda11a6cc9 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -47,7 +47,7 @@ ck_flexgen_51: clock-200000000 {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
 		};
@@ -70,7 +70,7 @@ scmi_reset: protocol@16 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..6841433199eb 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -44,6 +44,35 @@ &arm_wdt {
 	status = "okay";
 };
 
+&optee {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
+&scmi_reset {
+	bootph-all;
+};
+
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index b5d81d1ee153..142a57006823 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -59,7 +59,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -111,7 +111,7 @@ scmi_vdda18adc: regulator@7 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index 5ecc5ef61590..2f6157957d13 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -95,6 +95,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -117,6 +121,78 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -128,6 +204,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -142,12 +222,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 8b925ed0d881..80ff8a43801e 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -68,7 +68,7 @@ optee: optee {
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
-		scmi {
+		scmi: scmi {
 			compatible = "linaro,scmi-optee";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -139,7 +139,7 @@ v2m0: v2m@48090000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..3ba4e6166586 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 4135e7c0d9a3..a6853d4aa45b 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -102,6 +102,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &ethernet1 {
 	pinctrl-0 = <&eth1_rgmii_pins_b>;
 	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
@@ -124,6 +128,86 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -135,6 +219,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -149,12 +237,27 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 852a73b0c516..cbf08d4304f3 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -167,6 +167,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &combophy {
 	clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>, <&pad_clk>;
 	clock-names = "apb", "ker", "pad";
@@ -253,6 +257,54 @@ phy0_eth2: ethernet-phy@1 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
+};
+
 &i2c2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c2_pins_a>;
@@ -338,6 +390,7 @@ timer {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 	port {
 		ltdc_ep0_out: endpoint {
@@ -347,6 +400,7 @@ ltdc_ep0_out: endpoint {
 };
 
 &lvds {
+	bootph-all;
 	status = "okay";
 	ports {
 		#address-cells = <1>;
@@ -368,6 +422,10 @@ lvds_out0: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
 &pcie_ep {
 	pinctrl-names = "default", "init";
 	pinctrl-0 = <&pcie_pins_a>;
@@ -389,10 +447,38 @@ pcie@0,0 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&psci {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&rifsc {
+	bootph-all;
+};
+
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
@@ -424,6 +510,10 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
@@ -438,6 +528,10 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &spi3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi3_pins_a>;
@@ -515,11 +609,22 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&usart2_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart6 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart6_pins_a>;

-- 
2.43.0


