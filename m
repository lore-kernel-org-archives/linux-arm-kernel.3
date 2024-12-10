Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9l9ouLbztcewjrOWo+EsXqGXAY3xTeYVJ/WfNDtNyY=; b=TY2oSgCRlKvkshwOFuNy91x4jb
	UxI+40DZ8dOUZOk1jAGDzl+5wpbjvcnUqO4IhO4cvAoNYjNjJSkMy6TsX9cmSH+Ofjd3JeVggvHLx
	VTtPclJfEbNTsCxvMz/rTe/D4E8wxa8qQJW4vwCgu/zsPLdFyWHBIbK7jIVBYFCaahtzZri19xmFA
	UcxQhaDziI6hCFsTZW+ykUgIHr07Mr10T+HA0q9L+r22TaXYm9iZd7Li+kY8faLEw9A9nGbm4Uv4a
	rwR+HfZGyMoAC24r/kINszFuyZxfIBv+H31XLqDKesP/ptE4OxbsoV/+17eFIIm7wa9q7RvwSPnOA
	zBm3LVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqqv-0000000A62e-3FRX;
	Tue, 10 Dec 2024 03:24:01 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqpV-0000000A5l3-0OXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 03:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irLBnDTwcg8chMHAgNs0I/HaHwVoLp8nR1N/V7VxLXidvVsumTCNtbG6/InFlet9Q+1dCwcasb76go+8nBQwvWhKluZZ7W3UG7NwSQnCZr8JvXyhuSeJAwk7RqSDdXoZ/PGFcxjcWLG4T5o14o265dSg5JY7JHwAPYZngOY2ikL+pUOD7nlwTX/z6EyUssMIakDBULf6neLtw9j48mx9hLrpd3Vf/CsyxTA+SdIYnQeTe/coO2HXpwv99PEX2QkHe1Npd6mjokjHErxvQt7cgwxguR7RfhhTFW8F5e4JIhzevGivnbRkEC+bHiqDTTBc56JiFWa8pSbvx4eXnW92Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9l9ouLbztcewjrOWo+EsXqGXAY3xTeYVJ/WfNDtNyY=;
 b=M3hFYjb1ZQyTuhTBZBxQdaVrioSjjzRc7P0W9xl4oWd2X8jbQl+ROPOiibvIUDg6yn4c8vgrQvcYdtHDSufNp7fdAqA+H4zmZXoMB1sN8sm9Jox5KAFFBecwsjyLZY/4Jt82xvajJPsTnSpqBblGjUzsCT9z9Va+07sUyvfIdx3o3OJknRr2HEvPhQ4ObLxH9KVj6iLwwReWmjania2RjVBUdXYb9C0Gv9seOdJOiGAshtYaNTpAGHG+VrPDwQQp4Zuqc0ufmbBgTlXbnrA+6lxiaZT29ThQC8tIYEjwqxsnOKJJJ5PCnjsjncxx1+9YS1xBWLrNQ1DhSi1RKDZh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9l9ouLbztcewjrOWo+EsXqGXAY3xTeYVJ/WfNDtNyY=;
 b=H9WLvEzVtL+Vn5ngli8buRd1AB4eFi04qZlqyV2pUEc6G6q02tDWPpP5uJdPvi6bZrVOlsTzarLA33xmq0I2wme7Xb+QYhRBfjOrlGiRD91wsZeguDObthsQK81IP6a0NkjnQfbjxohmM+dMH6E6DCDOlwov0R8OSbtqe6tPkOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 PH0PR01MB6277.prod.exchangelabs.com (2603:10b6:510:c::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.12; Tue, 10 Dec 2024 03:22:24 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 03:22:21 +0000
Message-ID: <7e89f00b-0b7a-4ef6-90e6-bb5f1b7946e2@amperemail.onmicrosoft.com>
Date: Tue, 10 Dec 2024 11:22:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: refactor the rodata=xxx
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 corbet@lwn.net, patches@amperecomputing.com, akpm@linux-foundation.org,
 thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com,
 ardb@kernel.org, inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241209072020.4743-1-shijie@os.amperecomputing.com>
 <20241209072020.4743-2-shijie@os.amperecomputing.com>
 <83d01335-c6be-d17b-511a-378ce3ad0663@gentwo.org>
Content-Language: en-GB
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <83d01335-c6be-d17b-511a-378ce3ad0663@gentwo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|PH0PR01MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 292089dd-93ee-465f-eb8b-08dd18c9dbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3NjNW5HTzhBU09VTlJnRnAyNm1NUnl4bS9FZHlpR3RCT1RiMndBTi9GSGVw?=
 =?utf-8?B?ZVBmMDk5M24rc1hyUlhWai9kcDkvaDJUejM1aElvMnhQeUVNVzBVellHcUZG?=
 =?utf-8?B?MXR3b21oMk9vUWk3T050Kys4UWY1WnE3QmZMcWVTditGdTN1T1hrbDF6ZXpl?=
 =?utf-8?B?VkZGSnhhdVo5SUVFUDJXdk81M3ptTmVvR1V5bWU3VXhlaDVrcy9aanFnTHpi?=
 =?utf-8?B?ZVFEWFN1bk9zSjBKNWE2SnJiMENwTjFiVGNrVW00SmdEN2N0NlF6SFZId01Q?=
 =?utf-8?B?V3NvMmJaTEFZS2VOZTdpNFA0UTFBQ1RPZjh5dURkeFRCQlVOUW4vcGtpM2dr?=
 =?utf-8?B?Q0R4eUlqZkRST1dNcGR6a3VMdksreWk5bzBkYks2eXdNMjNHNFlkYjM2ME9j?=
 =?utf-8?B?eW1QbVo1dGxGRXFoei9FbVhmektKSjBCQ21VWHVXS0oyVHpBTmt1SDdpYnBa?=
 =?utf-8?B?dkNpUXFkdlhwYkkwNGFJNDVVZVpvY1RpUkZiajNmZUxMQitVVkM1MFVCOHpX?=
 =?utf-8?B?dCs3WGhrMjZhTTd0V3VYbzQ5OUNtaVRYMW9oeGNEQ2kxTFVmbUhBUDd4ZHlq?=
 =?utf-8?B?eE9ZSTAyNEhhWW5XZkI5a2xFNStUMzdHQUg4dXQ3UldZQWpLc1BEbU9yVXM1?=
 =?utf-8?B?azlwamZ2QkpBOWNuR1NvVWMrclp0Z0xwZEk5ZDUvUHIreDQyL05tSjFwaldl?=
 =?utf-8?B?OFlPT3M4Q25hVHNYQUxoTTZSeGhqTHRUalpkMGdXQVFuQjBvWFpnbHg3b2Zr?=
 =?utf-8?B?ZCtJVCtqVjByNXFBQWt2dmE1YmVqZzhWY0h3V25sZFY1bFFSbUJyOWhuSnpJ?=
 =?utf-8?B?dC9WVzU0eGZTL1RIMnpZV2ZXdDJqUzd3U0w1VjBQMWtLaUJOU2VCWnN3TExo?=
 =?utf-8?B?ZldCV2pUczJxS0FFbXZDQStqWG90NHJ0SVFid2lYdjlZcWJhTkpDc2JOKzFU?=
 =?utf-8?B?VXNXdkpLcC9KUmFnak1kSlhvb0oxWmRQc0h3WEtXTG9xSWRsOWpPZEhRQkRM?=
 =?utf-8?B?UVUyZzlsTFdDRXJFRkl1V0x5TjRrNXN3dE5KZXFuVUxaL3ZPK0N5NXV0SCti?=
 =?utf-8?B?YStSdWIzWmZ5Zy85bkoxMG9nQVdJdUJyeFJYdmJJMFY4QzVKbXZiU2EvdHJp?=
 =?utf-8?B?UUlKNWxHLytiV1pSUEdHVXlxMzBuTTZ3VVE2NFR5NmM5VUkzeG1zWmJtZk5H?=
 =?utf-8?B?VFEyWm5NQmhpbDU4WTVSNkhxbGsrVWNHcHdLWHd0bDZFbld3ejVKaWhHekMw?=
 =?utf-8?B?Y2RpanNHZTRjNnloNUJxeVBTK0l1K0hyaUF1SzR2dUxlMHd2RjFuU3BwVlpk?=
 =?utf-8?B?RWJvbXVhckhNOW9oMTNnZ2kxR1hTR0R1TWxFakRQOEVYUWdlTXQvckJHK2ZD?=
 =?utf-8?B?UmdueEhXd0ZnSUZ6VTdOVmZqRVN5M0lPL2ZyYllYWm82eE8zMG9VdUhoZ2l6?=
 =?utf-8?B?Z1N6V3BVNlhGZm45OExoRVFzTWlLZzVpSUQvMDBKZ016d2ppWlROOXpaQXVS?=
 =?utf-8?B?T2xYejIxRTZiVUkxaFAvbEZiQ21rQjByWnlJbURHV01DVXdiUHQxTzVhUFo0?=
 =?utf-8?B?SlV3MkljSDMvY3dKV1pLQm9KazBVRDEyeDhKUjlGU2RDZzRTQ3dYcTFFQW9F?=
 =?utf-8?B?cWhGdW1wK0RSMEtxS2dFaXVGVTJPeURtNlR1NEZsbFI2clEyQTkwbE9DeFFD?=
 =?utf-8?B?YzFrZTFBdEthbkh5RHRkMmk5MzhLS1RySlhOREpKYzF3TmV5K2pGNHFCSjdh?=
 =?utf-8?Q?VUN60ucatzICrnP/r4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjdZWCsyUjBBMENOQTlsUm5vYVpNUVVxazJ0Q3F5UWVjeWc3MTBLVEF3WTZJ?=
 =?utf-8?B?UEYxejVXaFRwSUN1N0RFZGEwWk5GeFFNMzlUeGFPQlZLd0hER1d1djN5Skx2?=
 =?utf-8?B?Y1hQZ3FoLzdTb1Z0ay9QLzltb21yOGdKRFBRbTdGUEQ2R1FHczhNa1lQdk5m?=
 =?utf-8?B?RitobndtVE5oZVpMVDYrdnJZQnlxSEk2emZublVjUjgzQnlkYncwakJ3L3hl?=
 =?utf-8?B?RGxpZDU2MFhEa3R0ZCtjRzBqanlxb244VmJSUlNGMUVoUlplQ0dqYlZKYmlr?=
 =?utf-8?B?Vm9xa1k2QldJUTZhaEJJcDBramhBQlNJUVRYdmlOL1ZUNU9YeGFTMkROazlN?=
 =?utf-8?B?bnpQVUN5VHJvZnhtbWRIbG9pTklzL1k2bGp4cXRqQVZtbVJHS0U5TUFBWThQ?=
 =?utf-8?B?TEkzQ1BNREEySUlGeWpzNVFVUWlEajE2cldkMUdEdnRjQnBuY1hKeVZ3K1hz?=
 =?utf-8?B?Y0JxWGRxbWE0OWwvSmREZW5hOExrWGxWditYZEgycjJNNGN0elowZWFIRnBK?=
 =?utf-8?B?YlFWSk1jQUJpTkxlL1prRllXdHZOSENrNy9yMDVlVWNLS3U3S0REYmZlM1d3?=
 =?utf-8?B?Yi9YMDJxeWFxWlVtMm01SzI0Z1k0VDhvb2Yva3hyRFZlS2dCQWpTS21vYitv?=
 =?utf-8?B?VjlFYS9zMWVpcEVHMjJjelp0Z05xb2o0UUl5RG83NWF3UzBGVVhlRUtoM1dG?=
 =?utf-8?B?bDhUV2ljNnEvTkZNM1VJVzVpQVM4aHA5TVJ1REN0SzJkRUl1eFZGdnNyVmpp?=
 =?utf-8?B?ZVFlZTF6bm5KMDQyejVsRjE3U255NE1BZzZZeDdNUmRpRkg4aEpESVprSjZU?=
 =?utf-8?B?Zm5WZmRvb3BoQTFDY2FzaEs0WjRDKzJvN2N0RUFkWDRlMkFKRHpuUVIybkV3?=
 =?utf-8?B?OG4vYUh6dU80cVE4MExVR1VCc0ZnMk9iZkg4Y25SRmM0RytTTEsrZHNtVU5L?=
 =?utf-8?B?ODdhRmZKZFM5MlFRS0JOZk5UUStGNEZ5VzBYRjFWQjFFeGFMM1NITTF0UUxJ?=
 =?utf-8?B?NHpmY3FzekNBSjRqbmVIVEhReFFLRytvYWxwSThaalFvTVc0Y0tRSE1rdWgz?=
 =?utf-8?B?Vm8vdDVVZ2Ezck0vSHh1M3owdVF1OVNTK3pCUkxFRWdSS2pudjRoNC81WHhL?=
 =?utf-8?B?MEZxOVZQb2M0UXV1RXRQR2tZZm1ZK2JOVDRtdk92ZkErQXBLZTRYMVpxVzBD?=
 =?utf-8?B?SEl0U2xSSlo3TExVS3NUT0doczR5UElNbkhCZGpTM2VzT3VUT1prRk85SWdx?=
 =?utf-8?B?UTFwMVMyMUhEd1ZwSkxZbXBzTTZ5Q3FuQ2VoZUp3MEhwQWEvbWlWbFlxZ2NC?=
 =?utf-8?B?bkRPVUhTUzNxREx4NDNydmttS3hqc2JwTkpZZ2R2bWdndnF4WVRvdWNRTHNu?=
 =?utf-8?B?RjU1bjZ4bjB4UDBiSTg5UXZRYUNOZjJ4RG1KeVREWGNEZDI0aGxpRVR3aWJG?=
 =?utf-8?B?U0Q4ZGtUTERoUitLMTF2ejdsUWZDQ09Db0pnRGdDdDl0VlNPODZxdUhmZFl2?=
 =?utf-8?B?WEQvNU9rZzJZTFhzWjc0NEErWnAwSW1nZGI1bWdtZUQva2hUYytRbGVxQ1JZ?=
 =?utf-8?B?SVJBZGRjRTRTYkE2bUxkbDVrVlhKbHRobTlreUtMbnJlRERGdnNmUjJLZis3?=
 =?utf-8?B?ZGNHZ25xTHNoWGQvU1h4c1YxOEd4SGtxZlZ1Tkg2end6Y0ZvRkpKam8rZUJn?=
 =?utf-8?B?OE5tUEh5RDFJazJ3VUx0Z2dEVjd5SEw5aDc3WHlCamxmRkE5K3Bla1ZDcmY3?=
 =?utf-8?B?M29TVWpPQUV3WkNHWU84TENUR2NuWCtaQ0U1dVVLcDN0eGpyeDBOQVlkWS9u?=
 =?utf-8?B?cXp5WklkU2FkYTVneFBZMkpqWkttUEVJSUMxemlTRk9ZREJWZWNnVnlMdTU5?=
 =?utf-8?B?QnR3THV4cFZQZkZZKzQwMyt1bEdBZDMrWG1UMjdKUCs0ZDN5SHkzdWlTczRS?=
 =?utf-8?B?YkxLcVpXWlgyVkpTT2JKVXZzYzZWeXRqVFBjN0lTS09jc3Y3QWcvdWxEc1NR?=
 =?utf-8?B?ZkJZdVIxTS9TVG9GY1k2QkR4WDYxd3VQR0JuT1E5U2ZtdHF2b3VqNC9ydFlr?=
 =?utf-8?B?SkhWNVkxTWYrRk9UYzNrU0g5V0ZBWjBkYUQzbXVmVnJkcFhRbEFPRzVJcUp0?=
 =?utf-8?B?anVCazhrSDlhVmsyQzhCTnlYL1VXRlpaSWhUbU1pb0ZLWWFrb1VHN1cyaGcy?=
 =?utf-8?Q?QGK82gnTQUtjPU1qEc3U1Rc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292089dd-93ee-465f-eb8b-08dd18c9dbd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 03:22:21.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TStp0OxzMwRrdVJEYxfYte8MpS686i1f8VPBfV1uHRYFUoqaMYu7/A8dCYqQNvM72Nvr7c3QOdXi+q/4JU0fH61Y1tyFANwp1MGfaGUIxEl4vCO4M3KDQKGm4V6Meg5r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_192233_149074_A5F99036 
X-CRM114-Status: UNSURE (   7.84  )
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


On 2024/12/10 1:05, Christoph Lameter (Ampere) wrote:
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -5901,7 +5901,7 @@
>>   	rodata=		[KNL,EARLY]
>>   		on	Mark read-only kernel memory as read-only (default).
>>   		off	Leave read-only kernel memory writable for debugging.
>> -		full	Mark read-only kernel memory and aliases as read-only
>> +		noalias	Use more block mappings,may have better performance.
>>   		        [arm64]
> Maybe use
> 		noalias Do not check aliases in order to allow larger kernel page
>                          sizes on a platforms without FEAT_BBM2 support[arm64])
>
> instead?

The "rodata=noalias" here is equal to original "rodata=on".

But Yang Shi's patch set works with original "rodata=full" :

https://lists.infradead.org/pipermail/linux-arm-kernel/2024-November/979770.html


IMHO, it's not proper to mention the FEAT_BBM in "rodata=noalias".



Thanks

Huang Shijie




