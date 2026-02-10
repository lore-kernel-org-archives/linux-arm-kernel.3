Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB2EA3F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grzYIDudz97WY/TQjZ2Bln+aP1w0qLcaxCKKUGDxnxU=; b=UGwbsQd2GTiEXQl/mtur0i9XUX
	C2QVrhdKum/MweRGUh+9IqKS6FJMJb84AJogW9g+ZvlAkkQYQELcnRRwpN6bMktbbJnV5Dhj2fBCW
	bQSAa34L7Axp9slp3S8r5vEQFBIGNzQmp7a+KlaoJGrsgmLqQNxKEa8byY/KszA1opYikzAxUdrIa
	VT7bPke4hWDV34GXiPKSQTbRIqESkyUUO/fukzNHvBwSCzWPteNLX4umtFOhdCpD0+Dr/PtmNnHkm
	PYr1mmeX7f6RWa4JZLgu3aMjsPZnXQsmJjgFcwXBSUd/2XLHrvkW3ExIMfgkTU7O+l/TLmKDcBpwJ
	nx4iYCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGC-0000000GlQW-2YU3;
	Tue, 10 Feb 2026 09:42:20 +0000
Received: from mail-francecentralazon11013027.outbound.protection.outlook.com ([40.107.162.27] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGA-0000000GlPB-3ezV;
	Tue, 10 Feb 2026 09:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HR3bZsnO970Sj/jTAkQxICfq6ew26qu+WaOHVIMq+do1d6JZBf2D3YoFKX72jBo9+AD8NJLbaz2FVmQBlZCje8WVI4xQ6+tGOgMmdWxSWDsZEtJriOEBg8BA+14EDx7yXqd9mY5yCTAtgYP5z4rg3d6VZ1l6eRj5X5nzGj1E/ZpSYrtzG3SqqfrJEwN2wuvejsid3MmIplKjLY2T7EW6wXC8Wk45DjD8qaObL6Y89IK2up/fETmdO77Y+5c+Inskl88fjQ4w6rLReiOA7/Egwr8odRj5FOodf8zHluhUgMFC3YcncFcpRBCD1s1W3T68RMU8ln/QM05eEbNxJcju0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grzYIDudz97WY/TQjZ2Bln+aP1w0qLcaxCKKUGDxnxU=;
 b=PYOSjUZ+pgJ8m5D0PxlTljILXDVg5rWq4m5uWvv2riTYaWjPjCy4lvtTpU9FJlEanbAFeTgVZnrmLsIqTDFTEuXOfQkCaBp9VuWkbwvut1sMRkuo4l17yqn420HXV27aAg2TUs9grGdDGABjflgk0EyLYDaBCb7JkG5IBDwM/QuvvVwNtWo1rYjDzbbqwLheW6dtHE1W2Fqz0xwPBqQ9kJF3ghgGiCdZYrAa+CAW54jLX1M58e3K4SDUVVaosmmNaNabLKnyIDFK3k/Sc9YmqBibskOM9tfKns6hSW9Qh8bHDi+QAYk2PDzqj4gEqjpOD3sWUyhreNGumk9zuM3fvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grzYIDudz97WY/TQjZ2Bln+aP1w0qLcaxCKKUGDxnxU=;
 b=GIUVyd552p3i9x3RpRb0xsi63YBNk3bgX4rIgg2tMSAUq3WPcRrOg7VK3n7X1XSfW2MIiWqEV4FIqwnwnbOehsl+XHMWp8L9bRFNYIU6JKWnxs7fUWBt5S2ZdLa8SvkRKghuUotGtShgeSsKHVCMkUUjL3gyK2bfYpDtTz4I6Dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB11217.eurprd04.prod.outlook.com (2603:10a6:800:29a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 09:42:00 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:41:59 +0000
Message-ID: <7c471efb-045b-43e9-9b52-c5367ff79946@cherry.de>
Date: Tue, 10 Feb 2026 10:41:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: use gated-fixed-clock for
 pcie-refclk on rk3588-tiger
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260210080303.680403-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB11217:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dca2f5-7c17-4006-7721-08de6888a2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0dETkJJVG5DYlhtcEJPMWtrWGc2OUdoSERKelVCV1huMC9VZ1VneWMrVXRa?=
 =?utf-8?B?OTVnT09ER2h3NVhxdmdpRWJzMGpYZTFWbVV4czBUMVAyNFRsblpnZzZYRmtw?=
 =?utf-8?B?WWJrclUrbDI4RnRrRlNtcGJVYXdLMzhtSFRqNVBxbEtaK25QbUVOZ0lsa0xr?=
 =?utf-8?B?OHJTcUZocG9hTktPYTZYNG12b1JWcmV5QmJ4S1J1S090NHNtcW5HRGNYUGJz?=
 =?utf-8?B?Q0JUd1FSRklQUmhnbnlvUDc2bmtwZDUyTFV6bHV3S3pNU01zZCsvVys2Tm9y?=
 =?utf-8?B?dlBZZC9zczdRSkZvZzgzQ1loZ20wbjZqeTB3emtnNFdTclFZTDNKaGJWME43?=
 =?utf-8?B?SmFMeFBjZ3ZLTHNlS1NETkN0Mk9XbHo1a3R3dzEvUHg3blR3OE1SZ0xLeW1k?=
 =?utf-8?B?RzJSSjZmYnBja1B0L3NJbnpkbElzbE1JN2M3YVRJUldFazA2QUQxQkVFTEll?=
 =?utf-8?B?dVl6cXR0c1c4eU1zRFFGdDBISHNaVlJPQks3Yld1SHFMRUFLUGo1OHBuOHpx?=
 =?utf-8?B?QnFxMlJ4SVhKZ2tkaFRFZ2hKU3Z3NlZ1WWY0WUtVUEVXdlc2c0llZHJhdkpn?=
 =?utf-8?B?NUladHp4L0hvODdQT0xxakxOeXoyeUJsRVRPMzdLbW5IVWozdDdQQWdPWkhV?=
 =?utf-8?B?OWtPSlY2T3pLRkxmVXpKRVJxY3duL3JLK29hd2UySnZ0WlRicXRYVjVxOEgz?=
 =?utf-8?B?am9ueWl4dDZaVnV2clVGTnhSM1lSQ0pFUGZlWlZvSzFtMHVqbUQwL0QwWjlE?=
 =?utf-8?B?MG9yeU5qeHpjaTc5M3EvOHkxY2dwZCtvNXhaOHc1cmlNQm9IKzhjdGFld2hi?=
 =?utf-8?B?ZU5BSytnM2NhVittbUZZa1lDcUdWQXNsNXc1blUyODhteGZGcG1aOGt4aldY?=
 =?utf-8?B?WDBkNDJHWUU4c0NUS040THp5VlpWbElkTDhEVWRqLzAzWitPcTk4ZEEyR2VX?=
 =?utf-8?B?aHA4OUhaaG5sem93NlMzc21DYzZkWExySWlZNnFEYlJoeHJNVnFXNTRsREVu?=
 =?utf-8?B?ZjlETVE5RXBZWjYyNmtLcDRQNnN0VVNKRUo4NTRHeTJoRHd6QVdRRDJOU1Nm?=
 =?utf-8?B?ZWtUemt1ZlZQb2dmYURhaDBCdVBFNWxrdXAxT3FFUkt6OFkyQjdXYXhtY3Br?=
 =?utf-8?B?UVRSS2VGWkJtVGorTklGSGIzUmdsSitXdGFKdTRSQ0g4eEtlUWR6QUF2eHF6?=
 =?utf-8?B?Z0tiMXZ6VVc1MTNyelg1bGRhakJ6MU8vR0pvWFg1Rk1sOUFYVHdvdk1LR3F2?=
 =?utf-8?B?bTNsTjM3TjlEM2tvYzA3ZnJQTEhSVWVFQ0dVajRya3BZVGhRRENtMWNoTnVp?=
 =?utf-8?B?ekdwQVVWaWFwVWt0ZUdKV0hJZmNIc1Y0Vko0bEpRT3hQbUlxVklVcXlTSWZo?=
 =?utf-8?B?a3Rra0l0RHZ5aGcxNDQrazE1bUY3U0pFY2tHTWVyUE4rTlJ1TGZodzMyektV?=
 =?utf-8?B?aDIrTFo3SE5GY2FubUVPN3NzNkFNQ2NpenZWRFAyZlpRa2RNTTQ5ajU5THp0?=
 =?utf-8?B?S2h0RlhqblQvNTEvUzhTbjlqajVsQXE1aDJmZDNBUS9qVUtGUklpNGp4NGZH?=
 =?utf-8?B?WDB2RU9LRm9kN3Fid3VVQTBoK1JMN3NPcWQ0RzJFSHF6TTRnRXhGUjBUQU5G?=
 =?utf-8?B?b3E1L3AzK0ZVNTBrb3NYNGQxYm1Zd1BhcTdtY2pYMkh3d3RvZ0JCOWQrMzBH?=
 =?utf-8?B?emlYRk9zVFpMT21GdEw1Z3dKRU1xcys5Sm5pQTFhNEE0dzhvUE15emxudkJK?=
 =?utf-8?B?V3NXWnZrUVNOaU5rMHZkR0pNYWFhR0twL0taRDRhVkhqempWb3Y4cnlBMUdU?=
 =?utf-8?B?eEYzaGdyLzFzVjRxcWUvZm9BTUJBZnhmaVhXK3FuV1BZWkxEV2NETWtwbzZ6?=
 =?utf-8?B?bnNGY25uUFlmOUtLWUMxc1dvRkxIb0NLcU5sQzVlMmRORHZ3NzMyZmZXVk9Q?=
 =?utf-8?B?bzk5cmVWcGpQTW51T0RoNnp4OG96VFUrempSUENqNGpDRXRBVHJqTUZDaVJC?=
 =?utf-8?B?NDV0SFBWdFFOeE9mZU5iVDJVNE0xeC9mYlZqOEl2bmIzSXI0TXRJTkl2Y1hJ?=
 =?utf-8?B?MXR0VVBla3BPQWI4eDJ3TzRCVkwzdFNjcjdTSkhkQU00MVRRUllEY21kSHk2?=
 =?utf-8?Q?Lirc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnVJRlZjNVJPeTdUa3B4R01MNzZLWGFDalZzMUYzMnR2aE9vZHI0RnBnNGdu?=
 =?utf-8?B?VWtYQk95RlJMWmN2MG1TL1c4Q1pVUGYwamp3cng1ejEyY1ZMOUF3Z2RndEFM?=
 =?utf-8?B?WEtDRWl2aUw5bU0xallzNEFPalZOODl5VGhUWlBzYkxVVU1rWC82YlF1UkRr?=
 =?utf-8?B?dnJZcy9tYkpzbXl4VkQzbFBWYWg1ZmIzNUNJMzczTVE0cmJlS1l0YUY1REln?=
 =?utf-8?B?MDlubUpCNWhXZXV6dSt0RmRkMlpMbnlrajE4YUhVZkVreS9taG9KbXBJWWx3?=
 =?utf-8?B?MHBEZFRSNk84S0Z3NVFWaEFPYlJDeUk0c0c0YXpCbXRLRkl4UHFrMy9OUVpW?=
 =?utf-8?B?UFgxWkRwekt0NGc4OU9hbG1maldzMVhNL2o1NDB2ckFjNnhHYUtBbzRmdGJJ?=
 =?utf-8?B?dW40T0wwNmxNYkxFZXAxUndSM0ZDeEZHVWoxRzl2RE5pVnZSQWV4TU1nUWxh?=
 =?utf-8?B?THl3ZGVCYnZETHA3alA1VnJhSFNCdmRTaFZwdmNrZ2FMTTJoRk9sYXA2UG50?=
 =?utf-8?B?VEJ5aHFNbElZZHhoa2lCdU9DQmt4eDVSRVhLNVN4WVVEVENjZzk5MkpNYnJq?=
 =?utf-8?B?dnc4bnhUN1pkK2VseUlGbjN5cG9wWU5iQ2FUb3l2RmxmU2V1OVV1SnRTRU5V?=
 =?utf-8?B?dGJoVkZPbCtpZjhBdnFMODdBMVN3Y1BubkJDNWpoRWV6ZWY4dDF4L2RqbGZG?=
 =?utf-8?B?bHBUOFhGbitmZ2RtSW9INm1iYzZ1Y2FybGlRWTN1SFo1cnN2ZzAyQWdDMDB1?=
 =?utf-8?B?WDI4UUxQOEs3cDFuSXVTa1p6NS9vMGRrR0R0ZUtIY2hESU9MeFo3bmpBUkRx?=
 =?utf-8?B?b2RsWVBCMFRiOHRaMWx6WmRGNFZEZXcyQngybU41RDdaK3JzZHUzUVBXTkJN?=
 =?utf-8?B?UE5qZGRqMVRzU0MvWXA1TnVHdnBPSDN5ZzcwMUZBR1B6ZGxqb2FEeS9NbVp3?=
 =?utf-8?B?dytlSmZ4YmEwVHF6c2dJdnZIbCszTmpxZThuUUhPZDJha1ZrZlUrNGdScVRY?=
 =?utf-8?B?NklHTnFwWWhuL3l1YzBiMkZKcWpmMzBCSTIwMDFyY2xaS1ppVkh4cXF3Yk9t?=
 =?utf-8?B?eWJjSnZSczlkYmgrRHY4YlV4TXorckZsQ0xqNHR4cmhCZGxZYmRmMUJyaU5H?=
 =?utf-8?B?cjY5MDhIblZ3Tm4wcHB3UWpJSGtHd2Q1N2hYd2dNbXdwaHlZRHBvSjNOd3Rk?=
 =?utf-8?B?ZDhmN3hBQlRHVFM5eEgzYlprR00zSlhFeTZlaTR1T0lMMFcrZFRiZ0JPa0I4?=
 =?utf-8?B?bElhenFUYmxscHBDWVBBa3EwVWI5eXE3TzZkNlQ4S0Z6NWJ6SzNrVkNFVDNF?=
 =?utf-8?B?RVBBQzVURFdyTHdVSlZwc0czbm02WUhQN2xwcGIxRWt1dndsU2ZpWmtDczIy?=
 =?utf-8?B?SWxTUnlEUElOWm1BYjZxbi9PNlZHdUlWNVFlaGUyUGtRZ0JLejU2Z2ExSWx6?=
 =?utf-8?B?L1FZYWRBbmRKTkhiNGtCVWJuZEczQVVxTnZKMlRIN282ZVM5TTR3RVZsQUV6?=
 =?utf-8?B?NVVhaWRoR3RPTkpXdzVFVHIyZzZ2ZVg5NDlvdXdueEdnOHhaWmlQTG53USt1?=
 =?utf-8?B?Zk9NR0JuYm10U1k1Slg3Ykd4QUt1OW1EclhOYU4vL0lWNCt3Um5XL1M0SXh4?=
 =?utf-8?B?MUFGeWRmOWZsZHVGbkFEeTk0VjRicUFzQnM3Y28rcDVsOVJQU2kxZVh1eFFT?=
 =?utf-8?B?UE5LYWZlTEUyZEhXOE1lbnM3U0VYR0ZKN0lHM0tiQjdBQ0FKVDNnM3ROMngx?=
 =?utf-8?B?RkFkbTE5ZzRRdlVRQXIzNGpDVWFmSDdkRlRhcnZCc0hFN1VvSlZTTUZwVGNG?=
 =?utf-8?B?SDdRRkg2VFRyQ1RZNGFVUkVTakZlWENpS0R5QU5BMWFibFhhb1Z0b3pSUzkv?=
 =?utf-8?B?QmJYcUpoSU9aM01QcFJFRWlNMlFNUktIdzdlODE4dHFqUXgzS0sxODh5VWlC?=
 =?utf-8?B?K3FYL3ZJdmNrWkltLyswM1BJeHVvcWlZdjdOZkJ2Qk5LSFFBRGt2RmxOUDdV?=
 =?utf-8?B?djA5bFJWQWYxMnlsK3hrK3NXVTBQSlZ6dHNXVU5aaHRwZFQxRU8wYW1aTEtj?=
 =?utf-8?B?Zy85SGhKN25FQjEvVkZCRzlnbHpMWGZjYjBvM3NHd0E0bEtTNzVqMFprdEpV?=
 =?utf-8?B?eG1yTWZXQ2FCN2NHeWc1ZVdPS25RVm5Qby9oNlhQdk1rdmF6a2Y2cnZVaFlL?=
 =?utf-8?B?cjJDNGlTQkhla0kzRGM3eXFEdWhseG9URkxkOVpoRHBXS29hRG1GaEJJelpU?=
 =?utf-8?B?Yk1pMG1JdUdkSzVKUlkxZEw5UlVDTC9mVXFhRGpmSVYwMkhBZlpCbmc0c1RW?=
 =?utf-8?B?bzlSdjF5c3VJem5ySDlVTzB6T0c3QWRoTmJyR0l0dkwzY09EU01WRXFQbkVT?=
 =?utf-8?Q?XrWl/budO5ekIdiALHKfuWICy2fCh12weZSv8?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dca2f5-7c17-4006-7721-08de6888a2f4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:41:59.3775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9vlYmKZxdTDnSxL4Hp6YYYktrKAbv5xkmTv1Ro4DMIBM70pYMjlmU5MqpNWpPqkQtl+zuvntPj5QPPH2ULn8XuIzuT3q6SBF2rZJ/qOuYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014218_941157_EAA45C48 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 2/10/26 9:03 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using a combination of fixed clock and gpio-gate clock works but does
> not describe the actual hardware. Use the gated-fixed-clock binding
> to describe this in a nicer way.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

