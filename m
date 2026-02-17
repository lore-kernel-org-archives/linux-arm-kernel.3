Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99205E81A26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IalDf49Dmtq25qr5oFu6SL7wU3OXRTvja0UTkWOUWZg=; b=wiYFD2JxCaKDPE4DS2VzDlO7r8
	HhFyJcMegMr/09J0XaGmXEQe+s3vWCXXCYdVVtg+ACeiODE5uD3MA8DmxEcMZeyH+YheCXO84j7x5
	jtdK3vvhtw0z5t3NM1gvPiVUOyrlKgVGWCk5e1/iqNrU5Jb0j3kAFPuVFM1OeCv4gWnMQX4/HX5+W
	pkZ2XnfTCW9wK9UAIUixNA0SUuX5S5T1kGdKFLE/DaFYTPiYzXwAqFDt/Lr6XeuDTevivNTjqZmJZ
	jfIDyjIodbGrIz/15BobXCQb8AnIMw5MzK7uQ4BnfD3c5TPZwRNQyhCjYs1Sn1VrZSkLXefgOIkLh
	ftGRouPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKsi-00000008Hdp-3QxW;
	Tue, 17 Feb 2026 13:12:48 +0000
Received: from mail-francecentralazon11013005.outbound.protection.outlook.com ([40.107.162.5] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKsf-00000008HdL-3No7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sI5eBCeOGIF/xL+i/Ks+0CQWDH3vjGFp2hBDsj5NoETZtOUl1FAx1n1w1yBL1bJonPFLy42A+tmB8D6ZkibMjArOFOtAr8dp1GuNigZFCwa/xR6mSRpipbmTTFcX3qOLHbZOLnHS7kUIcRRN+VHEDa2ssKb3Sd38LjjAiZU8CxFp9Rdantr41RWcDyJ5f+ZTW2ky4R9wjI62oKe0MjPxMitQ82vfEU5jzYna0UmIAKWeDFMnaNXpnnTWk5JD01Sg7FVsUyL2Sd13rMpMpQoQDLEaqoOTS25RUHNyYqcrjjnzE85BUSw9HJk/aiGwerRKDHaA5GmM3zzJTtwkU9vMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IalDf49Dmtq25qr5oFu6SL7wU3OXRTvja0UTkWOUWZg=;
 b=vCgwrYpMaav7Y2q6LLN33EqvG4KpNICC5nj2ZHCcheA+yyZnLoXfluAxt9gZUAzgjJZNmwJDjgT2ZCEh/uJTUESuZHWZDGNXpeQKRqrbIbkdQjaTb118tRoDMIOBHf8eSTw2qnZll+56DmponIBKgFdJ/NolXNDdYHOdHoicpjIDAPdZSTw0zje+ZyFNL/nCSjLhzSV2AOwZk1ecrJNef34NktXja4LsUpfRYry6hVgtxDKDsugaz9d2x6HkJkG03Knhmerrbdd6MRKYiJ92Z/R+ix9OOiL6onGfo4/V1sCXJd5Ozaqent29nmVnkufyvk3Y39hgHD+KLf3XDwWFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IalDf49Dmtq25qr5oFu6SL7wU3OXRTvja0UTkWOUWZg=;
 b=cv/5WOAQykI+7Y3aQLeerbE3eMnmtb8NGbJgzEyFx3xXURwgw/csPwyxzdo9bDAshdtEoSxGI1UP8PGAPFF8jmcKxvg1ZvIEuktXq6JKtqd/0n+6EjrV2/DKuPxOpu9LI/DCIyz32bFz7qKKkng1skypvuhGExN+8R9/HUVYmM+bUU7d+XVDj9Y7pka8Q/FRMbPW8G6qDRL7w0HlufvF/tQ+MYi3Lm55hjyMOmQbwAOCY92OOFsOCLbg+Wgy3HAxv+z6Y08v/OUAdRegaTLixIFa/5DkKKEQWY8JAp9CqLZEXajbzzLCxdDX6MMu/Xdpi9AX7wXgzSmNs5bxwiS7zQ==
Received: from DUZPR01CA0335.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::19) by DU0PR10MB7237.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:44b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:12:35 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::d8) by DUZPR01CA0335.outlook.office365.com
 (2603:10a6:10:4b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:12:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Feb
 2026 14:14:30 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Feb
 2026 14:12:34 +0100
Message-ID: <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
Date: Tue, 17 Feb 2026 14:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
Content-Language: en-US
In-Reply-To: <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|DU0PR10MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: c17b532e-4037-4cc0-9659-08de6e26379e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEJraVAyTHpSWUFZc2diUWE5S0VUY1FCRjdraS9aMHZNSnZKRGZudVp6eTFz?=
 =?utf-8?B?Y1pyZWZ3WmJSbXNHUTdtRStyRmNwNGdDa3pFdi96VTdMWk10NzBSUytBbHJW?=
 =?utf-8?B?ZXB0OXFrcndqK2xWSmtVZ2M1d0dzVU9EaUw2aVZmaU5VelExYnJneEZPWmE1?=
 =?utf-8?B?dTBod3YvMXBUaUh5QzFTL0crLzBWVEROV1ZoK2pmV2JBSzFwOGYzMHR2SGlI?=
 =?utf-8?B?S1FDVEpHRTVOYk12ai9WU0lEWlVxL0x3QVA0bDU2UEpnTGJ2WVhJZFRMUFNL?=
 =?utf-8?B?b1lIOGpvZHkraHVrNTVmaHpSNENoYzdVcWh2TktRWlhQcWVQdmFOK3lubStQ?=
 =?utf-8?B?Y2xBcE04ZXJCOEM2ajBRUTNpTUdjNTVBUWUraStMSnRJai9IcmpYL3pvVW1G?=
 =?utf-8?B?aHlOT0htamdCbU5QVXo1cUJhaEVhQ1pwYmlkS3NTTmt5eE1MaGloT2Roa3BK?=
 =?utf-8?B?TGZJdUtJcmdoKzJBUWFRcG1ZQzRVVWUyRDlXT0pndm1xS28yMkREQzZCQmtK?=
 =?utf-8?B?MUJPRXZPQVM2Z1c4UDA5SGJINHFHQk4rUk1WNld0K3I3T2JLZnB3K015Z2gz?=
 =?utf-8?B?ejkvWTJkc2tyT3JvUG9keFlwRTJWd1dtZjJjVDRGdGg1NzU4YzBTOWVCRmFk?=
 =?utf-8?B?czdaWlNYR3hMSmxoRzBsVnE0cUh1Q09jakNIK3NOZmt4QzM5ZTZoV1RZclM0?=
 =?utf-8?B?YWRhMmd0M1hhdHhJQVpKUG0rTE5tUnJzUUo0bUp2aFVCbVRwQy9iTlpYSHVl?=
 =?utf-8?B?QWtzc1lYRmhONFdhZkhDZmhnMXFKSm5ac21hZzJjNzA2Q21kL29hK3diejV6?=
 =?utf-8?B?bmNOWUtJV1RKZHZvV21NbG1Fb3VNM2Y3Q1BGNEhYUUlPYWFrRm90QVhsRDVE?=
 =?utf-8?B?QzhzbGpRSGVqMndwN3MxYStLZWdwR2o5ZmNqcFlzdW5nblNKYzM4L2dnUHhh?=
 =?utf-8?B?VXMxT1dXSStDSGFGbkpJMk45Z0UyOHRyMHdJcFZTVzBuYlhMWldYRFEwYTZk?=
 =?utf-8?B?c1kySy9pbmJzSXEzcnRCNVlRbmY5em02aC9Nb2lSamNTajVDZTl4SHMvTnc4?=
 =?utf-8?B?dGtMQ0VYaXFUdzFrMXZpL2paNmxIZlF2OFNMM1dyQ0IybG01L2xXV1VSVWFK?=
 =?utf-8?B?aWVIUEQ2cDB2RnRTN2dGc3ZiK1NldDYwL3JqY05DQ2NXVVN6SnEwUmcwTlo0?=
 =?utf-8?B?dWp0R3VPQ3ZLQzB0T0NzeTR6TStJUEN1cDV5c1lML1dYc1daMFcyc0djaDRl?=
 =?utf-8?B?U0IzcHJwYmVjTDFGblNmYngrM2ErczM1SWt5QWZxVjNvOUVVemFMMHBYV3E5?=
 =?utf-8?B?RkhKRCtFMG04by8yZU0wdEhVRk00VnM1K1dqYVY4Q3c4UElxd2YzN09PdzNx?=
 =?utf-8?B?MzdGaUVpUlpvcjE2bXhSK2VxeitpdGpIQUNVcEJIRG9kN2FCaGhFMFVnL3E0?=
 =?utf-8?B?eFh0MEdzdEtTZzlCbUNQUkNlUzJGNjNHcjhrbGp4TS9hS3FTS2VZN1lpZklJ?=
 =?utf-8?B?VkpSOTZ4Q0FSTStSUnpqRm9nU0l3TXFDVy9sMTIwQnhla3k0dC9BNUZEeGdF?=
 =?utf-8?B?dE1hODhRVitmSEI0SjNrMmc3NWlaMksySDA0OUdDc2Q2QWZQSzFhTzlKRWor?=
 =?utf-8?B?SVdXR3Bpa3JtWFg5VkVDMm9DQ25kS3EwbE1LVXhMYUxsaWtENlFZdjRya2ti?=
 =?utf-8?B?K2J6MXplZ0crR2lzWFJXK0hKVk5yMWh5WWZjOHk0NE54WWdYeFRSVTBjMWRE?=
 =?utf-8?B?OWFpVktPZ0Z2OU9ia0hTbjdSbHU0TTd3bms4L2hEVUorelR4bmgweTNncnhC?=
 =?utf-8?B?M3U4blA3dlFBaytMRFMwWlNMVDdzMlFIQWViOFlHOGJxdTZTSklZU3RPVWcw?=
 =?utf-8?B?ZEIwTENSNmZsMGZjRmo1VGtDdENJTkhhdUk4Umk1dzFESzNoc3JnVjV4alpw?=
 =?utf-8?B?WkxPQ3dEMUlYMzNvSmtTMWM2L3NyemtsV290UTBPWGtKNVF0S3FPb2lnZTkx?=
 =?utf-8?B?d3U1NTdRNWdSL2lpeUx0cldhSUU5SCtZSEVEcTlnMWVTaTM2OUh4dy9OaHIv?=
 =?utf-8?B?a2xsZndWNjhwUlBTd0UzL0ZlZ1UxaEhRcnJOQVVMZjZLL1BLSXAxd0tVUzdB?=
 =?utf-8?B?UTI3RjlIUXJVRVBNRm93YkRHc0ZoM3JMb1ZGcDIzUzNRRnFrTEh6YTduQ25Y?=
 =?utf-8?B?eTYvK0V5TDhPL0U5ZTNmZmZWbDB2c1NqYVFyemRPcy8wL2JSVm9pNEc4dWVO?=
 =?utf-8?B?KzlRRlFFL0h5ejNqSWhCYkRFWlBBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qT8hvMmezgk5FstRSXyXUELRf37I3rQC3KyeaVhZE18Cz2JHT+XSwBeVtttS25yU11Gc/OkjBvxOGV5sibPRqx76Hn6rDTmyfQ8aS96zsh5FSv2PBFg4W1Sbf0zgKnXtheN78J8gmeJM8rEuKst5cnBTOZqyROloKqWvb8v4P+dMBlNsWJFyxPQe1WSIyyt8u1l26c3oQT74f7rwLN6u0FidMXQ07GHrJG+ptH5a2RZX16RYInD/x6BDArNKYqw9UZmHpgqzCfJreTzzGxi8U716fI4XtQayyc9/qOAa0WWU+S3UuEi7TPPnNHBrOVFEJoHcfGXdNKOhYtrSsVRwYuGUGtuhxvy5c14VR/F+8MI/K8AWlUXe7nbu3p9uwRRE7ep/cJ7SjTdDJxDJRwIAw6uV0U/n/Phy/DiiqVM7oSyo/LZm6MfiYpoN3LvqUJYn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:12:35.3026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c17b532e-4037-4cc0-9659-08de6e26379e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_051246_099616_F64E7E00 
X-CRM114-Status: GOOD (  19.66  )
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



On 2/13/26 16:06, Krzysztof Kozlowski wrote:
> On 10/02/2026 10:55, Gatien CHEVALLIER wrote:
>>>> +  memory-region:
>>>> +    minItems: 1
>>>> +    maxItems: 32
>>>> +    description:
>>>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>>>> +      by the trusted domain of at least a RISAB page size.
>>>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>>>> +      can be represented by one or more pages.
>>>> +
>>>> +  st,mem-map:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description: Memory address range covered by the RISAB.
>>>> +    items:
>>>> +      - description: Memory range base address
>>>> +      - description: Memory range size
>>>
>>> Why do you need this property if you have memory-region already? This
>>> also should be part of <reg>, although this mixing with memory-region is
>>> anyway confusing.
>>>
>>
>> The RISAB is a memory firewall peripheral covering internal RAMs. It is
>> possible to configure multiple memory regions within these RAMs (done by
>> the Trusted Domain) with security, privilege and compartment isolation.
>> This peripheral allow 4kBytes page granularity. Each page can hold
>> different access rights, with 32 pages at most (hence the maxItems: 32).
>> That is some information that can be added to the documentation.
>>
>> Moreover, when a region is delegated to a non-secure privileged
>> component, this component can configure the privilege level necessary to
>> access the region.
>>
>> This property gives me the opportunity to get the memory range covered
>> by the RISAB. "reg" here is used to access the actual RISAB registers
>> holding the configuration.
> 
> Looks awfully like memory regions still :/
> 

IIUC the memory-region property references memory regions within
a reserved memory. Which is not really what I want to describe
here as I want to get the boundaries of the whole range. The
memory-region property would be used by the Trusted Domain / kernel
to get each regions (or only one that represents the whole range) of the
internal RAM to apply desired access rights to them / use them.

Describing the memory range using a reserved memory would make the
kernel exclude this memory range from the normal usage, no?

I think declaring a "boundaries" memory region with no usage for the
kernel wouldn't make sense. The kernel may not be able to access the
whole memory range.

>>
>>>> +
>>>> +  st,srwiad:
>>>> +    description:
>>>> +      When set, the trusted domain configures the RISAB to allow secure
>>>> +      read/write data accesses to non-secure blocks and pages. Secure execute
>>>> +      remains illegal.
>>>> +    type: boolean
>>>
>>> Shouldn't this be a property of given block from memory-regions, not
>>> entire RISAB?
>>>
>>
>> It is a global setting for the whole RISAB (in RISAB_CR register) so I
>> think it's fine keeping it at RISAB level.
> 
> And in the next version of your IP? It really feels like description of
> memory region, not the entire device.
> 

Then I would expect it to be part of the page-based configuration and
this property could be constrained to current platforms. Is that fine?

Best regards,
Gatien

> 
> Best regards,
> Krzysztof


