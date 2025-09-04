Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC03CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=; b=pe6GD9s2i7dYNTCzt1x6czc2lY
	wUD9daVDExG+8lJTBdIKHSIhjRZ/S0NdRZ0yymA3/Sh3cKI/kUta0msmefNlewLdq3ITn7ZoRm7or
	K2O1sIUXzZX4nu5vErFCJeWDwumpCHdyfh3VWvscETNE+E8lB31iSxLEpRvaoj0cL3ow5na0swENn
	EyMT06VrqfnFKkxS2Fa6/6bkJm4MhwUu/dlpO/Pjt38B5FPtHuGgywAQ9HPt0p7DoTtDJTabrVRZ1
	qDlDbaW4JmO+uKAkLhmNmZ+eXpikRngee1MGEGOF9qr4k/bMGh/ElxVV69G2Ot+PdFU2wJnylLDfG
	34wDMBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qa-0000000A2qa-0qva;
	Thu, 04 Sep 2025 07:57:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4ag-00000009wv3-1bqt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:41:08 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5846EcWR028717;
	Thu, 4 Sep 2025 09:40:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=; b=Tp4UuwpnimQVjgeo
	by3XxQyV23weUutiM4qLPZPDVWdfxHaOFgjn+YS7kw/VOFvE8dVCClJltk7n/KV+
	05QYFSi/eQenkk5ucJpPc0WVfpSqCLhJyx0aKfcEpJYoJM3HSFfZhQhU0IFzebZE
	BoQaHuXCM+JrF/6JAHvB/7g9bc2sCZEfwuJOavl8nBGbcIQ3kCmGxTFQ5TZyjw2p
	jNmdbYx1qVfTTwgfv4mlggxz/H9EG+JRbV3dOMYKny9ggFQD/k1Lt1xR4rYFJ2cp
	BkNxzufm6l9evdCKK2FJnP/mDxCT/mg3dPxEBFiGxFKGrKuqYg0TEmCEc2TTFqKc
	m+/v0g==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7m7yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 09:40:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKUebJ0aldOQRrh4317Xjb+uE1Bhyove8GT5SIuURU/4PoSrKJEd2O5GQQ6d3K7OJaz9rcqMm+ivJ4cKe5WAcLw8nZ+W30pVu7vFfCOyO4UkyuuBhXxAnGj2qeG6VocvfAHJ0sqWFa4+YkbmOpqfZhptAjUY2mIP+oHf/hecZ+vtNAi0mJzifICiOilII4Jp89GHb86NwoAJ/kk6poS74ldz562PRiq6xK6QutcASLQ7DUs6W9n0OrmGmswC6kciUduxjjfnx1jDGAf/Hgl308DNI0yf2adxe95fpNI9oLytL8SDN/AXtbFzo/0sgo7YB7JBW2oLjUTotizxWSsAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=;
 b=hHe46ncpnh0W0mu8zm+Rjp2SwrvHe+Xv0Iy3FDBIJcqeXh66j+Xc5VrjYgZ3tEmxLXqCRGlGOO8oSSWLr5dXR/yMFy1ALeACWU4mfzW68hZV9N+bBVo6CmRF2W+GMcTqVOSib3POIpteCS1UU5uEZ5fD5+CxcmfakXeHcRNFKXJtne2L1X6mPKJvQeqcONuqOF7rYL7bFNv2BkG+16pUHE6nBG82cCQMi87fOJx2dqJttFcslQKBbKia81e8QMGqpcgRdfF6NFLsDOuFy96gQ/hohF7C7Eo02lIWvvaFjAZhMrS/NnxmJqjxPIYBnycFQBkg8g+IOkjGrHtaapkk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=;
 b=d0XBOekHelNPW1ZTj0MLU7a9NRtrgn3WzPLPsC3cTF6HP+6UiCrHvg0nbNyGyIFkU9SUq0ptpjuC5AATfVp7sKszLbreGrAWG7Xmy/w4WNYjXI3OZ9kSb0icbngHo/DMhcF9wAC94ZbtC02qqVqDOXERyjX57C7tOhru0UPKOGc=
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by PA3PR10MB9260.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:4ad::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 07:40:54 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::3d) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 07:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:40:53 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:33:39 +0200
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:40:53 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 4 Sep 2025 09:40:56 +0200
Subject: [PATCH v2 1/4] arm64: dts: st: add eth1 pins for stm32mp2x
 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250904-mp2_ethernet-v2-1-05a060157fb7@foss.st.com>
References: <20250904-mp2_ethernet-v2-0-05a060157fb7@foss.st.com>
In-Reply-To: <20250904-mp2_ethernet-v2-0-05a060157fb7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|PA3PR10MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a236ff-ed4c-4332-d4fd-08ddeb8660e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2dTWXZlenlWZHNOd1g2MFV2ZjJiWVYvMmorQjZVc1c1aENEMHVyNjVvQjF3?=
 =?utf-8?B?L1I4a3dtWUdpWUVUZTZ0L20vM0xsN09MODNLRndNMmtiQ29UZFZYblA3QWlD?=
 =?utf-8?B?TGdtTnZtSXFtWVRBVlBlSTg4d0dZRUpqSkF5V1g2RTd1dHk1ZTJPL0N6eThR?=
 =?utf-8?B?SUN1QW9EMzl3aXV4bC9vM3VSQ205cWVabVlYTTFZaHhTK2h1SDkzaUdjZFI0?=
 =?utf-8?B?VG9IL2VQZnNPUW5UTkJRZnZXMmtIZkJVdEF5RUI2ZHRmZy9JcWd2Z3pGeVVC?=
 =?utf-8?B?OU1LSlBUVmswRVFsSXkwcm9Kc3h2bmdwbDhMajB4bURmbFpHYmlKVWUvNUw5?=
 =?utf-8?B?OEtmTElES0dZc2Y3cU5MbkhnTi9QeVJMSng4WnhGcVgzYWJqYTJHU3BMZElH?=
 =?utf-8?B?TDJOVFdGb3FTaEtwb1Nibk1MeVB6d3ZLcnpnVDcxbnlKSURSSjY3UDhQTFNZ?=
 =?utf-8?B?cXVtdWYvWDdoeDBZblhmeTR5a0ZEZVU3SjlGWFdpdm0rS2pMeHI0eDVCaVBi?=
 =?utf-8?B?cElSZ0NMdVYyeWNoQUlrUXBIbGdDVHVNTTFtTE5zYTZOeDJpdElPWS9VaEZh?=
 =?utf-8?B?M1Yvand1ZngxRkw5SmFzc0Q0S1VJL0FJbmRGNS9zZ1NnQzRtNEtrcUtDS1Ev?=
 =?utf-8?B?cllYRlBEc1BEZmJVSk1nQ0VubS9lejhpdFR5RDFBRFhaZm4wVUZUR0IyV1Ux?=
 =?utf-8?B?clpDaFBLYTZhYjhGRVYrbjJHeFlXcEhCN0RiU1NZaS84OTFMa2RTZ3MxZFhE?=
 =?utf-8?B?eGkwb2lEYmd1NTg0L0xUTTZXQVdSSlJVbEk2R2ZVMW5EUDVjNnpTUmtMOUJO?=
 =?utf-8?B?U2w5WTVramJaaEdHMGp1OElveW9YSUJLMEFXWUQrTVN5K0VDN2VYejdRenJl?=
 =?utf-8?B?VU1LTklZYUkyL1Q5dElmcFR1c21WWVBMSnhmbUpRUVAwcWRDNkdMQTVyZHZh?=
 =?utf-8?B?dkpEQW5wQTFhcWdyb05RbDBXcHhCVHZQVlNJeDZJQzMyWVBUMjR2ZmpmZTNv?=
 =?utf-8?B?cDFIWm5tY01MbHlVV1ZMNU0vYW5IekJkKytHbWo5Ym9nektpWHFzbFpUbEJo?=
 =?utf-8?B?TkFZMGpHcnVYbmltSHRXRjVseGVidDRXcVNDU0RVWXQ0U2NRNkZ5S1RERFh5?=
 =?utf-8?B?T0QzbFdtQzNhR01FZUVwSnJKVVVvR040eEpPVzk5RU1qTkhXdjBhZ01kdEFQ?=
 =?utf-8?B?NVFvSENOOENBNnA5MURpblUxRkFGT0ZZMGMrTXRlckJKaWJVMmoxTXAyaXRW?=
 =?utf-8?B?M3R4UjNNV2xtcXhKeDdHR1EvcElzZm13eWhwSlFFYkROdzYvSWJCYUhaaDg0?=
 =?utf-8?B?M1JraTU1QWNlN3ZobThmNzNjbWRzOXJGRWNGMnBJR2NTbXVqNE1GMEVzN2hJ?=
 =?utf-8?B?WWd1WURWL2JIeHBZc1MzWC9KcmllR1I0cXgwTndERDl4aEg5U3FaYlV4V1pt?=
 =?utf-8?B?YW5LaVRmdnhjTWVmTFNPVjg5VkEyWFh5K0RrMzl5bm1sa1IvYmQ5K3VIUDli?=
 =?utf-8?B?dzIwaFh6ZTVoS1dvNEVqcDJ4ZHBoRzJnbUJJalNrS1hTbzFaakFIdjF2Vmdo?=
 =?utf-8?B?TUFuaUZieXp5VkQ1SVVNaVRzU1pONWFtVTZobXdJNFNnREJVaFVHUEYzanRu?=
 =?utf-8?B?SjNRUW1TS28xekFvYmcwb2x6Sm9KbGFJQ2l0Y0pkY3J0MExJR1BRVG9jeGVu?=
 =?utf-8?B?enFuMDdidUpFdTNTQmRxbzVzN2REdmZsZWM0Y1ZOUGgyL0NuSXZpRVNTUW9T?=
 =?utf-8?B?M0l1UG9Mc1dscWZTZDMzdHhjbVFBSDVqcWxjWTA2aXkzSXBUNWdIclVWZVZE?=
 =?utf-8?B?TGhtYXlueDBzcWtpQUtkQ1pwVVYxeFFnSFh1ZUZEZUgwaU9YUkNqS1FRNVRY?=
 =?utf-8?B?N0RXclZFcGVwMWFOU1NOcnBoYVl0eEk0em1rV2ZWajE2eTc2ZDV6TlRVMWQr?=
 =?utf-8?B?ZFNCbjc5b0FnWDhqZ0ZGSExQMWsrRnp5U2dzL0RERklUbk1HSk1qS0RaU0Vx?=
 =?utf-8?B?S3pDcUdxSkxiUk9uQlVDQnh6V3VrZHlmSGdQRlZ1blBqamNoUm82WGltOUNU?=
 =?utf-8?Q?9gL44R?=
X-Forefront-Antispam-Report: CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:40:53.8749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a236ff-ed4c-4332-d4fd-08ddeb8660e1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9260
X-Proofpoint-GUID: y8schhPxbrrOzt8R4IK3fXe4NF0UQa5h
X-Proofpoint-ORIG-GUID: y8schhPxbrrOzt8R4IK3fXe4NF0UQa5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfX3WekvvULDo7X c+scwJelIRn1fkXnxzMvmrmL2Twco8N7vHTDHDqYX+NG6Q96wLbQXmHdPwQymY8Wx1AQ5ucqn8N 2ixgLkPX9RJGgVEXQ9OAvzVdaR8Z42QdLQqLQoBsxrXbffh8bcrOgdXYUzQx/LTb73IjC5YflvA
 o9jUqNdgNrq03x9NynLG+nQD1727twDQ+bLSuUoN9ZstVzi0YYYwRxiacip/t1YOH92e9qZegUe U6e9ttVWTDyIXwPHiosgT5FmFGpUDLBKbmNjLYYbJ4ltB7DEnoIemT2XkLvyXqaiZLsFgniSWSv 2+tZ525uYwtJ70imAxwZ1rH1z8mexO2k0VrF+ZdbK948W+o3CF5bQX1OQPYsyurkcwsHUd9CeJb KcKsZtlG
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68b9428a cx=c_pps a=FYuCfbT3O1F15zNW1aED0A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=6RiRSrLt0QzMNdfHOmkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_004106_689119_D6D76B53 
X-CRM114-Status: GOOD (  10.11  )
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

Eth1 ethernet controller is present on every stm32mp2x vendor boards.
Describe the pinctrl of eth1 for each of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 126 ++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 5ac9e72478dddb82be0ef7432d7e728932b2f4d6..3a2a82de48536ef4fe625b69a61e91f746b0d53f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,132 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	eth1_mdio_pins_a: eth1-mdio-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 2, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	eth1_mdio_sleep_pins_a: eth1-mdio-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('F', 2, ANALOG)>; /* ETH_MDIO */
+		};
+	};
+
+	eth1_rgmii_pins_a: eth1-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>; /* ETH_RGMII_GTX_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
+	eth1_rgmii_pins_b: eth1-rgmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, AF10)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_b: eth1-rgmii-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
 	eth2_rgmii_pins_a: eth2-rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */

-- 
2.25.1


