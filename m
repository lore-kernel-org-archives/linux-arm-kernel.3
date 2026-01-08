Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B5D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRV1ScRZYO3jm/q0+SSLXnbn8Hen+0WiOoF3kU0y+gI=; b=xEDUqnbraJnX4kxOkDOsale0hn
	A9vn2792pL5oGxw6cRwY0lYVw5nEJB3qnHVzywbz8K75fr4xOE9aVeptu8rrtSEssgFa2/GYXBgA6
	ZUztI4nGMlihiD5Rw2nNvZ1HtQCq20kdv7tnjsjaqTZEIbs6zNaJ9MEzpFqgqlEjikpuQBVD/OfIN
	R+7QvDtUD/UYBh6vsbfFnM8wfGD3ipqftZQrCzl5V8CVKL0TaV8XtLNZVTsIUAgSl1t7hjmLWQrqV
	hHoNov6ENJldJvwMQQrTBJJrL/T3355xce5C5JFSRUUOk+uPoo7F6CNQXTilNmNPx+xo0aABc9ejI
	xc9kYS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtXN-00000000JBH-2gD1;
	Thu, 08 Jan 2026 17:11:05 +0000
Received: from mail-westeuropeazon11010015.outbound.protection.outlook.com ([52.101.69.15] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtXK-00000000J9N-1C99
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDAOrSmrYNDhHTtM1baRR/6C9gvrGIwoGg33W1/aZ0D6FfKnyo55oXBQJT3XY5AFhqh76TkAtxolpfmMbutJZgGu2OYUnYsy0EiVFCu8tca+NQ3N+IKtN8pkkaMkQ3HdAJwOh2frNlUC1q7ohVezMq10adSqFdNYy9CP6s5kxGKsOPOlRopblMrUjLKlkWPfIBWr7hlCLfxmxZJ77DsWQyAg/OuqeTxtXyJNto5cyPu7AJwF3RTHD/mYhUbydJtMiSsqzQoyGD9wTocT0g7P9QYjmgK5/WLtTqRFSzaqOlUSTY0UIutMbvMalEyGmtsPL2MT0aeyRsMMav7FEkeY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRV1ScRZYO3jm/q0+SSLXnbn8Hen+0WiOoF3kU0y+gI=;
 b=gljxROvK0gXjN8iC1bBBYYINCXxXXqcLQXEIy+nW+NtO9PThVrdN8AMvBlXOmrrockrApB1Op7vAXrYyu3bkKxWOYmze7UZNgChfTH6Ap/7HUe24rJm0q4+WSRnxFt5MR3cCdPJN/O0L+thu5OWOOZt8Qa4JyiaVEkTxf6HcAYM93jRlzoY0seglWk85FfpbkRkvqTe98KBONJ12A+cpqALG31ImgUos0P6FLTkVca54owIUm5WMofCsCRnGyhszR03qE26E/CPlofTGS5I2PWE8O21kgimIDXulwLfGgfEbsqTmiQQpXBKzYgE1kK0mD2EnlstViQVutNfVPZ769A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRV1ScRZYO3jm/q0+SSLXnbn8Hen+0WiOoF3kU0y+gI=;
 b=PxVqFN/TVUTfCyN9doo0Pg/D2yxxuIY2zzxoll2TyAiULHl1XncdDklIt/qlIWNTdMVP8o6K2DayHltpuA9qagC9ykeuew8tah0Y4hsoK4blm/tYscluUXYRZQdV3jiNB9iKukCjgzxjtF/ERcEOmtiQjT3m5skpk3vDM2jf2aHyiqPmfvmDKErw5veQ9QAdoryW0hIGBmkaqj6pafJMinHQWOZnl92PIOLtGVtdDQIjmy6NyknUZxMhqElvlJAdqHQlNBOULS05lHArB+Pu6MTgZyrMTfX6Px5vHBKcr5HFFSVUUdIwZURB05ZNeVtYTh2v+5iFc6Kd61kt0H4nbQ==
Received: from CWLP123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::35)
 by AS1PR10MB5440.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:10:50 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:401:59:cafe::76) by CWLP123CA0071.outlook.office365.com
 (2603:10a6:401:59::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:10:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:12:05 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:10:48 +0100
Message-ID: <87e037a6-3f5f-411c-b029-83f26f5d5bc8@foss.st.com>
Date: Thu, 8 Jan 2026 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
 <20251114-upstream_uboot_properties-v2-6-3784ff668ae0@foss.st.com>
 <6f9041d1-fd3c-4fba-ade8-f91f0d760921@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6f9041d1-fd3c-4fba-ade8-f91f0d760921@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AS1PR10MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 039590ad-8612-44c0-69d6-08de4ed8df36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1g0OUFVZ01mdVk5ek5EdmZYTWl0a3kwdEp5SkgvUC9FYS9FY2U0bHRuSm9K?=
 =?utf-8?B?c0p0UDQrQU5HZ0dYN3d2QUxra0tUY1hJZnpaakZ1SXpKR252Q2tSdzhjOHlj?=
 =?utf-8?B?aDBvUTI4QmJlQnFDenRoVFByd2wzaXJock11eW9OKzFiQmF1akpoN1hIMkVF?=
 =?utf-8?B?VkhKVlNpSXRCOVIvd2tiV3lsSU1EcHo5MG1tQVdrU2k5dHdNM2grYkFobGh1?=
 =?utf-8?B?ZXBYTHR6UW1MelFpZmF0dXFCTVBnYVZ0UEdNZUNrMTdWTy94K0dzVnd5djFp?=
 =?utf-8?B?empwcVFKYXBMbE9nWExQM2ZBODRFdDdLeWYveDBVeEZZc1JhSSthd2dKRjNi?=
 =?utf-8?B?cGFDZmhnUytnZGp1N1JWWWt1VytNWnVOUEZIM2tZc01kK2htY3RhRnMwZDYy?=
 =?utf-8?B?N3FocXFYdDduL1FqbnhnL2xhSXhvbncvc05TS3ZXUWNOeDZpUUJWU2ZSSXlS?=
 =?utf-8?B?VGJGOTladHdDcXdpdFRBekF6NU0wOHBZQlJqVDZ1TjVZOE8zSjJ2NmVveFBn?=
 =?utf-8?B?amZWZnJhblhtejZYSUNDVGo1VmJPMkZ3cEVMdnlZUUdMVnhqdWN6bEk5Ynln?=
 =?utf-8?B?bFlFOTFWckhzS1h0N2Fib0s5NXY2Vm1XT20xWGJaOGVlb2JNRFIrMlU3bFhr?=
 =?utf-8?B?TFhPQTRVNEd4Nnp3YVhBcjVxTVY3RE1ldzJkQVNqYndzMU9GMEIxU0lRTi96?=
 =?utf-8?B?TVdJSE9CdHFnMGtzTVhGekFUV1pFZ09QOWwyY3VJM0FlY2J2WG5GeTFrUXhw?=
 =?utf-8?B?Yk5WU1FSYzdGZ012UFY1YS9GNXYzRDBTSlBDNldQWUY1TWFQTHBWaFE2cDBG?=
 =?utf-8?B?UU1POW5SMEh3VDVGRmVQRGs5NDBnc3NXQzNJQ2pyTnQ1V0YrUWY1cXBNc3Ns?=
 =?utf-8?B?T3poeCtVUXA4cWJKZkdkQ3lVa0NVUTBTMUFKdnJHMjl5eWh1WlNvMVJENysx?=
 =?utf-8?B?N2ppUkR6bkRRUTRQcWtNWHdjVG9EejVUUURSS2dxZ1NXYTFPRklhMXZjNHQ5?=
 =?utf-8?B?NXZ3R0k3NnZCRFJGNzZubmJxTk1SbmtXWTB6NXBBeWdrTFB6SHgxSDV2d0hv?=
 =?utf-8?B?NEc5ek1wZit0Vk9BbUdhd2x5N0djTkFpa2Z2aDBkM21lZ0dDU3lZU2FGSzJt?=
 =?utf-8?B?VlpyTkdFcVlnTEUvc2tJcVZ4cGJLbjBxWkFBMi9GeEhpWDAxZnZTeEpWR0xv?=
 =?utf-8?B?UGc3OVNpazNTWGV2ZTdVTDk3aTRncnphWkN4VFRvcFlLTGtXZXJoTnJxc3lW?=
 =?utf-8?B?K1RXQVZVY1FYT0xaSEtjeTR3Q2RCTjBOWWo4dUtJRGNNRGNweGQrRVp2ajhP?=
 =?utf-8?B?MHc1STlyMU1Nb0RWZ3VWSDZPUERjWDdNSk1SSE5hc0ZJb3dxb1Naa2I4YXE5?=
 =?utf-8?B?WGVQS3JCUjhrOTNRNDBMUnQwL0xFeWtNek0reUVMZGJOWksyV2l6MTViRVRQ?=
 =?utf-8?B?ZXE1ajY0WkVEVFlFTjZhUFVpVEMwZ1JaWWZDaFRmM1N2cWM0VDdZNU9MSHVk?=
 =?utf-8?B?dG5CekdBaldBNUsrK1JzMU9WZzViNlJ3VkVoc0g3UlJuY3VpVGlRMFhRT09S?=
 =?utf-8?B?ckJwN3JWZFRNVjFUd09TcURLQTJiaXp3eUdoTzVxaHBBOTFaODZaWnhFZ2t0?=
 =?utf-8?B?UFg5dXRKMzQyQ25vQm9tL09nSXhHbXpYSWhYM2lCYmJYVWZrWm4vdUljaTU3?=
 =?utf-8?B?d0FvamRZMEZPZ0p1dkpHNUxRVzJXVXI1cTRNU3NNcnBTSFoxN0wzWGdCemdh?=
 =?utf-8?B?TEwzbzQwQ2NTelR1eWROWUZlYkIxRGovK3BjaVord2M5a0g5d29BaW5mUnBa?=
 =?utf-8?B?Yi9kZXA0cWJyZjNHU3BycGNJVmh1dzY3a2hKOTU0WXZGb1F2VHVXQUZuZlJB?=
 =?utf-8?B?VEhlbTNHbUwzd3N5QlVxZXpnT1dwckdvc1dCTVl4V3FaTytNZFppYng1U2FU?=
 =?utf-8?B?UDhiUXl4R2g2R2xNOWRORTVTWDRhVzNjUDlpVlgzVGNmcUNRTDcra2lhSkd6?=
 =?utf-8?B?UEVRM29QNDBxRytteTR0R2xIa3A2cmp6bjdmaVlKbmlQTmQ2bWJSbFo5WHda?=
 =?utf-8?B?UjIzR1Qvak1WZmc3ZExZWTBPNXY3ZmlnbnVxWGNSRzFidHJuUUpvOStSRnQx?=
 =?utf-8?Q?Znog=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: //fjLWbDFZmQ/wr75G1U8ASSvfxaQFUqAMV6eBy0Y6kspT0Sn1sd3ek3eji2ow3tsXifoO7YiV1K3E2pNrZcULzNCdbf7nGK26AJqJ2sYZ561mzbjFocj+Q3i21hqEeZvHCRHzoxJVFigXFPwINSDn2QZNHhNSpwnvgx2GqGNP2OFvg/+JexBbCS+Zns3XSXm+TkA2p0wlU7NMUNbsSOU7lEGIq4COLWXemwfvY0R2s8jErgKqqeB0/ANyrXrOJbNvzoytCpsvCvciuqWN2ZJ+2bd8ETtEYOxA7YLUBXmuaqHDZxalVOl6xaemrHOAkCdFF0Si1lfylWrQsmm5O6RnDIeKbCB60cStTh2KuRGrmdV4MJpRtwE/+kzW970XcLZ36SB2NZdZx2z9RsDB9999gjfU5RMkhdoGCEtLtttUsBOxA+14sJkPtPQ8eYnBVvzpj9HIRxdYfNUeZLhf80XAQbe0nJifIhiBfIrhJvJ9ZGunECoRIU+mY6czjJ8mSDurpI7Nh6VxgW6aon/0PTmvrHATwGKWDgqLQWoaREiGcbKEBMLXvlDfQDHyKSh4MHbf4TWXYKW/2Ixwkck7YaoS/BK0WNUcgvbPj23E+CMZYFB8Ox8bhfWJWl2Eu5HMwi+UT43G1U88UI7Bj66C2cALfpLdq9+xvr6JJ/O7S+Yp/6/APHbarW0ApDFwnLVcUk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:10:49.7096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 039590ad-8612-44c0-69d6-08de4ed8df36
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091102_839341_15620D3E 
X-CRM114-Status: GOOD (  13.29  )
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



On 1/8/26 17:16, Alexandre TORGUE wrote:
> Hi Patrice
> 
> On 11/14/25 18:26, Patrice Chotard wrote:
>> The bootph-all flag was introduced in dt-schema
>> (dtschema/schemas/bootph.yaml) to define node usage across
>> different boot phases.
>>
>> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
>> present in all boot stages, so add missing bootph-all phase flag
>> to these nodes to support SD boot.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp211.dtsi     |  7 +++++++
>>   arch/arm64/boot/dts/st/stm32mp215f-dk.dts  |  1 +
>>   arch/arm64/boot/dts/st/stm32mp231.dtsi     | 22 ++++++++++++++++++++++
>>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 11 +++++++++++
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi     | 26 ++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/st/stm32mp255.dtsi     |  3 ++-
>>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 11 +++++++++++
>>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 11 +++++++++++
>>   8 files changed, 91 insertions(+), 1 deletion(-)
>>
> 
> ....
> 
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index a8e6e0f77b83..f6576304f42f 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -66,6 +66,7 @@ optee: optee {
> 
> ...
> 
> 
>>                 ltdc: display-controller@48010000 {
>> +                bootph-all;
>>                   compatible = "st,stm32mp251-ltdc";
>>                   reg = <0x48010000 0x400>;
>>                   interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>> @@ -1577,6 +1585,7 @@ ltdc: display-controller@48010000 {
>>                   clock-names = "lcd", "bus";
>>                   resets = <&rcc LTDC_R>;
>>                   access-controllers = <&rifsc 80>;
>> +                bootph-all;
> 
> duplicate property = build issue.

Argh, sorry, i didn't see this issue as i only build for 32 bits platforms ....

I resent a v3 ASAP.

Thanks
Patrice


> 
> 
>>                   status = "disabled";
>>               };
>>   
> 
> 


