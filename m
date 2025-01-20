Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842E0C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NospZOcVJ2/yJud+ueEvQZUMTjedffhkHcp3SIA+A8=; b=i7AAZupdM71VNJibuUfSdfIPvv
	XGJRkd32HJ4OfANKjEbIiqZGr2MHC5yErxT9VigHjZF+oadvDGTnqbfZCXKOEtMdQ7bYKJZdR/Uqt
	aEvtUj1b8yAWKdms2cvW1LCPKJtKs9liCWAVMWBPZEmcp9/rVEHWkzRRRrvFibZgckDh+hWsXICjg
	+YVFM7LCn+zdhG7TggU7AZr1s+wh1C2i8HebsBKouOK+dBoOt90EBzBCX31HVmpfFESeEC5sEFP8u
	aZYIy4IBzdCqLp23XAmvFZ//kkWw1ZxvzVxkbEBQX8rePciG8XLYjCZd4hzXsep84f9IRFkhNjsK9
	qDiftXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo8Z-00000005CLK-2wRQ;
	Mon, 20 Jan 2025 09:32:03 +0000
Received: from mail-am7eur03on20624.outbound.protection.outlook.com ([2a01:111:f403:260e::624] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo0Y-000000059jW-0vnB;
	Mon, 20 Jan 2025 09:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdmBSquZZNg6cIGz8l2VBCVJM93s+5pub3qzujXyRrP8eW7UREBef5EcWVaBcq68eI1mODppJNnATNZDgNNfOJYVVxnwPT3G133p3ODF/IcnU67oM7j6Z71zD5p2b03q//uaHT3XkwKIi4hQf/6JpewUCyF+HZT1X7O5nLqPdWNtlbGPB1+HrebOz+GiWUc/47jtBbLAY46wxdpDHA5Q59LWeJvf+in3CU0fJhYg2IY66c5FlNnvcOeQNGUW6qRuNZ0F+WFv0AgD/Sk9pCt9MyE7cs5ww8SrJV8hOwci05GvnIazvKDTIKSoF4AArhR89BF4D9OgZpfjat042pIgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NospZOcVJ2/yJud+ueEvQZUMTjedffhkHcp3SIA+A8=;
 b=gNwnD0iug68GpNgn/VnaSb4vM0/mAo1gvHSQanWrePo1PwcaJpjrWT0cMoMwkmTxRUiWpqWSUV2SpMMROdafIXUuiXKYSs1DgiPO2pqmTJl+5i5FFVF4T7DlX+yOqxjhI7hBJj24oE19nXo6k/l0TDa6s62kT+RRXNnrRaIDAmuZPgH9koe8xPxhVkRNT0RxxtPrFMZttHds6+aMdjPMPZ0YYzhh18oZLLuVLT6gN0kNVUXhZRj8qZHtZp2IKNWkEyQQY1OfmkQJvJI4n7MPWfV4HOKzVD1bKCV0/jYItYxx6RhIIYTjKswpJSJjInzYBHi7osoDvfVfD0KL9gjdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NospZOcVJ2/yJud+ueEvQZUMTjedffhkHcp3SIA+A8=;
 b=jggOGnJMaWi0tWrD9MpxNltY5FjrjICJxLPPPB9mtFjzySe1wPQ+JVEE70NRlYIaU4aOIwH29+9Xb29viflUL4DkGCtRGaWdox7sKyFs4ubSHewrbprN/OyvKGNXDGfg/Xdh1qLjMEJbWV/lgTKHZm7HNtCbNRoqBwF7h3X92/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:23:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:23:43 +0000
Message-ID: <433a8050-98b5-409b-97b5-00fe0e719a52@cherry.de>
Date: Mon, 20 Jan 2025 10:23:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-1-157d319004fc@cherry.de>
 <e492812f-11cb-42e3-ad0d-ae6df37c346b@wolfvision.net>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e492812f-11cb-42e3-ad0d-ae6df37c346b@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::35) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 130c7b1c-9b15-4cc4-7f7f-08dd39342203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1RCS29CcVN0VjM4UWJDcWh2RC8wWjdhSXlVYlR3SExwN0R5YmtLYXVmQTBH?=
 =?utf-8?B?TTZ2YTJFN2U0ak96TGdPaUZuSHJrOUQ5WHhwV21NUk0vSldGMXR2RXNmbkk4?=
 =?utf-8?B?VUhPclNRbDlJTWwxaENmV2lPcE9kUDUrN0x4OFRnbzNLN2dHenowWlVLY2NV?=
 =?utf-8?B?eTA5Q1VZYXZzZUszenlyZE1OQXp5WlFmcTlMMUlGTEtDbzMwd3dBSi94RDZi?=
 =?utf-8?B?b2xScmdKRnJsKzVicXBmeUEvTWdJVHNKQ3Qvc2dydnVLM0gyUG1EWi9rRERr?=
 =?utf-8?B?K0RPQXZBSFJQaTg5ZksraUZ2TEJxK1NLM3EyZ3VFamRSSkloQlZlN2VPN01F?=
 =?utf-8?B?R1BXKzk1UkVPMnlDVEh1TFNiSnVWSmhqN1luVk5BbVBNby9XUUhXTDc2M01m?=
 =?utf-8?B?MWpxTis0R2UwR0NpVnFIR3JxcXJ0NGJVWWY5S0dZNHJiSkcvb3ZrYjZoM3pJ?=
 =?utf-8?B?YzltRGJ1NWxzK211Mk1za0szTTcvckQzeW5WVFJDSGdUeHpIemtyR3NpKzR4?=
 =?utf-8?B?RWhpaXN3TUZFMnduS2k2djhPZnpid0V0N081TnNMdGp5a3hZZTJPcVpZc1Ur?=
 =?utf-8?B?anA5ZXQ2V3FIM0N0L2Flalo5c3Z1UlhHMXdWb2ZNd0NsM3RNbStuRDJCSGhC?=
 =?utf-8?B?UnBMeVlTc01mOUxlMDJXbytNMTE4aUNUQnpRWVhzWENyUGpGcUZDOE0xMHQ3?=
 =?utf-8?B?anc2TDhVS25PQ3BDRjJkK3RQVVBTbHU4ZnBVbFNlcnZJejJadHdaQ0JGRE1a?=
 =?utf-8?B?WEVpZlUxazdkcDVQRFdRcDBHRHlManh4V2I3Uy96eVl4cS8zcnJxR1NSSE5J?=
 =?utf-8?B?ZVJqdUpHb0xNRnEwemJVQVM0QXlxZnZwR1FzRjZSY1JTNXJIcmVTMStjcjlL?=
 =?utf-8?B?ekIrWXEySzh6RThVRHN6ZXpsTkVRQWdYRVNpTldrZm94eFNLem9UeVlSSkpH?=
 =?utf-8?B?bzVPMVhlMGpFeFFoa3I1cUlEby9sekdKcmNMQjVBaFFYcnZkcFhPRnBTczh4?=
 =?utf-8?B?VnlnK1VlbDhPNGY4OHI1akd2Yit6dkZGSWxKeWQyT1hQN2NhbUFKTUJDWnk2?=
 =?utf-8?B?SEhQaEZITUhoYlVWWXhzRVM1V2JXVy85SXdKeFRkVkltc0YzUWpXS2RsalE3?=
 =?utf-8?B?alNicTdjRU5BMjQwYWx3UTJWREFzbUY5Ylo4UzZrN2VBVWRWNG54MHduaFBJ?=
 =?utf-8?B?YjFHSXNTMEVFS2loM2pYY29Cd05OL0FlUmVTM0k4L2lvRWlCVG15ZUVMYk9n?=
 =?utf-8?B?SndWTkxUcWt0QVptQVZKVXZ1VUoyTTFUcUUyeDJaUzdrL3Z3VmZKRGJKOGNS?=
 =?utf-8?B?QkhjZURIMHBZUklEZU9HM01tc0lKZ01waWRKSFI1ckFBbWI2RTFlUjRmZ0FQ?=
 =?utf-8?B?ZUV1UG9YYzQ0ZmJaZjdOdnAyZGd3VzhQQnQ4c3dVU1dOU2FQTlF4RGFjWVFB?=
 =?utf-8?B?ZjJjUEgrQzJ6OGQwZVlsVzRvSnJyVkNRdm5ma0k2Vnk3VVk2bzBLcWJBV29R?=
 =?utf-8?B?dThwdlJReVBpRUhkQlVFTU9NRlNCMGJOY2NDKy9mYXVCUmpiajV5MlkrQW1m?=
 =?utf-8?B?eFN3dGZXZUtyQldTMlNsb0x4cU5vNG9KY0tzeUNDWnRaZ05NSkZia3BIUjA3?=
 =?utf-8?B?UEJKa09tUlF5M05FMjUvTjNnSjNKQXZBZlh4MTBRV01jQUFSMWNsSmRETDRH?=
 =?utf-8?B?R2VmNStIbzd1c0RKcENvL2hvR2hHbG5weWVxWDFjYjVvVHRkVnp5SnlOdXN0?=
 =?utf-8?B?WkNpQThMRWdxcHZrKzdDamIwQmkwcHRRWXFsVU8zOGlUWEpzRHVFMUd0Nncv?=
 =?utf-8?B?NXVDNHNvcHdJdFppTi9QQTNKYS9TbEcwQngwcWtDQ0NGTDNUUWFxUXZqSk96?=
 =?utf-8?Q?0MQTz+EbF6A5f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dSMWxPc0FUNDdiMDhmdUQxd1RCT3dmakpWWExpbkF3OVBZSGg0aHVMbXlI?=
 =?utf-8?B?Z0RaK1RLVXY1VTB3LytjeTNwZEVEZSs0T3QwV0hFUjJHSGVFMk5iTjFqV1pB?=
 =?utf-8?B?OFFQN1ZHK0xKcGxuUG5LOElJRGU0ZlA2UmpVNUlaNUVGYVFNd0l1Z1o5YkF4?=
 =?utf-8?B?Wkx1YWNDSkNla1VySUlUL0VHT3hxYXJ3UUZ6YnVLS09OVVVYaDV3SXNYTFdB?=
 =?utf-8?B?U1grRTE1NFlzQnRSQkxpYnQxa1grbEk3NE1ZT0dXa1B3RWZROXorcnZ0USti?=
 =?utf-8?B?SG0vR1JOR2x0dFF0Z2k2L2ZHRnNDWmwwTWVwV21IWHZBRXZWeHN5QnBjSnVH?=
 =?utf-8?B?RU5lWCtnYXFNcTB3eVFHekNMMUhhUTdHRDlxWlpncC85c2pKb052VXBxUXRw?=
 =?utf-8?B?c0lJdGI2UTJVdXN0TkJtbHZQOXcrUEpORThndFExVWNOSFlCWDBZcnQ1TW5q?=
 =?utf-8?B?MFk5U2grTnJEdHNrWC83a3VGaU44ejdrNWVPelg4S29ySFFWY3VONStqbWZV?=
 =?utf-8?B?RjNrR3VZMTlJY29KSUtRSkNHVlVvY1BNendNNndpS2t1dUk5RW1Gc3EyNE1T?=
 =?utf-8?B?a1ZQRzVjeDdXaUVqTTBuTG1RV3U4NHMzM1E0Nm1nUTk2anNCUlU4OHdEeUlu?=
 =?utf-8?B?cjdqUnNVbTNGbVh4MENBY3lnRHYxZ3FyM2dNdXl0VVJRaGRQY0w2YUE2eWFs?=
 =?utf-8?B?WUYzelVkMjhYZ2UxeEQ1cjl4VUtvTS83QnlMaDBISEZoZHpRNkxiQjc2cU5T?=
 =?utf-8?B?S1hxUklaVHpmQ3BwcDZtN2ZSK2kvOVJkdXlQZStZR0JCRHlqKzhPOUlhNmFl?=
 =?utf-8?B?bjZTZDhid1NWeEdSaXFXQ01kbVM4TVVMNWtYUzRHNXlTN0F5bVdsZlo5Z1Iw?=
 =?utf-8?B?L1pFOWpScVo5dEZ6aHRuUzFGelduN3RyVWtBdmlTR1ZEZEZBcGkvZDF6Uytv?=
 =?utf-8?B?VzdYNTI1YlBQbWNUT0h3c0UxejVjbDdPL3dQeWNRSjJVR05VR3JKajhIV1Bv?=
 =?utf-8?B?ak81QnJicHlXL1lNU0R4RTJENTNTTGZDNXNaNzJsUXB3QWkrSUs2NHVVTzNq?=
 =?utf-8?B?ZWpZV000L1N2M3FWZ2NxNlhxSWUwV09NL3VrczBqN2FmWUNVVnBOcXkyUUlK?=
 =?utf-8?B?REppSldSeWpSb1dlTmkyWXpvS1NjamJacGZqd3B0YlI0ajZseElaNy90eitk?=
 =?utf-8?B?U3lCZVFLcjM0aGEyU0xGeHNZN1YxVFd3QUd0WFhIZkdnMTJTU0pDcHhoVDdk?=
 =?utf-8?B?Q1Y0dzNJVU5BSTdXWU5lVmQvWHhRZ3BvY204ZGNsRXJRYTRrbnByRUoybS9S?=
 =?utf-8?B?RGtkN1pHamdyVE1vY25EZERFbkpzR01TUzIwQ21pbFhVZ3JsVEJDS28yMnhj?=
 =?utf-8?B?TXpMeEw2MTB3NExnaDRuR2dBcThNUFNaZzM0OStOSFp3WjlZWUFvL05EeHNI?=
 =?utf-8?B?ZTV4eEs1MTN2RkJreDdWVUEvV0VrRzZ2b2tQVGplR2wrWlBaUURJQ082N29o?=
 =?utf-8?B?dDRFNVhHd1lRSU1aenlhaVpKSlFKaEdZQjhFMWhwenFYWVYweEVEbFJhWlZP?=
 =?utf-8?B?T1h4Q2ZYZlpJR3pJRzhuQ3pyOFdXSlNxK2wvSkFYcGs0Q04xNE13RktmUFVZ?=
 =?utf-8?B?NVdtVWFsMUR6TmlsR2pZQWk3bUF0ZVVaaFRJYzdSTk1Qa1A5ZXoybjBmQUox?=
 =?utf-8?B?YzM2Vm4vb0R6RnRYS1hFOW82RklNKy9hSnc1VnphRHNFMTAzNVo1MGVWNnZ0?=
 =?utf-8?B?Z1hHdkdNT2pFSTJScVpLTzFsdi84VHRQMndkN3VyRENKKytMckt3NXJlMFVY?=
 =?utf-8?B?WFBGejR1ZGFwVmluNThGU004U2FaUTQ4eUo3Q09pUVRnMFVQckkzak1iaGhH?=
 =?utf-8?B?Sy9SRkRZZyt1ZFJDOU1qeUptY1lPMFcrSGRHMWxnejlyemdxZzFRVWxvMnh1?=
 =?utf-8?B?REpjTkVWTXliOHdkUW94bjI3dllJQS9tQ0ZzOUFuMkM2aWR3bllUc1dJMUdJ?=
 =?utf-8?B?U1M4SU16cCtPY244WEplRzNaVW1mSGZHQ3RmU01LZ1oyRHUvUlJkMURQT1Jx?=
 =?utf-8?B?NjFQVUltejA2S0txUFB2M1pDWXE5SEtuVWFKZUpOWEhHbUZmVFdOemNoVk1w?=
 =?utf-8?B?NG50a25LWkhJSlFlMUVnekxMUUViQ1B1V3J5akVsTDF0SzZCMWlmY0FVMEtC?=
 =?utf-8?Q?UVR2dINiaIt574263C6CkNw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 130c7b1c-9b15-4cc4-7f7f-08dd39342203
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:23:42.9320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5Xdq+4AJPhTeJgUygB54VZMoahYv/ReTrftg1KL5p/RcvMgiZZcQYI4nLQVn//k7MojefJ8/nV4KK3KrbYoWOOP3Q2+DBWubF/ol5ycPo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012346_267984_FC0F8596 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Michael,

On 1/20/25 10:07 AM, Michael Riesch wrote:
> Hi Quentin,
> 
> On 1/16/25 15:47, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The Edgeble NCM6A can have WiFi modules connected and this is handled
>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
>> NCM6A WiFi6 Overlay")).
>>
>> In order to make sure the overlay is still valid in the future, let's
>> add a validation test by applying the overlay on top of the main base
>> at build time.
>>
>> Fixes: 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble NCM6A WiFi6 Overlay")
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   arch/arm64/boot/dts/rockchip/Makefile | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>> index 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..3f92d1a9d0b6efeee46ad4aff8c2b8ed3cb83d73 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -134,7 +134,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
>> @@ -163,3 +162,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>> +
>> +# Overlays
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>> +
> 
> Maybe open a new section "# Compile time tests" or something like that?
> 

The above line is to compile the build-time test of overlay application 
(notice the missing o in the extension). This points at the target below 
(which ends with -dtbs), which does require the dtbo to exist. So 
essentially, they are both for the build-time test of applying (and 
generating) DTBO. I feel like this comment/section would add to the 
confusion? I may have misunderstood what you are suggesting, can you 
provide an example?

Cheers,
Quentin

