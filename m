Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A556FD232EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2QK3Hh71r/4mV8OBpz0bJTqZfqJywV63rSNyg5ECu0=; b=LF8PflGhaftCAk3mhvjEzd++o/
	a17UpUG+x+9dBaSdkUd/xfhcB3rsjeti0dDmSnQX/m09qPVJSB2PcpDJDsE3+c7kPKNOVFWk76cFb
	RTIo90PyrJrnznyPATFVCGIr9eVihiETxcQ95TF2wdw8kr/Pu0eWwupENp/IQ66VR+rhjo91rfHhv
	Ao+W88fxsgGNODPHQti0743qBwylGJ1IyHD060jEvR0A2yRNobLrvQXxFxEsGKWqnHlaUi40iv3vS
	NjeybksQmwbxk9tVbzbZmGYW7Sda+oj4LHZqYtksCN5eOytKNl3h41LNgQCguY3Pvky94/5rEJxdd
	B06qHphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7j2-00000001rwg-3Uz0;
	Fri, 09 Jan 2026 08:20:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7ix-00000001rvY-2kDr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:20:03 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098BbSe3894724;
	Fri, 9 Jan 2026 09:19:53 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv220dvd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 09:19:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9dk2u3GBnypC4d81g2xwZO6qkS1y6Gv9EQIV5QKYS5DhbFGO7ivTQHJnMP9AS6MF1a+e54ufwMEIWIAjbzpUkrBcjbiYFzjGBE6YHW2Qx8RezFB5ojsM6mqrDg1ER5DZBlRhqAMCDYzDHciX0H94SKGXBE2ytio0SqmlnDRuaMx++UzYUx80RJDlPIV1Upud0OPtT0pFLBHDT3EI0daV6KaMvHOMAEaazh1yeXbXOIxP2G8WV5js43lJe5tK1B+cD9rt4nUaeN+/oPrsgSUu9BRYFRmVKpuvMX2ZCqu6RPxjh1WblIN3WOaprSEecofCTJdsd0X6L20oheqWxlRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2QK3Hh71r/4mV8OBpz0bJTqZfqJywV63rSNyg5ECu0=;
 b=LX2ogWgdpzdPvOh995P5C6HNZ23Kq4KP7vq42WDN+cQHT8AazqzCkZIc62bxGfsi4vQiFKNCYNA3SJoS9icSIDSR/eHWXVwL+EM1VLfh+rcONvhO4G+nYEKt4ONSq06FL0qEE6KGzZHEqOBnzw1QJrubp5xQR4FqDb6qQR8fCCKgIg4lBal2czXb6gTYGcciSUT69Eo9shkQmIORUGG1t2XtlAKi/AURSWuRCIcv4lOwTlijzrKZJjrqXT9LC/c5oiL1cm4p3u0o7wPdbjv+A3IkNAEcvGZ8rl7ZjWpB6de+HNcy5LCq5XaukuJNAE2CyqJnt792OFdevPtEDATjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2QK3Hh71r/4mV8OBpz0bJTqZfqJywV63rSNyg5ECu0=;
 b=FLoOidprke+wOYKyxdSMvFd3jLhxqN99K8nNTpL28ro3Lb+XfZbHwiIWgx1NIdi1VUa1tKgLNw+y8NjrQ7ou1mE3ktw14Z7HaMWcxTK0vyCwjTXeG/cV633HkjO35K4FhSyltt9Dr3D27CjBzSopC3N3cEIeNbhtvIchB24SyB9Q4Nw3qJOxvu13TI/e7h2Cv7anPgrwrjRqMQBJXF9joGUkU4nxiSRd1XIjMEEWc/FG+rIplzugNhFXY7mpGV0VvOxClmD0AYYxGHW7CM9Qq3tGfd4r0STEYTA2RRupbc1L3vfctiTiaLfz0kSJyBJXfdoyaotq4/MQt38N4t28lw==
Received: from AS4P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::15)
 by PAVPR10MB7090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 08:19:45 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::31) by AS4P192CA0021.outlook.office365.com
 (2603:10a6:20b:5e1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 08:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 08:19:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 09:21:01 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 09:19:44 +0100
Message-ID: <b813fe11-c7f9-46f8-a574-c4c9d8018afe@foss.st.com>
Date: Fri, 9 Jan 2026 09:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
 <20260108-upstream_uboot_properties-v3-5-c1b9d4f2ce8d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-5-c1b9d4f2ce8d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|PAVPR10MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: d155c8d1-503d-4937-7742-08de4f57d8d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1BXbnpoMHRBWTVidW13d3l1V0NXMndGWEY4Mm4vL0JGdUJKZXpmNUdldG9z?=
 =?utf-8?B?S1dsd21Cd1Fnc0YzRDlPZ2lMaElJM3NXZHpjTHhxUlRXRDV2WVRmR0JkZU5o?=
 =?utf-8?B?NEppZ0tTZ0R4Z2YxR0NRTVJTYkRaOTNkdkpBLzBKd212aHhhelNGanNhNkly?=
 =?utf-8?B?Y21Dckh1djJVNWVXRmhUd1M3Vjc2bE5sY3pDR05KVzRFdFVYS0xuOFNMTkJv?=
 =?utf-8?B?WVVKdUtxOE5takZIQ3B4dGFiM2V4N2hDNFdWY0s3OUJoTWo4dTBiWERXQ2gx?=
 =?utf-8?B?ZHVHNTRmdTdWOHVrYWtIWmlQVjZWZHFEMGxJS2VDTlhCazhWTitrN0ZJVjdY?=
 =?utf-8?B?dGpYSGQyNTQ4YVQ0SXZkREpiUTE2WFh4Z1l3SzFpMVZyTllLODltR0FxMmZ5?=
 =?utf-8?B?SEhKQTRjN0R1WC93WDBLOFFzVnE4b3RDRW5ZcDFoUUYyYWRES1dvWkZvcS9I?=
 =?utf-8?B?VDBjamZvcmZwOFU1SzkzVXJ5NnVoM0VTZU9rRjZCV3VZUjZYb1RNWEltRFo3?=
 =?utf-8?B?Z25UL25mWkU4WjRDM1FNbjV1bHUwaWVMME4xVFYzQWtBcE9wMVlpVitXNUl2?=
 =?utf-8?B?UFJUbXRuN3pWYnlDL0NXN2h0RlhYTkI0OVY1MldaWm9WbEtxWTJ0Qk9UYThi?=
 =?utf-8?B?M2RrNzRYR2g0WTV6S2J1NHRXQkxsTnFsK2ttc1QzQWRDek5DelpJT01UZkZ1?=
 =?utf-8?B?b3RxeG4xQ01vM1dPemVNMWJSOGdzMU1WOG5OcVVSVkFUSmZHZG9LbGpObHVt?=
 =?utf-8?B?YW5UOWV6WGd1eTg0SUd3dXdPUDhWWTl4QklnV0U1bDNvUTNsNWtaYTFjZHM5?=
 =?utf-8?B?ckRDaUtxZWR3Q3lDQ3RENUVMSFdXNEg0SHNTcTdkYThHRTRLTXZENkJVSm15?=
 =?utf-8?B?aW5RRDZhQmpJVlhCMmVVSmUyblFQaHlBUUw3Y3F4ZzAyL01iY1I2MUQ3UU00?=
 =?utf-8?B?Q21EVkVWTm1OYmI5ODc5dGYyd1NLWllqdkRTNUxRSGJoYmc4RUxmMFM2VVMr?=
 =?utf-8?B?eS9XMGFZV2JLWUl2bWhtYVZMZGFRNGV4V1VLRXVVSlQ1Yk1HT0ZNV1RoZkhr?=
 =?utf-8?B?Yk5NYW1LMmlBblZrRWVBbmFPWmc1dGw2cUpjb3NORlptVEFPL2t2Z0FWS2ZL?=
 =?utf-8?B?L01XMXJXSzlQaWpnblFOR25MbVdlK05razQ2Mng2bThEWVQrUTVsUm9rL0lR?=
 =?utf-8?B?cFdzQTVIdW1ZdzZQZG1RcDNzdUpQYUZ4eEFUNk5MK0ZZazlGV1N6OFBuTXdV?=
 =?utf-8?B?MmlKN3VvNjYrK3d3c1ZXSWNvNHVOM3dtL1hVVUlMSG1ZNXhYUnF3TDlGb01k?=
 =?utf-8?B?b2ZVZHNUYU5UcWhMOFB2V01JTVFzN0ZOUTFaTk9yRFVLYWRBWVg0aWltbDdh?=
 =?utf-8?B?VGxSU1RQdjlBNE9MZGdJZkpsU2grQmNyL1Nwb3dkUG5rZ2hObnZaZUd0aGk2?=
 =?utf-8?B?R2FDekpTMzNzNC9kZUJ3aFpTTWg4Qy9HTTB1OWxBUGVKd1V4UzFCUVZzNlVZ?=
 =?utf-8?B?MmdmcnpvMEtYR3VRbWRBM2JDaENBRHlUVXB4UkZodmZWM0pxV0txOEZ5UnNo?=
 =?utf-8?B?dVRjTEpKUTh3UTExOTU5d0NOdjhDYjRPZ2hhcEZIcG1IZkNRU052NVo0OXlx?=
 =?utf-8?B?dGhCYis3MHRkZk1YampabjVkREEzNnVqRmpabXUyaVNiSzc4Q0h5ODd5U2ZV?=
 =?utf-8?B?NmVjQzVWNUE5ajUvNTdkNStWSlh1ZndUUFlwc0dETStPVVF2eWpUK3puSkR2?=
 =?utf-8?B?UWlZclpWdENBQ09IaEFlVUp2ZGt6U0lydzkzRUdjV2JjYXRFVklGeWU3SEFv?=
 =?utf-8?B?R2llaHgrNkJLaElyWGx4akFZakV2bmdyMG40MFZnbldwQlB6c3R0SkRtWEtG?=
 =?utf-8?B?QWkrNWphODYyYzJsaDdPVk5RTGhuMTBVTkRUQUNGM0p4Ky9ZZEtpVnh6UVJk?=
 =?utf-8?B?SERlT29xRlR0bWJPcEIwUGQyWUdXOXpzK2pTam9vVWR0Y2NiY3JSa0NIWmpO?=
 =?utf-8?B?Y0JJWC9vNUM5YmU4aWp6eEpVaEpaNEs4YWxDaUJQY1BrcEN3V0wxY09BSFB1?=
 =?utf-8?B?c3dwd1EzQWtKYkZrQXY2cSt3T3FLSVpxcVFudDgrb0U1d0NSUHlCTVYxRlFm?=
 =?utf-8?Q?Y4Fc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:19:45.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d155c8d1-503d-4937-7742-08de4f57d8d8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7090
X-Proofpoint-ORIG-GUID: KJ0YZsjkJ5jA4sCDgeRww4vsuZVOym_U
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960ba29 cx=c_pps
 a=/rRiG8GCWFf73VG6a0KYlw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WVY5MGAiIZNno7D2EVEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: KJ0YZsjkJ5jA4sCDgeRww4vsuZVOym_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NyBTYWx0ZWRfX4CDANs+txCtB
 3D7v8rO0mpxQE/XrBlesd3Emj7azzUj3VQ+TeDM4UyDpptqTnPHRgzK0oG2jAcpmU4WxkF2fxn1
 37NONG4EagV3XQISWuyy61RTR1tQmzlDunSrp8ofeAuxVagZ2cvjSwmnf7TFNhq6CuUwZCSTi0Z
 9qbsEE0dbLOXnSTrHqJoVI4ZpSxOJTfH0hDELVe5zAFCoMUtXtb0HSK2AvMtn7Jk7ehqTrdbylj
 Yd7U16z21f4wmBkvywh7bND0gw9bsoj0ngA59+Gu2TGKNF7El92IDEWMQALCL/437MZf01RvAmH
 NuHUtvpxbwMth/ork2IvmcXn8swprcfb+IDHg3Dsu9mMIFYZ6DYnXDYMxxD/In8YNwghNa+7VDO
 8Cj0H4XWcIqd9CpGETvxHaeAMxm71IBbknJuKppa2nW3iiOZgdiNlrGMwwKGj7BBQaSfazIR+WN
 67iPBRahI2c0V+kHVQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002002_119228_AADA0735 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Patrice

On 1/8/26 18:16, Patrice Chotard wrote:
> The bootph-all flag was introduced in dt-schema
> (dtschema/schemas/bootph.yaml) to define node usage across
> different boot phases.
> 
> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
>   arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
>   arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
>   9 files changed, 290 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> index 98552fe45d4e..c58d81f505be 100644
> --- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
> @@ -13,6 +13,7 @@ optee: optee {
>   			method = "smc";
>   			interrupt-parent = <&intc>;
>   			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +			bootph-some-ram;
>   		};
>   
>   		scmi: scmi {
> @@ -20,6 +21,7 @@ scmi: scmi {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			linaro,optee-channel-id = <0>;
> +			bootph-some-ram;
>   
>   			scmi_clk: protocol@14 {
>   				reg = <0x14>;
> @@ -64,6 +66,26 @@ scmi_usb33: regulator@2 {
>   	};
>   };
>   
> +&iwdg2 {
> +	bootph-all;
> +};
> 

node update useless as already done in stm32mp151.dtsi

> +&ltdc {
> +	bootph-some-ram;
> +};
> 

ditto

> +&pinctrl {
> +	bootph-all;
> +};
> +

ditto

> +&pinctrl_z {
> +	bootph-all;
> +};
> 
ditto

> +&rcc {
> +	bootph-all;
> +};
> 

ditto

>   &reg11 {
>   	status = "disabled";
>   };
> @@ -72,6 +94,10 @@ &reg18 {
>   	status = "disabled";
>   };
>   
> +&scmi {
> +	bootph-some-ram;
> +};

Already define at the top of this patch.



> +
>   &usb33 {
>   	status = "disabled";
>   };
> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
> index b1b568dfd126..7abee7ce0580 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -33,6 +33,7 @@ arm-pmu {
>   	psci {
>   		compatible = "arm,psci-1.0";
>   		method = "smc";
> +		bootph-some-ram;
>   	};
>   
>   	intc: interrupt-controller@a0021000 {
> @@ -54,34 +55,41 @@ timer {
>   	};
>   
>   	clocks {
> +		bootph-all;
> +
>   		clk_hse: clk-hse {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <24000000>;
> +			bootph-all;
>   		};
>   
>   		clk_hsi: clk-hsi {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <64000000>;
> +			bootph-all;
>   		};
>   
>   		clk_lse: clk-lse {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <32768>;
> +			bootph-all;
>   		};
>   
>   		clk_lsi: clk-lsi {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <32000>;
> +			bootph-all;
>   		};
>   
>   		clk_csi: clk-csi {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
>   			clock-frequency = <4000000>;
> +			bootph-all;
>   		};
>   	};
>   
> @@ -122,6 +130,7 @@ soc {
>   		#size-cells = <1>;
>   		interrupt-parent = <&intc>;
>   		ranges;
> +		bootph-all;
>   
>   		ipcc: mailbox@4c001000 {
>   			compatible = "st,stm32mp1-ipcc";
> @@ -142,11 +151,13 @@ rcc: rcc@50000000 {
>   			reg = <0x50000000 0x1000>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> +			bootph-all;
>   		};
>   
>   		pwr_regulators: pwr@50001000 {
>   			compatible = "st,stm32mp1,pwr-reg";
>   			reg = <0x50001000 0x10>;
> +			bootph-all;
>   
>   			reg11: reg11 {
>   				regulator-name = "reg11";
> @@ -354,6 +365,7 @@ ltdc: display-controller@5a001000 {
>   			clocks = <&rcc LTDC_PX>;
>   			clock-names = "lcd";
>   			resets = <&rcc LTDC_R>;
> +			bootph-some-ram;
>   			status = "disabled";
>   		};
>   
> @@ -364,6 +376,7 @@ iwdg2: watchdog@5a002000 {
>   			clock-names = "pclk", "lsi";
>   			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
>   			wakeup-source;
> +			bootph-all;
>   			status = "disabled";
>   		};
>   
> @@ -404,6 +417,8 @@ bsec: efuse@5c005000 {
>   			reg = <0x5c005000 0x400>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +			bootph-all;
> +
>   			part_number_otp: part-number-otp@4 {
>   				reg = <0x4 0x1>;
>   			};
> @@ -1876,6 +1891,7 @@ pinctrl: pinctrl@50002000 {
>   			ranges = <0 0x50002000 0xa400>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&exti 0x60 0xff>;
> +			bootph-all;
>   
>   			gpioa: gpio@50002000 {
>   				gpio-controller;
> @@ -1885,6 +1901,7 @@ gpioa: gpio@50002000 {
>   				reg = <0x0 0x400>;
>   				clocks = <&rcc GPIOA>;
>   				st,bank-name = "GPIOA";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1896,6 +1913,7 @@ gpiob: gpio@50003000 {
>   				reg = <0x1000 0x400>;
>   				clocks = <&rcc GPIOB>;
>   				st,bank-name = "GPIOB";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1907,6 +1925,7 @@ gpioc: gpio@50004000 {
>   				reg = <0x2000 0x400>;
>   				clocks = <&rcc GPIOC>;
>   				st,bank-name = "GPIOC";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1918,6 +1937,7 @@ gpiod: gpio@50005000 {
>   				reg = <0x3000 0x400>;
>   				clocks = <&rcc GPIOD>;
>   				st,bank-name = "GPIOD";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1929,6 +1949,7 @@ gpioe: gpio@50006000 {
>   				reg = <0x4000 0x400>;
>   				clocks = <&rcc GPIOE>;
>   				st,bank-name = "GPIOE";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1940,6 +1961,7 @@ gpiof: gpio@50007000 {
>   				reg = <0x5000 0x400>;
>   				clocks = <&rcc GPIOF>;
>   				st,bank-name = "GPIOF";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1951,6 +1973,7 @@ gpiog: gpio@50008000 {
>   				reg = <0x6000 0x400>;
>   				clocks = <&rcc GPIOG>;
>   				st,bank-name = "GPIOG";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1962,6 +1985,7 @@ gpioh: gpio@50009000 {
>   				reg = <0x7000 0x400>;
>   				clocks = <&rcc GPIOH>;
>   				st,bank-name = "GPIOH";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1973,6 +1997,7 @@ gpioi: gpio@5000a000 {
>   				reg = <0x8000 0x400>;
>   				clocks = <&rcc GPIOI>;
>   				st,bank-name = "GPIOI";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1984,6 +2009,7 @@ gpioj: gpio@5000b000 {
>   				reg = <0x9000 0x400>;
>   				clocks = <&rcc GPIOJ>;
>   				st,bank-name = "GPIOJ";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   
> @@ -1995,6 +2021,7 @@ gpiok: gpio@5000c000 {
>   				reg = <0xa000 0x400>;
>   				clocks = <&rcc GPIOK>;
>   				st,bank-name = "GPIOK";
> +				bootph-all;
>   				status = "disabled";
>   			};
>   		};
> @@ -2006,6 +2033,7 @@ pinctrl_z: pinctrl@54004000 {
>   			ranges = <0 0x54004000 0x400>;
>   			interrupt-parent = <&exti>;
>   			st,syscfg = <&exti 0x60 0xff>;
> +			bootph-all;
>   
>   			gpioz: gpio@54004000 {
>   				gpio-controller;
> @@ -2016,6 +2044,7 @@ gpioz: gpio@54004000 {
>   				clocks = <&rcc GPIOZ>;
>   				st,bank-name = "GPIOZ";
>   				st,bank-ioport = <11>;
> +				bootph-all;
>   				status = "disabled";
>   			};
>   		};
> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> index 847b360f02fc..f721c398e576 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> @@ -85,3 +85,17 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
> index 0da3667ab1e0..c4581e28504a 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
> @@ -23,3 +23,46 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   };
> +
> +&i2c4 {
> +	bootph-all;
> +};
> +
> +&i2c4_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
> +&pmic {
> +	bootph-all;
> +};
> +
> +&sdmmc1 {
> +	bootph-pre-ram;
> +};
> +
> +&sdmmc1_b4_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> index 1ec3b8f2faa9..4fc670bb4cb0 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> @@ -79,6 +79,17 @@ touchscreen@38 {
>   	};
>   };
>   
> +&i2c4 {
> +	bootph-all;
> +};
> +
> +&i2c4_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
>   &ltdc {
>   	status = "okay";
>   
> @@ -93,6 +104,10 @@ ltdc_ep1_out: endpoint@1 {
>   	};
>   };
>   
> +&pmic {
> +	bootph-all;
> +};
> +
>   &rtc {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&rtc_rsvd_pins_a>;
> @@ -103,6 +118,20 @@ rtc_lsco_pins_a: rtc-lsco-0 {
>   	};
>   };
>   
> +&sdmmc1 {
> +	bootph-pre-ram;
> +};
> +
> +&sdmmc1_b4_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
>   /* Wifi */
>   &sdmmc2 {
>   	pinctrl-names = "default", "opendrain", "sleep";
> @@ -127,6 +156,20 @@ brcmf: wifi@1 {
>   	};
>   };
>   
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> +
>   /* Bluetooth */
>   &usart2 {
>   	pinctrl-names = "default", "sleep", "idle";
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> index 6f27d794d270..00d4855f9a85 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> @@ -90,3 +90,17 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&uart4 {
> +	bootph-all;
> +};
> +
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> index f6c478dbd041..f63a3d68d2b4 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
> @@ -168,7 +168,9 @@ &i2c4 {
>   	i2c-scl-rising-time-ns = <185>;
>   	i2c-scl-falling-time-ns = <20>;
>   	clock-frequency = <400000>;
> +	bootph-all;
>   	status = "okay";
> +
>   	/* spare dmas for other usage */
>   	/delete-property/dmas;
>   	/delete-property/dma-names;
> @@ -179,6 +181,7 @@ pmic: stpmic@33 {
>   		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
>   		interrupt-controller;
>   		#interrupt-cells = <2>;
> +		bootph-all;
>   		status = "okay";
>   
>   		regulators {
> @@ -314,6 +317,13 @@ watchdog {
>   	};
>   };
>   
> +&i2c4_pins_a {
> +	bootph-all;
> +	pins {
> +		bootph-all;
> +	};
> +};
> +
>   &ipcc {
>   	status = "okay";
>   };
> @@ -365,9 +375,30 @@ &sdmmc1 {
>   	sd-uhs-sdr25;
>   	sd-uhs-sdr50;
>   	sd-uhs-ddr50;
> +	bootph-pre-ram;
>   	status = "okay";
>   };
>   
> +&sdmmc1_b4_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&sdmmc1_dir_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
>   &sdmmc2 {
>   	pinctrl-names = "default", "opendrain", "sleep";
>   	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> @@ -381,9 +412,27 @@ &sdmmc2 {
>   	vmmc-supply = <&v3v3>;
>   	vqmmc-supply = <&vdd>;
>   	mmc-ddr-3_3v;
> +	bootph-pre-ram;
>   	status = "okay";
>   };
>   
> +&sdmmc2_b4_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&sdmmc2_d47_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
>   &timers6 {
>   	status = "okay";
>   	/* spare dmas for other usage */
> @@ -399,11 +448,22 @@ &uart4 {
>   	pinctrl-0 = <&uart4_pins_a>;
>   	pinctrl-1 = <&uart4_sleep_pins_a>;
>   	pinctrl-2 = <&uart4_idle_pins_a>;
> +	bootph-all;
>   	/delete-property/dmas;
>   	/delete-property/dma-names;
>   	status = "okay";
>   };
>   
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
> +
>   &usbotg_hs {
>   	vbus-supply = <&vbus_otg>;
>   };
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> index 6ae391bffee5..bcf80f76d6bc 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> @@ -77,6 +77,31 @@ &optee {
>   	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
>   };
>   
> +&qspi {
> +	bootph-pre-ram;
> +};
> +
> +&qspi_clk_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk1_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk2_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
>   &rcc {
>   	compatible = "st,stm32mp1-rcc-secure", "syscon";
>   	clock-names = "hse", "hsi", "csi", "lse", "lsi";
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
> index 8f99c30f1af1..879436cbb72d 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
> @@ -262,6 +262,7 @@ &qspi_bk2_sleep_pins_a
>   	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> +	bootph-pre-ram;
>   	status = "okay";
>   
>   	flash0: flash@0 {
> @@ -283,6 +284,41 @@ flash1: flash@1 {
>   	};
>   };
>   
> +&qspi_clk_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk1_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_cs1_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk2_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_cs2_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
>   &sdmmc3 {
>   	pinctrl-names = "default", "opendrain", "sleep";
>   	pinctrl-0 = <&sdmmc3_b4_pins_a>;
> 


