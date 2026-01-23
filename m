Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF5D7236B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf4/7AyVrq/PU5rn7RvQqR9loC0PPaiuuPMP464kAcw=; b=Vu2k63apGwslx8MAoS7FeiU0ie
	3qVS0LzjkwD6yWFF+w1xNc3xDAz0OGRn0pZdKBRDqx178WdMrLxhdkE4xl2ej9FJxCI/9vXV9EAUP
	qNX+ap7Wl8BP3mFtelzr/1q/xeRMi32shkK2nCF9Ob9ZXR0HChByjBhu0IMq2LS7Awbaiky6wUINL
	75BWbcDXzkzmYomfLRR0qlFuAKxDYKiMOW4BWnxfhwUSwxA2FMk/HI63h+WYgKtO4O12DMVuZ6lTk
	BELvdWV8OnQTiYYXmtOr+a7Nb4oByUQ8ra9fyv6hzSpp2oknwoLy5ImVVE8mfa5HTddHWG1sLxaTP
	B/VESflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBW-00000008gzi-1pTq;
	Fri, 23 Jan 2026 10:14:34 +0000
Received: from mail-northeuropeazon11010015.outbound.protection.outlook.com ([52.101.84.15] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBO-00000008gwq-1JWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PklI4wasoVEVQ20u6sN5LVdw7VQMlzF+MlF0guuVvVDSbbE/ROB0tlrYMXJWXI2OwG0rs8WlIXtbWH7a6zdCIZ+MQGUUnJnYqQT3qhvCrvs/ccQSk2MgxRjGDGR184zAU+4+Vm7SDvSt+Q1qKpGq6O29DT9tZUlh3aAtrfPgIAdTrS7XqhzSHWNOmOSQ/pBFkPocE698gpmCjAijmvnwnlbWnFMgpxVEH/Rthd4E0NILJMi923W13Br2snRSQCckTNrVEONqqckyfEFoBrt7JHkXs4ZaqhOxhy+44ddOTPZuD5zFdjboVc3sr6o55MLzsDYn15D0lOY0xW6P/2T/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf4/7AyVrq/PU5rn7RvQqR9loC0PPaiuuPMP464kAcw=;
 b=ygkW/n7WH3vdaeRur9bIusE00WJrLzc+cFJ6/WAOq4n9RmuUIJZHp1VdcgL5+K0XBZxV0s+P7/nQLyNasnXEO4BfbNJHLdW3iLPcfvHHvvuF6Z+mN9rkRLyBwy8NO+fvBjvv2cUxESKcCuR4rgckgcVuD6LVbjzrRogkrxx4AUBTPRTjsXECf80j9oBaDRrRKPGT1wUblSsLNcbOQwl424psav0WmH1FRwexEgsZ8g55wVfC6cKsU5CwuQwHh/Mx11+XLvuTFx0Cms+M4VAkiS4Yr+9ZV65n0z6RA2nvThqbHY0fZBAHqd6mb/THYy3RGybummnwwFp+LjRemroVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf4/7AyVrq/PU5rn7RvQqR9loC0PPaiuuPMP464kAcw=;
 b=DYpsTEtmYJskpUmK2+Y4FMYiREzY66qbQnhBUXOXyqkyiGmIcpObkZQkbsRER1flGtpwlak5FgZ9Wg7v73A/ChJYNA7rchBFiJxJbjrH/uAUxQaVpPdSKxhMhowSCOIp8XNtTHNMrUVREIfs/ZjZT0lqnD15DPVvgsTaR/GbGMSqrIB2w5eoAsNyX9NqgAez3jdJLChrxcxQjxafUSCgGAeBE+c+UWYEOrPJU/l1tKykQVYSCd5FyOpRWvZShscxxWQ5opJ9oUhZZ8hkrsr+d00nsegVFXDrzgYhoNC63OWeuZy8vfsR7Yd/eaGexGZdWgd8Tv4UJKpGImYR9ZDQOQ==
Received: from AM0P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::16)
 by AM4PR10MB9424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 10:14:18 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::c0) by AM0P190CA0006.outlook.office365.com
 (2603:10a6:208:190::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:29 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:07 +0100
Subject: [PATCH v5 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_uboot_properties-v5-5-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6B:EE_|AM4PR10MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6e5505-fe60-4099-e4c0-08de5a682b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXZSU20wQ20xMkFyclMrcVhDVzBESjdPRjJYS2FpNU5tNHpCcldORHJ3b1ho?=
 =?utf-8?B?WklXWC93L2JoWU5WaDdvT0x3aDcvRmQzQnpVWXFkUTQ0bER6TUVJU3JmM2hi?=
 =?utf-8?B?TENXVUt5ditHeEh0MStpdDdQL2oxUnpBVmxzRGRLdFAzRGt4WUhDVE9JNHV5?=
 =?utf-8?B?a2NnL2pscFdSbU9zeVNsYmw2M0dCbnJ6RmduWUlaR05jZXpFRy84dmV2bS95?=
 =?utf-8?B?M1dhS3VqVlV0Z29wOHIwbXdIODBCZnE0ZnRyVEc0alV6d2gydG05SE81THVX?=
 =?utf-8?B?akg4L3EyTXpaWS9aamFxUy9LWE4wQzJLZlQwSkpzQXViV0UxUm9peEx5dkh0?=
 =?utf-8?B?ck1yOVBlSDdRMGpuQmdMQjhnQ3VaaXpxWXVhWE5Qank2YndOR2RWREY5RkJl?=
 =?utf-8?B?NXdkOW81OHBwU0RPNEFGYWw4ayt4aVpjM2hRUFVmZFZEWGZuUGlyajVWcEVD?=
 =?utf-8?B?alMrNVZBK1ovcW9RMEJpSDg4VFlLNVh2UUtRSC9OZ2NWVlBzaDlyaTZ2V3Yv?=
 =?utf-8?B?dDVMeWd5K05SV241bjk0N2lSbUt4L3YvSmZrdDZDRE53KytkMnpSNmtPdTlJ?=
 =?utf-8?B?Q2lYM01yeC9pNHpVeC85UTNiSjhjcWJrSFEreHh5MUUrUmZrZFlvY3ZqL1VG?=
 =?utf-8?B?S3NnOUtpclQwTUpSNFpWOGpTS3hPSnJpYUFXNWJoZUREYStDVkpwUkthODQ2?=
 =?utf-8?B?aEMxNGlwYWxGWC8xL2FrVzNkbStCWUZ4bm1YSTFXWitrN2oxTnkwU2FMM2pL?=
 =?utf-8?B?SzB2Rnl0eERsV0pnMHd4SEZJaXZHdW9Fb09GaHFBaEtLODhxYWRrTlVMbFlw?=
 =?utf-8?B?OXRqU29KeDgrOXR4bkQ0V1pFUDJOemdtT0JWQ2hGWko5cXBxWE9YWjVaYXlX?=
 =?utf-8?B?UWNoQTNGTmNrbllaSi94NWEzMi9BZVRtaXJwVnVJcTB4bk9tYUx4dlNuTjAz?=
 =?utf-8?B?TW9JTDdZK2gwaC9jUlVHaHRja3MyS1g4WU4wV1VUbHVQSnNaR3FXWnFvbmdy?=
 =?utf-8?B?cVN0emhaSHpSQVkwbjBGb2FUWTZKS3dFaG5xRW1lUnlZSlRrRXcyL3dHVmJK?=
 =?utf-8?B?aGRUREY4Q2lMVU5zMGhhVGtUdkE2Ynplcy9OUytpVzBMcVJvWXBFL2xTdWxX?=
 =?utf-8?B?NHNyZUZnTTU1b0dWYS9teHFsK0NQVkczYWg4Qmcwb0JYTG9tdmxHQUxLRGxB?=
 =?utf-8?B?Q0s4R0xkTllKWUxydGxjS0dzLzFnVGdXR01URG5tcGNYRm9KL0V4amVYY1Vv?=
 =?utf-8?B?TGpidmJ3YS9GbG80Sy9IaHJJRVhEdUN5a2IwQWpjSTh1V0MvVThkaXZmN2F0?=
 =?utf-8?B?SzNwOVNsVTVwR3loTzB2cDZ5Q0xaRkpzMFZyU0h2MkN2R2xNRGtRd3hVYmsx?=
 =?utf-8?B?RUswTzNKUUNwaU5zdnk5QUppTGlFazNibDN3WW5EL05VT3dLRDJjbUg2S3Jy?=
 =?utf-8?B?N21rdDhkVnZXcWJEdWdPNjZBaHlmQTRhVU1uaU5xcUVPUHBCaTFDNjViSm1O?=
 =?utf-8?B?b0lTUTZZdDRyRTZ2dGdLdElXUTNUa2JsZzM1clZxN29CNVlkak5MeGtNbldI?=
 =?utf-8?B?dlJ4WXpIbkVhbkFLMFpRTDBCS1VGanZpbnJKMm5Kbk4rMFB5bGUwa29MeUVI?=
 =?utf-8?B?dFBoWVEyYXNYMk1oSTJ4NG5kbDZvRUpNVkI0L01JS2wyR3pKQ2RWZzRCSVNQ?=
 =?utf-8?B?czFQYmNHMEJocWpaai9hTXhCT2tkSTV4bytJZzk3U0dWeUQ1TnppRFlpRkVX?=
 =?utf-8?B?RmpaMFU1R29mM2UvOEZIdDVFVU5iVHFWd25ISDNtNmFMeTBjN1JkbzFGNk9V?=
 =?utf-8?B?czRaaWFHQ0hmWHJjRVdqQ1NzR2dOKzB6dlpjSlNiRUdxT0FjdHZtc0hrM2ls?=
 =?utf-8?B?K1hTUXg5bHNac2FvV3RIYnk3Z3lYSTZFOUdSNkdZY1RKd1VaVGJpSXh4KzFw?=
 =?utf-8?B?ZTQzLzNYNG9QY09uUlUwaCtKczdON1lMNUpYazI3c29MVW5RT2JxS2daYjVs?=
 =?utf-8?B?S3czWE4vbFlpRDk5c1M5QWVQQWZoYzFpTmgzS25OMTNrckxrSFFPUnE2RkxB?=
 =?utf-8?B?elVSR2F1UkVLais5UHRuRWhVWFE2KzkydjlLKy9HMEh1T2V1OENWQVFWby9o?=
 =?utf-8?B?YlFiVTAyY01oejM4WlVPdy9VVHAybFB1eU5tMUZrNkFMSmFEN0RTMGl0TGlR?=
 =?utf-8?B?dmlFcEdEYUNDMjJJMmJkSThQRmQ3Nmo0M1dpMEMwZ0FrN1REc1I0NU13Zk9r?=
 =?utf-8?B?b2FrdnFONlNnd2cyWFV2dFJmWldnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gEyi4bqabmdcan3E5enExVT8pjPHInsm9sRbIsJfaUOr/62BJc+LexM/pR5u5y+QupsKQ5BljnaqzHpTeunqOGnGLnkNH+56yiRazLlNDWhuw9V1IaHHVW328SGOZ+VESiqCbhoNNpQC4IO+nNV0TZbcy07/WGfhjssC/2VPGGlqoOTK/NyZbzAYmLJpfDpiEpjBjOsTGHZWmIAj0FDNSdtAFessSx7GB4rfg5Kz5RDuqLBdQA48dc6MJiJRtguPbffJ5ERSYK9lgMHqrKmHmeJWm+NE8iYpkStHaYQtNOYjtqD8bJ61RngSiOzOdcf6xsqC0oER8Ke5htFBaCuTka4TZXWtB457lAgq1R1VyJ2lPHYG0bAuHYRRQKtoVWkRwrL4Zj6aSUMBsuMoxz4sejBKvP0xRiShkPxL1Hj0/KpXWgmUVlf7ZvJnv1R80sAnZLudlYYCTyka+TcKzdLR1LONZAk4ihFvDtJc3NQownDT7gy4hu3KrSQOBurRgCPaNgf4eKcHiAIW3xoMS73N57J/LBXCTobtqAVv68Y4VUXIjtIW0pGkBkjOiwUwpqAjweRXv0esmqfBJywM/bq/JJ23SOZLUDowVZfh8f0e2+QLFnRaKw25uZ3UOEpCVc/NbaMAXxhsOjfxZ2OblrS4Gm1kdU3giZsnpPWraEYqF/z1RkySN59PzzJeiatM+8yfJ4LnUS4m57S3o0k31BExNg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:18.3095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e5505-fe60-4099-e4c0-08de5a682b5e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR10MB9424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021426_971335_CEF703A0 
X-CRM114-Status: GOOD (  12.27  )
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
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   2 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts      |  19 +++
 .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |   1 +
 .../dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts  |  25 +++
 .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  26 ++++
 .../boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi    | 100 ++++++++++++
 ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  27 ++++
 .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  27 ++++
 .../boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi |  97 ++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts      |  19 +++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts           | 151 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts      |   5 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  38 +++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts       |   1 +
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  | 119 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-odyssey.dts       |  21 +++
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi     |   5 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi   |   1 +
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    | 172 +++++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  55 +++++++
 .../boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    | 157 +++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi   |  50 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          | 122 +++++++++++++++
 28 files changed, 1297 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..ada55b2c1aa2 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -30,7 +30,7 @@ arm-pmu {
 		interrupt-parent = <&intc>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..b81b6e168b67 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -65,6 +65,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -85,3 +86,21 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
index df97e03d2a5a..4ad1313efca9 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts
@@ -92,6 +92,7 @@ bridge_out: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
index 60ce4425a7fd..ac4e313ca371 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
@@ -35,15 +35,40 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
index f8e404346396..cc24a29fba15 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts
@@ -92,6 +92,7 @@ bridge_out_panel: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -110,15 +111,40 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
index 569a7e940ecc..db93934019d1 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
@@ -61,6 +61,7 @@ vddcore: regulator-vddcore {
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd: regulator-vdd {
@@ -69,6 +70,7 @@ vdd: regulator-vdd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd_usb: regulator-vdd-usb {
@@ -77,6 +79,7 @@ vdd_usb: regulator-vdd-usb {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdda: regulator-vdda {
@@ -85,6 +88,7 @@ vdda: regulator-vdda {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vdd_ddr: regulator-vdd-ddr {
@@ -93,6 +97,7 @@ vdd_ddr: regulator-vdd-ddr {
 		regulator-min-microvolt = <1350000>;
 		regulator-max-microvolt = <1350000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vtt_ddr: regulator-vtt-ddr {
@@ -102,6 +107,7 @@ vtt_ddr: regulator-vtt-ddr {
 		regulator-max-microvolt = <675000>;
 		regulator-always-on;
 		vin-supply = <&vdd>;
+		bootph-all;
 	};
 
 	vref_ddr: regulator-vref-ddr {
@@ -111,6 +117,7 @@ vref_ddr: regulator-vref-ddr {
 		regulator-max-microvolt = <675000>;
 		regulator-always-on;
 		vin-supply = <&vdd>;
+		bootph-all;
 	};
 
 	vdd_sd: regulator-vdd-sd {
@@ -119,6 +126,7 @@ vdd_sd: regulator-vdd-sd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	v3v3: regulator-v3v3 {
@@ -127,6 +135,7 @@ v3v3: regulator-v3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	v2v8: regulator-v2v8 {
@@ -136,6 +145,7 @@ v2v8: regulator-v2v8 {
 		regulator-max-microvolt = <2800000>;
 		regulator-always-on;
 		vin-supply = <&v3v3>;
+		bootph-all;
 	};
 
 	v1v8: regulator-v1v8 {
@@ -145,13 +155,86 @@ v1v8: regulator-v1v8 {
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 		vin-supply = <&v3v3>;
+		bootph-all;
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
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
 	i2c-scl-falling-time-ns = <20>;
 	i2c-scl-rising-time-ns = <185>;
@@ -167,6 +250,7 @@ &ipcc {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -180,6 +264,22 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 5116a7785201..7bfd7da4a8db 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -78,6 +78,7 @@ &i2c2 {
 &ltdc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ltdc_pins>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -134,19 +135,45 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&vdd>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 /* J31: RS323 */
 &uart8 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
index d949559be020..a1f79659d7c5 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
@@ -36,19 +36,46 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
 	st,neg-edge;
 	vmmc-supply = <&vdd>;
+	bootph-all;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+		bias-pull-up;
+	};
+};
+
 /* J31: RS323 */
 &uart8 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
index a75f50cf7123..4f6f4712d634 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
@@ -61,6 +61,7 @@ vin: regulator-vin {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		bootph-all;
 	};
 
 	vddcore: regulator-vddcore {
@@ -70,6 +71,7 @@ vddcore: regulator-vddcore {
 		regulator-max-microvolt = <1200000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 
 	vdd: regulator-vdd {
@@ -79,6 +81,7 @@ vdd: regulator-vdd {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 
 	vddq_ddr: regulator-vddq-ddr {
@@ -88,9 +91,34 @@ vddq_ddr: regulator-vddq-ddr {
 		regulator-max-microvolt = <1350000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+		bootph-all;
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
 };
@@ -113,12 +141,61 @@ nand@0 {
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
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -132,6 +209,26 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
+&pwr_regulators {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 43280289759d..e192d033626e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -71,6 +71,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -91,3 +92,7 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1ec3b8f2faa9..bf9fdf0d611c 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -80,6 +80,7 @@ touchscreen@38 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..f053a70cb254 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -70,6 +70,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -90,3 +91,21 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index f6c478dbd041..86919bb642fa 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -132,6 +132,31 @@ channel@6 {
 	};
 };
 
+
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -157,6 +182,54 @@ &dts {
 	status = "okay";
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
 &hash1 {
 	status = "okay";
 };
@@ -168,7 +241,9 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
+
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -179,6 +254,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -314,12 +390,20 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -335,9 +419,26 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
 };
 
 &rng1 {
@@ -365,9 +466,30 @@ &sdmmc1 {
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
@@ -381,9 +503,27 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &timers6 {
 	status = "okay";
 	/* spare dmas for other usage */
@@ -399,11 +539,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	vbus-supply = <&vbus_otg>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..17295d67ab85 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -75,6 +75,7 @@ &m4_rproc {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &rcc {
@@ -95,3 +96,7 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&scmi {
+	bootph-some-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..d43bddc42ad9 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -231,6 +231,7 @@ &i2c5 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -262,6 +263,7 @@ &qspi_bk2_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -271,6 +273,7 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-pre-ram;
 	};
 
 	flash1: flash@1 {
@@ -283,6 +286,41 @@ flash1: flash@1 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
index eada9cf257be..9f513045c559 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts
@@ -158,6 +158,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_c>;
 	pinctrl-1 = <&ltdc_sleep_pins_c>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
index cf7485251490..1c5517f57ecd 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
@@ -75,11 +75,84 @@ led-blue {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -91,6 +164,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -218,12 +292,20 @@ watchdog {
 	};
 };
 
+&i2c2_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -237,6 +319,26 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
+&pwr_regulators {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rng1 {
 	status = "okay";
 };
@@ -258,6 +360,23 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_d {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
index a8b3f7a54703..92bc25b3f563 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-odyssey.dts
@@ -75,14 +75,35 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
index 36e6055b5665..b404ea3752d9 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
@@ -131,6 +131,7 @@ i2s2_endpoint: endpoint {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
index 89de85a2eff3..5d29c2154b46 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -87,6 +87,7 @@ &mdma1 {
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	bootph-some-ram;
 };
 
 &pwr_regulators {
@@ -114,6 +115,10 @@ &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
 
+&scmi {
+	bootph-some-ram;
+};
+
 &scmi_reguls {
 	scmi_vddcore: regulator@3 {
 		reg = <VOLTD_SCMI_STPMIC1_BUCK1>;
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
index 8fa61e54d026..4d857b3575fd 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -97,6 +97,7 @@ stpmic@33 {
 };
 
 &ltdc {
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index 5c77202ee196..2e02cd8e7e0d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -201,6 +201,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_b>;
 	pinctrl-1 = <&ltdc_sleep_pins_b>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 4cc633683c6b..2c40ceaf1f33 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -103,6 +103,10 @@ channel@1 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -121,6 +125,26 @@ dac2: dac@2 {
 	};
 };
 
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &dts {
 	status = "okay";
 };
@@ -190,6 +214,7 @@ &gpioa {
 			  "", "", "DHCOM-K", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiob {
@@ -197,6 +222,7 @@ &gpiob {
 			  "", "", "", "",
 			  "DHCOM-Q", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpioc {
@@ -204,6 +230,7 @@ &gpioc {
 			  "", "", "DHCOM-E", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiod {
@@ -211,6 +238,7 @@ &gpiod {
 			  "", "", "DHCOM-B", "",
 			  "", "", "", "DHCOM-F",
 			  "DHCOM-D", "", "", "";
+	bootph-all;
 };
 
 &gpioe {
@@ -218,6 +246,7 @@ &gpioe {
 			  "", "", "DHCOM-P", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiof {
@@ -225,6 +254,7 @@ &gpiof {
 			  "", "", "", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpiog {
@@ -232,6 +262,7 @@ &gpiog {
 			  "", "", "", "",
 			  "DHCOM-L", "", "", "",
 			  "", "", "", "";
+	bootph-all;
 };
 
 &gpioh {
@@ -239,6 +270,7 @@ &gpioh {
 			  "", "", "", "DHCOM-N",
 			  "DHCOM-J", "DHCOM-W", "DHCOM-V", "DHCOM-U",
 			  "DHCOM-T", "", "DHCOM-S", "";
+	bootph-all;
 };
 
 &gpioi {
@@ -246,6 +278,20 @@ &gpioi {
 			  "DHCOM-R", "DHCOM-M", "", "",
 			  "", "", "", "",
 			  "", "", "", "";
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+
+};
+
+&gpiok {
+	bootph-all;
+};
+
+&gpioz {
+	bootph-all;
 };
 
 &i2c4 {
@@ -253,6 +299,8 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
+	bootph-pre-ram;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -269,6 +317,8 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
+		bootph-pre-ram;
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -279,6 +329,7 @@ regulators {
 			ldo6-supply = <&v3v3>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
+			bootph-pre-ram;
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
@@ -409,12 +460,20 @@ eeprom@50 {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -428,9 +487,22 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
 };
 
 &qspi {
@@ -444,6 +516,7 @@ &qspi_bk1_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -453,6 +526,28 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-pre-ram;
+	};
+};
+
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
 	};
 };
 
@@ -469,6 +564,15 @@ &rcc {
 	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
 	assigned-clock-parents = <&rcc PLL4_P>;
 	assigned-clock-rates = <50000000>, <100000000>;
+	bootph-all;
+};
+
+&reg11 {
+	bootph-pre-ram;
+};
+
+&reg18 {
+	bootph-pre-ram;
 };
 
 &rng1 {
@@ -495,6 +599,7 @@ &sdmmc1 {
 	st,ckin-gpios = <&gpioe 4 0>;
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -504,11 +609,24 @@ &sdmmc1_b4_pins_a {
 	 * - optional on SoMs with SD voltage translator
 	 * - mandatory on SoMs without SD voltage translator
 	 */
+	bootph-pre-ram;
 	pins1 {
 		bias-pull-up;
+		bootph-pre-ram;
 	};
 	pins2 {
 		bias-pull-up;
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
 	};
 };
 
@@ -525,9 +643,24 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -545,7 +678,46 @@ &sdmmc3 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
+&usb33 {
+	bootph-pre-ram;
+};
+
+&usbotg_hs_pins_a {
+	bootph-pre-ram;
+};
+
+&usbotg_hs {
+	bootph-pre-ram;
+};
+
+&usbphyc {
+	bootph-pre-ram;
+};
+
+&usbphyc_port0 {
+	bootph-pre-ram;
+};
+
+&usbphyc_port1 {
+	bootph-pre-ram;
+};
+
+&vdd_usb {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index aceeff6c38ba..e7e2203ab11a 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -355,6 +355,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_d>;
 	pinctrl-1 = <&ltdc_sleep_pins_d>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -402,9 +403,30 @@ &sdmmc1 {
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&sd_switch>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -418,9 +440,27 @@ &sdmmc2 {
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd_io>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_b>;
@@ -455,11 +495,22 @@ &uart4 {
 	label = "LS-UART1";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	/* On Low speed expansion header */
 	label = "LS-UART0";
@@ -512,3 +563,7 @@ &usbphyc_port0 {
 &usbphyc_port1 {
 	phy-supply = <&vdd_usb>;
 };
+
+&vdd_io {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
index bc4ddcbdd5cf..9c6a04b4c2e3 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -231,9 +231,30 @@ &sdmmc1 {	/* MicroSD */
 	bus-width = <4>;
 	vmmc-supply = <&vdd>;
 	vqmmc-supply = <&vdd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {	/* eMMC */
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -246,9 +267,27 @@ &sdmmc2 {	/* eMMC */
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {	/* SDIO Wi-Fi */
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -276,11 +315,22 @@ &uart4 {
 	label = "UART0";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_d>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_d {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart5 {	/* X11 UART */
 	label = "X11-UART5";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
index 89881a26c614..3d469e29d41a 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
@@ -63,6 +63,30 @@ retram: retram@38000000 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -71,11 +95,61 @@ &dts {
 	status = "okay";
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
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	bootph-all;
+	bootph-pre-ram;
 	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -86,6 +160,8 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
+		bootph-pre-ram;
 		status = "okay";
 
 		regulators {
@@ -98,6 +174,7 @@ regulators {
 			ldo6-supply = <&v3v3>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
+			bootph-pre-ram;
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
@@ -215,12 +292,20 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -234,9 +319,23 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+	bootph-pre-ram;
 };
 
 &qspi {
@@ -250,6 +349,7 @@ &qspi_bk1_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -262,6 +362,35 @@ flash0: flash@0 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&reg11 {
+	bootph-pre-ram;
+};
+
+&reg18 {
+	bootph-pre-ram;
+};
+
 &rng1 {
 	status = "okay";
 };
@@ -269,3 +398,31 @@ &rng1 {
 &rtc {
 	status = "okay";
 };
+
+&usb33 {
+	bootph-pre-ram;
+};
+
+&usbotg_hs_pins_a {
+	bootph-pre-ram;
+};
+
+&usbotg_hs {
+	bootph-pre-ram;
+};
+
+&usbphyc {
+	bootph-pre-ram;
+};
+
+&usbphyc_port0 {
+	bootph-pre-ram;
+};
+
+&usbphyc_port1 {
+	bootph-pre-ram;
+};
+
+&vdd_usb {
+	bootph-pre-ram;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
index 6e79c4b6fe32..3b5debd0ffc9 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi
@@ -131,9 +131,30 @@ &sdmmc1 {
 	bus-width = <4>;
 	vmmc-supply = <&vdd_sd>;
 	vqmmc-supply = <&sd_switch>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_b {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_c>;
@@ -147,17 +168,46 @@ &sdmmc2 {
 	st,neg-edge;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_c {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart7_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 8cea6facd27b..62d6417ed422 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -129,6 +129,10 @@ channel@19 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &cec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cec_pins_b>;
@@ -136,6 +140,26 @@ &cec {
 	status = "okay";
 };
 
+&clk_hse {
+	bootph-all;
+};
+
+&clk_hsi {
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_lsi {
+	bootph-all;
+};
+
+&clk_csi {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -144,6 +168,54 @@ &dts {
 	status = "okay";
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
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
@@ -249,6 +321,7 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
@@ -284,6 +357,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -422,6 +496,13 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &i2c5 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c5_pins_a>;
@@ -458,6 +539,7 @@ &ipcc {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -465,6 +547,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -486,9 +569,26 @@ &m4_rproc {
 	status = "okay";
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
+	bootph-some-ram;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
 };
 
 &rng1 {
@@ -553,9 +653,20 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;
@@ -676,11 +787,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart7 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart7_pins_c>;

-- 
2.43.0


