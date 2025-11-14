Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9BCE8D60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7vEuJq+SIJtMluKoppGMWqbrYTlvD8iGiEmc5vODzc=; b=WMlvKRC3E1H3dYl1HOSs0d215F
	Nrr6dAnFzDXEJsJl88HOvL/DpD4hln8VVCmTlDYmFtscn6k15OwP4yELuOojYrA9GWFCgb2p6PHsF
	73QyRckvwUJc3KSvy/ulzKL7wUdnTxUyHTH+qf00fMgInHsxMF1BEcYnBxkgw5eysxbaO1Nt4eS+K
	USJG6sjarIpyn+l/FftxYbbMzYhmG2AFD9F4jGw5rBgqzM+E+qlvNa1KiVgLwDV5gRVvhM/0LBMkY
	QZO1cUGDoixG99LdCXxR4kpINhRGhShwZAecUsAjiz1qkWtZcWzBi6K0CJrxPo6TKC3/hxA34szvl
	J5w+qFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZC-0000000Cq1j-1bDi;
	Fri, 14 Nov 2025 17:26:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ8-0000000CpyW-1NHJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=l7vEuJq+SIJtMluKoppGMWqbrYTlvD8iGiEmc5vODzc=; b=W42c7bFH9CK4A6rxYH10agZA0A
	yyTY65BeYlP7/dtERXPvozXSaKmkmE4TH34itUs8aSxApVxJph5pWCZk3ui1RYs8P/EE/OtvYBAyO
	rWSOEOn07NGS7oEvWWA6xE4IbtD4xJKyorqnGwFwdnXA/Q/TzF/m7o+pqwc7fxth4JxLVyRr57UbS
	gZAgswkcz/ph6EX/rp19pDKdYoENIgpd85s6zw7hJhxyKYhMf477wOQX7SLVIq19dLKjKmXBpYlTp
	GsQHtNA8dBG5YczT4txk0z2S0NUE7WLJq9S3PzEvuzp4yLrT8pEe79jA1mOuuSErt69rL8+PAr5wF
	ydRJ3uaA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwhQ-000000037qx-0LDh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:31:02 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEHLpjY2789581;
	Fri, 14 Nov 2025 18:26:19 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pc2pv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdv/LRGWuK1UinGwR7YDLwl1epMpC/X881+BJ3XnoNbd+3ft2bzJzZ6gsmHaEC8ZQOmp2JafBRps0mnoKkdu8VCDso6kGiV8gwAYI9qJeR4DgAsij3F9Y50XUlC4yU0Bs3Uj9DEP63A0xs2RyLuTFtaV/QUlxwu5d3BgagktZhrRAJzup9/glvYGZnz0zSCkfLQ9sCxmz/D9m8ZogmuRl/BYf9KCXKGj3vYQPWrxnkPtyyF8DYr5Xfjze3uQDhRFb00UmgaarM0XvB7nGn52q79F+4RymXA4XTK2lU3llGkQFgFPyV10/oVF8QCwB1Ft2tPguTVhSznEVc35iIQkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7vEuJq+SIJtMluKoppGMWqbrYTlvD8iGiEmc5vODzc=;
 b=Xqfn+nj6bs0PYU9VJIaqo2wQsvlbj35Mz/RKLBEnKh2FDOYfcKng3qEHQx5F9Q7NJ0jm7LA29IoZLsp8iPuQ33XTRMXsTZ0+n1QL/YP+02p9DyZhCz1TTnIb4EhxOwEmFKy89Ov4U1eIhcIZYd2MlsWZNmzkCr89ef+Uuu7LbwvxFcz3pD79eP3ZAEXTfaMoeQj4XiN9jmns3kpABIpX7H+2WYuaCI1KURCNUrep4hCqEayISCgHmZVdsXkZP+CxSX7RpjxehVPRYXPJf+gv74VU3ndZz2OnPtJ38ghRC0579lpI3eAHZMajWfByuR74creomzGPjDKWU5Hzvt8h8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7vEuJq+SIJtMluKoppGMWqbrYTlvD8iGiEmc5vODzc=;
 b=dpnC1OKBhEtPd9zjBnQ+JWWfBBvwa15vqfuiRIVM7j4EENmTv9qJi+F5R6FMtJXJh99wLsXb1X42o0EhkZKAYFCxXaOGAI76/PK7M58BeTlpeBJZGi3uMKztPgUhvLVWUqMkQkqQgC29WkikWEdb6lU0J0vUnelXBOwUidIm8eleBOuiKUQC7MiKx+sHAZYEjoYY7xhtoUhWeV7N4fRyArP1Lk3LpvTu7NSjSi81pZ3kHIXg6YifpSHOS3/gnx/uW+ZgpdjibMoA7uq7EyfGwTpTldbLLYZkwsId9rVa0sRkJpt+byc19RkCE+KqgxeBEaFdVFQeEgWqEudKRDcnbg==
Received: from DUZPR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::15) by AM0PR10MB3634.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:152::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:26:15 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::2f) by DUZPR01CA0103.outlook.office365.com
 (2603:10a6:10:4bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 17:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 14 Nov 2025 17:26:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:24 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:13 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:06 +0100
Subject: [PATCH v2 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-upstream_uboot_properties-v2-6-3784ff668ae0@foss.st.com>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
In-Reply-To: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|AM0PR10MB3634:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3ed8da-378d-4e8e-d88c-08de23a2e9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNrTWFTNjVQSjZ3YjNDVmNSRmxnRG1MSjBkTjNFZ3c1c3Nna3dZY2NsaXcz?=
 =?utf-8?B?UDRQQmxFRnNSY2huNHFoRStpaVpVa2NhNUpoRmQ5Y0dIZGNLM0lYamVnWG5x?=
 =?utf-8?B?T3dadEFRcWNCdHpuazh0ZTBkOTh5K09tL3RrZFM3cDJ5a285TUtVeGFocXdk?=
 =?utf-8?B?OVBLdk05NkNnZFZPN3lqTzlreFpwbVVrdEU0R0liSElSM3M5UUZPQVA4NTJo?=
 =?utf-8?B?Z0NRaTJycSs0WVVCTnFtaUdRWjVRTHpmcVNnNXJFN1Q4R2N2R1dsemNpeEJ0?=
 =?utf-8?B?bUlOS1M0YWVkSTI2SS94a2I2SE1YR2lHcmVveHcrQ2NVM3IycVdSSHdWdU5t?=
 =?utf-8?B?YkhVM1RoVWVjOStEY096MjZDV1kvTDRrR0Z3SjkwMHhhZ3Nkb3JQS3VkQ0Nx?=
 =?utf-8?B?SS9EcFdVVzNNS0lSalU2ZkVPTDQvTERHQXQxN2xNSHFRcisvUldmK24vWFkr?=
 =?utf-8?B?ZTJSSTYwNGZxeUpmckN1clBEVnBURTFZWkVVMm5tSE1BcW1iUFczRUxwQS9V?=
 =?utf-8?B?MlRONWF0aU0zVEl6d3lHSmZZWWJyUFBpWUx1T1JXMkR4OGxRd21ZeG84aEpX?=
 =?utf-8?B?eVNxMXFTcVhyWk41N0EyM3hlVVJZSlFpa2NxYTU3WDVFM082SUdDaEhLS1Ro?=
 =?utf-8?B?OFJzNFYwZWlwNmJFL0hNU1ZJYUp5a2Q1ZzFwb3ZGZHZBYUpIVk90YmFBUWc0?=
 =?utf-8?B?SjM1QWl6QkZvckMzdjMydUFXRHkxYjlmNEtINnd2SzEzMEhyTFZOYlpJMkVX?=
 =?utf-8?B?Z1pSdFFlbEFVSTNOTUhwdmFBUDdibW15TS8rOEVyNFFOWDBIYW9NeHJiV2JP?=
 =?utf-8?B?RU5xTjNROFpuT0tqbGhzV3VTYnJ2ZGtobFBJRUFnLy93MmUzNlBBMFhoV1p2?=
 =?utf-8?B?M1g0VnZJSzRRdXdBL0M5Nml3WWtmYlM2ZlVIV0JxcWpyOUZXVVVydUZYOENx?=
 =?utf-8?B?WEZqVzJWN1VVYjRLVVRMQWNTRDhTQ25MNDVCN3hqRWh6WWRwTjlYZklUSXpl?=
 =?utf-8?B?QmIwaXlITDZLOTYvV09maVY4N0wwUktmdmd1dE96S2Q0MFVyd24yUS9YSjZj?=
 =?utf-8?B?czNPZGltL2tHR1dCZmwzT0ExOWU0QzVIYnk0QXJNT0JqMGw5ZHVsMkRiRExJ?=
 =?utf-8?B?dFVhRUFLWFRtY2swRnArM0V5YXJFZTFJZndNTmNzd0hlcHJPTEVLWlpSMlRC?=
 =?utf-8?B?THJudTFsNkFmNDBKTTNnTkkxZ3pIaVh6OC9zSitZVVA4QlJPT2xVZGtkWCsy?=
 =?utf-8?B?N2tVT2RybEUzSHR6Q2VmaS83clh6ZWhXemRFUlZBdmFpTGFBUENxeFdHc2dS?=
 =?utf-8?B?T21WMFNnZWZadkg0aTZKT09RajZzQmxwenowUGgrUUhLWmE1bXZ5azE3eUpH?=
 =?utf-8?B?WEVtNHRSdW9NdmVUN3I0bzkvZGkzd0pucGh0K05XVnczSWVxSktkMDIrZEdX?=
 =?utf-8?B?UEx4cEIvd09XL04wU3gyNFcxcGpOOTM5WGVBRXU1RUM3TmF5N3JEQld4UmVk?=
 =?utf-8?B?akhCSE1oOGw0WnRLRnQvalZhMHpHY2VGTXpBRjhhSVFhbm1pcTRMaVZybE82?=
 =?utf-8?B?MkFVeTl6UVZTODFDdjY2a1F3YmlGbkFFRlhGbDVvWmRKZjhaSExrR3gwVGxx?=
 =?utf-8?B?SnpOMncrZnovU0RYQnY0YzRTUWFhc1hYR1o3NDhZNmN4U2FNZTl5UkM5WkNJ?=
 =?utf-8?B?UlV1ZFRzQlZ2dVF5K2lNZUlwckxlMnhxKzBKQWZ2czVJbFBkNkpqOW5qeHlN?=
 =?utf-8?B?elI5VlBFWEY5bEpSS0Y0Q3ZsWVhWazB1QXlBTVhrc1hsc1R3dlpha01jN0cy?=
 =?utf-8?B?T0syWXBSYXo2V3dZZmo0elJkNUpKRGx1L284aXpjWEIrbXZ5bWJuN3REeWQr?=
 =?utf-8?B?U2paUjBBSFhHTzhlNmlrZ0gySVBCUjczajVEQkxKY0JkeUhoSlNkUXZVQVhM?=
 =?utf-8?B?UEJuMHlHVUVOMGZMN2xjUnNoSUVvU0x5MVhmK0xiRkcvRjl6dTN2TW5rRkFU?=
 =?utf-8?B?VXZTa20vSWQvelFLOWtnTjZWNUZTS3ZwVjZKUDVqMHVXbGpIQ3dKVHVLMm9R?=
 =?utf-8?B?akljYndaVTJTOGhiODlqWithRFUrdHdBL2xqcDdwdlZzYU1MU2lkMU9QL3pJ?=
 =?utf-8?Q?ykB8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:14.6893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3ed8da-378d-4e8e-d88c-08de23a2e9d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfXxXR4oj0CvsDG
 uwc+W0SES0/rySufQv3XIUzmtylwwg7HSIGcOwVp4BR+B9WIWBSIfK8EFgQvXMKQ2yIKvTBjPzl
 MvGzuLCLSjh8c0542oEvsHudEUTK7rNbDkC6usocNV31NjIFIkx6jEXBAycOrZ88a3NEp9JteC6
 ABa49VE6IAjmuXW0GJU/LsH9dt4N/8Ksj5ut282FQyemZSaaJaX3ut7NPWXWUbd1NOeRgVjb64G
 +Pynaf+inWr3eB4a0mxX438+O7butzPvWY+VCBd6ag6/xNd4xpc+YDfDAsgmbVTufLolp7zO8Hq
 KBdMEP4FuonDzdNpBK/gbGpoCVFbtSEy0c33egUsA9LQa7MCKmUr2hfvjntLHhVmN6fnq4pS7Rj
 67H5hApS8fmruahZiwC3Y15uLJL6wA==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=6917663b cx=c_pps
 a=2LjHdM9d3nU5CJ51ne9XDg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GxMybOy8btpGL25TnCYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DZXvMor_j4VgGqHz2ChC-VF2eG-xw9ii
X-Proofpoint-GUID: DZXvMor_j4VgGqHz2ChC-VF2eG-xw9ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_163100_265189_7D9F18C5 
X-CRM114-Status: GOOD (  10.58  )
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
 arch/arm64/boot/dts/st/stm32mp211.dtsi     |  7 +++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi     | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi     | 26 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi     |  3 ++-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 11 +++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 11 +++++++++++
 8 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index bf888d60cd4f..81b6a71fc032 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -50,6 +50,7 @@ firmware {
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -57,15 +58,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 		};
 	};
@@ -73,6 +77,7 @@ scmi_reset: protocol@16 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 	};
 
 	timer {
@@ -92,6 +97,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <2>;
+		bootph-all;
 
 		rifsc: bus@42080000 {
 			compatible = "simple-bus";
@@ -100,6 +106,7 @@ rifsc: bus@42080000 {
 			dma-ranges;
 			#address-cells = <1>;
 			#size-cells = <2>;
+			bootph-all;
 
 			usart2: serial@400e0000 {
 				compatible = "st,stm32h7-uart";
diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index 7bdaeaa5ab0f..bc366639744a 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -45,5 +45,6 @@ &arm_wdt {
 };
 
 &usart2 {
+	bootph-all;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..075b4419d3ae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -57,6 +57,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -64,15 +65,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -114,6 +118,7 @@ scmi_vdda18adc: regulator@7 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		cpu0_pd: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -146,6 +151,7 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -223,6 +229,7 @@ rifsc: bus@42080000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
+			bootph-all;
 
 			i2s2: audio-controller@400b0000 {
 				compatible = "st,stm32mp25-i2s";
@@ -760,6 +767,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -857,6 +865,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -955,6 +964,7 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -965,6 +975,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
@@ -974,6 +985,7 @@ gpioa: gpio@44240000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -985,6 +997,7 @@ gpiob: gpio@44250000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -996,6 +1009,7 @@ gpioc: gpio@44260000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1007,6 +1021,7 @@ gpiod: gpio@44270000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1018,6 +1033,7 @@ gpioe: gpio@44280000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1029,6 +1045,7 @@ gpiof: gpio@44290000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1040,6 +1057,7 @@ gpiog: gpio@442a0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1051,6 +1069,7 @@ gpioh: gpio@442b0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1062,6 +1081,7 @@ gpioi: gpio@442c0000 {
 				#interrupt-cells = <2>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -1084,6 +1104,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				reg = <0 0x400>;
@@ -1094,6 +1115,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..391494eda5e6 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
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
index a8e6e0f77b83..f6576304f42f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -66,6 +66,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi {
@@ -73,15 +74,18 @@ scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -142,6 +146,7 @@ v2m0: v2m@48090000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-all;
 
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
@@ -174,6 +179,7 @@ soc@0 {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
+		bootph-all;
 
 		hpdma: dma-controller@40400000 {
 			compatible = "st,stm32mp25-dma3";
@@ -305,6 +311,7 @@ rifsc: bus@42080000 {
 			#size-cells = <1>;
 			#access-controller-cells = <1>;
 			ranges;
+			bootph-all;
 
 			timers2: timer@40000000 {
 				compatible = "st,stm32mp25-timers";
@@ -1569,6 +1576,7 @@ trigger@4 {
 			};
 
 			ltdc: display-controller@48010000 {
+				bootph-all;
 				compatible = "st,stm32mp251-ltdc";
 				reg = <0x48010000 0x400>;
 				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
@@ -1577,6 +1585,7 @@ ltdc: display-controller@48010000 {
 				clock-names = "lcd", "bus";
 				resets = <&rcc LTDC_R>;
 				access-controllers = <&rifsc 80>;
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1738,6 +1747,7 @@ bsec: efuse@44000000 {
 			reg = <0x44000000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp@24 {
 				reg = <0x24 0x4>;
@@ -1842,6 +1852,7 @@ rcc: clock-controller@44200000 {
 				<&scmi_clk CK_SCMI_PLL3>,
 				<&clk_dsi_txbyte>;
 				access-controllers = <&rifsc 156>;
+			bootph-all;
 		};
 
 		exti1: interrupt-controller@44220000 {
@@ -1941,6 +1952,7 @@ syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
 			#clock-cells = <0>;
+			bootph-all;
 		};
 
 		pinctrl: pinctrl@44240000 {
@@ -1951,6 +1963,7 @@ pinctrl: pinctrl@44240000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioa: gpio@44240000 {
 				gpio-controller;
@@ -1960,6 +1973,7 @@ gpioa: gpio@44240000 {
 				reg = <0x0 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1971,6 +1985,7 @@ gpiob: gpio@44250000 {
 				reg = <0x10000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1982,6 +1997,7 @@ gpioc: gpio@44260000 {
 				reg = <0x20000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1993,6 +2009,7 @@ gpiod: gpio@44270000 {
 				reg = <0x30000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2004,6 +2021,7 @@ gpioe: gpio@44280000 {
 				reg = <0x40000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2015,6 +2033,7 @@ gpiof: gpio@44290000 {
 				reg = <0x50000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2026,6 +2045,7 @@ gpiog: gpio@442a0000 {
 				reg = <0x60000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2037,6 +2057,7 @@ gpioh: gpio@442b0000 {
 				reg = <0x70000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2048,6 +2069,7 @@ gpioi: gpio@442c0000 {
 				reg = <0x80000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2059,6 +2081,7 @@ gpioj: gpio@442d0000 {
 				reg = <0x90000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOJ>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -2070,6 +2093,7 @@ gpiok: gpio@442e0000 {
 				reg = <0xa0000 0x400>;
 				clocks = <&scmi_clk CK_SCMI_GPIOK>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -2092,6 +2116,7 @@ pinctrl_z: pinctrl@46200000 {
 			interrupt-parent = <&exti1>;
 			st,syscfg = <&exti1 0x60 0xff>;
 			pins-are-numbered;
+			bootph-all;
 
 			gpioz: gpio@46200000 {
 				gpio-controller;
@@ -2102,6 +2127,7 @@ gpioz: gpio@46200000 {
 				clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..7b2e07613030 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -21,6 +21,7 @@ lvds: lvds@48060000 {
 		resets = <&rcc LVDS_R>;
 		access-controllers = <&rifsc 84>;
 		power-domains = <&CLUSTER_PD>;
+		bootph-all;
 		status = "disabled";
 	};
 
@@ -40,4 +41,4 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..69bac9e719d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -130,7 +130,18 @@ &usart2 {
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
index 6e165073f732..307b9692b00a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -477,11 +477,22 @@ &usart2 {
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


