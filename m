Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MptoVLFPtYosN3JpnP6DVOVMRhV/tNgvluH/wUqXIKM=; b=1DGoCbfFlw9flQqKvaSOQu0dUB
	xffIBfSb0+6cF2sfDEiHeQYBuCvJsy2W9pyeN9GPlAVrT4sno3rCpureIJq6oGb+XZws/HGOa3+D8
	H1B+snBBI5Q9464ClrOZCadLIzdIN9iA0RB8nC54xtsLdeC9Ife1EqsaB560OIMtFPAXApcqH/QOf
	3/xQS2s/iqMFRgxH653PgOSqcCzE/iwGcNjx1msjjcuCa7e4fAE0iXgc2JdSMXFMfotgIs2pcMkbR
	ntF0O8rwZwBnQ58bU1tcsv04XGPl1ZswYMEaxZqAZVULhUGXvhVjJpijZzts4ySOaSTQvLsmLkZoI
	HCKnRZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fTm-0000000BaB8-408w;
	Fri, 04 Apr 2025 11:44:58 +0000
Received: from mail-westeuropeazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c201::7] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fLo-0000000BZ3u-0w4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uq++vojDcm7pqZASz0dILJvbnfoE/DqxWxA94yjrHYwLk8iUhJhYP0lNnivYPfI/4IcvPK2DGCYWysSa0DOIwL8EbVTeAuXBusPlExZGa2jxrkTg1l7IjAPgbulAJSg338BmOyd0FcibYQhhJt1+qjPmL3uVLAf5pdieYwxp+RtEd1y0arMjPW9mUzM9F7zaQLpHX6mvuHt1pGLhBbO/1nQpDHHCJmk2vckK2I6znE6PC8RXqEmZLDBembRnl7rLhE3FCGfaPHXv408y4ZTU9hU+yQd9oKN4f0aR6F2Cnt1HYczw82CaMorx/ChWP7UUU2ahE80KNLZMMFW2JNLahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MptoVLFPtYosN3JpnP6DVOVMRhV/tNgvluH/wUqXIKM=;
 b=dlYJi59ZNlESU86E3FfjDLvqt8SDKpCc0FuoODyEowMAZwUmQXcO/7JeXbhJs+JIlfksF5+CCpT7hBV+7EfZWSoB61aKJL7nWJjNdfJmNOSUFjGKwLG0R2jmwPlLZU+hRqkF/OYCKvSz9lgg2yr0aLpa5pFQgbE9Wk1Y/dFiEnmI0JFBEtUasKoJSAPz2ABpUJPaGJgnU5PYyvvCoUGuDvwT8ck5G7couymsdqAX5nW4GcAxu+RhlTOxW5Se766Wv4TKfqNjNBqkR/pAj+mf04VGJQsK+W+s5IqJNVpcr3YSlepx9T4vCZThMPrH68bBwsjgui5EhvLCqFZ+AbjQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MptoVLFPtYosN3JpnP6DVOVMRhV/tNgvluH/wUqXIKM=;
 b=xLK405Bp3b7s6L0HtIv+N8+4NCrL9bb7/ObdtLDhPqOhaWrsXD1rIKZkd8EIS7JRirEeT1LueBQNEM5sDGvWKSbV6v5MOgfJDXQJuhqo1E3DfZqAQWuuhc+x7Vx6RT/OGsn63T7OngLSP2yI0EMKa4qemc40SbPvojAG7w2mPikFvHnfZJykaT6Bn2W9cMOuy9SIOks3Zw0lOYZfDUUJhTqEfkKkwG9g2J9EgIXHK/U1PmXoTzGAXUWWI9d+KLWS2qg0mg7rogA3BtyEO82UbFkfCnQsz+28FYvw/r/DfU2CZTQQW09VtLQd44VS3dWggHiqNV1b10y1+hO8dJ3Uaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB11053.eurprd04.prod.outlook.com (2603:10a6:10:589::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 4 Apr
 2025 11:36:34 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 11:36:34 +0000
Message-ID: <dfc1c195-4514-4667-b9b5-96ab3e175bd0@oss.nxp.com>
Date: Fri, 4 Apr 2025 14:36:30 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
 imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
 <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
 <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
 <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
 <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
 <2025040408532288b38dea@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2025040408532288b38dea@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0008.eurprd03.prod.outlook.com
 (2603:10a6:208:14::21) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f118f-aa63-4c2b-35f8-08dd736cf3d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTkzZDZDQTRRRmpiSDlNTGlxTHRpc1EvdU9CaWVpemxESmc5U0RCRUJWL3Qw?=
 =?utf-8?B?RGhOZXFhZStoM0JPR1hiNVd4QUlxcXA1bFJyd1g4VmtmY2lxeUZianBneHZK?=
 =?utf-8?B?aW03QnI0R0tkYUIvUmxIblBsRmRKWVVsL2RWNjcxYk9zWklBb1lLdVZuai84?=
 =?utf-8?B?OU9kZ1FLUmwzclNVY04yWmt3d3F0VkxHcDVpcHpFcTF5ZnY5Um0vNC82Rm9x?=
 =?utf-8?B?YVpuKzB1aVlDWEV4dEZrWXpQajZ1bmJ4dlVQUWVtTllmYlFnSC9aYmVSeVc3?=
 =?utf-8?B?SENpeHdpbjYxV3h5YnA5YmJMd1YyZ1V5QjRQUWdPNTdkZ01hWk85eThCM2dl?=
 =?utf-8?B?Z3hWczU0ME9VV3ZYc05QdXhJRUp3Yk9IRFQreFkrV0JmbUhLbkZsYWNZdVpJ?=
 =?utf-8?B?M1JKYUgvNXNzYnVhL25VeTd2cEZrc0RyemlUUzJSMU82TU0zVFN3RkQrUXRX?=
 =?utf-8?B?YTFSRGI5cUdQakpXMFYxTWMxMmcvKzJ3SlM5Rkl1M0I5WWJVVmRiU05aOFVZ?=
 =?utf-8?B?VjcwQ3NhL1RaUUhXTnk5cU1TaUJXSjg1TGo0K0xYa0J5Q28yMEdFTFh4Rm5v?=
 =?utf-8?B?KzVNRjJmMVhsQ1RDZExBeXlFVXhrRzcxSWxpUEtrendMUDBHZ0JKTmxwQkgw?=
 =?utf-8?B?UzB3dVg0ZGI3L2JmNGVZcjhMUzNvWWZFRW0wUlNWNWNHRWtCaGRrM3N1OHkv?=
 =?utf-8?B?eXZEVEcvWjF3ODdVdFFuMGZlRmlyZlJ3R3ZrekRqMzhKVFdIRFlQTG8vRzdo?=
 =?utf-8?B?SjlOdHJzT0QyV0o4Sml0eFhiTDV5R1F0UVdBejhRWmxwSlBGWEhEYVg5RE5n?=
 =?utf-8?B?ZGRrVE1VZFZZZVM5ZE5sOElicEkzaU4vU0E4blNBYWJyeEt3b3V1MXFiNWc2?=
 =?utf-8?B?cUlialNPZkFWOW5DUFZmdkU2M0l4NVltbnJCdllHbXVSdVE5TG56VGltYkw2?=
 =?utf-8?B?K1FTZ2xlLzViRS9PdDlhYnQvbms0dWFFZGZaK2p1SjNzSjR6dVhISHEzMGJI?=
 =?utf-8?B?b2FFZnZ0OElsMWJ5T3pWa215bG8rYzZvSFNRWEdtQlljdnQzTWN6aWFrSUQv?=
 =?utf-8?B?OVByUC8xK09SRTFpWGtab0NYcFNSNmZtQ2J4cCtLYkl2S3hnSGZoTGFYYnBM?=
 =?utf-8?B?dHhhRUlGUG9BL3J2RmtVYVhMQnlhVlJUU29peGVPQTJHOW9QUnZrdGNrc1lI?=
 =?utf-8?B?WXlUZ2xtRW02ejZmS1pmLys4OWs2UHFhRmlvakhvYmE2d1ZJVW8vaU5NRWJ6?=
 =?utf-8?B?eXRnZ0pzZmdqV2IvNmhIZnkvQUZlUGtzMEhTRXplZXltWjlRVWxuUmZtZWRI?=
 =?utf-8?B?RUJpUVJkTWcyd200SFZRS1Y2OU9XNFoxZjBGNkVhS2xhOE5uRDlFRDdXandu?=
 =?utf-8?B?M05WS2Jjd3hKMXNzWm5NMUY3WDBidEdYQ2tMMXNxZ2g3eU82MTEyYkY1WnBw?=
 =?utf-8?B?YzhPTFQ2Y25qaG1ReWZBQnh1bS9xd3B6Sm9LeDVyZklCY2hVb2FZL1o5bXJI?=
 =?utf-8?B?UFpkTG8wU08vcTU3WFpmbGVCZnZuL2Q2Y1ZjTDlBM21jcmY4cHlOMW01WUND?=
 =?utf-8?B?aWozL1BNYWhmNlZqYk45YjlsTVFubDRyaFd6ZDgxRmxyYzJlOUVaQ3prNm5V?=
 =?utf-8?B?SFhSRGJ6akZMQmhpcytkdDltUkh6M01VTlZLTHNhLzZqUUpkTlo3Nk5jejZM?=
 =?utf-8?B?UW42bjAxNHU3bTJNWVpOcVhhSE1BR1pXeXYrRFFublIzaFBvQnVXOU1qOFcw?=
 =?utf-8?B?US9CYjlvY2g5NTBXWGUwWWZIdVduK2pxR3ROQTJ1eGFBUzJ0UGJFbWVjcXdP?=
 =?utf-8?B?WURIV0gyN05HYXBqODgrNGlJSVVTL1FLMHA3ZVgyQVJObURqM2VSeVdkQjVr?=
 =?utf-8?Q?yKTJKkFpl0HQj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW5tc3J4V2kvRVR4cmppRXo0Sm1GcDJuY0xrN0J6RGJDU0ZOZlNKR2tIOXdo?=
 =?utf-8?B?cFN1YjBxdVBvUUVkZlcxdmI2WWNMc09oVjdYcXllVjkzamFRZVBpZU5RTUVz?=
 =?utf-8?B?eUE5anhlNDN6a2J6YjNLL0tsNjN1ZVB4TlYzajRLUmRIRDVXK3NMaHRPUlFp?=
 =?utf-8?B?MVhBMDFlV0hvT1ladEcyYmlHT1dwN3pjVzZ0Y2RtQVo5RFVBUTl4M1lkNDNL?=
 =?utf-8?B?R3NXc3F3aTNNTFdaMVQzNUVXVzJvdENSUkZpSnBKZDh2T1JaQkNDTEZxQVc2?=
 =?utf-8?B?eTBrejFoUERhUWY3N1dTalBaMVZ1Rzg5OHVkVFNYY0xqVWdkZkpqc2FoVWJo?=
 =?utf-8?B?WXNWUGJCZ2F2UkllMDNjcm5XSWZyRWQrSS91M1gxODExQU41QkdrSWxsdFJF?=
 =?utf-8?B?TG9obGJPRU1wNkZQcFVYUStrK09uREVCendnU3U4Qm1lelNEb1MwRmdtNTU1?=
 =?utf-8?B?K3BFejNtOVJkckpGTThmZzVJeVVtOVJKRlEwK1VCTW1NOGg0R0k1YTU5YjFp?=
 =?utf-8?B?ZzZQRDhLOUtMNFdTZFZWaUVFQVlwNjZVTEkyWU4welBjanpveEwyZWJHWTJM?=
 =?utf-8?B?Q2hXdGFoL3BkemEyL3E0WkZTUVhrM1MxeFF3bElEQ2Z2WHE5TDdEb0o2YWRo?=
 =?utf-8?B?aHhYbWZGSi9lRGpDYWZ3SGU0SXhwZWF5WThTcmhrQTlBVUVPT0UvalhKVmVz?=
 =?utf-8?B?M2VTWU9WVmcrcmZmTjRvckxuT3Jacks2MUV3Y3Fpb1M0OFhYTFJtZ29Sd0pB?=
 =?utf-8?B?OVVGdWt6WDdxYTJ0RFlWUE9ERGt2cDRJTkttakMxUU96dlNONFJsSVBtdXNF?=
 =?utf-8?B?dHovckp1UlA0Q2JmbFhoS2RvZjRpVHRmS1VqL1BuT1hsei90YzVGOWNSajZ1?=
 =?utf-8?B?bzFUNzVlK1YvYlNUUjQ2NnRrL1RRSDlUcnZlSXBSSFpiNTBZMzFKSlViZkxa?=
 =?utf-8?B?cGZ4Ym1LbUNGQTU1c05LOHZxRzI4T2xEa2hrUmVIWXJnUFMxWmNXSG1wcm1M?=
 =?utf-8?B?bGdxN2tRUnpLcW1GRUhDSnR5K0p1akY2cGhDQlhQNml1b0hUQ0tweGxXbDZH?=
 =?utf-8?B?eS9CK1dvbEhEaGNmWGtqdXVtaHhrWkh1WThhM0t1MTdFSWpWY2Fqczd1bG9y?=
 =?utf-8?B?K0VlOFY0dlpTeTVCZGZrcFRKMGxoUnlCcFdvVXlVWGpVZ3lsSGtVTjl4cHVC?=
 =?utf-8?B?NXFFczFFNDZ2SWhIckM1TGFqbiszcDc4bXI5RlliZE0xNkRCOEoranZTN3cv?=
 =?utf-8?B?MUxsRk9sMFB2eWprQ1REVmNqSk5aVUlGSXhKanUxakM3SVFjSzlvWXdEWDlN?=
 =?utf-8?B?eEhXV3h4RXYrM0JNWVR4eWdoRmxxNHFSTkRhbXF3SXY3eFMvM0d2dldmQzJZ?=
 =?utf-8?B?NDJyeE5MK1JiajZhcWlySXUvOTdOL3Bld3cwS3N6eHRHMkpEdDlQQWhhZzQ1?=
 =?utf-8?B?K0ZEcHFzR0R6K1RYNVRIb0YyUnlrUFpIS0VzTTAvUzBlUHZxVmtUK0NxK2tH?=
 =?utf-8?B?N2VxOFhSMWM4UEt2NUdtMmp6NHFIVGNlWitUNGd5dnpKWFA3eWdaN2lYSVBp?=
 =?utf-8?B?d2szZzlHOUZTVXFzWHl3SFJQS3JFbWpRWTBJOU9UandCNWlLcVF3eVVmeEg5?=
 =?utf-8?B?OG1XTU83SEZ1UU83bHh6bDhYWFM2Wi9XNks4N0FPOGgzVllLQ3NTaG55bWxO?=
 =?utf-8?B?SUxNR09GQnJTYnNMNXdZWkE2cndNWlEzNTNsTDNvdXpjOXpybHNmSEs4eVhL?=
 =?utf-8?B?NjdXdFpZTE5tZG82MHYrR0JBQ1YxbVZHQU9pa0swTFYwK0NTd2t4MkJQV1Fi?=
 =?utf-8?B?MmMweExFNE1Gc20yY2o4SUJlaHNCMGZFd2p6SHRMSGdCS3JvOHdmTXRCRzVl?=
 =?utf-8?B?d1N1N1BpdllUSEF0S0JRM3plRHNsQy8xR0dnc2ZPcEo5M3ZVckRIL2lwSHYx?=
 =?utf-8?B?YVFNVjloSFNKVGRuUkU5dGNqYXQwdUJVckhOOXBUaXBOVVRJWXdqbGROTFlt?=
 =?utf-8?B?OW1pd1BCZWtrV1FkaE1OZFIzc1hRSHZUQzZjRTdlTXRJcnVlTDlDRjQ5SkJt?=
 =?utf-8?B?UElUQlVGNDY5TVdBREVTUmEzYWZIOEhDUHlvZUZranNKZEpKR3NyclM0eUhV?=
 =?utf-8?B?eEN2cjQweGxnbEo5SDR2ZDltd294UzNnbkVtY1JiYmhhRFlXTFhjVTRYcVFv?=
 =?utf-8?Q?87mNDAIjQKQMV3y8Ofg6ru8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f118f-aa63-4c2b-35f8-08dd736cf3d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 11:36:34.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0GY62cuDJ6kCZ/srNLJG+4QPiD+3Sq1CHxTWZ5PfNBJ6xGlUOvOCSXrTSYU3uR819Z8cPE3ExI76u74rR0NGJvgzq1pSDkaYb5IvwXi+20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_043644_299550_77068FDE 
X-CRM114-Status: GOOD (  14.59  )
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

On 4/4/2025 11:53 AM, Alexandre Belloni wrote:
> On 04/04/2025 10:19:56+0300, Ciprian Marian Costea wrote:
>> On 4/4/2025 10:15 AM, Krzysztof Kozlowski wrote:
>>> On 04/04/2025 08:24, Ciprian Marian Costea wrote:
>>>> On 4/4/2025 9:17 AM, Krzysztof Kozlowski wrote:
>>>>> On 03/04/2025 12:33, Ciprian Costea wrote:
>>>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>>>
>>>>>> The RTC hardware module present on S32G based SoCs tracks clock time
>>>>>> during system suspend and it is used as a wakeup source on S32G2/S32G3
>>>>>> architecture.
>>>>> Which boards are using it? I don't see any DTS (nowhere), so I do not
>>>>> see single reason for this patch.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> The RTC module is used by all the currently supported S32G2/S32G3
>>>> boards, so currently they are: S32G274A-EVB, S32G274A-RDB2, S32G399A-RDB3.
>>>
>>> I don't think so. I looked at these DTS and there is no RTC.
>>>
>>>> I do see your point in the fact that this driver should be enabled as
>>>> module only after platforms are actually using it.
>>>
>>> No, post the user. I don't see the point of sending defconfig patch with
>>> RTC patchset anyway. That's different subsystem.
>>>
>>>>
>>>> So, would it be better for me to send a V10 in this series with the DTS
>>>> patch added ?
>>>
>>> No, separate patchsets.
>>
>> Ok. I will send out a V10 in which I will drop this current patch from the
>> patchset. Also, I will send the DTS patch which adds S32G274A-EVB,
>> S32G274-RDB2 and S32G399A-RDB3 usage of the RTC after this patchset gets
>> accepted.
>>
> 
> I don't need V10, I can apply V9 without 3/4 and 4/4
> 

Ok. Thanks for letting me know.

Ciprian

>> Best Regards,
>> Ciprian
>>
>>>
>>> Best regards,
>>> Krzysztof
>>
> 


