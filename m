Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C72CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5NqNyUrDbZ/frVIjXrFWTMC8x4wK7oZnMOF3047Hr4=; b=JpRiaW4f89QnkR4Lhr3pNm6khr
	RuiWacNUmE4pHIBlSDTdZLnAbLHwoOrs36t7uOQqd0zItFu6rq+GrBJ0NDeAwbK3Tuq9IzHlKW8FG
	4QyO1OF69v3xe4qwnzHD0gs+jA7Ak1RbMcOyCPBFb+gr4aHcPayrJC9AUq2/XAlsKtHuyZpXA58nU
	I0TXX4+AxlJewFxa+CXRhpHKeDfqMW6bb9MrZJiQD+kAndvmK0EOCC+losxaaVFZOk845iIebBbGv
	dShjXubQwXIa4nzuwDZSz4HWriGy+V+JWpHlgA+6eR9TYYISSx62ryFjZ3E0M/bNiPfL/5U3JC1zj
	iW07WWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCwU-0000000HL2S-2Q38;
	Tue, 18 Nov 2025 04:03:46 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCwR-0000000HL1m-47h7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 04:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjZ7PCkH0FKZwo3/GHoMIDPd7epM3gI5kRTDno5uJtO++xe84dzO6f6QwtsySzYQL4sPdsOagTFpz1H4uFNlmzY1jMZQVHacfAnD+gQ64Nqz/TW05RkybsuTuWhY+WFYoMtLGtPW8a55xdurr+Xt1zyDHXbo7VISGoI9WXo/EpyYXNZBs14CTb/ZEyrEvwOMagL0r4hd4l5rvROVSw9t5ENw2WpjidB/lnTOGKXk5qVBb4gc9LXfsbCc65iMU4JTlDWfmysby93HF4a571ZJ3E+uPdtKmIftr3RwEWwHM+dLhQQM+PB2KCsjS82WMg8g1i0D5m4xkN+WoYnp+2yAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5NqNyUrDbZ/frVIjXrFWTMC8x4wK7oZnMOF3047Hr4=;
 b=lhVZjkSdyh49aZEg3dX+MKSQPUPfx9+uUXdMVKfVqwruFVVIUBAVNNFkQDM3JYG2b1VNokPCCRMB/2UWUphLQRriJ/sbZhEgDc/ZxWuM0k5AdYN77S9nLltJPGQMnucHiWtOgBzjYfHXhOcnqsDukTA0QzWwOLKessxLdQnYAjdstuj4lcb4In8aMlazLtou6W63LaEGIFSkBeJzok1VbwA4O8Pwm+JnPNYHMGt4A7Snw83yWzuJ8lVdMfVofmYYq9iQEqzi6P7B2ZoFy+D76DHx9mvE0f61Unz8ycQhwb5sERd4w0G+gGV4SjNjkE6TvE0f0Zh8SX334NXJiYAvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5NqNyUrDbZ/frVIjXrFWTMC8x4wK7oZnMOF3047Hr4=;
 b=BVH3jdTgtKPuq9+4cxucEBKA8bl0EruOrWELUFYzTkUJgAXznrfSwp/CNdBe0d4uGN9PompG5CfDUEMGJ6BFC5r/qVZDH0hi7Z08dAMTC9Eid9Ha987R1eX4YVNXpp6mRgRhtHFsCcE2WSVp7htN2M1w9y4+zwXx+3uOb8oj4LQETWlETjfBCq5jW3DhSJv016a3W15xvlDYWVp43rYsUdLe9S61ZHxssLTiFjihz2o7avI4NWN5dBgoO6NtWlGaFVMl3KF0iGtm+AnnSj6FPDZPQUhug1qCr1FhYPtguZxxCEKOPw/ikTZLSuG4aBkKBMOwWszJY1t4pDHgpE3N5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 04:03:38 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Tue, 18 Nov 2025
 04:03:37 +0000
Message-ID: <88795f32-bfb7-4bec-b1fb-752b3e72ffbb@nvidia.com>
Date: Mon, 17 Nov 2025 20:03:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use
 pptt cache as one structure
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-4-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251117170014.4113754-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a36a996-52d7-4e49-8030-08de2657732b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXFRb0QyamE3WEhkd1liaUlia29wb1NjQVloK2RseUEvTnhkT25mK3lyRTJq?=
 =?utf-8?B?SmpVTWZybzBaNERWdExmNy9HNHFqck9LVHN4YzE4Mk1TZDRmRTlCYWVsY0Vo?=
 =?utf-8?B?TldMdXlPZ05SbnRONEhkM3IvbjJ6YkFieEdERk4rVmJzaXNTMlFtbXJ6Nksy?=
 =?utf-8?B?Yys4NmFnS0pvd25LS3hJNWpHbzJreXBOT2NxUGFOcVAvMS9zZEtuSXpCOVl1?=
 =?utf-8?B?SWdvZ1l3azFyS1I1M2psQ09pdWRUVnpPQTgzMVlOQkxkdE5RUXVsQnZITGsr?=
 =?utf-8?B?MmFZNVpZczhZb2M4Y1pNaER0azRWUGJSWlpkKzJXVnQrZlpEOTcyMnpiakVI?=
 =?utf-8?B?Z1hEQnRZT0VGbVhJdEM3aHQ5YmNnSU5PWlV5aTZqK0JvR2ZmRXRiTHdpcUJC?=
 =?utf-8?B?VW56SDk5bWxzY0FCN09kaHRaYlU5Vk96MThTY3JzUmphV0hwdTkydTdOODNs?=
 =?utf-8?B?RFM3MmNjbm5vOGQxaEhaaVFRWmdOQks3Y3lGaytGZUxYRk5MVHpGV1JNeEo1?=
 =?utf-8?B?RHUvUHpCc1FUYjR5UnVhbG5xZUh4UnZwakxNa05MOWlBMUMrdFJMYmJEUWox?=
 =?utf-8?B?Z0xEMk5XakU0cFhNa2VhV1ZYSnNHSTRGUFZGVjY2MnNyNDgwRHN4UTVaVkMz?=
 =?utf-8?B?K2tCcFM4VFZrUWxoRi9Jdk0zbWVURERMaFZFTFZ3SE9uN2c2ekl1NW5haUtl?=
 =?utf-8?B?Ynd0UlkreU9uSmxJMCtPV2o2bEgyREp6VzFFQ215UTM3Q1lVU3lxNnZVRFQy?=
 =?utf-8?B?UnM0WkFiUkVkekdGajg3V0d1RGU4R1NuV3g4ZjN4amtJcjh5NnpFbzd2UW5u?=
 =?utf-8?B?VzhyZU9McmZSOHNDNUYrSkp5Q2tCamVXaENqMEhmNzVWeGJzdS8wSlQvRHdy?=
 =?utf-8?B?R2F5WGxxeG5sL3NOY2s5dHU4VFhobFdJSmczS1pUVmFXaHF2YzR2bTJrSjdJ?=
 =?utf-8?B?M0diQ2gzT2hKTTNLbmZTSFFWd0JkSEx3ZWJzL3AvaEpid29EY21DZCtLQ1p4?=
 =?utf-8?B?bVhnYVhwQWJaSEJsQXB4MGVWNklZbzIyU0dLUHpKQXRlcXI5SGRVa2J4UnA3?=
 =?utf-8?B?cE9yMHk4RkZtaWVIZ2xoTnZLRVVyc21Td0NUU1lkeWlyVEJVT2tUb1c2QnBy?=
 =?utf-8?B?UmxEdE9hejhJdnBITzBiY1BwMktCaVVjcmowY1d6Ui9zMG1ydmZtOXRYYmQy?=
 =?utf-8?B?aFhnK3h2RnZhc3czSDAwajU1REFUR1NBREdiMjZvaGk4Z2NCRUVBbUpTTmM0?=
 =?utf-8?B?SGdkSE9VYkZoblRGTnVuZXY2MUZqQlBtNytjVHpOYy9WaHdSMnQxYUJNQmlx?=
 =?utf-8?B?SXBzeHVWa1YxZkdlS3ZSb2lCcmJlZG94QXlmQ1k1ZVQvTWRGU1pOMFhSdit5?=
 =?utf-8?B?cjQ3N1Y4YTVjQWtWYWNEdjhxNnEzS0thNWlBK2J1bWs2cHRDa0lhbE5aUXc0?=
 =?utf-8?B?NVdpNVUzNmQvY2l0TU9jMXdVZFN0dHpUQzhiZ21ZNG1XWUFGQUtLV29IU1NP?=
 =?utf-8?B?S0VyZWN1bVB4a1ZLVG8zcUJwUWpBYi9QUUxvV05rdFAzWFRQV3NpQTNKaVRz?=
 =?utf-8?B?U2gxbC9OUmJqWCtaVWpjRGZtenBBZE1BdFpEaE44VHA2RXF3ek1wSjBVY0I0?=
 =?utf-8?B?Mk5IT3pFWU5PaTZkbHgxLyt5TE9MQWJDVXFwTkUyVENMUm1CZTZ6Y040b0dB?=
 =?utf-8?B?KzJGalVFSjRpUElyTEw2NUVwcVhxSW4rTlF3R3RjQkdjSGl3K0hNcU41by9z?=
 =?utf-8?B?bE5WblJCcnVKVzEyL3h6NGdHbFVZSnFOREo4dXJMZVRRdE84bmtVTFNVaEpI?=
 =?utf-8?B?ajZXaWd6TEpTNWFNbHp4WGY0SENKNnFLZzRGQWphN2pZS29aZWxlV3ZZaSti?=
 =?utf-8?B?cHprbWFpaEdZRXMwSlprUXRna0RvNktMNGYrWUhMME1RWkp2RUpYWHladUxz?=
 =?utf-8?Q?EA3prS3u/rDjezrvf535lI1mxLj8930j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlQwSGd1MXJvZUZwNjVDd1ZrR0hpMnVEM3EzUDNyNWZ5ZkJCRDI1ME9jWWVY?=
 =?utf-8?B?bjVUZVB3ejJ4Sm9SSGd3MkJJTXlMQkFiQnRpZ2hyTW9pSUtBalVlZTB2cktQ?=
 =?utf-8?B?eVlHVk9GWjUvZitwWndBb2UrMzJ4aWpXQUYyR21XSURYOGc1WDhpQlpYRTdh?=
 =?utf-8?B?QWpVOUtSeEF4SDBEeExJN1FwTjkydTJKcy9HYnRwaUJWL1hLL0k3Qll4N21s?=
 =?utf-8?B?aE5lL2RXRnM0RW5UY1JlbjNuZEFuQkZwYjRBL2ltakgzYm5KajVOY2hicXRG?=
 =?utf-8?B?aG9jdWdSYjFmQ3B1aVFQTko2VHBtakJ2YVBkZWE3OHNGR2xLbEVLblU1MnZT?=
 =?utf-8?B?VFB5cERnWWUrY0VHaUxQdHZDOXFETjZIUjdQSSt3eWVRdm92ekkxTWtlNzZ2?=
 =?utf-8?B?T01FWDVHMHhXQ0lSbW1XNlN5aXVhRk90dFhKSWQ2Sk1KU1NwcDVrSlBjNVla?=
 =?utf-8?B?MVQ0M2ZleTlIQjBlNllrRVN2UU4zeENIcHIvYnd6V25Gb0l4WmJwYng0bi9E?=
 =?utf-8?B?NkhBRFZQdy9BSHhCNmgydHN2cjc0SDVsdHFJTElRZ0NBY0tuSTZMZHNBeGg2?=
 =?utf-8?B?RWRvRmdQbWF1Z1p2YVM1T29YaU80MGhDdXQwaDRDc1JiaWFwTGFZdUpVRVh3?=
 =?utf-8?B?SmFMRWdJQXlpbTBZOFRKK3NFTzkvS2VFUlFwME5rWDF2SUtWZTAzSHZMbzFy?=
 =?utf-8?B?YUlqRlJKa3RZbFZqUXBwUUV4LzBYMUg4U0UzUHlKcStHektLTlJSVktaK1h0?=
 =?utf-8?B?YW9JZW9NVEtCRVd2RTdPb3Z4TVNEdWJJN1NndWxkQWY5TGVBSDJVZFBnUklz?=
 =?utf-8?B?OW5zaFUrMk5LczlwMERncHdvZlUwcStDTzBxNEhoYTRDelRtYWRxRWI2SlpB?=
 =?utf-8?B?eHE3WWU5cS9vd1RHdGM2dkVuckYreFVrQTc4b3NmZENuZC90Z0xUOFZzQmEr?=
 =?utf-8?B?aUVFeTBDTTFlS0U1dVovVTBlVDhoL29PM2lxbkhzY3dPUUpNQ2pjaWg1QjlI?=
 =?utf-8?B?Qit1V2VuODhoQVkrYnQwZ2FnNThNRXN6RkttTHhVcFh2d2p1YVdRTzJJMEl4?=
 =?utf-8?B?RFJ0Szh1TXZ3TG51d3JLVXBqdnlTdEJlZWY5cFlqdzNvcVE0MEwrL3NSYTR3?=
 =?utf-8?B?MGoyRGVXcUo3Wk1UdFNUcXd4LzVlRHdibkFJZ1NNYWVrb2RTeHBIMFA5QWhk?=
 =?utf-8?B?bDlxNThEekVaK3cwcnNYZkpHMjI0MmJSWS9rdGkxMVloY3hINXZsZThaajZU?=
 =?utf-8?B?WUFDNitoS1k3WGxXVzZldGI1ZDVsLzJoaTNGK1pYaFFrSzhjak12ZFNyaHV0?=
 =?utf-8?B?SXRvVjJYeCt0SzVyWFNZNUNON3kxUzFIQnBsSXRQY3ZFS3ZUREphMUpmZnJ1?=
 =?utf-8?B?Q2JxUlN1M0g2U0FBaFNxYmxuQlZZTVpic1paQm5VRG1CbzFSUU04TDlyUXRq?=
 =?utf-8?B?YVA0TEpHWHlxNEJoVHJmczY4Rk9EMTRiRzJFN1VwT2I1My9sakRHRGpoOXdP?=
 =?utf-8?B?TVhxQkRRNVhzaXd3Y1prRTAxNXYzMWxQZXpKZTIyTUpIKzRZdEJ1RUQvUVlC?=
 =?utf-8?B?emZuSm9OMS9vU2RrTjRxZmZrNkxpcmo2dGRJcjc0enU3cWE3SkwzZjBvR09u?=
 =?utf-8?B?T09keExLRkoybVVscHRTL2xhaFdCdS84SFlHaDcrMEE4SkJqSUhqaDBJQ3dM?=
 =?utf-8?B?ckpBbVc2ajIzckZlWjVnWEFJSzVHNGhsS3VFR0t5RUxHNTZ5Mzh1ODVodzNX?=
 =?utf-8?B?NEIxMndQWURoV0QzNnBmQzI2cXhPOFdqOFE0THRkSmFyTGdrWDl0UlkvMzMy?=
 =?utf-8?B?ZmtkL2ZtNEZJMmdKUzRzUnpxOU9zR21Zd1hrTjIyeVRQcUNlMWZvbmZuVVRo?=
 =?utf-8?B?WVRNYWMvc1ZvVnlqTk5Jd2Fuc3VBNkhpeEttZXFxZDVRQUxpeTNXNEl0YndS?=
 =?utf-8?B?dlpTNUMwUU10OStibGFNOWtPVlV1WVhCK2xoSHppMVh2a1pSL2ZYUXlzcnlZ?=
 =?utf-8?B?cW9FVVh2cGNpRk90SjFZK3BWL2JpYllud0UyWGNDOEo1anFqWldsaytXUnc3?=
 =?utf-8?B?ZUN2Q1hWSEwvOEtVSFhHdnFQM01MWmpqZ2phRzN4YXhCd2VBd0Z0Q2QvWVZi?=
 =?utf-8?Q?dIBAVnAMUzHsohmUe/mdksO8Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a36a996-52d7-4e49-8030-08de2657732b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 04:03:37.1001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nNzsrZLRf8YVRlaldaXE55Y3L6J41627/91NMQgTxBwl/V2DmfBbOW8/7jSrMqLUBc2htmaZ1i1YUKJJ5z9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_200344_026008_5043912F 
X-CRM114-Status: GOOD (  21.34  )
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

Hi, Ben,

On 11/17/25 08:59, Ben Horgan wrote:
> In actbl2.h, acpi_pptt_cache describes the fields in the original
> Cache Type Structure. In PPTT table version 3 a new field was added at the
> end, cache_id. This is described in acpi_pptt_cache_v1 but rather than
> including all v1 fields it just includes this one.
> 
> In lieu of this being fixed in acpica, introduce acpi_pptt_cache_v1_full to
> contain all the fields of the Cache Type Structure . Update the existing
> code to use this new struct. This simplifies the code and removes a
> non-standard use of ACPI_ADD_PTR.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> I have opened a pull request to acpica to update acpi_pptt_cache_v1 to
> include all fields. https://github.com/acpica/acpica/pull/1059
> 
> Change since v4:
> Use fields directly in acpi_pptt_cache_v1_full
> Delay the casting
> 
> Changes since v3:
> New patch
> ---
>   drivers/acpi/pptt.c | 47 +++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 2856254e29d7..53fde9bd8140 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -21,6 +21,25 @@
>   #include <linux/cacheinfo.h>
>   #include <acpi/processor.h>
>   
> +/*
> + * The acpi_pptt_cache_v1 in actbl2.h, which is imported from acpica,
> + * only contains the cache_id field rather than all the fields of the
> + * Cache Type Structure. Use this alternative structure until it is
> + * resolved in acpica.
> + */
> +struct acpi_pptt_cache_v1_full {
> +	struct acpi_subtable_header header;
> +	u16 reserved;
> +	u32 flags;
> +	u32 next_level_of_cache;
> +	u32 size;
> +	u32 number_of_sets;
> +	u8 associativity;
> +	u8 attributes;
> +	u16 line_size;
> +	u32 cache_id;
> +};

Should "__packed" be added to this table?

Should this table be defined in include/acpi/actbl2.h? Seems defining 
the two cache tables separately in two places are not natural?

Thanks.

-Fenghua

