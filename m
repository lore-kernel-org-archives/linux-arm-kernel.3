Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B56CE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BCk7sn7D7x7seB9TSmFS5DtxZCAI4e8ojwcF71Iz/kI=; b=cWl9d3V4fuaihLlfqly4YuB3DV
	39H8eWPV2xCKMqL7aqyA9xVMM39VbdBxgq2XzHK3Rfc3YjYIzOXnDw8QbZ+Sslrcxuv2Lno6o2VZH
	YLnHrYMrHiFTLzJp1QF7bbVLPDuyepen/bjZ2YspQ5w7JewBYb7xAyLk4iyx87ruqvjudsb0MlZaO
	Ywm5lymrtPTAujF3rtnzboyWehfj6L4i8GDyh+5Tt/UaF1E4WYJUnuNxgqRfOxzCXe5qsajl6bviW
	9aZtiO5FsVvH4mMjDhpgby2MVK9wxUhdxsFgh+TyF7TcVV5ysy9/oV6Q6aBB7MlI5oR89TOT4kHDQ
	d+CtrO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpbj-0000000BqmV-0vgA;
	Fri, 14 Nov 2025 08:56:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpbh-0000000Bqm2-0q7e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:56:38 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8n3r71844775;
	Fri, 14 Nov 2025 09:56:30 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j20bm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 09:56:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyDhZEpA9mtCQobdy34GYsufAaNXgfj3iZgcQJgvrgneLxLdHXyPnBmEr46ntsyih8VtzacF8VZCmfJttwxWjsP1ZK95TB0r472LSqANDqK7/MDKKZoS3H0V++QislHP8HJbbgKSvdfOIaUdyVTDOo0UDDDfTT1GJYvYJpD4/MxYDd1kszjkGOV0vdDiQEXIgWYLhkTYn24Ht1sQdIeV31t3L60E2svVJC05/80WJMAIoQuz7SESSKepgR8dBA4u/GXeuWtbzxdlT2LOvmbu60e9Px6y8CcgE6JCLY6tjQ/AirPjodQI7QJX4YkbeFNchIUv3WcjtXAVgU7XVGvpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCk7sn7D7x7seB9TSmFS5DtxZCAI4e8ojwcF71Iz/kI=;
 b=ej74QKRFgEt0BHZL4uT/2jZEYiJa1j6j6oBNOsBTdMcJXbUPGzGgPBkBy/2nTEc+F62M66zXE2zpoSEDb4ruOj4e0Qd5dh/SlpvJobzRg7o7EIbUUKST7MeBHGd5wF06aNmM+CPefgSpuLaZXZtzynLe0YgjyjPfbu0mjb11nZjqvHnteIb0u/gXGdpFndBkbTJc3P9MmqBQGj0IxkzMFNE7WuwKvbGsZK0PfP/2OYWY1pkkeDncVZFd5eLEFXTI4PPtjB/NjLpGozi/2s8q5ReMd2D33YREKop167VidqlnqcydeEetWxijRfrOxzqIoAN2xoURRvPyJsDgtJ0X6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCk7sn7D7x7seB9TSmFS5DtxZCAI4e8ojwcF71Iz/kI=;
 b=VmZOZV84d9w7gpHRZ1kK+1wnDfIXmqYxmFbfY/hjPk2zxpqy+lT7lMXhBJuLUIwkol5g9PmMrMjLsGpVzgJM/XpmAjCqIce2sGNWAK2qVE17+9+jWDnRX9yzv6FdfO5rrFtS9TVHvrc9hBVtECl2n4ppEPG17vd99duVRFbQariUprgH36LFitmpRskH5x5hbs8yoMrPpqg3kZXZ+2z02ohvVtktg+GQoRq3oz/FfPAQPOGlRMZ9AStGBmsZqMpD9Tycic9u19HJ1M2mVVRqIqXZjJaRDed/CTBLr5J9uojmKmOR9w40Y1Eo5k/sy2ZOV3LdmKrFVHKr+9Xo/ReVvA==
Received: from DU7P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::27)
 by FRWPR10MB9366.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 08:56:27 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::f4) by DU7P250CA0013.outlook.office365.com
 (2603:10a6:10:54f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 08:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 14 Nov 2025 08:56:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:08:28 +0100
Received: from localhost (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 09:08:16 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
Date: Fri, 14 Nov 2025 09:08:05 +0100
Subject: [PATCH] PCI: stm32: Fix EP page_size alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-atu_align_ep-v1-1-88da5366fa04@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAGTjFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nj3cSS0vjEnMz0vPjUAl3zJIuUlERTo9RUC0sloJaCotS0zAqwcdG
 xtbUAVq4K914AAAA=
X-Change-ID: 20251113-atu_align_ep-7b8dda52ee89
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        "Manivannan
 Sadhasivam" <mani@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|FRWPR10MB9366:EE_
X-MS-Office365-Filtering-Correlation-Id: d02a259c-0468-4246-7438-08de235bb217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2g0YWJUKzJOTlVDeHpuMWViWWZhUUk0bEJsS2ovRTQ4VVBrU1B5NlpQRGFi?=
 =?utf-8?B?Tkk0RGVDMDAyTUk0MW5WbEx5QldOdUVxbFdNQkJRcC9xRW9hVlMyVXJsZWZ2?=
 =?utf-8?B?ckE2cUc0cHFjRzA1aVpEOXFVMUpoWXZoNTF2MXJLaG9DWjJTS3RBK3ZoRk1K?=
 =?utf-8?B?OUI0QWdGV0ExbUVRUU9BRXpBcHF2bjBzY21CMjlaSUpFWTU0Ny9FeC9EU2R2?=
 =?utf-8?B?REhEOWRnSFlkajhyalR6NzI4MFFmWEprQWl0K2RCa01yQzhCc2RBYWFRZ3Bm?=
 =?utf-8?B?eU1zUytFK0FwendDOWtnMXNVMzBUb2JpQVRVdnJaUzlWa05UeTJmcHk3d1NO?=
 =?utf-8?B?dXc1WlZTUVlPS2pXR01MSEpMeUpVaU5NTmhqc3h6UXNaWXFab3c2WGQ4TEtJ?=
 =?utf-8?B?Y0FDS0txMHpRR0d5T29DdlBjdHVBaVNmUzBxVTFQYWVLeTN2TFdJZWVmWTFD?=
 =?utf-8?B?bnQrbHIzRVNJYmhCQ3BnMUZUZXJzS3h0NVBuTGwwUHlNeVFPblhzbWFEaHI1?=
 =?utf-8?B?b08wSTRXbFNsQU9JdG1CbjAzVVNwRi9oY2Ivbm1idFd2ampXcU1odit6SU1L?=
 =?utf-8?B?K2twN0QzQzVyNWx1VG83Qm5ZTXkxWXpkcUxCeTZCZXVybk44eG9LQStGYXFu?=
 =?utf-8?B?MkJDd3NUZXF3MS9meDFLSGNvbG5sREFNeVNyZkh1S2I4a3RieVZVSTZVS2hT?=
 =?utf-8?B?SnlEZGx5ZGo3c0Y0QVQzNHFvSTdDdUtDWGFRZlUrY1JFM1VHTXR5cjh3aVBW?=
 =?utf-8?B?VXJjKzBZMVJCR3FKOERES2dNY0RjVk1vYlJpNTlxQ0xINldvQVBCeWh2cUpv?=
 =?utf-8?B?TFlST0xUdW8zc3BkZjc0eEw0U2hvazZYaGRnZi9UUG9jYkJLSjhjSDEwYlpq?=
 =?utf-8?B?WEphdmNFMStqSURLcVJ2dzhzeTg1VkZscEVnTHBRa1hONDlXVWFpYkxEMWI2?=
 =?utf-8?B?UGV6Q25qUktna1YwVVR0VXBJTkdvS1VHSlJkM2tMUzI4QWplL0VMc1d4bWhs?=
 =?utf-8?B?TnBXTzNNV042ZjJGRksxcjQybmltNzQ0WWVDVExJMjBJT0dWY2dKdHRUcU5q?=
 =?utf-8?B?YlpTOVhUY2pQaHZKbktnRzlVdE9yRzluL0JaMloxVFpIT2VoanJXbWM4OWp1?=
 =?utf-8?B?VkRRRW5lQzBkZ2MxMEV2VFdYbG94dUFyOU5SbEJ0bzQwZE5DNWg5QlFwT2x2?=
 =?utf-8?B?ZzdEcGFvV0ZQRXhpakM2Ym9hdVpBNGhKSmE5YldsUU43SlVpRHV6T0N3a0ZT?=
 =?utf-8?B?T1VqRXgzcysvSHpjWkprdG1TZ1c3VnYvNnVlUzV5VVBnREFoU2lZMkp2WTNR?=
 =?utf-8?B?QnJncDByYkk1QVlEbStjYitPU2ZJYnMyV2NPRUlWWHdSWkl0VDdIUnFlWnFQ?=
 =?utf-8?B?T092VG1DNXVxTVBQekVIQWNzSG5XV01DODlMTWR4NUw3a3hZQzJoeDUxUVhZ?=
 =?utf-8?B?SGp2T2pGQVJ0Mk5vZTNLOElidDZTclZxd3pLajMrUlB1czJ2VXpienNOWnht?=
 =?utf-8?B?TWVuTDVacG9CRk5LTVRsR3MyUVhkYTB1bmVhcU9MczB1bTEySWJBOXpkdldL?=
 =?utf-8?B?NTB3cWpiR2JLVldqbTNiTUpQOUNDYnZIWWJsK1pSbU96anltckV0NkVSV28w?=
 =?utf-8?B?anM4OHlOREZwbENobDFHSE8yVWo1Qndva1dHSXgzZXpJbW8vUHJOeTVHQnpM?=
 =?utf-8?B?WHNxRjRJbVMwLzRmZmx0Vy8ycW0vUUJiRW9LemNkb1hXVTBEWEF5cHYrRHda?=
 =?utf-8?B?NENOejhQRUU5VTduVnhST1Q1TGt3QXdCLzdFUkd4WDNJOVZJSnBiaFB0RkF0?=
 =?utf-8?B?STN5YWYvTm9BNHVyV2lDNVA5MmFqUW92WXo0THp5N0Z5b0kvYTJsNUJvN1lH?=
 =?utf-8?B?ZjllZHZmUFUwYjhmSkwvMmthcnJLRlhzUWx4SndyM3ZpOGw3cXNGQTk5VlVH?=
 =?utf-8?B?Ukg2K0c5QVFPeDllRXVSWVNXT09BYThOMkxScVFGUUM3S0NWSGxCWVBabWxa?=
 =?utf-8?B?M0hyOXpTdG9QbjFWZE02eFdZN1FwOWZkV2U2NHJPVHJLZjMxQXhMdVhzKzZi?=
 =?utf-8?B?Njl1bG15L3pqL253SWx5elVtUURCN1I2bFlFVUZST2kxY1VFWmZpcnBobXRE?=
 =?utf-8?Q?KGHY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:56:26.7218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02a259c-0468-4246-7438-08de235bb217
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9366
X-Proofpoint-ORIG-GUID: _TtAZvxlZnKyM-QDbRKhSVuHLsPP6nqs
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=6916eebe cx=c_pps
 a=CUAEBjslK4IwMcEc9encMA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RA8ZoFPxCIQA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=RBZf8w3eM5daZnp2LboA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OSBTYWx0ZWRfX7iqiq+fzDoZQ
 W2lfF8IOAcVSGBN0TBHgvIfWKFALUDKh+Jpnhg/pMI+wqWchzexjCa+cuWBOjHIL0MT9EGwalhK
 D/wTSSTEamdF3AJmJ7PUIKumz4jpDgokR7pDg7nh5x65BGPIcFwuIgGXojff9uX/aKdKkSg+wkG
 Ks8iYUxg+dg0KcZU40zzg8mI+VPevF8lUOEz5xL8aU8JPsZ4YrTxjGhc1PI4imisww13PJc7is1
 8ASrqtURSnGF9plkoazx5y+Nr0pmh9qMbqzPeOHFf+FUUzwP3/KzsPrPbeJH8trAajVsKQVtozk
 ePX3iuMA1cSdF5Qnc0DXXNG5FcLF2KdVM+OwXsp1YmkPAtvE9FMH0sY3RZqxX8zmizmpi6MJ8eM
 EFrvojsECA/z+U3xgnHLK1l3H11wSA==
X-Proofpoint-GUID: _TtAZvxlZnKyM-QDbRKhSVuHLsPP6nqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005637_731011_B21418F0 
X-CRM114-Status: UNSURE (   8.78  )
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

pci_epc_mem_alloc_addr() will allocate the cpu addr from the ATU
window phys base and a page number. The resulting cpu addr must be
correcly aligned with the ATU required alignment.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/pci/controller/dwc/pcie-stm32-ep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 3400c7cd2d88a279c49ef36a99fc7537c381c384..004033ed60a8917438b08f5941908405c339716a 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -237,6 +237,8 @@ static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
 
 	ep->ops = &stm32_pcie_ep_ops;
 
+	ep->page_size = stm32_pcie_epc_features.align;
+
 	ret = dw_pcie_ep_init(ep);
 	if (ret) {
 		dev_err(dev, "Failed to initialize ep: %d\n", ret);

---
base-commit: 9c557fdcc2f5fab8541dbba9b08c222f89009f09
change-id: 20251113-atu_align_ep-7b8dda52ee89

Best regards,
-- 
Christian Bruel <christian.bruel@foss.st.com>


