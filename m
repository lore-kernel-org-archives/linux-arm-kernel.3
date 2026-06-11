Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E61CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN8FoiLXBrUDEa6chVjhg7WM3Jrz9nCWdWW432XYCJA=; b=u0b5zQJ/8OjnfeCTBxa8ll1gw7
	I5j99nNqKiW7XFEIMDFxYSyc22t37u8CBvEc/3IUJwmcM6FKdi22aP6CiBXrG/7fZ8K7y1xZHBSwP
	W4Fgv5TF9UYgpwfJh0qwepYy6yC2eCKO14rkdcI7C6c7m5TCIfs3KUINZPFBUY+qw9sq07rvkYOqO
	ScFoB1gd+CN2TCM5bpXRdFsI5JsqjFxiUfew9wUTGdXODTPyrscxyrXJzrt9bZ493ARd/gjB9Q+Ba
	nyVAHqo+N8xzDB3Gnr2VaGnNXn2p5dMVWTmJVBVpCYKrUQT9hRF5+zK+qz/QVRtiVildag7/yLhM0
	L2oTohGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe2d-00000009LoE-20db;
	Thu, 11 Jun 2026 11:57:47 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe2Y-00000009Lki-0g0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUT7UsUCVWq02jc1wJO+JGyXQVH67uxQED45ZVa9w1c/AWYjxUPsf7oseh0WtEDPHvw93DFohYCu712IREJMwn4r2iM4zoNrCB7imO5VCplBkFIXNZZjpaQWXFXZIZh3Nvs06XwwWeSLT67AXX/ulreJk9EXSdLR0l73BQ75NigcB7S0teQc7+mNwJGN7i4gk3ItY5i2yhItG6LuPLWT1SNQVs+7FwiDw0NbnZvYnv7YlozzCnve51dJxf9MQqEZZ0PuqHt4qwlWZW8Q3Jq3/cZdupol8oLgFxBMojn5m3h9Hddyu3san3Bw2Od3NWCsBMdSmGbWGabQck80yvJAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN8FoiLXBrUDEa6chVjhg7WM3Jrz9nCWdWW432XYCJA=;
 b=usNwEAmsvAv/qda5XO/uN6sCD21gLODSYWxtO2I/7PnEf+6jPVxIz5rP1roLB0FiTxlAAIHs3oydyf8SoGDprPsW3ZDiIbb33IwZW907Dy1iBtes3OtjNL25AaL5BM3/T1di0oV0EHMkHgCDWCS7jYpPeN9r5dwqta3I/ruLgSH3AKZ8TcC1YWGM8i4cuVLb70pVisw8UVEuQPm0elXCUb5HO1wleUrlU+togR1y1Cd852wUhWiL+Lj4QPh8yJB5wnu/ods3/zxveHIVD6bjwTTm/ixzaDsUhF6he4zSNdDwK3+CvGVJJycvqozwIq/kTl+sp/BoYxs+qvjbfYdzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN8FoiLXBrUDEa6chVjhg7WM3Jrz9nCWdWW432XYCJA=;
 b=dI8sBQUenJFGuEp8ZxgGd7CmlFPmoCpG8D23vMBunSoVu7Sc1hDgjSrN/E2Y40L07YRbEX8RVVruf1GfTEAFAMWKvAA+5Hu/FQS87DOlrJzkJOl6ZsnpGXpWmt7PQiK/zjIrw6wLYB3+xEwCMuD2EdOZijA1SfFNfeOn0fLE+t2MgZ71YnvaBAj5zWf6715at4oMqBarsZFutoIRHLRvXAcelsDYHu81JZNNbT+o4EMP8vWn7V75XWOFLMi1Bo31hz0XnKlp6ZgLKx6mWX7qh7cGJxlbYENkqTpCK/oayqXdXVrxhFHxiZpp4MRlmb22rgmDcnkhQtZ/bd/+IAqzXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 11:57:33 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 11:57:33 +0000
Message-ID: <f3db6b3d-88ab-46b6-8c33-8cacbcbe0d46@oss.nxp.com>
Date: Thu, 11 Jun 2026 14:57:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Andra-Teodora Ilie
 <andra.ilie@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>, Haibo Chen <haibo.chen@nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
 <20260609142954.1807421-5-ciprianmarian.costea@oss.nxp.com>
 <20260610-crouching-wild-mushroom-c8bf6a@quoll>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260610-crouching-wild-mushroom-c8bf6a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 752cc8dc-79b8-4f4b-9146-08dec7b09f41
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LBlVs6NlbNnSbGIlesK8Z1Ld42sWuL5bX7O8UHM3RfU7lNoUygyYY69DercUD7e0Z/985Tpu/LRcn+XE7VSLHOmR/CTka4ecMmoyCziw3DdZM77WbxSRXAriJu1JyJtwGazmBQnTxZyCRIEFdSaK20w/jruqxPKtR+Tb7lmtBoTn6QYR/4TUGRQ5zSY5o2m1goCmU6qHPylmLfi3KoVdlxINuP8edref3mxDktZ6SrpRpslHJZlke+NUvN8s4wsurRcw4WeiadEEktiNGw2xuFUx0cOVSnoWx5YC7Lv3PgAIA3KLnuO/1QkeGdgEqMzUmhPqjZH1wyZNf9cFi83Sst7LwJZWdQeQhQUL4tjIQ4m+Y2il4jC/a8tmUU3vjc+DrYrREUjYbjCkI5JDYR902S9X4Z9mBGyW4r+zjfzHENldj/dCgbpW2z5pBggOZ7KZZwEM2GQ2hwBlg+zfbTALkvaglemWovm+YlkpOqmle1sU0RYHB1tDXbiXnUV+yC6M6++Ibhao9+zq9SPfPgMsfKBcZkGAk3SX+yHID6S/ik0xmuJZ+D9qoKWNkAvDAlxF26eTU0HVBQM8HmzLdMCj0b7lIVTCLGm0PzV4waeVl2nQWTJBV6SkaH1WObLERxrIfV3mbBApOwE5cQFtNIaKE3IAAguiyWDKD1HP0Xycev3FYWF4OIVPUANuqAXm1x9x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0FnUDN2NDNXZ3BkRmhNWklHSTI2RVRzRTdqZkwwR2RETzRqMUxSS1plQ3ds?=
 =?utf-8?B?OFJRZERka0NYbnpZQ0VBMlR0ODJwdmdGbTJOUGRtWTQ1cEY4SkVPcURwdFdU?=
 =?utf-8?B?STRucnhaaS96TFFoOERON0k5bFA5cHJYSG1CN2FuT3d0S0V0QkNod1RLOVBV?=
 =?utf-8?B?UDN3aS9ZVUp2UmVqa2tFUzV5cVYxbkNxaG8xMkNJYmZXcC9XbDRFcitCRFZH?=
 =?utf-8?B?S0pvL2lDWVFtYk94V1VPVUJXNUJSTGgvZXRSRmIwZFdSaE1YRlU2UXZhSW9J?=
 =?utf-8?B?Zi9FS3ZJUUh1WThxTXg1bUgwVlhqR2t3UWNjWG80dXN0MlFjSEl5VzhlUDdK?=
 =?utf-8?B?UkZ0MmxTNFY3Z2FHeS96SHNBMDVGYzFkMUNCaklaTWZLV3F0c21yRkRtRVZw?=
 =?utf-8?B?aVVRZUg0ZVovenpNZ04vU1ZGd0dvY2xjYkM1SzlOL3gvcWc5ZXlDMGloZ0VH?=
 =?utf-8?B?WHc1UEtBd05USlpxaGNrbHRFNElrMmQ0Z0tucDBER1ZzT3R5QWZmNGV2ZVVx?=
 =?utf-8?B?ZlNxdHNISkw1RithZkRrUDg2OXB1WWxLWnE1REg3TWIrSGRpcmI1cTk1Ris0?=
 =?utf-8?B?R2Y1SjBjS1RCZVR3aFpmdHRZczRjTXBOR1luWkRiS0dWT0hkZEE5ZXhYUDlI?=
 =?utf-8?B?dGNwRzNZNGtLc1o1TnRpZHpMOXhnSEtOZUQ4SFFscEs4YWJLRGhJNmxEUy85?=
 =?utf-8?B?bHpTcmVLYUVBN2lsSW5zaVUxd0xTQ3FrdGp0TWJkaUt4NmpqcmtZM3F5a0dB?=
 =?utf-8?B?aXVrWWtxVkNBREx5Wmh2UkJkSkhHdmVIZVRidzM4Y3ErQTRWQXhEWG5HWmZi?=
 =?utf-8?B?bStSSzlqTHRTdkoxNGR4cmhSSE4zdU9KNkxpUHVnVVMvZ3liSzZhZzJnSkxV?=
 =?utf-8?B?YjJvWG1TTWNSZFo1WUliZC9zOXJweDhhQkZ2STY2SlZKdDdMa3hJeTlSTjVW?=
 =?utf-8?B?SVFaMjNZL2xXcGdtYTNGeFFkYzUvTUloRFMzcTJMN1JlV3lhVitVRzRLaU9Y?=
 =?utf-8?B?WmVWR3FaSEZETVV4dVFpNlo0OXp0RmpWaUVJNXlGSkIxdnM4OFpQcWVxbHlO?=
 =?utf-8?B?S2hCMUFLWDA0bjV6d24rMHdhVm43RjltYjBqMGZIeGlDK1BDNmRxangzNmZw?=
 =?utf-8?B?NEdtRGR4M3NGQ0dXcGxBcVZBRHR2R2ZaNkZzcFdDSUdRRnJoRjl5b0wzWlZi?=
 =?utf-8?B?c2JwR2ZvVHVsM2NOUWJWMUFSNjM0ZFJuRTdVNGdIWFBkL2VwVHFXQm1HdWNJ?=
 =?utf-8?B?Q0FSbzlLVWR3RHRISzB1YWN2ZzV4SUlHSmxFYjNFZTR6MUlid1g0NTRGRzZB?=
 =?utf-8?B?RlI4eThhMnpOOFFPaGhXRWRoai9TaTZ0MkNYSVA0WnZ3VjBiWVFCOGhzQW9N?=
 =?utf-8?B?OG9xRGNrRWQyQkhrcWxSblNqeDBXSGVtcmkvbG4wblVkcGkvKzlubUF0SHRu?=
 =?utf-8?B?OWkyc3h3Q3B1K0JrMlB0VzNpamNqWnVBTjN4T2tvQ3FXVXdGc1pNM1owM3hE?=
 =?utf-8?B?SE5SVjFnalpKR1B3bWh2STlWNG90RlByVHJZZTdaVzdkZk1hVm1EdUtEY0tX?=
 =?utf-8?B?bFRqZzB4YUN2UkwrS2lISkxhS3V5SmpGTFM0TEUvNWlFK1QxbGdidkJmbFM5?=
 =?utf-8?B?QURSUTJVeGtTMHVOUnJUSnRMTjlpdVJEcWsyNWQrNUttaUhkVnR4S3NNWE90?=
 =?utf-8?B?SFN0M1AxOTZUdm1PWE1WR3dJcFBYZUFuU09hclJPckhVQ1hWb0x1UHJhaC9T?=
 =?utf-8?B?N29BNkw0MkIrbngzbnROQXNhWUlxVUJBcExlT293L05YQVdMekNiSUJCNzJm?=
 =?utf-8?B?VXR6YjVaZUNjWnNDRHk3RlFjUkRFNDFoRWVCN3FXNmRmRzFuaS9WUkdoVmJZ?=
 =?utf-8?B?OXZHRXp1K2phQmRWODdNU2g4NXZIZnBQU1N4UlRRQ3ZkZFZLeHNPQS9xK3Vi?=
 =?utf-8?B?TFBYYXhBb2lDam1SNXN2N2pmNDhqNTJseWUxTzNTY2dUVHk0aGw2NWJ4VC9R?=
 =?utf-8?B?d2k5V3g4SDhwTnhuVmpvV2RoUUJlbkNGZEZUYjNnK24rZ2RpVlQ0ZlpRTVVs?=
 =?utf-8?B?VitXckVjeWJNNnZPRjl3eFhDWnBXelR6RnZ4aUVaUW5VcHM2b1hNU0svNThI?=
 =?utf-8?B?OGczUnhESE5oLytUbUhOVSt3WXVMK3BtVmhxTTdQYVIwRHJQVmVUdVBaY2VH?=
 =?utf-8?B?aFpoSXFRNGN2NlNhMllWWFJpQTdaanNBQnZ6bzZlZDJkUDZMV00vK2xRMlhJ?=
 =?utf-8?B?L3BET2hQd3U1M0F6bzFoN1BVY3dNWjBSZ3BiS2RHN2R6SFNES2dGeGxGam1D?=
 =?utf-8?B?bEtFYXdJZTUvcXNwREErQ2JHa09MR1VibC9OQm1ZL0YyUDJFY0QyR3J4dGow?=
 =?utf-8?Q?8LFNEZoEXaKA65lM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752cc8dc-79b8-4f4b-9146-08dec7b09f41
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:57:33.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D+v3ERSP29IL8raxw4wh5CefGHefyg69lY0LSZHKAiZ+sUyz5qWKfeAFk02RO2eyKKcXXNRrT50mgjGhbdlenwIPX5Q19r84GcPP7SbziQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_045742_215041_26283AB4 
X-CRM114-Status: GOOD (  11.57  )
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

On 6/10/2026 9:37 AM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 04:29:50PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add NXP S32N79 SoC compatible string and interrupt properties.
>>
>> On S32N79, FlexCAN IP is integrated with two interrupt lines:
>> one for the mailbox interrupts (0-127) and one for signaling
>> bus errors and device state changes.
>>
>> Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
>> Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
>> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
> 
> You cannot test a binding (in a meaning what "testing" means). Building
> code is not testing.
> 
>> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> 
> Not possible.
> 
> Best regards,
> Krzysztof
> 

Hello Krzysztof,

Yes, my bad. It makes total sense.

I presume I shouldn't send a new version just for this 'Tested-by' 
removal - right ?

Best Regards,
Ciprian

