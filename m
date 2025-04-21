Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06EDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 06:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFHb++fh6EBQcV1ThER9vCX5h4SD+wXxBVLvgb1rs58=; b=N5hvZteNmvAGXoJF9oeAsSH8vA
	Acmi96+03Ftk+Cy+QmvweYqe6Im8d27WTTUtGcvbVQb+zwg/c2RLatrPMAb27kjUltzMCQjKqPaIo
	g0pmZ7TSUC2MEb433a4WGUkkwgf4RwOWStTCJ0xAhBQ61BSH4WAq9S/k6/w8saJ+4ChgxkMMbIy8+
	kjnek+gSjtOeKkpSYwLiFRHBB8Sx73P1KMBB4aBFXO9BbIC7VOzBj6B5853Uwlk6CXPbt+qcJgSgv
	wRVElMxExo6Qq2JMRZPi89APozqyJbvkZqFtePxpo4zdQGLX04NVuCxQOgHeF6Fjelpvix4u2X9LQ
	fwhcUGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kon-00000003jGA-1j1u;
	Mon, 21 Apr 2025 06:39:49 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kmw-00000003j9D-47ni
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 06:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFZaeJVn9gqsyWmkoErI6XwG8wBHG9AINKldwEBzVDbTvS9a7FOIUWpZ+Va9CPyLUfbETYdhXid1N1N5m6w1eygco3wuQpl3sKeU8QXc96wWtgBE02mLKGRBlw27LLuR5c/0bKrWQN54Q10uT3lxyv8UzlpL7JVUYhUwbgS/O7q4EitAQcfV4TJ+c4hD47pWAPvO7bHfFd5VR/3xVgNEvtJja3mMmixdB6kJzbpNe5o1rPRLwgM1XvtzSbi1rsyNMNbJ9t0bErwDv4cmqNXnSKJjq/ULZwnfrvVU9VAS+A7vIKg/2ujdENmYdWLkK435cGzy1PWFsL1ni0AMdptC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFHb++fh6EBQcV1ThER9vCX5h4SD+wXxBVLvgb1rs58=;
 b=M4qISzI7ykFlQd2pgLpsF03HMyTou9ImEjGRVbgh69venoaL5lKfMKhZnXi2MmoByW4H5OmiVTVb7QrEpRwMHqHKWqNWX1t95TMUba8URxFYsIlCCuQCiw0tAHmqs65LU1WpW7KgE3ZJ7ShS4vvy/UXgWh6QvyImx9u90hGcbVjl6vaFNYX9azbLXtcu/cWFfef7EMnolUHtzty0mbcRl7J+8ywTEdNRGO17nDEKv9aZxpz2T2/ti84GZBZr2UMetafRJgx4sqcoOP6FA2dkwfcVmsh9vbK5cH0SttSDgWNzLA7dz6epwU4sfXm0ZwrW984izSB8xLDlxu+91nujhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFHb++fh6EBQcV1ThER9vCX5h4SD+wXxBVLvgb1rs58=;
 b=opS8lmj1Jr7TzdeD9erBN7WpI8xc5QZbQjMiQAJairON5Yqka1JhdbZhga5zkD2JUvWafNortjqKJWSPOPNc4bX2jqciyaJ76VlqwG9P61fZTjf12EnOTlKRx6lAP8Yc5sPLCTsBKk6Lkm4HweBf9mCUO0BuyWw48KvuHQwNrnuse8sBrGyLOSNI+i9AA7UY35mEUI2iHzmkuvLO3jRRJv64Jvkb+RVGci8N05Rjrk8DJjR5YAeR+9IBXBfmkZY01ndjTBf4uvbRRXGUP8ujRzOUQ9/BxvmEC9EWyETsv9QquocXiZFoQ4snR/DSAmcn02RedfK9liB8VsDtOpjAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB9678.eurprd04.prod.outlook.com (2603:10a6:102:23c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:37:48 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:37:48 +0000
Message-ID: <d3668dc7-b8c8-497c-ae3a-b476a8658c40@oss.nxp.com>
Date: Mon, 21 Apr 2025 14:37:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Drop the first error frames
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
 <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b02551c-ce0f-426d-e426-08dd809f0811
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUJFd2s1d2Qxc2Z5aGV0Qk96a1Y3YVNEaWhlbDFRcGpKaDAxREs1c0tkT0dX?=
 =?utf-8?B?cFZ2a2xXUjNKZUtIcW9RU3hXNjN2TzBRenIwVk5LS0VXMjZUeXBReGdTWWk0?=
 =?utf-8?B?RWxKc0h2aUhUU09BMGphSEhjYldPQVc1dnlKbXpmZXRCWDBtMDRKVWlhVjFW?=
 =?utf-8?B?VzliTitFYlJzR2pSblV3QkVTSGphOC9oVkhKL0dsYjVycjVRR3VUcEhORVdq?=
 =?utf-8?B?QWl5UVh4cXdOU0tTbVZZY3FXOFFrTDRLTHJOVVRhaVFqbG8vdldKMys1UFk0?=
 =?utf-8?B?ejZNclU4K1c5bmVmVWRBWlMwbU5oTDRUYlJRdnNmWGxDeGx3V0Zjd0VIZkk3?=
 =?utf-8?B?bWwyWVBNMWJiOThJNTVzRDJhLzlLR3lCWHdXVndTOU5rK080YUJuYW9ydkhP?=
 =?utf-8?B?R3hKU0ZhTVFEOEwwUEpWM3hMVTI2NmR0VU1GYmpNeHBRRVdyOVN2YUtkVnVP?=
 =?utf-8?B?SHZFWThGcEh4N1A1SElYQU9yNmQ0d1U3STArQTVwYUtqS1RHOXRwcm9pRU9S?=
 =?utf-8?B?L1J1bDBHdUpsaHd4REplMTNJa3VVTWwzU1o1SzY1WEk4UzBRUTV0SEFSVGJl?=
 =?utf-8?B?SjUzRjl5YnFMbWZ3WHF1ZmsrSEhIOXNwUnFYbEVydFF4ZHRCVytHaG1pR3h4?=
 =?utf-8?B?dkdySENDOWZYUlVDZEdSQXRkenFZRHNKTWFQcnN2WDJFRENwKzloeDJpdDJn?=
 =?utf-8?B?SHUwY0pGOWNFMGUyUUJOejA5NkVjT1M5YWs1czhwV3dRZFFWVlUxSXRwdnla?=
 =?utf-8?B?V0RDNWlmeEdZd2pzU25CRDROWnRjMzhPYnJQb0tqOGhKRVRSYVhjOVhoQ1VL?=
 =?utf-8?B?SXJ1Sy9wYVlLb0pEdTd1QVZiT0pNTWEwUmZTaW1TajQwcDNWNmNLd056THV6?=
 =?utf-8?B?SjZ4dWlXT01RVGl2eG1WMi8zR2hqQVZWbzB2bE5zRk9rbWg1UWlxdzlRL2FH?=
 =?utf-8?B?SUJlZ3FnTTd4NUpma0JxR042c3NVNHA4QWNQRVMrZStYQkhObWx6UjFCUStH?=
 =?utf-8?B?bGhZbzNGTXlhcjBSRjJEaGdIRmhZKyszUEg5WmR1aFNYSVdpZU4rc0JjbEMv?=
 =?utf-8?B?b293dVhmK3hQYjkvbS9velg1Z1ptblhlWjNMUFBDeUQxckx6czFobUlrejQ5?=
 =?utf-8?B?ZW1rZzJWdkpvQlptekZSS2dZcjArbVhVQ2h2RlIyMTZXL21HNTNjT2RZZUFi?=
 =?utf-8?B?Vi90SkJva0NTVVBrOEZ1NHYwMkJkRjFPd2FjbTFPMnhqTThyYkdCRHlCeGhD?=
 =?utf-8?B?blpsVXpxYWpkRUJPWXZxYnplZ3d0VStvVndNYnlwendRZGZlQ0FUcHFYRFYr?=
 =?utf-8?B?eDVzT2llbTh0TVdKN0xFTGp6YjhTRU1SVndSNkd2NXZUSkVlRk5yL2hYM3pH?=
 =?utf-8?B?SWJWM1ZTb2t5Zm5tZTRCKys2ekVmMzIwUGZxaDNVMlZKVWtmdk5hUkpXZHN4?=
 =?utf-8?B?Y0VVcWd4aUNiUWtLVWJ5RWN1Yml4SldSYW5sVjFrTjk1NUtCOVdBMndzU1hN?=
 =?utf-8?B?S0k2ZjQrakgxSkdteFZqelk4eVZoNXovWXRsQWp5ZTJ0czFNOGVoUlZZTHV2?=
 =?utf-8?B?bUdVMTQ1TXdhZXRZREo4OFVKVytZYkVTM01JS2Q1dE4wNzNFcXRXR0ZiNStY?=
 =?utf-8?B?NXlJSFdENWI4ZTRHTUt2MklCeVo1eUJUOVBvY2tJSXpabFF1eS9lc0ZlNjgv?=
 =?utf-8?B?S3MxRC9xZUdhZmxidkZ0Q0daL3k1Yk5tL0ViVFpTQkxaV3MvYXBxWFA2ZE9X?=
 =?utf-8?B?SlJCSGUxc2haNDQ5SVBlUkJ3RE1mV3BxeDUrVzVHODRkbmJRSTVWMGtKL0NI?=
 =?utf-8?B?Ym14QXBOOE9kYjcyWVJXR1g3di83L2Q3cDBQK2RVQzI3LzVnanZiaGQvNkoz?=
 =?utf-8?B?THpzS2xxRGFDTFo0L1JzVk5SSEVWalZWNnBCS2dmK0I1QS9QcGErdHZESXZu?=
 =?utf-8?Q?02DRznBLdhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk1WMGNGUzRIWEE4N1l3QVZ5a3ZaYzFoZlVCU0N3dmZ1ZVlJTmRrck1hNytC?=
 =?utf-8?B?YlpFeUVKY25sWnZwL01XOFRLY3RoNnVPbk1QUS91ejBxUVpYQjJhd0JUM1Vq?=
 =?utf-8?B?a2VhNTV5ck5QcU9FWGt5Tmo4UldaN0pac29jYjhIR3hoNjR0eGhsQkZsSzhT?=
 =?utf-8?B?QjJSWWc1OEU4REdTeUV1WTVjd0pCcWJTSVgyZytRVGFkNzFnVmVZdkhFcVRU?=
 =?utf-8?B?OUlLaTZkNW9PUDgxdEE0T1lLcmYxT0pHS0FrODdxdVdjRlFrVFhqZE5rRnZv?=
 =?utf-8?B?cTIzS2tFbkdBV3Y5dDNSaGF5dlV2UnNsWnNsV3pOT2Q5OG5FUW5Dc0FOZXJH?=
 =?utf-8?B?Q01LMjMxcE5OSEN5YlNzSkV0Y2VZRDAvWFE1M0RoZ0RBd2hPTExlTDZZYUpM?=
 =?utf-8?B?QlZxWCtISndreXZyMTc0QWFDckt5KzFLemdPQjRrand3bmduaHJJY1UwMU91?=
 =?utf-8?B?T0tvcHpkVmdZUmFrQm1NbGE4eUpZTUpXZlhEekVzTEFsSGZvaFRNb2ZPWU1F?=
 =?utf-8?B?Nm1wTldBeEljRXpjS045VjRyWVhYVXYrTkp5MDRyNXJJYitNeVpRaFJJaEdS?=
 =?utf-8?B?MFBTdzZJdE8zOUNXZWVYYnpsdC9sK0lkdk4wUzNiazU3TkFmeUZIemRud1Q2?=
 =?utf-8?B?TDd2ZkYzSDJBR3cxekgzWE5Xb0lZeWxxTkR0cXlXUGs3WmM5MEwydlIyamJE?=
 =?utf-8?B?cnA3cjRTc01aK1pOVXUyZVZ4Z3ptWlpHcTc2S25DblFzN2lHbHpqY2JaNUE4?=
 =?utf-8?B?U2ZHZU95RUZyTzNSUFpCdS9KUStqWGVidlhLQkZNRHVPbU4vVXpzakxGYTJJ?=
 =?utf-8?B?eHdTQlZPUWtWQ2NwcmJTMHM4cTdjekJma1kvam1KczlzdmJNZ01VRWhEOE41?=
 =?utf-8?B?UGphejJYUXFySEtPWDBTbjhPbkw4UUFWcW9uVUZiaGpkMnpYZHI0OWUvQURG?=
 =?utf-8?B?MjI4cng5SjdIZXVYNGs0M3dKR20yOFRFbmptY3hZaGxZQUZpMXNySC91aXhF?=
 =?utf-8?B?dDh4VCtCRGxpc0tVRWpjbVpjMktBUlR6NWhqWXVYdDROMFFSQS9rWmxsaGtt?=
 =?utf-8?B?cE9EOWROWmY3N2Q5a1hYNUtwSjV1c3UwTnE0YUt2Y0J3Y0l4SmoxUW1xUXRF?=
 =?utf-8?B?L0VHcmhQS2NnZ29STzZMemVad2VYWmQ3bVYyNE41Z0tqR242N0ZkQ282MGhD?=
 =?utf-8?B?bWZuMitnbnptMWtTLzlCYTNsOWNadGxEVkJ0UDZIVjloSnFleWhhMUNwMCtZ?=
 =?utf-8?B?Ymc1Q21VbXVGSFZMelJFZytpTXRpd2tIS1dWUXo5VWtwYlRWUTErVWpua0o5?=
 =?utf-8?B?c1ZRMXRpNHhIWUovcHBlNHhCeGM3ZTM5SWszc0FVYlV4ckdybjlBOWZmbjhk?=
 =?utf-8?B?YjNuZ0dnQXcydmdMNW5hcm5IaUdSSmFFc1AwTUoyU0NlUTdSYzhwMytBVFFW?=
 =?utf-8?B?TUF4bi9FOTN5cjc2NHEzOGJlMlNqNUZRZDltU3VKQzdJandtdnl5Y0tsYzN3?=
 =?utf-8?B?SXIrMUlQeURHdlpISnd4NkppRVpkM3lxUHdHMmR0QTlvTXZyQzdPWk45ZFRL?=
 =?utf-8?B?K01Dek90YThpYVhrUzIzUGJkVFFUdk9pdmk4SFRlTU1ZeDN4bW9sSGM5Zjkx?=
 =?utf-8?B?Zy9jYTFVVm5RWmxhZFVldGtKU3hlZXpnODlhYXNlOGFNU3IzNFk4bG5YYnhz?=
 =?utf-8?B?U0JhWmc2QTRIMDFNNlhaNngrcm94K1VjSTJiWHRzeFhyWTg0Zkw0bGV5MDFk?=
 =?utf-8?B?SW9DYTZqTmh0Sm9QTVdxbkN2MWRuMVUyYlhETXgySFN0bjhENVI0ZnFzVERa?=
 =?utf-8?B?aktQYTBuS3p4dnBnMU5pdEJhZGdSbTNuOTFrT1JjVXVyTEhmQWsyR0R6OWtC?=
 =?utf-8?B?all5MFVXckZOY1QxY3Y1WWV1T21nY1BMMDBtMy9VRXZ2ckJQSFRKWGJnNDA4?=
 =?utf-8?B?STRDc1dITmJHK3dScEthU1RERW5SVWxBLzV1aHBoNDUwWm5iYmJGcDFNdmJy?=
 =?utf-8?B?ejJFNnlLN2tLWFdIUFNqSGdLRlN4STVTWXlRS2lQbW9yeWxwVUFEREN3QkFR?=
 =?utf-8?B?Mm5CZjRSOGxjb0p4b3JaZWExaEkzMk1wMFlURFJzRjhDM1pnOHQzVFVKU2Nx?=
 =?utf-8?Q?xD4itTki67Oljv0cnF1HFJEsC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b02551c-ce0f-426d-e426-08dd809f0811
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:37:48.4496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nypwyjm0KgL/lBu8Zny2NPXCeqjilG/SJe5suFovnDGrlXTwEc4cUE81tie3xhBqpvUXLerjI0UsJ+ybQN1xcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_233755_036304_34AE420C 
X-CRM114-Status: GOOD (  20.79  )
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

Hi Nicolas,

On 2025/4/18 21:12, Nicolas Dufresne wrote:
> Le mercredi 05 mars 2025 à 10:25 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> When an output buffer contains error frame header,
>> v4l2_jpeg_parse_header() will return error, then driver will mark this
>> buffer and a capture buffer done with error flag in device_run().
>>
>> But if the error occurs in the first frames, before setup the capture
>> queue, there is no chance to schedule device_run(), and there may be no
>> capture to mark error.
>>
>> So we need to drop this buffer with error flag, and make the decoding
>> can continue.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> 
> This seems like a relatively important bug fix to be, perhaps you can
> offer "Fixes" tag to this commit ?
> 

thanks for the reminder

>> ---
>>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 1221b309a916..0e6ee997284b 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
>>   	if (ret)
>>   		jpeg_src_buf->jpeg_parse_error = true;
>>   
>> +	/*
>> +	 * if the capture queue is not setup, the device_run() won't be scheduled,
>> +	 * need to drop the error buffer, so that the decoding can continue
>> +	 */
>> +	if (jpeg_src_buf->jpeg_parse_error &&
>> +	    !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
>> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +		return;
>> +	}
> 
> Looks good to me, an alternative implementation could have been to
> merged into the error branch above.
> 
>   	if (ret) {
>   		jpeg_src_buf->jpeg_parse_error = true;
>   
> 		/*
> 	 	 * If the capture queue is not setup, the device_run() won't
> 		 * be scheduled, drop the error buffer so that the decoding
> 		 * can continue.
> 	 	 */
> 		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
> 			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> 			return;
> 		}
> 	}
> 
> With or without this suggestion, but with the Fixes tag, you can include in your v2:
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 

I'll apply your suggestion and with the Fixes tag in V2

Regards,
Ming

>>   end:
>>   	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>>   }

