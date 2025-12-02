Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD3AD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14RUAvOWzFtvJ29i1eaQehMnJb9CjHoRaNTouD1Mo44=; b=nhEq+nOJRjt+oUWzShzOdUOROJ
	PPfABTkquaiilNiRa/BPGae4mqnH1+wbTF9/2UPUf+eE0tzUNiqdRdIlISQD/fJ1ET2nyzfvgRD8P
	xxAl98/Wl1cKQbZGr3rCKe9UETPwQW5K6f+J4lkYxQChuaNZf5Gfw53k3RgzMwY4BQ0ll8/3KSLgX
	kB941APotXeYaD3kwJ89g7n4dO3LKXvEynzWVn9xTihucEYI6lGFjP1I5VClhwf4QYwbp97nABwt6
	tcmxxwYFV7hEtJdn3py5HzT4zkINjR9hc+1BUObIbTyuQePVaUDbZA1lJ1xFgbva/bG7BogeB4Q8l
	SPWJxJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQbH-00000005S4q-2VYO;
	Tue, 02 Dec 2025 13:39:27 +0000
Received: from mail-swedencentralazon11013037.outbound.protection.outlook.com ([52.101.83.37] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQbE-00000005S33-0KYo;
	Tue, 02 Dec 2025 13:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH48wm3ygOC6JHVcdvvKD9MXmOiBUahApz53KZWdramme+MA5IoZMph9DlQ2qnf8AmHZk5zHTAvScbmzx05o8nAfPWuO9pox3ujUYzOyIKkvz6SbcDtJq/kQKJHFct0UFVQHmdJdsPsT17tcRlZSsfN0eXnkXYGdkoDUl59Z9jb4p6KjEmrN91cCDIQN7Jx7LeaJcNga3/5eAQ6m6GkJkCzhcaaY8ABM27FGb2rZuocwBg6Kk4y/3TNEiwjhML6K/o+H5/C9xhYSC9pxlVk6W25WbYqYggFvc0h/QwwKmOvO39A3sAI6dM7JTgSkBn9xay0r4SNKfAVEu7kXmrwhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14RUAvOWzFtvJ29i1eaQehMnJb9CjHoRaNTouD1Mo44=;
 b=wxq4+b7YluQA1TJXtpkLCnzenOiGSdB7g8X+raHpB7b2h3qPuY93RJQic+XCGWXy+mo/7jKWkKdOdW8Wb/oIl2O9J8/Nh9UGaNdHHywGtOjjwpP4BnH0PDxfHFsyBWGF/X1PaAArkYKXuIsYjru+x+FYR6CGt32ElDAViBtnrC+EhyWfPRzHcpNBvXIRtqD40i3+4JsVO8noFFkBWmTvHRm54QhdznFk4620sGtDoVjDuX8kJ+tcgHEhhJWocO8j7yJoRNBzsGIio1F3s7iTZJywffQ9FEm9auFiwkzqoJnNikXu9nMWlJEB8eB17a4okbwRVIpnhqOPRtVuXQVm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14RUAvOWzFtvJ29i1eaQehMnJb9CjHoRaNTouD1Mo44=;
 b=AMW+XEuXfoV/nTMGXbdf43CEjoT5dn3XesbTMtf4yDHwEB89tEVXEdg9LZBQJTvw/GsoFUA7IX3Mzgq5ZmKEk4jzihD3EwqboDGQJLYymcOA9sZge/PwTQuyBIEVm9I1DCwn8UEuKiEmOCl/5DrF3kOB+VQ10tz8h5weJFyqIzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB7572.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 13:39:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 13:39:16 +0000
Message-ID: <ae0d2de5-4fc8-492c-8d46-8d90118c5e64@cherry.de>
Date: Tue, 2 Dec 2025 14:37:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: rockchip: Add the Video-Demo overlay
 for Lion Haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-10-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-10-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 072e60af-f0bb-4dfa-b55c-08de31a8302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWRiN0JUbEV6K001dmdBVDcvQlJuemlzZzF0dUVlYnF3M1hycndicE45L0du?=
 =?utf-8?B?Q0NwNm1ncXJCejhnbHR4eUs3Z3VWWUtVUW5QTStodit6NTdqaTUzTnVGMmwr?=
 =?utf-8?B?WjJ3UGxwTkJIblB2WUo5dzVRaDJraTcxSzRUSTNGWjRWQkJTMGI2YkRhTkFV?=
 =?utf-8?B?S3k1SHM1Y2IyVWpPTWhoYm9iMWNtS0dMM2hLQXVCQ0oxZUFuOTdJNnd4NGg0?=
 =?utf-8?B?RXZ1bDFkVkU1a0FibWxZK2MrT3JMdERxeGV2U21TZ1NMVVloTUpLajMwMGZn?=
 =?utf-8?B?Y0V5emhBbGxtWGV0aDhPSFpGMVRSajdoeSs2OG52czlvMUZRYkhxZ0IvajNy?=
 =?utf-8?B?VVEzMTNlUFRGOFhKTjkxcHhhaGVlVGpIT0lwRGdxOEhydWVTSDhTbml4dnFa?=
 =?utf-8?B?M2VEZnhwK1JCOHBUZFNLTXA0SkkyNFkxOTlWZTM5ZkhqYW9sMjVSUmxzY3N0?=
 =?utf-8?B?MVZBMTI2L0YxUWpjamVNRVdEelJZb05hMkhHR2pkSHB5ZG9aZFBpTiszcTZn?=
 =?utf-8?B?bzJGWEc0NXE4aWJIYWNNc0I1NHY3R21NcVlpVWh6cVVVbDhJNjAvVUQ3VVJT?=
 =?utf-8?B?NTBoN1o0SUdnUnRERkQ2MDhrOVA5NkJTdlFvaGQ3MU40dlk2bm5oSlVkWWMx?=
 =?utf-8?B?Q3VTZUhVZU1BbFZENnY5UWxaZWk0bVpzS3UrYUljTEZlNk85bmZHVXpXK1ZJ?=
 =?utf-8?B?OXZ1WkRUUy8yeTVaYnFWYlZhbDkySW9GaDczaU9CeXdkTExuSU9Sd2k4NWxa?=
 =?utf-8?B?cUkxZXh1OGZZUDcxYkx5OEh3UExubWdPNTBJWnVKT3BDVFB2R3l4RnVlZWgy?=
 =?utf-8?B?K0pXTUd1Qkd5OEtDUXlYckQxVk1NU200MXhsVjNPSjFvUDdpRVJiSG5pVXBn?=
 =?utf-8?B?T3VrSUwxNTlrdFpkUFljcUhyRmkzU3prcSsrcWtncXQwY0pIYVpSMFlFMmZN?=
 =?utf-8?B?QUpMb0kzMDRpYnVpNkhZZnNOc3ZZZXl3dDlhY1JRY0NHNjhpdTNFVnVvRU9Q?=
 =?utf-8?B?WUw4VXVkN1BmL3o1K1kzSHJZeTZpWWJlVlpNd0ZKWllvK0FjazhyWEprVVVO?=
 =?utf-8?B?NVIrWlBSVjFwak5oYW5pMWRvUFl1TFYra1dab2k4bjBFc0txTG5LRFRWNGlJ?=
 =?utf-8?B?MWJQMitrK0EwY3VOSWNLVGVZUGl1U3dCMDRKcDdUMWY5dTV3YmZMNDhoQUc4?=
 =?utf-8?B?N0dHdWI0bjcrQ3p4WVlSRm1EZmFxUEJncFkveUpkcm5RMmpnRFJXQkwrdml0?=
 =?utf-8?B?VXJWWWVGNUI3dXVZZWxCcUxIV3V3bzFzWWFXTlVaeGV1QzBnZmNpVnE4cTlD?=
 =?utf-8?B?Q2RoQTljeUNkcEljdXRtMmY4Q1ZKeGtnRXlIV1lHV0xSeVp1R28rZUM1UE40?=
 =?utf-8?B?Z01taGhUNHRTSDBOVTdIdE1zYXZuc3MyUGY1cDRoZmVHWFlDdTcvOUdBT1hU?=
 =?utf-8?B?NVlIcytwSitMMUp4czJGOUQ3Z1ltRFRXVFFHdXpyY0tYSTdSSWhPNUN0Mlgv?=
 =?utf-8?B?cmh3TTQrN1VkVE54S1ZpTUZPbGw4L3I4dTVlbnNPY2R4SkFpc0pmb0ZZZkV1?=
 =?utf-8?B?aWk1Q3JPNG0rdUsvTE43dy8xZk9hbU02QU4rZEwzeEpsYkFsRHRBM09INStl?=
 =?utf-8?B?SGM3d3VvcUxObjBiVDNCeFNuVnBaUTJKbG1SOWJja1RVVU1mcUk2M2k4STFn?=
 =?utf-8?B?Ui9Id3YvZU5rOTZUZXhKRFIvMHFxZE1TcE9mQnhidTVlU3NZRlg0NlkweXRK?=
 =?utf-8?B?dXY5L3JIaWRDZ29IRnZRUisvNzF0U1VGOC9QNHhmeVZoRHJkT0NoOHdkWFlt?=
 =?utf-8?B?N3IxSkdPd3hVUGhtSE5lbmU4K3RON25CNGc2SjNMcDc1SDhkaEFiZkpJV3Q0?=
 =?utf-8?B?dnJ0SDluVUEyQTQ0V2k0Rk85ZG1RVmdpOFFXaDNaUjAvUzNyTWJEaUpsSi9r?=
 =?utf-8?Q?bIF+mPQGkIyss0UfBoTHzUgmKknbNFNJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUtmK2pTaUpZeG9UejJ5eUVUUWhGd1p5aG93Y2kyUzFlOGpjeitMM0JwL1ZS?=
 =?utf-8?B?QkpMN3R1TkZQTFZ5eENsMHZSN2w2aXhCV0M2dk1VZk0rRzNDdGN0ekEwMXQ4?=
 =?utf-8?B?TEIxYnF3OVRPK09kN3REZEJLWW1NQzRjUndVdVV4c1dKWVl2bWtiVDJFYVZl?=
 =?utf-8?B?MElITjFCM1dTLzFIcVM3aGlWTm5hSUdzZUFGVEZvaGNUbnJDN3Z2aVBIdTNB?=
 =?utf-8?B?NW1pMk9QdzBPNzM1TmNDMlYvajVwSGpJR0xXVWIwNCtjWTNsaUZVZGZwbFgr?=
 =?utf-8?B?SWlHOW9HMzVLUkxmSDFYVkYxMlRLbWNMTXBnSXNIUlNJcmR5UW04SFJDUk5W?=
 =?utf-8?B?VDJtSHRJZ1Y2T255eXBqUC9VL2poV0RuR1psN1k1dUZwVHFZSHdnNVl6MW1L?=
 =?utf-8?B?VWF3bGtiMU5aaFpKRS9LR2tzMkhOOVJBanh6NVZ6VnM0NTJqd1A3KzFaV2NG?=
 =?utf-8?B?bkM3QzA1ZUdNZnBmei93ZHdEYVdEMDRmNUt4TGhUdnZuYVM3Z0Rjb1VsYW0w?=
 =?utf-8?B?STZWUDVtK1hMNllCWGh2b09VOEdrM3RvM2k3UVV4eTRHWk5scGVOZnE3a2NK?=
 =?utf-8?B?N3g5MmJ1ZERYNnd5MUN4NjRCbmVEdGJtZkRLNEVFbEJlbVJ6QjFpS00xWVRh?=
 =?utf-8?B?MWVYcVE2ZElWVXlGblVpbStRSmVMcGY2WnlkSDI4cXcydGRPQUpiNXBCSCtr?=
 =?utf-8?B?NGlVUW1lY0Uwc3JveWlmNmtZN2ZIcTloazBkcGJCaDBQVjhOOHR3VGcrUmlr?=
 =?utf-8?B?Vm9ORzdZdUdsUVhvb3YwbjFxRUs2WlNKSUdiMlFEcndETTgwLzJ6T3lhdmNI?=
 =?utf-8?B?WW1FUEhnLy8vMzZmcS9KQzJjT0E3a29icUlFcVd2TU5BNTBrenBlRG1Xdkhw?=
 =?utf-8?B?VnJBUHVZMUsyUVgrQlprb24wQ1QwUmdiWjViU0tnRU1HQTl1c1B5OGorL012?=
 =?utf-8?B?dHVNbkdJcUpzelR0czlvTXFRNzg0NjhTb3pTdTlmeEh3a0VzMTFFaGQzN2d0?=
 =?utf-8?B?OHpaektqTkhqdHdrSVRwYXp6djE5dTl0d0VXdzd5YjdhNE9mSTV2TFpMenVu?=
 =?utf-8?B?bDlTbkw2SjRpR0x6UVZiRU9RQmhNQWpFVGJTVHdCVmQ4OFkvcU1DVElOd2hJ?=
 =?utf-8?B?Yy9mbU9MdTFMQ0RBS3psWG9aL2lKTWk1ZzdoYjlnVFRneEtMaGZCZTNIcmlz?=
 =?utf-8?B?QzRPY2JFZHNic2RVUzN1OC9Db0JhTDRKRlBZNWl4RDlwTGplZmtuLzhiaEhB?=
 =?utf-8?B?bjF2ODZjdmxsV1RQOHErdVlWeStqUW1Oa2NtYzQ2UDB2bUZuc05KSWN2V0Q1?=
 =?utf-8?B?dzBYNWRLdC80bnJrWFNuR1hFZ0syaWhlUXBRSzdSSTl3eTdld09zMnEzNTVJ?=
 =?utf-8?B?cmJldmhRNzBJR0tYcU53ZTdIaE5GeDhJTHN3ZHdiYXkxOGx0WFoyZ2FJU1Vy?=
 =?utf-8?B?SnVhY2tHK3ZMbEtEQ3JoTWdTdGErWkJvV3dWd1p4bUhQUHUrN0NPSlAyamFI?=
 =?utf-8?B?Y2RZalRWSnNyRGZOWHlFcld5c0kzSXdrQU1SdC9qNGplU3dVUlM0OEorVSty?=
 =?utf-8?B?by9xMXhhNnJhTlM0T1hsaDRmK0o1V09rSjdXS0laWUYvTkppajljUFNoZWRC?=
 =?utf-8?B?V2UyYVlQL3BlM29PMkNUS1BNVUJhZi9PRzViYXQ3YUNTU3FWd1hncmVOY3dL?=
 =?utf-8?B?akp1ZC9hTHV5WEZ3QzdRaWpvMVBWdmcwWld1SmNCbUZhRVdCRTFxbytMRFVX?=
 =?utf-8?B?c241YlNRWENDaDBMSDI1VDB5ZkRseHRNcXFjblFwNGpPOTIycXhUQmdKMHVz?=
 =?utf-8?B?dFMyaks2aDRYcmlQaGorRmZuTnhTS3h3c0duS0JUQ1VRTG9nc0NYVUtFM1FZ?=
 =?utf-8?B?Rm93c2k3eHRxS2w2TXQveFc3WUk4TXovLzRaN3dabnBWNzVLL1czdDdlNFJF?=
 =?utf-8?B?c3FtYmxBL1FvVStWK1hUUXUzWVNPMzdnZ04rak9ZUnF0SkN0eDBpcXFPMkl3?=
 =?utf-8?B?SWdHeGFmRGRzZEhaRjVlQi9ISGVQb1pmcFYraWljaDA3SDZDREZPRTBIZmJL?=
 =?utf-8?B?UCtYSmhIaGMvWjVBSVlydjQyWGFUZ3llTFhYdjNTWXNNVE9ZdzdJVmdxRFhr?=
 =?utf-8?B?WkFyK1VCMzlGVVRjMmk1a2tEa2h3SUFoaldFNldUeEZFVUJ0eGplRHBqbVQ4?=
 =?utf-8?Q?TvsyYeeIGdRuWoDdXjEma3Y=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 072e60af-f0bb-4dfa-b55c-08de31a8302b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 13:39:16.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX8DNthw5M+/SIrxqBkT8ZarD4JqYfCCTZpP2BNcYg5skk6V3eYybD5hrN5QHyqXQW5XBC733Fo/jfPb6Xttwtbi2Po9s/+4osSQo5Cj59M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_053924_225374_0A4ADD1B 
X-CRM114-Status: GOOD (  18.21  )
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

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The video-demo adapter also works on the Lion SoM when running
> on a Haikou baseboard, so add an overlay for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   5 +
>   .../rk3368-lion-haikou-video-demo.dtso        | 174 ++++++++++++++++++
>   2 files changed, 179 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index ad684e3831bc..494fdd685a5c 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-evb-act8846.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-geekbox.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lba3368.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-video-demo.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-orion-r68-meta.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
> @@ -231,6 +232,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-haikou-video-demo.dtb
>   px30-ringneck-haikou-haikou-video-demo-dtbs := px30-ringneck-haikou.dtb \
>   	px30-ringneck-haikou-video-demo.dtbo
>   
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
> +rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
> +	rk3368-lion-haikou-video-demo.dtbo
> +
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
>   rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
>   	rk3399-puma-haikou-video-demo.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso
> new file mode 100644
> index 000000000000..e7767c008144
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + *
> + * DEVKIT ADDON CAM-TS-A01
> + * https://embedded.cherry.de/product/development-kit/
> + *
> + * DT-overlay for the camera / DSI demo appliance for Haikou boards.
> + * In the flavour for use with a Puma system-on-module.

s/Puma/Lion/

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/rk3368-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		power-supply = <&dc_12v>;
> +		pwms = <&pwm1 0 25000 0>;
> +	};
> +
> +	cam_afvdd_2v8: regulator-cam-afvdd-2v8 {
> +		compatible = "regulator-fixed";
> +		gpio = <&pca9670 2 GPIO_ACTIVE_LOW>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-name = "cam-afvdd-2v8";
> +		vin-supply = <&vcc2v8_video>;
> +	};
> +
> +	cam_avdd_2v8: regulator-cam-avdd-2v8 {
> +		compatible = "regulator-fixed";
> +		gpio = <&pca9670 4 GPIO_ACTIVE_LOW>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-name = "cam-avdd-2v8";
> +		vin-supply = <&vcc2v8_video>;
> +	};
> +
> +	cam_dovdd_1v8: regulator-cam-dovdd-1v8 {
> +		compatible = "regulator-fixed";
> +		gpio = <&pca9670 3 GPIO_ACTIVE_LOW>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "cam-dovdd-1v8";
> +		vin-supply = <&vcc1v8_video>;
> +	};
> +
> +	cam_dvdd_1v2: regulator-cam-dvdd-1v2 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&pca9670 5 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-name = "cam-dvdd-1v2";
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	vcc1v8_video: regulator-vcc1v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "vcc1v8-video";
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	vcc2v8_video: regulator-vcc2v8-video {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-name = "vcc2v8-video";
> +		vin-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	video-adapter-leds {
> +		compatible = "gpio-leds";
> +
> +		video-adapter-led {
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pca9670 7 GPIO_ACTIVE_HIGH>;
> +			label = "video-adapter-led";
> +			linux,default-trigger = "none";
> +		};
> +	};
> +};
> +
> +&dphy {
> +	status = "okay";
> +};
> +
> +&i2c_gp2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	/* OV5675, GT911, DW9714 are limited to 400KHz */
> +	clock-frequency = <400000>;
> +
> +	touchscreen@14 {
> +		compatible = "goodix,gt911";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PB5 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&touch_int>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&pca9670 1 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc2v8_video>;
> +		VDDIO-supply = <&vcc3v3_baseboard>;
> +	};
> +
> +	pca9670: gpio@27 {
> +		compatible = "nxp,pca9670";
> +		reg = <0x27>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-0 = <&pca9670_resetn>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio1 RK_PA5 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mipi_dsi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3148w";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc1v8_video>;
> +		reset-gpios = <&pca9670 0 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc2v8_video>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> +
> +&pinctrl {
> +	pca9670 {
> +		pca9670_resetn: pca9670-resetn {
> +			rockchip,pins = <1 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	touch {
> +		touch_int: touch-int {
> +			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&pwm1 {
> +	status = "okay";
> +};

Both Puma and Ringneck enable the PWM controller in Haikou as it is 
exposed as BLT_CTRL signal on the MISC I/O pin header. The Qseven 
standard specifies this signal is only for PWM (either for a panel 
backlight or generic PWM), so I believe it's proper to enable it in the 
motherboard DTS to also align with the DTSO for the other modules.

I've tested the touchscreen, backlight and LED, they all work as expected.

I have not yet managed to make the DSI display work. It is detected but 
modetest test pattern doesn't show, only blank.

Since there's only one VOP, I'm also wondering if we need to disable 
HDMI here? Or is Linux capable of handling multiple connected displays 
but only use one? I've tried to make DSI work with the HDMI controller 
disabled, it didn't change anything.

Cheers,
Quentin

