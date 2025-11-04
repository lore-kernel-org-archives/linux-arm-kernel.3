Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D46CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=elcZ1hDLTVWPwBnO4V9Cg8yax3nYSzfnxU1Syqs+5U4=; b=gICTN27NuJ0eMz
	ngmFihJ2HgnMPk6q+vJFvmU6jPV/Hmy//Pl0d44KcEfnaHaD0PgOj9lUWshQnObr+wgddPCKNnBaX
	TC88Yw55v9+r7vDSSudVKVS9UasjfEqtEspgWBwE+B0+9p7HaVdrNfctDOuWWDCIxaJvlWinYW7NS
	pNmT0IFlcbtgD/zav58QCr1zBF44eZCEKkOqPJPF92uNWDPxg2lt2uC8TVOb0y+gb3/x0thKagpmG
	GVfV7o29PA/8rfQ31COZoahI6pIkU5nX/ZeMgqM75OYR8bFr6o8EAGpI373Wjmri/VdkLmQ5e3cfd
	9CLLX4izIoP3NawuWwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHUh-0000000BvJU-3FkY;
	Tue, 04 Nov 2025 13:54:43 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHUe-0000000BvJ8-0VE5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:54:42 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4DkaZc363474;
	Tue, 4 Nov 2025 14:54:24 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a7g6d8yue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 14:54:23 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq8KsniLbxCyKWVuB+x5A1mry8Oku+JpFPZSfeH0FtyLZyfuC5Z4iwvYc/SDCqETcmVglPXA3FB4Bjmuy7qluGpw+RUSWTrMO2vb5ItsrV/f9g+TmKoJUoAlhZf6yeJsuZW+rymZMolmFC85H+ltvxflT2TATTsugDKFHssWF62Py2iPZjTcPcISY4tBKph0F4AP5pXDjOscJR3SKwWQmV5/573ubgYBS1la6j/GbogOre4/ReUy2pg27zBDLq9NmYzXTaxh2m7iT0/eRl1beI+IYwEryqpibUrILLZkHQNrHfoBodHrmpzHP08RkfUC3MMh8B8Ej3yzumERmY9/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elcZ1hDLTVWPwBnO4V9Cg8yax3nYSzfnxU1Syqs+5U4=;
 b=a1cmN/bqVt1XMtlxjLtPAVj3e5zZ7Qk6d10TZCP3XIL6YR9Pj7gsU0M4Hrm6ExCUn42QnYXI24oaNW1MHBBB9XVdwA2tTXyDdl7meWv2EfnxaRAYZy+eCtFDJD6oBemE4hQMG4A7F3R7+1y0RQIaZIymSmSBoYWpfW+eO9Xy5Cn0a75iEjn1afpIJTr+iVvZ4VSZCHuI1abZeJ/BQw5ny/HZhUwSPQCfRR6SYZnRnKvspQsRgKilKf6LoIJXX3heZMGO6D3dCOnNsfxtcitgKJsR8FV5ZQJq3cajPMyysZiPpwrgdOK5MA28S8l4RmykWbD5iwmFTRIx6rg7pCdnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elcZ1hDLTVWPwBnO4V9Cg8yax3nYSzfnxU1Syqs+5U4=;
 b=Zel3CpzrPaSqo1Ua0tE2BpPoLiGFTNQVtG8WAW5ycDVeyhgWyjHf+0sB28zke0cnEkkpKwydCmsQ33gm4rgiXhxYxqd196INkvlOvjozyqRQBKWUIFCFcewohWa0rpsL65Af4VUszfpyXTvzD3W9Y8PfvsDRJzkjhF2Kw72dD7IDbbvTT7HgEx3rcZwVTBz1dFp24LpzAgyMhHWypH194uW0hRkbpZzYLQULSoiDkphB6wb2Q/DYbSRuPMn5xworFcJE4AjpSoDC5C7bgoktvaYeKsmkWOuXJTzvMhLr2z/0jVZFjuU/nVPkVIu0Pg4tG13Vx9HGUncdcT/6KGv73g==
Received: from DU2PR04CA0245.eurprd04.prod.outlook.com (2603:10a6:10:28e::10)
 by DU4PR10MB9096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:568::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 13:54:19 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::10) by DU2PR04CA0245.outlook.office365.com
 (2603:10a6:10:28e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 13:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 4 Nov 2025 13:54:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 4 Nov
 2025 14:54:24 +0100
Received: from localhost (10.48.87.185) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 4 Nov
 2025 14:54:18 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH 0/3] bus: rifsc: add stm32mp21 support and config dump
 debug entry
Date: Tue, 4 Nov 2025 14:54:09 +0100
Message-ID: <20251104-rifsc_debugfs-v1-0-7ebdfbf8d33f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEFCmkC/x3MTQqAIBBA4avErBP8yU1XiQjT0WZj4VAE4t2Tl
 t/ivQqMhZBhHioUfIjpzB1qHMAfLicUFLpBS22VkpMoFNlvAfc7RRZWWoNOGuPRQG+ugpHe/7e
 srX2AqmJVXwAAAA==
X-Change-ID: 20251104-rifsc_debugfs-5053ea033ce3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DU4PR10MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: 978ced85-5181-4e2c-7c3a-08de1ba9a6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3NlZXRKU3FlWHplaVBpSkdmQTM1QWd6aEd5YlFrVGFSc09yVmFqcjMxeDFG?=
 =?utf-8?B?MTM2SmZaa2lGZGZBZ1ptZWtXZ2dDc2w1UHFhMStmZ3oyV00vZUNuVEJ2VkRl?=
 =?utf-8?B?TXViWTRBdE8zNWtySUlKcUY5VTBJbEJKbzlFcFBhS2tCSi8vZHljcXU5bFFW?=
 =?utf-8?B?NkFTdGVzWWVvL05Dclh6V1JibVVYVTF1aFlQa1VwTHdqRjJVMSt1ZFVmc0hI?=
 =?utf-8?B?TmFGZlA3MEQ4TlpOTS9HVFJHV1BPVzVvL3JBUTA1QjJ4UlFkKzBYbEROeDRn?=
 =?utf-8?B?ZW9iRDZPTjREWDhtUnB6YXdxZkpnczhxRmpNVnIwc1ZFWkhLVmd2VkxZTEVU?=
 =?utf-8?B?T3daRHNvMENhT21EU1FvNmxFNzZ0TmhTcU80OTB3OG5FeXhuazh1enRucVQy?=
 =?utf-8?B?VTBqRVBkNk1JYlJCYzlXb1ZjTGRjTHFzR2VLVWd0OTFqQmxBcDZVSGNCTDlG?=
 =?utf-8?B?Q05NMUdRcEpVUnVuWkNhRVpHTmd6b29NM2ZiVlQ0bmEySzBnNm5PaE5lVTND?=
 =?utf-8?B?SlRQSCtIOWM4MGNoVlR0WEt1aytZdlQ3bGErWTVOLy9rMVNHL2lOVmNGdGZT?=
 =?utf-8?B?WXNuWDdJbmIvZGhMZEQrSmNYWkp4RGYzTTBFekdoZGRLcjJHQVFnOFhlWm9C?=
 =?utf-8?B?L2pUeW1QOWh4a1M2dkUyL1ROK2t5R2ZaUk51c3YzZHpUL0k3SGVvU1VFSnRG?=
 =?utf-8?B?aUQxUlAzSmV5ZEV5RXNDd0JEQnhWTk5KR2drdUt0WloyNUZBZXBnS3JZWklU?=
 =?utf-8?B?eHVIU2tUM0xrZFJSVXlBTzJXOVJXSnhPREJQaUdvbEY0UDJIUGxOZWdnS1hC?=
 =?utf-8?B?QnQ4U1A2NTVhcksvM0ovMUowU2llYmhQSGs5cVZ0SlV4K3VDOVhTTUNrUjYx?=
 =?utf-8?B?bDRwSzFIZWtlWVVNa2RSVTUrRlhhMVhncng3aC9uUkplemRkRHpOUWQ0ZTZl?=
 =?utf-8?B?WDV3dzQ0NDdzWjhyT0k5K2pFdnJNTEt2NWVaZWtYb05lQnhDVXV5bFdmRVJ6?=
 =?utf-8?B?THpuMzYvb21HRzRHa0N6V1d3RlV2NE9VdkU3ZDJ3cHd3eWlySGtHMTlPUkdw?=
 =?utf-8?B?OFVQOExubittM1J2Y2xGb1BJbnNLV0N2ZDhrSW1ZaU5zbFdVTmR1OVI3OE9N?=
 =?utf-8?B?dkFseVFZOXoraXBCcWk2YTZTQ3cxemkrNjczcHl1UUJkclF1UnVDSmdNVjE2?=
 =?utf-8?B?TVh2czVQaFJXNjVGb2dHRVI5S1ZWckMzT25DeVBvREZ2V3ZuTVAvM0FxNnRh?=
 =?utf-8?B?TllvTndlRW9FZWI5c3E1SWg5Vk15SmVmV1hrOW41UlFXQ1hEUDV5MHlEVlZW?=
 =?utf-8?B?Z09nOUV3bUJYSTJlTzRPb081aVhsVE9ORmJYVlFxNG5GdVNqSHRLUmZEZkY4?=
 =?utf-8?B?bENtRmtJSEhCNmNJQW1oSHVvNXVrNmx6U096VzFKVXJOU3JVSDN2Y0V0SnUr?=
 =?utf-8?B?VHVoVisvSjNwTDdtS1V5RlRNYlZtUHlnSTh1WU5hTW5vUnd5SFVKdGxzTkRj?=
 =?utf-8?B?K1NRaWYrdHNCTkg0OGJxUEttTEJrenVjbmQzNzV6NHYzR083Q1lOL1ZrR25K?=
 =?utf-8?B?V296cVNqTDZJbXJ6VU10cnhXTVkwM1l5VkV0WDAzNlNkMVhqaFdhMWFuV25S?=
 =?utf-8?B?U3NyUW0ybHBTQmdTWjc4SEtnT0VUVU9KYkNjUXJPdFNwZSthWHhOcVZud0pv?=
 =?utf-8?B?MExUUGFyTmJEcUY3WGlUUFJOalc0Z1U0NWdBWjdrRXRhcktNUDNISm8zMEVq?=
 =?utf-8?B?Z1Z6RmVGOWZQbzc0U2E2Q2VCN0NaeGpvWFpwdFcxS204YkNKTDRkWVNmelVs?=
 =?utf-8?B?bVJodGRRSVY0S0dhSkh3ZElwL1lYclU4bzN6MWpHMWRwTSs2cUg1ZWwxekNE?=
 =?utf-8?B?VHRDTXZ6Nlk2ajNJQVowY0N3Q1RzSDNIWjJ6bXBCbGcwZldnQmE3VUIrL1dH?=
 =?utf-8?B?MlNGYVJpaFQxRzFTSUhYWHpkYWI3S0JpcFRHRFh2UXZPdUZFVWRzcitld3Vo?=
 =?utf-8?B?bnEvckkxdlo5MldUZkZ6ZU1TUG1VWlJQKytyMVdHcEdZSjBKWUNRVC9LWUoy?=
 =?utf-8?B?aWd2cGloM1NZZkhIemRGdFMza001bXJ0UXJxcTVaRUpUWG8zMzgxTlVjQ2lI?=
 =?utf-8?Q?d9Lg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:54:19.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 978ced85-5181-4e2c-7c3a-08de1ba9a6ab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9096
X-Authority-Analysis: v=2.4 cv=eeEwvrEH c=1 sm=1 tr=0 ts=690a0590 cx=c_pps
 a=AOycmoUevleOEOAMEpukkw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Wpbxt3t0qq0A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Qt6CvwFM3zD-zW8HttkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExNiBTYWx0ZWRfX/NhFtdtQf+pE
 P2C1l/P4KRZXNz8hx8oPCUOPH4+QGfRELeLA1bktEV/VYGmzt+0lkv7JNkTi9cFg7makgZFygKV
 iBMxP/18Zp09ATppRpH8ptJPqlbEQH8PDJEteR/uaWtsbD3LmtJlwESiKqTD0utGmVP1LKlRtlk
 ZGuRpfOIjoq5f0GZWXaKvuRg9JRsirF3Zjf0DxUlAMdJjawNWg0XikBpGW4zDnMOj0Q14L6yQoJ
 mVMJMeh6utQL76juN4JXrhzKr7WmJZBVLKohdieD02eSlX6BG38H42QCJe+RuGjMxKZl2PTCvfy
 6u13aP0uXmOL8s3EUH8GwT7qI5PTD5z7pXUF3uFwDZDhfVyg0/iY7zXGGZGQJ7zlkA8L0tdyX0a
 Em77Mtv9GTTiKLd7mSS15OQsEJ96HA==
X-Proofpoint-GUID: YwrTQKgG_yQwirVCEozYIUi8CTx-Ir7l
X-Proofpoint-ORIG-GUID: YwrTQKgG_yQwirVCEozYIUi8CTx-Ir7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055440_882070_8B88BB31 
X-CRM114-Status: UNSURE (   9.82  )
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

The STM32MP21x platforms have a slightly different RIFSC. Add support
for these platforms.

Also, the RIF is a complex firewall framework which can be tricky
to debug. To facilitate the latter, add a debugfs entry that can
be used to display the whole RIFSC firewall configuration at runtime.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (3):
      dt-bindings: bus: add stm32mp21 RIFSC compatible
      arm64: dts: st: set RIFSC as an access controller on stm32mp21x platforms
      bus: rifsc: add debugfs entry to dump the firewall configuration

 .../bindings/bus/st,stm32mp25-rifsc.yaml           |   8 +-
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |   4 +-
 drivers/bus/stm32_rifsc.c                          | 600 ++++++++++++++++++++-
 3 files changed, 605 insertions(+), 7 deletions(-)
---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20251104-rifsc_debugfs-5053ea033ce3

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


