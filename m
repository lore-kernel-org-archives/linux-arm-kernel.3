Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB772CE8D64
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=; b=yxAiMeoljNjHkvAxHCvdBq8FkY
	1Es+A+g2/h05Oc6V1xot13tEhQHk6sRORy9gSDwVZXAFOkOoEo3/7lk/JEp5XB2HpRvlrObQqaDZB
	olVAr6Ipnm8YW7F054jm8PWfSRA/I9RaEUP7z85iEG1SJ+W+ag6OzPk4jRefHIVO0eUn/u0xNHOEj
	JbEgULi80RbwhMPbfgHiKR8FdK3lEkSLxUzjf05OToCPk6TyggFG6xV95uvre1ATkV49yRVF2l6g4
	dNOy8nMIcR/uTR6JOh+LkfDr7of9mLYfeYZ6Dl4hOxuRnMRPHRQxjVv4xe3axTKDsaYINP1Veeh62
	l3kC96Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ5-0000000CpxX-3xBo;
	Fri, 14 Nov 2025 17:26:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxZ2-0000000Cpva-0Ft9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:26:26 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEGjHJv3048546;
	Fri, 14 Nov 2025 18:26:15 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkx9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 18:26:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCVSJ0RuZp+McDwYukOBcduPDLjF7JaT3jJZc3nrtw/derIQkDn3ekvxttmMp4luc5IFbLhU3zKGMZ5MCIM+SPuyzGskwdWjHgZJrFhFWbZWAScwc9//5ZXAnt7GoPRSEDXaCf3IzDX79kY/iVhb90gRKYeR+O3Ca8y4TYMONETPJTMoLFz3iD+X/cCTCnoncECJ7M06G01kfOxnvv16NMciNQjx4xm17d4uCs5HU0772yKSQjJy0svjwEGtJIx5Pct+Wt3fQMFvwDaRazavX6StQXQdQkHQ7DjT03NsDP+3FWL0ihlZu46ZbBby+WOCeFckg/fWf7CllPlVw/J7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=tb9lCyKq92wT9pf/cWO6APKY00pWMioon3iWY/M9OzPPPpANImzDzU77QK58/1cNUgDZqQn2d8Wx1kcIoCHtDje9dzXUJOmBjcoZ7NyvGXp1/2lJcFJsMWL9Idaiv5GXtYjjbEU1oVzQVQKJkAeRFd2lZhbuD0SBOEdCS3Cyu12TdqMko0yvp8Kf6Grwp5TXPaL6jGmAex27z5gBaCR0Rk8pjNjeCZecn9qzHqnaQ5CEDYhCRhLLRpkugDaK7JGln8RxFC4aPYj234rIAwk/X10k0TPgpj88bQhmOLg7qMrtGs3cVN+eqT5x91HBVEgOD1NMk+X+yt0VoP9AaskQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=eUkvbbBIaOYCjgBqnvfu3Dfc6xa/rSgSwNME3yaBkLyTInaa9VNyQeObI33kVE4SPAgW2qz4rcFukboyGixvC38iF6148q2QbwZfFD59TLXqw+5Yt+jYxAIOXmytRbIp2n6sEOW2+03+Ev26N6NtDX2hP7eFD7bw9tcW4VTqYgcCt/re2Guh7ZkGiEctyWE/pXfnBry5J9Q229MsT999qMZ2AuSXx4DjuuKUJHjNF2q5xYyh6baDXax4A6UehYNCB+sRRvPPmt1vrmB9C4kN91qak9gydUsKkwc+u20njLJGD1jiDLMTv4ksEq2lL2/LtRKSwTTYNiOnKtWvrpkdqQ==
Received: from AM9P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::13)
 by DB9PR10MB8144.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:26:12 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21d:cafe::cb) by AM9P192CA0008.outlook.office365.com
 (2603:10a6:20b:21d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 17:26:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 14 Nov 2025 17:26:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:23 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:10 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:03 +0100
Subject: [PATCH v2 3/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-upstream_uboot_properties-v2-3-3784ff668ae0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|DB9PR10MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edb6211-b68b-4e1a-cc6e-08de23a2e828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzU5MWNzajJldFltWTBOSEYwTmpmZFlrZS9MMUdTSEhKeWVxTUVTNFBQZitv?=
 =?utf-8?B?U2NWYzJTcmdEbThlVGFGaU9MWjkvUmhVVjVuNnFIeHhLSkRnSjgwMnNrRkE3?=
 =?utf-8?B?cEkxckcrOG5xM0JFVytFQ2ZKYlYxVHZNOTBCeExFanBvSERqS2dDZHJnaXM4?=
 =?utf-8?B?MkJzTXh4TWs0d0xZKzVZU29YNjVjODNsck15QjBmcld1MjB1N3hoVjNhS05R?=
 =?utf-8?B?WXlhTU5SRmFLeVg2VlVJUTRqWFg3Skh2ZkdNMXp1Qmh5ZXFvN1BLd0Vna0x3?=
 =?utf-8?B?Y0NnSVk1U1ZOK3Ira2svVDJreVd1QlVHMGtJbEg1VkpPSVRKRXowdVpmZmJI?=
 =?utf-8?B?d0h3ZXBTRU5qS1FpV1J6cXdMOVZTUVlTSzdjVnVxMGpwa2VDQlp6MnBSM2k4?=
 =?utf-8?B?QVEyU1RHZzdYNjJSbFlBTEUvbVVnNGFpc2hiTUFMSy80anMxSDgrNzdjTTJz?=
 =?utf-8?B?VHFmdElvWUhYTmhVOCt2R2I5S3dWS3MxWVdsMC9JbkVrOEZpU1R6Y1FxMldY?=
 =?utf-8?B?dExMcTRLaUVUcSt1NURTVlg0Wlk1eFRhV0NmTWVPOXlLTVBmUTZUeXNDczFT?=
 =?utf-8?B?TGM2NHQrQlZaczBDNk1JTTFTejBWTGwvSVIrM1NyL0xwQlQzVWl4bHcrbElG?=
 =?utf-8?B?bUdBUjFYZktoM0NlQ2hza29xZENpVFRLTlc3ZnpnMnFuNG02d1dpRlBEcEp5?=
 =?utf-8?B?NCs2QWd0KzVraGNQenRTaldydHg2c3ovbkJ4cE1MNFRSRVhFNUtIaEhvYnhV?=
 =?utf-8?B?K2haaUFybDJVZFM0M1h3b01WY0E2WFQ0YTg4bHREOGJiUzdmQzdwOW9hYjMw?=
 =?utf-8?B?Q0pINlRXcUlOak4rYk5UaWpmZG1lL3Iza1crOTZGLytjcXIydHdHa2VvdUlm?=
 =?utf-8?B?bVN3UUttM1ZNRHJvczl0YlBpOHN0TlMvNDlGRnZMczhnRmRGcEI4VjdVcmdj?=
 =?utf-8?B?SjQ2UzU3SEhxcFVrbUxwcWtFZ3pyVGExY05xcEJSZ3U2enhqUEVqM1pWMnBD?=
 =?utf-8?B?bUREZGs3L0pNU3dQZzQ3ZktPWm5meVhNakU4K1pZZFBoYXhLdmdJMUxKa3Zl?=
 =?utf-8?B?RmlLZUJtOU5DdEZhTS9maEQxM0hFV0FGTnJ2SFVZeEFIQUhvS0JqZjE1b0JV?=
 =?utf-8?B?NmFQSjZWWnVLa1FaVkVTZlloL0MrTEk1UEZaUXhIRXgrajk4TTR5YkVQVENk?=
 =?utf-8?B?UXkwTWY0dUhncHVCNU5LZUxBQ2F6clJqbkJnbGJOVDMyZkpxeXRNdC9NUkFG?=
 =?utf-8?B?elFyWVRvLzkwdHJONGU5VkttZXhJVURKeFdmN2NEc1g0YzF5Z1JvYTgrbHNv?=
 =?utf-8?B?V2lKemdHVjNoaS8xbVZVWGY4TGFZZjY2L0pSRDJpdlh2bmF3bmx0ZjlkTDZK?=
 =?utf-8?B?dHBha3gvTDcrKy9oMnJ4bCtreWhLTC9vaEJCNGM5Qzk5VFpsVmtvYjVmdWZa?=
 =?utf-8?B?T0cwYmFuV2FDVHg2TmxVVEVWRkUxWHVqM0Jpem52TEkxczJpb3Nvc2RtbXFE?=
 =?utf-8?B?NmlWbkpyWUFUc3krUlVPdm9iYk83aFdKUDJ1TU10NW41NGQwTzBRYXZyV0RG?=
 =?utf-8?B?ajU1WFlXc3lQNnBDU1RMTzRwcitaQVZKUDYvbmJrSGl4MG5pdWxHWmdQdk90?=
 =?utf-8?B?WFRRUkNiMFdFaU9wUHc0WHI0MXh4QVFLUnZYaUdTclFuMEFIMG43bi9Gam5q?=
 =?utf-8?B?ZzFjOTF2OEJpUDdSenZMeE42Y0drR0FHVnU2alBZdHpRLzZmM1F2T2JxL1J6?=
 =?utf-8?B?clZLYWFjOWx4WVdvZ3NLMXI4UnNKQnAzZmczOUhQbkhNZHVSZkRMN0tJcVUy?=
 =?utf-8?B?MDdJNUJRTUlwUXowMFM4MUpmaUVIdEU3ZitxdG9ZNFU1aWFGa0VqZ2RlWGV4?=
 =?utf-8?B?cVpPakpPUWVEVVc2RUowTFRQbmpzWGtBbkJ6b2h3NlN2UWhPQmFreXhKU3FZ?=
 =?utf-8?B?RlI3KzVqZmpXMC9seWZObUNxK0hsYXhzenJvdG5BSDUvMHgzK2FMa3FXcjgw?=
 =?utf-8?B?SDd3VThoN280NW5UNFYyZC9XaU9GZmVPcTQ3dTNlZWxtWFY0a2FZd0RDcjdp?=
 =?utf-8?B?eUhReUZSRkdwa3E0OXprNmt6MWc4c3pSc0p5UUJ5M0R3bWhiLzVGNnpnZW94?=
 =?utf-8?Q?2ids=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:11.9080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb6211-b68b-4e1a-cc6e-08de23a2e828
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8144
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX166KJNpTsBZu
 QY0kMU/LIbWHDwFu/9LZYK5L4qbrWL1mwqtBmzBYCY6S/lR/oSlbCTmeS8d2MgDRo2+BzhY90k6
 ch0PJt3IG/27K3BLr5m4zhb5wz9fDtJ4IowXM2ft783J8UqiE1/9SonFf56Mo4LWcTM7IORZgWW
 Rj5GzQhdEk9So1LNGsPawc1NDe35ugMCzxifl9Kf1LEXeN1ekvCCd08kMLGvipp3/US7JjHXvXr
 EjaghsVuRJ9vCjtwyf0tnk/e2fvm3wUZN72cJBUV7haD6cXci3L/aT4iHYs6WnMpM8tzwEUSJLi
 XyoSxnt4dYRSmXMl4CPmNVTxxXpfELKagZSp+BSXq4+12Fq6R9bFeJV1yf7a2R5SqL40Ds6C38z
 /4d7Ir9Vmea12ac6t6iZUXyAUtERFA==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=69176637 cx=c_pps
 a=0zmUzcJTFRqYFPDzer3aug==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=HILBdA-kGuq4vTFu6uoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: rxW8NiH8mYatI7WiKTIJgLlpGyRMXQ4Q
X-Proofpoint-GUID: rxW8NiH8mYatI7WiKTIJgLlpGyRMXQ4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_092624_582350_DC89EAFB 
X-CRM114-Status: UNSURE (   9.17  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..790e4558c905 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -50,22 +50,26 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
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
 
 		clk_i2s: i2s_ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
@@ -75,6 +79,7 @@ timer5: timer@40000c00 {
 			reg = <0x40000c00 0x400>;
 			interrupts = <50>;
 			clocks = <&rcc TIM5_CK>;
+			bootph-all;
 		};
 
 		lptimer1: timer@40002400 {
@@ -547,11 +552,13 @@ rcc: reset-clock-controller@58024400 {
 			#reset-cells = <1>;
 			clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
 			st,syscfg = <&pwrcfg>;
+			bootph-all;
 		};
 
 		pwrcfg: power-config@58024800 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x58024800 0x400>;
+			bootph-all;
 		};
 
 		adc_3: adc@58026000 {
@@ -596,6 +603,7 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
@@ -607,6 +615,7 @@ gpioa: gpio@58020000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@58020400 {
@@ -619,6 +628,7 @@ gpiob: gpio@58020400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@58020800 {
@@ -631,6 +641,7 @@ gpioc: gpio@58020800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@58020c00 {
@@ -643,6 +654,7 @@ gpiod: gpio@58020c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@58021000 {
@@ -655,6 +667,7 @@ gpioe: gpio@58021000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@58021400 {
@@ -667,6 +680,7 @@ gpiof: gpio@58021400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@58021800 {
@@ -679,6 +693,7 @@ gpiog: gpio@58021800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@58021c00 {
@@ -691,6 +706,7 @@ gpioh: gpio@58021c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 112 16>;
+				bootph-all;
 			};
 
 			gpioi: gpio@58022000 {
@@ -703,6 +719,7 @@ gpioi: gpio@58022000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 128 16>;
+				bootph-all;
 			};
 
 			gpioj: gpio@58022400 {
@@ -715,6 +732,7 @@ gpioj: gpio@58022400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 144 16>;
+				bootph-all;
 			};
 
 			gpiok: gpio@58022800 {
@@ -727,6 +745,7 @@ gpiok: gpio@58022800 {
 				#interrupt-cells = <2>;
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 160 8>;
+				bootph-all;
 			};
 		};
 	};

-- 
2.43.0


