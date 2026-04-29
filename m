Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D66AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPn86cWJgGMjABRzmP6nq7mk34Ihxlh5fnfcuB93LRU=; b=T/nZi6N3wRFziAZZl3HozGeo2T
	YREsMBPfWaVfk5NrH8iqn3Bf74gkGwSLQlvoKgqj2jtNXzRw7nU7gMmxfPIVt6kGz3lXxTqaLabY1
	9MPkYbQGHqvsXrpCEimbBgEO9R8/n2MRq/Cf8w+tcOwU1nxZY8uu2m0VK946BTBHyMGHxcE67vaDV
	bUU19/yEEUI0LvwIVVAXgu6eC0iMWmJ5466V0VrwKZO4ONqafcGb+p6aTv7OtauI6TpGUFoMuaYZX
	ppuhHZBWz6pwoEMiUj18LUXNpxr3WVuG9ZATaYvfRTMILu6J1RYRTqRNAcbIQPG1vC4aLQynfX6Yy
	IhMCZeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Bc-00000003Key-29gE;
	Wed, 29 Apr 2026 09:26:28 +0000
Received: from mail-northeuropeazon11010028.outbound.protection.outlook.com ([52.101.84.28] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Ba-00000003KeZ-458O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/b3uoFCfRpH/B0km6ghO4Cpgxd7YtENXblV/Z82aS/gsC6dvzk2zuBosu++zGKIuDlbr+6AvA2GLQEfUEm+Feh+n5v12KTimB6FNjjMSu1w9TcW7S6i9X3/E2i6Kmq+fv618w5YESBHvK5jk9YeGiSPrFHnjrEQGDWRiJ+WlmDsjgX1Q9HwW95nBAPqV2oTdzQ81Cg+F0fVxyCj+Q7eKELSz8JoMMjnug4RwpCOlTubzIRGIREpJ/DQALz4nham+4XM7Uj0g50kg60ShIOacjoGBXF7KV1XILmTRftitV/k6kPQwDwhSqFhOT5JUzHBRhNoqZS+9vqD5aCSKt1xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPn86cWJgGMjABRzmP6nq7mk34Ihxlh5fnfcuB93LRU=;
 b=jlxQvrJMqdZN4JEDU8ggdzSqfIonj0G8qwnuw960a3CGnHu0/JvAnDWeQEiEQWw6uIqMc23PnC+i/SKhRENf22AJjhc6ADpQp2ywj1FHhD5Dfjm7d8I3Kr3jgoZ5BjVSe6i7c1HrCxQvD1xmJn0rDi+RsDc1FDHZsZTHrWli6Vg4YXZy4+Wx+NBX4k0Mq8hq/oCgrZkGUbLAqfXGKAFYFPDNxEMuW9E2m/fQUoBmZpwa253hWYavFeix1fGB0T6LNf+qG35ifbzy94VpD78SYDK72/bl+YJIFE4dgVHd8vYNBeyII+AEFuDD19kGbm6Gvdbu22xirsvpEZ+25jg5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPn86cWJgGMjABRzmP6nq7mk34Ihxlh5fnfcuB93LRU=;
 b=p4GhQbJsUAq75c7uC2hIbJWkU5DVED78QvVS18Ux13TDKr0npt1P4xGDeeWTDO98N0ZT2lauGNEW9WT+TMCcAXZIHud8rFE/6ntpFRtG3B6PoonMDvf9KPEshokjJooA6fOOgIv3l2S0R1draF0vwmhm4erTpsGZ4AoyvYXvmvVEWQQYugwXG3c5YLa6olUr0HdIbaMwazUiBF0Ic5mfAbMsruqFeIbi8+ApRv5FCtZouaep+9kKlK5hxZ4DCfSRlXBtS1xSbSPYsJYaanujnn57aeNNqq5ELwIU3Ps+xqm1lPbvbZsaOsWNwPSYnb7YzbLdUvL0oK29DiHYigsXHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:26:16 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:26:16 +0000
Message-ID: <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
Date: Wed, 29 Apr 2026 17:26:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Joseph Guo
 <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, justin.jiang@nxp.com
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c4c68f-8554-48c1-d0fd-08dea5d15cd9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: z2AEbcgPSrTg1QtT4gUik8kogxl1u2+3frJDm75oSOUtd6yIN2gi/Q6iih8Tc+2ePXiSdNbLTCsayPz1mFiTn4ZjdUT5qu5apSBifGPukBL1EKH5evPrgJlFbDVb3tQ/x3GSoVKT+n5+SmVdFzz7NA5raiW9Kt/jDsFjo2D0gW2IHT+jA6wU+OClBMf4MJQw3MWLJJ6dPNTX/O2r6BB0nKZPu46YclM3QWj+G6tE+TbuV2q3K0sP6/PWFgtvy8Raktafx0+sZ+sY4d9RUwmdjhaeGXlDFDklIXsUYY4BD2Jz02C3ZYjxWKBoc46WRuo4Dz9RTGgYkNXisXyDbgkN2g5tb9JTUzkf8NpT9MbhSsWh2H4TRa9cFuWmStDrugF98SInYkoDJ0eNmPoo2TymDWbTOaJbRXtrT9dnldGkGKc1vl6mFL2BsvAO7mgAubyKNvOEchjxLGYtTyERlLKADonPV0PffIJlbV3HV/DtyaHdBW7e06hyfefqvp2hBqxM029rYRO/gh7pWHtv2k1it6KoXtoFcUmYlb3DLEtW7/43H5fOhY6yPNGJivwDqy0IyYYjZItw00VWE/MP1icYpIbj8VlHfnVyoAmmyOn7Hz7UzNiGL7GepqpdeNS+HDRhZSU8ECXhTFtKSO9yf+zAYz9HahnWkx4zvz9U4Parn4TCIwXYbHOShawwXKAYNRJhOtQbh1Dn+j2D6R8w0rDsB92SPTwDrlw+XLm7LJp5KeE4fLHoIZlJW6Kk9K1/c/ysNJ7WgEdIkg15IsuAMBTv9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnhRL2dUbDk2NWl2Slc4d0RJNUNkSExDS0Q3bXJ3WmpYVEo1UzQzNkloYzBu?=
 =?utf-8?B?VlRzNWtOUzU4bWluMHpWeFpCalUyTHRiRGVLK2ZZTTlsVHF1ODlYTUl4alZW?=
 =?utf-8?B?ZGRqZXpuZlREbWQrN0JFNnRiRkI1dGxUenpjenVGeTlIUlZyYU9oRDQxS2ZM?=
 =?utf-8?B?cGtaM2psZk1IK0NhN0piL3o1a3FGRS94NlNYS0NodU9VWU8wc0pzZ1ZWREVz?=
 =?utf-8?B?VTNnSGhHdmQyZEZYQmFoTXdFYTkrOHhDRjM5RVRQRVcwUlhkakx3aGsrNVhW?=
 =?utf-8?B?aFBsZmgzZytCak9HV3duQk5uK0tnM01zTVJnb0haSUJrVnFUQUN1N3NiN2dy?=
 =?utf-8?B?R1NEVm5kSCsvZU1UZHNYcU9pYWJJNFdzRUlpM1NtNDA2eWxSeitaTUNLN2tI?=
 =?utf-8?B?R1hTc2I3bTBGRC9pNlhyalZwU1JobGRNNDV1TVFjNUZrMGVuY09hOWhJS3pL?=
 =?utf-8?B?TWk4NG84UmtwTDJXbER3Tk5vZnVmRHdGZEZwR2xQSWR1QkgvL1BKd093WVBz?=
 =?utf-8?B?aXhIV0pKV2NiTUlXcVhqS1A5ejZzVmMxQkFhUit4amg1UktTdVNVVDVDcTZ1?=
 =?utf-8?B?MkhUOXVHaS92WGpkT2hQWDFZeXdZV1cvdzlIeEFOWW5aM0xWNWo0cnFpck50?=
 =?utf-8?B?dVh3blZYbTFWS2pHODdKWUMwOEhYQS9KR1JnQ0R4Tkl5UDAwKzlGSUZXNDU1?=
 =?utf-8?B?U3F0cDVUclNsdGJzblJXVW5ITXVJNUtmKyt5dUJWb1AzMXAwQzVLZ3FvNGIv?=
 =?utf-8?B?NXU3OUo5aElXaGFVK2lXMmpzMldKN3dVNkZsOElWQ3k2VERxa09VdGtEdkcr?=
 =?utf-8?B?VERtcFBoTDBVOWp0QzZaWkVrY0dJNE1iKzQrdzdkTXVQeGlMZExLWVZSVGVo?=
 =?utf-8?B?Y3Iwc0hWTE12RDAya3g2elYrdlhacWVGSTNIY1lIdVN4V2I1SWF2bCt1Q0oz?=
 =?utf-8?B?TU9lRVhTc25iWUxhOHBtQVV2ZnBHaTlWazZzTzg3N1g5dGFUbDMvQTU1cFhF?=
 =?utf-8?B?endCQWkzMG93NHM4cllMSnRlVjJtMERGSXdBWldRMmdKcnJndXpjTVZwVGQz?=
 =?utf-8?B?amk2UVpJV2dOT29IRzdqem1VZHFZdEpaTm9ORTFtYld4ZFpLejZCem5WM0hL?=
 =?utf-8?B?VlVyTHpzeGZlSkRMbFozTjhTUitZUk5admJmUkwrdkZrTXpETXp6WEpYY25u?=
 =?utf-8?B?NU9qaG1aWU1DTVJMMndwbU5iSVBCL2pBRTZRVTJVcWdIRmlpU29LN3FoSDVJ?=
 =?utf-8?B?OERjVWFqSCsvT29YNTQ0YVhoY3ZPTlU3MHpMaUxORW5waGs3eEx0cCtPL2lX?=
 =?utf-8?B?aFRKN21nb0VxTldzaW45Z21oS1krNDlVYnA2OENjd3JVWE93RTVQaWFvSis5?=
 =?utf-8?B?cm83VWVVUzVKUDE3NWpqWUIxcFRFYUlGMWFMOVhydC9LUVlLUFEvcGY1SHNI?=
 =?utf-8?B?Z2VrT0o0ekw2b0R2ZjA4a3RDUkJrcVcxT3JUUXJDN1pqOGtyL1MzWjNQMnYw?=
 =?utf-8?B?bXg2RExVWDBEd0RUZ0ZleXlmcG9uYnBQckREYWJXRzJsak40RmxxNDNRK3Iv?=
 =?utf-8?B?dm1vb0puZnN0QzNBaWdqbFlCK2I4QXZCeTF6NDdHd1FtQk1OVFJ5L1MyWnI4?=
 =?utf-8?B?alBWUGl1UDZkQnFrbHpuNFA1RlBZRzZqcTVaNDV2eGtZbWk3R1h1VHIxbkhi?=
 =?utf-8?B?a1dEdzJxMzN5dkxpSWZUbUgrcEhmcmp5KzMwN1RwMWRPbUJCQm93K2xNeUk4?=
 =?utf-8?B?bzJsblEzTmsraVZWMmNQYnVyUXJaZk54RlN2YzJlRVlISDNhbUdmS1JYV29v?=
 =?utf-8?B?bFVRaS92MTFMTkcyeEJhM0FPZUtrQTc5VXJ6RG9BOThSUkJ1U3JWNWJhZXJW?=
 =?utf-8?B?UGhmYnZNWDdTb3F3Z3ZrblFsWit2MUV5QlNjSHBNcU8za092SUFvNjRqVUFm?=
 =?utf-8?B?QXJYRzBLUTU5YXhidjdGYTk2MGtuZk1oRFh1YitpZ2R0a3VBQzRpUEtxWjNx?=
 =?utf-8?B?WXhZU2cxeVJLVUtkR3BnVnVRY0hWbkw2VjJzSUMzM1h5aDNrb0Jvb2RqT3VY?=
 =?utf-8?B?Tncrc3ZLU2xxak5NOHVORjN5NjRXRkhEMUFQWENMRkhHWDdSZFM3QS9NZEsx?=
 =?utf-8?B?MXlTN2VnamxkOTh2cFMwb205Y28xa3p4c0ZnckE3U3RicEdRSXBFVHBsN0dK?=
 =?utf-8?B?VWxLWkp5aVBpVnVvcjFxSXpaNmZ1RzFUYzlOVDZ3NHp1M3lEU1lEZHhnbnU1?=
 =?utf-8?B?VTZiZGtFaGpvblhGNFdhR1JaWTVmM3dzREhldnBBbGl1V2FONk8rTytiRWND?=
 =?utf-8?B?Z3VTdWFrNmN6WjJnMjFoWStoalRZbXhpL2o3V0sySWFibE1PaDlBUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c4c68f-8554-48c1-d0fd-08dea5d15cd9
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:26:16.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYTeHq0gKRkWYanJmz+0m/CQfDTYvMdVFzCNI09Tq6fIDHiM5vdugPXBIqgEUHZ9YIJYDIeAPUJ1iLV96ozFNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_022627_040953_2E09407F 
X-CRM114-Status: GOOD (  10.14  )
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

On 4/29/2026 5:26 PM, Daniel Baluta wrote:
> [snip]
> 
>> +
>> +&flexcan1 {
>> +	phys = <&flexcan1_phy>;
>> +	pinctrl-0 = <&pinctrl_flexcan1>;
>> +	pinctrl-names = "default";
>> +	status = "disabled";
>> +};
> 
> Why add this if it is disabled?

Hi Daniel,

The resource of flexcan1 in System Manager is assign to M7 by default. But it is useful if we assign the resource back to A55.
The board hardware have the output pin of flexcan1, so I keep the node here but set it disabled by default.

Regards,
Joseph

