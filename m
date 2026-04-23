Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5222F9937A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjvX6QLqMchF+iFKZ4jFDhMjLJyekj82IaEueSvQeZE=; b=U+Co4NDcKvju5hOGFYFDcihmNO
	2GOtExFHZAic/UJO8HpRXS3Ckdz0+PIAS7HZWwslW+3v0I11O4PRtsq8e1m/UgJ9hQ3jx8FOXkKtv
	OCbMdEM/pm3f9HExzxLUxG2eqdll3/cNNePFh3P7v2xn4AdU4odLStIal2DMMN8t8FK9nTuS2B3NS
	zvljEvUsdtjfXCaj3rqs+IeAev5OHbbrwN8+yAI3A4Qymfe7h7o8l3Uyw67VBdo2WTL4ZSsrprEMk
	QDKUAuHP7yyXoPPmFOQF6sIFjF/ClVbXhsZXAqrWTQvU6N3G8ULRE8cCxNN3hchZ9cy1u9OeznJJR
	3oYIr7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsKD-0000000BXb9-1eb0;
	Thu, 23 Apr 2026 11:34:29 +0000
Received: from mail-southcentralusazon11012033.outbound.protection.outlook.com ([40.93.195.33] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsK9-0000000BXal-3fWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 11:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBdRbk8q6FjB0AA/MemC6SeNWb8DX5Wc//W7jj/Wx4AztZrBmyGMMZrFh2p5ob59DnJHSfyU4UTSmObA42YYLoVjOR8VcHULkAZU7hKeDJB56GIBX4XE2AhRzdiGeTitcxwtAf5fcIfC0p9/ZYeYkisBHEEBUr0zbVHz9DJ1qsmCNioqyuj9XAyNtNEfjrLlPoyCFlRDmzfrkdHxRH6B+A0H6uqsvqAysexw4m+wn8yr6iIMKqQN4AGjr9rm1xzx76dC2hNYDfAGv9Jcwe7c0elP+xHoHJYYu1nPuF0m5DvBjBHSFFDqGHp4IUPhELoZVyz4sLxizQxHEn/HxgwztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjvX6QLqMchF+iFKZ4jFDhMjLJyekj82IaEueSvQeZE=;
 b=VMhqYMCUnXZVTKfWWY8D9j2N5SKsnZK0MOGjF5w38CQT2Rftr0Fweflc9d/FvOJseAvk5UQq48lRN1IeyK4zActOOXLEapBxS9mtUaOv1luF/40NYZlmSVecc5UYPfzppUj9Qo1TlESWWK0Ttc1yMZIhzGmKGQZJg6OsxJp/E6odoGGQTUXY4snW2k6hLNxtnW0BH/qQGdPLxhk8Swcd4LLXQ4ZrQ8Gv2x52q0LU6c0D930JX2n3f2J8urHaT7QXiM1IH7NZZPbmTQXgqjRgakM+9R+Lrbj4KghTXf/MzcPlWwBKT6SMlKdYgavALBtBji02VdYc5atvoO/oMKZrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjvX6QLqMchF+iFKZ4jFDhMjLJyekj82IaEueSvQeZE=;
 b=zT0Ni4/8LuaOe7m7LHVvC1OY8K3naag49Z0nweHVsPlza8lB2H1c0K6YZJQG4otYrPZTG1acBR39CFtt1gWif2DDWqTWnlOEBbpRktP5UjEjNWjJ5DHKnQ2xmWNUGnvUMG8GMcsVKWDTbzmfr2Q1ULUQXEmc80jV7Tl0aUwGlNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 11:34:19 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 11:34:18 +0000
Message-ID: <ec571a88-c3f7-40a2-9671-5e2defe9966d@amd.com>
Date: Thu, 23 Apr 2026 13:34:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: zynqmp: Add dynamic CSU register discovery
 and sysfs interface
To: Ronak Jain <ronak.jain@amd.com>, senthilnathan.thangaraj@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260408114244.2852015-1-ronak.jain@amd.com>
 <20260408114244.2852015-3-ronak.jain@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260408114244.2852015-3-ronak.jain@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA1PR12MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f326dd-f1fa-4c16-8463-08dea12c41ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: +lcxDZ44H43h9997SlPT3bPizimD0y8H8SD6w75J6rZiJNbQPmZ/7MnIAA7Qg0x3ak16YpdB+03OFwKkEhZ0utlFCTDZD6s0yNNiFJY3ER6t+RTIY23+LWnAbYeyYnypjzOmoadHxjGz3vA95wj6Y5OVBOzGBOZnyyqDIFIdoQdVsE4Y5t9YPhrkuhuRns4/7ewNnc07ZAzjyyxVpIfXwvjNLe+pY7fj9fF6rZMZfoB086hXu6Uk+tZwwLXwybAijJ7GPbdlXHz+oCHa+8aFHypASZEwxT+b60HzifrIR9pxG0mM5kvD4Trl8OjTVluUfa3pwwR1uxQC5cNu5njnGMsK4rqLiVRJVSUvpBnf6cJXwDAaQ5QHRt6un7MYB32zfpm1pe/0PpmD6tjG2rVxoBwu8f1l2DVsBWDLOve2gXtQNf+fktcFQ7XyW1MbtGkUowyoQLLF/LB7IEGYX4k8jxWZ681FbboQCMg3CQ2SyhNG8cZ70InKxb3WeA+Xeqy4x7jtfFuB7AgccPHXd/oyNbQTJC7iFU5bcLilwvc0opqnOtCEqW9KsFHIk5j8GdLTPNFcvVOzu6aI9Kp3sduxS9C0YR6Bm+Sqv61xw8J0Z47kQVfOKMsqwIl74bCKqA9F+udp80kBzAqnYv9efbqcN2RhSFFEAgwqmpK2IEFTBCiN4orBtmPL00WN/3JSFhlMvIDeltMNnkgEeB5PTkZ7l12ggW64BaG7p8zjH2tLnEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZktpWUJJSnVYUlpHM3B1YlF5Yjg4dFhVcHNzelFZTUVOUytBSmVScmxkcjdO?=
 =?utf-8?B?d2RhOERDaFlmbHZFRkxqTERBYUc1Zmk0dnZxeUs0dDE1bU5ocjUxeHBPdGlp?=
 =?utf-8?B?TnRNZTk0OWJoVWUvSEZkSHdxNE5KTGtJZ0d2dlpwVWVZdkJ5RVdYaTNhTzVn?=
 =?utf-8?B?MG5JdzJ3ekRZMHp1QjJZajZuOGF3bXp5UW45VWVGd0ZTbFBxNHRBck5YRHFG?=
 =?utf-8?B?TEdwMHpoQndVVWNUSFc4WUt3anZ4TGdwODRPZi9ITEZ4aE9LYmRybmNUbFB2?=
 =?utf-8?B?OG9RRElKR0pGL0VrY3RWMWx2V1dZcW0rcG5Fb3oyZUFteVBzeUFRWHhPamxa?=
 =?utf-8?B?TXd3VDVUd21NUVA0V25CZUZlZGRHNk50NndTTlhCVUwxeHJhY2N2R21KTklO?=
 =?utf-8?B?bFVhaTVtWnh1YkNqczFnNDhmOEVMZUpORXZ1ZVFNWG4zZEFFVE0rdk5oSTAy?=
 =?utf-8?B?VmJYa0V2a3dSY0tGZ0lTbVB6VTZsUHJOdlZzaUdSYUJDWFdQcThtUUpxcDhX?=
 =?utf-8?B?VFFERFdMeVlpR2VZZDlPaGFOOFZZWXlsRENBcThVNzY3NmRSczIvSTNSVFFU?=
 =?utf-8?B?alRrb0s5L1g4RzJ3alJsMlpQYkpaM2lxV2d0bEU2WFRodDBDYzZEcVVBMm90?=
 =?utf-8?B?NXE1SEt0di9XUk1IMnBDTWVsTzJOWVhTMWxuT0p5aHNnek1NR3RtelVyY25Z?=
 =?utf-8?B?U2tQQzIyL3hpYmtycE9XTURWZU16YXJYc2tqakxCNElFKzNGQW9YQ1hSMi9F?=
 =?utf-8?B?UWNGNmhXZTdKWit1bkRyYnJ5MG1qYU8xUEo5TENWalU0Yk5EOWpPMDgxdi9H?=
 =?utf-8?B?VmZxZ1lCMFBXdmQ5S3R1aGVQeUVJUkxsTlJjZWZUYTFPbEdiRjhRVjdHbVRT?=
 =?utf-8?B?d3BvUTF3R3NCQXJKZWlkWFhSTG1zQ0lmK1dwV3JCUXNiL1B0Z2NTWklxYXl2?=
 =?utf-8?B?WjBUNU90ck1COU9PcjJ6d0VnOENHbXBaWFpZWUt1eWgwRmc3N2o1US9QdGJa?=
 =?utf-8?B?N1JGK01sakRGSlRnNEk4QlV4d2w5VGtSS3h0c2lBMzN4Qjd0NlRIanozSml2?=
 =?utf-8?B?K3dkNUwwZFMzcFRzNjByRmVMdTdISkdSZ3pnekZVZGk5a3J5czU5K25sRmpj?=
 =?utf-8?B?eGxjNHRqeHFqeHY3YUF1VGVyM3lDSFVtM244N2s3dllKL2NLV0NKQXZ2VUFu?=
 =?utf-8?B?Z1E3RUU5aEY5M1NVZHBrNDdEejQ4d0tNZHFqL2VNVGNFY3ZPckg5SHIrRWpk?=
 =?utf-8?B?RWpKQkZ0YUNmMncwS1RUbEdkUWRnQUFLYm40dVZhZytIcUw2U3FPL0pkYmdX?=
 =?utf-8?B?V011MTR1YUpUQzNRTW52eXhDUVY4UXFrQXZsVldKTWR5OG40Y0pzWmFjYXdv?=
 =?utf-8?B?UlRIM0VSSWgyZkdKaGdRVmV3d1p3REhEL0R1OFFUMVczSmZwbXBzd0E0N0dW?=
 =?utf-8?B?cFVnaXlJTEFqVVB4NG1ERU40TS9jN1hoalVwTzhBQnBrZGVCTFU1NlNBRGlH?=
 =?utf-8?B?U1MzK2pwS2JsM3JHZ2dydG1hS25rR1FhRFk5cWxWaGp6ZlRaaEF1eU9qWU1F?=
 =?utf-8?B?L2FDRHBsZ0QxV3Z3Z0NhbG9mS3dHMi9IN09aYVhaWDE1L05FajVpT003K3VV?=
 =?utf-8?B?c29YbDVJSFMxM3Q0alRiNmd2TW55VWxZZWZ3LzNLUWEvb2ZRaWJpK0l2eTQz?=
 =?utf-8?B?K1pYeWlkMUZ5RnpQc0V6ZWsrNUpxZXplM2lFc080MTIrbi9ISThqWE9SR2VG?=
 =?utf-8?B?ZVRlNXRRUjVTZjMySytKM0xzLytVT1o5bFZZTlc1cC9jRGljTkdIN0tnM1cw?=
 =?utf-8?B?bXE5T2R5bmM4TXZWREtnY1lnVEJhWFVFcG9ZNHdHQzBDRkJYRU9hZTkxS2Fw?=
 =?utf-8?B?UzY0QXVkY2I3YittdDY2YXlBcFd0UFJBdWFucUJ3dlU4ZmlmMlc3eGwvd3hi?=
 =?utf-8?B?eHVDUG5ycjVQY2ZEalRISHhmVkoxNktFTTZMYllTaGhpemNEWFVUSlc2OEFV?=
 =?utf-8?B?QWo2cVNydGlCcE9SUEk5Ym9QMmFhRjZXeU5yM3ArTTZEUnhoT09SR2thOVli?=
 =?utf-8?B?RHhJT0hCUVpqbExFQ091RzlUcVRYVEp2dXlEYXlxQ2dNL25YbVUwT3NWV2hy?=
 =?utf-8?B?ZWp1czlPL3dHbEdNQndvZTNXVzZnNTNBbFgvVUF0TWZkSVJxTVBBeFAwYngw?=
 =?utf-8?B?Yzd1OGJNMXdDTXZFdkFjS0FrdUVPQVFsR0Y1ZEJ1dGdaNVZ1b00vaURxNlpn?=
 =?utf-8?B?UkI3elNhQXlsRTc3NWNQNnFVYlRkUzJVcjVYalg0NUxvOVpRMFdINDJTdSt1?=
 =?utf-8?B?UkxmZzR3bWdZVjFIc004azZiU21XMGptN2VYL0NGb1N0OEYybFpydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f326dd-f1fa-4c16-8463-08dea12c41ca
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:34:18.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOHFrssGg2CtWDpHDnnnrpeN5PiMG9+DJsax1gJKmAxrRFG2oWYZHDzuVLiCaPJ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_043426_037935_839D2FD5 
X-CRM114-Status: GOOD (  20.73  )
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



On 4/8/26 13:42, Ronak Jain wrote:
> Add support for dynamically discovering and exposing Configuration
> Security Unit (CSU) registers through sysfs. Leverage the existing
> PM_QUERY_DATA API to discover available registers at runtime, making
> the interface flexible and maintainable.
> 
> Key features:
> - Dynamic register discovery using PM_QUERY_DATA API
>    * PM_QID_GET_NODE_COUNT: Query number of available registers
>    * PM_QID_GET_NODE_NAME: Query register names by index
> - Automatic sysfs attribute creation under csu_registers/ group
> - Read operations via existing IOCTL_READ_REG API
> - Write operations via existing IOCTL_MASK_WRITE_REG API
> - Firmware-enforced access control (read-only registers reject writes)
> 
> The sysfs interface is created at:
>    /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/
> 
> Currently supported registers include:
>    - multiboot (CSU_MULTI_BOOT)
>    - idcode (CSU_IDCODE, read-only)
>    - pcap-status (CSU_PCAP_STATUS, read-only)
> 
> The dynamic discovery approach allows firmware to control which
> registers are exposed without requiring kernel changes, improving
> maintainability and security.
> 
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
>   MAINTAINERS                              |  10 +
>   drivers/firmware/xilinx/Makefile         |   2 +-
>   drivers/firmware/xilinx/zynqmp-csu-reg.c | 249 +++++++++++++++++++++++
>   drivers/firmware/xilinx/zynqmp-csu-reg.h |  18 ++
>   drivers/firmware/xilinx/zynqmp.c         |   6 +
>   include/linux/firmware/xlnx-zynqmp.h     |   4 +-
>   6 files changed, 287 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
>   create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10d12b51b1f6..37fe2b7e0ccf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29212,6 +29212,16 @@ F:	drivers/dma/xilinx/xdma.c
>   F:	include/linux/dma/amd_xdma.h
>   F:	include/linux/platform_data/amd_xdma.h
>   
> +XILINX ZYNQMP CSU REGISTER DRIVER
> +M:	Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
> +R:	Michal Simek <michal.simek@amd.com>
> +R:	Ronak Jain <ronak.jain@amd.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> +F:	drivers/firmware/xilinx/zynqmp-csu-reg.c
> +F:	drivers/firmware/xilinx/zynqmp-csu-reg.h
> +
>   XILINX ZYNQMP DPDMA DRIVER
>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   L:	dmaengine@vger.kernel.org
> diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
> index 8db0e66b6b7e..6203f41daaa6 100644
> --- a/drivers/firmware/xilinx/Makefile
> +++ b/drivers/firmware/xilinx/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for Xilinx firmwares
>   
> -obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
> +obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o zynqmp-csu-reg.o
>   obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
> diff --git a/drivers/firmware/xilinx/zynqmp-csu-reg.c b/drivers/firmware/xilinx/zynqmp-csu-reg.c
> new file mode 100644
> index 000000000000..1f304ce858b1
> --- /dev/null
> +++ b/drivers/firmware/xilinx/zynqmp-csu-reg.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx Zynq MPSoC CSU Register Access
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + *  Michal Simek <michal.simek@amd.com>
> + *  Ronak Jain <ronak.jain@amd.com>
> + */
> +
> +#include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include "zynqmp-csu-reg.h"
> +
> +/* Node ID for CSU module in firmware */
> +#define CSU_NODE_ID 0
> +
> +/* Maximum number of CSU registers supported */
> +#define MAX_CSU_REGS 50
> +
> +/* Size of register name returned by firmware (3 u32 words = 12 bytes) */
> +#define CSU_REG_NAME_LEN 12
> +
> +/**
> + * struct zynqmp_csu_reg - CSU register information
> + * @id: Register index from firmware
> + * @name: Register name
> + * @attr: Device attribute for sysfs
> + */
> +struct zynqmp_csu_reg {
> +	u32 id;
> +	char name[CSU_REG_NAME_LEN];
> +	struct device_attribute attr;
> +};
> +
> +/**
> + * struct zynqmp_csu_data - Per-device CSU data
> + * @csu_regs: Array of CSU registers
> + * @csu_reg_count: Number of CSU registers
> + * @csu_attr_group: Attribute group for sysfs
> + */
> +struct zynqmp_csu_data {
> +	struct zynqmp_csu_reg *csu_regs;
> +	int csu_reg_count;
> +	struct attribute_group csu_attr_group;
> +};
> +
> +/**
> + * zynqmp_pm_get_node_count() - Get number of supported nodes via QUERY_DATA
> + *
> + * Return: Number of nodes on success, or negative error code
> + */
> +static int zynqmp_pm_get_node_count(void)
> +{
> +	struct zynqmp_pm_query_data qdata = {0};
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	qdata.qid = PM_QID_GET_NODE_COUNT;
> +
> +	ret = zynqmp_pm_query_data(qdata, ret_payload);
> +	if (ret)
> +		return ret;
> +
> +	return ret_payload[1];
> +}
> +
> +/**
> + * zynqmp_pm_get_node_name() - Get node name via QUERY_DATA
> + * @index: Register index
> + * @name: Buffer to store register name
> + *
> + * Return: 0 on success, error code otherwise
> + */
> +static int zynqmp_pm_get_node_name(u32 index, char *name)
> +{
> +	struct zynqmp_pm_query_data qdata = {0};
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	qdata.qid = PM_QID_GET_NODE_NAME;
> +	qdata.arg1 = index;
> +
> +	ret = zynqmp_pm_query_data(qdata, ret_payload);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(name, &ret_payload[1], CSU_REG_NAME_LEN);
> +	name[CSU_REG_NAME_LEN - 1] = '\0';
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_csu_reg_show() - Generic show function for all registers
> + * @dev: Device pointer
> + * @attr: Device attribute
> + * @buf: Output buffer
> + *
> + * Return: Number of bytes written to buffer, or error code
> + */
> +static ssize_t zynqmp_csu_reg_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct zynqmp_csu_reg *reg;
> +	u32 value;
> +	int ret;
> +
> +	/* Use container_of to get register directly */
> +	reg = container_of(attr, struct zynqmp_csu_reg, attr);
> +
> +	ret = zynqmp_pm_sec_read_reg(CSU_NODE_ID, reg->id, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "0x%08x\n", value);
> +}
> +
> +/**
> + * zynqmp_csu_reg_store() - Generic store function for writable registers
> + * @dev: Device pointer
> + * @attr: Device attribute
> + * @buf: Input buffer
> + * @count: Buffer size
> + *
> + * Format: "mask value" - both mask and value required
> + * Example: echo "0xFFFFFFFF 0x12345678" > register
> + *
> + * Return: count on success, error code otherwise
> + */
> +static ssize_t zynqmp_csu_reg_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct zynqmp_csu_reg *reg;
> +	u32 mask, value;
> +	int ret;
> +
> +	reg = container_of(attr, struct zynqmp_csu_reg, attr);
> +
> +	if (sscanf(buf, "%x %x", &mask, &value) != 2)
> +		return -EINVAL;
> +
> +	ret = zynqmp_pm_sec_mask_write_reg(CSU_NODE_ID, reg->id, mask, value);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/**
> + * zynqmp_csu_discover_registers() - Discover CSU registers from firmware
> + * @pdev: Platform device pointer
> + *
> + * This function uses PM_QUERY_DATA to discover all available CSU registers
> + * and creates sysfs group under /sys/devices/platform/firmware:zynqmp-firmware/
> + *
> + * Return: 0 on success, error code otherwise
> + */
> +int zynqmp_csu_discover_registers(struct platform_device *pdev)
> +{
> +	struct zynqmp_csu_data *csu_data;
> +	struct attribute **attrs;
> +	int count, ret, i;
> +
> +	ret = zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_GET_NODE_COUNT);
> +	if (ret) {
> +		dev_dbg(&pdev->dev, "CSU register discovery not supported by current firmware\n");
> +		return 0;
> +	}
> +
> +	count = zynqmp_pm_get_node_count();
> +	if (count < 0)
> +		return count;
> +	if (count == 0) {
> +		dev_dbg(&pdev->dev, "No nodes available from firmware\n");
> +		return 0;
> +	}
> +
> +	/* Validate count to prevent excessive memory allocation */
> +	if (count > MAX_CSU_REGS) {
> +		dev_err(&pdev->dev, "Register count %d exceeds maximum %d\n",
> +			count, MAX_CSU_REGS);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(&pdev->dev, "Discovered %d nodes from firmware\n", count);
> +
> +	csu_data = devm_kzalloc(&pdev->dev, sizeof(*csu_data), GFP_KERNEL);
> +	if (!csu_data)
> +		return -ENOMEM;
> +
> +	csu_data->csu_reg_count = count;

Where is this used?

> +
> +	csu_data->csu_regs = devm_kcalloc(&pdev->dev, count, sizeof(*csu_data->csu_regs),
> +					  GFP_KERNEL);
> +	if (!csu_data->csu_regs) {
> +		devm_kfree(&pdev->dev, csu_data);

My bet is that you are freeing this memory because csu is optional and you don't 
want to waste memory. Is this correct assumption?
If yes, I think it will be good if you can express this intention in commit 
message.


> +		return -ENOMEM;
> +	}
> +
> +	attrs = devm_kcalloc(&pdev->dev, count + 1, sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs) {
> +		devm_kfree(&pdev->dev, csu_data->csu_regs);
> +		devm_kfree(&pdev->dev, csu_data);
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		struct zynqmp_csu_reg *reg = &csu_data->csu_regs[i];
> +		struct device_attribute *dev_attr = &reg->attr;
> +
> +		reg->id = i;
> +
> +		ret = zynqmp_pm_get_node_name(i, reg->name);
> +		if (ret) {
> +			dev_warn(&pdev->dev, "Failed to get name for register %d\n", i);
> +			snprintf(reg->name, sizeof(reg->name), "csu_reg_%d", i);
> +		}
> +
> +		/* Create sysfs attribute - firmware enforces actual access control */
> +		sysfs_attr_init(&dev_attr->attr);
> +		dev_attr->attr.name = reg->name;
> +		dev_attr->attr.mode = 0644;

You should comment this a little bit. In commit message you are saying that some 
of that registers are read only but here you are exposing all of them as rw.

Do you have any interface/attribute/flag where you can find out if this is read 
only?

I expect if you try to write to read only firmware driver will just reject it 
anyway. If you don't have any flag for it, it would be good to describe this 
limiation in commit message.


> +		dev_attr->show = zynqmp_csu_reg_show;
> +		dev_attr->store = zynqmp_csu_reg_store;
> +
> +		attrs[i] = &dev_attr->attr;
> +
> +		dev_dbg(&pdev->dev, "Register %d: id=%d name=%s\n", i, reg->id, reg->name);
> +	}
> +
> +	csu_data->csu_attr_group.name = "csu_registers";
> +	csu_data->csu_attr_group.attrs = attrs;
> +
> +	ret = devm_device_add_group(&pdev->dev, &csu_data->csu_attr_group);
> +	if (ret) {
> +		devm_kfree(&pdev->dev, attrs);
> +		devm_kfree(&pdev->dev, csu_data->csu_regs);
> +		devm_kfree(&pdev->dev, csu_data);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_csu_discover_registers);
> diff --git a/drivers/firmware/xilinx/zynqmp-csu-reg.h b/drivers/firmware/xilinx/zynqmp-csu-reg.h
> new file mode 100644
> index 000000000000..b12415db3496
> --- /dev/null
> +++ b/drivers/firmware/xilinx/zynqmp-csu-reg.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Xilinx Zynq MPSoC CSU Register Access
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + *  Michal Simek <michal.simek@amd.com>
> + *  Ronak Jain <ronak.jain@amd.com>
> + */
> +
> +#ifndef __ZYNQMP_CSU_REG_H__
> +#define __ZYNQMP_CSU_REG_H__
> +
> +#include <linux/platform_device.h>
> +
> +int zynqmp_csu_discover_registers(struct platform_device *pdev);
> +
> +#endif /* __ZYNQMP_CSU_REG_H__ */
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..b549d07f7497 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -27,6 +27,7 @@
>   
>   #include <linux/firmware/xlnx-zynqmp.h>
>   #include <linux/firmware/xlnx-event-manager.h>
> +#include "zynqmp-csu-reg.h"
>   #include "zynqmp-debug.h"
>   
>   /* Max HashMap Order for PM API feature check (1<<7 = 128) */
> @@ -2120,6 +2121,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
>   			dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM register fail with error\n");
>   	}
>   
> +	/* Discover CSU registers dynamically */
> +	ret = zynqmp_csu_discover_registers(pdev);
> +	if (ret)
> +		dev_warn(&pdev->dev, "CSU register discovery failed: %d\n", ret);
> +
>   	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>   }
>   
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..a4b293eb96ce 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2021 Xilinx
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -262,6 +262,8 @@ enum pm_query_id {
>   	PM_QID_CLOCK_GET_NUM_CLOCKS = 12,
>   	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
>   	PM_QID_PINCTRL_GET_ATTRIBUTES = 15,
> +	PM_QID_GET_NODE_NAME = 16,
> +	PM_QID_GET_NODE_COUNT = 17,
>   };
>   
>   enum rpu_oper_mode {

Thanks,
Michal

