Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B332CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5adI1M5deF+LDC9doui+yMvxodZmnW13/YLSU/0VnrI=; b=cMgy5ZWmd8L+10HelwLNWdTxSS
	WeVRpqoMLyx7DZQdacsmeNjRoMYrOgrNQT4GmRsYiwFCCnw/snAPk2hxZ+s94wH+Uvl8s4wtzUoER
	JPXpK6XcDv60Gei4FOEs0tVSZsvv6F2mJur+GYrqr4k+GbII7YCURD6CNgg1SID2DOOmphTOzq+sr
	BmaSPPkGSww8qfA2rpkwOYMuNmYvsBSTnncjVkuvFQ7v9/J3t0fsIF0UKI1lAMFP2syU9FtyxOQsm
	uwC/3RdIL5WhQbTtPSeNOAvg1mqx3KM/BVV6tLwJAC6WiPbn9vqjkWXynZ9J/wXxPJkRuZhjV8T2r
	AjntqBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5V-0000000962o-0T1G;
	Wed, 12 Nov 2025 15:48:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5Q-000000095wC-250L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:48:46 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFhnV51626806;
	Wed, 12 Nov 2025 16:48:38 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acfv8be0c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 16:48:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuZ9PFZ58dJn/i6+vIVuNpI3vNWoRBAcHv/4Piqd+Yk84qLzvffiDJBV5wDSFuGi2Llhlat5X7WmXGpVacI25dJ1bze2NpQ2BIY/t5Pu/R/WqZnYCIxJHngYp5+ctiYeReLuv2Ej1UyywC/nZKIdw4unffwBzCvmNUAIOo73HSE+Lkz3MQBL/Misq/AQlWrDlG1CTaIMRq8z0rFlu+QgHCqLnZDWLsUefAVPIW6ordULeq0J7v+2BGV43qlpwbe377XwRBFJTvFXGzlcw1BbjdWlL+c0j566SglYikiau2XWyKJ1Sk6MWI2nsNwS10tji5ffnoDrXmjpHzyK7/prBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5adI1M5deF+LDC9doui+yMvxodZmnW13/YLSU/0VnrI=;
 b=MOqRFP7B7e9XGF6rM8tnmBPW+z7t0ZBVTNxXXcbEMp34xZ/Q7pbhaG+BOJxMjDRjJQZBvEVr61WX+Z+1OzuuLFzlLVW5liZO6Hw1fOMplzrLNoBpqzO/ctmfsWSF0/g+wpEznIm+vJ99iV6v9plDabgEtCDBacE1/OZboK7JRwoZEaujFDuNZp3slKm3R2TuC0cmDnPnNUHrD+YKHqVBfXFuz738N0C8IxQzJmbaUuXbt5na3v6DFr/zIfhqcHsqBNpDY5Uho0m4xi9l/UirsE56iyONAGrQgpw0lAkxJFxh9l60GuI5xDSUm6r7SuLG8spfnWHd6kAsINRj3px5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5adI1M5deF+LDC9doui+yMvxodZmnW13/YLSU/0VnrI=;
 b=lQ4VmDjuhOm8FxFJxoVVlatHarHFCSr6jwfITiTUChw9Fnob83WxQo34o8cBp3pJpbGuXJ0Edpl/Su1IBgdvgJCf0YlSLBrLRwcEf26VAmpMoPDf48WrcR1axk0KmZvac2gXILeFQBonaDrnNrUYjuruEzCej5LlcN7kR4E2Qx8l9FDOwyH5feTPF6HiGJ/6QG+M/Ci9lBULa+oQkqdR3Sb5aWkna51nOatSLW05KIHrSTSV5wbvu6me4CHu9vQ8K3hqjqRoRtL79kcasdmIxTpnx9k23IpQcf9qqfiryXWJ9vi1+G3WwspZHGXrpmDMEWTX4pLA/vVvOcgl8peZcg==
Received: from AM0PR02CA0141.eurprd02.prod.outlook.com (2603:10a6:20b:28d::8)
 by AS8PR10MB7065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:48:33 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::56) by AM0PR02CA0141.outlook.office365.com
 (2603:10a6:20b:28d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:48:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:40 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:18 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 16:48:11 +0100
Subject: [PATCH 08/15] ARM: dts: stm32: Add boot-led for stm32h743i-eval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_add_boot-led_for_stm32_boards-v1-8-50a3a9b339a8@foss.st.com>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AS8PR10MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 6885d3a6-15ea-4f53-36f1-08de2202ef9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0k0dzJBVUI1VVdkUFN3Yys3Sk9JMlIwY3ZEL1J3c3JuRjhIMjBGcUI0V0J1?=
 =?utf-8?B?NXB6QnFDUUtXTnM3T1JyZW5FUWZ4bDhMcWNSZTFDYzhGU2w1QkJHaUZTL2Qv?=
 =?utf-8?B?SVBJQzdWOGlNQjVxNmFIS21JcTVUaEdBL1d5SUdIV3pxUWE0c1Q5QVZhdkRT?=
 =?utf-8?B?SWVMdHpGUHo4NnA4MFIyN1N1ZGYyRFkySWJhMmNFcFFQQ2NGOUZSckRrK0Fl?=
 =?utf-8?B?MXJJMXpiR2tXUVhtQ01Dc3EzNjNHVXJkdnJyL0U1U2NkTTBaeGxzakFjblJs?=
 =?utf-8?B?UDVjNU9pdDFYVk9RakEweU44bUlHRzhLRlA2bHc2N1ZtdTBJWmV5V3oxenZy?=
 =?utf-8?B?QktYS2daQ0xnc1pYdWZuMHozS09KSHRxa3VpMmtZRlptNnppMlJ2Ry92WjBm?=
 =?utf-8?B?VWVuaUFQc0JkZUN3Q2ZUTWdEc3pITld1M2tCZUUxcTBhN0V3WVBReWRLSUZt?=
 =?utf-8?B?QXIwUXordjBrVEQxU0VkUFFaamlJK05qb3dVeVFSZHlQTmFZMFRjdmdwUzND?=
 =?utf-8?B?TDM0d3RjOHdibEVxazI2L2wwYVU0K0loaVNzZzlQeWtmenl5WUpsWGI1N2VT?=
 =?utf-8?B?UFFCYzFqdzRnRVp3dXR2Q3NUWVJ1U0dEcWJBNUE2MUMzYjNYNm1RalhFRGRL?=
 =?utf-8?B?QUtFbGw2cklnZXdwa3RJRFl5RjNMWndDQjRCNXRack5NMXZwU1N3bFhaV0pX?=
 =?utf-8?B?TDlqVndiZkpWcDl0SnhFazl6aE9Dc3NnNGhjVVZKNnUxaG1jQTFnc2FpRGVp?=
 =?utf-8?B?N0RFN3BpWkRGYWc4cTNrNzg5eWExWXpiWTgyb2dEdE1zZll5SXBhYitGdjhL?=
 =?utf-8?B?SWszSU5KNmViSnI1MUcvNUVZZmN1ZnZ3UUZHY08zcEFId3NZNXN3M2lVSWZR?=
 =?utf-8?B?WFZueUh5T2Nrd3VCbzJSTEtLMnVEWGlHWnJISEhpSDFJUEs0VjZzVnQxaXVr?=
 =?utf-8?B?d2craEc1b0dWdHlYK3FCVGs2OTUzNzBMN3d4bEZmaGFSbTYyQnMxZjRFODZZ?=
 =?utf-8?B?SXJIQWJkcFZlb1krQjZ5OERjNVhzWWppK05wUHB5blUyY3pRZzFNNDFjSnJp?=
 =?utf-8?B?anFobVJvVHJXTk02VDFsL2d5UURrUkV0RlE0ZE1oUXVBbyt0Uk0xNkRYMjJW?=
 =?utf-8?B?MlJsZ2IxazE1c1FiYXkvcDFFbnBQWXg4YWtKbHY0YU1Ca1V4OFlKQ0pGdFRE?=
 =?utf-8?B?VEs5czk2dXAyclVvdUZnRE5pZzRJcXdoNVpJMFJxUTZEUm9lVFFyeFVuNDdP?=
 =?utf-8?B?cjg4cXhXdDVxOG1IbmovR3M2MTJ0VzUrYmMzL25NMXJKZzFpTHNLcDBLSTBO?=
 =?utf-8?B?aFQxd3Q4bHoreW5qVXV3SjRDV2hZSjVNb0Y5VWJCTVFJOUxNM1RRamdCRFFI?=
 =?utf-8?B?eXhvUXFJcEl5TlRsdVZxY3Fqd2NEbnkrYXJqZHYyZ2dKbHpMUFRjeFlIdTN0?=
 =?utf-8?B?cS9ZYm45dXFGZTlGRGdXclo2bHEyVEM1TW9QRlh6U0FNUXJqc2pWU1FrN2F2?=
 =?utf-8?B?eUI3MWZXOU9NVlEzOXl3ZFp0NUpSc0hxdDhjT1c3RkNoaUdFWHJ3aEV5NDBQ?=
 =?utf-8?B?R0RNUzZ4UU9LRjhxV1dXckVHQzRjRFMvQUdkOURmVEs5UHZjcEJHQ2N5MGdh?=
 =?utf-8?B?VXNVWS9aYy8wdm1GMEpjZVA3VGs4R0w5R1crcktmRG5IcHlGaG9vQnE1eDZy?=
 =?utf-8?B?NnRWYkVuWXVWdHZwM2d0NWRCMTk0Zk9CSEd1OTVDUEc3NGYrK0tLQXZQZjht?=
 =?utf-8?B?UlFhZWFTY2xzK3h2TDJ6aDBRQ08rZGxYckZiRmUwOHg1bFJ2YXhlV3JUY05h?=
 =?utf-8?B?VkNzYzRUcG50L3l0WXlFcDhjWGY4Z1dDdlFNSzRhRGh4Yi9YZVlSRlF4OWxv?=
 =?utf-8?B?akQ3akhtcE9DdlZSS2NrMVozSXJSMy9TTVYzSFhxRWpLSDRMOVoyYlJFSVh1?=
 =?utf-8?B?Wk11MHNQWFA2ZE1DSHVGTG45TkZzMUdWUGQ3RDdIVkhwdjBRemZwaFVBaXJr?=
 =?utf-8?B?QXBrSlYwRlF4TEFkV0kvWm1qeGQ5QkpYbVBwQ0xpd2NyTTBqZ3ZUbStNbFFH?=
 =?utf-8?B?a0lGT1VTWXcwdWh4U1ovMVpHZFl3OGgycUlQU1Bmc0UwcFB0UXlwYWNWYW8w?=
 =?utf-8?Q?/axs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:48:33.7568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6885d3a6-15ea-4f53-36f1-08de2202ef9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7065
X-Proofpoint-ORIG-GUID: mceQyOBUGLCUN2rgCT3tsHxn9XMexj8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyOCBTYWx0ZWRfXx8bc5joVWZTq
 6r8tR09nFh+qM3seoIDrJRuRSh2iQSpwX6Wkdt5Ov6gDyvAqT1zQMOAywkksN6iF8Tfr1D7K8j/
 8gjvZUCh+ovtodTc7YjUNDE3WGunpr5VYUeCjNL4y88U5mBdwOrA86SYoik3bdGQ4KTrOjX5S/Z
 z6naQ9eOuoh6bSu/4EuudwzRlbXNhGHxCYWNREdApEC6eBSrec7pRD9Gu7HeEoQefojp3VCTnnb
 LUHwtEul2aBP2DgmlGtHOAJbj1EuSZbtjHnViPS7Kqipambnhq/SZjLo4P0umKSmN45j8lgWtXT
 NvJUhonF0V+V1CILhfzd3/k82A2ypcHJOS9C1rJi8vWsiz0HiTi8onAsIho+JbzC88ks+gO3/Bm
 PFPK6XPpNrXvqm0/a9AYKZKRT7C4MA==
X-Proofpoint-GUID: mceQyOBUGLCUN2rgCT3tsHxn9XMexj8K
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6914ac56 cx=c_pps
 a=TGtHJSg9jqUEU2jNioFT0w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-f16ReU0HISyl75tmxMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074844_811180_6495869B 
X-CRM114-Status: GOOD (  11.15  )
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

Add options/u-boot/boot-led property to specify to U-Boot
the LED which indicates a successful boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h743i-eval.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 4b3e0c5a9009..e5e10b0758ee 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -66,7 +66,7 @@ aliases {
 
 	led {
 		compatible = "gpio-leds";
-		led-green {
+		led_green: led-green {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&gpiof 10 GPIO_ACTIVE_LOW>;
@@ -80,6 +80,13 @@ led-red {
 		};
 	};
 
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_green>;
+		};
+	};
+
 	vdda: regulator-vdda {
 		compatible = "regulator-fixed";
 		regulator-name = "vdda";

-- 
2.43.0


