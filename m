Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F2CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSaH/xY7KqGMRZY24EQ00COdWciwEaORAZzoxl4vEco=; b=URVeuNjYgFSm+qIAY4YYPE5oX9
	JwfkTZCuBSe6l3QSyEJO4xhQx4Mk8XNTIir1h6OOp0mXYVCkhrDEyoZtBtX8ZsDB9tVinu4sncxUe
	+FFp2s5nbQ10gmModmgFc4U3W0AQTGQr7vHLCewSsEp2exZOa12sRzfv5X/XEHOKcdfYWN+v6qt2r
	NHvCl3lW6lB6emF0vFSM8pH0eaEU/MAMObCBmya71rtwkc6kR72Az90OFrmxo+OBFs8cykJ/iZOqO
	tn7JmT1uDRRbt860CkBHLDzVcZ+oibDVEL2IA1sPYkSwoXXXAPQZMd+qcHTdQWryYlFYvmugBX4jr
	G9DlTaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4258-00000001NJh-46o6;
	Thu, 24 Oct 2024 17:57:11 +0000
Received: from mail-vi1eur02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2607::60f] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41iA-00000001IcN-2GG9;
	Thu, 24 Oct 2024 17:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+j5WY4wo0tRalq3u1C6PbeRuUN8sspaAO78CjZ2GIng/5NNbvMnuZ+UyH7BBOVDFTv9ptxNPYQAR+JKMrahT4Ki0zktGwnZjvONFfsDdlNiNrqBVkefxUlENooHpToU8H5/5oLbYMNPTyS3Pn0BXt4O9BDKD2OQm1J90NDSbMhFipYhxXbO1/hqPmaTFx7Y02Lh2e+GcqOamwuLBiNVtON1itqKvSwVxYpb+3OfkNZDGgQv7m6dXQXvWiTej7wVWu8myWF1MzOE65xERnWE2c++XiHMiKvNTcHV9z2nKEDuW/lYCIHsDmUvQkGvNfnc+Nv3a3GerYBkUkhKfcjMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSaH/xY7KqGMRZY24EQ00COdWciwEaORAZzoxl4vEco=;
 b=t5x1XCIvxlL+fLpF92LVQ9NhJix+LtftH1xdEsWHHMoSY6M3Nktr8Au/3XfqMbUXhHBFv8YJgxXJQxf+n5WDVOqr5+kO+x8emfWl1/Mk4OkRe4QF0lAR8WYzq+Ev8ksmjp0GaBBjH143bWWMsD2e6QHCxaVRMSqUlSru3bnQ6ACks4lllLlNMkKd5J82KgbfBMYJrjdyF/c/WOt/tij2YGqE6IwMYf1Y2gf9JzUY4z0OCspcQYiVlJCVpoV8P6tYB+cCDJjWvHZyzApaD8dGNucKozrS7Dl1X17b0oUVgP8hENlcCxLigIhWCu6bOJdVJjuHJRmHFosGJewwZ3jOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSaH/xY7KqGMRZY24EQ00COdWciwEaORAZzoxl4vEco=;
 b=mW3wl50hNIeYyNmr6TJSTibNK7EBsqUSLBX08mh5yKwDqrLdRfwDuRNgZc0f/Lfkx3vqn7KBaBPeoa6yuGTJw+Prm/GmNi0BaJOXO6FBFLC0dYJg4qOJlzAKL8dck3BSzuPLQMPTx8J2uKRJOMdpL146uQiWPRDJq7xjgG7pzC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7838.eurprd04.prod.outlook.com (2603:10a6:102:cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 17:33:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 17:33:21 +0000
Message-ID: <eb9d14ca-5729-4a63-937d-46ec42ae8ee0@cherry.de>
Date: Thu, 24 Oct 2024 19:33:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: add HDMI support to
 rk3588-jaguar
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241024151403.1748554-1-heiko@sntech.de>
 <20241024151403.1748554-4-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241024151403.1748554-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0287.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f44504-703a-41bb-f489-08dcf451f469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlczcTJRTVROZWJiOTFyY3duemtNeTVDOEx4c2NyMGJTaUtuQjFBdHlYdE9Z?=
 =?utf-8?B?SWJqUngxWXRlQVkwV2prZlFqVGpWRElhQnVNRDBlN2hMWEowYktjWVQ3bmRz?=
 =?utf-8?B?OWNIVWJyYVplaHNTV3grRWlJVjR0SGJwTzg5UGZZdWdzWnZ1WkRWWGVUSWRr?=
 =?utf-8?B?aEVKWlJzUUpOS3ZxOXM1QmowN1FCa2c1QVZxRzNrZzAzRFE4RVF2SnlEQWFl?=
 =?utf-8?B?WDhDMEFjM05PL1ZCczZ5QlFTZ3NiWmxQV0NRTkM5RTgyTVlrZ1o5dWhkeFhE?=
 =?utf-8?B?cmxKY0lybCs4QjZLVmlsd0U5VjAvY01JRGt1RGF4RjdFK1FIcWxHT1EvV2Zt?=
 =?utf-8?B?MUZDcHhSbkJlclU4UGljT0hERS9JRjdxVndSQngrMUtrR0FRcHI0WDhuQ3pH?=
 =?utf-8?B?ZG9FVUJETmFldnhtT1AvcGdQdk52cG14VXg4a2lLNDN3Ry9CejY3aCt2cE5r?=
 =?utf-8?B?SU9abG5UN2FCNE5WQU9NNjFQTlFGLzRyNEs1bEF1aUc4ZzgvT1IwSWYveTlW?=
 =?utf-8?B?RTdnVTVFcndOR09pV0gxWURQOE9NaTJZT3UrdDFJTUI1czIvdlJVVGtvdkJF?=
 =?utf-8?B?WnRxaEE5ZVRFSjR1VmlxOWh6QkxmQ1JsbG9wOGgxZ1dsSzFrTFI3eXJsQVpP?=
 =?utf-8?B?SXFwZ3doY3V0ZEc0Q3JINEpjNytrK2l4MjJpeW1ndkRpdXNZMU9BUUVtaUV4?=
 =?utf-8?B?VzFNNEVBakdtSnNJZ3VBTEZjQ0dMZ0lncThaZU9aeDFFTk9mMVJxci90R0Iy?=
 =?utf-8?B?NjU2dysyRWxHaHFoY3NnQWo0aVNKVGRrU1NuUFU3UUxjU1hhdlVtRWRFcTNi?=
 =?utf-8?B?dk44WHZIVVY1RWZCejdxNnh5c2c1VXRudVVjYkFEbVV2bzU0eWVJNnlLY2Zx?=
 =?utf-8?B?eHpxa2l5cTNJRUpONzRwYjlqN3NMZDljSmpmMFRHWmxxKzdNSTl4c3dweERW?=
 =?utf-8?B?SW5nb1BiZFhTdDYvZXczMkpzb21NaFVhdzRVUnk0Mm1BdGlQVmQxR2tsRS9v?=
 =?utf-8?B?eGVBS2d6T3kzSXdMVy9zOXEvSXR0VkNYV09NaVI3TDdZQmI2S3Bxa1puOGU4?=
 =?utf-8?B?dmdBbFEvRzdFYmN6aUZLS3FVWllUbTBtV0xvS1QwRmo1Z3ptVDRyNGpFMThL?=
 =?utf-8?B?Q1VlQmlaQThPRDBqZGhIU214WWYzOWNPZnphQWQvVzZJdDVSQTU0NUhwUGRH?=
 =?utf-8?B?OWxpNmFVMEJUcGYvckM0eFY2d3gxUmFNSXlCbWovTTZvUGRDOXpuR2xRUTN5?=
 =?utf-8?B?VHYrQ2t0VmtlcUdHVTRPU29LSmhCa2tJZWEvN0l3L3dGb01DK05tYmhtdXNo?=
 =?utf-8?B?WDJpeDhiWVBHSHJkZ3FnODhMR2J4RU5JYkx1dFB0UUxLR3g4ZW1CZ0lyNlRG?=
 =?utf-8?B?WHVCQ3lJWkIyZXIvcW5BdktWbW1nbVJPSE16L1NqQUFiVlpuaXAzV1d3YzRD?=
 =?utf-8?B?RlQyR1RiSkVDZkJJRll5NUpjQXBoU3k3S0twN2d6YjNaL2hWMCtOdEVLNGlv?=
 =?utf-8?B?ZHFNRllOQ0kxeWpqT0F3d0pjZGhGMTRUYTRJYXRHOGQxeFRRZm5LMGxQSzJu?=
 =?utf-8?B?dkdwSUd4eUxZOGcyM3AyYTFscVlXODVKUm5HcmJ4QkNpQ2RZcEp5L0txN1lw?=
 =?utf-8?B?WXhkN0hEYm1XSTFMNFBrNVRCbWlTS0ppa05rOUUwRWtsbDVKejBWNG4xQ1ho?=
 =?utf-8?Q?WvdtUo++UwLU50zrV9qg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZERzYXpndkZKMzM1SFNqSFlZa3VRZGRoY1pyWUVYNlhtYUxXQk5iNkp1SC9s?=
 =?utf-8?B?emxFRFgxWVZhYnpacncwSWVQdDZURk1IZGZRSXZLdlhSVnk4aHl2Y2szTDJq?=
 =?utf-8?B?MS9oQjJKeGx3RmRxSGlHQU4zMmNrQ0N6b3R2WEZ4SG54Zng5a1RxMWJpL0lN?=
 =?utf-8?B?Rjc4c1Z2WWROaGUzMmZocml0MkNXUVQ4RHpPdWVaWHFqaFBjU1luRnMwcFdL?=
 =?utf-8?B?QThZU3N5THpmZXNPbi9mL1FoNXdLRGE0cU91SGgwRUovUTBTdUk0Z3doaVVs?=
 =?utf-8?B?QnZ4ODdQdTl4NytCdlczd1hjNnhuOUs3SjZsQ2dJVFQvZUZGOXhxMVcwS2x6?=
 =?utf-8?B?azRNb2tscE8yVWd4YjdvclE2eTJIZjlRNHAxUlhEUHdVTk5Lam85TGxOeis5?=
 =?utf-8?B?dnZOR0Y0Q25hTVZUWW9IWU1zNXJhdFJGMFhsRnVOT2U0WmhodzlOMHZBcGFP?=
 =?utf-8?B?YU51RWVjVVprTUJucklybjJ0blpOOGtoa2xxcXpidzZOZ0hkWUZiTU8wQ3BE?=
 =?utf-8?B?WVphWjdCaDFWNUxDUnY1eWQzT1dKa09FUXh4TFUwZTJXYWVGd0xQSnBlelNQ?=
 =?utf-8?B?cjhKQjRiamNEbXgyYlFHQ3BoNGx1ZlZzQlN6KzFPdHJGZU1hUURuYXp5TzNq?=
 =?utf-8?B?TEphc3ZoOGJUUlpQR082N1Y5VUdpRCtwOFlJbnRyc1ZDVXVNUDczeW9yZ2dJ?=
 =?utf-8?B?aklUMVNTcHgvNkJWTzZVbmlUcVVHdnhteDI3dmZET01xa253N0NSNlg1MUM3?=
 =?utf-8?B?TEFiSjhBMGZGa2xYVEViMXVBRndsMWt5NFNlcnE2aW1rL005SW1ZNzR5SmVm?=
 =?utf-8?B?VzRBSVlqREx3THROT2l1V1BPeWdCVSs3bVhvMVViVnZaSE9nT0FsTHlZdEkw?=
 =?utf-8?B?cjFzN2t0NGZicXdNVUgyV0l2dFhWZnE3VGlQam1pbXJYK0xwS2R3a2pud0hz?=
 =?utf-8?B?R00vOVVES0RDYUdxSit6OVdJTjNhdE5randIejhpOTZLNDhnV0o2ZmZSSHBl?=
 =?utf-8?B?cWYxV3F6ZTQrcWkyZ3BTc28xN0pjei9qa3dKTFVTb2Y0Z0xkQ1FtYXFRNi9Y?=
 =?utf-8?B?R01pa0xRT2xZdDFrY09ZZTR2S0lWaXRMZTJ5K3VyalAzQnJFcENGNmxDeEVZ?=
 =?utf-8?B?cjFBb3gxZEZ1NFFVZkl4VEZjS1MxOUk3dEk5NDNCZVRhLzhDYm5uN094VERi?=
 =?utf-8?B?RTllZnk5TGw5cmdRUklCeGZxSFkyNUpGc3dHMmhnRGVMM01rckJYNWdHTEpQ?=
 =?utf-8?B?RFFHcWpBeTR5UFNpT2Z4dGZ5eFBDNktSVURLSzRwMFo2QzVUL0xEdEdiUVp2?=
 =?utf-8?B?L3FlZ3VlVGVLZ3diR3JyRjNUSXNaZDM0ajhwVEoxSkl3UnRaNkszRVpCaE9w?=
 =?utf-8?B?T3luSkpNdXBZVEorYnpvanh2bFlKNm9HejU0TDFvUFIwb05CWm1uQVk1MEd1?=
 =?utf-8?B?cjhCNlorK3RJaHpReVR4K0JvV1NwUTRTTDdqVnNUNFBneEVGaW41RUNhRXA0?=
 =?utf-8?B?b3dDRGpWc08ybVhRWjNZQnVPVFM2SCtOU09QcEhNeko5OGlCbkY1d0V3VjhD?=
 =?utf-8?B?SWRXR1NFM0dELzVwdXNzU0UvdTl3OXZlQmtBSmxwTTdLSXBGT0hzUjg5YWJ2?=
 =?utf-8?B?cGo3RFhndHhpYmlOWDRRKzI3Zml2M3F1anNicmZpajZXclg5eW1EMlhiRlVv?=
 =?utf-8?B?RTR3aFpKQnIwM1lDdVhselBTQlF5ZE9xMDltTFhxcVozalMxVzlxTldnbjgw?=
 =?utf-8?B?Y3Rzc2NnTTFtYzlLc0Y5UnZVa0FqQ3RBOSt2cUg3L2FjcnNnaVcrQTM5TmxW?=
 =?utf-8?B?cEJudDVSelpYSk4xNmw4YUdtNDBWWnZhenBCNVgyaTdHMlhKMkNPMWpKellW?=
 =?utf-8?B?UUMwTFFiTEJiRDFDdHFvemxpR1JTdXN3a21BUGNWbm1hUjVlaExNdHQvd1FI?=
 =?utf-8?B?UkdjNW5vZnpUMC9PSlhkWDZiUk8zdi8wQ0Y0NEFBbFFMT3JWYlppcTBDaUFT?=
 =?utf-8?B?Ui9wbnVuODBSc2hLR1lEZW9CK2tZakNUL2c3WW5wK2FPbk5pYjRwRThTY01p?=
 =?utf-8?B?VmQwTDNYa0lrcjhKWnBxS3NmcGtvT1U0dlc0N2dENEluQ2dacXI0bDVKZExX?=
 =?utf-8?B?dGZuUW5xQzJLZWZLMng4SU1HUkNIVHR0dzI2eTFBYk1XZzAvSWc4ZzhVVkdl?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f44504-703a-41bb-f489-08dcf451f469
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:33:21.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brRe2XcAWqrdKnWYa9aAB4AvcVlBmBLLLKORDRujUmUFEUzT127r6JZtH6IWQVGT8TT56QqgSlxq4HXQwp+JaLzY4M6Zkk8UVgbcRYLPoSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_103326_620841_1B1A49BF 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Heiko,

On 10/24/24 5:14 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The jaguar has an hdmi output port, which is connected
> to the hdmi0 controller of the rk3588.
> 
> Add the necessary plumbing to enable it using the recently merged
> hdmi-qp controller.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

I have this Chinese portable HDMI display[1] which doesn't print 
anything at boot but works with modetest. Same behavior can be observed 
on downstream, maybe we can get some people interested in debugging this 
now that it also impacts upstream :)

With a decent, FHD, monitor everything is fine so:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

[1] https://www.amazon.de/dp/B0CKYR6FN5

