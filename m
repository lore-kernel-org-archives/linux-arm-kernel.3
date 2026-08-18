Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1B5nGsgwjeA0KGVQdF4TGmvMOaLKSNbqAfkidU5+Qo=; b=isqVBO3dUWOB75jHbc6I0o55x1
	feyQ5MH40qj4D8VpKZYzYSeaxOqO0SKNQoxgrqvvRQN7BqndPxwiXrhL6ItUeFz61qyNm8WoYB5qJ
	TZSm8/4Vif8hHwDVjXSJLhjjb8FCSdRUPzmqeC6CVIq2EUpZKPLaRZ23/mcf7MhMNy+f639SjzNuA
	vXPS2AXaXlIXwiIJ2vROcmk7TVwWOqUIWlTGXzFR4JVfOddHH6HZO48mRXUMocvx0WIZWqQd3VMSq
	KWm5uIgB593uWqKOy4IQ796YQ9iqFwl7xZCBhAH+jUXLe/UkLjpCMwaogyb9p3nkq0BzoVPnR55V3
	6CfFeN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT8U-00000008lVg-3sFB;
	Tue, 18 Aug 2026 23:22:26 +0000
Received: from mail-northeuropeazon11021118.outbound.protection.outlook.com ([52.101.65.118] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwT8T-00000008lVE-13Iz;
	Tue, 18 Aug 2026 23:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbZFPZYIUFuRCmUi9Iy6YwJGvhN0ju9xEAUFT1oGvOkvWeAJ01pS/8j7tmAL7zShsFAvG72sjpxQRh6GBEpDiL2F+7gI2rLFoxNcnt0xqvH/LUziNZacdJSgBs/cA/EPtCjErLauVoENuRSCE8/UUl5etUYRqwRjdFsodjVT+Ifqwrx6qUwBNCsCQPgpFtUSbebr/0a6s9kOX0whFIusn5ozsfluzQ2IRgbBEJRMDSg/S2jX99l3Kt46pYWyVz3QlqsrDHyGMyJcIRBqEHXKBdcZ2qHgWik/fEMBv5RWnZU+OI/fXpBs4lDHAdyFdy38ZmyE5u/v5uQJtW9JnA14wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1B5nGsgwjeA0KGVQdF4TGmvMOaLKSNbqAfkidU5+Qo=;
 b=gC9DUmcJ4m9iLyRDAp4lyUjuoAaLAX5ya9ghTVpooTU7tqrLf0rzDQdBDhX6z2fWI06+pBpInFWf1lgFJxzgE/dVJWfs4GwhIlJS/0ppt9hWQIqhhO2VPTmvujMkU4M2nPEITp8V/FgzrXJygmapgtoEd0at2CesmfMh1oYc2ki0LIYt/XlewGYAcnMkOJmhtkSJbCeu2Gpe7opgYKcJYEePzlIJPK9ESHqVbEf5RNLsd8L69ehfdEVe3/0e1jOR4UGmI/zVBbz95aL3iOGYsSwA9C2x0BUTiAeFXO7koAdEKBF0ufjtM6aR7FKxN4iCP7TwA/4idB1fLFPkqhMM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1B5nGsgwjeA0KGVQdF4TGmvMOaLKSNbqAfkidU5+Qo=;
 b=XehCWVTatNYw9yUv8IDNbkoD3HjD2cIllgcpk6SJRQjgSrbe2Nn1QZAFtVQDq9n5sf8a3JFghuTseV5qvQNGqMPxhiB08kwdVbfrkYTnwyTCVj2+mD5kurPOnbpUtniuIQPipFQOEucBhUzcQCAZsf7nCs/kfTLEymf7DZvCXgaelWjISbgTLHXWm9RFiNt28ITl1A6iNMpGslM8VTl1uMYBYklcCoWp5ix27ImH/7pnZ/MgOI4gi3sWmZQRUR6Fm/4S3H9vZLexkLYDiTfsB7fj1R81hXu1J2GUoUmolSbIuzMSsqH6VHS3OHo6XLTrznypEJcA3CZWtBxc/ZuUkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 23:22:16 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 23:22:15 +0000
Message-ID: <15eaf5ca-b2ce-41dd-adf2-f7aa5f41685a@genexis.eu>
Date: Wed, 19 Aug 2026 01:22:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621
 switch
To: Daniel Golle <daniel@makrotopia.org>,
 Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yangshiji66@outlook.com
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
 <aoSnqurLLgdVT_Eu@makrotopia.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <aoSnqurLLgdVT_Eu@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0005F70F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::389) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|AM7PR08MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: a16259a4-76e5-42f8-afaf-08defd7f89e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|4143699003|56012099006|22082099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 8hSTjAqCzV8Xrnt7TkpacQT7z8yuASYgAZiPcofJKcp1CwXrbmlVJSRXqz5VE5F43IBfASK6zAr9b+Kas2xna128A4uTXVPasNF3LOgfHFBu8h2S0YTQMHmtiKkB43XdjudmybvA9OZiidSxeeYpPjRmNUZCkGEK42Q+T2IWy2EvfElzLKygeBvf4nn1tEnLh6PIAn+KNteSsT5AMGm3oTgXmRAEMjxOxk3CvikGPKvUveJBG/MyQzLQlpgSBo7KAVM6dEF/aX9A6Je2kPDBPpvijBXPm7LW68cdWTvSwIc3+GMUolHGsoZ0jSvmAhVK8XFB6ARkTLfKHh3rj/x8uQ4XDi+DGd7249N2G4fkofBoI7PAr2ZH5Dvljv3N74hrgqMn77K3GQkguHBRpFa7VOhXf0rJ4jk1G8YaIWljMWLUwhrDFItjl3TW7S0DrY0ljl1YYOfkiGOFck5caJbpD2+GHIKdOeb5vEg2ZH90fkJk1A9CC6AM6iUXSC16hBqSAMSmPAAXxS9I5el9R+65CUVJjbV1+QB2x831eLk5FYEdgvQuiy1NDXHK4/t5MCpq9SLzLKOUDtRfv78i+8mYoErf4PwewOkpSBvVH+FnHbAD0nrY0VwEqjj8aWLy/gigBfdJoa+gInGxECnZSNO3ZZ8KSG8anzcfiet/kSgtuaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(4143699003)(56012099006)(22082099003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtVNUJINjVEQWYzd2h3NkdxRTdNbERYWXNoWk40NWx1SzZ3cWxmSmorbURY?=
 =?utf-8?B?QmRvVGFvQ1VCalJyMWlYRUFVWFp4ODY1Zmljb21sWWFLS1Ard3M1TXlxL1BB?=
 =?utf-8?B?MnljNWpWWmtPNWlQaU9Kd1F1czcyVG1WdzZwSTltY2UzMmx0L2JUaDhRdUhs?=
 =?utf-8?B?em1kRFpmbGJSK2l4RWFlYU9YWk9LQlBXdVYxTEdHVmpGaW9PUnR4VjNSWkMx?=
 =?utf-8?B?NHk1U3FmcHozUTk1aENxdnJURHZpUS9SVU5zWmJoRE5aM0FaM1N0YTlmQmF6?=
 =?utf-8?B?N0JTRC96VmhiYTNmS1RSVlN2bElyYUJwWVFzOFdZM0t0eU0zZUtUZlBub0JT?=
 =?utf-8?B?enNBS1U1SjhQdGdSdWxsK3p1amJqZFdJZlE0azVGVThNVUNzSTZJYWpuUmh1?=
 =?utf-8?B?SHFIZUt1U3VlL1ZRWHZDWUpzMUVYcXJEYVhQcU5vc0Z6RGgyQUlyeFk4aTVH?=
 =?utf-8?B?eDl6RC9mREorMkhrN2NhZTluYm51RlYyUXRpWkhMcmR1NjZpdnM2WXNaSWpO?=
 =?utf-8?B?anBLcHF5TUtJbWd4ZGVZRTV4RTB6THhsbVZHM1Z6Ykw5eVZyR3hjbTFuZmZP?=
 =?utf-8?B?eU9XL2E0M0x0eVNFeCt3cEw2NU1pSG9ENjA3c2F0djR2U3BBbk84Zy9TRnNJ?=
 =?utf-8?B?blEwcGRhendyYjRSVktRUTMvVFNOR0ZDK2kvV1NmVVJ5MEZ6U0N5VjZjSWFa?=
 =?utf-8?B?RTJUZWFZY2NBZnhPdVVnRk1NR3FjNmtVUHh6M29hRGZNOW1jWUxUazJBckdC?=
 =?utf-8?B?OGxiZ1Z3NmlWbDgwUXhlRVlGVUY2UnE3QnRQSDg5MUxTUTd0TzhPcEwxWmdX?=
 =?utf-8?B?NG85bHpEbUxaOWRveWdLL0FMdXBWYkZHL1M2YUZMdVFBRW5EaC94WlBtN1Ju?=
 =?utf-8?B?QXV3dnBBK1RNak5IWjAvSkJ2bjRRSGY5Z1RJNExkSW96QlE1b1hBN0VBTzVR?=
 =?utf-8?B?Q1NHSzl0TFVHWEYxVThoT1hrb1FJMG9wdkJyYkpBOVdVUUFRQnk1cERmN0pu?=
 =?utf-8?B?K1FhRjNmODVYOFRGN0FTWENnYkdSWHBnTUQwWldqUHQxUVpjQlJaalZDSERZ?=
 =?utf-8?B?eEoxMjdBaG9PekptVVQ5c28zVU5vb1VwVEtZMnR4STJXbWZGejBrQlpRTUM3?=
 =?utf-8?B?Wm54TndtT2M1dTlaOHFOTEZJM09iODYzcXNxckZnYlk2M3JCclJvS0NieEZJ?=
 =?utf-8?B?a2h1Q3I4SXlNYVArT3BEd2Y1VEoxWGQ2SnJ1ZmNVWW8zRWNXYjdrckMyT0NO?=
 =?utf-8?B?bVBmeHNwWDNXTlBpZkowRHN3NDhHQkYwV2Y3UW9JWW5XNnFJbEgxQ0pjK3V5?=
 =?utf-8?B?UGxtT2E3YXZySk1UbXNEZW5TU3FWU2tBSmxleENiSXRtVWt5YWNsQW5pSlZq?=
 =?utf-8?B?WFVvZmlpZnF2VWFyNDdlanRhUnJMWjBiaUp4MU5BOUtQNlV1YklXL2RMeklS?=
 =?utf-8?B?amZZTnJWVGk2WmJrVnJEcS93VFFBN0VDYlNCUzR0TlVjSEtIU3NlY0NDUEpZ?=
 =?utf-8?B?K0tCdjdDSHRYV1pHWjRaZzZXOFQ5UFZDaTJZcTJxOWRjUmlOSFRVSUFSU0t1?=
 =?utf-8?B?SWxSdlMvbXdOdDl4TUt3YmlHSVZoSFdyTnZjRlhBSFMwVnVzSzlBM3k5NEhR?=
 =?utf-8?B?bXR5dFZ3T28rNXU0a0lUVEtBb0tKc3JtdHd1Qi84d1F3Z3ZPa0hIVEo5NGEx?=
 =?utf-8?B?U0RCOExDQ3o3SFFWeEs5U096Q0pnM290Q2ZpbmZ6dlhHVnAyZTJKdTJmTFpl?=
 =?utf-8?B?YU1MTnlOMENJR1JmbmlRKzRJNmNnTXo3ZVlIa2ZPYlVwK3RVZWNNVjE1THVI?=
 =?utf-8?B?WG5BZWIvOWNPckhDWnprcmlmWUhQSU5PUEZhTkg2dHBDU3l2Nnk2OGNZT29q?=
 =?utf-8?B?dWtWTVZCNFA2MFVrVHgzOU1iNWxHa0pPbnJhVHFkaTRweUVjaTZMWFZ5Ny9S?=
 =?utf-8?B?eU0va1RTNVVpeE5jK3prYkFjWWJsR2tjdXh6QnN2RmUrOEh0TEhENGdCak4v?=
 =?utf-8?B?L0IzWjJZMGJpMzBBeEo1QjZ2RG5HR1lGWC9jVW9KWEN1MXRWeFcrQXdwTGd2?=
 =?utf-8?B?SGF6MFVOa05SZEYzbHRvUU1pNzB5LzdpTVlUcnZueDFoZjBHcUdqWWxkQ3lW?=
 =?utf-8?B?R0pPbTZsRFcrRW1rRFROUjkrRURIN0pmRDNmdjU1MnFwSDFaczI5V2FUQm9S?=
 =?utf-8?B?R1Z4OHVibytZSUNLbS90K2xjcWxkOGJsR0UrNURpQ3pxNEFqOVVLUVNPb2xH?=
 =?utf-8?B?UHRBNk0wUjk2S1ZxVmM1b0p5b3VyS1hCODdmcS9ubURBTFIwODMzTFRhZmpB?=
 =?utf-8?B?NDlJTXFqNm9qNkhob3ArMXl6dmtwWnEva3A1SVBRQmVXeUZlOXlCbHBGcll1?=
 =?utf-8?Q?7WKO/HlXJ7VXr9lA=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a16259a4-76e5-42f8-afaf-08defd7f89e5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 23:22:15.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZVBQROQEPyzjMMs1jSEcFvLHMwvbQc105n7wQOzWZT2MOxZpjWt+pJ/R40l9xGaZ9KWFDpiG18LPT7o2lOfcx2n072HHKbbyTrI0MqNkGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_162225_337084_AE3AE325 
X-CRM114-Status: GOOD (  12.67  )
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

Hi.

On 18/08/2026 20:42, Daniel Golle wrote:
> Hi,
> 

> 
> It'd be very surprising if this limitation doesn't also apply for the
> nearly identical decicated MT7530 IC (found eg. on BananaPi R2).
> 
> I'd recommend disabling EEE advertisement on MT7621 and MT7530; and I
> suspect that some of the older Trendnet/Econet SoCs which share common
> linage with the MediaTek's Ethernet switch and PHY designs could also
> be affected.

The phy should be similar to Vitesse also.

> 
> Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
> bool instead of maintining an in-code list of EEE-broken silicon IDs.
> 
>> +		/* Disable EEE advertisement on the switch PHYs. */
>> +		for (i = MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
>> +		     i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT7530_NUM_PHYS;
>> +		     i++) {
>> +			mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
>> +		}
>> +	}
>> +
> 
> 

MvH
Benjamin Larsson

