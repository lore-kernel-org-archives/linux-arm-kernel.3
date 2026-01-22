Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B216ED3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=; b=iLhDRqalF/CbrcRqCtSmnCqoyN
	kT5JlbhjvpHQqTFSlu646wWeVNghzEsw/Clt4Dfx+59RMvUxULzjG9JzoB83t8uP6lxKDYMf5cKCt
	/IECbPmAXBXaZPzBBjJ6o348Pu840JTfo8vE6YvFfb4biNZQEHL+ron6MUMPOuYk7LK/E3KU1BlOg
	bO59Fud8AcyLzgSwOLnxJshwc5BCTvVisZ4ZJ6xwoxRIUa7RtWyMxav0Z38wyPDLuOhJW8FuZovVR
	5zqg/jRRoLjsb66rWsSI+T4jDtebOGHmSra3a1SAw11OuteOeaTVeE50mE5uxzlVtVwJjc8CzI5di
	Xl+Y05LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixPt-00000007Q3y-2JXi;
	Thu, 22 Jan 2026 16:20:17 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixPm-00000007Q0q-17YN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:20:11 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MGCV6F1503857;
	Thu, 22 Jan 2026 17:19:55 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4buh90ssmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:19:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZe1gRcXEiqELQmvKqgzuWDoCpkMsPyKhEwpjwvUSxAhkOF2w9/aW7s6LhXgyWoOcyWBnvRpUO0Rk3WE4ygokEbF36QMjg5CsH+HTgQEU1Y3PyzOCxMU1/0kxPEb1yYmiBpvvq+zrgDDR8mWR3no+cFt+z4lHA4Byvkz9jj8i7M6brQ1czISfxjddCjk7x0fV9ovOh1sWR0C3I88eolOCRXfhe6YxSc1JWzxzM9KYDHAVCWzqCYdo0iULVrp1DCG5HP22O7L4E+yOBIYoR7fkdRoySf1zyCFu1YUFGxQJvl5j7lw1c7PvMbnSNABABKhsuR0Fq5Sq5DUwqh636HjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=S3qMRrxKXBerEspKI9tDXQYzMST0+H+l0LUNG2QPP5Yu2+jC5msTpJNkYI+NmlPI3uIvd4rRRlSXWwy8d64VYQ6+YphY37//Lwf7SZ5Qz3lGc8iQ2tVkDiNHdF81g95Ggv/Ab6PK8rNEWHxnpnJIUZjKDqERoa1iz2NFYpWJ1cbJ0T/Jn871/wTahkpcuypsHb6NoL8o4bZtHyLOrshMXPo+D/Zxi3cmNJSSN4W7gp3sNkBJbYkqI9ZfsHui0FBrzTkYm5Wd5CTszBpgJXESb2JNB9/maMha8SdNiLP0O0U6EByJdmOo16/1LNZzkO13bBJHLE0XWb37IB4Wmvms3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvKaTpku3+VOMwDHNkY8LHOf5sEYrcrhx0Ez3oSw4QA=;
 b=bL4wRPPNG4kYabv0xoESTneQ74nolRBpKyRu8FgGOqOaqpRSoWcIkuI3LnZbThBrObwXOnwhXAtbngSBxUnvvMpqTuQa51QOaLzmURInFgpziF8huMNY0+XxhOU9w2ZNaCfU4pPxrxGw3azg+lA1H1GQYtBVHm51j9TjW5fzvnp8m8O+DrmdAsEdagvchG/zw7v+YaBskSQ0Ypo6raWAcOfckylMx7SGGvvulH9B95WJIyLT06lfzWow4rEbAQ6Y0PjIGANnsmT3drED5X9yBhQt/9UDkWPIhrkPnBQIOHwEe6eDEUf54UrzSrSt2kEdDeAo46X1rduHj6sMPsN3RQ==
Received: from AM6PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:20b:2e::49)
 by AS8PR10MB6676.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:19:52 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e:cafe::9b) by AM6PR05CA0036.outlook.office365.com
 (2603:10a6:20b:2e::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:19:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:19 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:19:48 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:15 +0100
Subject: [PATCH v4 02/12] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-2-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|AS8PR10MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 275c8b6f-d649-478d-096f-08de59d2124a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJEMTI0WXgvQStsSDZvcmF5c0NwMnFuZ0l3RlpNaG0rbEZlcFB0cmVOTzBY?=
 =?utf-8?B?ZFB2MjRSbUd2aGladzI2aXFsenNPZ3N5bEdpQ0lSY2d6YWltOTJqNmRST1lZ?=
 =?utf-8?B?U1czQ1FRck0xcW1oR1JXSS9ma092dkxlTWJMaFg5YjZmbnhhZDI3V0F6YTVu?=
 =?utf-8?B?eUQrVTJPMm9tbzJ3VC94eTBBS2NwRlFRcXZDOWdOS1VlRG0zSlNKTmpnQzhG?=
 =?utf-8?B?cjFFY1pqbjNhUnp1N25MSGZubFVpek9QMlUxbDJGZnBIODdMR3VqaGFsTS8z?=
 =?utf-8?B?TEdQMVBUdlV4WlBtU2VGNW9zRUZuS0R6ZXVLaTVvemFBYitZaFRZb2NrY2lU?=
 =?utf-8?B?M1k4aEN6N0VCaE1QMmFlT2lweSs2dmhUNzRFZkJNcmgvTU15cjI0NXl0Z2o5?=
 =?utf-8?B?ZGxta3ZFK2RhQXcxWnZ5V3ZZd0gyU3FreGV6MjBXeDVMcUhxNU01d0dVRURS?=
 =?utf-8?B?Mk1DUjZQaVU4dGEra3dyOW1jb2thYkUvVUQ3a3NuTnZlSllJUEhOODFEbStQ?=
 =?utf-8?B?cyticHpaWmY2dytFUW10QWdmTStoT2svZUpDRHVKSkNTWmV0RmNuL1R1NW9y?=
 =?utf-8?B?SFhrbE5hRlZZWGROQUt6R2lIa1ZlblNadjluNEEycitONUM1aXRQS1lyUkhX?=
 =?utf-8?B?MTdxNEV1dDBQVEpzR2xhTDEvL1Y4RnhIdmpkQTJvNkpMeFJyUVJvVGVXQnU3?=
 =?utf-8?B?U214eU5XYXNQbGNjMFRUdnRDRXpoVG1xcHVlWkpXS2FlcXl1cmw0VEhHQVdk?=
 =?utf-8?B?MTdHY1QxdDY4bDB0cTVPeEduVGN2U0xudEhBZnNLcyt4RDVmNE91U2xocDho?=
 =?utf-8?B?aUZEeS82ZHhkaDdBR2tGdHZib24wM2U1WjI2c1dxUlZHR2R2OG15UlRORmdV?=
 =?utf-8?B?bXRKYjZ1cDFmQm9TVkp6cno3L2Y4OEdFZ3ZLeFZJQmZKdVFnUGljZWlwWVFs?=
 =?utf-8?B?T2pNR1VySFFWcWVPanBHbDBqOHRNVUtZVDh6cXI5b0dwNWoreS9jcWVOYzBR?=
 =?utf-8?B?Nk8zakg5TmZqOTU4MVZkMHIySzVZR2FtN3c3cU5ZeHErckNPeVltRFp2Tm5p?=
 =?utf-8?B?eUMxakM5MkEycVRCVlJoMTY0NjBVWkJQQ3NDd3hVdXNDeW1vT28yUDlEVTBr?=
 =?utf-8?B?VDV1STltZG9RUzlOcjQ5UER4aXFpdC9HL3JaQjNOYS94Qit2NUpPMmcxdzRJ?=
 =?utf-8?B?UEd5L1VaWkRaZVdaSWtxU3ZmVWlmMSt6OVk4ZVZaeUJaKzdLNlU0OEdubHRs?=
 =?utf-8?B?Y2IrVXpES1RhUDVZYmhGWlpicFZsdmR4RGRwNGw2cG1ZVzhoeVkrcTRZRExQ?=
 =?utf-8?B?YUpnRC9lUkFpc0FQU3NSQ1gvTWwveGdRb2NCdllMRXJ0eWswMUhoU3F3VnNT?=
 =?utf-8?B?d1MwdXNmZE8yeVpIVnc4VGZZOGdnY2E1R3VPb3cycHQ1N3JtOW5BMDh6NHU5?=
 =?utf-8?B?N1pmWDR3Z1NUWGhyY2t1c1lweDJLSFZoQTJzS3VyMlVqZ1ExeHVwOUlhWFp5?=
 =?utf-8?B?TUJJaEhGNW5HR2JjOFVDbnhlTDRsNXJFc2FrK2dGVTBmN0VLTHlTTGgzQkxt?=
 =?utf-8?B?dExlNVRySkwrOVFuak9DSGN2YWR2U2lFYzg5Q1NtcUJCRFp5OUhpWEN0TDlt?=
 =?utf-8?B?cnA4bWR1bW9adk5oVTFrdGFMRFZTOTFOMVJpZXJUdnN2ejZWNGpzTTNlUTBN?=
 =?utf-8?B?ZzlYbVNlUy8wcWZVY05NNG1HUUtQRUd6d3dkSm8vYTJGempDbStkcWpTUnQx?=
 =?utf-8?B?T0FHcW5TVUltUHhCTXFrWjFncHdMbjNnZlA2UlZ1WkRKUFFrUks3V2g1LzJn?=
 =?utf-8?B?VytYaEpmZDc5aUltVlYvUEhCNDdSdTVhQjE1aVFuc3ZUemcvYWpzQjFPanov?=
 =?utf-8?B?ZEhjNGk4UjVLMldrdkw3VHllT01UWHJndE5DT1lBc1VtRGE3OEtldUdHY09D?=
 =?utf-8?B?WW50Yk1aQWVMOEtxVFdVdFNyWXZWa1NRSzdod3diUlJoamlWYW1xbjdOTXAv?=
 =?utf-8?B?UDdQdjd2VXR1NGsrVWpEbWRJMWhWUDg4b3pvVWo5dzRXd0VyS1ZuNG5FVElQ?=
 =?utf-8?B?S3Y1QW1kS3dML092NFMwc0NoalRaWTZjYnVGekxYVGNBZGt1Q3Mvem90bzBs?=
 =?utf-8?B?QXpNcXc5dU5tdWRqVGRJOFJNNHFoR0k3WllVV2xCNzRyYTY4T2ZaTlhNZDZ5?=
 =?utf-8?B?eXF5WVVJYW9jdXNTRk5pWk92QXVUNnd4cVc3ekVHYWtPTW9Rdi9JRUJHMXR6?=
 =?utf-8?Q?+Md7cgIBbPn0aCRML/570sXZJ4YNRYOk1/3rOoGcME=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:19:51.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275c8b6f-d649-478d-096f-08de59d2124a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX/GmHKUvAKiKr
 L6yu684LkOVE2x+54T3IcDuZA/De0x4/dC4x+UeVRPkhVJqKuAlJfxMmbT9uKbga0CWAUTiHI9B
 kR9dwnKYWDcNZTg9ubKV2KPOVj9dm0A7NW+LU9L2TlQmi7FIS3r0JQmir24Vok6aKzgHYqCRslY
 quDRV3e2RnSbYMylti0D3l1Yc2aMsWmsi6jH3uyd1Eu/KSM/BuTXCOOBZ4LDITOzPlDwBhWgYAo
 8A1jfcT/MEiAePEbPcvOrdotCFV6IPzCb3i89mF16INNMfAB0HmZNW01zofSZg3CD5X7z8eUD6/
 cvrANaTzgbqHsCafDbRDQftJv6Zx0yTMozobZu3DMRv7R4EzUHsjqkVtoJh7WXqtGxHJG0JPVCA
 E9u/TJMMce4Tw/dC6SQVgTILYjwdNNpfmhSsNUzVTbfGtlewCFj1l+8VceqhmWRCQDr2wCcEvQ9
 qYRdhDFd3t/PP39MQLA==
X-Proofpoint-ORIG-GUID: sD7LCa5I0cj9ws9wSd-TG0ACiCFvRX0E
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=69724e2a cx=c_pps
 a=JAMRFgSbGDdy//P2Vyed4g==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=LS5lh7VHtsIGWKReRLIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: sD7LCa5I0cj9ws9wSd-TG0ACiCFvRX0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_082010_589080_E1F19CD9 
X-CRM114-Status: UNSURE (   9.29  )
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

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..8f8b4b68aaa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,12 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    items:
+      - description: debug configuration access controller
+      - description: access controller that manages the HDP as a peripheral
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


