Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F600FD2D69
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY8ahe60e0FFBRxPqNGHIhj7j/k/iBMwB3YH/yJrxgA=; b=Htl3YYxCWwPxU4Q0E0fM0+FVj9
	M+3cwl4teQMMfOS1Dt99wDA745RhGIq9bwHlpBoe8anmz5uom3yXYc9Pin4xMM/0fvdVIA6uSg/qk
	yvJ0wERVN78iHWY2Jos4xQCoo2ygzjgMigWmmMy8C3TzAQu5wKjjLy2pmJ0CHVJARjb+RNyoXTXxW
	4xXAdVr/ZObel2VXHGYClJcKZ7udqOqjtEb2v0jN+sFJJLOKPb3pygh2QyvPAQppGqGf1ZtoEr4K3
	8pczrOA3BqrUkzOUkedTaJLq0tcElUstbr56yD99wBnIaBjR+yA83IbOWq67Y5uKgzjDSBrm4FgJC
	kehF7sLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwMS-00000009VA4-2kyk;
	Tue, 10 Mar 2026 12:38:56 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwMQ-00000009V9M-2YAU;
	Tue, 10 Mar 2026 12:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyIBh8KNrCqWaudbLWeibSzwVTWr/N0UFUT5vZHVG8EmijtGXJT8LH7qdQDg32hpagPfevT727z5XVrGobjc7gIrQ2uRssWrPEpfs0bsaJrzTTMw/SoFR+5VVvFwCyKkHzMalqIDXORY1HSKshW8mJH7yr8CWqsmhmWcvEaBUb+CbPTa+2G4fCxTqdloe37q3UQpn20ME+57JhZxBZYMCJQ37lht7H0ZX/KveFCjUv8QryeTWt2OT+H4XqnrBXOgbrybqdUr6QoTaMq2CncQxyzDlaGh7WRnLv1odo0yhJbrgJ3s346Sck/fVj65lLaWN9I+31wAekreLyEJMYB6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY8ahe60e0FFBRxPqNGHIhj7j/k/iBMwB3YH/yJrxgA=;
 b=BCSWBuddVk5e7oQ60OGHuBvOfaAvu2uivlpzRgu8VUze3sqYcmaS396YU/LILMn1LFTuT6qEF/O8vi6jDW00geAnSC0441w0anI7sE6bVCQ84VALPgUxksjnQohQthy2tVjBU0IwPxioPS0oJyjaPKgUADRWELqRa9jNUb5BoGnuiom5TnUd/Ric/xcXsKqSs2tCwxCAqCpA3y+uxd4+QGJ9HkoibvIP5s0H76hHDZNWZCFG897IxrDk9eHd4GvOveHM3E9RMGxaweLV6cm7dhoWlZ6ftoMa7hOjWUTKKCMrdzw3LSxwfpF1RyMQFJVnkqtt99nzreZIg51Zs4/r5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY8ahe60e0FFBRxPqNGHIhj7j/k/iBMwB3YH/yJrxgA=;
 b=PQdorFlp+v8bTquSZfk575DjiKUaJzTsmj7qxdw/xSBWOmJWKNon1ij8i6zsKRgrPf75lwPgiIXfGvKXvUzDFLBFjZAAiACFKh0O78x1aH2G0Rrb8mRwB0q7BozBxfCtWftu9FnjGVeyOIZ1FKeSjx534c82HJT+iKxYs40KS7sqHArWHJ2lP4VQEuZqOVOCp4GsrV9FzcgioSojmc9ovcKTjm+yncaPv2lvHVjwNbQ/i2L3nEtWXXxryS0H0zYAx7GDXXjM+ZsN5tTebjHo+xPKv6VxNMX5iNT3HQbLC4ldEs9VVRH/AZ+7ufYMdwqZdQ4ss+5AnmFB6h9ZvUxdkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB6532.apcprd03.prod.outlook.com (2603:1096:101:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 12:38:46 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 12:38:46 +0000
Message-ID: <5661aa0b-de22-4392-9080-969d01bf48b5@amlogic.com>
Date: Tue, 10 Mar 2026 20:38:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <20260306-monumental-nuthatch-from-avalon-bf108b@quoll>
 <fb47c7f7-9eb7-4895-8652-3b5329d23752@amlogic.com>
 <0f336f9c-455d-4438-8b65-442ba9501e92@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <0f336f9c-455d-4438-8b65-442ba9501e92@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ae5e38-ee42-4ee2-7355-08de7ea1f8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099002;
X-Microsoft-Antispam-Message-Info: Sq0eP1zFfvHoJh/NcW4QipfapXmVPQo5H75jDhDxfvn9b9Z4IfGrWQzztwm+4v9YPWssbIJgh4Ih7XvSq4Td7OhxjNp7dM6zZUB/3xoDV6/CxnIhWDH6kXbmxj/IAjTIfP4L8DMXOP0DWNIiGV+3IaycVWYhPPAD6a76TFhSDR+OlDYS95kISr0UjIRM+vX7c84CIvdrc//YwH73/CDDrOXEbHebZHTiwamdc0zZO+9CCW05tH1Hw/2+P4i779wZRerVSnwwfRQquFwaMAVWlj5FKuRVzHMwPSo2hCmate+B7T/c60bgtFlctNlXo1UrB9qctYAXsuNABS2SZKcxjCL06BBA+e3SoWVmsVFGNNQhZ+gB/+P9Yp4amr5A7DXr7/uy5f2E3hJ1uFs4sCPiVa5cRMoH6KtS5nozYaUNZ1Tn5DNtmLrPfT0AddYLThsmTOpk/CGcpjm+eg9kbHQKcigSwcH0DS7ejudevU1d7KXdp1ahXpTDdoObEDTSHP90jUnaDtGxUijGzJwtpjDP9gJyOF/VsuJLtQV2vWwoy15NTV27+RpPcPrSypCZFjvH81Bs8KsvScGNE6/DKH7wxSw5YDnkRZCbuE+NrBiC4EUcPtO3y1KIpTgASUR+iHvzNICOEcx7AZRSHEDNyQ2kNnt+EbtpicUVGrcVcMqoovHstBAgFjbTwk9e1yxjfAy6vo8zJb9OW+gMeWXkanZ252n1QU9WpM7yFuuxFyPWQ5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZBMjlLWEE5SlpHNkdSVStNdUxIQ3FzaDd3SldSOTZuVHFzYWlydktsT1pw?=
 =?utf-8?B?UWZ3aE1Da05KeENHWnVKVnZQamwwUWN6UE43d2RHTy9GS0szaCtkbWNPcUJP?=
 =?utf-8?B?c1JkWERPdG45aU5OOENjT2lDSFNZbkVEL25zUCtIajBrOUxwdUlIUzcvdmpT?=
 =?utf-8?B?dzl2RkJFMmpJMHMyUmk5NjF1aEp3ZkRybWhWdndlVmhJY3ZmTlBtc3U0TnM2?=
 =?utf-8?B?QitrSCtKZDArNmdoMUJwaTBueUY2THFEU1cwS3F4ZXJHb01vbTRqL2FhYktv?=
 =?utf-8?B?NFBIODV5NEdPbFVENld6VHRCNjh3aHhSUTgvVkNpOWxwak8xVlFlM0Q5cnAy?=
 =?utf-8?B?eDBRc055WW54ZGVUQ2ZCM3p5b0ZnUi9JZ2NPbCs5RDJ5YUxuUjhqbU1RRjND?=
 =?utf-8?B?alNPVFFCcjFxTWJqVlBub1V2dkM4TmNHNnVMUHN4b3hLMTcvZCtEOHpzYnRW?=
 =?utf-8?B?dGN5S0FERWZGZ0ZWakZIdHJQc3d6a1FkK1NJcTh6N2dvK2RxUCszNEVnSnpq?=
 =?utf-8?B?RkY1VHhHaldDWGN3blMxcitaN2ZpblBxN2ZzRUZ3OWc5V1o2ckhuUjdjVFVF?=
 =?utf-8?B?YzIwMjlTbGRiZUxWSmZZbnNieVg0R3FNQmtiNElhSERaT0l2dnBKeldKQ1BY?=
 =?utf-8?B?b3pBZU5XbnQ0d0Z2cFN1UFZNaUltTWVTNjdiSExubS9sSjZzS2p1Q0I4Sm8x?=
 =?utf-8?B?WmJKWjhxNWFuT1ExSFZUOXdTdkE5V0VNU3grbGxtR0wrajBwd0VaY2UrTENi?=
 =?utf-8?B?ajU4eGQvdmgrNW54SUtlVWt5bDdPMjVleHR1Q1BBOVNLcjJGL2k2VFNkY3Bi?=
 =?utf-8?B?NVBrcVR0NFVqelM0WHZRcDRUWTNiV0lpTldaMEU2aUhoaEtUZ1BXVTl3b2ZJ?=
 =?utf-8?B?cjVBMk5na3BQcWJFMEp4amUwTTdXR21CeWNveFVsdmpZYnhiRlAwNVh4NDBx?=
 =?utf-8?B?OXRkdmhiTkdXNTJqK1BsQVVUM0czVVdpVFBOcFYxeCtWb2FNd0dZeTJTaHpV?=
 =?utf-8?B?bkd4bXhVZUtVdHVML25NeE1iNkk0VHE3VGhUTCthR3pOMmlZVnpQMVk5WTB5?=
 =?utf-8?B?TDNJVTBvQ2NxNmxVeXZsc21zNnZtKzk1MEZEem8xZE9qN0RFbzVXdWhKak5E?=
 =?utf-8?B?a1JSNFZGM2pyMVV4TGxOT0hoTUdPaU1ZME5iQ203YU5hRUMvalVxNU9nSTVL?=
 =?utf-8?B?VEpCR2dSL0Nsa09MQXNHTjZVb21HdzczSEtvR0hUSFZXYmV3Szk3eXl5bE1M?=
 =?utf-8?B?SjNrZW1TWFdXY2o3RzF1V0YvTngvY2ErMjdvaGVYOGx3R0ZBa05uanVwRHRM?=
 =?utf-8?B?UnVwTDlZZG93Yi9aKzBVcGZNUGtPWDJCMDJKTVlNSG1lMlI4eFBWbmZFRVBC?=
 =?utf-8?B?WGRNSWdxak1jSyt5N3orZkxraldLOGxSbDVSVzZ5cHhkWTJTb2t3bmQyYXRF?=
 =?utf-8?B?ZVRUVEN2bUJwQ3V0U1M5aGc5akJ5eUlFVUI4djRFbEpubThiWmJwM0hmRlMy?=
 =?utf-8?B?M29zNjBtSXMrRmpZTXZ4UFZqUEFCNTdkWXdiZjZGZUtNdGljNVJFQkV2cHh4?=
 =?utf-8?B?ZFZjK0RZT3E0NmJHeU9ya0R1MmlhWUFabkdEZndoNE1Eb1BEbHRZNm9FemVh?=
 =?utf-8?B?ZG1KUEtZUVhXcWMwUy9SUXh1cDBsTHhpUm94L0MwdXd0QjU1ZFhacWEwNE9S?=
 =?utf-8?B?bm5LbW1JN1JZVTlzaFZOMWZ0L0ZrdUwxYUgxSkVjdW5LSVB0cFVlSkN0UnNH?=
 =?utf-8?B?U3RIZUZZSGU3eFZEQTduVHNUQkdlOFhLTTRuWWlGVHlDOWR2MEZHcHBwNnBu?=
 =?utf-8?B?UUFEQlpZRWdpaHZwRnFCM2gzZlVDMmpXeXVmRmRPVnB6a2hJTDJhU2wzRFdO?=
 =?utf-8?B?WmRXbW85WE1Nd1FxWVVtN3oxRmZoN0xJNFhraHZia1BwejBhaElTVFJ2L0Rp?=
 =?utf-8?B?S29sZFVFMDlJbFJhd3JDVkZIL0VVRnlRRFRsbWo2M0xmV0g4MXFvMWJWdnFK?=
 =?utf-8?B?U0Y2M0J6T0pKYTJiMFZ1Zks0SkY3YjVMV3lOc0I2bzFKRXduQjM0OGt6bFkx?=
 =?utf-8?B?WlJlUEMxdVdvaHgzdTA0TVEwU1lPOUVzQXNVSHMyRVd1blVDK0phZS9SeFRD?=
 =?utf-8?B?bStoK1hkck9RNTRFTzg4YVQxcXVvOVNwcktIVi8ydURmZTRxU1h6SzhDZmox?=
 =?utf-8?B?eXQrUXVyODZScTdJOUpUa3B5ZU15Vlk2cEQxWFEvR0c4aHhQYkdUTjhXU1pq?=
 =?utf-8?B?d3JpWS9rM2M3OC9nM2pTdXNmMjRVdzViZERkbmRNaXRYRXNHVnEyYVA2bzJJ?=
 =?utf-8?B?Znl6RmliTExFV0RuRkFGYnQ0c0xuTmY0UWdZQWllck1lTXVadWhKQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ae5e38-ee42-4ee2-7355-08de7ea1f8cd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:38:46.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt1uI8U8kmiNJJmoCqTkNFt4tzgwKubmHiltNuUBBtNJA+OOVC9yXQzRx2lbQhRIDOeBI4H9hFiMVtAI3wOSOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_053854_665269_C6E8BB55 
X-CRM114-Status: GOOD (  24.12  )
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


On 3/10/2026 3:08 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 10/03/2026 07:51, Jian Hu wrote:
>> On 3/6/2026 4:12 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu, Mar 05, 2026 at 03:43:26PM +0800, Jian Hu wrote:
>>>> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
>>>> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
>>>> Add it to enable proper clock parent configuration for these peripherals.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>>>> index 55bb73707d58..27cc1f331587 100644
>>>> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>>>> @@ -24,7 +24,7 @@ properties:
>>>>        const: 1
>>>>
>>>>      clocks:
>>>> -    minItems: 14
>>>> +    minItems: 15
>>>>        items:
>>>>          - description: input oscillator
>>>>          - description: input sys clk
>>>> @@ -40,12 +40,13 @@ properties:
>>>>          - description: input gp1 pll
>>>>          - description: input mpll1
>>>>          - description: input mpll2
>>>> +      - description: input mpll3
>>> Nah, ABI break. You add it to the end of the list or provide arguments
>>> on ABI impact.
>> The third patch in this series enables the DT for the Amlogic T7 clock
>> controller.
>>
>> The clock controller node for amlogic,t7-peripherals-clkc has not been
>> merged upstream yet.
>> This change modifies the clock index order, but it will not break any
>> existing device tree since the
>> amlogic,t7-peripherals-clkc bindings are not used by any upstream or
>> downstream DT at this time.
>>
>> Therefore, it does NOT break the ABI.
> It does. Clearly visible from the diff above, because the order is the ABI.


Got it, I understand your point that changing the order break the ABI 
(since index order is part of the ABI).

>> The last clock entry is an external pad input for RTC and it is optional.
>> For logical consistency, it is better to place the required mpll3 entry
>> before the optional entry.
>>
>> If this change does not break the ABI, could I keep it in its original
>> logical order right after mpll2?
> Change breaks the ABI and commit must explain why and the impact.
>

It does break the ABI.

The mpll3 clock is one parent clock of sd_emmc and mipi_isp clock on
the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
Add the mpll3 clock source for the T7 peripherals clock controller.
so that sd_emmc and mipi_isp can use mpll3. That's why this patch is added.

While the amlogic,t7-peripherals-clkc bindings have been merged upstream,
the corresponding device tree (DT) that uses these bindings has not been 
merged yet.
As a result, there are no real-world users or systems
that would be broken by this change.

So could I update the commit message like:

The mpll3 clock is one parent clock of sd_emmc and mipi_isp clock on the 
Amlogic T7 SoC,
but was missing from t7-peripherals-clkc.yaml.
Add the mpll3 clock source for the T7 peripherals clock controller.
so that sd_emmc and mipi_isp can use it.

For logical consistency, place the required mpll3 entry before the 
optional entry.

This change will break the ABI, but while the 
amlogic,t7-peripherals-clkc bindings
have been merged upstream, the corresponding DT has not been merged yet.
Thus, no real users or systems are broken by this change.
> Best regards,
> Krzysztof

