Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4307FC44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXPGno41VjlIgX8XWDzgbc8iFaSJGk+fs3T+KQmgKrw=; b=UtsMTlkSDwVPtqyqj0B0ZTL0hH
	5N+kx0wYP+mHdZGhEvBwKQXS8Qh4KEjwwxD8Y32YupiGOHQT435OuQozA7IqhKxTJG541yB0j0iGU
	MavVG027cnAT+ERrWM49kjqnhRDrDJJGMXaXECnI1R6aExTa5rJe3Rr9qf+pFuafoX6aYR+i4hpKP
	7MEXFJ/wnOFAB5xoj08jjfGQNXxwmdWPAyNTmSyNiJskXVhe+IX9PIb11dYQwhsVn2ywUZSMF4ypA
	U9BrWzjJHH3tdeffcYgrpLl4dTIbXYOcUFEjdfZ+dnU9K86Z8ZEJND005ceCOFt+ElrrGbupxsPm8
	Mp6opVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXKj-00000000u0L-0BrE;
	Fri, 17 Jul 2026 01:25:45 +0000
Received: from mail-northcentralusazon11020143.outbound.protection.outlook.com ([52.101.193.143] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXKh-00000000tzs-0JJf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzdhhLvnYO5L9QYKh7VY9zqiksO+CVVLsT9kO7uNdEKHXS12smwxxzzQ+vxeFnU2iHgzDgxu6XmWrkaZRSJgdKEELCPSbzNH2yzji1FM0uaSs4lx/VV+Lbq06HKIXGJNa+4HkmeQPy6NkqWVWU2t0P1xh7BDqQ+YbZxE3LIRzpjep7uHSgXGCjpvWfuEVZ+lDfk9PLByZDWFJ4xQDizhwjnRo0aZcQEvlPvmmNwwey/H1pduWMVzMMIGZYVfMi8l4feUNTGph/wZOGyjS2mBrybY/+2jZpscwIU/GbHJGTSK4SNmxMg9nx5382LkSGzBrVjbCM5JLvMULxwGkPhsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXPGno41VjlIgX8XWDzgbc8iFaSJGk+fs3T+KQmgKrw=;
 b=YBuALW/30ze5ryD/gxVvIRHVz8uCjye9VacAFk8wnPktziOFF5g+z+OjPK1GqISiqOuGxYP7M2VNBs2VYsF2RDrNYVNdhCdpj6lYBkAsWXSzE4M2q2cE+7wevgW6XYEczfqujhE7JaR9jRH89ORFAhBb5Rr+XDgR3QdDGvkkmenVBdIQvIrV4SVJMbfGgGv2+uisn3bn+YQzFaiKkv9DYzwXu16bA2ztkagcNsCLnfyhqnqD/EzSAI+uFj9Mtg/GAe6qf2lh/NTAiJ6iuqWaunmHRPRXh2kE8d3wSmQ+RjHZHc/gluisEQdcmkmDIT18U88pFCmEI02UrP7hn6qvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXPGno41VjlIgX8XWDzgbc8iFaSJGk+fs3T+KQmgKrw=;
 b=YIVrO4+CQajDNfEwFs9N0xChZ91HEdbqlWFIOd2ueUGedbg3cNFeVEfwNGY1XPKlHJoIvUhXZNENKA7uAg4Ddf1q82GhFjCvTyxfLrpdgUTAUEmUU5/SHAUmkZx/VZIqpeUGL1woSaqdlCTOnmkVRXkspMYhjkYWKdL3RIVVOUAH5W6+qw7/2jPyVjS82XFoDHBEglN66mi7xt3RsRmrVLeI+6DoBDJjJHjqUzsvuRRaLVKbD0aXvpDEps73b7rwA9cQi1J/ebaqTRv7eC8+yu6u5yxGyfbTmWaMDAlsZ2kIXrVtmgy2P+PpRYI5DwIEHECum0QFEqRNhVczIAw3Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by SJ4PPF9C6BCAB60.namprd18.prod.outlook.com (2603:10b6:a0f:fc02::f31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 01:25:38 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 01:25:38 +0000
Message-ID: <5c2e0f14-e53f-4353-b3b5-526fe9c1e2a3@axiado.com>
Date: Fri, 17 Jul 2026 09:25:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: axiado: fix kernel-doc comments
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>,
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713060807.7-1-bbnpreetsingh@gmail.com>
 <20260713060807.7-3-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260713060807.7-3-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0009.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::19) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|SJ4PPF9C6BCAB60:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0dca9c-fc63-4d36-4308-08dee3a24e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|42112799006|23010399003|366016|10067099003|5023799004|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: O/hq6En2ij4DLg5F0sAHipPO6Q1GhQPi9eXBcHhPeu7i0ggyKBmrcZ/99B+nx5ufqALui3VjULy35dTRR4inbbjxlZUal+7dCXsEOkH7O4K+VSzHeSfMEsax7YG2IcHXyzXkvamcolYQ5qtYXWN03N6sSAPbdE3BVAYLGWwL++TW3QrsJ1gxI6qczkln/RNR4zsY33ULhOaWIv60L2djKiPwVkiv7CFabwT4f0Ea1bN+HZftjLfPXJ5tUTUuA2zB7/1xsydzlPT3zTbt4AnvLNK9VW9RKppOKnf7AJgy4cL8ORpcI14E7OEDI1tWHIXWf66kt/5u8xb3VPggYgtrgTAvLFYsbhhjUHDQTzKQBQS/0eQe8POuLLMsNcyD4XDoLt0OEkp3RKgZZPzD5/a3CLdeWv4qiWIK3ki+Gf1UzRLRnJ3j616fgPiD1rq01Us/UqMOoW/9S1RntBmHntvTHZxXUWXpvQfKB3io0ZjWc5GN25TysoZLj6xLSDfAjb7zxlt3RlmkPiOQrLyyj0spuexD3PGPIE6WoF6ntxuKhDkOMb2JZjiKYhoFNQ2LPrqePKJp3M5/q0ZAUfgVmEUmoe2ISvfXR3KeZL5bA+b/hU7xcOv0wOOaXG+oyB34seb7IKdtWEgT9I8lGSdyMITZuKPrx8S7OKPAz0jlbOGqB5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(23010399003)(366016)(10067099003)(5023799004)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFSZ2t6SHJNNDVIdkpjdE5WcjFkWG9acFlNckNCRkNtVUJOUWVwRjcxNTJl?=
 =?utf-8?B?bDlaK0JkcENQaklrcDdtSi9ydFhMMnF4Q2hSY01yOVI3MVhiZS9QendMT1lU?=
 =?utf-8?B?L3BWNE1CKzlGL3o0cXJJUTUvRG54NzJNeDhCWTMzZ0JMejIrTktPOEJNZFVa?=
 =?utf-8?B?Z2RFWmorMjFmbjhsZFVLN3phMzBTVmh5R2RDaDBjUTJac2dha2FMWmhJUGF4?=
 =?utf-8?B?MGpWWmZJeWlDRjFDYWxXcDBzcTlLd2hxUUFuSW1JTkZpN2lVQ0I4UE1VR3R0?=
 =?utf-8?B?NW5NYXQreGRhWkNoYU81cDFyMFZGWGM5R0RUVlh5QVl4ODRlMnRxUnRGRCt6?=
 =?utf-8?B?MkpnS1I5SFRwOXBDMVdDQXl4YU9HSWd5MUtlQXV0YzlTWmRrYUNkaU1zUnB6?=
 =?utf-8?B?YUUvQk04M21BUjJ3dTFsaG5UQnBDVGVsZHlESW5vRUpVR0lacjkzMjVHWm5F?=
 =?utf-8?B?LzQ2U0JibDU2VkZoNVdrNklUT2dxZjdMMkRrcjNJbXg2WFUzbTZsbmVuRmc1?=
 =?utf-8?B?amI5YnBYaGp4UDJ2RXJSdEZod3M4V3BRUG9ERjFuNEdOYjlOUkxWVnY0ZFhO?=
 =?utf-8?B?aDdoUG9LRE56U3ZGa1MvV1pnd3FOWEZ0cFY0SVcvckpoR3hTMmdNVEp0SVkz?=
 =?utf-8?B?L2tLdmxwUGtCUjROckk0ZVFhSVE1eGg1b1plNVg3a2Zsa1hQM1oveCtxVEU1?=
 =?utf-8?B?MnpZYVBYQ3U1NDBBa3RLdTAwZEVrL3g0dHoxbE1pNUVxUE5NTHF2QTZFVWRJ?=
 =?utf-8?B?K2w5VHJtLzVKTDEzOGhNY0RQT3ZOTjNvay9xZ0huWjlnMlZKRHV0OFMxcTRW?=
 =?utf-8?B?S2g3L1dXOEhKVmFLZzRxdmlGU3dJdzNvOXcxT3JQdnF3MVN1R1BBV0h2bmJD?=
 =?utf-8?B?WTROYm82eTk0MlVEUE4vY0IrdUdVR1BLQkxZdC9TUWdTcGdwYi9RSWl5U04v?=
 =?utf-8?B?WjcwWVA4czNQenhqekhGdkRFK0dXTFpia2dybWFrSzdmTFF5ckhmSFVzdVFY?=
 =?utf-8?B?bjJnZ3Fad2Q1VzhpMG1XWFdqMUdjaUYvR2MvYWJGRnBIL1RLTjRMMjZUclJS?=
 =?utf-8?B?NlphMmN0bjZxMVVtRTIvblNOUSt0WU9YNG9YUW5XN0J3ai9FY0Vyc25vYzQ3?=
 =?utf-8?B?MkhHUThpZGlzcElJT09ZYndkSExFblErTnNRVkdOU05vNTRZa0dzOHkvT0k1?=
 =?utf-8?B?OC9rbnpjREo3TGlid3BkOUM2MnVaSVFpZUIyVkEyWDNudXlKa3RGeHVyYnRY?=
 =?utf-8?B?YzBkcys5c2ZVUVE1eStXbzB0TnA5eWJBT1loZXlSYTV1VElXSUtMNldYMFNw?=
 =?utf-8?B?cG9DZnRnREJ2ODBhVzFwRldDamo3bytSOVJOZHBHK3J2RW5SUUl4MHRFdHUw?=
 =?utf-8?B?aURkVjYrMC9CbWpIamZZSi9ZZFFHMFVyUWVlYlUxTUw0NVJtcDB1UWVzMmhZ?=
 =?utf-8?B?YURIUm9MVzZvejYzQjI4bWJPdDhhUkg1TWVkYThDSmpYRjV1QmJZMGJrMyto?=
 =?utf-8?B?ZDZ1OGFEVDBibTE5YlFHNmlyNjhlNndNNEpnaWZvaE1iNTU5NVRvUmdwQzlE?=
 =?utf-8?B?L1VzenZSeHYrcFZwaGoxRm9QOWFVbEdJT0dPbFNNa1hhYmM0TW9waUxtcC9G?=
 =?utf-8?B?SjVHNmt6VzZRQjc2dkFrK1d5cExIckowY3VKTE1zMnRVSFJWM3ljWVNONWxG?=
 =?utf-8?B?T0lCemFSYXg4VFgrenF6YklmcFVhSEI3ZnVaZWRreEZGUXB3akJXRlIyUVpI?=
 =?utf-8?B?Y3R0UG9NdXk3RXNPMDlpeCtrODEyNzJLTzJZMzZTbldxVitWeTU5UHhEL09u?=
 =?utf-8?B?NCsxVy9ZVkVWNE9aRFdKK3hnQUVoSGgxOHhXOEdPRzVtWEg1UXpHczA4Uzcz?=
 =?utf-8?B?alhrdlNBaDA0b2FnQVJVSXZrOU1mci84WnVkUlVZN0NLd0RzVEVLSm4xR1pl?=
 =?utf-8?B?azlZblllNFhvZHhPWTQycCtYZW1BcXVWbnVPVFR1RWRhS0JTL3gyMTFEWi93?=
 =?utf-8?B?eGlLdGRoMWg2YlQ1dDE2cTQrWjVsNFdUcy93STlDWDFpNXB0ekdTbTJteGtw?=
 =?utf-8?B?QlNaQVlhS2VNVCt2eDY2QUd5ZnZmNEhsYU5xMHJ4c0NMTW5pRHRrb09HVjlC?=
 =?utf-8?B?di83MktOY2EzbkNQa3ptYXhBbFp4WDVLTEJBOE5VV25EYkRBeEQzSitrZ00z?=
 =?utf-8?B?TmlacGRiOU9rQk8rYnFoNTFyYmxPY0JobTVGSlZEUmdWb3p4bnZycDJRRmVW?=
 =?utf-8?B?dTRzaDYvUnJiUE5OZHpETFl6OGtuTTZUN0Rjenpvc2ExRmo0aElzSjJmdkhO?=
 =?utf-8?Q?wlVJM3WnXl6ejibZaz?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0dca9c-fc63-4d36-4308-08dee3a24e55
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 01:25:37.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rz8DfheJMBSq44SEzsypZ48zcCfkZt7mV4dKUv70elpd+rIQCXJVJQF+dte2TmEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF9C6BCAB60
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_182543_134234_78291EE4 
X-CRM114-Status: GOOD (  26.02  )
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

On 7/13/2026 2:08 PM, Babanpreet Singh wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Running kernel-doc -Wall on the driver reports 7 warnings, all present
> since the driver was added in commit e75a6b00ad79 ("spi: axiado: Add
> driver for Axiado SPI DB controller"). Two are in spi-axiado.c and
> also show up in W=1 builds of drivers/spi:
> 
>   Warning: drivers/spi/spi-axiado.c:226 expecting prototype for
>   ax_spi_get_rx_byte(). Prototype was for ax_spi_get_rx_byte_for_irq()
>   instead
>   Warning: drivers/spi/spi-axiado.c:248 This comment starts with
>   '/**', but isn't a kernel-doc comment. Refer to
>   Documentation/doc-guide/kernel-doc.rst
> 
> The other five are for struct ax_spi in spi-axiado.h, seen when
> kernel-doc is invoked on the header directly (headers are not scanned
> by the build-time kernel-doc checks):
> 
>   Warning: drivers/spi/spi-axiado.h:130 Excess struct member 'rxbuf'
>   description in 'ax_spi'
>   Warning: drivers/spi/spi-axiado.h:130 Excess struct member 'txbuf'
>   description in 'ax_spi'
>   Warning: drivers/spi/spi-axiado.h:130 struct member 'clk_rate' not
>   described in 'ax_spi'
>   Warning: drivers/spi/spi-axiado.h:130 struct member 'rx_buf' not
>   described in 'ax_spi'
>   Warning: drivers/spi/spi-axiado.h:130 struct member 'tx_buf' not
>   described in 'ax_spi'
> 
> Fix the three underlying defects:
> 
>  - The comment on ax_spi_get_rx_byte_for_irq() carries the name of
>    ax_spi_get_rx_byte(), from which it was evidently copied when the
>    IRQ variant was split out; fix the function name.
> 
>  - The comment on ax_spi_process_rx_and_finalize() is opened with the
>    kernel-doc /** marker but has no identifier line; turn it into
>    proper kernel-doc (identifier line, @ctlr, Return:) since it
>    already describes the behavior and the return value.
> 
>  - The struct ax_spi comment documents @txbuf and @rxbuf while the
>    members are named tx_buf and rx_buf, and does not document
>    clk_rate; fix the member names and describe clk_rate.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-fable-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  drivers/spi/spi-axiado.c | 8 ++++++--
>  drivers/spi/spi-axiado.h | 5 +++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
> index c4bc7a50d6c9..25561aa9f76f 100644
> --- a/drivers/spi/spi-axiado.c
> +++ b/drivers/spi/spi-axiado.c
> @@ -213,7 +213,7 @@ static void ax_spi_fill_tx_fifo(struct ax_spi *xspi)
>  }
> 
>  /**
> - * ax_spi_get_rx_byte - Gets a byte from the RX FIFO buffer
> + * ax_spi_get_rx_byte_for_irq - Gets a byte from the RX FIFO buffer
>   * @xspi: Controller private data (struct ax_spi *)
>   *
>   * This function handles the logic of extracting bytes from the 32-bit RX FIFO.
> @@ -246,9 +246,13 @@ static u8 ax_spi_get_rx_byte_for_irq(struct ax_spi *xspi)
>  }
> 
>  /**
> + * ax_spi_process_rx_and_finalize - Process RX bytes and check for completion
> + * @ctlr:      Pointer to spi_controller structure
> + *
>   * Helper function to process received bytes and check for transfer completion.
>   * This avoids code duplication and centralizes the completion logic.
> - * Returns true if the transfer was finalized.
> + *
> + * Return: true if the transfer was finalized.
>   */
>  static bool ax_spi_process_rx_and_finalize(struct spi_controller *ctlr)
>  {
> diff --git a/drivers/spi/spi-axiado.h b/drivers/spi/spi-axiado.h
> index 6cf0e5bf5879..d24d31c3a446 100644
> --- a/drivers/spi/spi-axiado.h
> +++ b/drivers/spi/spi-axiado.h
> @@ -98,9 +98,10 @@
>   * @regs:                                      Virtual address of the SPI controller registers
>   * @ref_clk:                                   Pointer to the peripheral clock
>   * @pclk:                                      Pointer to the APB clock
> + * @clk_rate:                                  Reference clock rate in Hz
>   * @speed_hz:                                  Current SPI bus clock speed in Hz
> - * @txbuf:                                     Pointer to the TX buffer
> - * @rxbuf:                                     Pointer to the RX buffer
> + * @tx_buf:                                    Pointer to the TX buffer
> + * @rx_buf:                                    Pointer to the RX buffer
>   * @tx_bytes:                                  Number of bytes left to transfer
>   * @rx_bytes:                                  Number of bytes requested
>   * @tx_fifo_depth:                             Depth of the TX FIFO
> --
> 2.43.0
> 
Thanks!
Acked-By: Tzu-Hao Wei <twei@axiado.com>


