Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CA5CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puc1BwmcETixSXKMf1wR7AcOxYjn5jqQsjs/9wNLMW4=; b=G5ZwDKCxR2pud8S9cQlxfbRkOx
	TygubnxoeFeXrQkMPFVc0T6tABa9tmjPnRE9LoxcfHEHUWn/5pjd2Zk5ASx4S3sdm78ocAJu8N9l5
	A10S3LTqQeR8nylmVDFTDGvv4Kv0CiouxDyHXzz/thv+WQEILXkFYFumNYf3fP6aaAZeY9KA0c8mz
	yobfqJ50E04xkJp7Vw+Aw8rsYkwarfVxTdAH1p2KbJS1Bg3AuaPYU1e85zM3ycoQaYmCeYzRmujBy
	SLECpyydabMXM7h24icxYF8tBDDg9vFXfqBPOrt5HA50OLN2ENGng1DfJ0awzv/n5Z0zu1R9ZhTHv
	uR7WYJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVkD-0000000FBuR-0z5i;
	Wed, 07 Jan 2026 15:46:45 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVk8-0000000FBtx-3QPW;
	Wed, 07 Jan 2026 15:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6rTd3nrnefT7Aby6bnRC3+utU0FU9Km2K5c6lKGOSPILTAnpnk4PiXeXeOBxI4sIw+p+nAiD1tytwhCwMpoF626YB9eLh25LHE4/FnEpy+N9QRI+P8jSDR/NXvJutryQzr1yE25qYyf74dTru6u4rast6fLHrf1USGbnKJfJb1mAup0bsye+WjRQcZmqWizYYeOyfYuYZJ5klq1vsEXwKKhR+oj6245YDedL+yhwaDvIgEzcT7/92vipg2vZvt3cxCdbjBjwp3oHp7JbmZa6G3x57niAl6Qf963g5qL2AxdQ8k5v6DI/wIV9IoSRZuoj2f9FXqdUyauhxKRJhfV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puc1BwmcETixSXKMf1wR7AcOxYjn5jqQsjs/9wNLMW4=;
 b=knG903OS3xPVXP+nubOIXBJlws/zQfADkBY3ZKZnFeI+TctyElVhUjckLJ7wszThbzLOa4hVQXLX31YZiYR3KEeEi9bENCIlpuVePklO7Lloy+GgU24BTmfo77u/4r4CPk3bZM5M3NoCaS9kUgB0VKVlOxPFCUZfZLou4VuIfeXtYAoWPDb0ff019ZMKd/0ILqc1wQnxbBJxLqYqOLqqxC+wSmyNnmK3gTYXOdi7dYtoyEAuFQ7JTIIP/w+nWfSGI3NsgfvDpeSLldYP3VjiYL+1oVT7VUlXHltSvcuSagzBENzXIfj5LUQarf5OvX5frJ24NC99dO/6/BdENcLV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puc1BwmcETixSXKMf1wR7AcOxYjn5jqQsjs/9wNLMW4=;
 b=Ew7TQNjw2kkTBg8jl0gEO24nmIjJbQwivc3stioGcYru4LrQgUBfxlP+BSg46IWzprXRNDR4vA1mOlwk9YQGjfNkoIllmQ/WjVFQkIkn+KQXPFb+xB36d1LZAZ/Z2T/VPkLmOGRlhNuIaG7uYDIzHCry92qhP8mhGBJqSVUW2cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10563.eurprd04.prod.outlook.com (2603:10a6:150:221::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 15:46:31 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 15:46:31 +0000
Message-ID: <afe968a0-f14b-423d-81a7-c1046d2b32bb@cherry.de>
Date: Wed, 7 Jan 2026 16:46:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260107070322.323-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3590b287-fd17-4692-bf77-08de4e03edad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ZNZndnTnMxQXlRZlVrU00yTnFmR0pvVlBSQmhzd2FHMTloN08rT2Mya3ZP?=
 =?utf-8?B?NUprOEpObHFEQnBYRHF4T2lZQmlKa293MDM0MDhRZ0E0ZXBGMzNSa2hzb1U1?=
 =?utf-8?B?MHVxREJ4bDJCYVc2MnJxWXZoMmRXMmkzbDV3aEVIeERKVjd4czA5cFo0dFNU?=
 =?utf-8?B?ZlB0d0o3SkxkOUVrUmVCeWtJWmRvV3Bid2VTdHpUa1Qwem5TNldENWpKWDMr?=
 =?utf-8?B?S1FmQlpWenNTN1UzTmE4ZXhrOG5FS251emo2eFBqREtabUlRZjFyZ2toTWVz?=
 =?utf-8?B?SXNvbXFwRVVJeTlzb25JeU9QK0kzNjhNc28raVZyRWs2L0M0VXdhVzRRVnY3?=
 =?utf-8?B?YW94UHJDeFFwUi9sekN0cTJuVDFRR2NpblBoQS9KNythbXh2UTRHN21sdThl?=
 =?utf-8?B?T3BZUUc4M1Q4K041MG0xYXcrY0c1a3RCRlZsRG56SExRaUlVSEVMT1BXTWs3?=
 =?utf-8?B?NnNRWGw0TEJXdWtScjdwa1psZE5NN2xDVUtDYVEzTzh3eFZtUjFLVkxTSko2?=
 =?utf-8?B?NEp1Z01nYzlLaTBNYzRVbjdZdk13d2t4N0xmdml5eHNlUFFubG1vcTRBOE5n?=
 =?utf-8?B?K2tXMEpJejJhSzY0SWt1VlRlQWhHaE94UERQVmZOTFUzc245ZkJTbFczWktw?=
 =?utf-8?B?WW5wTGNLditXZm05R0ZVd3VlNnZCM1E5aGg2c1BTTWVmdG1DQnkvL05oWkpn?=
 =?utf-8?B?RVVnSWtXVWswME82TlVmV3NqazRVRnU1TUpEQXZ0VUpxZWc1RXJqTVNicjBs?=
 =?utf-8?B?bW1YVHF5MTYveGMxUkJMeGlUVmZsRzFZeGVJSmR4UDRYWEdzd1ZINUk2NStq?=
 =?utf-8?B?OUwwWnRHWWttTkFCOEJsUGIrRHV6WkU1eFBENXdaUlgzeldHSjhNb3VVc01X?=
 =?utf-8?B?ZzZSeWk0NW13bWgyS3NmTXppbTlaZlFwT2s0Wi9TUXQ5YUw1V20zUFdrS3g4?=
 =?utf-8?B?VUdFVnlzK3B0ZXlXZzliSlgwWDJjVkRlaGl1dmYvQzBFSDZPRCt3dldvT01z?=
 =?utf-8?B?ZjZmc0JJR0VwVHRDZGMyOXBPQ2tmMWJmZC9DWm1TeEV0RWpuOUdKVFBmN1FQ?=
 =?utf-8?B?alJwY3RhM1E4VnUxeStMQTI4amM0bmZmalVYc3BtY1R1di82VmRWdW9lRU83?=
 =?utf-8?B?UWp1K3NUdDRHeHM2N2R4MnYwTHZLTjdxbXE5RkJ6UDg4UFBvdFlEYVRXcEFG?=
 =?utf-8?B?cVdxbnpQY0RtTUdsOTlxWXdnWk1DeEpIaFp1azYrOUFWWWRmc3ZkWlBlUjZz?=
 =?utf-8?B?UjBWMWFkbm1uMWFPTW8vSVJPMmZiY1VqNHJyakgxL25nSkhBcXIyWDBUc0hB?=
 =?utf-8?B?Myt1ZjlFcFNLUUdRRUdMVGlOd1EvbTk0Rm9uUlk0ejhPZGo4OHU1UkdpL2VB?=
 =?utf-8?B?MThwU2dYK1BNVHpIOU9DczZSTFNyN2o3N3hqblM4bTNyK0dXeUI2ZEtaZHc1?=
 =?utf-8?B?L3NKQXFDVFFNQXFBOWhyRk0rSVpuWU5SalVKOHBIRXZabmFGMFRJNXhONXMz?=
 =?utf-8?B?R1o3MllHK3BSWnJSUENZdmc1ZFdpVU9lMXFFenZHekdMejZJWlJiOFpuWitU?=
 =?utf-8?B?L0w5YitHb054RUlKOFdSS1F5WnNtU28renRXN0NieGJZMk9jTVl0dGZCc0RK?=
 =?utf-8?B?NXJlZVVCdzFCdzVqa2ZKQnVMS0VWeFNqUVgyeXRwbFpKVkhubi9MY05aOThM?=
 =?utf-8?B?djRrWFFXb3VtdFBMdWVMUGZZdzdmcHZCM1lKL0hSYWgwNGg1WEhNUWprQWNN?=
 =?utf-8?B?OGpjTU9VeWN3VlpXQ3B6UnQycCtEb0VWSFhhbmZtT2JKVHBEd2kyS1ZKVEpp?=
 =?utf-8?B?cEF5Y0VOdm9FZDJxNUwyaWY5aDMvN2tKV05HeWorcFM1YmFrb0dJTjduMUdz?=
 =?utf-8?B?Y3p2dGIrM1dGSjRKYnBBb0pCU1dRaFhiUGpYVVVsVWdndTFwd2xFUE50YTVh?=
 =?utf-8?B?WE5uditMKzVyVDdDWkdVQnhDVlhoU2tMWXdkOTU0R2dMV1MzQzJpRUs3OTE4?=
 =?utf-8?Q?HZGrJGion6yOvttUTIn+R+nUWs9tZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk4yRFpOZ29pblVOSzdPb2s2TkNTeWtMNnNrRVBYQkxwdXdFd2hsT3VYOWU4?=
 =?utf-8?B?R0l3amUyY2dFblBQM3pCb3NuUGxRazNrWEhvU2MxQkU3a094Vm0yZ0Z4Z1pE?=
 =?utf-8?B?aHFQaDJKazJTaTU4QkdIWVIycy9yVVZ1TzBjRytuRHNJMG1LeEh1QnV1RTNC?=
 =?utf-8?B?MW42THg5QTFHMUcwa2J6eFI0U3FuOXh5bU9IdlMvenVES3Q1YzV0N2FzYThE?=
 =?utf-8?B?Y3ZpMjhxdnZLOXZQaktwb0Z5STQwZGlwUEhMVmw4eXVMMEltMVN5R2xyVGZY?=
 =?utf-8?B?eTRMc3JDR2l6U3VOcVF6OXFkeWcwQzYxek1KK3NtdzFUcWtSMU1iZFZodjF2?=
 =?utf-8?B?ckY3K0NCME02V045MmF3TTNDZGVzNEFHTnova1MyMklBT2VNbml3TnVMdjZ6?=
 =?utf-8?B?RmxDM0dTV1djY0tKSnJvbUoyTHE4ZURsQmJqcURHR2JpV3lnaTZpY2t5YjVY?=
 =?utf-8?B?MzltemhhYXl1UmJ4NG8yQ3QyTkovZFNRQTQvbmdjMWJOTGg3SmFrT0tVVUNt?=
 =?utf-8?B?RjFpaTdHOGU3OWVDcXVMSlAvTW5uWENLVHZBY2xEZ3lxd3VxM21ZQVBFR0lI?=
 =?utf-8?B?Q3JhTG5RaFQxT082cmxzLzhNTW9veXNSTFpmdzBzS0E5T0UwQTlTamZWN0hG?=
 =?utf-8?B?V2p2RjgySVh5RStXMkgzblQ5bUxkcG00TzZFYTMvb09id3FRRGsvYUFSbXU1?=
 =?utf-8?B?UnlqeFE4NHNTb0Zoa0YzeVJJU1c3QTNHZGpNUEh5MDdEeDk4U0RYak0wZUpr?=
 =?utf-8?B?RTFHeFZYS0hHZnZMWlVTSWc4UFFwRWtIVnlRaFhKMnJIVlZleC9vWkY3TS8r?=
 =?utf-8?B?WGdtSUFMWmNyeFFhU3Z1c3U4bjdVdUgwbDErMXFGdkVGUE5GRU5CZ1BMdGZR?=
 =?utf-8?B?TStvaHBSSkxSdWJTR2NGN05wYUh5czAreW9pZThpTDFHNTFhL0EzU0pqOVpK?=
 =?utf-8?B?eUE5dTlmcEQ3ejY1UnVXdjMvMEJiS04xcGlLNHZ6azJZVWk4czZqQkZXaUht?=
 =?utf-8?B?TzA2bE43UjZVVVZxOVlXak9UTzBOalVpQ2swaUV0NktUMzd4M2Y3UDdNSEN2?=
 =?utf-8?B?ZG0vUUxUSks4VDVNM3phZlZ1cDRMMkFkVU9qYlFqTW8yL1p3MjU3Ly8vSnNn?=
 =?utf-8?B?SGNMeWdDbnhPZEN6YnpMVWU3WkpkT2l4WHFFQmdBdnNpOS8yWk5FYkhsZ2xG?=
 =?utf-8?B?eFpQVFh6NUp1aHdIY0NOVVhzTnhURnZvSkUzdUNhbjNHVVF2TlltQXZPam5m?=
 =?utf-8?B?QW1ueVJXVlZZY3lZV1R1MFlaRXlRMGpsZXBjQzRlS2s4YmNwMzVVZkQvT2NC?=
 =?utf-8?B?WkpoemJFOU5NaHdWNTJTTXhXcTBtWStBUWRpY1ZVTzBib3Z1cW93TWdxUWIz?=
 =?utf-8?B?UDRFalNTQzdIR2RMWlVkZE04WUdST2xyUkVmSVBXVklNWDBpVlZ5SzZZNExQ?=
 =?utf-8?B?dll4cC95VCtwQi9DTE5nekV2QTJHUkcvRWpvczZGQWJyZFBJcEhlOGkyVjM5?=
 =?utf-8?B?ZFpBNTZJZWZnUXk0enRDK1NLclNIbUdBam5TcURjY2gvUmlzK3NRNTU2VlNH?=
 =?utf-8?B?SnJTdzBSMTI5VXZ6RE45UDJnQyt0a081SW9VWjFDczlTZUhaSlA2emhETWJO?=
 =?utf-8?B?ei8vN2NZT3g5b3oxaXJMSERzVStkQ1plRnVFRjRrRWFoRXhBeWpuR0hTZlZ4?=
 =?utf-8?B?aGhYS3BGdjIxWVU3WDdSRGlRdXNZLzN6M0pscUlMSndqejZ0a29CNStqc1lW?=
 =?utf-8?B?bklVM1lyd1BZRGVmN05NeWRsMW1TbG1wdFFreUgzNllmWnpMS1pRcTFGdXJ1?=
 =?utf-8?B?VTFXZkQzVkpVSHJrR2tONzdFUEkvU2ZqUGlubTVONk5mL2YyMW9kMzlhSlhr?=
 =?utf-8?B?TEZ3MUp0RU5RQzlmWXNtRGduOWh3V0hRdk0raGxqL2RyZ2pzVC9oV1JraEQx?=
 =?utf-8?B?ci9zc1d6cWVRUGM0Y0lrd1c4SEpZTlU5bWFxOVBiWVhORlVZV0FVdDVnQ3JL?=
 =?utf-8?B?ckY2U2Y3VldiSi9CV29QcFpZUjRmZmhCSy9jMWRJTU1uYWMwYlRUWC9WUTJD?=
 =?utf-8?B?NHpEZDlWSHMvMlg3dk9rY1lYNWZjUmtZM1ppdVArN2hXMzFwQUFrWnVQcCtX?=
 =?utf-8?B?aytQZkduQWMwVGJSbFlua1NoS1BscFFEd2hJdzN5QXYxRFQvMkVXdnZpZitP?=
 =?utf-8?B?WlA5d3JteER4aE9wTHgyVDNQWm15a2NNUlZWUkNlUjIxZUI1d3JpUTIrWEFa?=
 =?utf-8?B?eE9FdnlpRkRJWTM3YmY1aTI5d0FSNExBWHNVRkF2ampvMEZLQ042dzJhUER0?=
 =?utf-8?B?bmxZWUlaYU50TWJxNGorQnFBcktyZFJCY0ZPZDNXQjRkWk1VM05ldz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3590b287-fd17-4692-bf77-08de4e03edad
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:46:31.3615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEkTrW80//Dpyy//gI5ZPeQhZrXxUbOB4OmGxEeEQRLrTfE+yYYrLXP2sj50pSQhmO0M36rBEvaisUEt4nZ3fZdGmPMkELTHU+AlS0EfClQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_074641_191428_3EF4DE02 
X-CRM114-Status: GOOD (  21.19  )
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

Hi Chaoyi,

On 1/7/26 8:03 AM, Chaoyi Chen wrote:
[...]
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
> new file mode 100644
> index 000000000000..52788c514ec0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
> @@ -0,0 +1,997 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3576 EVB2 V10 Board";
> +	compatible = "rockchip,rk3576-evb2-v10", "rockchip,rk3576";
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
> +	chosen: chosen {

Why a label here?

There are also many other instances of nodes being labelled but whose 
label is never used. I would understand for some if you want to have 
DTSOs working with this DTB, but here chosen really doesn't make much 
sense to me?

> +		stdout-path = "serial0:1500000n8";
> +	};
> +
> +	adc_keys: adc-keys {

Are we expecting to extend this node from another DT? Why the label?

Won't comment on all other labeled-but-no-phandle-use instances, please 
check.

> +	vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_rtc_s5";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_sys>;

If this is for the rtc, shouldn't we declare this dependency in the RTC 
device node and not have it always-on?

> +	};
> +
> +	vcc3v3_sata_pwren: vcc3v3-sata-pwren {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_sata_pwren";
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;

Why do we have this always-on? Seems like we're missing a dependency on 
this regulator in the SATA controller?

> +		gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&satapm_pwren>;
> +	};
> +
> +	vcc5v0_device: regulator-vcc5v0-device {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_device";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +		gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc5v0_device>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwren>;
> +	};
> +

I assume both of the above are related to USB operating in host or 
device mode? Maybe there's a way to have something more useful to the 
user in regulator-name (and possibly the regulator node name) so that 
they have an idea what this pertains to?

Additionally, why is this always-on? I would assume the USB controller 
is capable of controlling its regulator(s)?

[...]

> +	vcc_ufs_s0: regulator-vcc-ufs-s0 {

We also have another regulator for UFS that is mentioned in the UFS 
controller node but not this one, why?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_ufs_s0";
> +		regulator-boot-on;
> +		regulator-always-on;

Why always on?

[...]

> +&mdio0 {
> +	rgmii_phy0: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id4f51.e91b";

Is MDIO auto-detection broken such that you need to specify the PHY 
vendor and product id? Which PHY is that? Why can't you use c22 or c45 
compatible? A comment would be nice.

> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rgmii_phy0_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id4f51.e91b";

Ditto.

[...]

> +&sdhci {
> +	bus-width = <8>;
> +	full-pwr-cycle-in-suspend;
> +	max-frequency = <200000000>;

Already that value in rk3576.dtsi.

> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;

Already that value in rk3576.dtsi.

> +	no-sdio;
> +	no-mmc;
> +	sd-uhs-sdr104;
> +	vqmmc-supply = <&vccio_sd_s0>;
> +	status = "okay";
> +};
> +
> +&saradc {

This is not alphabetically sorted, it should be before &sata0.

[...]

> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		clocks = <&hym8563>;
> +		clock-names = "lpo";
> +		device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
> +		pinctrl-names = "default";
> +		shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;

Is this GPIO only controlling Bluetooth or also WiFi? I've seen a few 
combo chips where there's a common GPIO that controls both WiFi and 
Bluetooth. Making this bluetooth-specific means we need Bluetooth on for 
WiFi to work, a bit unexpected and should probably be modeled another way.

Cheers,
Quentin

