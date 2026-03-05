Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96407F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w0uwgwyvVeEBrDQTFgtyDrgRwvUTIpGgoZ2JptuPNE=; b=y3jWd0dWQzLRsS1zo9ftq5/lVA
	Ttkvo4Ck0Yqp0bCczTru+L1R5h6R8vStQHqM/JdahGDh2MsKZYNJ5kw3fKXafa+NQ9HDbXasNulaK
	U8G7qByl0g5l+PDYgVKhQ+6rN4ecUhcrYZvp7m//Ee+Aj3dkvsODTr2waY39YUa1TCOOYyalqONLR
	qHJkM8IQuTjtryY+39lrBJrpPUyf4kwu5/MCh7BwMfZV/Sqbh+aRJHcvGEcQg/cjNqcn35uaL0KGd
	zKVUc2Eym/1yjS0wvfLvuBJbAmVy8c68czEIVSujiD49buY9oLx2+AlSx3IyUNg7PDU97hCJ/mdqV
	u8NQLqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7VN-00000001jTC-43XO;
	Thu, 05 Mar 2026 12:08:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7VM-00000001jSq-0ohG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk+h/r3nXmnI6QMWVrGPFHP+GgFYMdZVTcr3tU5o6l+lfnaLWRVwi3H32Ws5BxdhB+GJwvpJnUGDuSGVL7iRsRFETJ0XOVD4xE9vtgnqIzrTFrLzLo5XseKN4qNz/4n2obJIbLdZr4vqfAzB0t6WNRkSneI0OB+pfns3T9Js8ntBPoMP6NUWaDlEaITLARzv9cPvJgOFHVy7ww8ON7YbIFh9Dlis/ZfzRXTAbSEA56B2QQrDilDLwdrHWg3jM+UJbRXVp3168WVxS+axP4iJm/v10xGikjQgKVYCzjlq0DtxkRruyYfec6Uw0Nr3mg9C2RuILx7ytkUGDDhqc72/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w0uwgwyvVeEBrDQTFgtyDrgRwvUTIpGgoZ2JptuPNE=;
 b=dUY54wrXR4ruQgVsp0Mvb1So5D76gUYcJZKEpNiZRTdvkjT4oszYYfUN0uRshxjK6xKtseLDs5TT1XxcdY/aOEEtGrBuLH8g6Zdm0bxHSeR3NpLtkbZ3ztwDW+4l1LCopn8Qmxqz01Fhgxgy0ngsGAWBAbqToM5ZCqtwzMfBq1EV/gDYSltVWTOQ51SIMzsMTjw8vegjPzVY82VbxChOQ0UgohBePNLMe+Z+Dl0DTf9GtI4DaXNUh/TfCuIyO8eGvPC4mE8zwAEjQ0VvvNkctEP85Qe5vmIXRihHjqTJcZ+wnBw96WNXRXrnaPYuTuzbQTK39tMGZj0KTGRb6TFPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w0uwgwyvVeEBrDQTFgtyDrgRwvUTIpGgoZ2JptuPNE=;
 b=qtyfuAwHr+gTE6/CJIBs3PlMEDf0QrCYXAhAeaKVS7x4wrAa4R1kgpX6X3OJhHccQ3wzIH2pnHmMyXO5mNqxr/NLILgXDHP3BcFphNJRFx6XS/SswanLZs8qf7ES6f9JlCZuV6sd2KRk2BVGVOuyMWOEQjtTl1VElwrcQ+iw9N368GWouj/HLwA+2X0hdC7hx7Gx53iE+rTJeRjoDJsiHK0gZyuOwqQb2x9u2D8/tXYJ67AgL9xC0ZGh9ZvT5OQwIGhPIXLeUmBGmXx5VTVUj9brlUqa6q5BlCM2IPGB3r4ChicDA/8t2vdeJ0BZhdpm7t+fjxhnhJiYBVaXXsT4zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 12:08:30 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 12:08:30 +0000
Message-ID: <0bee9aba-7e3f-4434-81d0-70d6bfe2bb0a@oss.nxp.com>
Date: Thu, 5 Mar 2026 14:08:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB
 board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, s32@nxp.com,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-4-ciprianmarian.costea@oss.nxp.com>
 <20260226-sly-fuzzy-parakeet-ea9fb2@quoll>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260226-sly-fuzzy-parakeet-ea9fb2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: c319193c-108a-4306-a200-08de7aafea39
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: +N7RZDKIiln0c6kQVEukArsk8vd3Y5tXxQFveM4ypHnSimawqGIO3DTsiW5QGcFPcpGo5jsKEQxwJYEgLclKHHCpsuCJE4GlJOg+kHx31VAQ8IUvH8soqG8Hlgx9LP492z0u//8hKGeg9RBx91OGiy8qW8GsJ6me0B/kjxHo2RvuqBDTRH32Tkot9TSHEknXG81x0ShAl8/yIKcEFPcEoW9t6zG5bfwVdv/Vuzsj3nWfprgeSEZ8yeIVB80XU54wXvG+nNMjNV1q7fcPSPiaP1FD1ulkgQDcY8jRQoRkrJGdPB2qf0mVUKSl9Y/8hEhBRks3nVXi3eieA+H8Y3yyKuR6o05BAmtoSQDXQbjytiRmoCSWXy0GcyVuh0gkGOqA81UEscvkqaTUTj6U+Wyfgre+msQEHox6eJe/byk9tBd0BWzxsOrtO7Yodqx4zQnMAk2DnaP2//fol5hycdiXZuPeoAG4cYPfb4TV7e8pZMRHSlubAMBO8yPwMvqf4A9UAiFSxIWgxsxCNUUpPozk5IhPRvomjS3vsKxTrn9zW+SbZU/GfbK9JeNgbZQGUGcSvhoazD94fjNyQych8woK03f5TQZxxuQxuHn3PXG+mtFIwX+YYiuDBZ444kUQXlMHGOpcw6ggbGJQCG3Z8JsGPpGPt5hIgZoCohx7D/h47bGQUEzuqYeSekEzg78fpyTqzX5td7l6WDCpTGO27IWUS4gWImp3e3pq6UTb+yLN/tU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVQ1cXRDQ0FiYzVHUFU1THVUL2xaMHRpbXM1R3hRdnJQd1JvOXk3c2tHTUx1?=
 =?utf-8?B?Z3RxaEFJSExrbEZySCtVZVpGNExrYXF3bVNvUWhVTWtvdXNOeDdKNVdWbU9V?=
 =?utf-8?B?dngvRStwRmdmcGNnWS9OUEtDWXZ0dzVBYjRpYUJYd2V4NG1sZU51dWtyVnZx?=
 =?utf-8?B?bFRhK013ZGJ6QW5zZ3J3TUs1Qmt3Q1l5STJWNlBRTVZ3UHJON2p0clZMTTBy?=
 =?utf-8?B?dGV0REJObkVHSEZBMkZtbkh1ZUUyL3dCOXdPL1ZBc0dRVElubElYbFFjOTZW?=
 =?utf-8?B?Qzh6MkRqV0VjTHdpQmo1TmJZckNEWVVqOVhVMnhLOGR4djl2dXJwRnZ5bDEr?=
 =?utf-8?B?QnFJd21QOS94dEVBSzlEV3h0M0dOYzY1c3JOTTlrakpFUkUzV0xQclVORmR1?=
 =?utf-8?B?N1BUZFpobjR5WE1JdXNTNGdVajBaOE0vNUhZSW0wdmhmRzREWktoNTRobnd0?=
 =?utf-8?B?V3FxNzBubUxIYVA1QVV0TUg0VHJkN2tBUFJ6MUV4MHhKVW15Tzd6QllOYzV5?=
 =?utf-8?B?QjZUc01FTXptMFlRMGNhS1VUWmRPMnhxazZSakNiS3A5NlhXQ3VvSmxFbHc4?=
 =?utf-8?B?K1oyWXNWa2RWNVV1SlVKRElNWEZhc09TQjg3VjNIUG5IOHFlbXJTVGNRdmtQ?=
 =?utf-8?B?aFB4K3ErNXFJaVBHWmE5K24xUHR1Y2NPb0xBeVNRNGpCcnRvalpzMW1mNTZO?=
 =?utf-8?B?YmtyenB1YlZHTzBtZnVCV3A1SGxrWU9qNDJoRDdwc3EwSHEwTXYvMlExaDdo?=
 =?utf-8?B?aXBUdHBMVHlHZUQycDNOM2NLdVdjMUVFd1dDSFcrb3lBd01uL2EvMUQ3NlpU?=
 =?utf-8?B?RTVTbHlaUHFDMGxJdEF6c1FER005RisyMTY0Q21HYmZmK0ZTNWdCOWk5RWxT?=
 =?utf-8?B?cXJqRXVLWlFrakJSUUZmdTlCTjBBc2h3QlVtT3djMTQ3VittbEJjK1FlZnhu?=
 =?utf-8?B?YzFmd28rVFlMZWZxQ1U5R2NmN0kxTytSdURhb2t5TFJXd3pnTythZG9OZlN1?=
 =?utf-8?B?Slkxc1hTTjZRVWtyNUt5MkZROEVmaTNadHhDWVlSV0l2bFlQRjNPd0VaSXVv?=
 =?utf-8?B?bjFvc3o4SnRhUVVwWjdydU9zVGFHWHlVM1hsNWJaa0IwTmc0NXhYUkgvUHNy?=
 =?utf-8?B?S2VJL0pvRTVYUmtLdHFlcnN1dXFyOVY3M1ByLzlEWlFaQWgyYU5QWDV6MXNm?=
 =?utf-8?B?MzgvUHVYM21tMkFZU3ZhamhGU2ZBQ1VYZWJBU0hZOHkxK1pkZmlIQkNabURo?=
 =?utf-8?B?bjVzSE5PcnlEQkJJSmVuZnJXYlNacGFEOTU5VmhLT1cvNVJoRmgwUk1DWUl0?=
 =?utf-8?B?QXh0TlBoWVlRT0Jod281NGVrek9QelM3bVJxM0RPQjMvWm5aZTg2VDBjaERE?=
 =?utf-8?B?ejI1L2lJUDVjejk3ZWJWQk9pNHdqNHBaSFlvNnlWR2hpbFl1aWFKamdQNGtp?=
 =?utf-8?B?KzdvNlF2b1hXUkF6UzJGV29hYmRpM016RDZnUmJPMm5SeGQ0aTNnamVFTmRU?=
 =?utf-8?B?UVZXSURRRlFDeThtYmR4eWkxTXVzVndTN3NZNnl4NTRJUFlZUk1TWXBrOVQz?=
 =?utf-8?B?V0ZtemdKM0FuRTFjR3R1b1N4Q3BrQlEvVGR0UGdESjVhbllseWFXeWFRTWU2?=
 =?utf-8?B?ZXN0cWZOK3VVaElJL0VOVXgxM2M4WG9yZC9xeTRVa21udEJDZ1JhM3J2cmhp?=
 =?utf-8?B?VXFCbjJwV3g2cmdmZjIxRlRvMnN1M1g2S2lzZXlZNjRFK3R2NHZYalZjSXU3?=
 =?utf-8?B?c3RsMnlVT09uQWZjdUtKR2p4Z0srZzZGOTBqa3BJdEFaV0Rjd056elVHYkZC?=
 =?utf-8?B?NEMzdnU0S3FKbE5wMjRiRGRnVEhkcm9CcXJEUlJjdEZncHY5elJqcGw5VTZx?=
 =?utf-8?B?RVJEMmM2SitVdEcyT1p3ZFVlcERxMTErbVo2ckVvbW5PcGdvVmtOdm9WMDBo?=
 =?utf-8?B?WE5yalNYM2RCOC9WU0prN0F6T09UYnZQQnlaU1lOUTRKbmJyb2ZzY2ZmWVV5?=
 =?utf-8?B?YVEvK2NFeHp0aEo3Z1Z6WDk5aVR0SHNJanQ4M05TOG8zL2VlVUxjZnk4VVE0?=
 =?utf-8?B?aG1OVE83aVE2b2RRc01HV0FLblBVVFVNbTJVS1ZFMEY0ZzY1TXNTMFVGOGE5?=
 =?utf-8?B?bi93THdQQUV5anl6eDlZQWErb291R3pIV05CNG5QZGFycUdpWWFsRmhJSGFx?=
 =?utf-8?B?L3NVSjNjNzJKdkIvbTNSdWVYdGJTbnM1OGZtK1g4cCs4THBYMkxhL3dPUUlL?=
 =?utf-8?B?bm5mc01GWFZkSXplVU9mQlBsUVpSRFZGNEZ1ZDBNSDB0OTNqM2VndkxxTVkv?=
 =?utf-8?B?L0dBTVZZUUlKZmFvd3U0UXZZZnJlbkRLZHArbzdRbXpZYTV4OFN2V2NJcXZJ?=
 =?utf-8?Q?1PxMc1HFyNaiUKO8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c319193c-108a-4306-a200-08de7aafea39
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:08:30.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3o/tZDE0Pi31JwS2ARceNew7A6ztxzOhBEdtHmk7G+sCmIosBUaceZvfI57EuRWrmQv4xxlz28xFZAbIlIso8zIg/Wdn3mltF58GSJq3xlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_040836_240336_6B4089DC 
X-CRM114-Status: GOOD (  13.70  )
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

On 2/26/2026 9:32 AM, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 02:38:54PM +0100, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add device tree binding documentation for the NXP S32N79 automotive SoC
>> and the S32N79 Reference Design Board (S32N79-RDB).
>>
>> The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
>> cores organized for high-performance networking and gateway applications
>> in vehicles.
>>
>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 5716d701292c..415081423a30 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -1827,6 +1827,12 @@ properties:
>>                 - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
>>             - const: fsl,s32v234
>>   
>> +      - description: S32N79 based Boards
>> +        items:
>> +          - enum:
>> +              - nxp,s32n79-rdb
>> +          - const: nxp,s32n79
> 
> I believe these are ordered by fallback, so s32v > s32n.

Makes sense. I will move S32N79 entry before S32V234 in V3 patchset.

Best regards,
Ciprian

> 
>> +
>>         - description: Traverse LS1088A based Boards
>>           items:
>>             - enum:
>> -- 
>> 2.43.0
>>


