Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543BC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCFRZNqGe3is/ViIStqYPnU9TnbOHttvT64I2b+T2i4=; b=MgZxAOLtgMSKOf5hAVPgVVW+0V
	JgSVgrQnoRhb8ZacozxcI2jLV6clfCEQSj2xvu4ygujJkBDgF0qBQ332e4fPLZbQofCil7eDFICS2
	rRbucVHhCUXeBEG3cMTz4D+NeDgpuQAtcI9tAfwPOSLUoHItnrIgMEEuD7rxih/Lxx34bz7+W9bjD
	QDSMUm5TIDgHm/49zkj+w74VoDs/UvVEyxq3SV0WfqQ6QjAl3d/FuafM6OrnfoRiKifXI+wkjzQvj
	11pYUuz/i0yvZGsS6xOjUy8pjyveeil9hZ4AeS11RTF69YRbshCx/MFF6dp3ZwA1+iX0j4QC9ZHE9
	conabKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWq-0000000GIKp-03YG;
	Wed, 07 May 2025 17:25:56 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChA0-0000000G4Az-0jUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:58:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EKOTjDfYxeKP7/gQ/77lnRo0ewYZTHpJM7sjSUNqWNeQ2I2HZFenDBQh+zgCQw1wNpKj8FVD9hBrKA1pEfJVXA2Yiwv9pDc9E2ezf0+btOpn3QxT/kvQJ1w19/s0hhg+0SgmhHf88yPDIUg3ZKGu5x4W2GCWSBlMClCIqn5poyHSsuWbhPe8IjJZOpJIFkK3UXj/lIBzG+HjV2XXVZIXicOCIKpzJNdHEUasJIyimyJmgWD5JXPjHEPgUpfQ7iEGRB5LZq+JsRW8eYQ7kLdXcE2S4OHpgD7kwTfqzesbTUBwO6J6Aw2Z7HiVr7GOmj8leLDAdoG94TJe3skLgs/b4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCFRZNqGe3is/ViIStqYPnU9TnbOHttvT64I2b+T2i4=;
 b=abD/C40+x9f+kOzZ1GEgvSmBW8xFdyOaW8/TXPd4mkhMNm2WANF+gCCsSWhegA1SWiEcs+gvNM8948MLosy24vrry+UiubLE7CpXNAvyzcbo/ttEk+N3IURk1CDSvVcCkdV0lN/ZxHRGq8pqR2ZzlZ2XfljGovdZyY+LeMSObF3myDnLbSXSD/aNr8Fldz3gaLrukyo5FD4w0gzIEtu/y+bjHMQOyWq6/2J0WWXHPhtLFCl/9gA3dM+M97FlXjKR10apF0dPMypJk6d2Dcxvy3g9LJevk2TLxNuL3AaGD3FS14zzcyf95NwBtdTSCsbTxWKkAg6icnE1vFg9qmubFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCFRZNqGe3is/ViIStqYPnU9TnbOHttvT64I2b+T2i4=;
 b=A7rota3Ke64jgvPctNvdr/cK4708CdHAva5RpgIDFEuzwMQa+ycbm+c7arJsHq+Z7vxEcLmROba5YNQfkCg4tVx5eCB0piZ4M3tVSILBop7vy6Gmj3F7tGpzb/6mEN3q0czajNYMxcPt5wDZcV00u1BKgUtKLt0Uc5Q7MwK/kZU=
Received: from AM0PR03CA0064.eurprd03.prod.outlook.com (2603:10a6:208::41) by
 DB4PR08MB8101.eurprd08.prod.outlook.com (2603:10a6:10:387::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.20; Wed, 7 May 2025 15:57:57 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::7e) by AM0PR03CA0064.outlook.office365.com
 (2603:10a6:208::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 15:57:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 15:57:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfTlqwistDj2OovV92HsWxBkQ/Uj5EO78IU02CSQMxYwbZh7FckX//j6XiQ3vHMHyvaDXf9bkrOU2FdyOx7+HJGrLJdVJESGFIzBj/0h8Ry3WPqddCRNOH5CsMREtR9Xb1yjSeBhmKpOTp2OppLScHo82+3/tNb8ghLaKcfrfwym60Uv4v5ofo07w3F9hUb9/uTtHsTDVV0fdm1Hg1A/qW1xXNh8jSucs8S2uxXiUCyLWKiuDR1fSiB7j2/uFJj2Q7uivBwnz3MTwnBhSD2ER7Q95hVu/HUtPiCIrhDaOVKoxh4UW0hgBqHE/0JJuzCR/Yen/xLGvjEL/61bgBtVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCFRZNqGe3is/ViIStqYPnU9TnbOHttvT64I2b+T2i4=;
 b=QYEBr8OtPqnFBMhLzY9H+e5USLsS5AJ7+bfryThsBMyGGISOQVLyvJWPvweZGaLGGIs0FOU1p5NSBoS86OSdiY53vparlR4kyBTgvO60dssrOLRW/DscA97tNG1NLUa8Rc+i5zgtlnW27rW5vzEPR4iCc66q94POhiHu1qwdLaRQjsH5rIYoWhsykClDDnXwN6azDHVET/7olP5cbzqXbM+dM2JmOu5HKDcTOrmZ2tds/e4j+A7HJZz2GEf/pWvRG412whks4LQZpfeKb7yf2N69z+aw0+6eIM+U+wLFepbxCdictwTe6JxzuzXlRaKD6pTUR6VsbBW3H8kxjkUBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCFRZNqGe3is/ViIStqYPnU9TnbOHttvT64I2b+T2i4=;
 b=A7rota3Ke64jgvPctNvdr/cK4708CdHAva5RpgIDFEuzwMQa+ycbm+c7arJsHq+Z7vxEcLmROba5YNQfkCg4tVx5eCB0piZ4M3tVSILBop7vy6Gmj3F7tGpzb/6mEN3q0czajNYMxcPt5wDZcV00u1BKgUtKLt0Uc5Q7MwK/kZU=
Received: from AS9PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:20b:48b::26)
 by PA6PR08MB10624.eurprd08.prod.outlook.com (2603:10a6:102:3d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 15:57:21 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:48b:cafe::3a) by AS9PR04CA0084.outlook.office365.com
 (2603:10a6:20b:48b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 15:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 15:57:21 +0000
Received: from AZ-NEU-EX05.Arm.com (10.240.25.133) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 15:57:19 +0000
Received: from arm.com (10.1.35.47) by mail.arm.com (10.240.25.133) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 15:57:19 +0000
Date: Wed, 7 May 2025 16:57:18 +0100
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <broonie@kernel.org>,
	<catalin.marinas@arm.com>, <daniel.kiss@arm.com>, <david.spickett@arm.com>,
	<luis.machado@arm.com>, <maz@kernel.org>, <richard.sandiford@arm.com>,
	<sander.desmalen@arm.com>, <tabba@google.com>, <tamas.petz@arm.com>,
	<tkjos@google.com>, <will@kernel.org>
Subject: Re: [PATCH 13/20] arm64/fpsimd: Make clone() compatible with ZA lazy
 saving
Message-ID: <aBuC3ncUQeq-Ki5p@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-14-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-14-mark.rutland@arm.com>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|PA6PR08MB10624:EE_|AM3PEPF0000A796:EE_|DB4PR08MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb5e4df-8f64-45f0-ca35-08dd8d7fef00
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?fCx4w69VbtznqpKPGGQS4XVen/vLzSwnitDjIIH2LDvc9D868uERKJJsNyAR?=
 =?us-ascii?Q?pLqNArslPoxlbJCEQNtsqMBBhWNG6VzuRc5vOuDEp45oAE9o2dRq/BWpU+Lw?=
 =?us-ascii?Q?LPjbHbKFVxC43lCJiYpKX9fpKLhff6n+HtZ2i27sVoMV/kbGSlMp54PrZ4yf?=
 =?us-ascii?Q?0rJ6IM9ptUSVZ47yfd4MFDRcN19/Kn4Td7Y6a1sXN0c4u2Sv3nGJOkgzs+sy?=
 =?us-ascii?Q?UrgmpXm5u8wGCtdzZlb2Otzy+mN3gGPUfgE6uN6lyjRddWZpuhJZBoEjDZnO?=
 =?us-ascii?Q?RQNTm+fx5om0M94JG4tz7LCzN6TvCBHRy07yU86cK6GtJj8FVFwRUgyfl8WJ?=
 =?us-ascii?Q?w4wetngsauME9eDX81562L6wFnIAOdMwZuKiWpgvF/OWahymixaR40IMaQkA?=
 =?us-ascii?Q?3Kbd34rCqb0lmDOJjNpXMQEGEXfUpoJ7RM+Yo9Sr+AX7vZksUw7GgwLt5a9Z?=
 =?us-ascii?Q?gi3NBBCQdeJw6hmDbmfGyKUvACaOokqphQB93fEhgeUEub7E6h6zNugZSTnI?=
 =?us-ascii?Q?Jp0rOw7EFC2u4pAva96obx+xaYNuoHMft335Gzxthpe2PZjHYIEvURFjhl4b?=
 =?us-ascii?Q?OZWpcZ8Xr8fEx8LWW+UWYTd5KzMnf5OnQ3BBiifyGllK9f4wReVwuvh1D8K7?=
 =?us-ascii?Q?ueLx+rr7UtaBcn7bHIcrwYRu5ZJkIiZ7bK7dhR6zSx6TXef4Pj8/V320uoP1?=
 =?us-ascii?Q?evQFhPjRkMBHyUR/z40a01cd6Q8m7PC5meEeEvBvAZI4srEiU423OrIIyacU?=
 =?us-ascii?Q?RkD3CTuDsAyoHKjly+IMZ7Sr4ojF5BiMemTAaIT63QNeIcNPSaY5Y64jo547?=
 =?us-ascii?Q?JQ9Xt9m1ZxZT/jF4D0kcmH24fO7DnY0B3GSDvZWWJGMv/kUpkqOWEYda/EbA?=
 =?us-ascii?Q?dgTx20Uzux+oI+Pp+67FfB5J6vfrnf+NKSRdohY4mXhch7/XDOdnuNtCNTFQ?=
 =?us-ascii?Q?ceDMsb/dUZZ9gIPrbniH1S4Cfya98lYGDxBVMuTfuRsdQmCIL9UubZGqbHsu?=
 =?us-ascii?Q?t0tJUXGCVoyP9SD6iz/2cwr9SGNq02Sjyq80tJrCCzUI8/DZe6umnYaul5lE?=
 =?us-ascii?Q?+CIw3hbcf0/4hD18T6f4kEF7aC/ssZEcQi4r74Sfh60C/35LIGhZBhgsy2PW?=
 =?us-ascii?Q?CuBVJOcISnxruPu5OvvNyuJUrno/anyMUkFxs1AFOcXg97HMz34oAkNagMXF?=
 =?us-ascii?Q?5x3SXzixJaJCea5EGzf5hb8pgS5bWT5h4LfpJHCS+vaxge8SPL9ZdhjVu0kD?=
 =?us-ascii?Q?uqqLQnljIJjbDig5piiJFYwpWuiCWvuGBxPhnNbph5qLZYnc7ZjXhEt+itGJ?=
 =?us-ascii?Q?/48/zQqqtG0dgWu7EptCF5tSZXePtFGjz/MuCJyOEX54IbVsj5HCfSD5t4YC?=
 =?us-ascii?Q?eBvX9WEwnGYvXpIyguohwZpPibvDsUC1caIm4KAjTZCTxB8crpSNXBMMaLbl?=
 =?us-ascii?Q?D2I4BofF8H36o+XJNja6aHVNlmKESLzyF3dpKa/0ewlhaGcaLLZK3RZsVu0f?=
 =?us-ascii?Q?bXcxI7lE1Pfi11mL13uad+Sb7CsT6isoIu04?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10624
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f2f97730-ef06-451d-5dd0-08dd8d7fd9e3
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wgy678ad2SQ4P8guuP63PJDlsVYjIELEtTsK00FRhgEhxW7rBdbLWuUX2wbW?=
 =?us-ascii?Q?jiTDWWc7aWWxOHfAwrYtv7pNoohetGw+Uq6+/GOBX6mJmlwiirtdRsDkrGeP?=
 =?us-ascii?Q?mTaNgiRm9PlnwGBnTP4TY3In0knvTK22xdRoYEjDVLsvPxCF85HqJwK96K97?=
 =?us-ascii?Q?Rox7HZNCEUZWDO73LH7E6WVXE0I09DkK5IyNTAtulQTXxgHJGC0JaVS4m64x?=
 =?us-ascii?Q?rtJGp4zF9L12ixueXENQIC+pNe1psRNV8RtKwAKEy0WmK1DGXQagEOLIqTxz?=
 =?us-ascii?Q?UkxN81gv42OQ7fGNckJrbjN/uXmUunMLFYQHShWrs72Xm8HWrLXyHQL8QWBw?=
 =?us-ascii?Q?iU9wNIdsjfxvRIPgF/Yh99W65dFC6Nxn57CEM5SzlxWG7RPVu1k6fjJWcoWR?=
 =?us-ascii?Q?5agSHKKjoFdnd8ZBTPN5+s71Xe4js2rUr7kgR7FKl3FLv7UEmT5hX/Km6+Xs?=
 =?us-ascii?Q?smklxrFf8Ykmu5PTG/KaZKiSNIyAASaWfEnQpXk8gKBnCCIh7oYGf+UJaSke?=
 =?us-ascii?Q?RfFtxqVEJ130B7PegCsTEX49Ltg4OcbLWTTQL82d+phRCcF4ehElqAFnGWtW?=
 =?us-ascii?Q?jth7oubmaY5N03vinqxaoBrAj5gUeem71wGT2Yq5XHTFVck1pSrQsXegAJef?=
 =?us-ascii?Q?cRSnCoqxYCt6+drEZ6x+2QT3CgEsjT3IAR4TQpYoSKRjqVXVMs9iBZ5/oQBb?=
 =?us-ascii?Q?wKYqAyvgw5c6sduew7wLCk0M7QGnZpJHwJaew5KpRy0c4DIQ0+SwBR+Vfp1L?=
 =?us-ascii?Q?7qdtb7XlLQWXdqs89MxOFzLTsn/erouYxDyPpEFYgsE77i27DGtxBH6GGrbZ?=
 =?us-ascii?Q?97DEfnzvai0Ok8LdzEXi7v+iJkdK/w42x/YrX/L/0oqGan8UcKW41esLCQDp?=
 =?us-ascii?Q?b4gHoL0Bt8UvI0LNpPbRNHjuXMx8vEc4RgMvw0vqEzx8nG1Cfh1/IhcOVj3l?=
 =?us-ascii?Q?Psdddx93pFS1BTxqNO8aTevBIGVz8XRlvGnfYiA5fW9SO/zEra2xOhKF0OS8?=
 =?us-ascii?Q?9+/IMNIcX4tEeCA4HrciH6WlqvqZZMxfM06gc8vlPDO0hdvxS+oU8BalmAC9?=
 =?us-ascii?Q?LJSQ+lJIUWvUn0lbAxEUulDaLqXuIDWb+i8YZSdXGEnB/iezVUFH3aRuX8dZ?=
 =?us-ascii?Q?IdjMZbyFI0w/R4z4uAsAN4ShquQpa0PWhztEC17L4DeW11lshGryhtFZ0aXl?=
 =?us-ascii?Q?Np7iHWzfxbZO/xeybH9U7Mp60V2fO00r+d90RbTeDAj46R/nzUIpI8MGAaq9?=
 =?us-ascii?Q?AfUx4X0vqdjjzhPv4YMTOBrT216R9ZTfqJreIqlkOThpzvgKt3ziSZVR8Vqg?=
 =?us-ascii?Q?D44X48zzwEKBho6A4jH8NSEaMRrL95pRSScrbjN4mR74rCFYURUIbvQbMbNV?=
 =?us-ascii?Q?MNxZbiNPgNtA6Oyw7n7KBHH0hVcJMS3ddzlKWcG1fNAkHgX/C8zMEL0c3yFt?=
 =?us-ascii?Q?ToqAKK9SbyrBQH+s1c99BKYYWcO6l29XRu5lzEfhPFVD0MGDEmoNFNL7hWwf?=
 =?us-ascii?Q?QLbdnWnPHKLojZTFIcyU3/TeAXtJpxnakaba?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:57:56.5789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb5e4df-8f64-45f0-ca35-08dd8d7fef00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_085816_504507_4C8343C8 
X-CRM114-Status: GOOD (  20.87  )
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

On Tue, May 06, 2025 at 04:25:16PM +0100, Mark Rutland wrote:
> Linux is intended to be compatible with userspace written to Arm's
> AAPCS64 procedure call standard [1,2]. For the Scalable Matrix Extension
> (SME), AAPCS64 was extended with a "ZA lazy saving scheme", where SME's
> ZA tile is lazily callee-saved and caller-restored. In this scheme,
> TPIDR2_EL0 indicates whether the ZA tile is live or has been saved by
> pointing to a "TPIDR2 block" in memory, which has a "za_save_buffer"
> pointer. This scheme has been implemented in GCC and LLVM, with
> necessary runtime support implemented in glibc and bionic.
> 
> AAPCS64 does not specify how the ZA lazy saving scheme is expected to
> interact with thread creation mechanisms such as fork() and
> pthread_create(), which would be implemented in terms of the Linux clone
> syscall. The behaviour implemented by Linux and glibc/bionic doesn't
> always compose safely, as explained below.
> 
> Currently the clone syscall is implemented such that PSTATE.ZA and the
> ZA tile are always inherited by the new task, and TPIDR2_EL0 is
> inherited unless the 'flags' argument includes CLONE_SETTLS,
> in which case TPIDR2_EL0 is set to 0/NULL. This doesn't make much sense:
> 
> (a) TPIDR2_EL0 is part of the calling convention, and changes as control
>     is passed between functions. It is *NOT* used for thread local
>     storage, despite superficial similarity to TPIDR_EL0, which is is
>     used as the TLS register.
> 
> (b) TPIDR2_EL0 and PSTATE.ZA are tightly coupled in the procedure call
>     standard, and some combinations of states are illegal. In general,
>     manipulating the two independently is not guaranteed to be safe.
> 
> In practice, code which is compliant with the procedure call standard
> may issue a clone syscall while in the "ZA dormant" state, where
> PSTATE.ZA==1 and TPIDR2_EL0 is non-null and indicates that ZA needs to
> be saved. This can cause a variety of problems, including:
> 
> * If the implementation of pthread_create() passes CLONE_SETTLS, the
>   new thread will start with PSTATE.ZA==1 and TPIDR2==NULL. Per the
>   procedure call standard this is not a legitimate state for most
>   functions. This can cause data corruption (e.g. as code may rely on
>   PSTATE.ZA being 0 to guarantee that an SMSTART ZA instruction will
>   zero the ZA tile contents), and may result in other undefined
>   behaviour.
> 
> * If the implementation of pthread_create() does not pass CLONE_SETTLS, the
>   new thread will start with PSTATE.ZA==1 and TPIDR2 pointing to a
>   TPIDR2 block on the parent thread's stack. This can result in a
>   variety of problems, e.g.
> 
>   - The child may write back to the parent's za_save_buffer, corrupting
>     its contents.
> 
>   - The child may read from the TPIDR2 block after the parent has reused
>     this memory for something else, and consequently the child may abort
>     or clobber arbitrary memory.
> 
> Ideally we'd require that userspace ensures that a task is in the "ZA
> off" state (with PSTATE.ZA==0 and TPIDR2_EL0==NULL) prior to issuing a
> clone syscall, and have the kernel force this state for new threads.
> Unfortunately, contemporary C libraries do not do this, and simply
> forcing this state within the implementation of clone would break
> fork().
> 
> Instead, we can bodge around this by considering the CLONE_VM flag, and
> mainpulate PSTATE.ZA and TPIDR2_EL0 as a pair. CLONE_VM indicates that
> the new task will run in the same address space as its parent, and in
> that case it doesn't make sense to inherit a stale pointer to the
> parent's TPIDR2 block:
> 
> * For fork(), CLONE_VM will not be set, and it is safe to inherit both
>   PSTATE.ZA and TPIDR2_EL0 as the new task will have its own copy of the
>   address space, and cannot clobber its parent's stack.
> 
> * For pthread_create() and vfork(), CLONE_VM will be set, and discarding
>   PSTATE.ZA and TPIDR2_EL0 for the new task doesn't break any existing
>   assumptions in userspace.

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>

Kind regards,
Yury


