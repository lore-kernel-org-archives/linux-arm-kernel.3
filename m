Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A857CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=; b=GQYRMxgRv3jRYu8On0z47kQN0m
	ZPCoSRJLxAbhWr6JknO8o9nEWk4nWwUlC/bOho/cE7vYDWqMUU3sPh3ycX5dIKWPWbL3DSmAWxdiv
	hhrcljXFvy4+KqjYOkP3oRVP52SSWt9IlGMI98Qhk0RRdDl4sjxTd0f26UpJaTgmDdnaty+3ZC5e6
	4znVpqevweodZndqIkSIf2vUmxzY/fKv3+z6iXGE+5zNbA96N88duYwfzHN/2r5N3KE6qxDEhOaes
	OSt7653Uss2FWSiXKQD0jGqDxTPnIWhXvoVzG1AmMOekjNOLUU5rIJejzcl8/lMmkTKxo34JX1Snp
	TGfImI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxOg-00000003j0C-3aLk;
	Thu, 07 May 2026 12:00:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxOe-00000003izv-3kPF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 12:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=; b=fPNjQYTwkz2cPWx/kpSfTAAtZ7
	T8FtpkBVT77UCFsqfQYFqiQwxY+0OMoExIr7X8K7dSvjW9cdWiarhOFkArPpJBVbLVzUXlBMybm05
	e0SifIHr0+sbVtfjwbosnZP4+uZbsApC0waXz2En+51Y+4YnDY+xoop/afhKsyzeiMEEEb1Ziz4jJ
	uV2eC83TbEho5vqzmsAz3IpKMRcGc+EaHKm6lBT7Hc9VcPg1T9Gn67hFNKuhid3mVrGlw/TgLdjsv
	5n8R/l7gKo6GVp+mpOtH2wNQzWdypet9G30t/NdhBTpYhC4aTP0bIfZKVw78wLaLGZGlTo29rx8We
	n5pvNC+A==;
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxOZ-00000003QPU-2fYx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0zL576hEcockyPZ+Ej4DjDbvct5Pf+E4E1E6qF72tNoOsJGVbAcPcJVtWsa+JxVNnScbbKZSpze9Egu+0iakBKGnoyCSh9zl1lN20zaUECPOozOC5ignq6LV3s71iTzXG7aX9+FTLXU3QFx4rIFvjjqrhLXaDnqiQtUonUHKzbaxlzSXiSOmFi65RcSbXJKudaHShN4XUvSHGFWO3D58wEAOWSRgOyZdAzb6voI0/RjDXDIi8SajIA2ebS6lCyNyrKMHZscQTJGfjnMlxa+H0YmFJ1gmf0qkx1O1utYrj6TARYuBr8RxKtspC9U4Gg0BYKKjoDdGrc2IGUpxMAtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=;
 b=Y6p9y3C0qEI0WEYlvbtRio6GGhXvExAfaQBYVIRGSz/0tsg9uRQLa/2qKIwMGlscvWU+rfb/xCI8nytJofHOjhDxzX2ILRHe828ewbf7pCwbxJnpUuUrEjeFL2946OZ/EvgiMtXhCf3/IkM4pvhoWCqdhiUSk8hHB5O+F4bodonWVKY+zlWHnq/KtRCVwCmNRcxyVPPoLyy0EOFcyUR2RyilDJ0107MPvD522HY+b/vVWB0upMEHzL3Yeq3UeDEl08TmMz3v3U734V84nG6kL5Wd2fUZZWV4nQZaTj3YLeBXMM5iLtTZjP1razwXDZ3naiQmPo5cLA2h25k/oU1cbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nZ8iYuf/4X6QPXJrpjYGD/EEY3CUXQEEc1AjkoWNu8=;
 b=lSk3rQgNFAWQwZv0QFq6iLKsuwt/05pcMtIOi1vrVHr7CTJr3IxxjTH6KeGZ6M3lCCFaqZYbUhvQfo1P+VLMlP9D25kf22TBBEqgNkVvmNOQ3X21+YYPgblAobjenFyjvQOdd618zN7oOqAqUDwuvNCMPwwvRrycKmjQ6UqYaZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:59:48 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:59:47 +0000
Message-ID: <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
Date: Thu, 7 May 2026 17:29:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] clock-wizard fixups
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5b5f1a-e911-49ca-b6b5-08deac3022db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3Yrm5uq7I/R/drDWxmRXYTZcx4ZvixgZnOZJ+447WMnDohU9+POd6bKWRC/52Cb+oPJ7rCpVIxgueUi6QgarMt/qbfdOxzI2fZEmNe78R5yV5En4ND8e7or5jvPIuFE9/XhHtvtn8uESorkPH9kcQwDfthoDZQcZl3Wo0GoQAHpMJXXWm9251jwRSUXR9xa80zl6VBhgYOJnzu/hKN8TjgAeWOb7T8WU1svoavqhYOJRlJlzhtV7+e4S4MqQhtxkRMC0oHbpc8peP8SicvziCmsFarGxFiuH8tuNkxbeOsOmOCJmDombq7xuxx+kbLcZp2T8nuBR+je5Rfh1KMjNagppX/YlFa6IPEDCO3q118oMZmr8T+r9sAeAQzArpQ+z41GhuYhkosGFF8ikBWB3lCUbSxERcqhV2VWbAYKvsoKejMgW6H9Ub+PpP6aPOgy41O7ZNSmai/ca5x+PBUXpBQU/xGsG5gyKX7GjUpKrVGnNTk+L31m6CZ7JuUCriONdGBrxQax7Yb7geHOIXfQy6zMBh9UnhhQA1QSECSY0tW5Ni7xCGMnRMDCRwSJCMOnbz5HrMS75emBZXVGoyUKomPKNbBD/QWhGpx2R9EHM/oxwKBge6LpCGKP/NgjcLDTnjS2ImwAIOXVvwlHTbbpmYSYyZtBn2NoTOu70wXeNd5VpdlN9vuA4R5LvovBwqruc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZZNG9nV3BQcldzdU82MVM2ejZLZyttd0FGbTZ4VjFWSHkzNHVwNzdZSnpl?=
 =?utf-8?B?KzMwNFFHZXBYRlEzemlHZ2VvTGdwaGdWYTkrQkJRcDdieDZRTmhXaXZKNkNW?=
 =?utf-8?B?SFVaVWZYVE8zUnVnRzM5Wm9DaWFhYkxreWt1TkZFamRydmdHLzliOUFOaXFC?=
 =?utf-8?B?R0djaENxOVNUbXQzcVpSc1JZRHNvRmhRVytQUFBIT0xqdWtDaG81WXpNZWd2?=
 =?utf-8?B?ZVdWdmNWMlY2VWlwWHh1NkpJeG83M21zeCszT2t3VERGT0lNaVJ0OUVzK1h2?=
 =?utf-8?B?dXdkM00rSythaHRYdjdLcGFNVFB5aWg1NkFLRGNnR0hZa0h6emR4ZTlySnVZ?=
 =?utf-8?B?Q0x1NHdrTWc3cUNwS1JFMnBDTUlDc01YWjFJR21ZWTJpT3drU3hISzYyNEdC?=
 =?utf-8?B?T0Zjb3A4MmRJS29IMThMRjBjdUhxZzZ5TFBOZFF2QUpVQVZJbVlOQTVmMUh1?=
 =?utf-8?B?UE53S25rdjlGam9WZmxiOEk1MU1TcFBuSUZYVWpGRC9oV29teTdnK0V0OHAv?=
 =?utf-8?B?cGJ1ZEZSRXd0anJxeFZSdS9wMThLSTFienlZM0pTcnV6Ykg5ZzBMa1NBdU1p?=
 =?utf-8?B?V0hJVi9UbWNqa3FncE94YWZpcXNNYngwY1hwWG5Cb1NETkRXVnRuajVra0xp?=
 =?utf-8?B?UUxQU3RJNWd0YW9NTU81aXVtZlk2eFpYdEhPOUZlMEZXQ0VaYWxXUjNkQS82?=
 =?utf-8?B?SXJMaGNIdC8xaXAyN0xqbExWU2lJdk5xYlFQSW5zc0YyUHVNN21BdmcxQStS?=
 =?utf-8?B?a3ZnaFJMaDNKMGNZbEZLWExRT2oxZEF5OXpkWDk2S2pVZHV5bEtMT0QvSHJw?=
 =?utf-8?B?YmM3TGhzMW1HZ2J5NEdUTjJBZkRCVE5RSWFuc05yNERiaVRKcGpZaG9HRGU3?=
 =?utf-8?B?NG9xcWJ0SktRMzN4K1g0dVhYQUhUcndlNTJDcmR1T2NOdDVOSTlOaXpRQjFJ?=
 =?utf-8?B?ODQ0K2JubXp0R1RNZXQ2MTJORlkvS3ViM0RRNm05eS9PMDJ5SXZKb3NOSmFz?=
 =?utf-8?B?U0ZrdnpWY2FGZGRuMHVUY0phZUJCMlEwbVhiWGZkWm5Od2tjWW56NzRXM1Bs?=
 =?utf-8?B?YjhPYUlCbDZUT0J6ci9TcU96Y3ErajhBTE00d0Z4QVZCaXdCSGtxSmVwd0oz?=
 =?utf-8?B?cm9JVWJYcjRGV0xXY1hFNDl4S3pNamZSWHBmRlBpUGtpL2M4TjZaSW9WaTd6?=
 =?utf-8?B?ZWl2eUxYbFd4V1hIR3VMTHJFSzZyK2hQa1FTZmxIOW9iQkVxaFNaWWFadEFL?=
 =?utf-8?B?WUF3WnRnQStzelpwRW9uclUrYVlPSGZkYmQwbmtaMTkrbFRDRjM3TGpzd041?=
 =?utf-8?B?cm55Q0RkUGhnMFZnaXBxckVzZFdublZpSTkra1h5bUFablBuWHRaNXNSblRJ?=
 =?utf-8?B?TGtuWlJSVjhSVDBXNUM4eUVKNmxLZ3dtV0RqTnN1YmZYc3dXTnF5Zkd5d2kz?=
 =?utf-8?B?RlJKNEk1S0VBc2VOV0lZTlBFNUlwQ2xscXdRTlFiS0ROYlpISlc2SkhaYzN4?=
 =?utf-8?B?R3lrQzM4NjlnOWJIOXVIZmxGQUJIZXpVOTl6bWltTitvQ1BQRHlwMkxoak9r?=
 =?utf-8?B?R1l5ZWw5S21uMzhFWUE5NHNqS09YZVJEcSszM0d3ZGVCNW1CZC9UMXJXMEJa?=
 =?utf-8?B?cWw5clJnN0diQ3FVWGdvTkRQdnZieVVZMElqMWgvM3RNYVl5NGtqWGhrc2gx?=
 =?utf-8?B?STFOcEg5ekM5Q0I0eU1aZUptR2JEY2ZhVWMyNGRrT0tqMWpZRlFXeUloS0pt?=
 =?utf-8?B?OEdnQjk2Vkx1cFJvYzRJQkFsenNUWGRjTit4TTQvTjZIUkx3VzhQdG9Cc3JE?=
 =?utf-8?B?bEF5T1k3MWFDNnMzOHdkUENZWitUQVRFYlB5VWppRTAwOXMyL0E4MFFKK2NT?=
 =?utf-8?B?ZkZXbDA4b0w5eXkyZnNvb2VDS0RqbmlyQ1B4QmRORlhsRFhHWGdMUVgyMkwy?=
 =?utf-8?B?TTR0OHNNOXlaNzA2ZmFoOWZ5SEtybU0wZjFyeUJRQ25uNFg1b0xNMmUrOTBO?=
 =?utf-8?B?NDVxelZybFBjQ3VyUnhMYjlvV3YxNllpbmV0ZnJTVmt1VG9wZmt3OHRFNnZy?=
 =?utf-8?B?NWFEaGgwQW1EU3JtaGJrUkhhWmdxTzBsL2txZ1pieUdVK1BzT3JPK0JFdFg3?=
 =?utf-8?B?V2tIdXJTQU5jNVdWM3k4TDBzSTZCSU0xbDUrYjNwVEVNeXM3azFleHlkM2k2?=
 =?utf-8?B?VkdVakdMOE1iQURDdWdRblpoTUlScTBWbmxpaTQ1MWVkbnlPWEFwVWFNTWlo?=
 =?utf-8?B?S29xYWRLTzErcno4Vkt2dWtZUS9JNzMwcGs0cGlFckxaYW8ydWdvQWRaaEJj?=
 =?utf-8?B?ZTc1RUVIYWNnZ3pmbXNtNlV0OTExQzRWUTZFOFJYaTh5d0xubWs0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5b5f1a-e911-49ca-b6b5-08deac3022db
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:59:47.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5IFLCtvA9LUaHeyR/Aypr4hj3eiNUNSycxGlINREGon43kyjXPVM33NtZaSk8kE85UPsYg4LJnjuGBLaBpxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_130000_351837_4174415D 
X-CRM114-Status: GOOD (  13.17  )
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


On 5/7/2026 1:35 AM, Colin Foster wrote:
> The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
> led to out-of-tree drivers silently failing to set clock rates instead
> of dealing with the best-effort.
>
> Remove this 20KHz restriction to match the Versal clock wizard driver.
> There also was a bug in the difference calculation that is addressed in
> the first patch.
>
> The second patch optimizes the search if an exact match is found.
>
> The third removes the restriction.

LGTM


Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


>
> Colin Foster (3):
>    clk: clocking-wizard: fix clock difference detection
>    clk: clocking-wizard: optimize clock search
>    clk: clocking-wizard: remove 20kHz restriction
>
>   drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>

