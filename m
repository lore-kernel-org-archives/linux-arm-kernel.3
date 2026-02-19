Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38D5E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHprSa7SE8GgE4fVxXPSaDj/BYIhqdgyCLDJBYwznOQ=; b=Q9aGaH6f5n772cWt9W/1VVTYsw
	3Sp65qsDrf9juT4kD1SvYOd/2pDMIAVF98uJ5wUke5SpfhPRIPjixHARVzo/aNBi875IyOnPqWM2Z
	+goOP5wLWCqptaoVUMOnAS6RDXy3ovM9J0MFLn0jb18el4rhzHSYIsU3vyE3nTsrpneSrpfsshq8G
	NKUKnNM4iIPYujSZZALk6h+RROxReJN/cznDWSvf6DKJh39ZtziVaNj+cd0nHRA6kiLbGtLQa8oUI
	yds3fvL1J5fEU8KoWONPWaLAVy6a1/pDuv7uXj/LZt0GfexMfyBAsnmjH76ceGRFekKvPUsvjTf2E
	j4f6BG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4br-0000000BQaE-3SKW;
	Thu, 19 Feb 2026 14:02:27 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4bo-0000000BQZn-3Sip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krxT0mMQjVRO4gs2KXUESe26MzxUBd2lvscDmX4vGgeeE1sdGUfHSvhk6DLv9nQbMoAp1NVtGlQ8RRMUPhckQfm9tdm8jlEX96DddMiWvNHxwdr4wQ/9bngXTc0AJcIJyx1sQrGM/g5H59ogxSRySIodJ4Jrqf1ljhYW4l0qLR5uLIKPIRVwHtdsX+B+/bZ5Bz6ZcTU6joviQmC8hOr4JsLAHTf8pQANsv6ROS7c2LoavcybNPAEMMYcyWUUjDLAD09BgYeRvPpBEWOr5JFMd0GeO0CV2M82d1qjrT43QrYMJv2h7vLgrqR9icti880FZ8Vkcj6nl7Ms1Lilcqol9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHprSa7SE8GgE4fVxXPSaDj/BYIhqdgyCLDJBYwznOQ=;
 b=UAKpBH4BMqswuR/OEwtkUWWM2rTN4nQuXiCDjI7KIX/7GZiTox+FHXOUTwrroVnPI1eF1HMDaYhf19av1OObHh5LkzPqJHAeIruEtcteBnhFANApSlEUwTJxvG/td4fcYv81UQsEr/WFc7MdAeDLfeB6kslfBC/81cixPsUR+s3wOdY2fO1egKQ38wnjZFNnXr/U0eH816iVXGuXe/61ztaxLtvtYNYSFiINAUAjmYCHQv5jEAp5ZFn+sFHdwI/cb7rXqnGgb6ARYc8TPz+LTurOhRV+k7LEzya/NXCOZUYnJ7W66Kpe6jzdCnKYkBYA0nPhcrmBYw1hEud2Isd0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHprSa7SE8GgE4fVxXPSaDj/BYIhqdgyCLDJBYwznOQ=;
 b=CvftScjbOXNjSGtJesG9hFZtbf9w2t/LlHGgM+VtXVM68lJmn0mHlNpHxVETxGf8O9Twzc0WqWP1ZST9drvDaM4AekkDjyEmFbRDcDkyXzhd2Czoer71qfpYnOmRwM/yxMBCM/g+CwzGA6l0KiWn8eIZicV1hrP7CXTcXuMnrXSn3Hhk2bhlGnoBLdZFf1QRzMVOnM2/582oTyzihVcrx90I8Rv95RikWXi5I8S7dF/T1oB6lbaOzwZ5n+juCcOTwYYQ+pPS9rAq0SehUEvqFvtGv/6tJJTDdoCVVLpzmPZT/hMmKnvaxL+/LZnhhm4T4jWvL/M0M2jyf3Pmc4c41A==
Received: from DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) by PAXPR10MB7925.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:24b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 14:02:12 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::6f) by DUZPR01CA0285.outlook.office365.com
 (2603:10a6:10:4b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 14:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 14:02:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 15:04:06 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 15:02:09 +0100
Message-ID: <b535dfd6-e4a6-4831-a868-c152574144c8@foss.st.com>
Date: Thu, 19 Feb 2026 15:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
 <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
 <ed0ab69f-7aff-423f-8b93-980e79705b6d@foss.st.com>
 <c588720a-6a7d-4179-afb5-bb7e89e0e7e1@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <c588720a-6a7d-4179-afb5-bb7e89e0e7e1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|PAXPR10MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8fb800-4f54-40f2-d7e5-08de6fbf79f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTkwUG90OEFQZzdaYlpCNFhNTGEyVGVSS3Z4L0J6ekJqSWVBUjJycHZHcTlz?=
 =?utf-8?B?d0dSWTg3TnFTRWlveWtPNlZUZXU3UDdNNTNKc29pWjBjbEZyU2diWUhyc1M4?=
 =?utf-8?B?Rjg0TXNBcTRkMk9sTndYZXQ2aUNDemJZeTVCdUc5RW5aa1U3WXFvYng4aDZI?=
 =?utf-8?B?QUlzeXc3RHF3QmRqb2tGeTZ3Ni9FdXdSUnovMTNUY0N5THpDc2FDOXdZVHNG?=
 =?utf-8?B?SzRneEIzdlJrL3doYjBrVUVSRzd1Ry96Q1hkOTdFazNsOHIxaWM3U1Vib3JB?=
 =?utf-8?B?N1NLZXgyWFI0RmNFaEN2dFhPVEsxWkxBbkQ1VkpTVFptcGtUblhvMGs2Qko3?=
 =?utf-8?B?TkVDVHREUGd0aXRzckU3M1UycG9PTjhXNzM0RUg2OWxDRUdNZWVJd1VVNzRt?=
 =?utf-8?B?N0pZTGhJVkFjcm9YZHZEV244amw3dmg1dmpIaS9XdFZQZFlVTDhQdVRJZ0RG?=
 =?utf-8?B?b2Y1U1Fpc2JuK3lML2E4a2g1VVFSUkxwaUJDRUU3RVN2cmtCWkNTbitnSDlv?=
 =?utf-8?B?N3lqL3JMeXNnU0VFUDZuU25JVysvQTA5WFArWVhCSUljY2JObkUzWXA5ZjFS?=
 =?utf-8?B?OU1VN1hlUkVGTndUQjNaNmZSTmdsN0lISzN4c3pMUXpCbWZTZExTL1RLRmJ0?=
 =?utf-8?B?R0JBb1p2Q3I5Zm5rZFlweUEzN0NJR01Kd0pEb1lUenBxRnBJZXBVcFJLTTA0?=
 =?utf-8?B?NmxYZWlhMElqaHNreHdwOVE1azlUcWpFTG9KY1lCTy8xYXRoWWZ6NEllNWdE?=
 =?utf-8?B?QkRMM2NEWWtuNTNhZFJPc1ZBTXhTMlZjdTkzc0ZHdEhiOWwrTkg4VFdDWkxX?=
 =?utf-8?B?Vld1VnlTcEg4OEcwMkpBRlEvRjJTUkpTN0Y0RkVCbmdsWDhUeWhBTlRTYi85?=
 =?utf-8?B?Z0VlNCtpbU9na3pDT1Jkd2Q0UGtlUUUyVkFpUEFoWlo5ajhONGVqSjlHY3U2?=
 =?utf-8?B?SmpJV3BIU0c3dUMxcVVNSi9meVBLVVk0djhyQ2kveVBSbU92NkJvTXpubS9O?=
 =?utf-8?B?S0IrRFZET1Erb01PQmJrLzAxY2pKdTRtcWpER1Ezcm5aZXZOOEVsSlBFWDAy?=
 =?utf-8?B?NzZVeDF4YnVjdGU3dmszVDBVRGdmMWdIaC9WZ0pseVo4NWNnUzJ1YnZkNXA0?=
 =?utf-8?B?N1ZLNW12QUh3am9sK2lBVDFidG5WbFdMQ1lOb0VLbk02QzZaTEVVWW1kQjRL?=
 =?utf-8?B?WjIrQkxDQW5JR2ZUdFY3d3F0dW9zMVRlOFFtWUZQdW5tT1VaaVlXK2w4WjRj?=
 =?utf-8?B?YmpyVFV6OCtZMWxsMjIyTkdZamphcnVqUWMvMTh2N295bGtqQXQrRkl6K2NW?=
 =?utf-8?B?Rm50dTJNUG1jL3hKbHA4UXkzcU1jRjNQanJsYmN2dnpsb0djTGhkdi9MTU1m?=
 =?utf-8?B?M0RLcUcyQUthWEptN29heUpObng3VE1oMmdhK2ZQTFR3T2pNOGIrczUxa292?=
 =?utf-8?B?THVBUmhOVmhXREd4THBqOXVvelR1M3RqQmUxbEVsc1VLcWgvZ0VIdC85dUpv?=
 =?utf-8?B?ZHdsTDlsazZlUjk4YVpXdnMzS2xHa1cxeE5CL3ZLYXo1WEszRmFRcGY4RDk4?=
 =?utf-8?B?Qmtsb3NyelBtUTA3MzFBaDlSWjM2TmRBNGloU0JHSmo5T2hBb25vTVhBc1J2?=
 =?utf-8?B?RFNuYmNkWElTcDNjTmhoUEYwNy9sd0V6TGxoQnIrdkNkMndhZTUvVjRQdnly?=
 =?utf-8?B?b1FXMTVmQkNuSTR3N29iUm5acUVLektNWGZXNm5GblY2Q2tHSWgvQWFEalZ4?=
 =?utf-8?B?VjJkRjV6M1lzbjZMemFyYmVaRXduVmd1VTNaeEd1bmw1Um83M0kvKzVXMjhN?=
 =?utf-8?B?blN3UUtobGZmN0dMSmtPRFB6bHpHa2NvL3RXYjc4TjFIRURPMmZXZlZpMlo3?=
 =?utf-8?B?eXczWnpNTng5OTRFOVJGUVkyait6OEoxdGR4WnJWZlB3R29TZlVHZ0dkRGFs?=
 =?utf-8?B?V0hxOGkrMDZIcGg5Q2cyOG1zdHpaZkFSTXdzd1NaRVJPQUh4S09rd3oxdm9N?=
 =?utf-8?B?Rm9JZk1aMTVMcGlZUVBYV2tQWDZ0bkwzeTMzQVdDSUlheWdDbVNTeW1rREN2?=
 =?utf-8?B?MlVjOC9XSDgwZVZtUlh2TXcxcktDY1AxMENFNVh6cDMwYnJFVUtoZkpDWFhE?=
 =?utf-8?B?R1RHeG5OQWhNbk9JK2RTVmplTHJqZW4zZFRubE4rSEFJdnZEVzBZV2pWSlEw?=
 =?utf-8?B?UndvbzBheXRXRDdjRllDblZQOHdCN2Vpd3RwYXpYTDQxOXRlejRFM21NVjl2?=
 =?utf-8?B?ZGNYTkdVVXFLWTZrbGdlQVVyMmF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +FvKZbsDLipkgFlRDYVaGbt38FhxW6I63yeGAJdEnP7bn7BwZk2Z5g2Quf9PjtfamXehHw59ymmv2V+0/5khR/xD3kNAaCoOAMUv0drFyRx/EY3ojF6P1Fel20DZGXjGc8dTrAAQr1rNH47hpc6qNVlEaKXVmmJssAcpwgh3cjLHFmYVAv82Ex5g03DR1XTv487qtEenkwhsM+V06nsqhEnh/CL02zT0uYhKCLYfpptD7ctD5WcPFTGhZAYiCvOcwMAMrBTQ4Q4wRqaxxPqtpxlT47ldong8ZKOlaa3/1w6vVhD65X4arleUYhDDrcYCKoMOK+pWZk/W8S4pVOMYjK9uivKTLZvEXR3cnTaijpTNZiIULkROcBPZA3J5lve4R035qCe33F+URHBlN9sYL0ogK9c+PDeHB/4MkZqmn3Gwn8WY66CboYLP77/NX1le
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:02:10.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8fb800-4f54-40f2-d7e5-08de6fbf79f3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_060225_406557_F664C119 
X-CRM114-Status: GOOD (  29.90  )
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

Hello Krzysztof,

On 2/18/26 21:03, Krzysztof Kozlowski wrote:
> On 18/02/2026 11:38, Gatien CHEVALLIER wrote:
>>
>>
>> On 2/17/26 21:06, Krzysztof Kozlowski wrote:
>>> On 17/02/2026 14:12, Gatien CHEVALLIER wrote:
>>>>
>>>>
>>>> On 2/13/26 16:06, Krzysztof Kozlowski wrote:
>>>>> On 10/02/2026 10:55, Gatien CHEVALLIER wrote:
>>>>>>>> +  memory-region:
>>>>>>>> +    minItems: 1
>>>>>>>> +    maxItems: 32
>>>>>>>> +    description:
>>>>>>>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>>>>>>>> +      by the trusted domain of at least a RISAB page size.
>>>>>>>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>>>>>>>> +      can be represented by one or more pages.
>>>>>>>> +
>>>>>>>> +  st,mem-map:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>>> +    description: Memory address range covered by the RISAB.
>>>>>>>> +    items:
>>>>>>>> +      - description: Memory range base address
>>>>>>>> +      - description: Memory range size
>>>>>>>
>>>>>>> Why do you need this property if you have memory-region already? This
>>>>>>> also should be part of <reg>, although this mixing with memory-region is
>>>>>>> anyway confusing.
>>>>>>>
>>>>>>
>>>>>> The RISAB is a memory firewall peripheral covering internal RAMs. It is
>>>>>> possible to configure multiple memory regions within these RAMs (done by
>>>>>> the Trusted Domain) with security, privilege and compartment isolation.
>>>>>> This peripheral allow 4kBytes page granularity. Each page can hold
>>>>>> different access rights, with 32 pages at most (hence the maxItems: 32).
>>>>>> That is some information that can be added to the documentation.
>>>>>>
>>>>>> Moreover, when a region is delegated to a non-secure privileged
>>>>>> component, this component can configure the privilege level necessary to
>>>>>> access the region.
>>>>>>
>>>>>> This property gives me the opportunity to get the memory range covered
>>>>>> by the RISAB. "reg" here is used to access the actual RISAB registers
>>>>>> holding the configuration.
>>>>>
>>>>> Looks awfully like memory regions still :/
>>>>>
>>>>
>>>> IIUC the memory-region property references memory regions within
>>>> a reserved memory. Which is not really what I want to describe
>>>> here as I want to get the boundaries of the whole range. The
>>>> memory-region property would be used by the Trusted Domain / kernel
>>>> to get each regions (or only one that represents the whole range) of the
>>>> internal RAM to apply desired access rights to them / use them.
>>>>
>>>> Describing the memory range using a reserved memory would make the
>>>> kernel exclude this memory range from the normal usage, no?
>>>
>>> In general yes, but also depends on the use case/drivers/purpose. I do
>>> not understand why would you mark some memory for generic use by kernel
>>> (so not reserved for specific purpose) and still configure it somehow
>>> for trusted firmware to allow secure read/write access.
>>>
>>> If you mark some part of memory as a meaning for TF for secure access,
>>> you already claim it is not a generic memory. Otherwise TF just writes
>>> all over malloced() pages?
>>>
>>
>> While the Trusted Domain applies the configuration, it is entirely
>> possible for the Trusted domain to give himself access to, let's say,
>> the first RISAB page to store whatever data, and give the rest to the
>> kernel. Actually, this is what we do to store OTP data mirrors
> 
> And what happens with the rest of that memory? Why the first page cannot
> be the reserved region?
> 

First page should be a reserved memory. As the rest should be. Maybe we
have misunderstood each other here.

>> or DDR context and give the rest to the kernel or the co-processor.
>>
>> Now, using internal RAM for generic use by the kernel is unlikely but
>> I have in mind the last firewall controller of the stm32mp2x platforms,
>> which is the RISAF. It has the same purpose as the RISAB but for
>> external memories. One protects the DDR so I do want DDR regions as
>> accessible for general use (memory node).
>>
>> This property allows me to describe the boundaries of what is protected
>> without having to imply anything from frameworks about the regions as I
>> have no way of knowing what is accessible and what is not.
> 
> Frameworks do not matter here - we don't even talk about them yet.
> 
> You want to describe boundaries of some dedicated memory region and you
> should not have a custom property for that.
> 
>>
>>>>
>>>> I think declaring a "boundaries" memory region with no usage for the
>>>> kernel wouldn't make sense. The kernel may not be able to access the
>>>> whole memory range.
>>>
>>> I don't understand that. reserved-memory is for cases with "no usage for
>>> the kernel", so it would perfectly make sense.
>>
>>>
>>> Look what your description said:
>>>
>>> "used to protect internal RAMs by applying access"
>>
>> Yes, access rights are applied by the Trusted Domain. These firewalls
>> are very flexible because access rights on secure and privilege levels
>> along with Compartment ID (SoC is divided into multiple compartments
>> holding a compartment ID) can be configured. Some bits of the
>> firewall configuration can also be delegated. e.g: When a memory
>> region is configured for privileged, non-secure access for the
>> cortex running Linux; then the kernel could reconfigure the
>> privilege level (unlikely but feasible).
>>
>> It would be quite complex to explain the whole mechanism without
>> pointing to some documentation [1].
>>
>> Anyway, access rights are applied, but access may very well be given to
>> the privileged non-secure compartment running the kernel. Meaning that
>> only the kernel can access such memory. Not the Trusted Domain, not the
>> user-space, not the co-processor.
> 
> This implies that if you do not reserve such memory that way, then
> Trusted Domain or user-space could just poke and use it...
> 
> If kernel explicitly has to tell TD to do something with specific region
> of memory, this is somehow a reserved memory. It is distinctive,
> special, selected, chosen.
>>
>> So you could give some bits of internal RAM to the kernel for whatever
>> purpose you'd like (Storing particular data you want to keep in some
>> low-power mode, etc...).
> 
> All RAM is for that purpose...
> 

Not really, some RAMs can be powered off during some low-power modes.

>>
>>
>> [1]: https://wiki.st.com/stm32mpu/wiki/Resource_Isolation_Framework_overview
>>
>>>
>>> and
>>>
>>> " a trusted domain, or the domain to whom the page configuration has
>>> been delegated,"
>>>
>>> so how it is not a dedicated, special memory delegated to specific
>>> devices and/or TF?
>>>
>>
>> The memory is delegated to some contexts. These can be the processor
>> running Linux, a co-processor, some initiator ports of peripherals
>> having DMAs, etc...
>>
> 
> So pretty close to what the purpose of reserved-memory is...
> 
> Well, we keep discussing and I am really not convinced. You can try to
> catch @Rob tomorrow on IRC and maybe get his approval, but for me this
> is clearly some sort of reserved memory thus you cannot go with own
> bindings. Another way would be to prove me wrong by using the reserved
> memory binding and showing how it could not possible work, ever (such
> counter examples sometimes help to look at the problem from a new angle).
> 

Sure, good suggestion, let me state why I think a dedicated property is
preferred for those peripherals. For this part, I will take into account
the RISABs and also the RISAF mentioned previously. The RISAF kind of
works the same but protects external memories such as the DDR.

Just a small reintroduction of the issue:
We need to provide three sets of information to the drivers of RISAx:
- The registers of the RISAx device, handled through property "reg"
- The global range of memory addresses protected by the RISAx devices
(currently through the custom property "st,mem-map")
- Each individual memory range protected, handled through property
"memory-region" that points to children of "/reserved-memory". Memory
regions may not cover the whole range covered by the RISAx.

To replace the custom property, I have explored a few ways:

1) Describe the memory range covered by the memory firewall as a
reserved memory: Cannot be done because, for the memory firewall
covering the DDR, the reserved memory would overlap with the memory
node used to describe the memory available for regular kernel use.
The memory node represents part of the DDR in that case.

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x1 0x0>;
	};

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		risaf_range: risaf-range@80000000 {
			reg = <0x0 0x80000000 0x0 0x80000000>;
			no-map;
		};
	}

Overlapping is not permitted, nor hierarchies of such regions.

2) Use, as for some Quad/Octo-spi or PCIE drivers, two regs. One for
the peripheral register and one for the memory range covered. Cannot be
done as the reg cannot be out of the SoC range. E.g, on stm32mp2
platforms, the SoC node range is 0x00000000 -> 0x80000000 and the
DDR is 0x80000000 -> 0x<Depends on DDR density>. So the peripheral
would be under the SoC node and the memory it covers (DDR) would be
out of range. It would require an artificial extension of the range
creating potential undesired effects

3) Use the ranges property: cannot be done because of the same SoC
range reason.

Therefore, I still think having a dedicated property is the best
option, but I'm ready to evaluate other suggestions.

Best regards,
Gatien


> Best regards,
> Krzysztof


