Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A123CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOQ7QWC+YKxIzrWjbSqreFYmZi15zPRaLkINRrcFdmM=; b=JEQB8Qu7oMe6W1skAALIEkrP8C
	vkpRMpg81GBrSHUGaBuqwPJAITESM7szwgN5/ZM2fUcTselPnuhf4+TmMkRgrWxXuD3OiEO5XqjMW
	hMoxCJkO+CHOXH9TgV2lUNqV0B6DnEdD5hNy4DUumYnQbz7TtqL+yfGzEsynfatX2/hLs6usqZQsq
	81r7EFdsbocxW5oPrAYdh+JuBbXWVDFcbgD+pMKJwlBEiWXsnZtjw94609LDs6H8RNxPG6fpbBp8g
	13vT8fw5uFEsaIySGBCsI5k/imGr09so6M7FOLANQqK/+2bhh4ob7JjkgbDgGTtv/bnqRk2Lc8U51
	4n6aJcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGg0-00000000QkZ-0mT4;
	Thu, 18 Sep 2025 15:36:04 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGfq-00000000Qe0-2xi7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:35:56 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IEiMka005347;
	Thu, 18 Sep 2025 17:35:48 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxb1g6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 17:35:48 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI0DZi2K9AAVmuJChtLke6xBHxws3g02/TBpbvoU7Ga/j4brX8+2x0589lNwVqsY/aXTXHsdbjgx4PiHi2DjqQTyj+bUkIj1WoMY3Bjf4Ex4dCyXOBTqQM+o0U4+nsR0qTb229IRIZqA8RFiAjcuWkWQmEgcd7xVvzjH8p7FmMYUH64Uo3IaGsnXYKuaGI27jPujVq2rW/AMnSRTaH0IwkpiA5N+aoAqP2uYpkEkBSH89jUSE3WXl4ZoqyEQFBgi4dqPXbvF2JppJRzYZaxaXGUStbLE1OBcMn4HqVjTyCU/KNnT1knVNtBuDGIK7d+VQtRVCVLvzlV+sDM5dffmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOQ7QWC+YKxIzrWjbSqreFYmZi15zPRaLkINRrcFdmM=;
 b=dLqt+j0OlD1Xsxmy3i3K1xp9KgiXFrdikqiZlKBPA7CYeEZI/RMA4Q7ecL05IfXWkOu+g9CGZA30MQfwkfF++Y+JJPZ4HCo/3eRR4uhJtLwS85ruLmtQWcINTRRxxra71iL6cutVKI0ZRNPPnxAadG2Ojm40yhw6A7DMVQKux0eL8vPlXEx1YifcoyzygpvK+Abj5oAIAfPZu8h31oePyd/EFfjm/UwyVvGBiF2UeWnBEiTjlvw++6/dwxYN9UTb8IA4xvRTbNlcHsDLpenwSu7AdcP8xmSStQcUmsKR7uWqk/ipborwd9snhuCaRGDUcrFwvpokAzuN+O+bb0yeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOQ7QWC+YKxIzrWjbSqreFYmZi15zPRaLkINRrcFdmM=;
 b=n5VB4Q3bYPnpxlzEbY96DAE3TGfpOoIaRL50tnwH4FKNZZN6J8drE0bGTEudztDjjLfb1jlfuXu4Hxd4xSabpItfpMCFv1nXuPsriRXr265DDA85UUe7XJxaPgxErdFjZjSdvyX/2X/4B2C7LFp7TaKi60Xysm0vQNiq50SysXu1xWwvvzXu3b24MvYW9cqVaT1dWYQJAzqzlo5eI6JE860TscOEyznBfRNORhVodA+7ShMVPT6yHxuQahcraYA8yhqRQuFl7fFyuZLoRmoT8ZzCp4uhripTclx0CWjgy6ea0Ch5UF8dDx9jubjNRj3V/Hoo/GIoTikisscSRVVC4g==
Received: from AM0PR07CA0019.eurprd07.prod.outlook.com (2603:10a6:208:ac::32)
 by AS8PR10MB7546.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 15:35:45 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::f0) by AM0PR07CA0019.outlook.office365.com
 (2603:10a6:208:ac::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 15:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 15:35:45 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 17:33:20 +0200
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 17:35:45 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 18 Sep 2025 17:35:40 +0200
Subject: [PATCH 3/4] ARM: dts: stm32: enable the ARM SMC watchdog node in
 stm32mp135f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-iwdg1-v1-3-02c2543c01a5@foss.st.com>
References: <20250918-iwdg1-v1-0-02c2543c01a5@foss.st.com>
In-Reply-To: <20250918-iwdg1-v1-0-02c2543c01a5@foss.st.com>
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
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|AS8PR10MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 308237e1-5993-436d-d6cc-08ddf6c9092d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDRvdmF1QVpoWCtOMWswRE8wRE54dmZGSENkSzloYUZXQ25lcmhrd2pOM0wv?=
 =?utf-8?B?NFZ0NXlCMEI3TXJpVFdWWHlsMFIyYUxJcTlZUVdTbVdIMDl3TzVyMnltOG9C?=
 =?utf-8?B?WGJrL21KZHRTVVB2STBjbnFjUFN1THJtMG4vV0g0VlZWMWdIQVIxVktQU1NY?=
 =?utf-8?B?aW5MZG5rRnE3NXNTSTJOSk9qRWpXMXMrbGljekViZXZEdXdqYlMxUENQNkpw?=
 =?utf-8?B?SUFQc2ZDWUF4VG1WbngyT1Bid0JBQUtGa3pnOFZFTUdVOUZ6RFpUYVRqTXEw?=
 =?utf-8?B?VUo2ZitHUnVpTllXY1lWbUQrQ2ZVRk9JWURBMENTd1M1MEpyTk1Yd2JFVno3?=
 =?utf-8?B?NmZCY1UyN1lrdEV5elZuTWMyb3NWVTJHZzMwSmRLbnQxSWZvT3pGZTRwTVNq?=
 =?utf-8?B?U3I2Q3pieUEvSHF2ZDhRTmwvNHU1RDRyc25tbUFGWTJOaklMVm9hZmJZVXNX?=
 =?utf-8?B?TnJidS84ZFFWbmZHTDI4NE1xcDRnaWNEaEs4bGF0UktmRXBwN3Y2L0UxVSt1?=
 =?utf-8?B?YnQwMzJ0K1RxQmlOWmZLbzY5OWN1b2JCR0RJOVV2WmtHVWhHRzRhT1dRV1ZU?=
 =?utf-8?B?MmRxd2xIZHIzU0ZvME9SYmhmd0htczYxcnV3Tm1zUnZoeWRVNFVQNjF6RHpk?=
 =?utf-8?B?RFJtWk9WY3dlQUNxQnhJNDQ3TzZYUjJtUkRmaU9jaTJGU0RBUUwxNlN6WXN3?=
 =?utf-8?B?aXBnVEM2clJUc2N2SUZTYUVwZUJXUnFzeTZmekJZSFhoNU5wTGFtQ2NKVEIr?=
 =?utf-8?B?MU1HM2RMMmdpdE5UNXhwR0lrekpXT2syY0ZxcHVucTg2QnRFM2VYdmxXR1Iy?=
 =?utf-8?B?ckZ0ekRDVHNmTFVWTkg1ZUdxLzNYeGl4cUt2bUN4QkFtRlZ0RjhrWFhqbzdo?=
 =?utf-8?B?L3VnL2Y3WkhEMXk4MzBWRG5ZRllucVA3ZVpYZ2Zpa1pIZmkrTjdXR0UyZnVD?=
 =?utf-8?B?ZHBmeHc5Y1M0WWZxWXBKZWVUaUI1Y2VWQ3h5R1FQYkFDcitNSnIwOXNycUZI?=
 =?utf-8?B?Z1Fra3RIVDdwSDBKV2xzbjNUd2pZUDNocTlVaWlYdm5WTjcwNTRRMm9WeVFt?=
 =?utf-8?B?ZjA1UXNZZlRMUlVIaFRSZFhVaWY2ZEg4ZjJTYU9reVl2YXNOeCs4cGlhdWFq?=
 =?utf-8?B?aDU4OVZadDVJeWZ1dUhDYk9xajAvVGlNY1EwZU1xOHR1eDNXWFpOYzVzbjJD?=
 =?utf-8?B?aCtVUjQwcXZ2Wi9OK2FCelYxTXUydnowV0wyQzVSSjI5Z3dhKzBSQTB6RW91?=
 =?utf-8?B?Zzljd1Z5L0lhRUlQdU92UDBvb055OUprb24ydTJrN1lMNkIzMjZBQ3FmaUFK?=
 =?utf-8?B?VndQMHVTTFJXdHhkOXlrcGYvUkQvNjhiV003L1RtYW1xR1ZGTldIZTV6dE9y?=
 =?utf-8?B?c3AxS2ExaVBOSUl1aHllRzIvckpBZjB5UE5ZOThuSkVyTFdTYXp3TVIvRG16?=
 =?utf-8?B?ZXByZ1duQThEL2hyTmVrOUFZcmNXT1hra3ByMXBTSGkrWFk1MXVOUVBvSmcy?=
 =?utf-8?B?Y0ppdHdWcEhrOFVaYzdYTGJ3b0o1UE9XdUZXelZVY0pYK2hETm1kcFF4bEta?=
 =?utf-8?B?aFpoRm1nN2cweWxiWmdxZk5uS1JDUGJ3b2tlNGFiNW5ZeFR4OFNYNjBTNXVM?=
 =?utf-8?B?ampmRlhpNm5iK3JTcUZiNjg0MDVmaS9SNWpKU3MzUjlVWGpxaGY2UnRYWWpH?=
 =?utf-8?B?OHNKTWoyd2g2dlc1SkI4Zmhybnd1UGlheFlIemVrNTVRNlJtR0pTOWZPZzc1?=
 =?utf-8?B?bjdBRG5DenBBUmQ2cW81N1Mrem1XSmxOOHJDNndhaHdyaVQ5VXFIQ1QyYkFY?=
 =?utf-8?B?Ymd3VmVQZktydklLakRsTGxzTkZidXI2Z2J6VzM4Y2h0ZzRQaVV3cVA0K1BW?=
 =?utf-8?B?SjNMQWZVVG9VVlhLZkxma25KRUJkUGNWMGc4ZUMrVUJnd1FieWlNdGdxdUZ2?=
 =?utf-8?B?ZGgrMzFtVlpQeDZtdDJTbFMyV2F5YlUxNTdmM1VsRHcyL2MvRUdEWGNFQXly?=
 =?utf-8?B?UEdGbWFQclhJalB1OWpZQ0ZubEFzZUd6WVppOEYwUm9RbjdlMUx6N2wzL1Ix?=
 =?utf-8?Q?+BN/Ui?=
X-Forefront-Antispam-Report: CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:35:45.8437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 308237e1-5993-436d-d6cc-08ddf6c9092d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7546
X-Authority-Analysis: v=2.4 cv=RPOzH5i+ c=1 sm=1 tr=0 ts=68cc26d4 cx=c_pps a=ix9ji6b11k/yGntXX/BQ1w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=Uqnf_Yzwn4G3_ghC1w4A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: lxhVMNoc_R-QUH07E1v4basLWExMRLDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy2ZAK+j7nW9S +7+b2KX/5ovVjpIiGvsBKo21nXz8EYHtxYjM0Gf8mTF1juYwU2QRtw082pv9vbCT3u4wMoc2kD4 QZuTIFtHghUqb7Z4iy/PVcRdxr6htK01AZAin7BMvr/WCOTnnKFKw9M5a3XgxIX2jTRK9lGksRV
 GyjWaDz6Xi1h6hZjoM6vGMabVmX8uuJ41xCzGByRD4EewWB2FJd9f5oquQe6+YzbK7b1lTRLHY9 7DQIsc3/j6OvqrTGS2GBT8lXWnmZX4AmVYRvPoscZ9jstUoSXDZXV3hMcTKCcDvzUZoaDsP115m RejJTB+7Yve+FiEg+WCFwpDgzDCmNQtwMNJ90ygYZWXNqfitgxWoKH93Xl97fpN4wxMTpIAOdUL zZARrX4e
X-Proofpoint-GUID: lxhVMNoc_R-QUH07E1v4basLWExMRLDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083555_039970_64585AA2 
X-CRM114-Status: GOOD (  10.19  )
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

On the stm32mp135f-dk board, the IWDG1 is secured and used to monitor
the cortex-A7. Use the ARM SMC watchdog to communicate with it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b428c8524a5902c10b7807dda46b3d..f894ee35b3db2c915896cdf47a7a197951e0e21a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -161,6 +161,11 @@ channel@12 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &crc1 {
 	status = "okay";
 };

-- 
2.25.1


