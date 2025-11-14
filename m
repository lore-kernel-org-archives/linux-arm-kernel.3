Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4E2CE8D60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=; b=St3B6h9p1jCgMQx17sXitpcTGq
	T9fq4Tq6/rZhQXTp7SA4cxduEU+oRQR0q8+zBLqw0O+Z88xEizeKfpBERc1H+taeN0ardS1znkraw
	rgpsW8ZzrYuU0yfKfx1oLPWKcsnDi3+T61cz1ffCBEPAFhC0tbpMK5CyxQKXrODEmEmTQwZgMgIJy
	H9YNxH6qOhmOOr6BAhsiEPkaeAQv63yGY1/DU/FEuUH4iLS//5WzA3S+uzwNvj5vl1aFsiFMijhmv
	/wQItEVQuxx2qqyXQyZdIRnH+YY2xOWCg4NY9SCIWEbuQUU0RJj0SMCJq7Aci24ANBc4soUNuJhya
	VnLRTV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZA-0000000CpzM-38zM;
	Fri, 14 Nov 2025 17:26:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ1-0000000Cpvb-3t8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:26:27 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEH480N2782514;
	Fri, 14 Nov 2025 18:26:14 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3xfr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:14 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDwCPWw5TmzbdAS+A/wTml4WwLRQiLa15xDIodkl4zsMpyqI/zb6fAkAV3/36NdYljZETgC9qYnFQWvYelYpSRpJagxbLmvbz2ZEM3Kdwmu8xoFU9maMGJP1iAdMbrXTJt1ENyfMh2a194slC6IZym4j1olb6C7rMTjmXN3Rn3jaq6GosS9SHWVR/yCQOfZXAqRDoiXbxbiu858lSNCxugdlPf9DKmRIWJcizs9LbSCUtz9SPdUZ27t+4j8skxV3xqB/7ko8ABz2FVTNyU7TpCbH3qZa9kFrsXQfVsbrZVNoowmpqHegd73kMWwD4mat7yjY1XDyQnsMWLu5bbdgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=YwGSmeuWAXBH1NIABBQdjcESYEtWBVxk7QYWLAy0UeSNTw3ZSgvUjPNEgto6KzkNfI4B6u0Poz+jHq4z18jKxAEIrnmIX1LGVayDs3ZuV15iorVdcy12tb+w1euH5K4SdlI1S4dfb8pBYReF8chKr59WPQaHD7xTQ3Mvy4qs3rOHdqLRsTaNmC030hT91tx0z2++Ms6WbGYxEyus6R6lzypDDvNJE+IzhXxdVJ9PMOTIgsMxV9vSSCapTLCcegBgA+m5aP0BDKbPVT2wNwnL0YrlHUKRe57ztBA4OiV0qwuT4pEumvHSLmDPybLDaFBn9MCSpSIHS0eb53R9awPsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dbe+C4JL0UZOJb7yQU/zoG/1X1vfGQr24dk72l+paQ=;
 b=Az9TMOV0+ZI/wGoLGNsayuYoS8/V4soa2Sx0cBpkX/XKbef+OynbmdBaNUFnkB/yinstn0mvQvMtnUNmw/Vei8ArwBvyWY6eR17N7SVce3z1p/HkaXyzEzq/xEXdGUoruWbYYW/C9dIEdG3thXfYyYjKvJcmPRCnKkHxAfPwy62/EQIq+nHgwa4U14a0hq4QVGQ5DU2iXZfPqydtWbbeZh7PlxvgzRCYUBkDPIJy8lLlsM0xc0B53MugafpdKmh9nmHnQ05pq/34nD64dehp9lKvArikbGKikp55+Z07mpyrdFigqJOYHxfMUlzjR/Rn2eclj4AmLu24Zh83LfPz3g==
Received: from AS4P195CA0036.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::29)
 by AS8PR10MB7327.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:615::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 17:26:10 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:65a:cafe::9) by AS4P195CA0036.outlook.office365.com
 (2603:10a6:20b:65a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 17:26:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 14 Nov 2025 17:26:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:22 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:01 +0100
Subject: [PATCH v2 1/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-upstream_uboot_properties-v2-1-3784ff668ae0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AS8PR10MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 668b0756-cb3f-45dd-e293-08de23a2e72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmFCMjR0UHYrWUkycVNIY0dxNDgzbk1LMjJhdm82RFYraU5RMlhCZE9ZNCtq?=
 =?utf-8?B?VzhSYlM0R0tmaEZRRXh0V093WDNpYyt4T0dJZm1CM05ZeTB1MW9pSjFvajhj?=
 =?utf-8?B?Z0MySXIxR2w1dEJkZ25DUEpTL2o0d2JyT2ZJRlRlQk9Sc2laUlJlS1hXeHl1?=
 =?utf-8?B?cjBHSWVjZDBxTHBwdEsvMUQ0Qis1UmxlYVRFWEtyYlhha1BiK2psaVJYVmxk?=
 =?utf-8?B?Uy9YdHdLdWtMT0xnOCtlQVdUUW1lVHZFMWVLYmZwMU1CUUVwUkpXWkY3ZWNW?=
 =?utf-8?B?ZTlkQng4R0tyNzU1QktnYi9IdHZnRTZ0MmlLWWU0MndTMVd2M0RURG1kQ3FW?=
 =?utf-8?B?WHNrR0Npd1BoSHp4ZXgyeEJTWEV4Z0xPT3k0QzRxQ0RvRXozQTM3SmVIaGdU?=
 =?utf-8?B?L2FnYlczUFVQd3FCRU5RdzdGMzZ2OERXU25WUXNIUENRa1JzUXFLazIvTEQy?=
 =?utf-8?B?WTdXS0ZlZDU1RGF3NnBrWTFlRHA1S0xtMFFPVmFYZlNNZmlETW5VQ3JSOXZj?=
 =?utf-8?B?MU9OR0kzVHYzR1BHNlFRUjlhVlRjNTFSbDB6TnZlZmlsaWhpLzYrZXlNZjRr?=
 =?utf-8?B?S0NsVFJJUmtTVzNuaWJybTNqeGxyL09sVEpLQWlMeTZrMFkxYy9DQ3o3REw0?=
 =?utf-8?B?ZzgyQ1A2a2Z5OUtpUEpZZXpYcmhZWENMSERjUFJtbStqTXB2dXhCYmJQMCsv?=
 =?utf-8?B?L2RBSnVmamRNU09IWHFjMXpvWVVlTWFnNGNRL2wxL3BEdjJwSmpMTFBXVy9D?=
 =?utf-8?B?TWpoWE5iSGZaNzBQOTY3NGlWeGIwczFKSXpsalFrVUhXSU41MWIyZnh5SHZI?=
 =?utf-8?B?SmZSV2dTMWxZc2lGeGo0YjBMbmZvdi9xZ0FXakFiOUJUODFQbExWMkRLa2tD?=
 =?utf-8?B?bVJHcCtMb1VFZ0lTZmF2enkwcTBsUXJrd2VSNGlGUWQ2eld4UjR3ZWVFRXdM?=
 =?utf-8?B?TERKczZUcXpWQkNDanJ6VENiOHArMHZHRnFDVjhDN09ON3AvSkFJMU8yUXBE?=
 =?utf-8?B?Y29xYVBCZ3I2SWgyUGhoQnlwaUIxK2RQeDhmazl6Vk1LdGJpdVZxdzFTS2xL?=
 =?utf-8?B?bFo4VWR1OGk2c1kwSjRjZlZwNmU2TWlsS2lJTXdEbksvRHQ2OHBlL211UE9i?=
 =?utf-8?B?Uk5mREVScmQvdmFHNVdLUnBKVmlKMG9rL3FaaW5mUnRVL1JGUk51WkVLamp0?=
 =?utf-8?B?QTU2Q29EVGpFQTlQOHExVU0vTldJdmFKNTFzRE1nd3NseEhQbmdaejZwUk56?=
 =?utf-8?B?dlpFRHhNeDByc2VPaWthV0pmME16VjVqaGdHUXl0QTJkTnB1dFlzblJ2dXJU?=
 =?utf-8?B?T3liS1hWNzNwREcxVWQ2U1lHaGhVWXJNTDdLSFEyMkZ2c2lRVnNrays5UDdX?=
 =?utf-8?B?dEVkOTNTNktCUkZKVVRlL2ZjNUt4YkJhYnBVZExENUNzcmFNVFgvTlg5bElW?=
 =?utf-8?B?WTY1VmVUeWNvdDAvSEdnbUNSazN6dEttQnFOUXlSc1RjaU5Rby9nR1cxM1Vo?=
 =?utf-8?B?cDhoMElaTjRETUMxbVliL3JzUlV5bS81TFdPVjV3aVdSa1I3VW1uMHhKMkNl?=
 =?utf-8?B?WkhtUWNDVDlqNVIzczVyc3FUeUdaZ3EzY3RLaVhhWHN4dTlUL0JzTWkyUURr?=
 =?utf-8?B?RE9BdFZUWmJiVm03UkNDRWw4WHhyL1l4TkJyUWlkRVk4dXU5L2M3dURuSzR3?=
 =?utf-8?B?Ui80ZHdjdkVsQTNuUDBIU0t1Sk9XT1FMUEdtWjd1RkJxRXN5T0NGQm9YY0Vx?=
 =?utf-8?B?d1REUTVVMjNXTWVUMUhFc3licHVaWGtmZnZVKzM2bFF6Tjd0NkdJSVdwSUJ6?=
 =?utf-8?B?S3czcmZaV2wveHhVa2ZGa3drdU44aEVEQUFsWGd5VkNwR1h1dnpqRlc3MlZi?=
 =?utf-8?B?VllxUStBVXhSREg5TEkxakl1Zzl5NlRZdUROY2JKeVlGUGUxZjd2d0E5bDBz?=
 =?utf-8?B?bFhLZ0NrdGNhOG5idzN6cVFyVTA5aUt0SVRMS3hxTE9mZll3SGFFN3d4WUQ0?=
 =?utf-8?B?bkx4d1VMQnFqcXNKRlNEdUJud1h5KzMrVW04T0YvYzFXOTY0ZGxsYm5FZm0r?=
 =?utf-8?B?YmhWclU0UmJPbDZreGdJaXlEMEJuRTNRRkNCczZ5YUlQUEI0TTJTeTZYZ0JQ?=
 =?utf-8?Q?qbBs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:10.2671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 668b0756-cb3f-45dd-e293-08de23a2e72e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7327
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=69176636 cx=c_pps
 a=ECArxf7uu/OkwjN1x9bPQw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=h9jCnciPw8RmqMyquroA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: c_WGiz6FENewK7DDlrsKlM3CGa_FK3M_
X-Proofpoint-GUID: c_WGiz6FENewK7DDlrsKlM3CGa_FK3M_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX188fMhA/35fh
 pEOMANUKipu5+hMyd0/ICoKnjGs3ADk1rU4cuyKnl2iDhGqaLaIDXMI7Y6rRZWtFnrHI7Gq4SE0
 RI5dikCACE2Mvys5GAJ/uW0yHSpYyD/BferdZuvcoN1tN+8hfrYnaEROuJePkjbAuyAsyIIfrOt
 lYotOX0YyfeikxdjRRrFYCTZuA/cOjvpkPJLdlQUiZc4RrX+SsgdUbfh94glyWxRl6i9O1doLu6
 LULIK2RCmVHzxB37n7rYjRikUUugRM9CM/1nf4BzMS+pkx1tjJZ3xHHfKR+60zAUDyjx5IMzaUl
 +xmZ6XvRE+a77Pr15NdpxgUBHNzHV6aMvRyjXSNeTny9ivNeMDIeIR9PBluN6eOCRVqY52FQj25
 Z+RKIGcfuw1wNuHD46aqJHMpAsfKxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_092624_579340_77781CA8 
X-CRM114-Status: GOOD (  10.31  )
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
 arch/arm/boot/dts/st/stm32429i-eval.dts   | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts  | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f429.dtsi       |  9 +++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts  | 12 ++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index afa417b34b25..3b6151fcb070 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -312,6 +312,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -326,6 +327,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
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
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
index 3bb812d6399e..bcaed4618738 100644
--- a/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi
@@ -51,6 +51,7 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
@@ -60,6 +61,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -70,6 +72,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -80,6 +83,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -90,6 +94,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -100,6 +105,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -110,6 +116,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -120,6 +127,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -130,6 +138,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -140,6 +149,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -150,6 +160,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -160,6 +171,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			usart1_pins_a: usart1-0 {
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index a3cb4aabdd5a..39a80a9caa5f 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -209,6 +209,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -223,6 +224,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
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
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..51c931f7b9d5 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -54,16 +54,20 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
+
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_lsi: clk-lsi {
@@ -76,10 +80,12 @@ clk_i2s_ckin: i2s-ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
 	soc {
+		bootph-all;
 		romem: efuse@1fff7800 {
 			compatible = "st,stm32f4-otp";
 			reg = <0x1fff7800 0x400>;
@@ -580,6 +586,7 @@ syscfg: syscon@40013800 {
 			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(SYSCFG)>;
+			bootph-all;
 		};
 
 		exti: interrupt-controller@40013c00 {
@@ -666,6 +673,7 @@ spi6: spi@40015400 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		ltdc: display-controller@40016800 {
@@ -694,6 +702,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 8a4f8ddd083d..de025a385e9e 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -169,6 +169,7 @@ dsi_panel_in: endpoint {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -225,6 +226,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -239,6 +241,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


